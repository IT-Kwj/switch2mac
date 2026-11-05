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
    device _21* cp_s13 [[id(13)]];
    texture2d<float> cp_t_tcb_2C [[id(14)]];
    sampler cp_t_tcb_2CSmplr [[id(15)]];
    texture2d<float> cp_t_tcb_1A [[id(16)]];
    sampler cp_t_tcb_1ASmplr [[id(17)]];
    texture2d<float> cp_t_tcb_2A [[id(18)]];
    sampler cp_t_tcb_2ASmplr [[id(19)]];
    sampler cp_t_tcb_2CSmplr_w [[id(20)]];
    sampler cp_t_tcb_1ASmplr_w [[id(21)]];
    sampler cp_t_tcb_2ASmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3878 = false;
    bool _3656 = false;
    bool _3554 = false;
    bool _2596 = false;
    bool _1806 = false;
    bool _886 = false;
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _74 = as_type<float>(gl_LocalInvocationID.x);
    float _76 = as_type<float>(gl_WorkGroupID.x);
    int _79 = as_type<int>(_76) << 5;
    int _81 = _79 + as_type<int>(_74);
    float _83 = trunc(_72);
    int _85 = int(_83);
    bool _89 = _81 >= _85;
    int _91 = 0;
    if (_89)
    {
        _91 = 0;
    }
    int _93 = _91;
    int _95 = _93;
    int _97 = _93;
    if (!_89)
    {
        int _99 = _81 << 4;
        int _101 = _99 + 12;
        uint _104 = uint(int(uint(_101) >> uint(2)));
        float _106 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_104)]);
        float _108 = trunc(_106);
        int _110 = int(_108);
        bool _112 = _110 >= 1;
        int _114 = _112 ? (-1) : 0;
        if (!_112)
        {
            _95 = 0;
        }
        int _116 = _95;
        bool _118 = !_112;
        _97 = _116;
        if (!_118)
        {
            float _120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _122 = uint(int(uint(_101) >> uint(2)));
            float _124 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_122)]);
            float _126 = float(_110);
            float _128 = -_124;
            float _130 = _120 + _128;
            bool _132 = _130 > _126;
            int _134 = as_type<int>(_120);
            if (!_132)
            {
                bool _136 = _120 >= _124;
                bool _138 = isnan(_120);
                bool _140 = _136 || _138;
                bool _142 = isnan(_124);
                bool _144 = _140 || _142;
                _114 = _144 ? (-1) : 0;
            }
            int _146 = _114;
            if (_132)
            {
                _134 = 0;
            }
            int _148 = _134;
            _97 = _148;
            if (!_132)
            {
                int _150 = ~_146;
                int _152 = (_150 != 0) ? 0 : 1;
                _97 = _152;
            }
        }
    }
    int _154 = _97;
    int _156 = _154 & 1;
    bool _158 = _156 != 0;
    if (!_158)
    {
        return;
    }
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[15]);
    int _166 = _81 << 4;
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    int _170 = _166 + 12;
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[12]);
    uint _174 = uint(int(uint(_170) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_174)]);
    uint _178 = uint(int(uint(_166) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    int _182 = _166 + 4;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_184)]);
    int _188 = _166 + 8;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    uint _194 = uint(int(uint(_166) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_194)]);
    int _198 = _166 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_200)]);
    int _204 = _166 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_206)]);
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[16]);
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[17]);
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[3]);
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[13]);
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _224 = uint(int(uint(_170) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_224)]);
    uint _228 = uint(int(uint(_166) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_228)]);
    int _232 = _166 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_234)]);
    int _238 = _166 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_240)]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[0]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[1]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[2]);
    uint _250 = uint(int(uint(_166) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_250)]);
    int _254 = _166 + 4;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_256)]);
    int _260 = _166 + 8;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_262)]);
    int _266 = _166 + 12;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_268)]);
    float _272 = -_160;
    float _274 = _272 + 1.0;
    float _276 = -_162;
    float _278 = _276 + 1.0;
    float _280 = fma(_274, _278, _162);
    bool _282 = _280 != 1.0;
    bool _284 = isnan(_280);
    bool _286 = _282 || _284;
    bool _288 = isnan(1.0);
    bool _290 = _286 || _288;
    bool _292 = _164 != 1.0;
    bool _294 = isnan(_164);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    bool _302 = !_290;
    bool _304 = _300 || _302;
    float _306 = abs(_162);
    float _308 = log2(_306);
    float _310 = 0.0;
    float _312 = _164;
    float _314 = _210;
    float _316 = _216;
    float _318 = _202;
    float _320 = _186;
    float _322 = _186;
    float _324 = _160;
    float _326 = _160;
    if (!_304)
    {
        float _328 = abs(_280);
        float _330 = log2(_328);
        _310 = _330;
    }
    float _332 = _310;
    float _334 = -_176;
    float _336 = _168 + _334;
    float _338 = _336;
    if (!_304)
    {
        float _340 = -_280;
        float _342 = _340 + 1.0;
        _312 = _342;
    }
    float _344 = _312;
    float _346 = _160 * _308;
    float _348 = _332;
    if (!_304)
    {
        float _350 = _336 * _332;
        _348 = _350;
    }
    float _352 = _348;
    float _354 = 0.0;
    if (!_304)
    {
        float _356 = 1.0 / _344;
        _354 = _356;
    }
    float _358 = _354;
    bool _360 = _172 != 1.0;
    bool _362 = isnan(_172);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.0);
    bool _368 = _364 || _366;
    float _370 = _352;
    if (!_304)
    {
        float _372 = exp2(_352);
        _370 = _372;
    }
    float _374 = _370;
    float _376 = exp2(_346);
    float _378 = _210 * _212;
    float _380 = _214 * 0.00999999977648258209228515625;
    float _382 = _368 ? _196 : 0.0;
    float _384 = _368 ? _202 : 0.3141500055789947509765625;
    float _386 = _160 * _378;
    float _388 = _368 ? _208 : 0.92653000354766845703125;
    float _390 = _382;
    float _392 = _382;
    if (!_304)
    {
        float _394 = -_374;
        float _396 = _394 + 1.0;
        _314 = _396;
    }
    float _398 = _314;
    float _400 = _218 * _380;
    float _402 = _218 * _382;
    float _404 = _398;
    float _406 = _402;
    float _408 = _400;
    if (!_304)
    {
        float _410 = _398 * _358;
        _338 = _410;
    }
    float _412 = _338;
    float _414 = _412;
    float _416 = _412;
    if (_368)
    {
        _404 = 0.0;
    }
    float _418 = _404;
    float _420 = _218 * _384;
    float _422 = _218 * _388;
    float _424 = fma(_186, _376, _386);
    float _426 = _418;
    float _428 = _420;
    float _430 = _422;
    if (!_368)
    {
        float _432 = _160 * _400;
        _426 = _432;
    }
    float _434 = _426;
    float _436 = _226;
    float _438 = _270;
    float _440 = _270;
    float _442 = _226;
    float _444 = _434;
    float _446 = _248;
    float _448 = _244;
    float _450 = _246;
    int _452 = as_type<int>(_236);
    int _454 = as_type<int>(_236);
    int _456 = as_type<int>(_242);
    int _458 = as_type<int>(_230);
    int _460 = as_type<int>(_236);
    int _462 = as_type<int>(_242);
    if (!_368)
    {
        float _464 = _216 * 0.00999999977648258209228515625;
        float _466 = _168 * _400;
        float _468 = fma(_196, 2.0, -1.0);
        float _470 = fma(_202, 2.0, -1.0);
        float _472 = _218 * _464;
        float _474 = fma(_208, 2.0, -1.0);
        float _476 = fma(_472, _468, _466);
        float _478 = fma(_472, _470, _466);
        float _480 = fma(_472, _474, _466);
        float _482 = _402 + _476;
        float _484 = _420 + _478;
        float _486 = _422 + _480;
        _406 = _482;
        _316 = _472;
        _318 = _478;
        _428 = _484;
        _430 = _486;
    }
    float _488 = _406;
    float _490 = _316;
    float _492 = _318;
    float _494 = _428;
    float _496 = _430;
    bool _498 = _434 != 0.0;
    bool _500 = isnan(_434);
    bool _502 = _498 || _500;
    bool _504 = isnan(0.0);
    bool _506 = _502 || _504;
    float _508 = _412 + _488;
    float _510 = _180 * _160;
    float _512 = _192 * _160;
    float _514 = _186 * _160;
    float _516 = _160 + _508;
    bool _518 = _220 != 1.0;
    bool _520 = isnan(_220);
    bool _522 = _518 || _520;
    bool _524 = isnan(1.0);
    bool _526 = _522 || _524;
    float _528 = fma(_226, _510, _252);
    int _530 = as_type<int>(_222) & 512;
    bool _532 = _530 != 0;
    float _534 = fma(_226, _512, _264);
    float _536 = fma(_226, _514, _258);
    float _538 = _516 + _434;
    float _540 = _490;
    float _542 = _490;
    float _544 = _492;
    float _546 = _508;
    float _620;
    float _628;
    float _630;
    float _632;
    float _736;
    float _780;
    float _846;
    float _850;
    float _858;
    float _860;
    float _864;
    float _868;
    float _872;
    float _876;
    float _880;
    float _882;
    float _884;
    if (!_506)
    {
        if (_526)
        {
            _436 = 0.60000002384185791015625;
        }
        float _548 = _436;
        float _550 = _374;
        if (!_526)
        {
            float _552 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[9]);
            _550 = _552;
        }
        float _554 = _550;
        if (_526)
        {
            _540 = 0.4199999868869781494140625;
        }
        float _556 = _540;
        if (_526)
        {
            _320 = 0.23000000417232513427734375;
        }
        float _558 = _320;
        float _560 = _280;
        if (!_526)
        {
            float _562 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[8]);
            _560 = _562;
        }
        float _564 = _560;
        float _566 = _548;
        if (!_526)
        {
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _566 = _568;
        }
        float _570 = _566;
        float _572 = _556;
        if (!_526)
        {
            float _574 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _572 = _574;
        }
        float _576 = _572;
        if (_526)
        {
            _390 = 0.1500000059604644775390625;
        }
        float _578 = _390;
        float _580 = _558;
        if (!_526)
        {
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _580 = _582;
        }
        float _584 = _580;
        float _586 = _578;
        if (!_526)
        {
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _586 = _588;
        }
        float _590 = _586;
        float _592 = _358;
        if (!_526)
        {
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[10]);
            _592 = _594;
        }
        float _596 = _592;
        float _598 = _220;
        if (!_526)
        {
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[11]);
            _598 = _600;
        }
        float _602 = _598;
        if (_526)
        {
            _438 = 0.60000002384185791015625;
        }
        float _604 = _438;
        float _606 = _218 * _570;
        float _608 = _604;
        float _610 = _570;
        if (!_526)
        {
            _608 = _570;
        }
        float _612 = _608;
        float _614 = _218 * _576;
        float _616 = 1.0 / _606;
        float _618 = _612;
        _620 = _554;
        if (_526)
        {
            _610 = 0.4199999868869781494140625;
        }
        float _622 = _610;
        float _624 = _218 * _584;
        float _626 = _622;
        _628 = _564;
        _630 = _596;
        _632 = _602;
        if (!_526)
        {
            _626 = _576;
        }
        float _634 = _626;
        float _636 = _218 * _612;
        float _638 = 1.0 / _614;
        float _640 = _218 * _634;
        float _642 = _218 * _590;
        float _644 = _634;
        if (_526)
        {
            _618 = 0.23000000417232513427734375;
        }
        float _646 = _618;
        float _648 = _646;
        if (!_526)
        {
            _648 = _584;
        }
        float _650 = _648;
        if (_526)
        {
            _644 = 0.1500000059604644775390625;
        }
        float _652 = _644;
        float _654 = 1.0 / _624;
        float _656 = _652;
        if (!_526)
        {
            _656 = _590;
        }
        float _658 = _656;
        float _660 = _538 * 6.283184051513671875;
        float _662 = _218 * _650;
        float _664 = _616 * _660;
        float _666 = 1.0 / _640;
        float _668 = _664 * 0.15915493667125701904296875;
        float _670 = 1.0 / _642;
        float _672 = _638 * _660;
        float _674 = _218 * _658;
        float _676 = 1.0 / _636;
        float _678 = _672 * 0.15915493667125701904296875;
        float _680 = _654 * _660;
        float _682 = _508 * _666;
        float _684 = 1.0 / _662;
        float _686 = _680 * 0.15915493667125701904296875;
        float _688 = _670 * _660;
        float _690 = _682 * 6.283184051513671875;
        float _692 = 1.0 / _674;
        float _694 = _688 * 0.15915493667125701904296875;
        float _696 = _508 * _676;
        float _698 = _690 * 0.15915493667125701904296875;
        float _700 = _696 * 6.283184051513671875;
        float _702 = _508 * _684;
        float _704 = _678 * 6.283185482025146484375;
        float _706 = sin(_704);
        float _708 = _700 * 0.15915493667125701904296875;
        float _710 = _702 * 6.283184051513671875;
        float _712 = _508 * _692;
        float _714 = _698 * 6.283185482025146484375;
        float _716 = sin(_714);
        float _718 = _710 * 0.15915493667125701904296875;
        float _720 = _712 * 6.283184051513671875;
        float _722 = _668 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 * 0.15915493667125701904296875;
        float _728 = _690;
        float _730 = _702;
        float _732 = _710;
        float _734 = _720;
        _736 = _692;
        if (_526)
        {
            _728 = 3.0;
        }
        float _738 = _728;
        float _740 = _738;
        if (_526)
        {
            _730 = 3.0;
        }
        float _742 = _730;
        float _744 = _708 * 6.283185482025146484375;
        float _746 = sin(_744);
        float _748 = _742;
        if (!_526)
        {
            _740 = _554;
        }
        float _750 = _740;
        float _752 = _750;
        if (!_526)
        {
            _748 = _554;
        }
        float _754 = _748;
        float _756 = _754;
        if (_526)
        {
            _732 = 4.0;
        }
        float _758 = _732;
        float _760 = _686 * 6.283185482025146484375;
        float _762 = sin(_760);
        float _764 = _758;
        if (!_526)
        {
            _764 = _564;
        }
        float _766 = _764;
        float _768 = _706 * _750;
        float _770 = _716 * _754;
        float _772 = _718 * 6.283185482025146484375;
        float _774 = sin(_772);
        float _776 = _766;
        float _778 = _706;
        _780 = _770;
        if (_526)
        {
            _756 = 4.0;
        }
        float _782 = _756;
        float _784 = _782;
        if (!_526)
        {
            _784 = _564;
        }
        float _786 = _784;
        float _788 = _694 * 6.283185482025146484375;
        float _790 = sin(_788);
        float _792 = fma(_724, _766, _768);
        float _794 = _724;
        float _796 = _792;
        if (_526)
        {
            _752 = 2.0;
        }
        float _798 = _752;
        float _800 = _726 * 6.283185482025146484375;
        float _802 = sin(_800);
        float _804 = _798;
        if (_526)
        {
            _776 = 2.0;
        }
        float _806 = _776;
        float _808 = fma(_746, _786, _770);
        float _810 = _806;
        if (!_526)
        {
            _804 = _596;
        }
        float _812 = _804;
        float _814 = _812;
        if (!_526)
        {
            _810 = _596;
        }
        float _816 = _810;
        float _818 = _816;
        if (_526)
        {
            _794 = 1.5;
        }
        float _820 = _794;
        float _822 = _820;
        if (_526)
        {
            _734 = 1.5;
        }
        float _824 = _734;
        float _826 = fma(_762, _812, _792);
        float _828 = _824;
        if (!_526)
        {
            _822 = _602;
        }
        float _830 = _822;
        float _832 = fma(_774, _816, _808);
        float _834 = _830;
        if (!_526)
        {
            _828 = _602;
        }
        float _836 = _828;
        float _838 = fma(_790, _830, _826);
        float _840 = fma(_802, _836, _832);
        float _842 = _840;
        float _844 = _838;
        _846 = _802;
        if (_526)
        {
            _814 = 1.5;
        }
        float _848 = _814;
        _850 = _848;
        if (_526)
        {
            _834 = 2.0;
        }
        float _852 = _834;
        float _854 = -_840;
        float _856 = _838 + _854;
        _858 = _852;
        _860 = _856;
        if (_526)
        {
            _842 = 3.0;
        }
        float _862 = _842;
        _864 = _862;
        if (_526)
        {
            _818 = 4.0;
        }
        float _866 = _818;
        _868 = _866;
        if (_526)
        {
            _796 = 0.1500000059604644775390625;
        }
        float _870 = _796;
        _872 = _870;
        if (_526)
        {
            _778 = 0.23000000417232513427734375;
        }
        float _874 = _778;
        _876 = _874;
        if (_526)
        {
            _844 = 0.4199999868869781494140625;
        }
        float _878 = _844;
        _880 = _878;
        _882 = 0.0;
        _884 = 0.0;
        _886 = true;
    }
    else
    {
        if (_526)
        {
            _542 = 0.4199999868869781494140625;
        }
        float _888 = _542;
        float _890 = _374;
        if (!_526)
        {
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[9]);
            _890 = _892;
        }
        float _894 = _890;
        if (_526)
        {
            _322 = 0.60000002384185791015625;
        }
        float _896 = _322;
        if (_526)
        {
            _392 = 0.23000000417232513427734375;
        }
        float _898 = _392;
        float _900 = _280;
        if (!_526)
        {
            float _902 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[8]);
            _900 = _902;
        }
        float _904 = _900;
        float _906 = _888;
        if (!_526)
        {
            float _908 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _906 = _908;
        }
        float _910 = _906;
        float _912 = _896;
        if (!_526)
        {
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _912 = _914;
        }
        float _916 = _912;
        float _918 = _898;
        if (!_526)
        {
            float _920 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _918 = _920;
        }
        float _922 = _918;
        if (_526)
        {
            _544 = 0.1500000059604644775390625;
        }
        float _924 = _544;
        float _926 = _358;
        if (!_526)
        {
            float _928 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[10]);
            _926 = _928;
        }
        float _930 = _926;
        float _932 = _924;
        if (!_526)
        {
            float _934 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _932 = _934;
        }
        float _936 = _932;
        float _938 = _220;
        if (!_526)
        {
            float _940 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[11]);
            _938 = _940;
        }
        float _942 = _938;
        if (_526)
        {
            _440 = 0.4199999868869781494140625;
        }
        float _944 = _440;
        float _946 = _944;
        if (_526)
        {
            _442 = 0.4199999868869781494140625;
        }
        float _948 = _442;
        float _950 = _538 * 6.283184051513671875;
        float _952 = _948;
        float _954 = _910;
        if (!_526)
        {
            _946 = _910;
        }
        float _956 = _946;
        float _958 = _218 * _956;
        float _960 = _956;
        if (_526)
        {
            _960 = 0.4199999868869781494140625;
        }
        float _962 = _960;
        float _964 = _962;
        if (!_526)
        {
            _964 = _910;
        }
        float _966 = _964;
        float _968 = _966;
        if (!_526)
        {
            _952 = _910;
        }
        float _970 = _952;
        float _972 = _218 * _910;
        float _974 = _218 * _966;
        float _976 = _970;
        if (_526)
        {
            _968 = 0.60000002384185791015625;
        }
        float _978 = _968;
        float _980 = _218 * _922;
        float _982 = _218 * _970;
        float _984 = _978;
        _620 = _894;
        _630 = _930;
        if (!_526)
        {
            _984 = _916;
        }
        float _986 = _984;
        float _988 = _218 * _916;
        float _990 = _986;
        if (_526)
        {
            _954 = 0.60000002384185791015625;
        }
        float _992 = _954;
        float _994 = _992;
        if (_526)
        {
            _976 = 0.60000002384185791015625;
        }
        float _996 = _976;
        float _998 = _996;
        if (!_526)
        {
            _994 = _916;
        }
        float _1000 = _994;
        float _1002 = _1000;
        if (!_526)
        {
            _998 = _916;
        }
        float _1004 = _998;
        float _1006 = 1.0 / _972;
        float _1008 = 1.0 / _980;
        float _1010 = _218 * _1004;
        float _1012 = 1.0 / _988;
        float _1014 = _218 * _986;
        float _1016 = _1004;
        if (_526)
        {
            _990 = 0.23000000417232513427734375;
        }
        float _1018 = _990;
        float _1020 = _1018;
        if (!_526)
        {
            _1020 = _922;
        }
        float _1022 = _1020;
        float _1024 = _218 * _1000;
        float _1026 = _1022;
        if (_526)
        {
            _1002 = 0.23000000417232513427734375;
        }
        float _1028 = _1002;
        float _1030 = 1.0 / _982;
        float _1032 = _1028;
        if (!_526)
        {
            _1032 = _922;
        }
        float _1034 = _1032;
        float _1036 = _218 * _936;
        float _1038 = _1034;
        _628 = _904;
        _632 = _942;
        if (_526)
        {
            _1016 = 0.23000000417232513427734375;
        }
        float _1040 = _1016;
        float _1042 = 1.0 / _1010;
        float _1044 = _218 * _1034;
        float _1046 = _1040;
        if (!_526)
        {
            _1046 = _922;
        }
        float _1048 = _1046;
        float _1050 = _218 * _1022;
        float _1052 = _1048;
        if (_526)
        {
            _1026 = 0.1500000059604644775390625;
        }
        float _1054 = _1026;
        float _1056 = _1054;
        if (!_526)
        {
            _1056 = _936;
        }
        float _1058 = _1056;
        float _1060 = 1.0 / _1044;
        float _1062 = 1.0 / _1036;
        float _1064 = _218 * _1058;
        float _1066 = _1006 * _950;
        float _1068 = 1.0 / _1024;
        float _1070 = _218 * _1048;
        if (_526)
        {
            _1052 = 0.1500000059604644775390625;
        }
        float _1072 = _1052;
        float _1074 = 1.0 / _1050;
        float _1076 = _1072;
        if (!_526)
        {
            _1076 = _936;
        }
        float _1078 = _1076;
        if (_526)
        {
            _1038 = 0.1500000059604644775390625;
        }
        float _1080 = _1038;
        float _1082 = _218 * _1078;
        float _1084 = _1066 * 0.15915493667125701904296875;
        float _1086 = _1012 * _950;
        float _1088 = 1.0 / _974;
        float _1090 = _1080;
        if (!_526)
        {
            _1090 = _936;
        }
        float _1092 = _1090;
        float _1094 = 1.0 / _1070;
        float _1096 = _1086 * 0.15915493667125701904296875;
        float _1098 = _1008 * _950;
        float _1100 = 1.0 / _1082;
        float _1102 = 1.0 / _958;
        float _1104 = _488 + _434;
        float _1106 = _1104 * 6.283184051513671875;
        float _1108 = 1.0 / _1014;
        float _1110 = _488 * 6.283184051513671875;
        float _1112 = _1098 * 0.15915493667125701904296875;
        float _1114 = _1062 * _950;
        float _1116 = _1114 * 0.15915493667125701904296875;
        float _1118 = _1030 * _1106;
        float _1120 = _1118 * 0.15915493667125701904296875;
        float _1122 = _1088 * _1110;
        float _1124 = _508 * _1102;
        float _1126 = _1084 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        float _1130 = _1122 * 0.15915493667125701904296875;
        float _1132 = _1042 * _1106;
        float _1134 = _1124 * 6.283184051513671875;
        float _1136 = _1132 * 0.15915493667125701904296875;
        float _1138 = _1108 * _1110;
        float _1140 = _1134 * 0.15915493667125701904296875;
        float _1142 = _1130 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1138 * 0.15915493667125701904296875;
        float _1148 = _1138;
        _882 = _1110;
        if (_526)
        {
            _1148 = 3.0;
        }
        float _1150 = _1148;
        float _1152 = _1150;
        if (!_526)
        {
            _1152 = _894;
        }
        float _1154 = _1152;
        float _1156 = _1120 * 6.283185482025146484375;
        float _1158 = sin(_1156);
        float _1160 = _1094 * _1106;
        float _1162 = _218 * _1092;
        float _1164 = _1140 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1160 * 0.15915493667125701904296875;
        float _1170 = _1160;
        float _1172 = _1154;
        float _1174 = _1162;
        if (_526)
        {
            _1170 = 3.0;
        }
        float _1176 = _1170;
        float _1178 = _1176;
        if (!_526)
        {
            _1178 = _894;
        }
        float _1180 = _1178;
        float _1182 = 1.0 / _1064;
        float _1184 = _1136 * 6.283185482025146484375;
        float _1186 = sin(_1184);
        float _1188 = _1128 * _1154;
        float _1190 = _1180;
        _884 = _1182;
        if (_526)
        {
            _1172 = 3.0;
        }
        float _1192 = _1172;
        float _1194 = _1074 * _1110;
        float _1196 = _1192;
        if (!_526)
        {
            _1196 = _894;
        }
        float _1198 = _1196;
        float _1200 = _1096 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1194 * 0.15915493667125701904296875;
        float _1206 = _1100 * _1106;
        float _1208 = _1144 * _1198;
        float _1210 = _1146 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1158 * _1180;
        float _1216 = _508 * _1068;
        float _1218 = _1216;
        if (_526)
        {
            _1190 = 4.0;
        }
        float _1220 = _1190;
        float _1222 = 1.0 / _1162;
        float _1224 = _1220;
        if (!_526)
        {
            _1224 = _904;
        }
        float _1226 = _1224;
        float _1228 = _1206 * 0.15915493667125701904296875;
        float _1230 = _1216 * 6.283184051513671875;
        if (_526)
        {
            _1174 = 3.0;
        }
        float _1232 = _1174;
        float _1234 = _1232;
        if (!_526)
        {
            _1234 = _894;
        }
        float _1236 = _1234;
        float _1238 = _1236;
        if (_526)
        {
            _1218 = 4.0;
        }
        float _1240 = _1218;
        float _1242 = _1166 * _1236;
        float _1244 = _1240;
        if (_526)
        {
            _1238 = 4.0;
        }
        float _1246 = _1238;
        float _1248 = fma(_1186, _1226, _1214);
        float _1250 = _1246;
        if (!_526)
        {
            _1250 = _904;
        }
        float _1252 = _1250;
        float _1254 = _1252;
        if (!_526)
        {
            _1244 = _904;
        }
        float _1256 = _1244;
        float _1258 = _508 * _1060;
        float _1260 = _1230 * 0.15915493667125701904296875;
        float _1262 = _1182 * _1110;
        float _1264 = fma(_1202, _1252, _1188);
        float _1266 = fma(_1212, _1256, _1208);
        float _1268 = _508 * _1222;
        float _1270 = _1258 * 6.283184051513671875;
        float _1272 = _1260 * 6.283185482025146484375;
        float _1274 = sin(_1272);
        float _1276 = _1262 * 0.15915493667125701904296875;
        float _1278 = _1268 * 6.283184051513671875;
        float _1280 = _1270 * 0.15915493667125701904296875;
        float _1282 = _1112 * 6.283185482025146484375;
        float _1284 = sin(_1282);
        float _1286 = _1258;
        float _1288 = _1270;
        float _1290 = _1278;
        float _1292 = _1264;
        if (_526)
        {
            _546 = 4.0;
        }
        float _1294 = _546;
        float _1296 = _1168 * 6.283185482025146484375;
        float _1298 = sin(_1296);
        float _1300 = _1294;
        if (!_526)
        {
            _1300 = _904;
        }
        float _1302 = _1300;
        float _1304 = _1204 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        float _1308 = _1276 * 6.283185482025146484375;
        float _1310 = sin(_1308);
        float _1312 = _1278 * 0.15915493667125701904296875;
        float _1314 = _1280 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = _1302;
        if (_526)
        {
            _1254 = 2.0;
        }
        float _1320 = _1254;
        float _1322 = _1320;
        if (_526)
        {
            _1286 = 2.0;
        }
        float _1324 = _1286;
        float _1326 = _1324;
        if (_526)
        {
            _1288 = 2.0;
        }
        float _1328 = _1288;
        float _1330 = _1116 * 6.283185482025146484375;
        float _1332 = sin(_1330);
        float _1334 = _1328;
        if (!_526)
        {
            _1322 = _930;
        }
        float _1336 = _1322;
        float _1338 = fma(_1274, _1302, _1242);
        float _1340 = _1336;
        _780 = _1274;
        if (!_526)
        {
            _1326 = _930;
        }
        float _1342 = _1326;
        float _1344 = _1228 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342;
        if (!_526)
        {
            _1334 = _930;
        }
        float _1350 = _1334;
        float _1352 = _1312 * 6.283185482025146484375;
        float _1354 = sin(_1352);
        float _1356 = _1350;
        if (_526)
        {
            _1318 = 2.0;
        }
        float _1358 = _1318;
        float _1360 = _1358;
        if (!_526)
        {
            _1360 = _930;
        }
        float _1362 = _1360;
        float _1364 = fma(_1284, _1336, _1264);
        float _1366 = fma(_1298, _1342, _1248);
        float _1368 = fma(_1306, _1350, _1266);
        _880 = _1332;
        _736 = _1366;
        _408 = _1368;
        if (_526)
        {
            _1290 = 1.5;
        }
        float _1370 = _1290;
        float _1372 = _1370;
        if (_526)
        {
            _1340 = 1.5;
        }
        float _1374 = _1340;
        float _1376 = _1374;
        if (_526)
        {
            _1348 = 1.5;
        }
        float _1378 = _1348;
        float _1380 = _1378;
        if (_526)
        {
            _1356 = 1.5;
        }
        float _1382 = _1356;
        float _1384 = fma(_1316, _1362, _1338);
        float _1386 = _1382;
        _846 = _1384;
        if (!_526)
        {
            _1372 = _942;
        }
        float _1388 = _1372;
        if (!_526)
        {
            _1380 = _942;
        }
        float _1390 = _1380;
        float _1392 = _1390;
        if (!_526)
        {
            _1386 = _942;
        }
        float _1394 = _1386;
        if (!_526)
        {
            _1376 = _942;
        }
        float _1396 = _1376;
        float _1398 = fma(_1332, _1388, _1364);
        float _1400 = fma(_1346, _1390, _1366);
        float _1402 = fma(_1310, _1394, _1368);
        float _1404 = fma(_1354, _1396, _1384);
        float _1406 = -_1400;
        float _1408 = _1406 + _1402;
        float _1410 = -_1404;
        float _1412 = _1398 + _1410;
        float _1414 = _1404;
        float _1416 = _1398;
        float _1418 = _1412;
        float _1420 = _1354;
        if (_526)
        {
            _1414 = 1.5;
        }
        float _1422 = _1414;
        _850 = _1422;
        if (_526)
        {
            _1416 = 2.0;
        }
        float _1424 = _1416;
        float _1426 = _1412 + _1408;
        _858 = _1424;
        _860 = _1426;
        if (_526)
        {
            _1418 = 3.0;
        }
        float _1428 = _1418;
        _864 = _1428;
        if (_526)
        {
            _1392 = 4.0;
        }
        float _1430 = _1392;
        _868 = _1430;
        if (_526)
        {
            _1292 = 0.1500000059604644775390625;
        }
        float _1432 = _1292;
        _872 = _1432;
        if (_526)
        {
            _1420 = 0.23000000417232513427734375;
        }
        float _1434 = _1420;
        _876 = _1434;
        if (_526)
        {
            _880 = 0.4199999868869781494140625;
        }
    }
    _886 = false;
    float _1436 = _880;
    float _1438 = _876;
    float _1440 = _780;
    float _1442 = _872;
    float _1444 = _736;
    float _1446 = _408;
    float _1448 = _882;
    float _1450 = _846;
    float _1452 = _864;
    float _1454 = _620;
    float _1456 = _868;
    float _1458 = _628;
    float _1460 = _858;
    float _1462 = _630;
    float _1464 = _850;
    float _1466 = _632;
    float _1468 = _884;
    float _1470 = _860;
    float _1472 = _412 + _494;
    float _1474 = _160 + _1472;
    float _1476 = _1474 + _434;
    float _1478 = _1440;
    float _1480 = _1444;
    float _1482 = _1446;
    float _1484 = _1448;
    float _1486 = _1450;
    float _1488 = _1472;
    float _1490 = _1444;
    float _1492 = _1448;
    float _1494 = _1446;
    float _1496 = _1468;
    float _1498 = _1440;
    float _1500 = _1450;
    float _1502 = _1472;
    float _1504 = _1436;
    float _1506 = _1438;
    float _1508 = _1442;
    float _1510 = _1460;
    float _1512 = _1452;
    float _1514 = _1456;
    float _1516 = _1464;
    float _1518 = _1436;
    float _1520 = _1438;
    float _1522 = _1442;
    float _1524 = _1460;
    float _1526 = _1464;
    float _1528 = _1452;
    float _1530 = _1456;
    float _1532 = _1458;
    float _1534 = _1454;
    float _1536 = _1466;
    float _1538 = _1462;
    float _1690;
    float _1706;
    float _1776;
    float _1796;
    float _1798;
    float _1800;
    float _1802;
    float _1804;
    if (!_506)
    {
        if (_526)
        {
            _1478 = _1436;
        }
        float _1540 = _1478;
        if (_526)
        {
            _1480 = 0.60000002384185791015625;
        }
        float _1542 = _1480;
        if (_526)
        {
            _1482 = _1438;
        }
        float _1544 = _1482;
        float _1546 = _1540;
        if (!_526)
        {
            float _1548 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _1546 = _1548;
        }
        float _1550 = _1546;
        if (_526)
        {
            _1484 = _1442;
        }
        float _1552 = _1484;
        float _1554 = _1542;
        if (!_526)
        {
            float _1556 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _1554 = _1556;
        }
        float _1558 = _1554;
        float _1560 = _1544;
        if (!_526)
        {
            float _1562 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _1560 = _1562;
        }
        float _1564 = _1560;
        float _1566 = _1552;
        if (!_526)
        {
            float _1568 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _1566 = _1568;
        }
        float _1570 = _1566;
        if (_526)
        {
            _1486 = _1436;
        }
        float _1572 = _1486;
        float _1574 = _1476 * 6.283184051513671875;
        float _1576 = _218 * _1550;
        float _1578 = _1572;
        float _1580 = _1550;
        if (!_526)
        {
            _1578 = _1550;
        }
        float _1582 = _1578;
        float _1584 = _1582;
        if (_526)
        {
            _1580 = 0.60000002384185791015625;
        }
        float _1586 = _1580;
        float _1588 = 1.0 / _1576;
        float _1590 = _218 * _1558;
        float _1592 = _218 * _1582;
        float _1594 = _1586;
        if (!_526)
        {
            _1594 = _1558;
        }
        float _1596 = _1594;
        float _1598 = _218 * _1564;
        float _1600 = _1596;
        if (_526)
        {
            _1584 = _1438;
        }
        float _1602 = _1584;
        float _1604 = _1602;
        if (!_526)
        {
            _1604 = _1564;
        }
        float _1606 = _1604;
        float _1608 = 1.0 / _1590;
        float _1610 = _218 * _1570;
        float _1612 = _218 * _1596;
        if (_526)
        {
            _1600 = _1442;
        }
        float _1614 = _1600;
        float _1616 = _218 * _1606;
        float _1618 = _1614;
        if (!_526)
        {
            _1618 = _1570;
        }
        float _1620 = _1618;
        float _1622 = 1.0 / _1598;
        float _1624 = _1588 * _1574;
        float _1626 = _218 * _1620;
        float _1628 = _1624 * 0.15915493667125701904296875;
        float _1630 = 1.0 / _1592;
        float _1632 = _1608 * _1574;
        float _1634 = _1632 * 0.15915493667125701904296875;
        float _1636 = 1.0 / _1610;
        float _1638 = _1622 * _1574;
        float _1640 = 1.0 / _1612;
        float _1642 = _1472 * _1630;
        float _1644 = _1642 * 6.283184051513671875;
        float _1646 = 1.0 / _1616;
        float _1648 = _1644 * 0.15915493667125701904296875;
        float _1650 = 1.0 / _1626;
        float _1652 = _1638 * 0.15915493667125701904296875;
        float _1654 = _1636 * _1574;
        float _1656 = _1654 * 0.15915493667125701904296875;
        float _1658 = _1472 * _1640;
        float _1660 = _1628 * 6.283185482025146484375;
        float _1662 = sin(_1660);
        float _1664 = _1658 * 6.283184051513671875;
        float _1666 = _1472 * _1646;
        float _1668 = _1664 * 0.15915493667125701904296875;
        float _1670 = _1648 * 6.283185482025146484375;
        float _1672 = sin(_1670);
        float _1674 = _1666 * 6.283184051513671875;
        float _1676 = _1472 * _1650;
        float _1678 = _1664;
        float _1680 = _1666;
        if (_526)
        {
            _1678 = _1452;
        }
        float _1682 = _1678;
        float _1684 = _1674 * 0.15915493667125701904296875;
        float _1686 = _1676 * 6.283184051513671875;
        float _1688 = _1682;
        _1690 = _1684;
        if (_526)
        {
            _1680 = _1452;
        }
        float _1692 = _1680;
        float _1694 = _1634 * 6.283185482025146484375;
        float _1696 = sin(_1694);
        float _1698 = _1692;
        if (!_526)
        {
            _1688 = _1454;
        }
        float _1700 = _1688;
        float _1702 = _1686 * 0.15915493667125701904296875;
        float _1704 = _1700;
        _1706 = _1702;
        if (!_526)
        {
            _1698 = _1454;
        }
        float _1708 = _1698;
        float _1710 = _1708;
        if (_526)
        {
            _1488 = _1456;
        }
        float _1712 = _1488;
        float _1714 = _1662 * _1700;
        float _1716 = _1712;
        float _1718 = _1662;
        if (!_526)
        {
            _1716 = _1458;
        }
        float _1720 = _1716;
        float _1722 = _1668 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1672 * _1708;
        float _1728 = _1720;
        if (_526)
        {
            _1710 = _1456;
        }
        float _1730 = _1710;
        float _1732 = _1730;
        if (!_526)
        {
            _1732 = _1458;
        }
        float _1734 = _1732;
        if (_526)
        {
            _1718 = _1460;
        }
        float _1736 = _1718;
        float _1738 = _1652 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        float _1742 = fma(_1696, _1720, _1714);
        float _1744 = _1736;
        float _1746 = _1696;
        if (_526)
        {
            _1728 = _1460;
        }
        float _1748 = _1728;
        float _1750 = _1748;
        if (!_526)
        {
            _1744 = _1462;
        }
        float _1752 = _1744;
        if (!_526)
        {
            _1750 = _1462;
        }
        float _1754 = _1750;
        float _1756 = _1684 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        float _1760 = fma(_1724, _1734, _1726);
        if (_526)
        {
            _1746 = _1464;
        }
        float _1762 = _1746;
        float _1764 = _1762;
        if (_526)
        {
            _1704 = _1464;
        }
        float _1766 = _1704;
        float _1768 = _1766;
        if (!_526)
        {
            _1764 = _1466;
        }
        float _1770 = _1764;
        float _1772 = _1656 * 6.283185482025146484375;
        float _1774 = sin(_1772);
        _1776 = _1770;
        if (!_526)
        {
            _1768 = _1466;
        }
        float _1778 = _1768;
        float _1780 = fma(_1740, _1752, _1742);
        float _1782 = _1702 * 6.283185482025146484375;
        float _1784 = sin(_1782);
        float _1786 = fma(_1758, _1754, _1760);
        float _1788 = fma(_1774, _1770, _1780);
        float _1790 = fma(_1784, _1778, _1786);
        float _1792 = -_1790;
        float _1794 = _1788 + _1792;
        _1796 = _1778;
        _1798 = _1790;
        _1800 = _1780;
        _1802 = _1788;
        _1804 = _1794;
        _1806 = true;
    }
    else
    {
        if (_526)
        {
            _1490 = _1436;
        }
        float _1808 = _1490;
        if (_526)
        {
            _1492 = _1438;
        }
        float _1810 = _1492;
        if (_526)
        {
            _1494 = 0.60000002384185791015625;
        }
        float _1812 = _1494;
        float _1814 = _1808;
        if (!_526)
        {
            float _1816 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _1814 = _1816;
        }
        float _1818 = _1814;
        if (_526)
        {
            _1496 = _1442;
        }
        float _1820 = _1496;
        float _1822 = _1810;
        if (!_526)
        {
            float _1824 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _1822 = _1824;
        }
        float _1826 = _1822;
        float _1828 = _1812;
        if (!_526)
        {
            float _1830 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _1828 = _1830;
        }
        float _1832 = _1828;
        float _1834 = _1820;
        if (!_526)
        {
            float _1836 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_526)
        {
            _1498 = _1436;
        }
        float _1840 = _1498;
        float _1842 = _1840;
        if (_526)
        {
            _1500 = _1436;
        }
        float _1844 = _1500;
        float _1846 = _494 * 6.283184051513671875;
        float _1848 = _1844;
        float _1850 = _1818;
        if (!_526)
        {
            _1842 = _1818;
        }
        float _1852 = _1842;
        float _1854 = _218 * _1852;
        float _1856 = _1852;
        if (_526)
        {
            _1856 = _1436;
        }
        float _1858 = _1856;
        float _1860 = _218 * _1826;
        float _1862 = _1858;
        if (!_526)
        {
            _1862 = _1818;
        }
        float _1864 = _1862;
        float _1866 = _1864;
        if (!_526)
        {
            _1848 = _1818;
        }
        float _1868 = _1848;
        float _1870 = 1.0 / _1860;
        float _1872 = _218 * _1818;
        float _1874 = _218 * _1838;
        float _1876 = _1868;
        if (_526)
        {
            _1850 = 0.60000002384185791015625;
        }
        float _1878 = _1850;
        float _1880 = _218 * _1868;
        float _1882 = _218 * _1864;
        float _1884 = _1878;
        if (_526)
        {
            _1866 = 0.60000002384185791015625;
        }
        float _1886 = _1866;
        float _1888 = _1886;
        if (!_526)
        {
            _1888 = _1832;
        }
        float _1890 = _1888;
        float _1892 = 1.0 / _1872;
        float _1894 = _1890;
        if (_526)
        {
            _1876 = 0.60000002384185791015625;
        }
        float _1896 = _1876;
        float _1898 = _218 * _1832;
        float _1900 = _1896;
        if (!_526)
        {
            _1884 = _1832;
        }
        float _1902 = _1884;
        float _1904 = _1902;
        if (!_526)
        {
            _1900 = _1832;
        }
        float _1906 = _1900;
        float _1908 = 1.0 / _1874;
        float _1910 = _218 * _1906;
        float _1912 = _1906;
        if (_526)
        {
            _1912 = _1438;
        }
        float _1914 = _1912;
        float _1916 = _218 * _1890;
        float _1918 = _1914;
        if (_526)
        {
            _1894 = _1438;
        }
        float _1920 = _1894;
        float _1922 = 1.0 / _1898;
        float _1924 = _1920;
        if (!_526)
        {
            _1924 = _1826;
        }
        float _1926 = _1924;
        float _1928 = _1926;
        if (!_526)
        {
            _1918 = _1826;
        }
        float _1930 = _1918;
        float _1932 = _218 * _1902;
        float _1934 = _1930;
        if (_526)
        {
            _1904 = _1438;
        }
        float _1936 = _1904;
        float _1938 = _1936;
        if (!_526)
        {
            _1938 = _1826;
        }
        float _1940 = _1938;
        float _1942 = _218 * _1926;
        float _1944 = _1940;
        if (_526)
        {
            _1928 = _1442;
        }
        float _1946 = _1928;
        float _1948 = 1.0 / _1882;
        float _1950 = _1946;
        if (!_526)
        {
            _1950 = _1838;
        }
        float _1952 = _1950;
        float _1954 = _218 * _1940;
        if (_526)
        {
            _1944 = _1442;
        }
        float _1956 = _1944;
        float _1958 = _1956;
        if (!_526)
        {
            _1958 = _1838;
        }
        float _1960 = _1958;
        float _1962 = 1.0 / _1916;
        float _1964 = _218 * _1930;
        if (_526)
        {
            _1934 = _1442;
        }
        float _1966 = _1934;
        float _1968 = _1966;
        if (!_526)
        {
            _1968 = _1838;
        }
        float _1970 = _1968;
        float _1972 = _218 * _1952;
        float _1974 = _1476 * 6.283184051513671875;
        float _1976 = 1.0 / _1932;
        float _1978 = _1892 * _1974;
        float _1980 = 1.0 / _1880;
        float _1982 = _218 * _1960;
        float _1984 = _1978 * 0.15915493667125701904296875;
        float _1986 = _1922 * _1974;
        float _1988 = 1.0 / _1954;
        float _1990 = 1.0 / _1854;
        float _1992 = _218 * _1970;
        float _1994 = _1986 * 0.15915493667125701904296875;
        float _1996 = _1870 * _1974;
        float _1998 = 1.0 / _1910;
        float _2000 = 1.0 / _1982;
        float _2002 = 1.0 / _1992;
        float _2004 = _494 + _434;
        float _2006 = 1.0 / _1972;
        float _2008 = _1996 * 0.15915493667125701904296875;
        float _2010 = _1908 * _1974;
        float _2012 = _1948 * _1846;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2004 * 6.283184051513671875;
        float _2018 = _1980 * _2016;
        float _2020 = 1.0 / _1964;
        float _2022 = _2012 * 0.15915493667125701904296875;
        float _2024 = _2018 * 0.15915493667125701904296875;
        float _2026 = _1472 * _1990;
        float _2028 = _1998 * _2016;
        float _2030 = _1984 * 6.283185482025146484375;
        float _2032 = sin(_2030);
        float _2034 = _2026 * 6.283184051513671875;
        float _2036 = _2028 * 0.15915493667125701904296875;
        float _2038 = _1962 * _1846;
        float _2040 = 1.0 / _1942;
        float _2042 = _2038 * 0.15915493667125701904296875;
        float _2044 = _2038;
        float _2046 = _2004;
        if (_526)
        {
            _2044 = _1452;
        }
        float _2048 = _2044;
        float _2050 = _2048;
        if (!_526)
        {
            _2050 = _1454;
        }
        float _2052 = _2050;
        float _2054 = _2022 * 6.283185482025146484375;
        float _2056 = sin(_2054);
        float _2058 = _2034 * 0.15915493667125701904296875;
        float _2060 = _2020 * _2016;
        float _2062 = _2024 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = _2032 * _2052;
        float _2068 = _2060 * 0.15915493667125701904296875;
        float _2070 = _2040 * _1846;
        float _2072 = _2058 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = _2052;
        float _2078 = _2060;
        if (_526)
        {
            _2076 = _1452;
        }
        float _2080 = _2076;
        float _2082 = _2080;
        if (_526)
        {
            _2078 = _1452;
        }
        float _2084 = _2078;
        float _2086 = _2084;
        if (!_526)
        {
            _2082 = _1454;
        }
        float _2088 = _2082;
        float _2090 = _2036 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        if (!_526)
        {
            _2086 = _1454;
        }
        float _2094 = _2086;
        float _2096 = _2070 * 0.15915493667125701904296875;
        float _2098 = _2094;
        if (_526)
        {
            _2046 = _1452;
        }
        float _2100 = _2046;
        float _2102 = _2002 * _2016;
        float _2104 = _1994 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2100;
        if (!_526)
        {
            _2108 = _1454;
        }
        float _2110 = _2108;
        float _2112 = _2056 * _2088;
        float _2114 = _2064 * _2094;
        float _2116 = _2042 * 6.283185482025146484375;
        float _2118 = sin(_2116);
        float _2120 = _1472 * _1976;
        float _2122 = _2110;
        float _2124 = _2120;
        if (_526)
        {
            _2098 = _1456;
        }
        float _2126 = _2098;
        float _2128 = _2102 * 0.15915493667125701904296875;
        float _2130 = _2126;
        if (!_526)
        {
            _2130 = _1458;
        }
        float _2132 = _2130;
        float _2134 = _2074 * _2110;
        float _2136 = _2120 * 6.283184051513671875;
        if (_526)
        {
            _2122 = _1456;
        }
        float _2138 = _2122;
        float _2140 = _2138;
        if (_526)
        {
            _2124 = _1456;
        }
        float _2142 = _2124;
        float _2144 = fma(_2092, _2132, _2114);
        float _2146 = _2142;
        if (!_526)
        {
            _2140 = _1458;
        }
        float _2148 = _2140;
        float _2150 = _2148;
        if (!_526)
        {
            _2146 = _1458;
        }
        float _2152 = _2146;
        float _2154 = _1472 * _1988;
        float _2156 = _2136 * 0.15915493667125701904296875;
        float _2158 = _2006 * _1846;
        float _2160 = fma(_2106, _2148, _2066);
        float _2162 = fma(_2118, _2152, _2112);
        float _2164 = _1472 * _2000;
        float _2166 = _2154 * 6.283184051513671875;
        float _2168 = _2156 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = _2158 * 0.15915493667125701904296875;
        float _2174 = _2164 * 6.283184051513671875;
        float _2176 = _2166 * 0.15915493667125701904296875;
        float _2178 = _2008 * 6.283185482025146484375;
        float _2180 = sin(_2178);
        float _2182 = _2154;
        float _2184 = _2166;
        float _2186 = _2174;
        if (_526)
        {
            _2182 = _1456;
        }
        float _2188 = _2182;
        float _2190 = _2068 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = _2188;
        if (!_526)
        {
            _2194 = _1458;
        }
        float _2196 = _2194;
        float _2198 = _2096 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = _2172 * 6.283185482025146484375;
        float _2204 = sin(_2202);
        float _2206 = _2174 * 0.15915493667125701904296875;
        float _2208 = _2176 * 6.283185482025146484375;
        float _2210 = sin(_2208);
        float _2212 = _2196;
        if (_526)
        {
            _2150 = _1460;
        }
        float _2214 = _2150;
        float _2216 = _2214;
        if (_526)
        {
            _1502 = _1460;
        }
        float _2218 = _1502;
        float _2220 = _2218;
        if (_526)
        {
            _2184 = _1460;
        }
        float _2222 = _2184;
        float _2224 = _2014 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222;
        if (!_526)
        {
            _2216 = _1462;
        }
        float _2230 = _2216;
        float _2232 = fma(_2170, _2196, _2134);
        float _2234 = _2230;
        if (!_526)
        {
            _2220 = _1462;
        }
        float _2236 = _2220;
        float _2238 = _2128 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = _2236;
        if (!_526)
        {
            _2228 = _1462;
        }
        float _2244 = _2228;
        float _2246 = _2206 * 6.283185482025146484375;
        float _2248 = sin(_2246);
        float _2250 = _2244;
        if (_526)
        {
            _2212 = _1460;
        }
        float _2252 = _2212;
        float _2254 = _2252;
        if (!_526)
        {
            _2254 = _1462;
        }
        float _2256 = _2254;
        float _2258 = fma(_2180, _2230, _2160);
        float _2260 = fma(_2192, _2236, _2144);
        float _2262 = fma(_2200, _2244, _2162);
        _1796 = _2256;
        _1798 = _2258;
        _1706 = _2192;
        if (_526)
        {
            _2186 = _1464;
        }
        float _2264 = _2186;
        float _2266 = _2264;
        if (_526)
        {
            _2234 = _1464;
        }
        float _2268 = _2234;
        float _2270 = _2268;
        if (_526)
        {
            _2242 = _1464;
        }
        float _2272 = _2242;
        float _2274 = _2272;
        if (_526)
        {
            _2250 = _1464;
        }
        float _2276 = _2250;
        float _2278 = fma(_2210, _2256, _2232);
        float _2280 = _2276;
        if (!_526)
        {
            _2266 = _1466;
        }
        float _2282 = _2266;
        _1776 = _2282;
        if (!_526)
        {
            _2274 = _1466;
        }
        float _2284 = _2274;
        if (!_526)
        {
            _2280 = _1466;
        }
        float _2286 = _2280;
        if (!_526)
        {
            _2270 = _1466;
        }
        float _2288 = _2270;
        float _2290 = fma(_2226, _2282, _2258);
        float _2292 = fma(_2240, _2284, _2260);
        float _2294 = fma(_2204, _2286, _2262);
        float _2296 = fma(_2248, _2288, _2278);
        float _2298 = -_2292;
        float _2300 = _2298 + _2294;
        float _2302 = -_2296;
        float _2304 = _2290 + _2302;
        float _2306 = _2304 + _2300;
        _1800 = _2296;
        _1690 = _2240;
        _1802 = _2304;
        _1804 = _2306;
    }
    _1806 = false;
    float _2308 = _1796;
    float _2310 = _1798;
    float _2312 = _1776;
    float _2314 = _1800;
    float _2316 = _1690;
    float _2318 = _1802;
    float _2320 = _1706;
    float _2322 = _1804;
    float _2324 = _412 + _496;
    float _2326 = _160 + _2324;
    float _2328 = _2326 + _434;
    float _2330 = _2308;
    float _2332 = _2312;
    float _2334 = _2314;
    float _2336 = _2308;
    float _2338 = _2310;
    float _2340 = _2324;
    float _2342 = _2320;
    float _2344 = _2318;
    float _2346 = _2316;
    float _2348 = _2322;
    float _2454;
    float _2456;
    float _2458;
    float _2466;
    float _2494;
    float _2496;
    float _2524;
    float _2540;
    float _2544;
    float _2580;
    float _2582;
    float _2584;
    float _2586;
    float _2588;
    float _2590;
    float _2592;
    float _2594;
    if (!_506)
    {
        if (_526)
        {
            _444 = _1436;
        }
        float _2350 = _444;
        if (_526)
        {
            _324 = 0.60000002384185791015625;
        }
        float _2352 = _324;
        float _2354 = _2350;
        if (!_526)
        {
            float _2356 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _2354 = _2356;
        }
        float _2358 = _2354;
        if (_526)
        {
            _414 = _1438;
        }
        float _2360 = _414;
        float _2362 = _2352;
        if (!_526)
        {
            float _2364 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _2362 = _2364;
        }
        float _2366 = _2362;
        if (_526)
        {
            _2330 = _1442;
        }
        float _2368 = _2330;
        float _2370 = _2360;
        if (!_526)
        {
            float _2372 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _2370 = _2372;
        }
        float _2374 = _2370;
        float _2376 = _2368;
        if (!_526)
        {
            float _2378 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _2376 = _2378;
        }
        float _2380 = _2376;
        float _2382 = _2328 * 6.283184051513671875;
        float _2384 = _218 * _2358;
        float _2386 = _2358;
        if (!_526)
        {
            _1504 = _2358;
        }
        float _2388 = _1504;
        if (_526)
        {
            _2386 = 0.60000002384185791015625;
        }
        float _2390 = _2386;
        float _2392 = _218 * _2366;
        float _2394 = _2390;
        if (!_526)
        {
            _2394 = _2366;
        }
        float _2396 = _2394;
        float _2398 = 1.0 / _2384;
        float _2400 = _218 * _2388;
        float _2402 = _218 * _2374;
        if (!_526)
        {
            _1506 = _2374;
        }
        float _2404 = _1506;
        float _2406 = _218 * _2396;
        float _2408 = _218 * _2380;
        if (!_526)
        {
            _1508 = _2380;
        }
        float _2410 = _1508;
        float _2412 = 1.0 / _2392;
        float _2414 = _218 * _2410;
        float _2416 = 1.0 / _2402;
        float _2418 = _218 * _2404;
        float _2420 = _2398 * _2382;
        float _2422 = _2420 * 0.15915493667125701904296875;
        float _2424 = 1.0 / _2408;
        float _2426 = _2412 * _2382;
        float _2428 = _2426 * 0.15915493667125701904296875;
        float _2430 = 1.0 / _2400;
        float _2432 = _2416 * _2382;
        float _2434 = _2432 * 0.15915493667125701904296875;
        float _2436 = 1.0 / _2406;
        float _2438 = _2424 * _2382;
        float _2440 = _2438 * 0.15915493667125701904296875;
        float _2442 = 1.0 / _2418;
        float _2444 = _2324 * _2430;
        float _2446 = _2444 * 6.283184051513671875;
        float _2448 = 1.0 / _2414;
        float _2450 = _2324 * _2436;
        float _2452 = _2418;
        _2454 = _2424;
        _2456 = _2412;
        _2458 = _2436;
        if (_526)
        {
            _2452 = _1460;
        }
        float _2460 = _2452;
        float _2462 = _2460;
        if (!_526)
        {
            _2462 = _1462;
        }
        float _2464 = _2462;
        _2466 = _2464;
        if (!_526)
        {
            _1510 = _1462;
        }
        float _2468 = _1510;
        float _2470 = _2422 * 6.283185482025146484375;
        float _2472 = sin(_2470);
        float _2474 = _2446 * 0.15915493667125701904296875;
        float _2476 = _2450 * 6.283184051513671875;
        float _2478 = _2324 * _2442;
        float _2480 = _2476 * 0.15915493667125701904296875;
        float _2482 = _2478 * 6.283184051513671875;
        float _2484 = _2324 * _2448;
        float _2486 = _2474 * 6.283185482025146484375;
        float _2488 = sin(_2486);
        float _2490 = _2476;
        float _2492 = _2482;
        _2494 = _2442;
        _2496 = _2468;
        if (_526)
        {
            _2490 = _1452;
        }
        float _2498 = _2490;
        float _2500 = _2482 * 0.15915493667125701904296875;
        float _2502 = _2484 * 6.283184051513671875;
        float _2504 = _2498;
        if (!_526)
        {
            _2504 = _1454;
        }
        float _2506 = _2504;
        float _2508 = _2506;
        if (!_526)
        {
            _1512 = _1454;
        }
        float _2510 = _1512;
        float _2512 = _2502 * 0.15915493667125701904296875;
        float _2514 = _2428 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        if (_526)
        {
            _2492 = _1456;
        }
        float _2518 = _2492;
        float _2520 = _2472 * _2506;
        float _2522 = _2518;
        _2524 = _2520;
        if (!_526)
        {
            _2522 = _1458;
        }
        float _2526 = _2522;
        if (!_526)
        {
            _1514 = _1458;
        }
        float _2528 = _1514;
        if (_526)
        {
            _2508 = _1464;
        }
        float _2530 = _2508;
        float _2532 = _2480 * 6.283185482025146484375;
        float _2534 = sin(_2532);
        float _2536 = _2488 * _2510;
        float _2538 = _2530;
        _2540 = _2536;
        if (!_526)
        {
            _2538 = _1466;
        }
        float _2542 = _2538;
        _2544 = _2542;
        if (!_526)
        {
            _1516 = _1466;
        }
        float _2546 = _1516;
        float _2548 = _2434 * 6.283185482025146484375;
        float _2550 = sin(_2548);
        float _2552 = fma(_2516, _2526, _2520);
        float _2554 = _2500 * 6.283185482025146484375;
        float _2556 = sin(_2554);
        float _2558 = fma(_2534, _2528, _2536);
        float _2560 = _2440 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = fma(_2550, _2464, _2552);
        float _2566 = _2512 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = fma(_2556, _2468, _2558);
        float _2572 = fma(_2562, _2542, _2564);
        float _2574 = fma(_2568, _2546, _2570);
        float _2576 = -_2574;
        float _2578 = _2572 + _2576;
        _2580 = _2558;
        _2582 = _2568;
        _2584 = _2572;
        _2586 = _2552;
        _2588 = _2516;
        _2590 = _2570;
        _2592 = _2564;
        _2594 = _2578;
        _2596 = true;
    }
    else
    {
        if (_526)
        {
            _2332 = _1436;
        }
        float _2598 = _2332;
        if (_526)
        {
            _2334 = _1438;
        }
        float _2600 = _2334;
        if (_526)
        {
            _2336 = 0.60000002384185791015625;
        }
        float _2602 = _2336;
        float _2604 = _2598;
        if (!_526)
        {
            float _2606 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[5]);
            _2604 = _2606;
        }
        float _2608 = _2604;
        float _2610 = _2600;
        if (!_526)
        {
            float _2612 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[6]);
            _2610 = _2612;
        }
        float _2614 = _2610;
        float _2616 = _2602;
        if (!_526)
        {
            float _2618 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[4]);
            _2616 = _2618;
        }
        float _2620 = _2616;
        if (_526)
        {
            _2338 = _1442;
        }
        float _2622 = _2338;
        float _2624 = _2622;
        if (!_526)
        {
            float _2626 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[7]);
            _2624 = _2626;
        }
        float _2628 = _2624;
        if (_526)
        {
            _326 = _1436;
        }
        float _2630 = _326;
        float _2632 = _2630;
        if (_526)
        {
            _416 = _1436;
        }
        float _2634 = _416;
        float _2636 = _2328 * 6.283184051513671875;
        float _2638 = _496 + _434;
        float _2640 = _496 * 6.283184051513671875;
        float _2642 = _218 * _2608;
        float _2644 = _2634;
        float _2646 = _2640;
        if (!_526)
        {
            _2632 = _2608;
        }
        float _2648 = _2632;
        float _2650 = 1.0 / _2642;
        float _2652 = _218 * _2614;
        float _2654 = _2648;
        if (!_526)
        {
            _1518 = _2608;
        }
        float _2656 = _1518;
        if (!_526)
        {
            _2644 = _2608;
        }
        float _2658 = _2644;
        float _2660 = _218 * _2648;
        float _2662 = _2658;
        if (_526)
        {
            _2654 = 0.60000002384185791015625;
        }
        float _2664 = _2654;
        float _2666 = _2664;
        if (!_526)
        {
            _2666 = _2620;
        }
        float _2668 = _2666;
        float _2670 = 1.0 / _2652;
        float _2672 = _218 * _2658;
        float _2674 = _2668;
        if (_526)
        {
            _2662 = 0.60000002384185791015625;
        }
        float _2676 = _2662;
        float _2678 = _218 * _2620;
        float _2680 = _2676;
        if (!_526)
        {
            _2680 = _2620;
        }
        float _2682 = _2680;
        float _2684 = _218 * _2656;
        float _2686 = _218 * _2668;
        float _2688 = _2682;
        if (_526)
        {
            _2674 = 0.60000002384185791015625;
        }
        float _2690 = _2674;
        float _2692 = _2690;
        if (!_526)
        {
            _2692 = _2620;
        }
        float _2694 = _2692;
        float _2696 = 1.0 / _2678;
        float _2698 = _218 * _2694;
        float _2700 = _2694;
        if (_526)
        {
            _2700 = _1438;
        }
        float _2702 = _2700;
        float _2704 = _2702;
        if (!_526)
        {
            _2704 = _2614;
        }
        float _2706 = _2704;
        float _2708 = _218 * _2682;
        float _2710 = _2706;
        if (_526)
        {
            _2688 = _1438;
        }
        float _2712 = _2688;
        float _2714 = _2712;
        if (!_526)
        {
            _2714 = _2614;
        }
        float _2716 = _2714;
        float _2718 = 1.0 / _2686;
        float _2720 = _2716;
        if (!_526)
        {
            _1520 = _2614;
        }
        float _2722 = _1520;
        float _2724 = _218 * _2716;
        float _2726 = _2724;
        if (_526)
        {
            _2720 = _1442;
        }
        float _2728 = _2720;
        float _2730 = _218 * _2628;
        float _2732 = _2728;
        if (!_526)
        {
            _2732 = _2628;
        }
        float _2734 = _2732;
        float _2736 = _218 * _2706;
        if (_526)
        {
            _2710 = _1442;
        }
        float _2738 = _2710;
        float _2740 = _2738;
        if (!_526)
        {
            _2740 = _2628;
        }
        float _2742 = _2740;
        if (!_526)
        {
            _1522 = _2628;
        }
        float _2744 = _1522;
        float _2746 = 1.0 / _2730;
        float _2748 = _218 * _2722;
        float _2750 = _218 * _2734;
        float _2752 = _218 * _2742;
        float _2754 = _218 * _2744;
        float _2756 = _2650 * _2636;
        float _2758 = 1.0 / _2660;
        float _2760 = _2756 * 0.15915493667125701904296875;
        float _2762 = _2696 * _2636;
        float _2764 = _2762 * 0.15915493667125701904296875;
        float _2766 = _2670 * _2636;
        float _2768 = 1.0 / _2684;
        float _2770 = _2766 * 0.15915493667125701904296875;
        float _2772 = _2746 * _2636;
        float _2774 = 1.0 / _2708;
        float _2776 = _2772 * 0.15915493667125701904296875;
        float _2778 = 1.0 / _2750;
        float _2780 = _2638 * 6.283184051513671875;
        float _2782 = 1.0 / _2698;
        float _2784 = _2758 * _2780;
        float _2786 = _2784 * 0.15915493667125701904296875;
        float _2788 = 1.0 / _2736;
        float _2790 = _2768 * _2640;
        float _2792 = _2790 * 0.15915493667125701904296875;
        float _2794 = _2774 * _2780;
        float _2796 = 1.0 / _2748;
        float _2798 = _2794 * 0.15915493667125701904296875;
        float _2800 = 1.0 / _2752;
        float _2802 = _2782 * _2640;
        float _2804 = 1.0 / _2754;
        float _2806 = _2802 * 0.15915493667125701904296875;
        float _2808 = _2788 * _2780;
        float _2810 = 1.0 / _2672;
        float _2812 = _2796 * _2640;
        float _2814 = 1.0 / _2724;
        float _2816 = _2808 * 0.15915493667125701904296875;
        float _2818 = _2800 * _2780;
        float _2820 = _2812 * 0.15915493667125701904296875;
        float _2822 = _2804 * _2640;
        float _2824 = _2818 * 0.15915493667125701904296875;
        float _2826 = _2324 * _2810;
        float _2828 = _2822 * 0.15915493667125701904296875;
        float _2830 = _2826 * 6.283184051513671875;
        float _2832 = _2324 * _2718;
        float _2834 = _2774;
        float _2836 = _2796;
        float _2838 = _2782;
        float _2840 = _2788;
        float _2842 = _2800;
        float _2844 = _2804;
        float _2846 = _2830;
        if (_526)
        {
            _2834 = _1460;
        }
        float _2848 = _2834;
        float _2850 = _2848;
        if (_526)
        {
            _2836 = _1460;
        }
        float _2852 = _2836;
        float _2854 = _2832 * 6.283184051513671875;
        float _2856 = _2852;
        if (_526)
        {
            _2646 = _1460;
        }
        float _2858 = _2646;
        float _2860 = _2324 * _2814;
        float _2862 = _2858;
        if (!_526)
        {
            _2850 = _1462;
        }
        float _2864 = _2850;
        _2584 = _2864;
        if (!_526)
        {
            _2856 = _1462;
        }
        float _2866 = _2856;
        _2524 = _2866;
        if (!_526)
        {
            _2862 = _1462;
        }
        float _2868 = _2862;
        _2466 = _2868;
        if (!_526)
        {
            _1524 = _1462;
        }
        float _2870 = _1524;
        float _2872 = _2830 * 0.15915493667125701904296875;
        _2496 = _2870;
        if (_526)
        {
            _2838 = _1464;
        }
        float _2874 = _2838;
        float _2876 = _2874;
        if (_526)
        {
            _2840 = _1464;
        }
        float _2878 = _2840;
        float _2880 = _2878;
        if (_526)
        {
            _2842 = _1464;
        }
        float _2882 = _2842;
        float _2884 = _2882;
        if (!_526)
        {
            _2876 = _1466;
        }
        float _2886 = _2876;
        if (!_526)
        {
            _2880 = _1466;
        }
        float _2888 = _2880;
        if (!_526)
        {
            _2884 = _1466;
        }
        float _2890 = _2884;
        _2588 = _2890;
        if (!_526)
        {
            _1526 = _1466;
        }
        float _2892 = _1526;
        float _2894 = _2854 * 0.15915493667125701904296875;
        float _2896 = _2860 * 6.283184051513671875;
        float _2898 = _2760 * 6.283185482025146484375;
        float _2900 = sin(_2898);
        float _2902 = _2324 * _2778;
        float _2904 = _2896;
        float _2906 = _2902;
        if (_526)
        {
            _2726 = _1452;
        }
        float _2908 = _2726;
        float _2910 = _2896 * 0.15915493667125701904296875;
        float _2912 = _2908;
        if (_526)
        {
            _2844 = _1452;
        }
        float _2914 = _2844;
        float _2916 = _2914;
        if (_526)
        {
            _2846 = _1452;
        }
        float _2918 = _2846;
        float _2920 = _2786 * 6.283185482025146484375;
        float _2922 = sin(_2920);
        float _2924 = _2918;
        if (!_526)
        {
            _2912 = _1454;
        }
        float _2926 = _2912;
        _2494 = _2926;
        if (!_526)
        {
            _2916 = _1454;
        }
        float _2928 = _2916;
        if (!_526)
        {
            _2924 = _1454;
        }
        float _2930 = _2924;
        float _2932 = _2792 * 6.283185482025146484375;
        float _2934 = sin(_2932);
        _2544 = _2930;
        if (!_526)
        {
            _1528 = _1454;
        }
        float _2936 = _1528;
        float _2938 = _2902 * 6.283184051513671875;
        float _2940 = _2872 * 6.283185482025146484375;
        float _2942 = sin(_2940);
        float _2944 = _2938 * 0.15915493667125701904296875;
        _1534 = _2944;
        if (_526)
        {
            _2340 = _1456;
        }
        float _2946 = _2340;
        float _2948 = _2764 * 6.283185482025146484375;
        float _2950 = sin(_2948);
        float _2952 = _2946;
        if (_526)
        {
            _2904 = _1456;
        }
        float _2954 = _2904;
        float _2956 = _2798 * 6.283185482025146484375;
        float _2958 = sin(_2956);
        float _2960 = _2954;
        if (_526)
        {
            _2906 = _1456;
        }
        float _2962 = _2906;
        float _2964 = _2806 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962;
        if (!_526)
        {
            _2952 = _1458;
        }
        float _2970 = _2952;
        float _2972 = _2894 * 6.283185482025146484375;
        float _2974 = sin(_2972);
        if (!_526)
        {
            _2960 = _1458;
        }
        float _2976 = _2960;
        _2592 = _2976;
        if (!_526)
        {
            _2968 = _1458;
        }
        float _2978 = _2968;
        if (!_526)
        {
            _1530 = _1458;
        }
        float _2980 = _1530;
        float _2982 = _2770 * 6.283185482025146484375;
        float _2984 = sin(_2982);
        float _2986 = _2816 * 6.283185482025146484375;
        float _2988 = sin(_2986);
        float _2990 = _2820 * 6.283185482025146484375;
        float _2992 = sin(_2990);
        float _2994 = _2910 * 6.283185482025146484375;
        float _2996 = sin(_2994);
        float _2998 = _2900 * _2926;
        float _3000 = _2922 * _2930;
        float _3002 = _2934 * _2936;
        float _3004 = _2942 * _2928;
        float _3006 = _2776 * 6.283185482025146484375;
        float _3008 = sin(_3006);
        float _3010 = _2824 * 6.283185482025146484375;
        float _3012 = sin(_3010);
        float _3014 = _2828 * 6.283185482025146484375;
        float _3016 = sin(_3014);
        float _3018 = _2944 * 6.283185482025146484375;
        float _3020 = sin(_3018);
        float _3022 = fma(_2950, _2970, _2998);
        float _3024 = fma(_2958, _2978, _3000);
        float _3026 = fma(_2966, _2980, _3002);
        float _3028 = fma(_2974, _2976, _3004);
        float _3030 = fma(_2984, _2864, _3022);
        float _3032 = fma(_2988, _2868, _3024);
        float _3034 = fma(_2992, _2870, _3026);
        float _3036 = fma(_2996, _2866, _3028);
        float _3038 = fma(_3008, _2886, _3030);
        float _3040 = fma(_3012, _2890, _3032);
        float _3042 = fma(_3016, _2892, _3034);
        float _3044 = fma(_3020, _2888, _3036);
        float _3046 = -_3040;
        float _3048 = _3046 + _3042;
        float _3050 = -_3044;
        float _3052 = _3038 + _3050;
        float _3054 = _3052 + _3048;
        _1532 = _3020;
        _2454 = _2950;
        _2456 = _3030;
        _2580 = _2998;
        _2342 = _3032;
        _2344 = _3052;
        _2346 = _3002;
        _1536 = _3028;
        _2458 = _3036;
        _1538 = _2942;
        _2582 = _3022;
        _2586 = _3024;
        _2540 = _3004;
        _2590 = _3044;
        _2594 = _3054;
    }
    _2596 = false;
    float _3056 = _1532;
    float _3058 = _2454;
    float _3060 = _1534;
    float _3062 = _2456;
    float _3064 = _2580;
    float _3066 = _2342;
    float _3068 = _2344;
    float _3070 = _2346;
    float _3072 = _1536;
    float _3074 = _2458;
    float _3076 = _1538;
    float _3078 = _2582;
    float _3080 = _2494;
    float _3082 = _2584;
    float _3084 = _2586;
    float _3086 = _2544;
    float _3088 = _2466;
    float _3090 = _2588;
    float _3092 = _2496;
    float _3094 = _2540;
    float _3096 = _2524;
    float _3098 = _2590;
    float _3100 = _2592;
    float _3102 = _2594;
    int _3104 = as_type<int>(_222) & 1024;
    bool _3106 = _3104 != 0;
    float _3108 = _3056;
    float _3110 = _3058;
    float _3112 = _3060;
    float _3114 = _3062;
    if (_532)
    {
        float _3116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3108 = _3116;
        _3110 = _3118;
        _3112 = _3120;
        _3114 = _3122;
    }
    float _3124 = _3108;
    float _3126 = _3110;
    float _3128 = _3112;
    float _3130 = _3114;
    int _3132 = as_type<int>(_222) & 2048;
    bool _3134 = _3132 != 0;
    float _3136 = _3064;
    float _3138 = _3066;
    float _3140 = _3068;
    float _3142 = _3070;
    if (_532)
    {
        float _3144 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3146 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3148 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3150 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3136 = _3144;
        _3138 = _3146;
        _3140 = _3148;
        _3142 = _3150;
    }
    float _3152 = _3136;
    float _3154 = _3138;
    float _3156 = _3140;
    float _3158 = _3142;
    float _3160 = _3072;
    float _3162 = _3074;
    float _3164 = _3076;
    if (_3106)
    {
        uint _3166 = uint(int(uint(_166) >> uint(2)));
        float _3168 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3166)]);
        int _3170 = _166 + 4;
        uint _3172 = uint(int(uint(_3170) >> uint(2)));
        float _3174 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3172)]);
        int _3176 = _166 + 8;
        uint _3178 = uint(int(uint(_3176) >> uint(2)));
        float _3180 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3178)]);
        _3160 = _3168;
        _3162 = _3174;
        _3164 = _3180;
    }
    float _3182 = _3160;
    float _3184 = _3162;
    float _3186 = _3164;
    float _3188 = _3078;
    float _3190 = _3080;
    float _3192 = _3082;
    if (_3106)
    {
        uint _3194 = uint(int(uint(_166) >> uint(2)));
        float _3196 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3194)]);
        int _3198 = _166 + 4;
        uint _3200 = uint(int(uint(_3198) >> uint(2)));
        float _3202 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3200)]);
        int _3204 = _166 + 8;
        uint _3206 = uint(int(uint(_3204) >> uint(2)));
        float _3208 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3206)]);
        _3188 = _3196;
        _3190 = _3202;
        _3192 = _3208;
    }
    float _3210 = _3188;
    float _3212 = _3190;
    float _3214 = _3192;
    float _3216 = _3084;
    float _3218 = _3086;
    float _3220 = _3088;
    float _3222 = _3090;
    if (_3134)
    {
        uint _3224 = uint(int(uint(_166) >> uint(2)));
        float _3226 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3224)]);
        int _3228 = _166 + 4;
        uint _3230 = uint(int(uint(_3228) >> uint(2)));
        float _3232 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3230)]);
        int _3234 = _166 + 8;
        uint _3236 = uint(int(uint(_3234) >> uint(2)));
        float _3238 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3236)]);
        int _3240 = _166 + 12;
        uint _3242 = uint(int(uint(_3240) >> uint(2)));
        float _3244 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3242)]);
        _3216 = _3226;
        _3218 = _3232;
        _3220 = _3238;
        _3222 = _3244;
    }
    float _3246 = _3216;
    float _3248 = _3218;
    float _3250 = _3220;
    float _3252 = _3222;
    float _3254 = _3092;
    float _3256 = _3094;
    float _3258 = _3096;
    float _3260 = _3098;
    if (_3134)
    {
        uint _3262 = uint(int(uint(_166) >> uint(2)));
        float _3264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3262)]);
        int _3266 = _166 + 4;
        uint _3268 = uint(int(uint(_3266) >> uint(2)));
        float _3270 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3268)]);
        int _3272 = _166 + 8;
        uint _3274 = uint(int(uint(_3272) >> uint(2)));
        float _3276 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3274)]);
        int _3278 = _166 + 12;
        uint _3280 = uint(int(uint(_3278) >> uint(2)));
        float _3282 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3280)]);
        _3254 = _3264;
        _3256 = _3270;
        _3258 = _3276;
        _3260 = _3282;
    }
    float _3284 = _3254;
    float _3286 = _3256;
    float _3288 = _3258;
    float _3290 = _3260;
    float _3292 = _222;
    if (_3106)
    {
        float _3294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3292 = _3294;
    }
    float _3296 = _3292;
    float _3298 = _3100;
    if (_3106)
    {
        float _3300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3298 = _3300;
    }
    float _3302 = _3298;
    float _3304 = fma(_246, _2322, _536);
    float _3306 = fma(_248, _3102, _534);
    float _3308 = fma(_244, _1470, _528);
    if (_532)
    {
        float _3310 = _3304 * _3126;
        _446 = _3310;
    }
    float _3312 = _446;
    float _3314 = _3312;
    if (_532)
    {
        float _3316 = fma(_3308, _3124, _3312);
        _3314 = _3316;
    }
    float _3318 = _3314;
    float _3320 = _3318;
    float _3322 = _3152;
    float _3324 = _3212;
    float _3326 = _3286;
    float _3328 = _3214;
    float _3330 = _3250;
    float _3332 = _3288;
    if (_532)
    {
        float _3334 = _3304 * _3154;
        _448 = _3334;
    }
    float _3336 = _448;
    float _3338 = _3336;
    if (_532)
    {
        float _3340 = fma(_3306, _3128, _3318);
        _3320 = _3340;
    }
    float _3342 = _3320;
    float _3344 = _3342;
    if (_532)
    {
        float _3346 = fma(_3308, _3152, _3336);
        _3322 = _3346;
    }
    float _3348 = _3322;
    float _3350 = _3348;
    if (!_532)
    {
        _3338 = 0.0;
        _450 = 0.0;
    }
    float _3352 = _3338;
    float _3354 = _450;
    float _3356 = _3354;
    float _3358 = _3352;
    if (_3106)
    {
        float _3360 = _3304 * _3184;
        _2348 = _3360;
    }
    float _3362 = _2348;
    float _3364 = _3362;
    if (_532)
    {
        float _3366 = _3130 + _3342;
        _3356 = _3366;
    }
    float _3368 = _3356;
    float _3370 = _3368;
    if (_3106)
    {
        float _3372 = _3304 * _3212;
        _3324 = _3372;
    }
    float _3374 = _3324;
    float _3376 = _3374;
    if (_3106)
    {
        float _3378 = fma(_3308, _3182, _3362);
        _3364 = _3378;
    }
    float _3380 = _3364;
    float _3382 = _3380;
    if (_3134)
    {
        float _3384 = _3304 * _3248;
        _3344 = _3384;
    }
    float _3386 = _3344;
    float _3388 = _3386;
    if (_3106)
    {
        float _3390 = fma(_3308, _3210, _3374);
        _3376 = _3390;
    }
    float _3392 = _3376;
    if (_3134)
    {
        float _3394 = _3304 * _3286;
        _3326 = _3394;
    }
    float _3396 = _3326;
    float _3398 = _3396;
    if (_3134)
    {
        float _3400 = fma(_3308, _3246, _3386);
        _3388 = _3400;
    }
    float _3402 = _3388;
    if (_532)
    {
        float _3404 = fma(_3306, _3156, _3348);
        _3350 = _3404;
    }
    float _3406 = _3350;
    if (_3134)
    {
        float _3408 = fma(_3308, _3284, _3396);
        _3398 = _3408;
    }
    float _3410 = _3398;
    if (_3106)
    {
        float _3412 = fma(_3306, _3186, _3380);
        _3382 = _3412;
    }
    float _3414 = _3382;
    if (_3106)
    {
        float _3416 = fma(_3306, _3214, _3392);
        _3328 = _3416;
    }
    float _3418 = _3328;
    if (_3134)
    {
        float _3420 = fma(_3306, _3250, _3402);
        _3330 = _3420;
    }
    float _3422 = _3330;
    if (_3134)
    {
        float _3424 = fma(_3306, _3288, _3410);
        _3332 = _3424;
    }
    float _3426 = _3332;
    if (_532)
    {
        float _3428 = _3158 + _3406;
        _3358 = _3428;
    }
    float _3430 = _3358;
    float _3432 = _3430;
    if (_3106)
    {
        float _3434 = _3296 + _3414;
        _3432 = _3434;
    }
    float _3436 = _3432;
    float _3438 = _3436;
    if (_3106)
    {
        float _3440 = _3302 + _3418;
        _3370 = _3440;
    }
    float _3442 = _3370;
    float _3444 = _3442;
    if (_3134)
    {
        float _3446 = _3252 + _3422;
        _3438 = _3446;
    }
    float _3448 = _3438;
    if (_3134)
    {
        float _3450 = _3290 + _3426;
        _3444 = _3450;
    }
    float _3452 = _3444;
    float _3454 = fma(_3448, 6.2500002968590706586837768554688e-05, 0.5);
    float _3456 = fma(_3452, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _8782 = float2(_3454, _3456);
    float2 _3460 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8782, float2(0.0), isnan(_8782)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8782, float2(0.0), isnan(_8782)), level(0.0)).xy;
    float _3462 = _3460.x;
    float _3464 = _3460.y;
    float2 _8796 = float2(_3454, _3456);
    float2 _3466 = dm_bs(spvDescriptorSet0.cp_t_tcb_1A.sample(spvDescriptorSet0.cp_t_tcb_1ASmplr, select(_8796, float2(0.0), isnan(_8796)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_1A, spvDescriptorSet0.cp_t_tcb_1ASmplr_w, select(_8796, float2(0.0), isnan(_8796)), level(0.0)).xy;
    float _3468 = _3466.x;
    float _3470 = _3466.y;
    float _3472 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[83]);
    float _3474 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    uint _3476 = uint(int(uint(_170) >> uint(2)));
    float _3478 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3476)]);
    float _3480 = _3462 * 2000.0;
    float _3482 = _3464 * 2000.0;
    bool _3484 = _3472 != 0.0;
    bool _3486 = isnan(_3472);
    bool _3488 = _3484 || _3486;
    bool _3490 = isnan(0.0);
    bool _3492 = _3488 || _3490;
    bool _3494 = _3482 >= _3480;
    float _3496 = _3474 * 2.0;
    float _3498 = _3468 + (-0.5);
    float _3500 = _3470 + (-0.5);
    float _3502 = _3498 * _3496;
    float _3504 = _3500 * _3496;
    float _3506 = _3502;
    float _3508 = _3504;
    float _3510 = _3496;
    float _3512 = _3472;
    if (_3492)
    {
        float _3514 = _3502 * _3472;
        _3506 = _3514;
    }
    float _3516 = _3506;
    if (_3492)
    {
        float _3518 = _3504 * _3472;
        _3508 = _3518;
    }
    float _3520 = _3508;
    float _3522 = _3520;
    if (!_3494)
    {
        _3510 = 0.0;
    }
    float _3524 = _3510;
    bool _3526 = !_3494;
    float _3528 = _3524;
    if (!_3526)
    {
        float2 _8887 = float2(_3454, _3456);
        float _3530 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8887, float2(0.0), isnan(_8887)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8887, float2(0.0), isnan(_8887)), level(0.0)).y;
        float _3532 = _3530 * 2000.0;
        bool _3534 = _3482 >= _3532;
        bool _3536 = !_3534;
        if (!_3536)
        {
            float _3538 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[2606]);
            float _3540 = precise::max(_3538, 0.001000000047497451305389404296875);
            float _3542 = -_3462;
            float _3544 = _3542 + _3464;
            float _3546 = 1.0 / _3540;
            float _3548 = _3544 * 2000.0;
            float _3550 = _3548 * _3546;
            float _3552 = precise::clamp(_3550, 0.0, 1.0);
            _3528 = _3552;
            _3512 = _3540;
            _3554 = true;
        }
        else
        {
            float _3556 = -_3464;
            float _3558 = _3556 + _3530;
            float _3560 = _3558 * 10000.0;
            float _3562 = precise::clamp(_3560, 0.0, 1.0);
            float _3564 = -_3562;
            float _3566 = _3564 + 1.0;
            _3528 = _3566;
        }
    }
    _3554 = false;
    float _3568 = _3528;
    float _3570 = _3512;
    float _3572 = _3516 * _3568;
    float _3574 = _3520 * _3568;
    bool _3576 = !_532;
    float _3578 = _3570;
    float _3580 = _3568;
    float _3652;
    float _3654;
    if (!_3576)
    {
        float _3582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3584 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3586 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3588 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3594 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3596 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3598 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3600 = _3586 * _3588;
        float _3602 = _3586 * _3590;
        float _3604 = -_3600;
        float _3606 = fma(_3582, _3592, _3604);
        float _3608 = _3584 * _3588;
        float _3610 = -_3602;
        float _3612 = fma(_3584, _3592, _3610);
        float _3614 = _3606 * _3596;
        float _3616 = -_3608;
        float _3618 = fma(_3582, _3590, _3616);
        float _3620 = _3582 * _3596;
        float _3622 = -_3614;
        float _3624 = fma(_3612, _3594, _3622);
        float _3626 = -_3620;
        float _3628 = fma(_3584, _3594, _3626);
        float _3630 = fma(_3618, _3598, _3624);
        float _3632 = _3584 * _3598;
        float _3634 = -_3632;
        float _3636 = fma(_3586, _3596, _3634);
        float _3638 = 1.0 / _3630;
        float _3640 = _3574 * _3638;
        float _3642 = _3572 * _3638;
        float _3644 = _3636 * _3640;
        float _3646 = _3628 * _3640;
        float _3648 = fma(_3612, _3642, _3644);
        float _3650 = fma(_3618, _3642, _3646);
        _3522 = _3628;
        _3652 = _3648;
        _3654 = _3650;
        _3656 = true;
    }
    else
    {
        bool _3658 = _3104 != 0;
        bool _3660 = _3132 != 0;
        bool _3662 = _3660 || _3658;
        if (!_3662)
        {
            _3578 = _3572;
        }
        float _3664 = _3578;
        _3652 = _3664;
        if (!_3662)
        {
            _3580 = _3574;
        }
        float _3666 = _3580;
        bool _3668 = !_3662;
        _3654 = _3666;
        if (!_3668)
        {
            uint _3670 = uint(int(uint(_166) >> uint(2)));
            float _3672 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_3670)]);
            int _3674 = _166 + 4;
            uint _3676 = uint(int(uint(_3674) >> uint(2)));
            float _3678 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_3676)]);
            int _3680 = _166 + 8;
            uint _3682 = uint(int(uint(_3680) >> uint(2)));
            float _3684 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_3682)]);
            uint _3686 = uint(int(uint(_166) >> uint(2)));
            float _3688 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3686)]);
            int _3690 = _166 + 4;
            uint _3692 = uint(int(uint(_3690) >> uint(2)));
            float _3694 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3692)]);
            int _3696 = _166 + 8;
            uint _3698 = uint(int(uint(_3696) >> uint(2)));
            float _3700 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3698)]);
            uint _3702 = uint(int(uint(_166) >> uint(2)));
            float _3704 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3702)]);
            int _3706 = _166 + 4;
            uint _3708 = uint(int(uint(_3706) >> uint(2)));
            float _3710 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3708)]);
            int _3712 = _166 + 8;
            uint _3714 = uint(int(uint(_3712) >> uint(2)));
            float _3716 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3714)]);
            float _3718 = _3684 * _3688;
            float _3720 = _3684 * _3694;
            float _3722 = -_3718;
            float _3724 = fma(_3672, _3700, _3722);
            float _3726 = _3678 * _3688;
            float _3728 = -_3720;
            float _3730 = fma(_3678, _3700, _3728);
            float _3732 = _3724 * _3710;
            float _3734 = -_3726;
            float _3736 = fma(_3672, _3694, _3734);
            float _3738 = _3672 * _3710;
            float _3740 = -_3732;
            float _3742 = fma(_3730, _3704, _3740);
            float _3744 = -_3738;
            float _3746 = fma(_3678, _3704, _3744);
            float _3748 = fma(_3736, _3716, _3742);
            float _3750 = _3678 * _3716;
            float _3752 = -_3750;
            float _3754 = fma(_3684, _3710, _3752);
            float _3756 = 1.0 / _3748;
            float _3758 = _3574 * _3756;
            float _3760 = _3572 * _3756;
            float _3762 = _3754 * _3758;
            float _3764 = _3746 * _3758;
            float _3766 = fma(_3730, _3760, _3762);
            float _3768 = fma(_3736, _3760, _3764);
            _3522 = _3746;
            _3652 = _3766;
            _3654 = _3768;
        }
    }
    _3656 = false;
    float _3770 = _3522;
    float _3772 = _3652;
    float _3774 = _3654;
    bool _3776 = _3462 != 0.0;
    bool _3778 = isnan(_3462);
    bool _3780 = _3776 || _3778;
    bool _3782 = isnan(0.0);
    bool _3784 = _3780 || _3782;
    float _3786 = _3770;
    if (!_3784)
    {
        _3786 = 4.0;
    }
    float _3788 = _3786;
    float _3790 = _3464;
    if (!_3784)
    {
        float2 _9294 = float2(_3454, _3456);
        float _3792 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9294, float2(0.0), isnan(_9294)), level(_3788)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9294, float2(0.0), isnan(_9294)), level(_3788)).y;
        _3790 = _3792;
    }
    float _3794 = _3790;
    float _3796 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[76]);
    int _3798 = _166 + 4;
    float _3800 = -_252;
    float _3802 = _3800 + _3308;
    float _3804 = -_258;
    float _3806 = _3804 + _3304;
    float _3808 = -_264;
    float _3810 = _3808 + _3306;
    int _3812 = _166 + 8;
    float _3814 = _3806 * _3806;
    float _3816 = fma(_3802, _3802, _3814);
    float _3818 = fma(_3810, _3810, _3816);
    float _3820 = fma(_3794, 2000.0, _3796);
    uint _3822 = uint(int(uint(_3798) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_3822)] = as_type<uint>(_3820);
    uint _3824 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3824)] = as_type<uint>(_3478);
    uint _3826 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3826)] = as_type<uint>(_3308);
    uint _3828 = uint(int(uint(_3798) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3828)] = as_type<uint>(_3304);
    uint _3830 = uint(int(uint(_3812) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3830)] = as_type<uint>(_3306);
    uint _3832 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3832)] = as_type<uint>(_3772);
    uint _3834 = uint(int(uint(_3798) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3834)] = as_type<uint>(_424);
    uint _3836 = uint(int(uint(_3812) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3836)] = as_type<uint>(_3774);
    uint _3838 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3838)] = as_type<uint>(_3802);
    uint _3840 = uint(int(uint(_3798) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3840)] = as_type<uint>(_3806);
    uint _3842 = uint(int(uint(_3812) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_3842)] = as_type<uint>(_3810);
    float _3844 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3846 = sqrt(_3818);
    float _3848 = _424 * _424;
    float _3850 = fma(_3772, _3772, _3848);
    float _3852 = fma(_3774, _3774, _3850);
    float _3854 = sqrt(_3852);
    bool _3856 = _3846 >= 9.9999999747524270787835121154785e-07;
    bool _3858 = isnan(_3846);
    bool _3860 = _3856 || _3858;
    bool _3862 = isnan(9.9999999747524270787835121154785e-07);
    bool _3864 = _3860 || _3862;
    float _3866 = _3852;
    if (!_3864)
    {
        bool _3868 = _168 != _176;
        bool _3870 = isnan(_168);
        bool _3872 = _3868 || _3870;
        bool _3874 = isnan(_176);
        bool _3876 = _3872 || _3874;
        _3878 = _3876;
        if (!_3878)
        {
            float _3880 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3882 = _3880 > 0.0;
            bool _3884 = !_3882;
            if (!_3884)
            {
                float _3886 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3888 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3890 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3892 = _3888 * _3888;
                float _3894 = fma(_3886, _3886, _3892);
                float _3896 = fma(_3890, _3890, _3894);
                float _3898 = rsqrt(_3896);
                float _3900 = _3898 * 9.9999999747524270787835121154785e-07;
                float _3902 = _3886 * _3900;
                float _3904 = _3888 * _3900;
                float _3906 = _3890 * _3900;
                _458 = as_type<int>(_3902);
                _460 = as_type<int>(_3904);
                _462 = as_type<int>(_3906);
                _3878 = true;
            }
            else
            {
                bool _3908 = _3854 >= 9.9999999747524270787835121154785e-07;
                bool _3910 = isnan(_3854);
                bool _3912 = _3908 || _3910;
                bool _3914 = isnan(9.9999999747524270787835121154785e-07);
                bool _3916 = _3912 || _3914;
                if (!_3916)
                {
                    float _3918 = _3304 * _3304;
                    float _3920 = fma(_3308, _3308, _3918);
                    float _3922 = fma(_3306, _3306, _3920);
                    float _3924 = sqrt(_3922);
                    bool _3926 = _3924 >= 9.9999999747524270787835121154785e-07;
                    bool _3928 = isnan(_3924);
                    bool _3930 = _3926 || _3928;
                    bool _3932 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3934 = _3930 || _3932;
                    int _3936 = as_type<int>(_242);
                    int _3938 = as_type<int>(_3924);
                    if (_3934)
                    {
                        float _3940 = rsqrt(_3922);
                        _3936 = as_type<int>(_3940);
                    }
                    int _3942 = _3936;
                    if (!_3934)
                    {
                        _3938 = 0;
                    }
                    int _3944 = _3938;
                    int _3946 = _3944;
                    if (!_3934)
                    {
                        _452 = 897988541;
                    }
                    int _3948 = _452;
                    int _3950 = _3942;
                    int _3952 = _3948;
                    if (_3934)
                    {
                        float _3954 = as_type<float>(_3942) * 9.9999999747524270787835121154785e-07;
                        _3866 = _3954;
                    }
                    float _3956 = _3866;
                    if (!_3934)
                    {
                        _3950 = 0;
                    }
                    int _3958 = _3950;
                    int _3960 = _3958;
                    if (_3934)
                    {
                        float _3962 = _3308 * _3956;
                        _3946 = as_type<int>(_3962);
                    }
                    int _3964 = _3946;
                    _458 = _3964;
                    if (_3934)
                    {
                        float _3966 = _3304 * _3956;
                        _3952 = as_type<int>(_3966);
                    }
                    int _3968 = _3952;
                    _460 = _3968;
                    if (_3934)
                    {
                        float _3970 = _3306 * _3956;
                        _3960 = as_type<int>(_3970);
                    }
                    int _3972 = _3960;
                    _462 = _3972;
                    _3878 = true;
                }
                else
                {
                    float _3974 = rsqrt(_3852);
                    float _3976 = _3974 * 9.9999999747524270787835121154785e-07;
                    float _3978 = _3772 * _3976;
                    float _3980 = _424 * _3976;
                    float _3982 = _3774 * _3976;
                    _458 = as_type<int>(_3978);
                    _460 = as_type<int>(_3980);
                    _462 = as_type<int>(_3982);
                    _3878 = true;
                }
            }
        }
    }
    else
    {
        float _3984 = _3854 * _3844;
        bool _3986 = _3984 >= 0.001000000047497451305389404296875;
        bool _3988 = isnan(_3984);
        bool _3990 = _3986 || _3988;
        bool _3992 = isnan(0.001000000047497451305389404296875);
        bool _3994 = _3990 || _3992;
        bool _3996 = _3984 > 0.0;
        bool _3998 = !_3994;
        bool _4000 = _3996 && _3998;
        bool _4002 = _3846 < 0.001000000047497451305389404296875;
        bool _4004 = _4002 && _4000;
        int _4006 = as_type<int>(_3984);
        if (!_4004)
        {
            _4006 = as_type<int>(_3802);
        }
        int _4008 = _4006;
        int _4010 = _4008;
        if (_4004)
        {
            float _4012 = _3844 * _3772;
            _4010 = as_type<int>(_4012);
        }
        int _4014 = _4010;
        _458 = _4014;
        if (!_4004)
        {
            _454 = as_type<int>(_3806);
        }
        int _4016 = _454;
        int _4018 = _4016;
        if (_4004)
        {
            float _4020 = _424 * _3844;
            _4018 = as_type<int>(_4020);
        }
        int _4022 = _4018;
        _460 = _4022;
        if (!_4004)
        {
            _456 = as_type<int>(_3810);
        }
        int _4024 = _456;
        _462 = _4024;
        if (_4004)
        {
            float _4026 = _3844 * _3774;
            _462 = as_type<int>(_4026);
        }
    }
    _3878 = false;
    int _4028 = _458;
    int _4030 = _460;
    int _4032 = _462;
    uint _4034 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4034)] = uint(_4028);
    uint _4036 = uint(int(uint(_3798) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4036)] = uint(_4030);
    uint _4038 = uint(int(uint(_3812) >> uint(2)));
    (*spvDescriptorSet0.cp_s7)._m0[int(_4038)] = uint(_4032);
}

