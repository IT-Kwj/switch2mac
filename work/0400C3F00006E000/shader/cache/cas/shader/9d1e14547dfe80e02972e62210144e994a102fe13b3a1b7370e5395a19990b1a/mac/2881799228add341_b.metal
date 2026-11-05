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
    bool _2712 = false;
    bool _2548 = false;
    bool _1784 = false;
    bool _830 = false;
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
    int _204 = _164 + 12;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    uint _210 = uint(int(uint(_164) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_210)]);
    int _214 = _164 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    int _220 = _164 + 8;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_222)]);
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = 0.0;
    bool _232 = _184;
    float _234 = _162;
    if (_184)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _226 = _236;
        _228 = _238;
        _230 = _240;
    }
    float _242 = _226;
    float _244 = _228;
    float _246 = _230;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = 0.0;
    if (_184)
    {
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _248 = _254;
        _250 = _256;
        _252 = _258;
    }
    float _260 = _248;
    float _262 = _250;
    float _264 = _252;
    float _266 = as_type<float>(_152);
    float _268 = _154;
    float _270 = _156;
    if (_184)
    {
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _266 = _272;
        _268 = _274;
        _270 = _276;
    }
    float _278 = _266;
    float _280 = _268;
    float _282 = _270;
    uint _284 = uint(int(uint(_164) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_284)]);
    uint _288 = uint(int(uint(_186) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_288)]);
    uint _292 = uint(int(uint(_186) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_292)]);
    float _296 = _260;
    float _298 = _262;
    float _300 = _264;
    float _302 = _242;
    float _304 = _208;
    float _306 = _244;
    float _308 = _246;
    float _310 = _278;
    float _312 = _280;
    float _314 = _282;
    float _316 = _202;
    float _318 = _190;
    int _320 = as_type<int>(_212);
    int _322 = as_type<int>(_218);
    int _324 = as_type<int>(_224);
    int _326 = as_type<int>(_212);
    int _328 = as_type<int>(_218);
    int _330 = as_type<int>(_224);
    int _332 = as_type<int>(_212);
    int _334 = as_type<int>(_218);
    int _336 = as_type<int>(_224);
    if (!_184)
    {
        int _338 = _164 + 4;
        uint _340 = uint(int(uint(_164) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        int _344 = _164 + 8;
        uint _346 = uint(int(uint(_164) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_338) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_338) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_344) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_164) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_344) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_366)]);
        uint _370 = uint(int(uint(_338) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        uint _374 = uint(int(uint(_344) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_374)]);
        float _378 = _342 * _342;
        float _380 = fma(_348, _348, _378);
        float _382 = _352 * _352;
        float _384 = fma(_356, _356, _382);
        float _386 = _360 * _360;
        float _388 = fma(_364, _364, _380);
        float _390 = fma(_368, _368, _386);
        float _392 = sqrt(_388);
        float _394 = fma(_372, _372, _384);
        float _396 = fma(_376, _376, _390);
        float _398 = sqrt(_394);
        float _400 = sqrt(_396);
        bool _402 = _392 > 0.0;
        bool _404 = _398 > 0.0;
        bool _406 = _400 > 0.0;
        float _408 = _398;
        float _410 = _400;
        float _412 = _390;
        float _414 = _342;
        float _416 = _392;
        float _418 = _348;
        float _420 = _384;
        float _422 = _352;
        float _424 = _372;
        float _426 = _364;
        _304 = _396;
        if (_402)
        {
            float _428 = rsqrt(_388);
            _408 = _428;
        }
        float _430 = _408;
        float _432 = 0.0;
        if (_404)
        {
            float _434 = rsqrt(_394);
            _432 = _434;
        }
        float _436 = _432;
        float _438 = 0.0;
        if (_406)
        {
            float _440 = rsqrt(_396);
            _438 = _440;
        }
        float _442 = _438;
        if (!_402)
        {
            _410 = 0.0;
        }
        float _444 = _410;
        float _446 = _444;
        if (_402)
        {
            float _448 = _342 * _430;
            _446 = _448;
        }
        float _450 = _446;
        _296 = _450;
        if (!_402)
        {
            _412 = 0.0;
        }
        float _452 = _412;
        float _454 = _452;
        if (_402)
        {
            float _456 = _348 * _430;
            _454 = _456;
        }
        float _458 = _454;
        _302 = _458;
        if (!_402)
        {
            _414 = 0.0;
        }
        float _460 = _414;
        float _462 = _460;
        if (_402)
        {
            float _464 = _364 * _430;
            _462 = _464;
        }
        float _466 = _462;
        _310 = _466;
        if (!_404)
        {
            _416 = 0.0;
        }
        float _468 = _416;
        float _470 = _468;
        if (_404)
        {
            float _472 = _352 * _436;
            _470 = _472;
        }
        float _474 = _470;
        _298 = _474;
        if (!_404)
        {
            _418 = 0.0;
        }
        float _476 = _418;
        float _478 = _476;
        if (_404)
        {
            float _480 = _372 * _436;
            _478 = _480;
        }
        float _482 = _478;
        _312 = _482;
        if (!_404)
        {
            _420 = 0.0;
        }
        float _484 = _420;
        float _486 = _484;
        if (_404)
        {
            float _488 = _356 * _436;
            _486 = _488;
        }
        float _490 = _486;
        _306 = _490;
        if (!_406)
        {
            _422 = 0.0;
        }
        float _492 = _422;
        float _494 = _492;
        if (!_406)
        {
            _424 = 0.0;
        }
        float _496 = _424;
        float _498 = _496;
        if (_406)
        {
            float _500 = _360 * _442;
            _494 = _500;
        }
        float _502 = _494;
        _300 = _502;
        if (!_406)
        {
            _426 = 0.0;
        }
        float _504 = _426;
        _314 = _504;
        if (_406)
        {
            float _506 = _368 * _442;
            _498 = _506;
        }
        float _508 = _498;
        _308 = _508;
        if (_406)
        {
            float _510 = _376 * _442;
            _314 = _510;
        }
    }
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = _310;
    float _528 = _312;
    float _530 = _314;
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    uint _560 = uint(int(uint(_186) >> uint(2)));
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_560)]);
    bool _564 = _534 > 0.0;
    float _566 = abs(_532);
    float _568 = log2(_566);
    bool _570 = _536 > 0.0;
    float _572 = 0.0;
    float _574 = _540;
    float _576 = _520;
    float _578 = _542;
    float _580 = _546;
    float _582 = _548;
    float _584 = _552;
    float _586 = _554;
    float _588 = _558;
    if (_564)
    {
        float _590 = 1.0 / _534;
        _572 = _590;
    }
    float _592 = _572;
    float _594 = -_294;
    float _596 = _538 + _594;
    float _598 = _540 * _536;
    float _600 = _544 * _550;
    if (_570)
    {
        float _602 = -_598;
        float _604 = fma(_286, _602, _540);
        _574 = _604;
    }
    float _606 = _574;
    float _608 = _542 * _550;
    float _610 = _600 * _512;
    float _612 = _606;
    float _614 = _592;
    if (_564)
    {
        float _616 = _596 * _592;
        _576 = _616;
    }
    float _618 = _576;
    float _620 = _552 * _568;
    float _622 = _600 * _514;
    float _624 = _600 * _516;
    float _626 = exp2(_620);
    float _628 = _546 * _550;
    float _630 = fma(_608, _518, _610);
    if (_564)
    {
        float _632 = precise::min(_618, 1.0);
        _578 = _632;
    }
    float _634 = _578;
    float _636 = fma(_608, _522, _622);
    float _638 = fma(_608, _524, _624);
    float _640 = fma(_628, _526, _630);
    float _642 = fma(_628, _528, _636);
    float _644 = _634;
    float _646 = _636;
    if (_564)
    {
        float _648 = _634 * _606;
        _612 = _648;
    }
    float _650 = _612;
    float _652 = fma(_628, _530, _638);
    float _654 = _552 * _640;
    float _656 = _290 * _552;
    float _658 = _552 * _642;
    float _660 = _552 * _650;
    float _662 = _552 * _652;
    float _664 = fma(_190, _626, _654);
    float _666 = fma(_190, _656, _168);
    float _668 = fma(_196, _626, _658);
    float _670 = fma(_196, _656, _174);
    float _672 = fma(_202, _656, _180);
    float _674 = fma(_202, _626, _662);
    float _676 = _554 * _660;
    float _678 = _556 * _660;
    float _680 = _558 * _660;
    bool _682 = !_184;
    float _684 = _676;
    float _686 = _660;
    float _688 = _662;
    float _690 = _678;
    float _692 = _668;
    float _694 = _678;
    float _696 = _670;
    float _698 = _664;
    float _700 = _674;
    float _822;
    float _824;
    float _826;
    float _828;
    if (!_682)
    {
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _720 = _706 * _708;
        float _722 = _706 * _710;
        float _724 = _704 * _708;
        float _726 = -_720;
        float _728 = fma(_702, _712, _726);
        float _730 = -_722;
        float _732 = fma(_704, _712, _730);
        float _734 = -_724;
        float _736 = fma(_702, _710, _734);
        float _738 = _716 * _702;
        float _740 = _716 * _728;
        float _742 = _718 * _704;
        float _744 = _714 * _710;
        float _746 = -_738;
        float _748 = fma(_714, _704, _746);
        float _750 = -_740;
        float _752 = fma(_714, _732, _750);
        float _754 = _718 * _708;
        float _756 = _716 * _712;
        float _758 = _714 * _706;
        float _760 = fma(_718, _736, _752);
        float _762 = -_754;
        float _764 = fma(_714, _712, _762);
        float _766 = -_756;
        float _768 = fma(_718, _710, _766);
        float _770 = -_744;
        float _772 = fma(_716, _708, _770);
        float _774 = -_758;
        float _776 = fma(_718, _702, _774);
        float _778 = -_702;
        float _780 = fma(_778, _712, _720);
        float _782 = 1.0 / _760;
        float _784 = -_742;
        float _786 = fma(_716, _706, _784);
        float _788 = _764 * _782;
        float _790 = _768 * _782;
        float _792 = _772 * _782;
        float _794 = _780 * _782;
        float _796 = _678 * _788;
        float _798 = _678 * _790;
        float _800 = _678 * _792;
        float _802 = _676 * _782;
        float _804 = _776 * _782;
        float _806 = fma(_676, _794, _796);
        float _808 = _786 * _782;
        float _810 = _748 * _782;
        float _812 = fma(_732, _802, _798);
        float _814 = fma(_736, _802, _800);
        float _816 = fma(_680, _804, _806);
        float _818 = fma(_680, _808, _812);
        float _820 = fma(_680, _810, _814);
        _822 = _816;
        _684 = _818;
        _824 = _820;
        _686 = _812;
        _644 = _786;
        _688 = _736;
        _580 = _814;
        _582 = _788;
        _584 = _714;
        _234 = _716;
        _646 = _718;
        _826 = _782;
        _586 = _796;
        _588 = _802;
        _614 = _748;
        _828 = _804;
        _830 = true;
    }
    else
    {
        int _832 = as_type<int>(_162) & 1024;
        bool _834 = _832 != 0;
        if (_834)
        {
            _232 = true;
        }
        bool _836 = _232;
        bool _838 = _836;
        if (!_834)
        {
            int _840 = as_type<int>(_162) & 2048;
            bool _842 = _840 != 0;
            _838 = _842;
        }
        bool _844 = _838;
        if (!_844)
        {
            _316 = _678;
        }
        float _846 = _316;
        _822 = _846;
        if (!_844)
        {
            _318 = _680;
        }
        float _848 = _318;
        bool _850 = !_844;
        _824 = _848;
        _826 = 0.0;
        _828 = 0.0;
        if (!_850)
        {
            uint _852 = uint(int(uint(_164) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_852)]);
            int _856 = _164 + 4;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_858)]);
            int _862 = _164 + 8;
            uint _864 = uint(int(uint(_862) >> uint(2)));
            float _866 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_864)]);
            uint _868 = uint(int(uint(_164) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_868)]);
            int _872 = _164 + 4;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_874)]);
            int _878 = _164 + 8;
            uint _880 = uint(int(uint(_878) >> uint(2)));
            float _882 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_880)]);
            uint _884 = uint(int(uint(_164) >> uint(2)));
            float _886 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_884)]);
            int _888 = _164 + 4;
            uint _890 = uint(int(uint(_888) >> uint(2)));
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_890)]);
            int _894 = _164 + 8;
            uint _896 = uint(int(uint(_894) >> uint(2)));
            float _898 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_896)]);
            float _900 = _866 * _870;
            float _902 = _866 * _876;
            float _904 = _860 * _870;
            float _906 = -_900;
            float _908 = fma(_854, _882, _906);
            float _910 = -_902;
            float _912 = fma(_860, _882, _910);
            float _914 = -_904;
            float _916 = fma(_854, _876, _914);
            float _918 = _892 * _854;
            float _920 = _892 * _908;
            float _922 = _898 * _860;
            float _924 = _886 * _876;
            float _926 = -_918;
            float _928 = fma(_886, _860, _926);
            float _930 = -_920;
            float _932 = fma(_886, _912, _930);
            float _934 = _898 * _870;
            float _936 = _892 * _882;
            float _938 = _886 * _866;
            float _940 = fma(_898, _916, _932);
            float _942 = -_934;
            float _944 = fma(_886, _882, _942);
            float _946 = -_936;
            float _948 = fma(_898, _876, _946);
            float _950 = -_924;
            float _952 = fma(_892, _870, _950);
            float _954 = -_938;
            float _956 = fma(_898, _854, _954);
            float _958 = -_854;
            float _960 = fma(_958, _882, _900);
            float _962 = 1.0 / _940;
            float _964 = -_922;
            float _966 = fma(_892, _866, _964);
            float _968 = _944 * _962;
            float _970 = _948 * _962;
            float _972 = _952 * _962;
            float _974 = _960 * _962;
            float _976 = _678 * _968;
            float _978 = _678 * _970;
            float _980 = _678 * _972;
            float _982 = _676 * _962;
            float _984 = _956 * _962;
            float _986 = fma(_676, _974, _976);
            float _988 = _966 * _962;
            float _990 = _928 * _962;
            float _992 = fma(_912, _982, _978);
            float _994 = fma(_916, _982, _980);
            float _996 = fma(_680, _984, _986);
            float _998 = fma(_680, _988, _992);
            float _1000 = fma(_680, _990, _994);
            _822 = _996;
            _684 = _998;
            _824 = _1000;
            _686 = _992;
            _644 = _966;
            _688 = _916;
            _580 = _994;
            _582 = _968;
            _584 = _886;
            _234 = _892;
            _646 = _898;
            _826 = _962;
            _586 = _976;
            _588 = _982;
            _614 = _928;
            _828 = _984;
        }
    }
    _830 = false;
    float _1002 = _822;
    float _1004 = _684;
    float _1006 = _824;
    float _1008 = _686;
    float _1010 = _644;
    float _1012 = _688;
    float _1014 = _580;
    float _1016 = _582;
    float _1018 = _584;
    float _1020 = _234;
    float _1022 = _646;
    float _1024 = _826;
    float _1026 = _586;
    float _1028 = _588;
    float _1030 = _614;
    float _1032 = _828;
    uint _1034 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1034)] = as_type<uint>(_562);
    float _1036 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    bool _1038 = _668 >= 0.0;
    bool _1040 = isnan(_668);
    bool _1042 = _1038 || _1040;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    float _1048 = _670 + _1002;
    float _1050 = _666 + _1004;
    float _1052 = _672 + _1006;
    int _1054 = as_type<int>(_1036) & 512;
    bool _1056 = _1054 != 0;
    int _1058 = as_type<int>(_1036) & 1024;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>(_1036) & 2048;
    bool _1064 = _1062 != 0;
    float _1066 = _1026;
    float _1068 = _1028;
    float _1070 = _1018;
    float _1072 = _1020;
    float _1074 = _1022;
    float _1076 = _1024;
    float _1078 = _1010;
    float _1080 = _1012;
    float _1082 = _1014;
    float _1084 = _1016;
    float _1086 = _1030;
    float _1088 = _1032;
    float _1090 = 0.0;
    float _1092 = _1048;
    float _1094 = _1006;
    float _1096 = _1004;
    float _1098 = _1028;
    float _1100 = _1002;
    float _1102 = _1026;
    float _1104 = _1036;
    if (!_1046)
    {
        float _1106 = _1006;
        float _1108 = _1036;
        float _1110 = _1002;
        float _1112 = _1008;
        if (_1056)
        {
            float _1114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1106 = _1114;
            _1108 = _1116;
            _1110 = _1118;
            _1112 = _1120;
        }
        float _1122 = _1106;
        float _1124 = _1108;
        float _1126 = _1110;
        float _1128 = _1112;
        float _1130 = _1010;
        float _1132 = _1012;
        float _1134 = _1014;
        float _1136 = _1016;
        if (_1056)
        {
            float _1138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1140 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1142 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1144 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1130 = _1138;
            _1132 = _1140;
            _1134 = _1142;
            _1136 = _1144;
        }
        float _1146 = _1130;
        float _1148 = _1132;
        float _1150 = _1134;
        float _1152 = _1136;
        float _1154 = _1018;
        float _1156 = _1020;
        float _1158 = _1022;
        float _1160 = _1024;
        if (_1056)
        {
            float _1162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1154 = _1162;
            _1156 = _1164;
            _1158 = _1166;
            _1160 = _1168;
        }
        float _1170 = _1154;
        float _1172 = _1156;
        float _1174 = _1158;
        float _1176 = _1160;
        float _1178 = _1122;
        float _1180 = _1126;
        float _1182 = _1124;
        if (_1056)
        {
            float _1184 = _1048 * _1124;
            _1066 = _1184;
        }
        float _1186 = _1066;
        float _1188 = _1148;
        float _1190 = _1186;
        float _1192 = _1146;
        if (_1056)
        {
            float _1194 = _1048 * _1148;
            _1188 = _1194;
        }
        float _1196 = _1188;
        if (_1056)
        {
            float _1198 = fma(_1050, _1122, _1186);
            _1178 = _1198;
        }
        float _1200 = _1178;
        float _1202 = _1172;
        float _1204 = _1174;
        float _1206 = _1200;
        float _1208 = _1170;
        float _1210 = _1176;
        if (_1056)
        {
            float _1212 = _1048 * _1172;
            _1202 = _1212;
        }
        float _1214 = _1202;
        float _1216 = _1214;
        if (_1056)
        {
            float _1218 = fma(_1050, _1146, _1196);
            _1190 = _1218;
        }
        float _1220 = _1190;
        float _1222 = _1220;
        if (_1056)
        {
            float _1224 = fma(_1050, _1170, _1214);
            _1216 = _1224;
        }
        float _1226 = _1216;
        float _1228 = _1226;
        if (_1056)
        {
            float _1230 = fma(_1052, _1150, _1220);
            _1222 = _1230;
        }
        float _1232 = _1222;
        float _1234 = _1232;
        if (_1056)
        {
            float _1236 = fma(_1052, _1126, _1200);
            _1180 = _1236;
        }
        float _1238 = _1180;
        float _1240 = _1238;
        if (_1056)
        {
            float _1242 = fma(_1052, _1174, _1226);
            _1204 = _1242;
        }
        float _1244 = _1204;
        float _1246 = _1244;
        if (!_1056)
        {
            _1206 = 0.0;
            _1182 = 0.0;
        }
        float _1248 = _1206;
        float _1250 = _1182;
        float _1252 = _1248;
        float _1254 = _1250;
        if (!_1056)
        {
            _1192 = 0.0;
        }
        float _1256 = _1192;
        float _1258 = _1256;
        if (_1056)
        {
            float _1260 = _1152 + _1232;
            _1252 = _1260;
        }
        float _1262 = _1252;
        float _1264 = _1262;
        if (_1056)
        {
            float _1266 = _1128 + _1238;
            _1254 = _1266;
        }
        float _1268 = _1254;
        float _1270 = _1268;
        if (_1056)
        {
            float _1272 = _1176 + _1244;
            _1258 = _1272;
        }
        float _1274 = _1258;
        bool _1276 = !_1060;
        float _1278 = _1274;
        _1084 = 6.2500002968590706586837768554688e-05;
        if (!_1276)
        {
            float _1280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _1282 = uint(int(uint(_164) >> uint(2)));
            float _1284 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1282)]);
            int _1286 = _164 + 4;
            uint _1288 = uint(int(uint(_1286) >> uint(2)));
            float _1290 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1288)]);
            int _1292 = _164 + 8;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1294)]);
            uint _1298 = uint(int(uint(_164) >> uint(2)));
            float _1300 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1298)]);
            int _1302 = _164 + 4;
            uint _1304 = uint(int(uint(_1302) >> uint(2)));
            float _1306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1304)]);
            int _1308 = _164 + 8;
            uint _1310 = uint(int(uint(_1308) >> uint(2)));
            float _1312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1310)]);
            uint _1314 = uint(int(uint(_164) >> uint(2)));
            float _1316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1314)]);
            int _1318 = _164 + 4;
            uint _1320 = uint(int(uint(_1318) >> uint(2)));
            float _1322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1320)]);
            int _1324 = _164 + 8;
            uint _1326 = uint(int(uint(_1324) >> uint(2)));
            float _1328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1326)]);
            int _1330 = _164 + 12;
            uint _1332 = uint(int(uint(_1330) >> uint(2)));
            float _1334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1332)]);
            float _1336 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1340 = _1048 * _1290;
            float _1342 = _1048 * _1306;
            float _1344 = fma(_1050, _1284, _1340);
            float _1346 = _1048 * _1322;
            float _1348 = fma(_1050, _1300, _1342);
            float _1350 = fma(_1050, _1316, _1346);
            float _1352 = fma(_1052, _1296, _1344);
            float _1354 = fma(_1052, _1312, _1348);
            float _1356 = fma(_1052, _1328, _1350);
            float _1358 = _1280 + _1352;
            float _1360 = _1336 + _1354;
            float _1362 = _1338 + _1356;
            _1264 = _1362;
            _1270 = _1358;
            _1240 = _1296;
            _1208 = _1316;
            _1228 = _1350;
            _1246 = _1356;
            _1210 = _1334;
            _1278 = _1360;
            _1068 = _1312;
            _1234 = _1300;
        }
        float _1364 = _1264;
        float _1366 = _1270;
        float _1368 = _1240;
        float _1370 = _1208;
        float _1372 = _1228;
        float _1374 = _1246;
        float _1376 = _1210;
        float _1378 = _1278;
        float _1380 = _1068;
        float _1382 = _1234;
        bool _1384 = !_1064;
        float _1386 = _1366;
        float _1388 = _1364;
        float _1390 = _1378;
        float _1392 = 0.0;
        float _1394 = _1370;
        float _1396 = _1372;
        float _1398 = _1374;
        float _1400 = _1376;
        float _1402 = _1368;
        float _1404 = _1382;
        _1098 = _1380;
        if (!_1384)
        {
            uint _1406 = uint(int(uint(_164) >> uint(2)));
            float _1408 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1406)]);
            int _1410 = _164 + 4;
            uint _1412 = uint(int(uint(_1410) >> uint(2)));
            float _1414 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1412)]);
            int _1416 = _164 + 8;
            uint _1418 = uint(int(uint(_1416) >> uint(2)));
            float _1420 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1418)]);
            int _1422 = _164 + 12;
            uint _1424 = uint(int(uint(_1422) >> uint(2)));
            float _1426 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1424)]);
            uint _1428 = uint(int(uint(_164) >> uint(2)));
            float _1430 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1428)]);
            int _1432 = _164 + 4;
            uint _1434 = uint(int(uint(_1432) >> uint(2)));
            float _1436 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1434)]);
            int _1438 = _164 + 8;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            float _1442 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1440)]);
            int _1444 = _164 + 12;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            float _1448 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1446)]);
            uint _1450 = uint(int(uint(_164) >> uint(2)));
            float _1452 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1450)]);
            int _1454 = _164 + 4;
            uint _1456 = uint(int(uint(_1454) >> uint(2)));
            float _1458 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1456)]);
            int _1460 = _164 + 8;
            uint _1462 = uint(int(uint(_1460) >> uint(2)));
            float _1464 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1462)]);
            int _1466 = _164 + 12;
            uint _1468 = uint(int(uint(_1466) >> uint(2)));
            float _1470 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1468)]);
            float _1472 = _1048 * _1414;
            float _1474 = _1048 * _1436;
            float _1476 = fma(_1050, _1408, _1472);
            float _1478 = _1048 * _1458;
            float _1480 = fma(_1050, _1430, _1474);
            float _1482 = fma(_1050, _1452, _1478);
            float _1484 = fma(_1052, _1420, _1476);
            float _1486 = fma(_1052, _1442, _1480);
            float _1488 = fma(_1052, _1464, _1482);
            float _1490 = _1484 + _1426;
            float _1492 = _1486 + _1448;
            float _1494 = _1488 + _1470;
            _1386 = _1490;
            _1388 = _1494;
            _1390 = _1492;
            _1392 = _1470;
            _1394 = _1430;
            _1396 = _1480;
            _1398 = _1486;
            _1400 = _1448;
            _690 = _1488;
            _1402 = _1420;
            _1404 = _1472;
        }
        float _1496 = _1386;
        float _1498 = _1388;
        float _1500 = _1390;
        float _1502 = _1392;
        float _1504 = _1394;
        float _1506 = _1396;
        float _1508 = _1398;
        float _1510 = _1400;
        float _1512 = _690;
        float _1514 = _1402;
        float _1516 = _1404;
        float _1518 = fma(_1496, 6.2500002968590706586837768554688e-05, 0.5);
        float _1520 = fma(_1498, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _5010 = float2(_1518, _1520);
        float _1522 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5010, float2(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5010, float2(0.0), isnan(_5010)), level(0.0)).x;
        float _1524 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _1526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _1530 = _1522 * 2000.0;
        float _1532 = -_1524;
        float _1534 = _1532 + _1500;
        float _1536 = _1530 + (-0.300000011920928955078125);
        bool _1538 = _1534 > _1536;
        bool _1540 = _1534 < _1530;
        bool _1542 = _1540 && _1538;
        bool _1544 = !_1542;
        float _1546 = _1518;
        float _1548 = _1522;
        float _1550 = _1512;
        _1070 = _1504;
        _1072 = _1506;
        _1074 = _1508;
        _1076 = _1510;
        _1078 = _1534;
        _1080 = _1530;
        _1082 = _1518;
        _1086 = _1522;
        _1088 = _1520;
        _694 = _1512;
        _1090 = _1502;
        _1094 = _1498;
        _696 = _1528;
        _1096 = _1526;
        _1100 = _1514;
        _1102 = _1516;
        _1104 = _1496;
        if (!_1544)
        {
            float _1552 = fma(_1496, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1554 = fma(_1496, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _1556 = fma(_1498, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1558 = fma(_1498, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _5086 = float2(_1552, _1520);
            float _1560 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5086, float2(0.0), isnan(_5086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5086, float2(0.0), isnan(_5086)), level(0.0)).x;
            float2 _5094 = float2(_1554, _1520);
            float _1562 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5094, float2(0.0), isnan(_5094)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5094, float2(0.0), isnan(_5094)), level(0.0)).x;
            float2 _5102 = float2(_1518, _1556);
            float _1564 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5102, float2(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5102, float2(0.0), isnan(_5102)), level(0.0)).x;
            float2 _5110 = float2(_1518, _1558);
            float _1566 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5110, float2(0.0), isnan(_5110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5110, float2(0.0), isnan(_5110)), level(0.0)).x;
            float2 _5118 = float2(_1552, _1556);
            float _1568 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5118, float2(0.0), isnan(_5118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5118, float2(0.0), isnan(_5118)), level(0.0)).x;
            float2 _5126 = float2(_1552, _1558);
            float _1570 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5126, float2(0.0), isnan(_5126)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5126, float2(0.0), isnan(_5126)), level(0.0)).x;
            float2 _5134 = float2(_1554, _1556);
            float _1572 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5134, float2(0.0), isnan(_5134)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5134, float2(0.0), isnan(_5134)), level(0.0)).x;
            float2 _5142 = float2(_1554, _1558);
            float _1574 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5142, float2(0.0), isnan(_5142)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5142, float2(0.0), isnan(_5142)), level(0.0)).x;
            float _1576 = -_1560;
            float _1578 = _1522 + _1576;
            float _1580 = -_1562;
            float _1582 = _1522 + _1580;
            float _1584 = -_1564;
            float _1586 = _1522 + _1584;
            float _1588 = -_1566;
            float _1590 = _1522 + _1588;
            float _1592 = -_1568;
            float _1594 = _1522 + _1592;
            float _1596 = -_1570;
            float _1598 = _1522 + _1596;
            float _1600 = -_1572;
            float _1602 = _1522 + _1600;
            float _1604 = -_1574;
            float _1606 = _1522 + _1604;
            float _1608 = abs(_1578);
            float _1610 = abs(_1582);
            float _1612 = precise::max(_1608, _1610);
            float _1614 = abs(_1586);
            float _1616 = abs(_1590);
            float _1618 = precise::max(_1614, _1616);
            float _1620 = abs(_1594);
            float _1622 = abs(_1598);
            float _1624 = precise::max(_1620, _1622);
            float _1626 = precise::max(_1612, _1618);
            float _1628 = abs(_1602);
            float _1630 = abs(_1606);
            float _1632 = precise::max(_1628, _1630);
            bool _1634 = _1626 > 0.00150000001303851604461669921875;
            float _1636 = precise::max(_1624, _1632);
            bool _1638 = _1636 <= 0.00150000001303851604461669921875;
            bool _1640 = isnan(_1636);
            bool _1642 = _1638 || _1640;
            bool _1644 = isnan(0.00150000001303851604461669921875);
            bool _1646 = _1642 || _1644;
            bool _1648 = !_1634;
            bool _1650 = _1646 && _1648;
            bool _1652 = !_1650;
            float _1654 = _1632;
            float _1656 = _1582;
            float _1658 = _1560;
            _1070 = _1602;
            _1072 = _1632;
            _1074 = _1612;
            _1076 = _1582;
            _1084 = _1560;
            _1090 = _1564;
            _1094 = _1586;
            _1098 = _1636;
            _1100 = _1552;
            _1102 = _1558;
            _1104 = _1554;
            if (!_1652)
            {
                float _1660 = -_1522;
                float _1662 = _1660 + _1560;
                float _1664 = -_1522;
                float _1666 = _1664 + _1564;
                float _1668 = _1662 * 2000.0;
                float _1670 = _1666 * 2000.0;
                bool _1672 = !_1056;
                _1088 = _1668;
                float _1778;
                float _1780;
                float _1782;
                if (!_1672)
                {
                    float _1674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _1676 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _1678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _1680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _1682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _1684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _1690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _1692 = _1678 * _1680;
                    float _1694 = _1678 * _1682;
                    float _1696 = _1676 * _1680;
                    float _1698 = -_1692;
                    float _1700 = fma(_1674, _1684, _1698);
                    float _1702 = -_1694;
                    float _1704 = fma(_1676, _1684, _1702);
                    float _1706 = -_1696;
                    float _1708 = fma(_1674, _1682, _1706);
                    float _1710 = _1690 * _1676;
                    float _1712 = _1700 * _1688;
                    float _1714 = _1686 * _1678;
                    float _1716 = _1688 * _1674;
                    float _1718 = -_1710;
                    float _1720 = fma(_1688, _1678, _1718);
                    float _1722 = -_1712;
                    float _1724 = fma(_1704, _1686, _1722);
                    float _1726 = _1688 * _1684;
                    float _1728 = -_1714;
                    float _1730 = fma(_1690, _1674, _1728);
                    float _1732 = _1690 * _1680;
                    float _1734 = fma(_1708, _1690, _1724);
                    float _1736 = -_1726;
                    float _1738 = fma(_1690, _1682, _1736);
                    float _1740 = _1686 * _1682;
                    float _1742 = -_1674;
                    float _1744 = fma(_1742, _1684, _1692);
                    float _1746 = -_1732;
                    float _1748 = fma(_1686, _1684, _1746);
                    float _1750 = -_1716;
                    float _1752 = fma(_1686, _1676, _1750);
                    float _1754 = 1.0 / _1734;
                    float _1756 = -_1740;
                    float _1758 = fma(_1688, _1680, _1756);
                    float _1760 = fma(_1668, _1704, _1738);
                    float _1762 = fma(_1668, _1744, _1748);
                    float _1764 = fma(_1668, _1708, _1758);
                    float _1766 = fma(_1670, _1720, _1760);
                    float _1768 = fma(_1670, _1730, _1762);
                    float _1770 = fma(_1670, _1752, _1764);
                    float _1772 = _1754 * _1766;
                    float _1774 = _1754 * _1768;
                    float _1776 = _1754 * _1770;
                    _1778 = _1774;
                    _1780 = _1772;
                    _1782 = _1776;
                    _1654 = _1676;
                    _1656 = _1692;
                    _1546 = _1708;
                    _1658 = _1762;
                    _1548 = _1738;
                    _1550 = _1766;
                    _1784 = true;
                }
                else
                {
                    float _1786 = fma(_1668, _518, _512);
                    float _1788 = fma(_1668, _522, _514);
                    float _1790 = fma(_1668, _524, _516);
                    float _1792 = fma(_1670, _526, _1786);
                    float _1794 = fma(_1670, _528, _1788);
                    float _1796 = fma(_1670, _530, _1790);
                    _1778 = _1794;
                    _1780 = _1792;
                    _1782 = _1796;
                }
                _1784 = false;
                float _1798 = _1778;
                float _1800 = _1780;
                float _1802 = _1782;
                float _1804 = _1654;
                float _1806 = _1656;
                float _1808 = _1546;
                float _1810 = _1658;
                float _1812 = _1548;
                float _1814 = _1550;
                float _1816 = _1798 * _1798;
                float _1818 = -_1534;
                float _1820 = _1818 + _1530;
                float _1822 = fma(_1800, _1800, _1816);
                float _1824 = _1048 + _1820;
                float _1826 = fma(_1802, _1802, _1822);
                float _1828 = rsqrt(_1826);
                float _1830 = _1828 * _1798;
                float _1832 = _1828 * _1800;
                float _1834 = _1828 * _1802;
                float _1836 = _668 * _1830;
                float _1838 = fma(_664, _1832, _1836);
                float _1840 = fma(_674, _1834, _1838);
                float _1842 = _1832 * _1840;
                float _1844 = _1830 * _1840;
                float _1846 = _1834 * _1840;
                float _1848 = -_1842;
                float _1850 = _664 + _1848;
                float _1852 = -_1844;
                float _1854 = _668 + _1852;
                float _1856 = -_1846;
                float _1858 = _674 + _1856;
                float _1860 = _1526 * _1842;
                float _1862 = _1526 * _1844;
                float _1864 = _1526 * _1846;
                float _1866 = -_1860;
                float _1868 = fma(_1528, _1850, _1866);
                float _1870 = -_1862;
                float _1872 = fma(_1528, _1854, _1870);
                float _1874 = -_1864;
                float _1876 = fma(_1528, _1858, _1874);
                _692 = _1872;
                _1070 = _1854;
                _1072 = _1804;
                _1074 = _1858;
                _1076 = _1806;
                _1080 = _1820;
                _1082 = _1808;
                _1084 = _1810;
                _1086 = _1812;
                _694 = _1814;
                _1092 = _1824;
                _1094 = _1846;
                _1098 = _1850;
                _1100 = _1860;
                _1102 = _1844;
                _1104 = _1840;
                _698 = _1868;
                _700 = _1876;
            }
        }
    }
    float _1878 = _692;
    float _1880 = _1070;
    float _1882 = _1072;
    float _1884 = _1074;
    float _1886 = _1076;
    float _1888 = _1078;
    float _1890 = _1080;
    float _1892 = _1082;
    float _1894 = _1084;
    float _1896 = _1086;
    float _1898 = _1088;
    float _1900 = _694;
    float _1902 = _1090;
    float _1904 = _1092;
    float _1906 = _1094;
    float _1908 = _696;
    float _1910 = _1096;
    float _1912 = _1098;
    float _1914 = _1100;
    float _1916 = _1102;
    float _1918 = _1104;
    float _1920 = _698;
    float _1922 = _700;
    bool _1924 = _1878 >= 0.0;
    bool _1926 = isnan(_1878);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.0);
    bool _1932 = _1928 || _1930;
    float _1934 = _1906;
    float _1936 = _1908;
    float _1938 = _1910;
    float _1940 = _1914;
    float _1942 = _1912;
    float _1944 = _1916;
    float _1946 = _1918;
    float _1948 = _1904;
    float _1950 = _1920;
    float _1952 = _1878;
    float _1954 = _1922;
    if (!_1932)
    {
        float _1956 = _1880;
        float _1958 = _1882;
        float _1960 = _1884;
        float _1962 = _1886;
        if (_1056)
        {
            float _1964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1966 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1968 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1970 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1956 = _1964;
            _1958 = _1966;
            _1960 = _1968;
            _1962 = _1970;
        }
        float _1972 = _1956;
        float _1974 = _1958;
        float _1976 = _1960;
        float _1978 = _1962;
        float _1980 = _1888;
        float _1982 = _1890;
        float _1984 = _1892;
        float _1986 = _1894;
        if (_1056)
        {
            float _1988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1980 = _1988;
            _1982 = _1990;
            _1984 = _1992;
            _1986 = _1994;
        }
        float _1996 = _1980;
        float _1998 = _1982;
        float _2000 = _1984;
        float _2002 = _1986;
        float _2004 = _1896;
        float _2006 = _1898;
        float _2008 = _1900;
        float _2010 = _1902;
        if (_1056)
        {
            float _2012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2018 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2004 = _2012;
            _2006 = _2014;
            _2008 = _2016;
            _2010 = _2018;
        }
        float _2020 = _2004;
        float _2022 = _2006;
        float _2024 = _2008;
        float _2026 = _2010;
        if (_1056)
        {
            float _2028 = _1974 * _1904;
            _1934 = _2028;
        }
        float _2030 = _1934;
        float _2032 = _2030;
        float _2034 = _1996;
        if (_1056)
        {
            float _2036 = _1998 * _1904;
            _1936 = _2036;
        }
        float _2038 = _1936;
        float _2040 = _2038;
        if (_1056)
        {
            float _2042 = fma(_1050, _1972, _2030);
            _2032 = _2042;
        }
        float _2044 = _2032;
        float _2046 = _2044;
        if (_1056)
        {
            float _2048 = _2022 * _1904;
            _1938 = _2048;
        }
        float _2050 = _1938;
        if (_1056)
        {
            float _2052 = fma(_1050, _1996, _2038);
            _2040 = _2052;
        }
        float _2054 = _2040;
        if (_1056)
        {
            float _2056 = fma(_1052, _1976, _2044);
            _1940 = _2056;
        }
        float _2058 = _1940;
        if (!_1056)
        {
            _2034 = 0.0;
        }
        float _2060 = _2034;
        float _2062 = _2060;
        if (_1056)
        {
            float _2064 = fma(_1050, _2020, _2050);
            _1942 = _2064;
        }
        float _2066 = _1942;
        float _2068 = _2066;
        if (_1056)
        {
            float _2070 = fma(_1052, _2000, _2054);
            _1944 = _2070;
        }
        float _2072 = _1944;
        if (!_1056)
        {
            _1946 = 0.0;
            _2046 = 0.0;
        }
        float _2074 = _1946;
        float _2076 = _2046;
        float _2078 = _2074;
        float _2080 = _2076;
        if (_1056)
        {
            float _2082 = fma(_1052, _2024, _2066);
            _2068 = _2082;
        }
        float _2084 = _2068;
        if (_1056)
        {
            float _2086 = _1978 + _2058;
            _2078 = _2086;
        }
        float _2088 = _2078;
        float _2090 = _2088;
        if (_1056)
        {
            float _2092 = _2002 + _2072;
            _2062 = _2092;
        }
        float _2094 = _2062;
        float _2096 = _2094;
        if (_1056)
        {
            float _2098 = _2026 + _2084;
            _2080 = _2098;
        }
        float _2100 = _2080;
        bool _2102 = !_1060;
        float _2104 = _2100;
        if (!_2102)
        {
            float _2106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2108 = uint(int(uint(_164) >> uint(2)));
            float _2110 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2108)]);
            int _2112 = _164 + 4;
            uint _2114 = uint(int(uint(_2112) >> uint(2)));
            float _2116 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2114)]);
            int _2118 = _164 + 8;
            uint _2120 = uint(int(uint(_2118) >> uint(2)));
            float _2122 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2120)]);
            uint _2124 = uint(int(uint(_164) >> uint(2)));
            float _2126 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2124)]);
            int _2128 = _164 + 4;
            uint _2130 = uint(int(uint(_2128) >> uint(2)));
            float _2132 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2130)]);
            int _2134 = _164 + 8;
            uint _2136 = uint(int(uint(_2134) >> uint(2)));
            float _2138 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2136)]);
            uint _2140 = uint(int(uint(_164) >> uint(2)));
            float _2142 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2140)]);
            int _2144 = _164 + 4;
            uint _2146 = uint(int(uint(_2144) >> uint(2)));
            float _2148 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2146)]);
            int _2150 = _164 + 8;
            uint _2152 = uint(int(uint(_2150) >> uint(2)));
            float _2154 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2152)]);
            float _2156 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2160 = _2116 * _1904;
            float _2162 = _2132 * _1904;
            float _2164 = fma(_1050, _2110, _2160);
            float _2166 = _2148 * _1904;
            float _2168 = fma(_1050, _2126, _2162);
            float _2170 = fma(_1050, _2142, _2166);
            float _2172 = fma(_1052, _2122, _2164);
            float _2174 = fma(_1052, _2138, _2168);
            float _2176 = fma(_1052, _2154, _2170);
            float _2178 = _2106 + _2172;
            float _2180 = _2156 + _2174;
            float _2182 = _2158 + _2176;
            _2104 = _2182;
            _2090 = _2178;
            _2096 = _2180;
        }
        float _2184 = _2104;
        float _2186 = _2090;
        float _2188 = _2096;
        bool _2190 = !_1064;
        float _2192 = _2186;
        float _2194 = _2184;
        float _2196 = _2188;
        if (!_2190)
        {
            uint _2198 = uint(int(uint(_164) >> uint(2)));
            float _2200 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2198)]);
            int _2202 = _164 + 4;
            uint _2204 = uint(int(uint(_2202) >> uint(2)));
            float _2206 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2204)]);
            int _2208 = _164 + 8;
            uint _2210 = uint(int(uint(_2208) >> uint(2)));
            float _2212 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2210)]);
            int _2214 = _164 + 12;
            uint _2216 = uint(int(uint(_2214) >> uint(2)));
            float _2218 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2216)]);
            uint _2220 = uint(int(uint(_164) >> uint(2)));
            float _2222 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2220)]);
            int _2224 = _164 + 4;
            uint _2226 = uint(int(uint(_2224) >> uint(2)));
            float _2228 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2226)]);
            int _2230 = _164 + 8;
            uint _2232 = uint(int(uint(_2230) >> uint(2)));
            float _2234 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2232)]);
            int _2236 = _164 + 12;
            uint _2238 = uint(int(uint(_2236) >> uint(2)));
            float _2240 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2238)]);
            uint _2242 = uint(int(uint(_164) >> uint(2)));
            float _2244 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2242)]);
            int _2246 = _164 + 4;
            uint _2248 = uint(int(uint(_2246) >> uint(2)));
            float _2250 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2248)]);
            int _2252 = _164 + 8;
            uint _2254 = uint(int(uint(_2252) >> uint(2)));
            float _2256 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2254)]);
            int _2258 = _164 + 12;
            uint _2260 = uint(int(uint(_2258) >> uint(2)));
            float _2262 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2260)]);
            float _2264 = _2206 * _1904;
            float _2266 = _2228 * _1904;
            float _2268 = fma(_1050, _2200, _2264);
            float _2270 = _2250 * _1904;
            float _2272 = fma(_1050, _2222, _2266);
            float _2274 = fma(_1050, _2244, _2270);
            float _2276 = fma(_1052, _2212, _2268);
            float _2278 = fma(_1052, _2234, _2272);
            float _2280 = fma(_1052, _2256, _2274);
            float _2282 = _2276 + _2218;
            float _2284 = _2278 + _2240;
            float _2286 = _2280 + _2262;
            _2192 = _2282;
            _2194 = _2286;
            _2196 = _2284;
        }
        float _2288 = _2192;
        float _2290 = _2194;
        float _2292 = _2196;
        float _2294 = fma(_2288, 6.2500002968590706586837768554688e-05, 0.5);
        float _2296 = fma(_2290, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _6179 = float2(_2294, _2296);
        float _2298 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6179, float2(0.0), isnan(_6179)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6179, float2(0.0), isnan(_6179)), level(0.0)).x;
        float _2300 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2302 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2304 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2306 = _2298 * 2000.0;
        float _2308 = -_2300;
        float _2310 = _2308 + _2292;
        float _2312 = _2306 + (-0.300000011920928955078125);
        bool _2314 = _2310 > _2312;
        bool _2316 = _2310 < _2306;
        bool _2318 = _2316 && _2314;
        bool _2320 = !_2318;
        if (!_2320)
        {
            float _2322 = fma(_2288, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2324 = fma(_2288, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2326 = fma(_2290, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2328 = fma(_2290, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _6227 = float2(_2322, _2296);
            float _2330 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6227, float2(0.0), isnan(_6227)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6227, float2(0.0), isnan(_6227)), level(0.0)).x;
            float2 _6235 = float2(_2324, _2296);
            float _2332 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6235, float2(0.0), isnan(_6235)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6235, float2(0.0), isnan(_6235)), level(0.0)).x;
            float2 _6243 = float2(_2294, _2326);
            float _2334 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6243, float2(0.0), isnan(_6243)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6243, float2(0.0), isnan(_6243)), level(0.0)).x;
            float2 _6251 = float2(_2294, _2328);
            float _2336 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6251, float2(0.0), isnan(_6251)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6251, float2(0.0), isnan(_6251)), level(0.0)).x;
            float2 _6259 = float2(_2322, _2326);
            float _2338 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6259, float2(0.0), isnan(_6259)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6259, float2(0.0), isnan(_6259)), level(0.0)).x;
            float2 _6267 = float2(_2322, _2328);
            float _2340 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6267, float2(0.0), isnan(_6267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6267, float2(0.0), isnan(_6267)), level(0.0)).x;
            float2 _6275 = float2(_2324, _2326);
            float _2342 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6275, float2(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6275, float2(0.0), isnan(_6275)), level(0.0)).x;
            float2 _6283 = float2(_2324, _2328);
            float _2344 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6283, float2(0.0), isnan(_6283)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6283, float2(0.0), isnan(_6283)), level(0.0)).x;
            float _2346 = -_2330;
            float _2348 = _2298 + _2346;
            float _2350 = -_2332;
            float _2352 = _2298 + _2350;
            float _2354 = -_2334;
            float _2356 = _2298 + _2354;
            float _2358 = -_2336;
            float _2360 = _2298 + _2358;
            float _2362 = -_2338;
            float _2364 = _2298 + _2362;
            float _2366 = -_2340;
            float _2368 = _2298 + _2366;
            float _2370 = -_2342;
            float _2372 = _2298 + _2370;
            float _2374 = -_2344;
            float _2376 = _2298 + _2374;
            float _2378 = abs(_2348);
            float _2380 = abs(_2352);
            float _2382 = precise::max(_2378, _2380);
            float _2384 = abs(_2356);
            float _2386 = abs(_2360);
            float _2388 = precise::max(_2384, _2386);
            float _2390 = abs(_2364);
            float _2392 = abs(_2368);
            float _2394 = precise::max(_2390, _2392);
            float _2396 = precise::max(_2382, _2388);
            float _2398 = abs(_2372);
            float _2400 = abs(_2376);
            float _2402 = precise::max(_2398, _2400);
            bool _2404 = _2396 > 0.00150000001303851604461669921875;
            float _2406 = precise::max(_2394, _2402);
            bool _2408 = _2406 <= 0.00150000001303851604461669921875;
            bool _2410 = isnan(_2406);
            bool _2412 = _2408 || _2410;
            bool _2414 = isnan(0.00150000001303851604461669921875);
            bool _2416 = _2412 || _2414;
            bool _2418 = !_2404;
            bool _2420 = _2416 && _2418;
            bool _2422 = !_2420;
            if (!_2422)
            {
                float _2424 = -_2298;
                float _2426 = _2424 + _2330;
                float _2428 = -_2298;
                float _2430 = _2428 + _2334;
                float _2432 = _2426 * 2000.0;
                float _2434 = _2430 * 2000.0;
                bool _2436 = !_1056;
                float _2542;
                float _2544;
                float _2546;
                if (!_2436)
                {
                    float _2438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2446 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2448 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2450 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2452 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2456 = _2442 * _2444;
                    float _2458 = _2442 * _2446;
                    float _2460 = _2440 * _2444;
                    float _2462 = -_2456;
                    float _2464 = fma(_2438, _2448, _2462);
                    float _2466 = -_2458;
                    float _2468 = fma(_2440, _2448, _2466);
                    float _2470 = _2454 * _2440;
                    float _2472 = _2450 * _2442;
                    float _2474 = _2464 * _2452;
                    float _2476 = -_2460;
                    float _2478 = fma(_2438, _2446, _2476);
                    float _2480 = _2452 * _2448;
                    float _2482 = -_2470;
                    float _2484 = fma(_2452, _2442, _2482);
                    float _2486 = -_2474;
                    float _2488 = fma(_2468, _2450, _2486);
                    float _2490 = -_2472;
                    float _2492 = fma(_2454, _2438, _2490);
                    float _2494 = -_2480;
                    float _2496 = fma(_2454, _2446, _2494);
                    float _2498 = _2454 * _2444;
                    float _2500 = fma(_2478, _2454, _2488);
                    float _2502 = _2450 * _2446;
                    float _2504 = _2452 * _2438;
                    float _2506 = -_2438;
                    float _2508 = fma(_2506, _2448, _2456);
                    float _2510 = 1.0 / _2500;
                    float _2512 = -_2498;
                    float _2514 = fma(_2450, _2448, _2512);
                    float _2516 = -_2502;
                    float _2518 = fma(_2452, _2444, _2516);
                    float _2520 = fma(_2468, _2432, _2496);
                    float _2522 = -_2504;
                    float _2524 = fma(_2450, _2440, _2522);
                    float _2526 = fma(_2508, _2432, _2514);
                    float _2528 = fma(_2478, _2432, _2518);
                    float _2530 = fma(_2484, _2434, _2520);
                    float _2532 = fma(_2492, _2434, _2526);
                    float _2534 = fma(_2524, _2434, _2528);
                    float _2536 = _2510 * _2530;
                    float _2538 = _2510 * _2532;
                    float _2540 = _2510 * _2534;
                    _2542 = _2538;
                    _2544 = _2536;
                    _2546 = _2540;
                    _2548 = true;
                }
                else
                {
                    float _2550 = fma(_2432, _518, _512);
                    float _2552 = fma(_2432, _522, _514);
                    float _2554 = fma(_2432, _524, _516);
                    float _2556 = fma(_2434, _526, _2550);
                    float _2558 = fma(_2434, _528, _2552);
                    float _2560 = fma(_2434, _530, _2554);
                    _2542 = _2558;
                    _2544 = _2556;
                    _2546 = _2560;
                }
                _2548 = false;
                float _2562 = _2542;
                float _2564 = _2544;
                float _2566 = _2546;
                float _2568 = _2562 * _2562;
                float _2570 = -_2310;
                float _2572 = _2570 + _2306;
                float _2574 = fma(_2564, _2564, _2568);
                float _2576 = _2572 + _1904;
                float _2578 = fma(_2566, _2566, _2574);
                float _2580 = rsqrt(_2578);
                float _2582 = _2580 * _2562;
                float _2584 = _2580 * _2564;
                float _2586 = _2580 * _2566;
                float _2588 = _2582 * _1878;
                float _2590 = fma(_2584, _1920, _2588);
                float _2592 = fma(_2586, _1922, _2590);
                float _2594 = _2584 * _2592;
                float _2596 = _2582 * _2592;
                float _2598 = _2586 * _2592;
                float _2600 = -_2594;
                float _2602 = _2600 + _1920;
                float _2604 = -_2596;
                float _2606 = _2604 + _1878;
                float _2608 = -_2598;
                float _2610 = _2608 + _1922;
                float _2612 = _2302 * _2594;
                float _2614 = _2302 * _2596;
                float _2616 = _2302 * _2598;
                float _2618 = -_2612;
                float _2620 = fma(_2304, _2602, _2618);
                float _2622 = -_2614;
                float _2624 = fma(_2304, _2606, _2622);
                float _2626 = -_2616;
                float _2628 = fma(_2304, _2610, _2626);
                _1948 = _2576;
                _1950 = _2620;
                _1952 = _2624;
                _1954 = _2628;
            }
        }
    }
    float _2630 = _1948;
    float _2632 = _1950;
    float _2634 = _1952;
    float _2636 = _1954;
    int _2638 = _164 + 4;
    int _2640 = _164 + 8;
    uint _2642 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2642)] = as_type<uint>(_562);
    float _2644 = -_168;
    float _2646 = _2644 + _1050;
    float _2648 = -_174;
    float _2650 = _2648 + _2630;
    uint _2652 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2652)] = as_type<uint>(_1050);
    float _2654 = -_180;
    float _2656 = _2654 + _1052;
    uint _2658 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2658)] = as_type<uint>(_2630);
    uint _2660 = uint(int(uint(_2640) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2660)] = as_type<uint>(_1052);
    uint _2662 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2662)] = as_type<uint>(_2632);
    uint _2664 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2664)] = as_type<uint>(_2634);
    uint _2666 = uint(int(uint(_2640) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2666)] = as_type<uint>(_2636);
    uint _2668 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2668)] = as_type<uint>(_2646);
    uint _2670 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2670)] = as_type<uint>(_2650);
    uint _2672 = uint(int(uint(_2640) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2672)] = as_type<uint>(_2656);
    float _2674 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2676 = _2650 * _2650;
    float _2678 = _2634 * _2634;
    float _2680 = fma(_2646, _2646, _2676);
    float _2682 = fma(_2632, _2632, _2678);
    float _2684 = fma(_2656, _2656, _2680);
    float _2686 = fma(_2636, _2636, _2682);
    float _2688 = sqrt(_2686);
    float _2690 = sqrt(_2684);
    bool _2692 = _2690 >= 9.9999999747524270787835121154785e-07;
    bool _2694 = isnan(_2690);
    bool _2696 = _2692 || _2694;
    bool _2698 = isnan(9.9999999747524270787835121154785e-07);
    bool _2700 = _2696 || _2698;
    if (!_2700)
    {
        bool _2702 = _538 != _294;
        bool _2704 = isnan(_538);
        bool _2706 = _2702 || _2704;
        bool _2708 = isnan(_294);
        bool _2710 = _2706 || _2708;
        _2712 = _2710;
        if (!_2712)
        {
            float _2714 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2716 = _2714 > 0.0;
            bool _2718 = !_2716;
            if (!_2718)
            {
                float _2720 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2722 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2724 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2726 = _2722 * _514;
                float _2728 = _2722 * _512;
                float _2730 = _2722 * _516;
                float _2732 = fma(_2720, _522, _2726);
                float _2734 = fma(_2720, _518, _2728);
                float _2736 = fma(_2720, _524, _2730);
                float _2738 = fma(_2724, _528, _2732);
                float _2740 = fma(_2724, _526, _2734);
                float _2742 = fma(_2724, _530, _2736);
                float _2744 = _2738 * _2738;
                float _2746 = fma(_2740, _2740, _2744);
                float _2748 = fma(_2742, _2742, _2746);
                float _2750 = rsqrt(_2748);
                float _2752 = _2750 * 9.9999999747524270787835121154785e-07;
                float _2754 = _2740 * _2752;
                float _2756 = _2738 * _2752;
                float _2758 = _2742 * _2752;
                _332 = as_type<int>(_2754);
                _334 = as_type<int>(_2756);
                _336 = as_type<int>(_2758);
                _2712 = true;
            }
            else
            {
                bool _2760 = _2688 >= 9.9999999747524270787835121154785e-07;
                bool _2762 = isnan(_2688);
                bool _2764 = _2760 || _2762;
                bool _2766 = isnan(9.9999999747524270787835121154785e-07);
                bool _2768 = _2764 || _2766;
                if (!_2768)
                {
                    float _2770 = _2630 * _2630;
                    float _2772 = fma(_1050, _1050, _2770);
                    float _2774 = fma(_1052, _1052, _2772);
                    float _2776 = sqrt(_2774);
                    bool _2778 = _2776 >= 9.9999999747524270787835121154785e-07;
                    bool _2780 = isnan(_2776);
                    bool _2782 = _2778 || _2780;
                    bool _2784 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2786 = _2782 || _2784;
                    float _2788 = _2776;
                    if (_2786)
                    {
                        float _2790 = rsqrt(_2774);
                        _2788 = _2790;
                    }
                    float _2792 = _2788;
                    if (!_2786)
                    {
                        _320 = 0;
                    }
                    int _2794 = _320;
                    int _2796 = _2794;
                    if (!_2786)
                    {
                        _322 = 897988541;
                    }
                    int _2798 = _322;
                    int _2800 = _2798;
                    if (!_2786)
                    {
                        _324 = 0;
                    }
                    int _2802 = _324;
                    float _2804 = _2792;
                    int _2806 = _2802;
                    if (_2786)
                    {
                        float _2808 = _2792 * 9.9999999747524270787835121154785e-07;
                        _2804 = _2808;
                    }
                    float _2810 = _2804;
                    if (_2786)
                    {
                        float _2812 = _1050 * _2810;
                        _2796 = as_type<int>(_2812);
                    }
                    int _2814 = _2796;
                    _332 = _2814;
                    if (_2786)
                    {
                        float _2816 = _2630 * _2810;
                        _2800 = as_type<int>(_2816);
                    }
                    int _2818 = _2800;
                    _334 = _2818;
                    if (_2786)
                    {
                        float _2820 = _1052 * _2810;
                        _2806 = as_type<int>(_2820);
                    }
                    int _2822 = _2806;
                    _336 = _2822;
                    _2712 = true;
                }
                else
                {
                    float _2824 = rsqrt(_2686);
                    float _2826 = _2824 * 9.9999999747524270787835121154785e-07;
                    float _2828 = _2632 * _2826;
                    float _2830 = _2634 * _2826;
                    float _2832 = _2636 * _2826;
                    _332 = as_type<int>(_2828);
                    _334 = as_type<int>(_2830);
                    _336 = as_type<int>(_2832);
                    _2712 = true;
                }
            }
        }
    }
    else
    {
        float _2834 = _2688 * _2674;
        bool _2836 = _2834 >= 0.001000000047497451305389404296875;
        bool _2838 = isnan(_2834);
        bool _2840 = _2836 || _2838;
        bool _2842 = isnan(0.001000000047497451305389404296875);
        bool _2844 = _2840 || _2842;
        bool _2846 = _2834 > 0.0;
        bool _2848 = !_2844;
        bool _2850 = _2846 && _2848;
        bool _2852 = _2690 < 0.001000000047497451305389404296875;
        bool _2854 = _2852 && _2850;
        if (!_2854)
        {
            _326 = as_type<int>(_2646);
        }
        int _2856 = _326;
        int _2858 = _2856;
        if (_2854)
        {
            float _2860 = _2674 * _2632;
            _2858 = as_type<int>(_2860);
        }
        int _2862 = _2858;
        _332 = _2862;
        if (!_2854)
        {
            _328 = as_type<int>(_2650);
        }
        int _2864 = _328;
        int _2866 = _2864;
        if (_2854)
        {
            float _2868 = _2674 * _2634;
            _2866 = as_type<int>(_2868);
        }
        int _2870 = _2866;
        _334 = _2870;
        if (!_2854)
        {
            _330 = as_type<int>(_2656);
        }
        int _2872 = _330;
        _336 = _2872;
        if (_2854)
        {
            float _2874 = _2674 * _2636;
            _336 = as_type<int>(_2874);
        }
    }
    _2712 = false;
    int _2876 = _332;
    int _2878 = _334;
    int _2880 = _336;
    uint _2882 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2882)] = uint(_2876);
    uint _2884 = uint(int(uint(_2638) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2884)] = uint(_2878);
    uint _2886 = uint(int(uint(_2640) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2886)] = uint(_2880);
}

