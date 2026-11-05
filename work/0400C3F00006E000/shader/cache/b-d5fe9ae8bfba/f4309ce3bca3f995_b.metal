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
    texture2d<float> cp_t_tcb_2A [[id(15)]];
    sampler cp_t_tcb_2ASmplr [[id(16)]];
    sampler cp_t_tcb_2CSmplr_w [[id(17)]];
    sampler cp_t_tcb_2ASmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _4678 = false;
    bool _3556 = false;
    bool _2858 = false;
    bool _2094 = false;
    bool _1186 = false;
    float _68 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _70 = as_type<float>(gl_LocalInvocationID.x);
    float _72 = as_type<float>(gl_WorkGroupID.x);
    int _75 = as_type<int>(_72) << 5;
    int _77 = _75 + as_type<int>(_70);
    float _79 = trunc(_68);
    int _81 = int(_79);
    bool _85 = _77 >= _81;
    int _87 = 0;
    float _89 = as_type<float>(_81);
    if (_85)
    {
        _87 = 0;
    }
    int _91 = _87;
    int _93 = _91;
    int _95 = _91;
    float _97 = 0.0;
    if (!_85)
    {
        int _99 = _77 << 4;
        int _101 = _99 + 12;
        uint _104 = uint(int(uint(_101) >> uint(2)));
        float _106 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_104)]);
        float _108 = trunc(_106);
        int _110 = int(_108);
        bool _112 = _110 >= 1;
        int _114 = _112 ? (-1) : 0;
        _89 = as_type<float>(_101);
        _97 = as_type<float>(_110);
        if (!_112)
        {
            _93 = 0;
        }
        int _116 = _93;
        bool _118 = !_112;
        _95 = _116;
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
            _89 = _124;
            _97 = _126;
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
            _95 = _148;
            if (!_132)
            {
                int _150 = ~_146;
                int _152 = (_150 != 0) ? 0 : 1;
                _95 = _152;
            }
        }
    }
    int _154 = _95;
    float _156 = _89;
    float _158 = _97;
    int _160 = _154 & 1;
    bool _162 = _160 != 0;
    if (!_162)
    {
        return;
    }
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _166 = _77 << 4;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = _166 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_174)]);
    int _178 = _166 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    int _184 = as_type<int>(_164) & 512;
    bool _186 = _184 != 0;
    int _188 = _166 + 12;
    uint _190 = uint(int(uint(_166) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    int _194 = _166 + 4;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_196)]);
    int _200 = _166 + 8;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    uint _206 = uint(int(uint(_166) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    int _210 = _166 + 4;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_212)]);
    int _216 = _166 + 8;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    float _222 = 0.0;
    float _224 = 0.0;
    float _226 = 0.0;
    if (_186)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _222 = _228;
        _224 = _230;
        _226 = _232;
    }
    float _234 = _222;
    float _236 = _224;
    float _238 = _226;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_186)
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
    float _258 = as_type<float>(_154);
    float _260 = _156;
    float _262 = _158;
    if (_186)
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
    uint _276 = uint(int(uint(_166) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    int _280 = _166 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_282)]);
    int _286 = _166 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_288)]);
    uint _292 = uint(int(uint(_188) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_292)]);
    uint _296 = uint(int(uint(_188) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_296)]);
    float _300 = _254;
    float _302 = _236;
    float _304 = _272;
    float _306 = _252;
    float _308 = _256;
    float _310 = _234;
    float _312 = _238;
    float _314 = _270;
    float _316 = _274;
    float _318 = _192;
    float _320 = _204;
    float _322 = _204;
    float _324 = _192;
    int _326 = as_type<int>(_208);
    int _328 = as_type<int>(_214);
    int _330 = as_type<int>(_220);
    int _332 = as_type<int>(_208);
    int _334 = as_type<int>(_214);
    int _336 = as_type<int>(_220);
    int _338 = as_type<int>(_208);
    int _340 = as_type<int>(_214);
    int _342 = as_type<int>(_220);
    if (!_186)
    {
        int _344 = _166 + 4;
        uint _346 = uint(int(uint(_166) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        int _350 = _166 + 8;
        uint _352 = uint(int(uint(_166) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_352)]);
        uint _356 = uint(int(uint(_344) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_356)]);
        uint _360 = uint(int(uint(_344) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_360)]);
        uint _364 = uint(int(uint(_350) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_364)]);
        uint _368 = uint(int(uint(_166) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_368)]);
        uint _372 = uint(int(uint(_350) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_372)]);
        uint _376 = uint(int(uint(_344) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_376)]);
        uint _380 = uint(int(uint(_350) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_380)]);
        float _384 = _348 * _348;
        float _386 = fma(_354, _354, _384);
        float _388 = _358 * _358;
        float _390 = fma(_362, _362, _388);
        float _392 = _366 * _366;
        float _394 = fma(_370, _370, _386);
        float _396 = fma(_374, _374, _392);
        float _398 = sqrt(_394);
        float _400 = fma(_378, _378, _390);
        float _402 = fma(_382, _382, _396);
        float _404 = sqrt(_400);
        float _406 = sqrt(_402);
        bool _408 = _398 > 0.0;
        bool _410 = _404 > 0.0;
        bool _412 = _406 > 0.0;
        float _414 = _404;
        float _416 = _406;
        float _418 = _396;
        float _420 = _348;
        float _422 = _398;
        float _424 = _354;
        float _426 = _390;
        float _428 = _358;
        float _430 = _378;
        float _432 = _370;
        if (_408)
        {
            float _434 = rsqrt(_394);
            _414 = _434;
        }
        float _436 = _414;
        float _438 = 0.0;
        if (_410)
        {
            float _440 = rsqrt(_400);
            _438 = _440;
        }
        float _442 = _438;
        float _444 = 0.0;
        if (_412)
        {
            float _446 = rsqrt(_402);
            _444 = _446;
        }
        float _448 = _444;
        if (!_408)
        {
            _416 = 0.0;
        }
        float _450 = _416;
        float _452 = _450;
        if (_408)
        {
            float _454 = _348 * _436;
            _452 = _454;
        }
        float _456 = _452;
        _306 = _456;
        if (!_408)
        {
            _418 = 0.0;
        }
        float _458 = _418;
        float _460 = _458;
        if (_408)
        {
            float _462 = _354 * _436;
            _460 = _462;
        }
        float _464 = _460;
        _310 = _464;
        if (!_408)
        {
            _420 = 0.0;
        }
        float _466 = _420;
        float _468 = _466;
        if (_408)
        {
            float _470 = _370 * _436;
            _468 = _470;
        }
        float _472 = _468;
        _314 = _472;
        if (!_410)
        {
            _422 = 0.0;
        }
        float _474 = _422;
        float _476 = _474;
        if (_410)
        {
            float _478 = _358 * _442;
            _476 = _478;
        }
        float _480 = _476;
        _300 = _480;
        if (!_410)
        {
            _424 = 0.0;
        }
        float _482 = _424;
        float _484 = _482;
        if (_410)
        {
            float _486 = _378 * _442;
            _484 = _486;
        }
        float _488 = _484;
        _304 = _488;
        if (!_410)
        {
            _426 = 0.0;
        }
        float _490 = _426;
        float _492 = _490;
        if (_410)
        {
            float _494 = _362 * _442;
            _492 = _494;
        }
        float _496 = _492;
        _302 = _496;
        if (!_412)
        {
            _428 = 0.0;
        }
        float _498 = _428;
        float _500 = _498;
        if (!_412)
        {
            _430 = 0.0;
        }
        float _502 = _430;
        float _504 = _502;
        if (_412)
        {
            float _506 = _366 * _448;
            _500 = _506;
        }
        float _508 = _500;
        _308 = _508;
        if (!_412)
        {
            _432 = 0.0;
        }
        float _510 = _432;
        _316 = _510;
        if (_412)
        {
            float _512 = _374 * _448;
            _504 = _512;
        }
        float _514 = _504;
        _312 = _514;
        if (_412)
        {
            float _516 = _382 * _448;
            _316 = _516;
        }
    }
    float _518 = _300;
    float _520 = _302;
    float _522 = _304;
    float _524 = _306;
    float _526 = _308;
    float _528 = _310;
    float _530 = _312;
    float _532 = _314;
    float _534 = _316;
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    bool _566 = _542 != 1.0;
    bool _568 = isnan(_542);
    bool _570 = _566 || _568;
    bool _572 = isnan(1.0);
    bool _574 = _570 || _572;
    float _576 = _574 ? _278 : 0.0;
    float _578 = _574 ? _284 : 0.3141500055789947509765625;
    float _580 = _574 ? _290 : 0.92653000354766845703125;
    float _582 = _544 * _576;
    float _584 = _546 * 0.00999999977648258209228515625;
    float _586 = _544 * _578;
    float _588 = _544 * _580;
    float _590 = _544 * _584;
    float _592 = _578;
    float _594 = _580;
    float _596 = _584;
    float _598 = _588;
    float _600 = _548;
    float _602 = _586;
    float _604 = _540;
    float _606 = _590;
    if (_574)
    {
        _592 = _582;
    }
    float _608 = _592;
    float _610 = _608;
    if (_574)
    {
        _594 = _586;
    }
    float _612 = _594;
    float _614 = _612;
    float _616 = _560;
    float _618 = _562;
    float _620 = _564;
    if (!_574)
    {
        float _622 = _548 * 0.00999999977648258209228515625;
        float _624 = _556 * _590;
        float _626 = fma(_284, 2.0, -1.0);
        float _628 = _544 * _622;
        float _630 = fma(_278, 2.0, -1.0);
        float _632 = fma(_290, 2.0, -1.0);
        float _634 = fma(_628, _626, _624);
        float _636 = fma(_628, _630, _624);
        float _638 = fma(_628, _632, _624);
        float _640 = _586 + _634;
        float _642 = _582 + _636;
        float _644 = _588 + _638;
        _596 = _628;
        _610 = _642;
        _614 = _640;
        _598 = _644;
    }
    float _646 = _596;
    float _648 = _610;
    float _650 = _614;
    float _652 = _598;
    float _654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _656 = -_550;
    float _658 = _656 + 1.0;
    float _660 = -_554;
    float _662 = _660 + 1.0;
    float _664 = _538 * _552;
    float _666 = 0.0;
    float _668 = _648;
    float _670 = _650;
    float _672 = _652;
    if (_574)
    {
        _666 = 0.0;
    }
    float _674 = _666;
    float _676 = _674;
    if (!_574)
    {
        float _678 = _550 * _590;
        _676 = _678;
    }
    float _680 = _676;
    float _682 = fma(_658, _662, _554);
    float _684 = _536 * _552;
    float _686 = abs(_554);
    float _688 = log2(_686);
    float _690 = _664 * _518;
    float _692 = _540 * _552;
    bool _694 = _682 != 1.0;
    bool _696 = isnan(_682);
    bool _698 = _694 || _696;
    bool _700 = isnan(1.0);
    bool _702 = _698 || _700;
    float _704 = fma(_684, _520, _690);
    bool _706 = _680 != 0.0;
    bool _708 = isnan(_680);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    bool _716 = _558 != 1.0;
    bool _718 = isnan(_558);
    bool _720 = _716 || _718;
    bool _722 = isnan(1.0);
    bool _724 = _720 || _722;
    bool _726 = !_702;
    bool _728 = _724 || _726;
    float _730 = -_298;
    float _732 = _556 + _730;
    float _734 = fma(_692, _522, _704);
    float _736 = _550 * _734;
    float _738 = _550 * _688;
    float _740 = exp2(_738);
    if (!_728)
    {
        float _742 = -_682;
        float _744 = _742 + 1.0;
        _600 = _744;
    }
    float _746 = _600;
    float _748 = 0.0;
    if (_728)
    {
        _748 = _732;
    }
    float _750 = _748;
    float _752 = _646;
    float _754 = _750;
    if (!_728)
    {
        float _756 = abs(_682);
        float _758 = log2(_756);
        _752 = _758;
    }
    float _760 = _752;
    float _762 = 0.0;
    if (!_728)
    {
        float _764 = 1.0 / _746;
        _762 = _764;
    }
    float _766 = _762;
    float _768 = _766;
    if (!_728)
    {
        float _770 = _732 * _760;
        _602 = _770;
    }
    float _772 = _602;
    float _774 = _664 * _524;
    float _776 = _664 * _526;
    float _778 = fma(_684, _528, _774);
    float _780 = _772;
    if (!_728)
    {
        float _782 = exp2(_772);
        _780 = _782;
    }
    float _784 = _780;
    float _786 = fma(_684, _530, _776);
    float _788 = fma(_198, _740, _736);
    float _790 = fma(_692, _532, _778);
    float _792 = fma(_692, _534, _786);
    float _794 = _294 * _550;
    float _796 = _550 * _790;
    float _798 = _550 * _792;
    float _800 = fma(_192, _794, _170);
    float _802 = fma(_198, _794, _176);
    float _804 = fma(_192, _740, _796);
    float _806 = fma(_204, _794, _182);
    float _808 = fma(_204, _740, _798);
    float _810 = _784;
    float _812 = _792;
    float _814 = _792;
    float _816 = _788;
    if (!_728)
    {
        float _818 = -_784;
        float _820 = _818 + 1.0;
        _810 = _820;
    }
    float _822 = _810;
    if (!_728)
    {
        float _824 = _822 * _766;
        _754 = _824;
    }
    float _826 = _754;
    float _828 = _826 + _648;
    float _830 = _550 + _828;
    float _832 = _830 + _680;
    bool _834 = _654 != 1.0;
    bool _836 = isnan(_654);
    bool _838 = _834 || _836;
    bool _840 = isnan(1.0);
    bool _842 = _838 || _840;
    float _844 = _830;
    float _846 = _830;
    float _848 = _828;
    float _926;
    float _938;
    float _940;
    float _942;
    float _1082;
    float _1114;
    float _1140;
    float _1152;
    float _1160;
    float _1162;
    float _1166;
    float _1170;
    float _1174;
    float _1178;
    float _1182;
    float _1184;
    if (!_714)
    {
        if (_842)
        {
            _844 = 0.60000002384185791015625;
        }
        float _850 = _844;
        float _852 = 0.0;
        if (!_842)
        {
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _852 = _854;
        }
        float _856 = _852;
        if (_842)
        {
            _318 = 0.4199999868869781494140625;
        }
        float _858 = _318;
        if (_842)
        {
            _320 = 0.23000000417232513427734375;
        }
        float _860 = _320;
        float _862 = 0.0;
        if (!_842)
        {
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _862 = _864;
        }
        float _866 = _862;
        float _868 = _850;
        if (!_842)
        {
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _868 = _870;
        }
        float _872 = _868;
        float _874 = _858;
        if (!_842)
        {
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _874 = _876;
        }
        float _878 = _874;
        if (_842)
        {
            _812 = 0.1500000059604644775390625;
        }
        float _880 = _812;
        float _882 = _860;
        if (!_842)
        {
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _882 = _884;
        }
        float _886 = _882;
        float _888 = _880;
        if (!_842)
        {
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _888 = _890;
        }
        float _892 = _888;
        float _894 = 0.0;
        if (!_842)
        {
            float _896 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _894 = _896;
        }
        float _898 = _894;
        float _900 = 0.0;
        if (!_842)
        {
            float _902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _900 = _902;
        }
        float _904 = _900;
        if (_842)
        {
            _668 = 0.60000002384185791015625;
        }
        float _906 = _668;
        float _908 = _544 * _872;
        float _910 = _906;
        float _912 = _872;
        if (!_842)
        {
            _910 = _872;
        }
        float _914 = _910;
        float _916 = _914;
        if (_842)
        {
            _912 = 0.4199999868869781494140625;
        }
        float _918 = _912;
        float _920 = _544 * _878;
        float _922 = 1.0 / _908;
        float _924 = _918;
        _926 = _856;
        if (!_842)
        {
            _924 = _878;
        }
        float _928 = _924;
        float _930 = _544 * _886;
        float _932 = _544 * _914;
        float _934 = 1.0 / _920;
        float _936 = _928;
        _938 = _866;
        _940 = _898;
        _942 = _904;
        if (_842)
        {
            _916 = 0.23000000417232513427734375;
        }
        float _944 = _916;
        float _946 = _544 * _892;
        float _948 = _944;
        if (!_842)
        {
            _948 = _886;
        }
        float _950 = _948;
        float _952 = _832 * 6.283184051513671875;
        float _954 = _544 * _928;
        float _956 = 1.0 / _930;
        float _958 = _922 * _952;
        if (_842)
        {
            _936 = 0.1500000059604644775390625;
        }
        float _960 = _936;
        float _962 = _960;
        if (!_842)
        {
            _962 = _892;
        }
        float _964 = _962;
        float _966 = 1.0 / _954;
        float _968 = _544 * _950;
        float _970 = _958 * 0.15915493667125701904296875;
        float _972 = 1.0 / _946;
        float _974 = _934 * _952;
        float _976 = 1.0 / _932;
        float _978 = _544 * _964;
        float _980 = _974 * 0.15915493667125701904296875;
        float _982 = _956 * _952;
        float _984 = 1.0 / _968;
        float _986 = _982 * 0.15915493667125701904296875;
        float _988 = _828 * _966;
        float _990 = _972 * _952;
        float _992 = 1.0 / _978;
        float _994 = _988 * 6.283184051513671875;
        float _996 = _990 * 0.15915493667125701904296875;
        float _998 = _828 * _976;
        float _1000 = _994 * 0.15915493667125701904296875;
        float _1002 = _998 * 6.283184051513671875;
        float _1004 = _828 * _984;
        float _1006 = _980 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        float _1010 = _1002 * 0.15915493667125701904296875;
        float _1012 = _1004 * 6.283184051513671875;
        float _1014 = _828 * _992;
        float _1016 = _1000 * 6.283185482025146484375;
        float _1018 = sin(_1016);
        float _1020 = _1012 * 0.15915493667125701904296875;
        float _1022 = _1014 * 6.283184051513671875;
        float _1024 = _970 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        float _1028 = _1022 * 0.15915493667125701904296875;
        float _1030 = _984;
        float _1032 = _1004;
        float _1034 = _1012;
        float _1036 = _1022;
        if (_842)
        {
            _1030 = 3.0;
        }
        float _1038 = _1030;
        float _1040 = _1038;
        if (_842)
        {
            _1032 = 3.0;
        }
        float _1042 = _1032;
        float _1044 = _1010 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = _1042;
        if (!_842)
        {
            _1040 = _856;
        }
        float _1050 = _1040;
        float _1052 = _1050;
        if (!_842)
        {
            _1048 = _856;
        }
        float _1054 = _1048;
        float _1056 = _1054;
        if (_842)
        {
            _1034 = 4.0;
        }
        float _1058 = _1034;
        float _1060 = _986 * 6.283185482025146484375;
        float _1062 = sin(_1060);
        float _1064 = _1058;
        if (!_842)
        {
            _1064 = _866;
        }
        float _1066 = _1064;
        float _1068 = _1008 * _1050;
        float _1070 = _1018 * _1054;
        float _1072 = _1020 * 6.283185482025146484375;
        float _1074 = sin(_1072);
        float _1076 = _1066;
        float _1078 = _1068;
        float _1080 = _1008;
        _1082 = _1018;
        if (_842)
        {
            _1056 = 4.0;
        }
        float _1084 = _1056;
        float _1086 = _1084;
        if (!_842)
        {
            _1086 = _866;
        }
        float _1088 = _1086;
        float _1090 = _996 * 6.283185482025146484375;
        float _1092 = sin(_1090);
        float _1094 = fma(_1026, _1066, _1068);
        float _1096 = _1026;
        float _1098 = _1094;
        if (_842)
        {
            _1052 = 2.0;
        }
        float _1100 = _1052;
        float _1102 = _1028 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        float _1106 = _1100;
        if (_842)
        {
            _1076 = 2.0;
        }
        float _1108 = _1076;
        float _1110 = fma(_1046, _1088, _1070);
        float _1112 = _1108;
        _1114 = _1046;
        if (!_842)
        {
            _1106 = _898;
        }
        float _1116 = _1106;
        if (!_842)
        {
            _1112 = _898;
        }
        float _1118 = _1112;
        float _1120 = _1118;
        if (_842)
        {
            _1078 = 1.5;
        }
        float _1122 = _1078;
        float _1124 = _1122;
        if (_842)
        {
            _1036 = 1.5;
        }
        float _1126 = _1036;
        float _1128 = fma(_1062, _1116, _1094);
        float _1130 = _1126;
        float _1132 = _1128;
        if (!_842)
        {
            _1124 = _904;
        }
        float _1134 = _1124;
        float _1136 = fma(_1074, _1118, _1110);
        float _1138 = _1134;
        _1140 = _1136;
        if (!_842)
        {
            _1130 = _904;
        }
        float _1142 = _1130;
        float _1144 = fma(_1092, _1134, _1128);
        float _1146 = fma(_1104, _1142, _1136);
        float _1148 = _1146;
        if (_842)
        {
            _1132 = 1.5;
        }
        float _1150 = _1132;
        _1152 = _1150;
        if (_842)
        {
            _1138 = 2.0;
        }
        float _1154 = _1138;
        float _1156 = -_1146;
        float _1158 = _1144 + _1156;
        _1160 = _1154;
        _1162 = _1158;
        if (_842)
        {
            _1148 = 3.0;
        }
        float _1164 = _1148;
        _1166 = _1164;
        if (_842)
        {
            _1120 = 4.0;
        }
        float _1168 = _1120;
        _1170 = _1168;
        if (_842)
        {
            _1096 = 0.1500000059604644775390625;
        }
        float _1172 = _1096;
        _1174 = _1172;
        if (_842)
        {
            _1080 = 0.23000000417232513427734375;
        }
        float _1176 = _1080;
        _1178 = _1176;
        if (_842)
        {
            _1098 = 0.4199999868869781494140625;
        }
        float _1180 = _1098;
        _1182 = _1180;
        _1184 = 0.0;
        _1186 = true;
    }
    else
    {
        if (_842)
        {
            _322 = 0.4199999868869781494140625;
        }
        float _1188 = _322;
        float _1190 = 0.0;
        if (!_842)
        {
            float _1192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1190 = _1192;
        }
        float _1194 = _1190;
        if (_842)
        {
            _814 = 0.60000002384185791015625;
        }
        float _1196 = _814;
        if (_842)
        {
            _604 = 0.23000000417232513427734375;
        }
        float _1198 = _604;
        float _1200 = 0.0;
        if (!_842)
        {
            float _1202 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1200 = _1202;
        }
        float _1204 = _1200;
        float _1206 = _1188;
        if (!_842)
        {
            float _1208 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1206 = _1208;
        }
        float _1210 = _1206;
        if (_842)
        {
            _606 = 0.1500000059604644775390625;
        }
        float _1212 = _606;
        float _1214 = _1196;
        if (!_842)
        {
            float _1216 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1214 = _1216;
        }
        float _1218 = _1214;
        float _1220 = _1198;
        if (!_842)
        {
            float _1222 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1220 = _1222;
        }
        float _1224 = _1220;
        float _1226 = _1212;
        if (!_842)
        {
            float _1228 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1226 = _1228;
        }
        float _1230 = _1226;
        float _1232 = 0.0;
        if (!_842)
        {
            float _1234 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1232 = _1234;
        }
        float _1236 = _1232;
        float _1238 = 0.0;
        if (!_842)
        {
            float _1240 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1238 = _1240;
        }
        float _1242 = _1238;
        if (_842)
        {
            _846 = 0.4199999868869781494140625;
        }
        float _1244 = _846;
        float _1246 = _1244;
        if (_842)
        {
            _324 = 0.4199999868869781494140625;
        }
        float _1248 = _324;
        float _1250 = _648 * 6.283184051513671875;
        float _1252 = _1248;
        float _1254 = _1210;
        if (!_842)
        {
            _1246 = _1210;
        }
        float _1256 = _1246;
        float _1258 = _544 * _1210;
        float _1260 = _1256;
        if (!_842)
        {
            _1252 = _1210;
        }
        float _1262 = _1252;
        float _1264 = _544 * _1256;
        float _1266 = _1262;
        if (_842)
        {
            _1260 = 0.4199999868869781494140625;
        }
        float _1268 = _1260;
        float _1270 = _1268;
        if (!_842)
        {
            _1270 = _1210;
        }
        float _1272 = _1270;
        float _1274 = 1.0 / _1258;
        float _1276 = _1272;
        if (_842)
        {
            _1254 = 0.60000002384185791015625;
        }
        float _1278 = _1254;
        float _1280 = _544 * _1218;
        float _1282 = _544 * _1272;
        float _1284 = _1278;
        _926 = _1194;
        if (_842)
        {
            _1276 = 0.60000002384185791015625;
        }
        float _1286 = _1276;
        float _1288 = _544 * _1224;
        float _1290 = _1286;
        if (!_842)
        {
            _1284 = _1218;
        }
        float _1292 = _1284;
        float _1294 = _544 * _1262;
        float _1296 = _1292;
        if (_842)
        {
            _1266 = 0.60000002384185791015625;
        }
        float _1298 = _1266;
        float _1300 = _1298;
        if (!_842)
        {
            _1300 = _1218;
        }
        float _1302 = _1300;
        float _1304 = _1302;
        if (!_842)
        {
            _1290 = _1218;
        }
        float _1306 = _1290;
        float _1308 = 1.0 / _1280;
        float _1310 = _544 * _1230;
        float _1312 = 1.0 / _1288;
        float _1314 = _544 * _1292;
        float _1316 = _1306;
        _938 = _1204;
        _940 = _1236;
        _942 = _1242;
        if (_842)
        {
            _1296 = 0.23000000417232513427734375;
        }
        float _1318 = _1296;
        float _1320 = _1318;
        if (!_842)
        {
            _1320 = _1224;
        }
        float _1322 = _1320;
        float _1324 = 1.0 / _1264;
        float _1326 = _544 * _1302;
        float _1328 = _1322;
        if (_842)
        {
            _1304 = 0.23000000417232513427734375;
        }
        float _1330 = _1304;
        float _1332 = _1330;
        if (!_842)
        {
            _1332 = _1224;
        }
        float _1334 = _1332;
        float _1336 = _544 * _1306;
        float _1338 = _1334;
        if (_842)
        {
            _1316 = 0.23000000417232513427734375;
        }
        float _1340 = _1316;
        float _1342 = _1340;
        if (!_842)
        {
            _1342 = _1224;
        }
        float _1344 = _1342;
        float _1346 = 1.0 / _1310;
        float _1348 = 1.0 / _1294;
        float _1350 = _544 * _1334;
        float _1352 = _1344;
        if (_842)
        {
            _1338 = 0.1500000059604644775390625;
        }
        float _1354 = _1338;
        float _1356 = _1354;
        if (!_842)
        {
            _1356 = _1230;
        }
        float _1358 = _1356;
        float _1360 = 1.0 / _1282;
        float _1362 = _544 * _1322;
        if (_842)
        {
            _1328 = 0.1500000059604644775390625;
        }
        float _1364 = _1328;
        float _1366 = _1364;
        if (!_842)
        {
            _1366 = _1230;
        }
        float _1368 = _1366;
        float _1370 = _544 * _1344;
        if (_842)
        {
            _1352 = 0.1500000059604644775390625;
        }
        float _1372 = _1352;
        float _1374 = _1372;
        if (!_842)
        {
            _1374 = _1230;
        }
        float _1376 = _1374;
        float _1378 = _832 * 6.283184051513671875;
        float _1380 = 1.0 / _1314;
        float _1382 = _544 * _1376;
        float _1384 = 1.0 / _1362;
        float _1386 = _1274 * _1378;
        float _1388 = _1386 * 0.15915493667125701904296875;
        float _1390 = _1308 * _1378;
        float _1392 = 1.0 / _1336;
        float _1394 = _1390 * 0.15915493667125701904296875;
        float _1396 = _1312 * _1378;
        float _1398 = 1.0 / _1350;
        float _1400 = 1.0 / _1326;
        float _1402 = _648 + _680;
        float _1404 = _544 * _1368;
        float _1406 = _1396 * 0.15915493667125701904296875;
        float _1408 = _1346 * _1378;
        float _1410 = _1402 * 6.283184051513671875;
        float _1412 = 1.0 / _1382;
        float _1414 = _1348 * _1410;
        float _1416 = _828 * _1324;
        float _1418 = _1414 * 0.15915493667125701904296875;
        float _1420 = _1360 * _1250;
        float _1422 = _1388 * 6.283185482025146484375;
        float _1424 = sin(_1422);
        float _1426 = _1416 * 6.283184051513671875;
        float _1428 = _1420 * 0.15915493667125701904296875;
        float _1430 = _1400 * _1410;
        float _1432 = _544 * _1358;
        float _1434 = 1.0 / _1370;
        float _1436 = _1430 * 0.15915493667125701904296875;
        float _1438 = _1392 * _1250;
        float _1440 = _1426 * 0.15915493667125701904296875;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = _1438 * 0.15915493667125701904296875;
        float _1448 = _1438;
        if (_842)
        {
            _1448 = 3.0;
        }
        float _1450 = _1448;
        float _1452 = _1450;
        if (!_842)
        {
            _1452 = _1194;
        }
        float _1454 = _1452;
        float _1456 = _1418 * 6.283185482025146484375;
        float _1458 = sin(_1456);
        float _1460 = _1398 * _1410;
        float _1462 = 1.0 / _1432;
        float _1464 = _1440 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        float _1468 = _1424 * _1454;
        float _1470 = _1454;
        float _1472 = _1460;
        float _1474 = _1424;
        if (_842)
        {
            _1470 = 3.0;
        }
        float _1476 = _1470;
        float _1478 = _1460 * 0.15915493667125701904296875;
        float _1480 = _1476;
        if (!_842)
        {
            _1480 = _1194;
        }
        float _1482 = _1480;
        if (_842)
        {
            _1472 = 3.0;
        }
        float _1484 = _1472;
        float _1486 = _1436 * 6.283185482025146484375;
        float _1488 = sin(_1486);
        float _1490 = _1484;
        if (_842)
        {
            _1474 = 3.0;
        }
        float _1492 = _1474;
        float _1494 = _1434 * _1250;
        float _1496 = _1492;
        if (!_842)
        {
            _1490 = _1194;
        }
        float _1498 = _1490;
        float _1500 = _1444 * _1482;
        float _1502 = _1498;
        _768 = _1444;
        if (!_842)
        {
            _1496 = _1194;
        }
        float _1504 = _1496;
        float _1506 = 1.0 / _1404;
        float _1508 = _828 * _1380;
        float _1510 = _1494 * 0.15915493667125701904296875;
        float _1512 = _1458 * _1498;
        float _1514 = _1394 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        float _1518 = _1462 * _1410;
        float _1520 = _1466 * _1504;
        float _1522 = _1508 * 6.283184051513671875;
        float _1524 = _1504;
        float _1526 = _1508;
        if (_842)
        {
            _1502 = 4.0;
        }
        float _1528 = _1502;
        float _1530 = _1528;
        if (!_842)
        {
            _1530 = _1204;
        }
        float _1532 = _1530;
        float _1534 = _1518 * 0.15915493667125701904296875;
        float _1536 = _828 * _1384;
        float _1538 = _1446 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        if (_842)
        {
            _1524 = 4.0;
        }
        float _1542 = _1524;
        float _1544 = _1522 * 0.15915493667125701904296875;
        float _1546 = _1542;
        if (!_842)
        {
            _1546 = _1204;
        }
        float _1548 = _1546;
        float _1550 = fma(_1488, _1532, _1512);
        float _1552 = _828 * _1506;
        float _1554 = _1536 * 6.283184051513671875;
        float _1556 = _1544 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        float _1560 = fma(_1516, _1548, _1468);
        float _1562 = _1554 * 0.15915493667125701904296875;
        float _1564 = _1552 * 6.283184051513671875;
        float _1566 = _1412 * _1250;
        float _1568 = _1506;
        float _1570 = _1554;
        float _1572 = _1564;
        _1182 = _1560;
        if (_842)
        {
            _1526 = 4.0;
        }
        float _1574 = _1526;
        float _1576 = _1408 * 0.15915493667125701904296875;
        float _1578 = _1574;
        if (!_842)
        {
            _1578 = _1204;
        }
        float _1580 = _1578;
        float _1582 = _1406 * 6.283185482025146484375;
        float _1584 = sin(_1582);
        float _1586 = _1564 * 0.15915493667125701904296875;
        float _1588 = _1566 * 0.15915493667125701904296875;
        float _1590 = _1478 * 6.283185482025146484375;
        float _1592 = sin(_1590);
        float _1594 = fma(_1540, _1580, _1500);
        float _1596 = _1580;
        if (_842)
        {
            _1568 = 4.0;
        }
        float _1598 = _1568;
        float _1600 = _1510 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1598;
        if (!_842)
        {
            _1604 = _1204;
        }
        float _1606 = _1604;
        float _1608 = _1562 * 6.283185482025146484375;
        float _1610 = sin(_1608);
        float _1612 = _1606;
        if (_842)
        {
            _1596 = 2.0;
        }
        float _1614 = _1596;
        float _1616 = _1614;
        if (_842)
        {
            _848 = 2.0;
        }
        float _1618 = _848;
        float _1620 = _1618;
        if (_842)
        {
            _1570 = 2.0;
        }
        float _1622 = _1570;
        float _1624 = _1576 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = _1622;
        if (!_842)
        {
            _1616 = _1236;
        }
        float _1630 = _1616;
        float _1632 = fma(_1558, _1606, _1520);
        float _1634 = _1630;
        _1114 = _1558;
        if (!_842)
        {
            _1620 = _1236;
        }
        float _1636 = _1620;
        float _1638 = _1534 * 6.283185482025146484375;
        float _1640 = sin(_1638);
        float _1642 = _1636;
        if (!_842)
        {
            _1628 = _1236;
        }
        float _1644 = _1628;
        float _1646 = _1588 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644;
        if (_842)
        {
            _1612 = 2.0;
        }
        float _1652 = _1612;
        float _1654 = _1586 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1652;
        if (!_842)
        {
            _1658 = _1236;
        }
        float _1660 = _1658;
        float _1662 = fma(_1584, _1630, _1560);
        float _1664 = fma(_1592, _1636, _1550);
        float _1666 = fma(_1602, _1644, _1594);
        float _1668 = _1626;
        _1082 = _1664;
        _1184 = _1602;
        if (_842)
        {
            _1572 = 1.5;
        }
        float _1670 = _1572;
        float _1672 = _1670;
        if (_842)
        {
            _1634 = 1.5;
        }
        float _1674 = _1634;
        float _1676 = _1674;
        if (_842)
        {
            _1642 = 1.5;
        }
        float _1678 = _1642;
        float _1680 = _1678;
        if (_842)
        {
            _1650 = 1.5;
        }
        float _1682 = _1650;
        float _1684 = fma(_1610, _1660, _1632);
        float _1686 = _1682;
        float _1688 = _1610;
        if (!_842)
        {
            _1672 = _1242;
        }
        float _1690 = _1672;
        if (!_842)
        {
            _1680 = _1242;
        }
        float _1692 = _1680;
        if (!_842)
        {
            _1686 = _1242;
        }
        float _1694 = _1686;
        if (!_842)
        {
            _1676 = _1242;
        }
        float _1696 = _1676;
        float _1698 = fma(_1626, _1690, _1662);
        float _1700 = fma(_1640, _1692, _1664);
        float _1702 = fma(_1648, _1694, _1666);
        float _1704 = fma(_1656, _1696, _1684);
        float _1706 = -_1700;
        float _1708 = _1706 + _1702;
        float _1710 = -_1704;
        float _1712 = _1698 + _1710;
        float _1714 = _1704;
        float _1716 = _1696;
        float _1718 = _1700;
        float _1720 = _1712;
        _1140 = _1648;
        if (_842)
        {
            _1714 = 1.5;
        }
        float _1722 = _1714;
        _1152 = _1722;
        if (_842)
        {
            _1716 = 2.0;
        }
        float _1724 = _1716;
        float _1726 = _1712 + _1708;
        _1160 = _1724;
        _1162 = _1726;
        if (_842)
        {
            _1718 = 3.0;
        }
        float _1728 = _1718;
        _1166 = _1728;
        if (_842)
        {
            _1668 = 4.0;
        }
        float _1730 = _1668;
        _1170 = _1730;
        if (_842)
        {
            _1720 = 0.1500000059604644775390625;
        }
        float _1732 = _1720;
        _1174 = _1732;
        if (_842)
        {
            _1688 = 0.23000000417232513427734375;
        }
        float _1734 = _1688;
        _1178 = _1734;
        if (_842)
        {
            _1182 = 0.4199999868869781494140625;
        }
    }
    _1186 = false;
    float _1736 = _1182;
    float _1738 = _1178;
    float _1740 = _1114;
    float _1742 = _1174;
    float _1744 = _1082;
    float _1746 = _1140;
    float _1748 = _1166;
    float _1750 = _926;
    float _1752 = _1170;
    float _1754 = _938;
    float _1756 = _1160;
    float _1758 = _940;
    float _1760 = _1152;
    float _1762 = _942;
    float _1764 = _768;
    float _1766 = _1184;
    float _1768 = _1162;
    float _1770 = _826 + _650;
    float _1772 = _550 + _1770;
    float _1774 = _1772 + _680;
    float _1776 = _1740;
    float _1778 = _1744;
    float _1780 = _1746;
    float _1782 = _1772;
    float _1784 = _1770;
    float _1786 = _1744;
    float _1788 = _1746;
    float _1790 = _1764;
    float _1792 = _1766;
    float _1794 = _1772;
    float _1796 = _1740;
    float _1798 = _1770;
    float _1800 = _1766;
    float _1802 = _1736;
    float _1804 = _1738;
    float _1806 = _1742;
    float _1808 = _1756;
    float _1810 = _1748;
    float _1812 = _1752;
    float _1814 = _1760;
    float _1816 = _1736;
    float _1818 = _1738;
    float _1820 = _1742;
    float _1822 = _1760;
    float _1824 = _1762;
    float _1826 = _1756;
    float _1828 = _1748;
    float _1830 = _1752;
    float _1832 = _1768;
    float _2038;
    float _2054;
    float _2088;
    float _2090;
    float _2092;
    if (!_714)
    {
        if (_842)
        {
            _670 = _1736;
        }
        float _1834 = _670;
        if (_842)
        {
            _1776 = 0.60000002384185791015625;
        }
        float _1836 = _1776;
        float _1838 = _1834;
        if (!_842)
        {
            float _1840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1838 = _1840;
        }
        float _1842 = _1838;
        if (_842)
        {
            _1778 = _1738;
        }
        float _1844 = _1778;
        float _1846 = _1836;
        if (!_842)
        {
            float _1848 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1846 = _1848;
        }
        float _1850 = _1846;
        if (_842)
        {
            _1780 = _1742;
        }
        float _1852 = _1780;
        float _1854 = _1844;
        if (!_842)
        {
            float _1856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1854 = _1856;
        }
        float _1858 = _1854;
        float _1860 = _1852;
        if (!_842)
        {
            float _1862 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1860 = _1862;
        }
        float _1864 = _1860;
        if (_842)
        {
            _1782 = _1736;
        }
        float _1866 = _1782;
        float _1868 = _544 * _1842;
        float _1870 = _1866;
        float _1872 = _1842;
        if (!_842)
        {
            _1870 = _1842;
        }
        float _1874 = _1870;
        float _1876 = _1874;
        if (_842)
        {
            _1872 = 0.60000002384185791015625;
        }
        float _1878 = _1872;
        float _1880 = _544 * _1850;
        float _1882 = _1878;
        if (!_842)
        {
            _1882 = _1850;
        }
        float _1884 = _1882;
        float _1886 = 1.0 / _1868;
        float _1888 = _544 * _1874;
        float _1890 = _544 * _1858;
        float _1892 = _1884;
        if (_842)
        {
            _1876 = _1738;
        }
        float _1894 = _1876;
        float _1896 = _1894;
        if (!_842)
        {
            _1896 = _1858;
        }
        float _1898 = _1896;
        float _1900 = _544 * _1864;
        float _1902 = 1.0 / _1880;
        float _1904 = _544 * _1898;
        float _1906 = 1.0 / _1890;
        float _1908 = _544 * _1884;
        if (_842)
        {
            _1892 = _1742;
        }
        float _1910 = _1892;
        float _1912 = _1910;
        if (!_842)
        {
            _1912 = _1864;
        }
        float _1914 = _1912;
        float _1916 = _1774 * 6.283184051513671875;
        float _1918 = 1.0 / _1900;
        float _1920 = _544 * _1914;
        float _1922 = _1886 * _1916;
        float _1924 = _1922 * 0.15915493667125701904296875;
        float _1926 = _1902 * _1916;
        float _1928 = 1.0 / _1888;
        float _1930 = _1926 * 0.15915493667125701904296875;
        float _1932 = _1906 * _1916;
        float _1934 = 1.0 / _1908;
        float _1936 = _1932 * 0.15915493667125701904296875;
        float _1938 = _1918 * _1916;
        float _1940 = 1.0 / _1904;
        float _1942 = _1770 * _1928;
        float _1944 = _1942 * 6.283184051513671875;
        float _1946 = 1.0 / _1920;
        float _1948 = _1944 * 0.15915493667125701904296875;
        float _1950 = _1924 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1938 * 0.15915493667125701904296875;
        float _1956 = _1770 * _1934;
        float _1958 = _1956 * 6.283184051513671875;
        float _1960 = _1770 * _1940;
        float _1962 = _1948 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1770 * _1946;
        float _1968 = _1958 * 0.15915493667125701904296875;
        float _1970 = _1960 * 6.283184051513671875;
        float _1972 = _1958;
        float _1974 = _1960;
        if (_842)
        {
            _1972 = _1748;
        }
        float _1976 = _1972;
        float _1978 = _1976;
        if (_842)
        {
            _1974 = _1748;
        }
        float _1980 = _1974;
        float _1982 = _1970 * 0.15915493667125701904296875;
        float _1984 = _1930 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        float _1988 = _1966 * 6.283184051513671875;
        float _1990 = _1980;
        if (!_842)
        {
            _1978 = _1750;
        }
        float _1992 = _1978;
        float _1994 = _1992;
        if (!_842)
        {
            _1990 = _1750;
        }
        float _1996 = _1990;
        float _1998 = _1988 * 0.15915493667125701904296875;
        float _2000 = _1996;
        if (_842)
        {
            _1784 = _1752;
        }
        float _2002 = _1784;
        float _2004 = _1952 * _1992;
        float _2006 = _1968 * 6.283185482025146484375;
        float _2008 = sin(_2006);
        float _2010 = _2002;
        float _2012 = _1952;
        if (!_842)
        {
            _2010 = _1754;
        }
        float _2014 = _2010;
        float _2016 = _1964 * _1996;
        float _2018 = _2014;
        if (_842)
        {
            _2000 = _1752;
        }
        float _2020 = _2000;
        float _2022 = _2020;
        if (!_842)
        {
            _2022 = _1754;
        }
        float _2024 = _2022;
        if (_842)
        {
            _2012 = _1756;
        }
        float _2026 = _2012;
        float _2028 = _1936 * 6.283185482025146484375;
        float _2030 = sin(_2028);
        float _2032 = fma(_1986, _2014, _2004);
        float _2034 = _2026;
        float _2036 = _1986;
        _2038 = _2032;
        if (_842)
        {
            _2018 = _1756;
        }
        float _2040 = _2018;
        float _2042 = _2040;
        if (!_842)
        {
            _2034 = _1758;
        }
        float _2044 = _2034;
        if (!_842)
        {
            _2042 = _1758;
        }
        float _2046 = _2042;
        float _2048 = _1982 * 6.283185482025146484375;
        float _2050 = sin(_2048);
        float _2052 = fma(_2008, _2024, _2016);
        _2054 = _2052;
        if (_842)
        {
            _2036 = _1760;
        }
        float _2056 = _2036;
        float _2058 = _2056;
        if (_842)
        {
            _1994 = _1760;
        }
        float _2060 = _1994;
        float _2062 = _2060;
        if (!_842)
        {
            _2058 = _1762;
        }
        float _2064 = _2058;
        float _2066 = _1954 * 6.283185482025146484375;
        float _2068 = sin(_2066);
        if (!_842)
        {
            _2062 = _1762;
        }
        float _2070 = _2062;
        float _2072 = fma(_2030, _2044, _2032);
        float _2074 = _1998 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = fma(_2050, _2046, _2052);
        float _2080 = fma(_2068, _2064, _2072);
        float _2082 = fma(_2076, _2070, _2078);
        float _2084 = -_2082;
        float _2086 = _2080 + _2084;
        _2088 = _2068;
        _2090 = _2082;
        _2092 = _2086;
        _2094 = true;
    }
    else
    {
        if (_842)
        {
            _1786 = _1736;
        }
        float _2096 = _1786;
        if (_842)
        {
            _1788 = 0.60000002384185791015625;
        }
        float _2098 = _1788;
        float _2100 = _2096;
        if (!_842)
        {
            float _2102 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2100 = _2102;
        }
        float _2104 = _2100;
        if (_842)
        {
            _1790 = _1738;
        }
        float _2106 = _1790;
        float _2108 = _2098;
        if (!_842)
        {
            float _2110 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2108 = _2110;
        }
        float _2112 = _2108;
        float _2114 = _2106;
        if (!_842)
        {
            float _2116 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2114 = _2116;
        }
        float _2118 = _2114;
        if (_842)
        {
            _1792 = _1742;
        }
        float _2120 = _1792;
        float _2122 = _2120;
        if (!_842)
        {
            float _2124 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2122 = _2124;
        }
        float _2126 = _2122;
        if (_842)
        {
            _1794 = _1736;
        }
        float _2128 = _1794;
        float _2130 = _650 * 6.283184051513671875;
        float _2132 = _2128;
        if (_842)
        {
            _1796 = _1736;
        }
        float _2134 = _1796;
        float _2136 = _2134;
        float _2138 = _2104;
        if (!_842)
        {
            _2132 = _2104;
        }
        float _2140 = _2132;
        float _2142 = _544 * _2104;
        float _2144 = _2140;
        if (!_842)
        {
            _2136 = _2104;
        }
        float _2146 = _2136;
        float _2148 = _544 * _2112;
        float _2150 = _544 * _2140;
        float _2152 = _2146;
        if (_842)
        {
            _2144 = _1736;
        }
        float _2154 = _2144;
        float _2156 = 1.0 / _2142;
        float _2158 = _2154;
        if (!_842)
        {
            _2158 = _2104;
        }
        float _2160 = _2158;
        float _2162 = _544 * _2118;
        float _2164 = _2160;
        if (_842)
        {
            _2138 = 0.60000002384185791015625;
        }
        float _2166 = _2138;
        float _2168 = _2166;
        if (!_842)
        {
            _2168 = _2112;
        }
        float _2170 = _2168;
        float _2172 = _544 * _2160;
        float _2174 = _2170;
        if (_842)
        {
            _2164 = 0.60000002384185791015625;
        }
        float _2176 = _2164;
        float _2178 = 1.0 / _2148;
        float _2180 = _2176;
        if (!_842)
        {
            _2180 = _2112;
        }
        float _2182 = _2180;
        float _2184 = _544 * _2126;
        float _2186 = 1.0 / _2162;
        float _2188 = _544 * _2146;
        float _2190 = _2182;
        if (_842)
        {
            _2152 = 0.60000002384185791015625;
        }
        float _2192 = _2152;
        float _2194 = _2192;
        if (!_842)
        {
            _2194 = _2112;
        }
        float _2196 = _2194;
        float _2198 = _544 * _2182;
        float _2200 = _2196;
        if (_842)
        {
            _2190 = _1738;
        }
        float _2202 = _2190;
        float _2204 = _2202;
        if (!_842)
        {
            _2204 = _2118;
        }
        float _2206 = _2204;
        float _2208 = _544 * _2170;
        float _2210 = _2206;
        if (_842)
        {
            _2174 = _1738;
        }
        float _2212 = _2174;
        float _2214 = _544 * _2196;
        float _2216 = _2212;
        if (!_842)
        {
            _2216 = _2118;
        }
        float _2218 = _2216;
        float _2220 = 1.0 / _2188;
        float _2222 = _2218;
        if (_842)
        {
            _2200 = _1738;
        }
        float _2224 = _2200;
        float _2226 = _2224;
        if (!_842)
        {
            _2226 = _2118;
        }
        float _2228 = _2226;
        float _2230 = _544 * _2206;
        float _2232 = _2228;
        if (_842)
        {
            _2210 = _1742;
        }
        float _2234 = _2210;
        float _2236 = _2234;
        if (!_842)
        {
            _2236 = _2126;
        }
        float _2238 = _2236;
        float _2240 = 1.0 / _2184;
        float _2242 = _544 * _2218;
        if (_842)
        {
            _2222 = _1742;
        }
        float _2244 = _2222;
        float _2246 = _2244;
        if (!_842)
        {
            _2246 = _2126;
        }
        float _2248 = _2246;
        float _2250 = 1.0 / _2150;
        float _2252 = _544 * _2228;
        if (_842)
        {
            _2232 = _1742;
        }
        float _2254 = _2232;
        float _2256 = _2254;
        if (!_842)
        {
            _2256 = _2126;
        }
        float _2258 = _2256;
        float _2260 = _1774 * 6.283184051513671875;
        float _2262 = 1.0 / _2172;
        float _2264 = _544 * _2258;
        float _2266 = 1.0 / _2214;
        float _2268 = 1.0 / _2198;
        float _2270 = _544 * _2248;
        float _2272 = _650 + _680;
        float _2274 = _2262 * _2130;
        float _2276 = 1.0 / _2252;
        float _2278 = _544 * _2238;
        float _2280 = _2156 * _2260;
        float _2282 = _2272 * 6.283184051513671875;
        float _2284 = _2220 * _2282;
        float _2286 = 1.0 / _2278;
        float _2288 = _2280 * 0.15915493667125701904296875;
        float _2290 = _2178 * _2260;
        float _2292 = _2274 * 0.15915493667125701904296875;
        float _2294 = _2266 * _2282;
        float _2296 = _2290 * 0.15915493667125701904296875;
        float _2298 = _2186 * _2260;
        float _2300 = 1.0 / _2230;
        float _2302 = _2284 * 0.15915493667125701904296875;
        float _2304 = _1770 * _2250;
        float _2306 = _2304 * 6.283184051513671875;
        float _2308 = 1.0 / _2264;
        float _2310 = _2306 * 0.15915493667125701904296875;
        float _2312 = _2276 * _2282;
        float _2314 = _2288 * 6.283185482025146484375;
        float _2316 = sin(_2314);
        float _2318 = _2298 * 0.15915493667125701904296875;
        float _2320 = _2240 * _2260;
        float _2322 = _2294 * 0.15915493667125701904296875;
        float _2324 = _2268 * _2130;
        float _2326 = _2312 * 0.15915493667125701904296875;
        float _2328 = _2312;
        float _2330 = _2324;
        if (_842)
        {
            _2328 = _1748;
        }
        float _2332 = _2328;
        float _2334 = _2300 * _2130;
        float _2336 = 1.0 / _2208;
        float _2338 = _2324 * 0.15915493667125701904296875;
        float _2340 = _2332;
        if (_842)
        {
            _2330 = _1748;
        }
        float _2342 = _2330;
        float _2344 = _2334 * 0.15915493667125701904296875;
        float _2346 = _2342;
        if (!_842)
        {
            _2346 = _1750;
        }
        float _2348 = _2346;
        float _2350 = _2308 * _2282;
        float _2352 = _2348;
        if (!_842)
        {
            _2340 = _1750;
        }
        float _2354 = _2340;
        float _2356 = _2320 * 0.15915493667125701904296875;
        float _2358 = _2302 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        float _2362 = _2350 * 0.15915493667125701904296875;
        float _2364 = _2292 * 6.283185482025146484375;
        float _2366 = sin(_2364);
        float _2368 = _2316 * _2348;
        float _2370 = _2316;
        float _2372 = _2354;
        if (_842)
        {
            _2352 = _1748;
        }
        float _2374 = _2352;
        float _2376 = _1770 * _2336;
        float _2378 = _2374;
        float _2380 = _2376;
        if (_842)
        {
            _2370 = _1748;
        }
        float _2382 = _2370;
        float _2384 = _2382;
        if (!_842)
        {
            _2378 = _1750;
        }
        float _2386 = _2378;
        float _2388 = _2310 * 6.283185482025146484375;
        float _2390 = sin(_2388);
        float _2392 = _2386;
        if (!_842)
        {
            _2384 = _1750;
        }
        float _2394 = _2384;
        float _2396 = _2360 * _2354;
        if (_842)
        {
            _2372 = _1752;
        }
        float _2398 = _2372;
        float _2400 = _2398;
        if (!_842)
        {
            _2400 = _1754;
        }
        float _2402 = _2400;
        float _2404 = 1.0 / _2242;
        float _2406 = _2366 * _2386;
        if (_842)
        {
            _2392 = _1752;
        }
        float _2408 = _2392;
        float _2410 = _2408;
        if (!_842)
        {
            _2410 = _1754;
        }
        float _2412 = _2410;
        float _2414 = _2338 * 6.283185482025146484375;
        float _2416 = sin(_2414);
        float _2418 = _2390 * _2394;
        float _2420 = _2376 * 6.283184051513671875;
        if (_842)
        {
            _2380 = _1752;
        }
        float _2422 = _2380;
        float _2424 = _2422;
        if (!_842)
        {
            _2424 = _1754;
        }
        float _2426 = _2424;
        float _2428 = _2420 * 0.15915493667125701904296875;
        float _2430 = _2286 * _2130;
        float _2432 = _2322 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _1770 * _2404;
        float _2438 = _2430 * 0.15915493667125701904296875;
        float _2440 = 1.0 / _2270;
        float _2442 = fma(_2416, _2412, _2406);
        float _2444 = _2436 * 6.283184051513671875;
        float _2446 = _2436;
        float _2448 = _2444;
        if (_842)
        {
            _2446 = _1752;
        }
        float _2450 = _2446;
        float _2452 = _2450;
        if (!_842)
        {
            _2452 = _1754;
        }
        float _2454 = _2452;
        float _2456 = _2296 * 6.283185482025146484375;
        float _2458 = sin(_2456);
        float _2460 = fma(_2434, _2426, _2396);
        float _2462 = _2318 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        float _2466 = _1770 * _2440;
        float _2468 = _2440;
        float _2470 = _2454;
        if (_842)
        {
            _2468 = _1756;
        }
        float _2472 = _2468;
        float _2474 = _2472;
        if (!_842)
        {
            _2474 = _1758;
        }
        float _2476 = _2474;
        float _2478 = _2466 * 6.283184051513671875;
        float _2480 = _2478;
        float _2482 = _2476;
        if (_842)
        {
            _1798 = _1756;
        }
        float _2484 = _1798;
        float _2486 = _2428 * 6.283185482025146484375;
        float _2488 = sin(_2486);
        float _2490 = fma(_2458, _2402, _2368);
        float _2492 = _2444 * 0.15915493667125701904296875;
        float _2494 = _2478 * 0.15915493667125701904296875;
        float _2496 = _2484;
        _2054 = _2494;
        if (_842)
        {
            _2448 = _1756;
        }
        float _2498 = _2448;
        float _2500 = _2498;
        if (!_842)
        {
            _2496 = _1758;
        }
        float _2502 = _2496;
        float _2504 = _2326 * 6.283185482025146484375;
        float _2506 = sin(_2504);
        float _2508 = fma(_2464, _2476, _2490);
        float _2510 = _2502;
        if (!_842)
        {
            _2500 = _1758;
        }
        float _2512 = _2500;
        float _2514 = _2512;
        if (_842)
        {
            _2480 = _1760;
        }
        float _2516 = _2480;
        float _2518 = _2516;
        if (_842)
        {
            _2482 = _1760;
        }
        float _2520 = _2482;
        float _2522 = _2344 * 6.283185482025146484375;
        float _2524 = sin(_2522);
        float _2526 = fma(_2488, _2454, _2418);
        float _2528 = _2520;
        _2090 = _2488;
        if (_842)
        {
            _2470 = _1756;
        }
        float _2530 = _2470;
        float _2532 = _2530;
        if (!_842)
        {
            _2532 = _1758;
        }
        float _2534 = _2532;
        if (!_842)
        {
            _2518 = _1762;
        }
        float _2536 = _2518;
        float _2538 = _2492 * 6.283185482025146484375;
        float _2540 = sin(_2538);
        float _2542 = fma(_2506, _2502, _2460);
        if (_842)
        {
            _2510 = _1760;
        }
        float _2544 = _2510;
        float _2546 = _2544;
        if (!_842)
        {
            _2546 = _1762;
        }
        float _2548 = _2546;
        if (!_842)
        {
            _2528 = _1762;
        }
        float _2550 = _2528;
        float _2552 = _2356 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        float _2556 = fma(_2524, _2512, _2442);
        if (_842)
        {
            _2514 = _1760;
        }
        float _2558 = _2514;
        float _2560 = _2558;
        if (!_842)
        {
            _2560 = _1762;
        }
        float _2562 = _2560;
        float _2564 = _2362 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        float _2568 = fma(_2540, _2534, _2526);
        float _2570 = _2438 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        float _2574 = fma(_2554, _2536, _2508);
        float _2576 = _2494 * 6.283185482025146484375;
        float _2578 = sin(_2576);
        float _2580 = fma(_2566, _2548, _2542);
        float _2582 = fma(_2572, _2562, _2556);
        float _2584 = -_2580;
        float _2586 = _2584 + _2582;
        float _2588 = fma(_2578, _2550, _2568);
        float _2590 = -_2588;
        float _2592 = _2574 + _2590;
        float _2594 = _2592 + _2586;
        _2038 = _2592;
        _2088 = _2540;
        _1800 = _2580;
        _2092 = _2594;
    }
    _2094 = false;
    float _2596 = _2038;
    float _2598 = _2088;
    float _2600 = _2054;
    float _2602 = _2090;
    float _2604 = _1800;
    float _2606 = _2092;
    float _2608 = _826 + _652;
    float _2610 = _550 + _2608;
    float _2612 = _2610 + _680;
    float _2614 = _2610;
    float _2616 = _2596;
    float _2618 = _2598;
    float _2620 = _2600;
    float _2622 = _2598;
    float _2624 = _2602;
    float _2626 = _2604;
    float _2628 = _2610;
    float _2630 = _2596;
    float _2632 = _2606;
    float _2782;
    float _2848;
    float _2850;
    float _2852;
    float _2854;
    float _2856;
    if (!_714)
    {
        if (_842)
        {
            _672 = _1736;
        }
        float _2634 = _672;
        if (_842)
        {
            _2614 = 0.60000002384185791015625;
        }
        float _2636 = _2614;
        if (_842)
        {
            _2616 = _1738;
        }
        float _2638 = _2616;
        float _2640 = _2634;
        if (!_842)
        {
            float _2642 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2640 = _2642;
        }
        float _2644 = _2640;
        float _2646 = _2636;
        if (!_842)
        {
            float _2648 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2646 = _2648;
        }
        float _2650 = _2646;
        if (_842)
        {
            _2618 = _1742;
        }
        float _2652 = _2618;
        float _2654 = _2638;
        if (!_842)
        {
            float _2656 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2654 = _2656;
        }
        float _2658 = _2654;
        float _2660 = _2652;
        if (!_842)
        {
            float _2662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2660 = _2662;
        }
        float _2664 = _2660;
        float _2666 = _544 * _2644;
        float _2668 = _2644;
        if (!_842)
        {
            _1802 = _2644;
        }
        float _2670 = _1802;
        if (_842)
        {
            _2668 = 0.60000002384185791015625;
        }
        float _2672 = _2668;
        float _2674 = _544 * _2650;
        float _2676 = 1.0 / _2666;
        float _2678 = _544 * _2670;
        float _2680 = _2672;
        if (!_842)
        {
            _2680 = _2650;
        }
        float _2682 = _2680;
        float _2684 = _544 * _2658;
        if (!_842)
        {
            _1804 = _2658;
        }
        float _2686 = _1804;
        float _2688 = _2612 * 6.283184051513671875;
        float _2690 = _544 * _2664;
        float _2692 = 1.0 / _2674;
        if (!_842)
        {
            _1806 = _2664;
        }
        float _2694 = _1806;
        float _2696 = _544 * _2682;
        float _2698 = _544 * _2686;
        float _2700 = _544 * _2694;
        float _2702 = 1.0 / _2684;
        float _2704 = _2676 * _2688;
        float _2706 = _2704 * 0.15915493667125701904296875;
        float _2708 = 1.0 / _2690;
        float _2710 = _2692 * _2688;
        float _2712 = _2710 * 0.15915493667125701904296875;
        float _2714 = 1.0 / _2678;
        float _2716 = _2702 * _2688;
        float _2718 = 1.0 / _2696;
        float _2720 = 1.0 / _2698;
        float _2722 = _2608 * _2714;
        float _2724 = _2722 * 6.283184051513671875;
        float _2726 = 1.0 / _2700;
        float _2728 = _2716 * 0.15915493667125701904296875;
        float _2730 = _2708 * _2688;
        float _2732 = _2724 * 0.15915493667125701904296875;
        float _2734 = _2730 * 0.15915493667125701904296875;
        float _2736 = _2608 * _2718;
        float _2738 = _2706 * 6.283185482025146484375;
        float _2740 = sin(_2738);
        float _2742 = _2700;
        if (_842)
        {
            _2742 = _1756;
        }
        float _2744 = _2742;
        float _2746 = _2736 * 6.283184051513671875;
        float _2748 = _2608 * _2720;
        float _2750 = _2744;
        float _2752 = _2746;
        if (!_842)
        {
            _2750 = _1758;
        }
        float _2754 = _2750;
        if (!_842)
        {
            _1808 = _1758;
        }
        float _2756 = _1808;
        float _2758 = _2732 * 6.283185482025146484375;
        float _2760 = sin(_2758);
        float _2762 = _2746 * 0.15915493667125701904296875;
        float _2764 = _2748 * 6.283184051513671875;
        float _2766 = _2608 * _2726;
        float _2768 = _2764;
        if (_842)
        {
            _2752 = _1748;
        }
        float _2770 = _2752;
        float _2772 = _2764 * 0.15915493667125701904296875;
        float _2774 = _2766 * 6.283184051513671875;
        float _2776 = _2712 * 6.283185482025146484375;
        float _2778 = sin(_2776);
        float _2780 = _2770;
        _2782 = _2772;
        if (!_842)
        {
            _2780 = _1750;
        }
        float _2784 = _2780;
        float _2786 = _2774 * 0.15915493667125701904296875;
        if (!_842)
        {
            _1810 = _1750;
        }
        float _2788 = _1810;
        float _2790 = _2788;
        if (_842)
        {
            _2768 = _1752;
        }
        float _2792 = _2768;
        float _2794 = _2740 * _2784;
        float _2796 = _2762 * 6.283185482025146484375;
        float _2798 = sin(_2796);
        float _2800 = _2792;
        if (!_842)
        {
            _2800 = _1754;
        }
        float _2802 = _2800;
        float _2804 = _2760 * _2788;
        if (!_842)
        {
            _1812 = _1754;
        }
        float _2806 = _1812;
        if (_842)
        {
            _2790 = _1760;
        }
        float _2808 = _2790;
        float _2810 = _2808;
        if (!_842)
        {
            _2810 = _1762;
        }
        float _2812 = _2810;
        float _2814 = _2728 * 6.283185482025146484375;
        float _2816 = sin(_2814);
        float _2818 = fma(_2778, _2802, _2794);
        if (!_842)
        {
            _1814 = _1762;
        }
        float _2820 = _1814;
        float _2822 = _2772 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = fma(_2798, _2806, _2804);
        float _2828 = _2734 * 6.283185482025146484375;
        float _2830 = sin(_2828);
        float _2832 = fma(_2816, _2754, _2818);
        float _2834 = _2786 * 6.283185482025146484375;
        float _2836 = sin(_2834);
        float _2838 = fma(_2824, _2756, _2826);
        float _2840 = fma(_2830, _2812, _2832);
        float _2842 = fma(_2836, _2820, _2838);
        float _2844 = -_2842;
        float _2846 = _2840 + _2844;
        _2848 = _2846;
        _2850 = _2824;
        _2852 = _2816;
        _2854 = _2830;
        _2856 = _2836;
        _2858 = true;
    }
    else
    {
        if (_842)
        {
            _2620 = _1736;
        }
        float _2860 = _2620;
        if (_842)
        {
            _2622 = 0.60000002384185791015625;
        }
        float _2862 = _2622;
        float _2864 = _2860;
        if (!_842)
        {
            float _2866 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2864 = _2866;
        }
        float _2868 = _2864;
        if (_842)
        {
            _2624 = _1738;
        }
        float _2870 = _2624;
        if (_842)
        {
            _2626 = _1742;
        }
        float _2872 = _2626;
        float _2874 = _2862;
        if (!_842)
        {
            float _2876 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2874 = _2876;
        }
        float _2878 = _2874;
        float _2880 = _2870;
        if (!_842)
        {
            float _2882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2880 = _2882;
        }
        float _2884 = _2880;
        float _2886 = _2872;
        if (!_842)
        {
            float _2888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2886 = _2888;
        }
        float _2890 = _2886;
        if (_842)
        {
            _2628 = _1736;
        }
        float _2892 = _2628;
        float _2894 = _652 + _680;
        float _2896 = _2892;
        if (_842)
        {
            _2630 = _1736;
        }
        float _2898 = _2630;
        float _2900 = _2612 * 6.283184051513671875;
        float _2902 = _2898;
        if (!_842)
        {
            _2896 = _2868;
        }
        float _2904 = _2896;
        float _2906 = _544 * _2868;
        float _2908 = _2904;
        if (!_842)
        {
            _2902 = _2868;
        }
        float _2910 = _2902;
        float _2912 = _544 * _2878;
        float _2914 = _544 * _2904;
        float _2916 = _2910;
        if (_842)
        {
            _2908 = 0.60000002384185791015625;
        }
        float _2918 = _2908;
        float _2920 = _544 * _2910;
        float _2922 = _2918;
        if (!_842)
        {
            _2922 = _2878;
        }
        float _2924 = _2922;
        float _2926 = 1.0 / _2912;
        float _2928 = _2924;
        if (!_842)
        {
            _1816 = _2868;
        }
        float _2930 = _1816;
        float _2932 = _544 * _2884;
        if (_842)
        {
            _2916 = 0.60000002384185791015625;
        }
        float _2934 = _2916;
        float _2936 = _544 * _2890;
        float _2938 = _2934;
        if (!_842)
        {
            _2938 = _2878;
        }
        float _2940 = _2938;
        float _2942 = _544 * _2930;
        float _2944 = 1.0 / _2914;
        float _2946 = _544 * _2924;
        float _2948 = _2940;
        if (_842)
        {
            _2928 = 0.60000002384185791015625;
        }
        float _2950 = _2928;
        float _2952 = _2950;
        if (!_842)
        {
            _2952 = _2878;
        }
        float _2954 = _2952;
        float _2956 = 1.0 / _2932;
        float _2958 = 1.0 / _2936;
        float _2960 = _544 * _2940;
        float _2962 = _2954;
        if (_842)
        {
            _2948 = _1738;
        }
        float _2964 = _2948;
        float _2966 = _2964;
        if (!_842)
        {
            _2966 = _2884;
        }
        float _2968 = _2966;
        float _2970 = 1.0 / _2942;
        float _2972 = _544 * _2954;
        if (_842)
        {
            _2962 = _1738;
        }
        float _2974 = _2962;
        float _2976 = _2974;
        if (!_842)
        {
            _1818 = _2884;
        }
        float _2978 = _1818;
        float _2980 = _2978;
        if (!_842)
        {
            _2976 = _2884;
        }
        float _2982 = _2976;
        float _2984 = _2894 * 6.283184051513671875;
        float _2986 = 1.0 / _2906;
        float _2988 = _544 * _2978;
        float _2990 = _2982;
        if (_842)
        {
            _2980 = _1742;
        }
        float _2992 = _2980;
        float _2994 = _544 * _2968;
        float _2996 = _2992;
        if (!_842)
        {
            _2996 = _2890;
        }
        float _2998 = _2996;
        float _3000 = _544 * _2982;
        float _3002 = _2944 * _2984;
        if (_842)
        {
            _2990 = _1742;
        }
        float _3004 = _2990;
        float _3006 = 1.0 / _2920;
        float _3008 = _652 * 6.283184051513671875;
        float _3010 = _3004;
        float _3012 = _3008;
        if (!_842)
        {
            _3010 = _2890;
        }
        float _3014 = _3010;
        float _3016 = _3002 * 0.15915493667125701904296875;
        if (!_842)
        {
            _1820 = _2890;
        }
        float _3018 = _1820;
        float _3020 = _2970 * _3008;
        float _3022 = 1.0 / _2960;
        float _3024 = _3020 * 0.15915493667125701904296875;
        float _3026 = 1.0 / _2972;
        float _3028 = _544 * _3014;
        float _3030 = _2608 * _3006;
        float _3032 = _3030 * 6.283184051513671875;
        float _3034 = 1.0 / _3000;
        float _3036 = _544 * _2998;
        float _3038 = _3022 * _2984;
        float _3040 = _3032 * 0.15915493667125701904296875;
        float _3042 = _3022;
        float _3044 = _3040;
        if (_842)
        {
            _3042 = _1760;
        }
        float _3046 = _3042;
        float _3048 = _3046;
        if (!_842)
        {
            _3048 = _1762;
        }
        float _3050 = _3048;
        float _3052 = 1.0 / _3036;
        float _3054 = _544 * _3018;
        float _3056 = _2986 * _2900;
        float _3058 = _3056 * 0.15915493667125701904296875;
        float _3060 = _2926 * _2900;
        float _3062 = 1.0 / _3054;
        float _3064 = _3038 * 0.15915493667125701904296875;
        float _3066 = _3026 * _3008;
        float _3068 = _3060 * 0.15915493667125701904296875;
        float _3070 = _2956 * _2900;
        float _3072 = _3066 * 0.15915493667125701904296875;
        float _3074 = _3034 * _2984;
        float _3076 = 1.0 / _2946;
        float _3078 = _3070 * 0.15915493667125701904296875;
        float _3080 = _2958 * _2900;
        float _3082 = _3074 * 0.15915493667125701904296875;
        float _3084 = _3052 * _2984;
        float _3086 = _3034;
        float _3088 = _3052;
        if (_842)
        {
            _3086 = _1760;
        }
        float _3090 = _3086;
        float _3092 = _3080 * 0.15915493667125701904296875;
        float _3094 = _3090;
        if (_842)
        {
            _3088 = _1760;
        }
        float _3096 = _3088;
        float _3098 = 1.0 / _2988;
        float _3100 = _3084 * 0.15915493667125701904296875;
        float _3102 = _3062 * _3008;
        float _3104 = _3096;
        float _3106 = _3062;
        float _3108 = _3098;
        if (!_842)
        {
            _3094 = _1762;
        }
        float _3110 = _3094;
        if (!_842)
        {
            _3104 = _1762;
        }
        float _3112 = _3104;
        float _3114 = _3102 * 0.15915493667125701904296875;
        _2782 = _3112;
        if (!_842)
        {
            _1822 = _1762;
        }
        float _3116 = _1822;
        float _3118 = 1.0 / _2994;
        float _3120 = _2608 * _3076;
        float _3122 = _3076;
        if (_842)
        {
            _1824 = _1748;
        }
        float _3124 = _1824;
        float _3126 = _3124;
        if (_842)
        {
            _3122 = _1748;
        }
        float _3128 = _3122;
        float _3130 = _3120 * 6.283184051513671875;
        float _3132 = _3128;
        float _3134 = _3130;
        if (!_842)
        {
            _3126 = _1750;
        }
        float _3136 = _3126;
        float _3138 = 1.0 / _3028;
        float _3140 = _3130 * 0.15915493667125701904296875;
        if (!_842)
        {
            _3132 = _1750;
        }
        float _3142 = _3132;
        if (_842)
        {
            _3134 = _1752;
        }
        float _3144 = _3134;
        float _3146 = _3144;
        if (!_842)
        {
            _3146 = _1754;
        }
        float _3148 = _3146;
        float _3150 = _3016 * 6.283185482025146484375;
        float _3152 = sin(_3150);
        float _3154 = _2608 * _3118;
        if (_842)
        {
            _3106 = _1756;
        }
        float _3156 = _3106;
        float _3158 = _3156;
        if (!_842)
        {
            _3158 = _1758;
        }
        float _3160 = _3158;
        float _3162 = _3154 * 6.283184051513671875;
        float _3164 = _2608 * _3138;
        float _3166 = _3098 * _3008;
        float _3168 = _3058 * 6.283185482025146484375;
        float _3170 = sin(_3168);
        float _3172 = _3162;
        _2856 = _3160;
        if (_842)
        {
            _3012 = _1756;
        }
        float _3174 = _3012;
        float _3176 = _3164 * 6.283184051513671875;
        float _3178 = _3166 * 0.15915493667125701904296875;
        float _3180 = _3174;
        float _3182 = _3178;
        if (_842)
        {
            _3108 = _1756;
        }
        float _3184 = _3108;
        float _3186 = _3176 * 0.15915493667125701904296875;
        float _3188 = _3184;
        if (!_842)
        {
            _3180 = _1758;
        }
        float _3190 = _3180;
        float _3192 = _3024 * 6.283185482025146484375;
        float _3194 = sin(_3192);
        if (!_842)
        {
            _3188 = _1758;
        }
        float _3196 = _3188;
        if (!_842)
        {
            _1826 = _1758;
        }
        float _3198 = _1826;
        float _3200 = _3040 * 6.283185482025146484375;
        float _3202 = sin(_3200);
        float _3204 = _3170 * _3136;
        float _3206 = _3178 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        if (_842)
        {
            _3044 = _1752;
        }
        float _3210 = _3044;
        float _3212 = _3210;
        if (!_842)
        {
            _3212 = _1754;
        }
        float _3214 = _3212;
        float _3216 = _3068 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        _2852 = _3214;
        if (_842)
        {
            _3182 = _1748;
        }
        float _3220 = _3182;
        float _3222 = _3202 * _3142;
        float _3224 = _3220;
        if (!_842)
        {
            _3224 = _1750;
        }
        float _3226 = _3224;
        if (!_842)
        {
            _1828 = _1750;
        }
        float _3228 = _1828;
        float _3230 = _3162 * 0.15915493667125701904296875;
        if (_842)
        {
            _3172 = _1752;
        }
        float _3232 = _3172;
        float _3234 = _3064 * 6.283185482025146484375;
        float _3236 = sin(_3234);
        float _3238 = _3232;
        if (!_842)
        {
            _3238 = _1754;
        }
        float _3240 = _3238;
        float _3242 = _3152 * _3226;
        if (!_842)
        {
            _1830 = _1754;
        }
        float _3244 = _1830;
        float _3246 = _3194 * _3228;
        float _3248 = _3072 * 6.283185482025146484375;
        float _3250 = sin(_3248);
        float _3252 = fma(_3218, _3240, _3204);
        float _3254 = _3140 * 6.283185482025146484375;
        float _3256 = sin(_3254);
        float _3258 = fma(_3236, _3148, _3242);
        float _3260 = _3078 * 6.283185482025146484375;
        float _3262 = sin(_3260);
        float _3264 = fma(_3250, _3244, _3246);
        float _3266 = fma(_3208, _3198, _3264);
        float _3268 = _3082 * 6.283185482025146484375;
        float _3270 = sin(_3268);
        float _3272 = fma(_3256, _3214, _3222);
        float _3274 = _3230 * 6.283185482025146484375;
        float _3276 = sin(_3274);
        float _3278 = fma(_3262, _3190, _3252);
        float _3280 = _3092 * 6.283185482025146484375;
        float _3282 = sin(_3280);
        float _3284 = fma(_3270, _3160, _3258);
        float _3286 = _3100 * 6.283185482025146484375;
        float _3288 = sin(_3286);
        float _3290 = fma(_3276, _3196, _3272);
        float _3292 = _3114 * 6.283185482025146484375;
        float _3294 = sin(_3292);
        float _3296 = fma(_3282, _3110, _3278);
        float _3298 = _3186 * 6.283185482025146484375;
        float _3300 = sin(_3298);
        float _3302 = fma(_3288, _3112, _3284);
        float _3304 = fma(_3294, _3116, _3266);
        float _3306 = -_3302;
        float _3308 = _3306 + _3304;
        float _3310 = fma(_3300, _3050, _3290);
        float _3312 = -_3310;
        float _3314 = _3296 + _3312;
        float _3316 = _3314 + _3308;
        _2848 = _3316;
        _2850 = _3314;
        _2854 = _3252;
    }
    _2858 = false;
    float _3318 = _2848;
    float _3320 = _2850;
    float _3322 = _2852;
    float _3324 = _2854;
    float _3326 = _2856;
    float _3328 = _2782;
    float _3330 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3332 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3334 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3336 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3338 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3340 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _3342 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _3344 = uint(int(uint(_188) >> uint(2)));
    float _3346 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3344)]);
    float _3348 = fma(_560, _1768, _800);
    float _3350 = fma(_562, _2606, _802);
    float _3352 = fma(_564, _3318, _806);
    bool _3354 = _3330 > 0.0;
    bool _3356 = _3332 > 0.0;
    float _3358 = _3334 * _3332;
    float _3360 = _550 * _3336;
    float _3362 = _3320;
    float _3364 = _3334;
    float _3366 = _3322;
    bool _3368 = _3356;
    float _3370 = _3360;
    float _3372 = _3338;
    float _3374 = _3342;
    float _3376 = _3358;
    float _3378 = _3324;
    float _3380 = _3326;
    float _3382 = _3328;
    if (_3354)
    {
        float _3384 = 1.0 / _3330;
        _3362 = _3384;
    }
    float _3386 = _3362;
    float _3388 = _550 * _3340;
    float _3390 = _3388;
    if (_3356)
    {
        float _3392 = -_3358;
        float _3394 = fma(_278, _3392, _3334);
        _3364 = _3394;
    }
    float _3396 = _3364;
    float _3398 = _550 * _3338;
    float _3400 = _3386;
    float _3402 = _3396;
    if (_3354)
    {
        float _3404 = _732 * _3386;
        _3366 = _3404;
    }
    float _3406 = _3366;
    float _3408 = _3406;
    if (_3354)
    {
        float _3410 = precise::min(_3406, 1.0);
        _3400 = _3410;
    }
    float _3412 = _3400;
    float _3414 = _3412;
    if (_3354)
    {
        float _3416 = _3412 * _3396;
        _3402 = _3416;
    }
    float _3418 = _3402;
    float _3420 = _3398 * _3418;
    float _3422 = _3360 * _3418;
    float _3424 = _3388 * _3418;
    bool _3426 = !_186;
    float _3428 = _3418;
    float _3430 = _3422;
    float _3432 = _3424;
    float _3554;
    if (!_3426)
    {
        float _3434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3446 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3448 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3450 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3452 = _3438 * _3440;
        float _3454 = _3438 * _3442;
        float _3456 = _3436 * _3440;
        float _3458 = -_3452;
        float _3460 = fma(_3434, _3444, _3458);
        float _3462 = -_3454;
        float _3464 = fma(_3436, _3444, _3462);
        float _3466 = -_3456;
        float _3468 = fma(_3434, _3442, _3466);
        float _3470 = _3448 * _3434;
        float _3472 = _3448 * _3460;
        float _3474 = _3450 * _3436;
        float _3476 = _3446 * _3442;
        float _3478 = -_3470;
        float _3480 = fma(_3446, _3436, _3478);
        float _3482 = -_3472;
        float _3484 = fma(_3446, _3464, _3482);
        float _3486 = _3448 * _3444;
        float _3488 = _3450 * _3440;
        float _3490 = _3446 * _3438;
        float _3492 = fma(_3450, _3468, _3484);
        float _3494 = -_3486;
        float _3496 = fma(_3450, _3442, _3494);
        float _3498 = -_3488;
        float _3500 = fma(_3446, _3444, _3498);
        float _3502 = -_3476;
        float _3504 = fma(_3448, _3440, _3502);
        float _3506 = 1.0 / _3492;
        float _3508 = -_3490;
        float _3510 = fma(_3450, _3434, _3508);
        float _3512 = -_3434;
        float _3514 = fma(_3512, _3444, _3452);
        float _3516 = -_3474;
        float _3518 = fma(_3448, _3438, _3516);
        float _3520 = _3496 * _3506;
        float _3522 = _3500 * _3506;
        float _3524 = _3504 * _3506;
        float _3526 = _3422 * _3506;
        float _3528 = _3420 * _3520;
        float _3530 = _3420 * _3522;
        float _3532 = _3514 * _3506;
        float _3534 = _3420 * _3524;
        float _3536 = _3518 * _3506;
        float _3538 = _3510 * _3506;
        float _3540 = fma(_3464, _3526, _3528);
        float _3542 = fma(_3422, _3532, _3530);
        float _3544 = _3480 * _3506;
        float _3546 = fma(_3468, _3526, _3534);
        float _3548 = fma(_3424, _3536, _3540);
        float _3550 = fma(_3424, _3538, _3542);
        float _3552 = fma(_3424, _3544, _3546);
        _3370 = _3530;
        _3372 = _3442;
        _3390 = _3444;
        _3374 = _3522;
        _616 = _3542;
        _618 = _3536;
        _620 = _3528;
        _1832 = _3540;
        _2632 = _3446;
        _3408 = _3448;
        _3376 = _3450;
        _3378 = _3538;
        _3554 = _3550;
        _3430 = _3548;
        _3432 = _3552;
        _3414 = _3518;
        _3380 = _3506;
        _3556 = true;
    }
    else
    {
        int _3558 = as_type<int>(_164) & 1024;
        bool _3560 = _3558 != 0;
        if (_3560)
        {
            _3368 = true;
        }
        bool _3562 = _3368;
        bool _3564 = _3562;
        if (!_3560)
        {
            int _3566 = as_type<int>(_164) & 2048;
            bool _3568 = _3566 != 0;
            _3564 = _3568;
        }
        bool _3570 = _3564;
        if (!_3570)
        {
            _3428 = _3420;
        }
        float _3572 = _3428;
        bool _3574 = !_3570;
        _3554 = _3572;
        if (!_3574)
        {
            uint _3576 = uint(int(uint(_166) >> uint(2)));
            float _3578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3576)]);
            int _3580 = _166 + 4;
            uint _3582 = uint(int(uint(_3580) >> uint(2)));
            float _3584 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3582)]);
            int _3586 = _166 + 8;
            uint _3588 = uint(int(uint(_3586) >> uint(2)));
            float _3590 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3588)]);
            uint _3592 = uint(int(uint(_166) >> uint(2)));
            float _3594 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3592)]);
            int _3596 = _166 + 4;
            uint _3598 = uint(int(uint(_3596) >> uint(2)));
            float _3600 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3598)]);
            int _3602 = _166 + 8;
            uint _3604 = uint(int(uint(_3602) >> uint(2)));
            float _3606 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3604)]);
            uint _3608 = uint(int(uint(_166) >> uint(2)));
            float _3610 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3608)]);
            int _3612 = _166 + 4;
            uint _3614 = uint(int(uint(_3612) >> uint(2)));
            float _3616 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3614)]);
            int _3618 = _166 + 8;
            uint _3620 = uint(int(uint(_3618) >> uint(2)));
            float _3622 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3620)]);
            float _3624 = _3590 * _3594;
            float _3626 = _3590 * _3600;
            float _3628 = _3584 * _3594;
            float _3630 = -_3624;
            float _3632 = fma(_3578, _3606, _3630);
            float _3634 = -_3626;
            float _3636 = fma(_3584, _3606, _3634);
            float _3638 = -_3628;
            float _3640 = fma(_3578, _3600, _3638);
            float _3642 = _3616 * _3578;
            float _3644 = _3616 * _3632;
            float _3646 = _3622 * _3584;
            float _3648 = _3610 * _3600;
            float _3650 = -_3642;
            float _3652 = fma(_3610, _3584, _3650);
            float _3654 = -_3644;
            float _3656 = fma(_3610, _3636, _3654);
            float _3658 = _3616 * _3606;
            float _3660 = _3622 * _3594;
            float _3662 = _3610 * _3590;
            float _3664 = fma(_3622, _3640, _3656);
            float _3666 = -_3658;
            float _3668 = fma(_3622, _3600, _3666);
            float _3670 = -_3660;
            float _3672 = fma(_3610, _3606, _3670);
            float _3674 = -_3648;
            float _3676 = fma(_3616, _3594, _3674);
            float _3678 = 1.0 / _3664;
            float _3680 = -_3662;
            float _3682 = fma(_3622, _3578, _3680);
            float _3684 = -_3578;
            float _3686 = fma(_3684, _3606, _3624);
            float _3688 = -_3646;
            float _3690 = fma(_3616, _3590, _3688);
            float _3692 = _3668 * _3678;
            float _3694 = _3672 * _3678;
            float _3696 = _3676 * _3678;
            float _3698 = _3422 * _3678;
            float _3700 = _3420 * _3692;
            float _3702 = _3420 * _3694;
            float _3704 = _3686 * _3678;
            float _3706 = _3420 * _3696;
            float _3708 = _3690 * _3678;
            float _3710 = _3682 * _3678;
            float _3712 = fma(_3636, _3698, _3700);
            float _3714 = fma(_3422, _3704, _3702);
            float _3716 = _3652 * _3678;
            float _3718 = fma(_3640, _3698, _3706);
            float _3720 = fma(_3424, _3708, _3712);
            float _3722 = fma(_3424, _3710, _3714);
            float _3724 = fma(_3424, _3716, _3718);
            _3370 = _3702;
            _3372 = _3600;
            _3390 = _3606;
            _3374 = _3694;
            _616 = _3714;
            _618 = _3708;
            _620 = _3700;
            _1832 = _3712;
            _2632 = _3610;
            _3408 = _3616;
            _3376 = _3622;
            _3378 = _3710;
            _3554 = _3722;
            _3430 = _3720;
            _3432 = _3724;
            _3414 = _3690;
            _3380 = _3678;
        }
    }
    _3556 = false;
    float _3726 = _3370;
    float _3728 = _3372;
    float _3730 = _3390;
    float _3732 = _3374;
    float _3734 = _616;
    float _3736 = _618;
    float _3738 = _620;
    float _3740 = _1832;
    float _3742 = _2632;
    float _3744 = _3408;
    float _3746 = _3376;
    float _3748 = _3378;
    float _3750 = _3554;
    float _3752 = _3430;
    float _3754 = _3432;
    float _3756 = _3414;
    float _3758 = _3380;
    uint _3760 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3760)] = as_type<uint>(_3346);
    float _3762 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _3764 = as_type<int>(_3762) & 512;
    bool _3766 = _3764 != 0;
    int _3768 = as_type<int>(_3762) & 1024;
    bool _3770 = _3768 != 0;
    float _3772 = _3726;
    float _3774 = _3728;
    float _3776 = _3730;
    float _3778 = _3732;
    float _3780 = _3752;
    float _3782 = _3754;
    float _3784 = _3756;
    float _3786 = _3758;
    if (_3766)
    {
        float _3788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3772 = _3788;
        _3774 = _3790;
        _3776 = _3792;
        _3778 = _3794;
    }
    float _3796 = _3772;
    float _3798 = _3774;
    float _3800 = _3776;
    float _3802 = _3778;
    float _3804 = _3734;
    float _3806 = _3736;
    float _3808 = _3738;
    float _3810 = _3740;
    if (_3766)
    {
        float _3812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3804 = _3812;
        _3806 = _3814;
        _3808 = _3816;
        _3810 = _3818;
    }
    float _3820 = _3804;
    float _3822 = _3806;
    float _3824 = _3808;
    float _3826 = _3810;
    float _3828 = _3742;
    float _3830 = _3744;
    float _3832 = _3746;
    float _3834 = _3748;
    if (_3766)
    {
        float _3836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3838 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3840 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3842 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3828 = _3836;
        _3830 = _3838;
        _3832 = _3840;
        _3834 = _3842;
    }
    float _3844 = _3828;
    float _3846 = _3830;
    float _3848 = _3832;
    float _3850 = _3834;
    float _3852 = _3350 + _3750;
    float _3854 = _3348 + _3752;
    float _3856 = _3352 + _3754;
    float _3858 = _3852;
    if (!_3766)
    {
        _3780 = 0.0;
    }
    float _3860 = _3780;
    float _3862 = _3860;
    if (!_3766)
    {
        _3782 = 0.0;
    }
    float _3864 = _3782;
    int _3866 = as_type<int>(_3762) & 2048;
    bool _3868 = _3866 != 0;
    float _3870 = _3798;
    float _3872 = _3796;
    float _3874 = _3864;
    float _3876 = 6.2500002968590706586837768554688e-05;
    if (_3766)
    {
        float _3878 = _3852 * _3798;
        _3870 = _3878;
    }
    float _3880 = _3870;
    float _3882 = _3846;
    float _3884 = _3820;
    float _3886 = _3848;
    float _3888 = _3880;
    float _3890 = _3826;
    int _3892 = as_type<int>(_3824);
    if (_3766)
    {
        float _3894 = _3852 * _3822;
        _3784 = _3894;
    }
    float _3896 = _3784;
    if (_3766)
    {
        float _3898 = fma(_3854, _3796, _3880);
        _3872 = _3898;
    }
    float _3900 = _3872;
    float _3902 = _3900;
    if (_3766)
    {
        float _3904 = _3852 * _3846;
        _3882 = _3904;
    }
    float _3906 = _3882;
    float _3908 = _3906;
    if (_3766)
    {
        float _3910 = fma(_3854, _3820, _3896);
        _3884 = _3910;
    }
    float _3912 = _3884;
    float _3914 = _3912;
    if (_3766)
    {
        float _3916 = fma(_3856, _3800, _3900);
        _3902 = _3916;
    }
    float _3918 = _3902;
    float _3920 = _3918;
    if (_3766)
    {
        float _3922 = fma(_3854, _3844, _3906);
        _3908 = _3922;
    }
    float _3924 = _3908;
    if (_3766)
    {
        float _3926 = fma(_3856, _3824, _3912);
        _3914 = _3926;
    }
    float _3928 = _3914;
    if (_3766)
    {
        float _3930 = _3802 + _3918;
        _3862 = _3930;
    }
    float _3932 = _3862;
    float _3934 = _3932;
    if (_3766)
    {
        float _3936 = fma(_3856, _3848, _3924);
        _3886 = _3936;
    }
    float _3938 = _3886;
    float _3940 = _3938;
    if (!_3766)
    {
        _3888 = 0.0;
    }
    float _3942 = _3888;
    float _3944 = _3942;
    if (_3766)
    {
        float _3946 = _3826 + _3928;
        _3874 = _3946;
    }
    float _3948 = _3874;
    float _3950 = _3948;
    if (!_3770)
    {
        _3890 = _3932;
    }
    float _3952 = _3890;
    float _3954 = _3952;
    if (_3766)
    {
        float _3956 = _3850 + _3938;
        _3944 = _3956;
    }
    float _3958 = _3944;
    bool _3960 = !_3770;
    float _3962 = _3958;
    if (!_3960)
    {
        float _3964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _3966 = uint(int(uint(_166) >> uint(2)));
        float _3968 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3966)]);
        int _3970 = _166 + 4;
        uint _3972 = uint(int(uint(_3970) >> uint(2)));
        float _3974 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3972)]);
        int _3976 = _166 + 8;
        uint _3978 = uint(int(uint(_3976) >> uint(2)));
        float _3980 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3978)]);
        uint _3982 = uint(int(uint(_166) >> uint(2)));
        float _3984 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3982)]);
        int _3986 = _166 + 4;
        uint _3988 = uint(int(uint(_3986) >> uint(2)));
        float _3990 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3988)]);
        int _3992 = _166 + 8;
        uint _3994 = uint(int(uint(_3992) >> uint(2)));
        float _3996 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3994)]);
        uint _3998 = uint(int(uint(_166) >> uint(2)));
        float _4000 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3998)]);
        int _4002 = _166 + 4;
        uint _4004 = uint(int(uint(_4002) >> uint(2)));
        float _4006 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4004)]);
        int _4008 = _166 + 8;
        uint _4010 = uint(int(uint(_4008) >> uint(2)));
        float _4012 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4010)]);
        float _4014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _4016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _4018 = _3852 * _3974;
        float _4020 = _3852 * _3990;
        float _4022 = _3852 * _4006;
        float _4024 = fma(_3854, _3968, _4018);
        float _4026 = fma(_3854, _3984, _4020);
        float _4028 = fma(_3854, _4000, _4022);
        float _4030 = fma(_3856, _3980, _4024);
        float _4032 = fma(_3856, _3996, _4026);
        float _4034 = fma(_3856, _4012, _4028);
        float _4036 = _3964 + _4030;
        float _4038 = _4014 + _4032;
        float _4040 = _4016 + _4034;
        _3920 = _4024;
        _3962 = _4038;
        _3940 = _4032;
        _3892 = as_type<int>(_4034);
        _3954 = _4040;
        _3950 = _4036;
        _3934 = _4014;
    }
    float _4042 = _3920;
    float _4044 = _3962;
    float _4046 = _3940;
    int _4048 = _3892;
    float _4050 = _3954;
    float _4052 = _3950;
    float _4054 = _3934;
    bool _4056 = !_3868;
    float _4058 = _4052;
    float _4060 = _4050;
    float _4062 = _4042;
    int _4064 = _4048;
    float _4066 = _4044;
    float _4068 = _4046;
    if (!_4056)
    {
        uint _4070 = uint(int(uint(_166) >> uint(2)));
        float _4072 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4070)]);
        int _4074 = _166 + 4;
        uint _4076 = uint(int(uint(_4074) >> uint(2)));
        float _4078 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4076)]);
        int _4080 = _166 + 8;
        uint _4082 = uint(int(uint(_4080) >> uint(2)));
        float _4084 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4082)]);
        int _4086 = _166 + 12;
        uint _4088 = uint(int(uint(_4086) >> uint(2)));
        float _4090 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4088)]);
        uint _4092 = uint(int(uint(_166) >> uint(2)));
        float _4094 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4092)]);
        int _4096 = _166 + 4;
        uint _4098 = uint(int(uint(_4096) >> uint(2)));
        float _4100 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4098)]);
        int _4102 = _166 + 8;
        uint _4104 = uint(int(uint(_4102) >> uint(2)));
        float _4106 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4104)]);
        int _4108 = _166 + 12;
        uint _4110 = uint(int(uint(_4108) >> uint(2)));
        float _4112 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4110)]);
        uint _4114 = uint(int(uint(_166) >> uint(2)));
        float _4116 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4114)]);
        int _4118 = _166 + 4;
        uint _4120 = uint(int(uint(_4118) >> uint(2)));
        float _4122 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4120)]);
        int _4124 = _166 + 8;
        uint _4126 = uint(int(uint(_4124) >> uint(2)));
        float _4128 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4126)]);
        int _4130 = _166 + 12;
        uint _4132 = uint(int(uint(_4130) >> uint(2)));
        float _4134 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4132)]);
        float _4136 = _3852 * _4078;
        float _4138 = _3852 * _4100;
        float _4140 = _3852 * _4122;
        float _4142 = fma(_3854, _4072, _4136);
        float _4144 = fma(_3854, _4094, _4138);
        float _4146 = fma(_3854, _4116, _4140);
        float _4148 = fma(_3856, _4084, _4142);
        float _4150 = fma(_3856, _4106, _4144);
        float _4152 = fma(_3856, _4128, _4146);
        float _4154 = _4148 + _4090;
        float _4156 = _4150 + _4112;
        float _4158 = _4152 + _4134;
        _4058 = _4154;
        _4060 = _4158;
        _4062 = _4072;
        _4064 = as_type<int>(_4152);
        _4066 = _4156;
        _4068 = _4150;
    }
    float _4160 = _4058;
    float _4162 = _4060;
    float _4164 = _4062;
    int _4166 = _4064;
    float _4168 = _4066;
    float _4170 = _4068;
    float _4172 = fma(_4160, 6.2500002968590706586837768554688e-05, 0.5);
    float _4174 = fma(_4162, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10725 = float2(_4172, _4174);
    float _4176 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10725, float2(0.0), isnan(_10725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10725, float2(0.0), isnan(_10725)), level(0.0)).x;
    bool _4178 = _732 > 0.001000000047497451305389404296875;
    bool _4180 = isnan(_732);
    bool _4182 = _4178 || _4180;
    bool _4184 = isnan(0.001000000047497451305389404296875);
    bool _4186 = _4182 || _4184;
    float _4188 = _4054;
    float _4190 = _4164;
    int _4192 = _4166;
    float _4194 = _4170;
    if (!_4186)
    {
        float _4196 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _4188 = _4196;
    }
    float _4198 = _4188;
    bool _4200 = _4176 != 0.0;
    bool _4202 = isnan(_4176);
    bool _4204 = _4200 || _4202;
    bool _4206 = isnan(0.0);
    bool _4208 = _4204 || _4206;
    bool _4210 = _4208;
    if (!_4208)
    {
        _4190 = 4.0;
    }
    float _4212 = _4190;
    float _4214 = _4176;
    float _4216 = _4212;
    if (!_4208)
    {
        float2 _10783 = float2(_4172, _4174);
        float _4218 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10783, float2(0.0), isnan(_10783)), level(_4212)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10783, float2(0.0), isnan(_10783)), level(_4212)).x;
        _4214 = _4218;
    }
    float _4220 = _4214;
    float _4222 = _3762;
    if (!_4186)
    {
        float2 _10799 = float2(_4172, _4174);
        float _4224 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_10799, float2(0.0), isnan(_10799)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_10799, float2(0.0), isnan(_10799)), level(0.0)).x;
        _4222 = _4224;
    }
    float _4226 = _4222;
    float _4228 = fma(_4160, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _4230 = fma(_4160, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float2 _10816 = float2(_4228, _4174);
    float _4232 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10816, float2(0.0), isnan(_10816)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10816, float2(0.0), isnan(_10816)), level(0.0)).x;
    float2 _10824 = float2(_4230, _4174);
    float _4234 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10824, float2(0.0), isnan(_10824)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10824, float2(0.0), isnan(_10824)), level(0.0)).x;
    float2 _10832 = float2(_4172, _4174);
    float2 _4238 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10832, float2(0.0), isnan(_10832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10832, float2(0.0), isnan(_10832)), level(0.0)).xy;
    float _4240 = _4238.x;
    float _4242 = _4238.y;
    int _4244 = _166 + 4;
    float _4246 = _4232;
    float _4248 = _4234;
    float _4250 = _4230;
    float _4252 = _4228;
    if (!_4186)
    {
        float _4254 = fma(_4220, 2000.0, _4198);
        _4192 = as_type<int>(_4254);
    }
    int _4256 = _4192;
    if (!_4186)
    {
        uint _4258 = uint(int(uint(_4244) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_4258)] = uint(_4256);
    }
    float _4260 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _4262 = uint(int(uint(_4244) >> uint(2)));
    float _4264 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4262)]);
    if (!_4186)
    {
        float _4266 = _4226 * 2000.0;
        _4194 = _4266;
    }
    float _4268 = _4194;
    float _4270 = fma(_4220, 2000.0, _4260);
    float _4272 = _3852 + _4264;
    bool _4274 = _4272 >= _4270;
    bool _4276 = isnan(_4272);
    bool _4278 = _4274 || _4276;
    bool _4280 = isnan(_4270);
    bool _4282 = _4278 || _4280;
    float _4284 = _4272;
    if (!_4282)
    {
        float _4286 = -_4264;
        float _4288 = _4270 + _4286;
        _4284 = _4288;
    }
    float _4290 = _4284;
    int _4292 = as_type<int>(_4290);
    if (!_4282)
    {
        float _4294 = fma(_4290, 0.00999999977648258209228515625, _4264);
        _4216 = _4294;
    }
    float _4296 = _4216;
    float _4298 = _4296;
    if (_4186)
    {
        _4292 = as_type<int>(_3346);
    }
    int _4300 = _4292;
    int _4302 = _4300;
    if (!_4282)
    {
        uint _4304 = uint(int(uint(_4244) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_4304)] = as_type<uint>(_4296);
    }
    if (!_4186)
    {
        float _4306 = fma(_4162, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _10959 = float2(_4228, _4306);
        float _4308 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10959, float2(0.0), isnan(_10959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10959, float2(0.0), isnan(_10959)), level(0.0)).x;
        float2 _10967 = float2(_4230, _4306);
        float _4310 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10967, float2(0.0), isnan(_10967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10967, float2(0.0), isnan(_10967)), level(0.0)).x;
        float2 _10975 = float2(_4172, _4306);
        float _4312 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_10975, float2(0.0), isnan(_10975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_10975, float2(0.0), isnan(_10975)), level(0.0)).x;
        float _4314 = fma(_4162, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        bool _4316 = _4232 != 0.0;
        bool _4318 = isnan(_4232);
        bool _4320 = _4316 || _4318;
        bool _4322 = isnan(0.0);
        bool _4324 = _4320 || _4322;
        bool _4326 = _4234 != 0.0;
        bool _4328 = isnan(_4234);
        bool _4330 = _4326 || _4328;
        bool _4332 = isnan(0.0);
        bool _4334 = _4330 || _4332;
        float2 _11007 = float2(_4228, _4314);
        float _4336 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11007, float2(0.0), isnan(_11007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11007, float2(0.0), isnan(_11007)), level(0.0)).x;
        float2 _11015 = float2(_4230, _4314);
        float _4338 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11015, float2(0.0), isnan(_11015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11015, float2(0.0), isnan(_11015)), level(0.0)).x;
        float2 _11023 = float2(_4172, _4314);
        float _4340 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11023, float2(0.0), isnan(_11023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11023, float2(0.0), isnan(_11023)), level(0.0)).x;
        float _4342 = _4174;
        if (_4324)
        {
            _4298 = _4232;
        }
        float _4344 = _4298;
        if (_4334)
        {
            _3876 = _4234;
        }
        float _4346 = _3876;
        if (!_4324)
        {
            _4246 = 4.0;
        }
        float _4348 = _4246;
        float _4350 = _4348;
        if (!_4334)
        {
            _4248 = 4.0;
        }
        float _4352 = _4248;
        float _4354 = _4344;
        float _4356 = _4352;
        if (!_4324)
        {
            float2 _11058 = float2(_4228, _4174);
            float _4358 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11058, float2(0.0), isnan(_11058)), level(_4348)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11058, float2(0.0), isnan(_11058)), level(_4348)).x;
            _4354 = _4358;
        }
        float _4360 = _4354;
        float _4362 = _4346;
        if (!_4334)
        {
            float2 _11074 = float2(_4230, _4174);
            float _4364 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11074, float2(0.0), isnan(_11074)), level(_4352)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11074, float2(0.0), isnan(_11074)), level(_4352)).x;
            _4362 = _4364;
        }
        float _4366 = _4362;
        bool _4368 = _4240 != 0.0;
        bool _4370 = isnan(_4240);
        bool _4372 = _4368 || _4370;
        bool _4374 = isnan(0.0);
        bool _4376 = _4372 || _4374;
        bool _4378 = _4308 != 0.0;
        bool _4380 = isnan(_4308);
        bool _4382 = _4378 || _4380;
        bool _4384 = isnan(0.0);
        bool _4386 = _4382 || _4384;
        bool _4388 = _4310 != 0.0;
        bool _4390 = isnan(_4310);
        bool _4392 = _4388 || _4390;
        bool _4394 = isnan(0.0);
        bool _4396 = _4392 || _4394;
        if (!_4386)
        {
            _3786 = 4.0;
        }
        float _4398 = _3786;
        if (!_4396)
        {
            _3382 = 4.0;
        }
        float _4400 = _3382;
        float _4402 = _4308;
        if (!_4386)
        {
            float2 _11133 = float2(_4228, _4306);
            float _4404 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11133, float2(0.0), isnan(_11133)), level(_4398)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11133, float2(0.0), isnan(_11133)), level(_4398)).x;
            _4402 = _4404;
        }
        float _4406 = _4402;
        float _4408 = _4310;
        if (!_4396)
        {
            float2 _11149 = float2(_4230, _4306);
            float _4410 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11149, float2(0.0), isnan(_11149)), level(_4400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11149, float2(0.0), isnan(_11149)), level(_4400)).x;
            _4408 = _4410;
        }
        float _4412 = _4408;
        bool _4414 = _4336 != 0.0;
        bool _4416 = isnan(_4336);
        bool _4418 = _4414 || _4416;
        bool _4420 = isnan(0.0);
        bool _4422 = _4418 || _4420;
        bool _4424 = _4338 != 0.0;
        bool _4426 = isnan(_4338);
        bool _4428 = _4424 || _4426;
        bool _4430 = isnan(0.0);
        bool _4432 = _4428 || _4430;
        bool _4434 = _4312 != 0.0;
        bool _4436 = isnan(_4312);
        bool _4438 = _4434 || _4436;
        bool _4440 = isnan(0.0);
        bool _4442 = _4438 || _4440;
        bool _4444 = _4340 != 0.0;
        bool _4446 = isnan(_4340);
        bool _4448 = _4444 || _4446;
        bool _4450 = isnan(0.0);
        bool _4452 = _4448 || _4450;
        if (!_4422)
        {
            _4342 = 4.0;
        }
        float _4454 = _4342;
        if (!_4432)
        {
            _4250 = 4.0;
        }
        float _4456 = _4250;
        float _4458 = _4336;
        if (!_4422)
        {
            float2 _11219 = float2(_4228, _4314);
            float _4460 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11219, float2(0.0), isnan(_11219)), level(_4454)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11219, float2(0.0), isnan(_11219)), level(_4454)).x;
            _4458 = _4460;
        }
        float _4462 = _4458;
        if (!_4442)
        {
            _4252 = 4.0;
        }
        float _4464 = _4252;
        float _4466 = _4338;
        if (!_4432)
        {
            float2 _11240 = float2(_4230, _4314);
            float _4468 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11240, float2(0.0), isnan(_11240)), level(_4456)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11240, float2(0.0), isnan(_11240)), level(_4456)).x;
            _4466 = _4468;
        }
        float _4470 = _4466;
        if (!_4452)
        {
            _4356 = 4.0;
        }
        float _4472 = _4356;
        float _4474 = _4312;
        if (!_4442)
        {
            float2 _11261 = float2(_4172, _4306);
            float _4476 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11261, float2(0.0), isnan(_11261)), level(_4464)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11261, float2(0.0), isnan(_11261)), level(_4464)).x;
            _4474 = _4476;
        }
        float _4478 = _4474;
        if (!_4376)
        {
            _4350 = 4.0;
        }
        float _4480 = _4350;
        float _4482 = _4340;
        if (!_4452)
        {
            float2 _11282 = float2(_4172, _4314);
            float _4484 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11282, float2(0.0), isnan(_11282)), level(_4472)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11282, float2(0.0), isnan(_11282)), level(_4472)).x;
            _4482 = _4484;
        }
        float _4486 = _4482;
        float _4488 = _4240;
        float _4490 = _4242;
        if (!_4376)
        {
            float2 _11299 = float2(_4172, _4174);
            float2 _4492 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11299, float2(0.0), isnan(_11299)), level(_4480)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11299, float2(0.0), isnan(_11299)), level(_4480)).xy;
            float _4494 = _4492.x;
            float _4496 = _4492.y;
            _4488 = _4494;
            _4490 = _4496;
        }
        float _4498 = _4488;
        float _4500 = _4490;
        float _4502 = -_4360;
        float _4504 = _4220 + _4502;
        float _4506 = -_4366;
        float _4508 = _4220 + _4506;
        float _4510 = abs(_4504);
        float _4512 = abs(_4508);
        float _4514 = precise::max(_4510, _4512);
        float _4516 = -_4406;
        float _4518 = _4220 + _4516;
        float _4520 = -_4412;
        float _4522 = _4220 + _4520;
        float _4524 = -_4462;
        float _4526 = _4220 + _4524;
        float _4528 = -_4470;
        float _4530 = _4220 + _4528;
        float _4532 = abs(_4526);
        float _4534 = abs(_4518);
        float _4536 = precise::max(_4532, _4534);
        float _4538 = -_4478;
        float _4540 = _4220 + _4538;
        float _4542 = abs(_4530);
        float _4544 = abs(_4522);
        float _4546 = precise::max(_4542, _4544);
        float _4548 = -_4486;
        float _4550 = _4220 + _4548;
        float _4552 = precise::max(_4536, _4546);
        float _4554 = abs(_4550);
        float _4556 = abs(_4540);
        float _4558 = precise::max(_4554, _4556);
        bool _4560 = _4552 > 0.00150000001303851604461669921875;
        float _4562 = precise::max(_4514, _4558);
        bool _4564 = _4562 > 0.00150000001303851604461669921875;
        bool _4566 = _4564 || _4560;
        bool _4568 = _4498 < _4500;
        bool _4570 = _4568 || _4566;
        bool _4572 = !_4570;
        int _4574 = _4572 ? as_type<int>(_3346) : 0;
        _4210 = _4570;
        _4302 = _4574;
    }
    bool _4576 = _4210;
    int _4578 = _4302;
    bool _4580 = _4576;
    int _4582 = _4578;
    if (!_4186)
    {
        bool _4584 = _4168 >= _4268;
        bool _4586 = isnan(_4168);
        bool _4588 = _4584 || _4586;
        bool _4590 = isnan(_4268);
        bool _4592 = _4588 || _4590;
        _4580 = _4592;
    }
    bool _4594 = _4580;
    if (!_4282)
    {
        float _4596 = _3852 * 0.9900000095367431640625;
        _3858 = _4596;
    }
    float _4598 = _3858;
    int _4600 = _166 + 8;
    float _4602 = -_170;
    float _4604 = _4602 + _3854;
    if (!_4186)
    {
        int _4606 = _4594 ? _4578 : 0;
        _4582 = _4606;
    }
    int _4608 = _4582;
    if (!_4282)
    {
        _816 = 0.0;
    }
    float _4610 = _816;
    float _4612 = -_176;
    float _4614 = _4612 + _4598;
    float _4616 = -_182;
    float _4618 = _4616 + _3856;
    uint _4620 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4620)] = uint(_4608);
    uint _4622 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4622)] = as_type<uint>(_3854);
    uint _4624 = uint(int(uint(_4244) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4624)] = as_type<uint>(_4598);
    uint _4626 = uint(int(uint(_4600) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4626)] = as_type<uint>(_3856);
    uint _4628 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4628)] = as_type<uint>(_804);
    uint _4630 = uint(int(uint(_4244) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4630)] = as_type<uint>(_4610);
    uint _4632 = uint(int(uint(_4600) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4632)] = as_type<uint>(_808);
    uint _4634 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4634)] = as_type<uint>(_4604);
    uint _4636 = uint(int(uint(_4244) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4636)] = as_type<uint>(_4614);
    uint _4638 = uint(int(uint(_4600) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4638)] = as_type<uint>(_4618);
    float _4640 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4642 = _4614 * _4614;
    float _4644 = _4610 * _4610;
    float _4646 = fma(_4604, _4604, _4642);
    float _4648 = fma(_804, _804, _4644);
    float _4650 = fma(_4618, _4618, _4646);
    float _4652 = fma(_808, _808, _4648);
    float _4654 = sqrt(_4652);
    float _4656 = sqrt(_4650);
    bool _4658 = _4656 >= 9.9999999747524270787835121154785e-07;
    bool _4660 = isnan(_4656);
    bool _4662 = _4658 || _4660;
    bool _4664 = isnan(9.9999999747524270787835121154785e-07);
    bool _4666 = _4662 || _4664;
    if (!_4666)
    {
        bool _4668 = _556 != _298;
        bool _4670 = isnan(_556);
        bool _4672 = _4668 || _4670;
        bool _4674 = isnan(_298);
        bool _4676 = _4672 || _4674;
        _4678 = _4676;
        if (!_4678)
        {
            float _4680 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _4682 = _4680 > 0.0;
            bool _4684 = !_4682;
            if (!_4684)
            {
                float _4686 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _4688 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _4690 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _4692 = _4688 * _518;
                float _4694 = _4688 * _524;
                float _4696 = _4688 * _526;
                float _4698 = fma(_4686, _520, _4692);
                float _4700 = fma(_4686, _528, _4694);
                float _4702 = fma(_4686, _530, _4696);
                float _4704 = fma(_4690, _522, _4698);
                float _4706 = fma(_4690, _532, _4700);
                float _4708 = fma(_4690, _534, _4702);
                float _4710 = _4704 * _4704;
                float _4712 = fma(_4706, _4706, _4710);
                float _4714 = fma(_4708, _4708, _4712);
                float _4716 = rsqrt(_4714);
                float _4718 = _4716 * 9.9999999747524270787835121154785e-07;
                float _4720 = _4706 * _4718;
                float _4722 = _4704 * _4718;
                float _4724 = _4708 * _4718;
                _338 = as_type<int>(_4720);
                _340 = as_type<int>(_4722);
                _342 = as_type<int>(_4724);
                _4678 = true;
            }
            else
            {
                bool _4726 = _4654 >= 9.9999999747524270787835121154785e-07;
                bool _4728 = isnan(_4654);
                bool _4730 = _4726 || _4728;
                bool _4732 = isnan(9.9999999747524270787835121154785e-07);
                bool _4734 = _4730 || _4732;
                if (!_4734)
                {
                    float _4736 = _4598 * _4598;
                    float _4738 = fma(_3854, _3854, _4736);
                    float _4740 = fma(_3856, _3856, _4738);
                    float _4742 = sqrt(_4740);
                    bool _4744 = _4742 >= 9.9999999747524270787835121154785e-07;
                    bool _4746 = isnan(_4742);
                    bool _4748 = _4744 || _4746;
                    bool _4750 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4752 = _4748 || _4750;
                    float _4754 = _4742;
                    if (_4752)
                    {
                        float _4756 = rsqrt(_4740);
                        _4754 = _4756;
                    }
                    float _4758 = _4754;
                    if (!_4752)
                    {
                        _326 = 0;
                    }
                    int _4760 = _326;
                    int _4762 = _4760;
                    if (!_4752)
                    {
                        _328 = 897988541;
                    }
                    int _4764 = _328;
                    int _4766 = _4764;
                    if (!_4752)
                    {
                        _330 = 0;
                    }
                    int _4768 = _330;
                    float _4770 = _4758;
                    int _4772 = _4768;
                    if (_4752)
                    {
                        float _4774 = _4758 * 9.9999999747524270787835121154785e-07;
                        _4770 = _4774;
                    }
                    float _4776 = _4770;
                    if (_4752)
                    {
                        float _4778 = _3854 * _4776;
                        _4762 = as_type<int>(_4778);
                    }
                    int _4780 = _4762;
                    _338 = _4780;
                    if (_4752)
                    {
                        float _4782 = _4598 * _4776;
                        _4766 = as_type<int>(_4782);
                    }
                    int _4784 = _4766;
                    _340 = _4784;
                    if (_4752)
                    {
                        float _4786 = _3856 * _4776;
                        _4772 = as_type<int>(_4786);
                    }
                    int _4788 = _4772;
                    _342 = _4788;
                    _4678 = true;
                }
                else
                {
                    float _4790 = rsqrt(_4652);
                    float _4792 = _4790 * 9.9999999747524270787835121154785e-07;
                    float _4794 = _804 * _4792;
                    float _4796 = _4610 * _4792;
                    float _4798 = _808 * _4792;
                    _338 = as_type<int>(_4794);
                    _340 = as_type<int>(_4796);
                    _342 = as_type<int>(_4798);
                    _4678 = true;
                }
            }
        }
    }
    else
    {
        float _4800 = _4654 * _4640;
        bool _4802 = _4800 >= 0.001000000047497451305389404296875;
        bool _4804 = isnan(_4800);
        bool _4806 = _4802 || _4804;
        bool _4808 = isnan(0.001000000047497451305389404296875);
        bool _4810 = _4806 || _4808;
        bool _4812 = _4800 > 0.0;
        bool _4814 = !_4810;
        bool _4816 = _4812 && _4814;
        bool _4818 = _4656 < 0.001000000047497451305389404296875;
        bool _4820 = _4818 && _4816;
        if (!_4820)
        {
            _332 = as_type<int>(_4604);
        }
        int _4822 = _332;
        int _4824 = _4822;
        if (_4820)
        {
            float _4826 = _804 * _4640;
            _4824 = as_type<int>(_4826);
        }
        int _4828 = _4824;
        _338 = _4828;
        if (!_4820)
        {
            _334 = as_type<int>(_4614);
        }
        int _4830 = _334;
        int _4832 = _4830;
        if (_4820)
        {
            float _4834 = _4640 * _4610;
            _4832 = as_type<int>(_4834);
        }
        int _4836 = _4832;
        _340 = _4836;
        if (!_4820)
        {
            _336 = as_type<int>(_4618);
        }
        int _4838 = _336;
        _342 = _4838;
        if (_4820)
        {
            float _4840 = _808 * _4640;
            _342 = as_type<int>(_4840);
        }
    }
    _4678 = false;
    int _4842 = _338;
    int _4844 = _340;
    int _4846 = _342;
    uint _4848 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4848)] = uint(_4842);
    uint _4850 = uint(int(uint(_4244) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4850)] = uint(_4844);
    uint _4852 = uint(int(uint(_4600) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4852)] = uint(_4846);
}

