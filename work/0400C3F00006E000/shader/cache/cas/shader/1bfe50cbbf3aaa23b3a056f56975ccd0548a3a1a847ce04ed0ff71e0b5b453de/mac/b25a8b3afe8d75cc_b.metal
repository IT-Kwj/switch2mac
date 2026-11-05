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
    bool _3312 = false;
    bool _3148 = false;
    bool _2380 = false;
    bool _808 = false;
    float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _73 = as_type<int>(_70) << 5;
    int _75 = _73 + as_type<int>(_68);
    float _77 = trunc(_66);
    int _79 = int(_77);
    bool _83 = _75 >= _79;
    int _85 = as_type<int>(_70);
    if (_83)
    {
        _85 = 0;
    }
    int _87 = _85;
    int _89 = _87;
    int _91 = _87;
    float _93 = 0.0;
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
        if (!_110)
        {
            _89 = 0;
        }
        int _114 = _89;
        bool _116 = !_110;
        _91 = _114;
        _93 = 0.0;
        _95 = 0.0;
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
            _93 = _128;
            _95 = _122;
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
            _91 = _146;
            if (!_130)
            {
                int _148 = ~_144;
                int _150 = (_148 != 0) ? 0 : 1;
                _91 = _150;
            }
        }
    }
    int _152 = _91;
    float _154 = _93;
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
    if (_184)
    {
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _226 = _234;
        _228 = _236;
        _230 = _238;
    }
    float _240 = _226;
    float _242 = _228;
    float _244 = _230;
    float _246 = 0.0;
    float _248 = 0.0;
    float _250 = 0.0;
    if (_184)
    {
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _246 = _252;
        _248 = _254;
        _250 = _256;
    }
    float _258 = _246;
    float _260 = _248;
    float _262 = _250;
    float _264 = _154;
    float _266 = _156;
    float _268 = 0.0;
    if (_184)
    {
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _264 = _270;
        _266 = _272;
        _268 = _274;
    }
    float _276 = _264;
    float _278 = _266;
    float _280 = _268;
    uint _282 = uint(int(uint(_164) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_282)]);
    uint _286 = uint(int(uint(_186) >> uint(2)));
    float _288 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_286)]);
    uint _290 = uint(int(uint(_186) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_290)]);
    float _294 = _242;
    float _296 = _258;
    float _298 = _260;
    float _300 = _262;
    float _302 = _240;
    float _304 = _242;
    float _306 = _244;
    float _308 = _276;
    float _310 = _278;
    float _312 = _280;
    float _314 = _190;
    float _316 = _196;
    float _318 = _202;
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
        int _340 = _164 + 8;
        uint _342 = uint(int(uint(_164) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_342)]);
        uint _346 = uint(int(uint(_338) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_340) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_164) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_338) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_340) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        uint _366 = uint(int(uint(_164) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        uint _370 = uint(int(uint(_338) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        uint _374 = uint(int(uint(_340) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_374)]);
        float _378 = _344 * _344;
        float _380 = _348 * _348;
        float _382 = _352 * _352;
        float _384 = fma(_356, _356, _378);
        float _386 = fma(_360, _360, _380);
        float _388 = fma(_364, _364, _382);
        float _390 = fma(_368, _368, _384);
        float _392 = fma(_372, _372, _386);
        float _394 = sqrt(_390);
        float _396 = fma(_376, _376, _388);
        float _398 = sqrt(_392);
        float _400 = sqrt(_396);
        bool _402 = _394 > 0.0;
        bool _404 = _398 > 0.0;
        bool _406 = _400 > 0.0;
        float _408 = _208;
        float _410 = _398;
        float _412 = _384;
        float _414 = _394;
        float _416 = _386;
        float _418 = _400;
        float _420 = _348;
        float _422 = _390;
        float _424 = _368;
        if (_402)
        {
            float _426 = rsqrt(_390);
            _408 = _426;
        }
        float _428 = _408;
        float _430 = _388;
        if (_404)
        {
            float _432 = rsqrt(_392);
            _430 = _432;
        }
        float _434 = _430;
        float _436 = 0.0;
        if (_406)
        {
            float _438 = rsqrt(_396);
            _436 = _438;
        }
        float _440 = _436;
        if (!_402)
        {
            _410 = 0.0;
        }
        float _442 = _410;
        float _444 = _442;
        if (_402)
        {
            float _446 = _368 * _428;
            _444 = _446;
        }
        float _448 = _444;
        _308 = _448;
        if (!_404)
        {
            _412 = 0.0;
        }
        float _450 = _412;
        float _452 = _450;
        if (!_402)
        {
            _414 = 0.0;
        }
        float _454 = _414;
        float _456 = _454;
        if (_402)
        {
            float _458 = _344 * _428;
            _456 = _458;
        }
        float _460 = _456;
        _296 = _460;
        if (!_402)
        {
            _416 = 0.0;
        }
        float _462 = _416;
        float _464 = _462;
        if (_404)
        {
            float _466 = _348 * _434;
            _452 = _466;
        }
        float _468 = _452;
        _298 = _468;
        if (!_404)
        {
            _294 = 0.0;
        }
        float _470 = _294;
        float _472 = _470;
        if (_402)
        {
            float _474 = _356 * _428;
            _464 = _474;
        }
        float _476 = _464;
        _302 = _476;
        if (!_404)
        {
            _418 = 0.0;
        }
        float _478 = _418;
        float _480 = _478;
        if (_404)
        {
            float _482 = _360 * _434;
            _472 = _482;
        }
        float _484 = _472;
        _304 = _484;
        if (!_406)
        {
            _420 = 0.0;
        }
        float _486 = _420;
        float _488 = _486;
        if (_404)
        {
            float _490 = _372 * _434;
            _480 = _490;
        }
        float _492 = _480;
        _310 = _492;
        if (!_406)
        {
            _422 = 0.0;
        }
        float _494 = _422;
        float _496 = _494;
        if (_406)
        {
            float _498 = _352 * _440;
            _488 = _498;
        }
        float _500 = _488;
        _300 = _500;
        if (!_406)
        {
            _424 = 0.0;
        }
        float _502 = _424;
        _312 = _502;
        if (_406)
        {
            float _504 = _364 * _440;
            _496 = _504;
        }
        float _506 = _496;
        _306 = _506;
        if (_406)
        {
            float _508 = _376 * _440;
            _312 = _508;
        }
    }
    float _510 = _296;
    float _512 = _298;
    float _514 = _300;
    float _516 = _302;
    float _518 = _304;
    float _520 = _306;
    float _522 = _308;
    float _524 = _310;
    float _526 = _312;
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _558 = uint(int(uint(_186) >> uint(2)));
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_558)]);
    bool _562 = _530 > 0.0;
    float _564 = abs(_528);
    float _566 = log2(_564);
    bool _568 = _532 > 0.0;
    float _570 = 0.0;
    float _572 = _538;
    float _574 = _540;
    float _576 = _546;
    float _578 = _548;
    float _580 = _550;
    float _582 = _552;
    float _584 = _554;
    float _586 = _556;
    float _588 = _530;
    if (_562)
    {
        float _590 = 1.0 / _530;
        _570 = _590;
    }
    float _592 = _570;
    float _594 = -_292;
    float _596 = _534 + _594;
    float _598 = _536 * _566;
    float _600 = _538 * _532;
    float _602 = exp2(_598);
    float _604 = _596;
    if (_568)
    {
        float _606 = -_600;
        float _608 = fma(_284, _606, _538);
        _572 = _608;
    }
    float _610 = _572;
    float _612 = _610;
    float _614 = _592;
    if (_562)
    {
        float _616 = _596 * _592;
        _604 = _616;
    }
    float _618 = _604;
    float _620 = _536 * _540;
    float _622 = _618;
    if (_562)
    {
        float _624 = precise::min(_618, 1.0);
        _622 = _624;
    }
    float _626 = _622;
    float _628 = _546 * _620;
    if (_562)
    {
        float _630 = _626 * _610;
        _612 = _630;
    }
    float _632 = _612;
    float _634 = _542 * _620;
    float _636 = _544 * _620;
    float _638 = _288 * _536;
    float _640 = _536 * _632;
    float _642 = fma(_190, _602, _634);
    float _644 = fma(_196, _602, _636);
    float _646 = fma(_190, _638, _168);
    float _648 = fma(_196, _638, _174);
    float _650 = fma(_202, _638, _180);
    float _652 = fma(_202, _602, _628);
    float _654 = _550 * _640;
    float _656 = _552 * _640;
    float _658 = _554 * _640;
    bool _660 = !_184;
    float _662 = _636;
    float _664 = _640;
    float _666 = _602;
    float _668 = _658;
    float _670 = _650;
    float _672 = _646;
    float _674 = _642;
    float _676 = _644;
    float _678 = _652;
    float _800;
    float _802;
    float _804;
    float _806;
    if (!_660)
    {
        float _680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _698 = _684 * _686;
        float _700 = _684 * _688;
        float _702 = _682 * _686;
        float _704 = -_698;
        float _706 = fma(_680, _690, _704);
        float _708 = -_700;
        float _710 = fma(_682, _690, _708);
        float _712 = -_702;
        float _714 = fma(_680, _688, _712);
        float _716 = _694 * _680;
        float _718 = _694 * _706;
        float _720 = _696 * _682;
        float _722 = _692 * _688;
        float _724 = -_716;
        float _726 = fma(_692, _682, _724);
        float _728 = -_718;
        float _730 = fma(_692, _710, _728);
        float _732 = _694 * _690;
        float _734 = _696 * _686;
        float _736 = _692 * _684;
        float _738 = fma(_696, _714, _730);
        float _740 = -_732;
        float _742 = fma(_696, _688, _740);
        float _744 = -_734;
        float _746 = fma(_692, _690, _744);
        float _748 = -_722;
        float _750 = fma(_694, _686, _748);
        float _752 = -_736;
        float _754 = fma(_696, _680, _752);
        float _756 = -_680;
        float _758 = fma(_756, _690, _698);
        float _760 = 1.0 / _738;
        float _762 = -_720;
        float _764 = fma(_694, _684, _762);
        float _766 = _742 * _760;
        float _768 = _746 * _760;
        float _770 = _750 * _760;
        float _772 = _654 * _760;
        float _774 = _656 * _766;
        float _776 = _656 * _768;
        float _778 = _758 * _760;
        float _780 = _656 * _770;
        float _782 = _764 * _760;
        float _784 = _754 * _760;
        float _786 = fma(_710, _772, _774);
        float _788 = fma(_654, _778, _776);
        float _790 = _726 * _760;
        float _792 = fma(_714, _772, _780);
        float _794 = fma(_658, _782, _786);
        float _796 = fma(_658, _784, _788);
        float _798 = fma(_658, _790, _792);
        _800 = _726;
        _662 = _692;
        _664 = _694;
        _576 = _696;
        _578 = _760;
        _580 = _776;
        _582 = _790;
        _584 = _772;
        _586 = _698;
        _314 = _788;
        _316 = _782;
        _318 = _792;
        _666 = _786;
        _802 = _796;
        _588 = _714;
        _804 = _784;
        _806 = _794;
        _668 = _798;
        _808 = true;
    }
    else
    {
        int _810 = as_type<int>(_162) & 1024;
        bool _812 = _810 != 0;
        if (_812)
        {
            _232 = true;
        }
        bool _814 = _232;
        bool _816 = _814;
        if (!_812)
        {
            int _818 = as_type<int>(_162) & 2048;
            bool _820 = _818 != 0;
            _816 = _820;
        }
        bool _822 = _816;
        if (!_822)
        {
            _614 = _654;
        }
        float _824 = _614;
        _806 = _824;
        if (!_822)
        {
            _574 = _656;
        }
        float _826 = _574;
        bool _828 = !_822;
        _800 = 0.0;
        _802 = _826;
        _804 = 0.0;
        if (!_828)
        {
            uint _830 = uint(int(uint(_164) >> uint(2)));
            float _832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_830)]);
            int _834 = _164 + 4;
            uint _836 = uint(int(uint(_834) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_836)]);
            int _840 = _164 + 8;
            uint _842 = uint(int(uint(_840) >> uint(2)));
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_842)]);
            uint _846 = uint(int(uint(_164) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_846)]);
            int _850 = _164 + 4;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_852)]);
            int _856 = _164 + 8;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_858)]);
            uint _862 = uint(int(uint(_164) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_862)]);
            int _866 = _164 + 4;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_868)]);
            int _872 = _164 + 8;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_874)]);
            float _878 = _844 * _848;
            float _880 = _844 * _854;
            float _882 = _838 * _848;
            float _884 = -_878;
            float _886 = fma(_832, _860, _884);
            float _888 = -_880;
            float _890 = fma(_838, _860, _888);
            float _892 = -_882;
            float _894 = fma(_832, _854, _892);
            float _896 = _870 * _832;
            float _898 = _870 * _886;
            float _900 = _876 * _838;
            float _902 = _864 * _854;
            float _904 = -_896;
            float _906 = fma(_864, _838, _904);
            float _908 = -_898;
            float _910 = fma(_864, _890, _908);
            float _912 = _870 * _860;
            float _914 = _876 * _848;
            float _916 = _864 * _844;
            float _918 = fma(_876, _894, _910);
            float _920 = -_912;
            float _922 = fma(_876, _854, _920);
            float _924 = -_914;
            float _926 = fma(_864, _860, _924);
            float _928 = -_902;
            float _930 = fma(_870, _848, _928);
            float _932 = -_916;
            float _934 = fma(_876, _832, _932);
            float _936 = -_832;
            float _938 = fma(_936, _860, _878);
            float _940 = 1.0 / _918;
            float _942 = -_900;
            float _944 = fma(_870, _844, _942);
            float _946 = _922 * _940;
            float _948 = _926 * _940;
            float _950 = _930 * _940;
            float _952 = _654 * _940;
            float _954 = _656 * _946;
            float _956 = _656 * _948;
            float _958 = _938 * _940;
            float _960 = _656 * _950;
            float _962 = _944 * _940;
            float _964 = _934 * _940;
            float _966 = fma(_890, _952, _954);
            float _968 = fma(_654, _958, _956);
            float _970 = _906 * _940;
            float _972 = fma(_894, _952, _960);
            float _974 = fma(_658, _962, _966);
            float _976 = fma(_658, _964, _968);
            float _978 = fma(_658, _970, _972);
            _800 = _906;
            _662 = _864;
            _664 = _870;
            _576 = _876;
            _578 = _940;
            _580 = _956;
            _582 = _970;
            _584 = _952;
            _586 = _878;
            _314 = _968;
            _316 = _962;
            _318 = _972;
            _666 = _966;
            _802 = _976;
            _588 = _894;
            _804 = _964;
            _806 = _974;
            _668 = _978;
        }
    }
    _808 = false;
    float _980 = _800;
    float _982 = _662;
    float _984 = _664;
    float _986 = _576;
    float _988 = _578;
    float _990 = _580;
    float _992 = _582;
    float _994 = _584;
    float _996 = _586;
    float _998 = _314;
    float _1000 = _316;
    float _1002 = _318;
    float _1004 = _666;
    float _1006 = _802;
    float _1008 = _588;
    float _1010 = _804;
    float _1012 = _806;
    float _1014 = _668;
    uint _1016 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1016)] = as_type<uint>(_560);
    float _1018 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[52]);
    float _1020 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _1022 = trunc(_1018);
    int _1024 = int(_1022);
    bool _1026 = _1024 != 0;
    float _1028 = _980;
    float _1030 = as_type<float>(_1024);
    if (!_1026)
    {
        float _1032 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1028 = _1032;
    }
    float _1034 = _1028;
    int _1036 = as_type<int>(_1020) & 512;
    bool _1038 = _1036 != 0;
    int _1040 = as_type<int>(_1020) & 1024;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>(_1020) & 2048;
    bool _1046 = _1044 != 0;
    bool _1048 = _1024 != 1;
    float _1050 = _982;
    float _1052 = _984;
    float _1054 = _986;
    float _1056 = _988;
    float _1058 = _1020;
    if (_1038)
    {
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1050 = _1060;
        _1052 = _1062;
        _1054 = _1064;
        _1056 = _1066;
    }
    float _1068 = _1050;
    float _1070 = _1052;
    float _1072 = _1054;
    float _1074 = _1056;
    float _1076 = _990;
    float _1078 = _992;
    float _1080 = _994;
    float _1082 = _996;
    if (_1042)
    {
        uint _1084 = uint(int(uint(_164) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1084)]);
        int _1088 = _164 + 4;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1090)]);
        int _1094 = _164 + 8;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1096)]);
        int _1100 = _164 + 12;
        uint _1102 = uint(int(uint(_1100) >> uint(2)));
        float _1104 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1102)]);
        _1076 = _1086;
        _1078 = _1092;
        _1080 = _1098;
        _1082 = _1104;
    }
    float _1106 = _1076;
    float _1108 = _1078;
    float _1110 = _1080;
    float _1112 = _1082;
    float _1114 = _998;
    float _1116 = _1000;
    float _1118 = _1002;
    float _1120 = _1004;
    if (_1046)
    {
        uint _1122 = uint(int(uint(_164) >> uint(2)));
        float _1124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1122)]);
        int _1126 = _164 + 4;
        uint _1128 = uint(int(uint(_1126) >> uint(2)));
        float _1130 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1128)]);
        int _1132 = _164 + 8;
        uint _1134 = uint(int(uint(_1132) >> uint(2)));
        float _1136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1134)]);
        int _1138 = _164 + 12;
        uint _1140 = uint(int(uint(_1138) >> uint(2)));
        float _1142 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1140)]);
        _1114 = _1124;
        _1116 = _1130;
        _1118 = _1136;
        _1120 = _1142;
    }
    float _1144 = _1114;
    float _1146 = _1116;
    float _1148 = _1118;
    float _1150 = _1120;
    float _1152 = _648 + _1006;
    float _1154 = _1008;
    if (_1042)
    {
        float _1156 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1154 = _1156;
    }
    float _1158 = _1154;
    float _1160 = _648;
    if (!_1048)
    {
        float _1162 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1160 = _1162;
    }
    float _1164 = _1160;
    bool _1166 = _1152 < _1034;
    bool _1168 = !_1026;
    bool _1170 = _1166 && _1168;
    if (!_1170)
    {
        _1058 = _1152;
    }
    float _1172 = _1058;
    float _1174 = _1006;
    if (_1170)
    {
        float _1176 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[53]);
        _1174 = _1176;
    }
    float _1178 = _1174;
    float _1180 = _1010;
    if (_1170)
    {
        float _1182 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[54]);
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = _1172;
    if (_1170)
    {
        float _1188 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = _646 + _1012;
    float _1194 = _1070;
    float _1196 = _1108;
    float _1198 = _1146;
    float _1200 = _1072;
    float _1202 = _1110;
    float _1204 = _1148;
    float _1206 = _1068;
    float _1208 = _1150;
    float _1210 = _1112;
    float _1212 = _1144;
    float _1214 = _1150;
    float _1216 = _1106;
    float _1218 = _1112;
    float _1220 = _1074;
    float _1222 = _1158;
    float _1224 = _1192;
    if (_1038)
    {
        float _1226 = _1152 * _1070;
        _1194 = _1226;
    }
    float _1228 = _1194;
    float _1230 = _1228;
    if (_1042)
    {
        float _1232 = _1152 * _1108;
        _1196 = _1232;
    }
    float _1234 = _1196;
    float _1236 = _1234;
    if (_1046)
    {
        float _1238 = _1152 * _1146;
        _1198 = _1238;
    }
    float _1240 = _1198;
    float _1242 = _650 + _1014;
    float _1244 = _1240;
    if (_1038)
    {
        float _1246 = fma(_1192, _1068, _1228);
        _1230 = _1246;
    }
    float _1248 = _1230;
    float _1250 = _1248;
    if (_1042)
    {
        float _1252 = fma(_1192, _1106, _1234);
        _1236 = _1252;
    }
    float _1254 = _1236;
    float _1256 = _1254;
    float _1258 = _1254;
    if (_1046)
    {
        float _1260 = fma(_1192, _1144, _1240);
        _1244 = _1260;
    }
    float _1262 = _1244;
    float _1264 = _1262;
    if (_1038)
    {
        float _1266 = fma(_1242, _1072, _1248);
        _1200 = _1266;
    }
    float _1268 = _1200;
    float _1270 = _1268;
    if (_1042)
    {
        float _1272 = fma(_1242, _1110, _1254);
        _1202 = _1272;
    }
    float _1274 = _1202;
    float _1276 = _1274;
    if (_1046)
    {
        float _1278 = fma(_1242, _1148, _1262);
        _1204 = _1278;
    }
    float _1280 = _1204;
    float _1282 = _1280;
    if (!_1038)
    {
        _1206 = 0.0;
    }
    float _1284 = _1206;
    float _1286 = _1284;
    if (_1038)
    {
        float _1288 = _1074 + _1268;
        _1286 = _1288;
    }
    float _1290 = _1286;
    float _1292 = _1290;
    if (_1042)
    {
        float _1294 = _1158 + _1274;
        _1292 = _1294;
    }
    float _1296 = _1292;
    float _1298 = _1296;
    if (_1046)
    {
        float _1300 = _1150 + _1280;
        _1298 = _1300;
    }
    float _1302 = _1298;
    bool _1304 = _1302 < _1164;
    bool _1306 = !_1048;
    bool _1308 = _1304 && _1306;
    float _1310 = _642;
    float _1312 = _652;
    float _1314 = _1302;
    if (!_1170)
    {
        _670 = _644;
    }
    float _1316 = _670;
    float _1318 = _1316;
    if (!_1308)
    {
        _672 = _1242;
    }
    float _1320 = _672;
    float _1322 = _1320;
    float _1324 = _1320;
    float _1326 = _1178;
    if (_1170)
    {
        float _1328 = _644 * _1178;
        _674 = _1328;
    }
    float _1330 = _674;
    float _1332 = _1330;
    if (_1170)
    {
        float _1334 = _642 * _1184;
        _1310 = _1334;
    }
    float _1336 = _1310;
    if (_1170)
    {
        float _1338 = -_1330;
        float _1340 = fma(_1338, _1184, -0.0);
        _1318 = _1340;
    }
    float _1342 = _1318;
    float _1344 = _1342;
    if (_1170)
    {
        float _1346 = _652 * _1184;
        _1312 = _1346;
    }
    float _1348 = _1312;
    float _1350 = _1348;
    if (!_1308)
    {
        _676 = _1192;
    }
    float _1352 = _676;
    float _1354 = _1352;
    float _1356 = _1352;
    if (!_1308)
    {
        _1332 = _1190;
    }
    float _1358 = _1332;
    float _1360 = _1358;
    float _1362 = _1358;
    if (!_1308)
    {
        _678 = _1336;
    }
    float _1364 = _678;
    bool _1366 = !_1308;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        float _1372 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[53]);
        float _1374 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[54]);
        if (!_1038)
        {
            _1354 = _510;
        }
        float _1376 = _1354;
        float _1378 = _1376;
        if (!_1038)
        {
            _1360 = _512;
        }
        float _1380 = _1360;
        float _1382 = _1380;
        if (!_1038)
        {
            _1322 = _514;
        }
        float _1384 = _1322;
        bool _1386 = !_1038;
        float _1388 = _1384;
        _1250 = _1370;
        _1220 = _1372;
        _1326 = _1374;
        if (!_1386)
        {
            float _1390 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1394 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1396 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _1412 = _1396 * _1394;
            float _1414 = _1398 * _1394;
            float _1416 = -_1412;
            float _1418 = fma(_1400, _1390, _1416);
            float _1420 = -_1414;
            float _1422 = fma(_1400, _1392, _1420);
            float _1424 = _1396 * _1392;
            float _1426 = _1406 * _1418;
            float _1428 = -_1424;
            float _1430 = fma(_1398, _1390, _1428);
            float _1432 = -_1426;
            float _1434 = fma(_1404, _1422, _1432);
            float _1436 = _1408 * _1396;
            float _1438 = fma(_1408, _1430, _1434);
            float _1440 = _1406 * _1400;
            float _1442 = _1404 * _1398;
            float _1444 = -_1436;
            float _1446 = fma(_1404, _1400, _1444);
            float _1448 = 1.0 / _1438;
            float _1450 = -_1440;
            float _1452 = fma(_1408, _1398, _1450);
            float _1454 = -_1442;
            float _1456 = fma(_1406, _1396, _1454);
            float _1458 = _1446 * _1448;
            float _1460 = _1452 * _1448;
            float _1462 = _1456 * _1448;
            _1382 = _1458;
            _1378 = _1460;
            _1388 = _1462;
            _1208 = _1410;
            _1256 = _1398;
            _1210 = _1402;
        }
        float _1464 = _1382;
        float _1466 = _1378;
        float _1468 = _1388;
        float _1470 = _1208;
        float _1472 = _1256;
        float _1474 = _1210;
        float _1476 = _1464 * _1464;
        float _1478 = _1372 + 1.0;
        float _1480 = fma(_1466, _1466, _1476);
        float _1482 = fma(_1468, _1468, _1480);
        float _1484 = rsqrt(_1482);
        float _1486 = _1484 * _1464;
        float _1488 = _1484 * _1466;
        float _1490 = _1484 * _1468;
        float _1492 = _1486 * _1342;
        float _1494 = fma(_1488, _1336, _1492);
        float _1496 = -_1302;
        float _1498 = _1496 + _1370;
        float _1500 = fma(_1490, _1348, _1494);
        float _1502 = fma(_1498, _1466, _1192);
        float _1504 = fma(_1498, _1464, _1190);
        float _1506 = fma(_1498, _1468, _1242);
        float _1508 = _1500 * _1478;
        float _1510 = -_1488;
        float _1512 = fma(_1510, _1508, _1336);
        float _1514 = -_1486;
        float _1516 = fma(_1514, _1508, _1342);
        float _1518 = -_1490;
        float _1520 = fma(_1518, _1508, _1348);
        float _1522 = _1512 * _1374;
        float _1524 = _1516 * _1374;
        float _1526 = _1520 * _1374;
        _1264 = _1508;
        _1362 = _1504;
        _1344 = _1524;
        _1212 = _1484;
        _1282 = _1486;
        _1214 = _1470;
        _1216 = _1490;
        _1258 = _1472;
        _1276 = _1498;
        _1218 = _1474;
        _1270 = _1478;
        _1356 = _1502;
        _1324 = _1506;
        _1368 = _1522;
        _1350 = _1526;
    }
    float _1528 = _1264;
    float _1530 = _1362;
    float _1532 = _1344;
    float _1534 = _1212;
    float _1536 = _1282;
    float _1538 = _1214;
    float _1540 = _1216;
    float _1542 = _1258;
    float _1544 = _1276;
    float _1546 = _1218;
    float _1548 = _1250;
    float _1550 = _1270;
    float _1552 = _1220;
    float _1554 = _1356;
    float _1556 = _1324;
    float _1558 = _1326;
    float _1560 = _1368;
    float _1562 = _1350;
    bool _1564 = _1024 != 3;
    bool _1566 = _1024 != 2;
    float _1568 = _1528;
    float _1570 = _1558;
    float _1572 = _1532;
    float _1574 = _1540;
    float _1576 = _1542;
    float _1578 = _1544;
    float _1580 = _1546;
    float _1582 = _1548;
    float _1584 = _1550;
    float _1586 = _1552;
    float _1588 = _1558;
    float _1590 = _1530;
    float _1592 = _1538;
    float _1594 = _1536;
    float _1596 = _1534;
    float _1598 = _1560;
    float _1600 = _1562;
    if (!_1564)
    {
        float _1602 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1568 = _1602;
    }
    float _1604 = _1568;
    float _1606 = _1190;
    if (!_1566)
    {
        float _1608 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[55]);
        _1606 = _1608;
    }
    float _1610 = _1606;
    bool _1612 = _1302 < _1604;
    bool _1614 = !_1564;
    bool _1616 = _1612 && _1614;
    bool _1618 = _1530 < _1610;
    bool _1620 = !_1566;
    bool _1622 = _1618 && _1620;
    bool _1624 = !_1616;
    bool _1626 = _1624 && _1622;
    bool _1628 = !_1622;
    bool _1630 = _1616 && _1628;
    bool _1632 = _1626 || _1630;
    bool _1634 = _1616 && _1622;
    bool _1636 = _1632 || _1634;
    bool _1638 = !_1636;
    int _1640 = _1638 ? as_type<int>(_560) : 0;
    uint _1642 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1642)] = uint(_1640);
    float _1644 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    bool _1646 = _1532 >= 0.0;
    bool _1648 = isnan(_1532);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    int _1656 = as_type<int>(_1644) & 512;
    bool _1658 = _1656 != 0;
    int _1660 = as_type<int>(_1644) & 1024;
    bool _1662 = _1660 != 0;
    int _1664 = as_type<int>(_1644) & 2048;
    bool _1666 = _1664 != 0;
    float _1668 = _1610;
    float _1670 = _1604;
    float _1672 = _1644;
    if (!_1654)
    {
        float _1674 = _1534;
        float _1676 = _1604;
        float _1678 = _1536;
        float _1680 = _1538;
        if (_1658)
        {
            float _1682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1674 = _1682;
            _1676 = _1684;
            _1678 = _1686;
            _1680 = _1688;
        }
        float _1690 = _1674;
        float _1692 = _1676;
        float _1694 = _1678;
        float _1696 = _1680;
        float _1698 = _1540;
        float _1700 = _1542;
        float _1702 = _1544;
        float _1704 = _1546;
        if (_1658)
        {
            float _1706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1698 = _1706;
            _1700 = _1708;
            _1702 = _1710;
            _1704 = _1712;
        }
        float _1714 = _1698;
        float _1716 = _1700;
        float _1718 = _1702;
        float _1720 = _1704;
        float _1722 = _1302;
        float _1724 = _1548;
        float _1726 = _1550;
        float _1728 = _1552;
        if (_1658)
        {
            float _1730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1722 = _1730;
            _1724 = _1732;
            _1726 = _1734;
            _1728 = _1736;
        }
        float _1738 = _1722;
        float _1740 = _1724;
        float _1742 = _1726;
        float _1744 = _1728;
        if (!_1658)
        {
            _1570 = 0.0;
        }
        float _1746 = _1570;
        float _1748 = _1692;
        float _1750 = _1694;
        float _1752 = _1690;
        float _1754 = _1746;
        _1224 = 6.2500002968590706586837768554688e-05;
        if (_1658)
        {
            float _1756 = _1692 * _1530;
            _1748 = _1756;
        }
        float _1758 = _1748;
        float _1760 = _1716;
        float _1762 = _1758;
        float _1764 = _1718;
        float _1766 = _1714;
        float _1768 = _1720;
        if (_1658)
        {
            float _1770 = _1716 * _1530;
            _1760 = _1770;
        }
        float _1772 = _1760;
        float _1774 = _1772;
        if (_1658)
        {
            float _1776 = fma(_1690, _1554, _1758);
            _1762 = _1776;
        }
        float _1778 = _1762;
        float _1780 = _1740;
        float _1782 = _1778;
        float _1784 = _1742;
        float _1786 = _1738;
        float _1788 = _1744;
        if (_1658)
        {
            float _1790 = _1740 * _1530;
            _1780 = _1790;
        }
        float _1792 = _1780;
        float _1794 = _1792;
        if (_1658)
        {
            float _1796 = fma(_1714, _1554, _1772);
            _1774 = _1796;
        }
        float _1798 = _1774;
        float _1800 = _1798;
        if (_1658)
        {
            float _1802 = fma(_1694, _1556, _1778);
            _1750 = _1802;
        }
        float _1804 = _1750;
        float _1806 = _1804;
        if (_1658)
        {
            float _1808 = fma(_1738, _1554, _1792);
            _1794 = _1808;
        }
        float _1810 = _1794;
        float _1812 = _1810;
        if (_1658)
        {
            float _1814 = fma(_1718, _1556, _1798);
            _1764 = _1814;
        }
        float _1816 = _1764;
        float _1818 = _1816;
        if (!_1658)
        {
            _1752 = 0.0;
            _1782 = 0.0;
        }
        float _1820 = _1752;
        float _1822 = _1782;
        float _1824 = _1822;
        float _1826 = _1820;
        if (_1658)
        {
            float _1828 = fma(_1742, _1556, _1810);
            _1784 = _1828;
        }
        float _1830 = _1784;
        float _1832 = _1830;
        if (_1658)
        {
            float _1834 = _1696 + _1804;
            _1824 = _1834;
        }
        float _1836 = _1824;
        float _1838 = _1836;
        if (_1658)
        {
            float _1840 = _1720 + _1816;
            _1754 = _1840;
        }
        float _1842 = _1754;
        float _1844 = _1842;
        if (_1658)
        {
            float _1846 = _1744 + _1830;
            _1826 = _1846;
        }
        float _1848 = _1826;
        bool _1850 = !_1662;
        float _1852 = _1848;
        if (!_1850)
        {
            float _1854 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _1856 = uint(int(uint(_164) >> uint(2)));
            float _1858 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1856)]);
            int _1860 = _164 + 4;
            uint _1862 = uint(int(uint(_1860) >> uint(2)));
            float _1864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1862)]);
            int _1866 = _164 + 8;
            uint _1868 = uint(int(uint(_1866) >> uint(2)));
            float _1870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1868)]);
            uint _1872 = uint(int(uint(_164) >> uint(2)));
            float _1874 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1872)]);
            int _1876 = _164 + 4;
            uint _1878 = uint(int(uint(_1876) >> uint(2)));
            float _1880 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1878)]);
            int _1882 = _164 + 8;
            uint _1884 = uint(int(uint(_1882) >> uint(2)));
            float _1886 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1884)]);
            int _1888 = _164 + 12;
            uint _1890 = uint(int(uint(_1888) >> uint(2)));
            float _1892 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1890)]);
            uint _1894 = uint(int(uint(_164) >> uint(2)));
            float _1896 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1894)]);
            int _1898 = _164 + 4;
            uint _1900 = uint(int(uint(_1898) >> uint(2)));
            float _1902 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1900)]);
            int _1904 = _164 + 8;
            uint _1906 = uint(int(uint(_1904) >> uint(2)));
            float _1908 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1906)]);
            int _1910 = _164 + 12;
            uint _1912 = uint(int(uint(_1910) >> uint(2)));
            float _1914 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1912)]);
            float _1916 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1918 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1920 = _1864 * _1530;
            float _1922 = _1880 * _1530;
            float _1924 = _1902 * _1530;
            float _1926 = fma(_1858, _1554, _1920);
            float _1928 = fma(_1874, _1554, _1922);
            float _1930 = fma(_1896, _1554, _1924);
            float _1932 = fma(_1870, _1556, _1926);
            float _1934 = fma(_1886, _1556, _1928);
            float _1936 = fma(_1908, _1556, _1930);
            float _1938 = _1854 + _1932;
            float _1940 = _1916 + _1934;
            float _1942 = _1918 + _1936;
            _1852 = _1942;
            _1838 = _1938;
            _1806 = _1870;
            _1766 = _1874;
            _1800 = _1934;
            _1818 = _1886;
            _1768 = _1892;
            _1786 = _1896;
            _1812 = _1930;
            _1832 = _1936;
            _1788 = _1914;
            _1844 = _1940;
        }
        float _1944 = _1852;
        float _1946 = _1838;
        float _1948 = _1806;
        float _1950 = _1766;
        float _1952 = _1800;
        float _1954 = _1818;
        float _1956 = _1768;
        float _1958 = _1786;
        float _1960 = _1812;
        float _1962 = _1832;
        float _1964 = _1788;
        float _1966 = _1844;
        bool _1968 = !_1666;
        float _1970 = _1946;
        float _1972 = _1944;
        float _1974 = _1966;
        float _1976 = _1952;
        float _1978 = _1954;
        float _1980 = _1956;
        float _1982 = _1958;
        float _1984 = _1960;
        float _1986 = _1950;
        float _1988 = _1962;
        float _1990 = _1964;
        float _1992 = _1948;
        if (!_1968)
        {
            uint _1994 = uint(int(uint(_164) >> uint(2)));
            float _1996 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1994)]);
            int _1998 = _164 + 4;
            uint _2000 = uint(int(uint(_1998) >> uint(2)));
            float _2002 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2000)]);
            int _2004 = _164 + 8;
            uint _2006 = uint(int(uint(_2004) >> uint(2)));
            float _2008 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2006)]);
            int _2010 = _164 + 12;
            uint _2012 = uint(int(uint(_2010) >> uint(2)));
            float _2014 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2012)]);
            uint _2016 = uint(int(uint(_164) >> uint(2)));
            float _2018 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2016)]);
            int _2020 = _164 + 4;
            uint _2022 = uint(int(uint(_2020) >> uint(2)));
            float _2024 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2022)]);
            int _2026 = _164 + 8;
            uint _2028 = uint(int(uint(_2026) >> uint(2)));
            float _2030 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2028)]);
            int _2032 = _164 + 12;
            uint _2034 = uint(int(uint(_2032) >> uint(2)));
            float _2036 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2034)]);
            uint _2038 = uint(int(uint(_164) >> uint(2)));
            float _2040 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2038)]);
            int _2042 = _164 + 4;
            uint _2044 = uint(int(uint(_2042) >> uint(2)));
            float _2046 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2044)]);
            int _2048 = _164 + 8;
            uint _2050 = uint(int(uint(_2048) >> uint(2)));
            float _2052 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2050)]);
            int _2054 = _164 + 12;
            uint _2056 = uint(int(uint(_2054) >> uint(2)));
            float _2058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2056)]);
            float _2060 = _2002 * _1530;
            float _2062 = _2024 * _1530;
            float _2064 = _2046 * _1530;
            float _2066 = fma(_1996, _1554, _2060);
            float _2068 = fma(_2018, _1554, _2062);
            float _2070 = fma(_2040, _1554, _2064);
            float _2072 = fma(_2008, _1556, _2066);
            float _2074 = fma(_2030, _1556, _2068);
            float _2076 = fma(_2052, _1556, _2070);
            float _2078 = _2072 + _2014;
            float _2080 = _2074 + _2036;
            float _2082 = _2076 + _2058;
            _1970 = _2078;
            _1972 = _2082;
            _1974 = _2080;
            _1976 = _2068;
            _1978 = _2074;
            _1980 = _2036;
            _1982 = _2040;
            _1984 = _2070;
            _1986 = _2018;
            _1988 = _2076;
            _1990 = _2058;
            _1992 = _2072;
        }
        float _2084 = _1970;
        float _2086 = _1972;
        float _2088 = _1974;
        float _2090 = _1976;
        float _2092 = _1978;
        float _2094 = _1980;
        float _2096 = _1982;
        float _2098 = _1984;
        float _2100 = _1986;
        float _2102 = _1988;
        float _2104 = _1990;
        float _2106 = _1992;
        float _2108 = fma(_2084, 6.2500002968590706586837768554688e-05, 0.5);
        float _2110 = fma(_2086, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _6397 = float2(_2108, _2110);
        float _2112 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6397, float2(0.0), isnan(_6397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6397, float2(0.0), isnan(_6397)), level(0.0)).x;
        float _2114 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2116 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2118 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2120 = _2112 * 2000.0;
        float _2122 = -_2114;
        float _2124 = _2122 + _2088;
        float _2126 = _2120 + (-0.300000011920928955078125);
        bool _2128 = _2124 > _2126;
        bool _2130 = _2124 < _2120;
        bool _2132 = _2130 && _2128;
        bool _2134 = !_2132;
        float _2136 = _2108;
        _1574 = _2100;
        _1576 = _2090;
        _1578 = _2092;
        _1580 = _2094;
        _1314 = _2096;
        _1582 = _2098;
        _1584 = _2102;
        _1586 = _2104;
        _1588 = _2124;
        _1222 = _2120;
        _1030 = _2108;
        _1668 = _2116;
        _1670 = _2084;
        _1592 = _2126;
        _1672 = _2118;
        _1594 = _2106;
        _1596 = _2086;
        if (!_2134)
        {
            float _2138 = fma(_2084, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2140 = fma(_2084, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2142 = fma(_2086, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2144 = fma(_2086, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _6471 = float2(_2138, _2110);
            float _2146 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6471, float2(0.0), isnan(_6471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6471, float2(0.0), isnan(_6471)), level(0.0)).x;
            float2 _6479 = float2(_2140, _2110);
            float _2148 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6479, float2(0.0), isnan(_6479)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6479, float2(0.0), isnan(_6479)), level(0.0)).x;
            float2 _6487 = float2(_2108, _2142);
            float _2150 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6487, float2(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6487, float2(0.0), isnan(_6487)), level(0.0)).x;
            float2 _6495 = float2(_2108, _2144);
            float _2152 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6495, float2(0.0), isnan(_6495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6495, float2(0.0), isnan(_6495)), level(0.0)).x;
            float2 _6503 = float2(_2138, _2142);
            float _2154 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6503, float2(0.0), isnan(_6503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6503, float2(0.0), isnan(_6503)), level(0.0)).x;
            float2 _6511 = float2(_2138, _2144);
            float _2156 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6511, float2(0.0), isnan(_6511)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6511, float2(0.0), isnan(_6511)), level(0.0)).x;
            float2 _6519 = float2(_2140, _2142);
            float _2158 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6519, float2(0.0), isnan(_6519)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6519, float2(0.0), isnan(_6519)), level(0.0)).x;
            float2 _6527 = float2(_2140, _2144);
            float _2160 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_6527, float2(0.0), isnan(_6527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_6527, float2(0.0), isnan(_6527)), level(0.0)).x;
            float _2162 = -_2146;
            float _2164 = _2112 + _2162;
            float _2166 = -_2148;
            float _2168 = _2112 + _2166;
            float _2170 = -_2150;
            float _2172 = _2112 + _2170;
            float _2174 = -_2152;
            float _2176 = _2112 + _2174;
            float _2178 = -_2154;
            float _2180 = _2112 + _2178;
            float _2182 = -_2156;
            float _2184 = _2112 + _2182;
            float _2186 = -_2158;
            float _2188 = _2112 + _2186;
            float _2190 = -_2160;
            float _2192 = _2112 + _2190;
            float _2194 = abs(_2164);
            float _2196 = abs(_2168);
            float _2198 = precise::max(_2194, _2196);
            float _2200 = abs(_2172);
            float _2202 = abs(_2176);
            float _2204 = precise::max(_2200, _2202);
            float _2206 = abs(_2180);
            float _2208 = abs(_2184);
            float _2210 = precise::max(_2206, _2208);
            float _2212 = precise::max(_2198, _2204);
            float _2214 = abs(_2188);
            float _2216 = abs(_2192);
            float _2218 = precise::max(_2214, _2216);
            bool _2220 = _2212 > 0.00150000001303851604461669921875;
            float _2222 = precise::max(_2210, _2218);
            bool _2224 = _2222 <= 0.00150000001303851604461669921875;
            bool _2226 = isnan(_2222);
            bool _2228 = _2224 || _2226;
            bool _2230 = isnan(0.00150000001303851604461669921875);
            bool _2232 = _2228 || _2230;
            bool _2234 = !_2220;
            bool _2236 = _2232 && _2234;
            bool _2238 = !_2236;
            float _2240 = _2212;
            float _2242 = _2222;
            float _2244 = _2184;
            float _2246 = _2188;
            float _2248 = _2218;
            float _2250 = _2198;
            float _2252 = _2168;
            float _2254 = _2146;
            _1574 = _2144;
            _1576 = _2212;
            _1578 = _2222;
            _1580 = _2184;
            _1314 = _2188;
            _1582 = _2218;
            _1584 = _2198;
            _1586 = _2168;
            _1224 = _2146;
            _1670 = _2140;
            _1592 = _2142;
            _1594 = _2138;
            _1596 = _2172;
            if (!_2238)
            {
                float _2256 = -_2112;
                float _2258 = _2256 + _2146;
                float _2260 = -_2112;
                float _2262 = _2260 + _2150;
                float _2264 = _2258 * 2000.0;
                float _2266 = _2262 * 2000.0;
                bool _2268 = !_1658;
                float _2374;
                float _2376;
                float _2378;
                if (!_2268)
                {
                    float _2270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2286 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2288 = _2274 * _2276;
                    float _2290 = _2274 * _2278;
                    float _2292 = _2272 * _2276;
                    float _2294 = -_2288;
                    float _2296 = fma(_2270, _2280, _2294);
                    float _2298 = -_2290;
                    float _2300 = fma(_2272, _2280, _2298);
                    float _2302 = -_2292;
                    float _2304 = fma(_2270, _2278, _2302);
                    float _2306 = _2286 * _2272;
                    float _2308 = _2296 * _2284;
                    float _2310 = _2282 * _2274;
                    float _2312 = _2284 * _2270;
                    float _2314 = -_2306;
                    float _2316 = fma(_2284, _2274, _2314);
                    float _2318 = -_2308;
                    float _2320 = fma(_2300, _2282, _2318);
                    float _2322 = _2284 * _2280;
                    float _2324 = -_2310;
                    float _2326 = fma(_2286, _2270, _2324);
                    float _2328 = _2286 * _2276;
                    float _2330 = fma(_2304, _2286, _2320);
                    float _2332 = -_2322;
                    float _2334 = fma(_2286, _2278, _2332);
                    float _2336 = _2282 * _2278;
                    float _2338 = -_2270;
                    float _2340 = fma(_2338, _2280, _2288);
                    float _2342 = -_2328;
                    float _2344 = fma(_2282, _2280, _2342);
                    float _2346 = -_2312;
                    float _2348 = fma(_2282, _2272, _2346);
                    float _2350 = 1.0 / _2330;
                    float _2352 = -_2336;
                    float _2354 = fma(_2284, _2276, _2352);
                    float _2356 = fma(_2264, _2300, _2334);
                    float _2358 = fma(_2264, _2340, _2344);
                    float _2360 = fma(_2264, _2304, _2354);
                    float _2362 = fma(_2266, _2316, _2356);
                    float _2364 = fma(_2266, _2326, _2358);
                    float _2366 = fma(_2266, _2348, _2360);
                    float _2368 = _2350 * _2362;
                    float _2370 = _2350 * _2364;
                    float _2372 = _2350 * _2366;
                    _2374 = _2370;
                    _2376 = _2368;
                    _2378 = _2372;
                    _2240 = _2278;
                    _2242 = _2280;
                    _2244 = _2356;
                    _2246 = _2340;
                    _2248 = _2272;
                    _2250 = _2364;
                    _2252 = _2288;
                    _2254 = _2304;
                    _2136 = _2358;
                    _2380 = true;
                }
                else
                {
                    float _2382 = fma(_2264, _516, _510);
                    float _2384 = fma(_2264, _518, _512);
                    float _2386 = fma(_2264, _520, _514);
                    float _2388 = fma(_2266, _522, _2382);
                    float _2390 = fma(_2266, _524, _2384);
                    float _2392 = fma(_2266, _526, _2386);
                    _2374 = _2390;
                    _2376 = _2388;
                    _2378 = _2392;
                }
                _2380 = false;
                float _2394 = _2374;
                float _2396 = _2376;
                float _2398 = _2378;
                float _2400 = _2240;
                float _2402 = _2242;
                float _2404 = _2244;
                float _2406 = _2246;
                float _2408 = _2248;
                float _2410 = _2250;
                float _2412 = _2252;
                float _2414 = _2254;
                float _2416 = _2136;
                float _2418 = _2394 * _2394;
                float _2420 = -_2124;
                float _2422 = _2420 + _2120;
                float _2424 = fma(_2396, _2396, _2418);
                float _2426 = _2422 + _1530;
                float _2428 = fma(_2398, _2398, _2424);
                float _2430 = rsqrt(_2428);
                float _2432 = _2430 * _2394;
                float _2434 = _2430 * _2396;
                float _2436 = _2430 * _2398;
                float _2438 = _2432 * _1532;
                float _2440 = fma(_2434, _1560, _2438);
                float _2442 = fma(_2436, _1562, _2440);
                float _2444 = _2432 * _2442;
                float _2446 = _2436 * _2442;
                float _2448 = _2434 * _2442;
                float _2450 = -_2444;
                float _2452 = _2450 + _1532;
                float _2454 = -_2446;
                float _2456 = _2454 + _1562;
                float _2458 = -_2448;
                float _2460 = _2458 + _1560;
                float _2462 = _2116 * _2448;
                float _2464 = _2116 * _2444;
                float _2466 = _2116 * _2446;
                float _2468 = -_2462;
                float _2470 = fma(_2118, _2460, _2468);
                float _2472 = -_2464;
                float _2474 = fma(_2118, _2452, _2472);
                float _2476 = -_2466;
                float _2478 = fma(_2118, _2456, _2476);
                _1572 = _2474;
                _1574 = _2464;
                _1576 = _2400;
                _1578 = _2402;
                _1580 = _2404;
                _1314 = _2406;
                _1582 = _2408;
                _1584 = _2410;
                _1586 = _2412;
                _1222 = _2422;
                _1224 = _2414;
                _1030 = _2416;
                _1590 = _2426;
                _1670 = _2462;
                _1592 = _2430;
                _1594 = _2448;
                _1596 = _2466;
                _1598 = _2470;
                _1600 = _2478;
            }
        }
    }
    float _2480 = _1572;
    float _2482 = _1574;
    float _2484 = _1576;
    float _2486 = _1578;
    float _2488 = _1580;
    float _2490 = _1314;
    float _2492 = _1582;
    float _2494 = _1584;
    float _2496 = _1586;
    float _2498 = _1588;
    float _2500 = _1222;
    float _2502 = _1224;
    float _2504 = _1030;
    float _2506 = _1590;
    float _2508 = _1668;
    float _2510 = _1670;
    float _2512 = _1592;
    float _2514 = _1672;
    float _2516 = _1594;
    float _2518 = _1596;
    float _2520 = _1598;
    float _2522 = _1600;
    bool _2524 = _2480 >= 0.0;
    bool _2526 = isnan(_2480);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan(0.0);
    bool _2532 = _2528 || _2530;
    float _2534 = _2508;
    float _2536 = _2510;
    float _2538 = _2512;
    float _2540 = _2514;
    float _2542 = _2516;
    float _2544 = _2518;
    float _2546 = _2506;
    float _2548 = _2520;
    float _2550 = _2480;
    float _2552 = _2522;
    if (!_2532)
    {
        float _2554 = _2482;
        float _2556 = _2484;
        float _2558 = _2486;
        float _2560 = _2488;
        if (_1658)
        {
            float _2562 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2564 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2566 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2568 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _2554 = _2562;
            _2556 = _2564;
            _2558 = _2566;
            _2560 = _2568;
        }
        float _2570 = _2554;
        float _2572 = _2556;
        float _2574 = _2558;
        float _2576 = _2560;
        float _2578 = _2490;
        float _2580 = _2492;
        float _2582 = _2494;
        float _2584 = _2496;
        if (_1658)
        {
            float _2586 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2588 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _2578 = _2586;
            _2580 = _2588;
            _2582 = _2590;
            _2584 = _2592;
        }
        float _2594 = _2578;
        float _2596 = _2580;
        float _2598 = _2582;
        float _2600 = _2584;
        float _2602 = _2498;
        float _2604 = _2500;
        float _2606 = _2502;
        float _2608 = _2504;
        if (_1658)
        {
            float _2610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2612 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2614 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2616 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2602 = _2610;
            _2604 = _2612;
            _2606 = _2614;
            _2608 = _2616;
        }
        float _2618 = _2602;
        float _2620 = _2604;
        float _2622 = _2606;
        float _2624 = _2608;
        float _2626 = _2570;
        if (_1658)
        {
            float _2628 = _2572 * _2506;
            _2534 = _2628;
        }
        float _2630 = _2534;
        float _2632 = _2630;
        float _2634 = _2618;
        if (_1658)
        {
            float _2636 = _2596 * _2506;
            _2536 = _2636;
        }
        float _2638 = _2536;
        float _2640 = _2638;
        if (_1658)
        {
            float _2642 = fma(_2570, _1554, _2630);
            _2632 = _2642;
        }
        float _2644 = _2632;
        if (_1658)
        {
            float _2646 = _2620 * _2506;
            _2538 = _2646;
        }
        float _2648 = _2538;
        float _2650 = _2648;
        if (_1658)
        {
            float _2652 = fma(_2594, _1554, _2638);
            _2640 = _2652;
        }
        float _2654 = _2640;
        float _2656 = _2654;
        if (_1658)
        {
            float _2658 = fma(_2574, _1556, _2644);
            _2540 = _2658;
        }
        float _2660 = _2540;
        if (_1658)
        {
            float _2662 = fma(_2618, _1554, _2648);
            _2650 = _2662;
        }
        float _2664 = _2650;
        if (_1658)
        {
            float _2666 = fma(_2598, _1556, _2654);
            _2542 = _2666;
        }
        float _2668 = _2542;
        if (!_1658)
        {
            _2634 = 0.0;
        }
        float _2670 = _2634;
        float _2672 = _2670;
        if (!_1658)
        {
            _2544 = 0.0;
            _2656 = 0.0;
        }
        float _2674 = _2544;
        float _2676 = _2656;
        float _2678 = _2676;
        float _2680 = _2674;
        if (_1658)
        {
            float _2682 = fma(_2622, _1556, _2664);
            _2626 = _2682;
        }
        float _2684 = _2626;
        if (_1658)
        {
            float _2686 = _2576 + _2660;
            _2678 = _2686;
        }
        float _2688 = _2678;
        float _2690 = _2688;
        if (_1658)
        {
            float _2692 = _2600 + _2668;
            _2672 = _2692;
        }
        float _2694 = _2672;
        float _2696 = _2694;
        if (_1658)
        {
            float _2698 = _2624 + _2684;
            _2680 = _2698;
        }
        float _2700 = _2680;
        bool _2702 = !_1662;
        float _2704 = _2700;
        if (!_2702)
        {
            float _2706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2708 = uint(int(uint(_164) >> uint(2)));
            float _2710 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2708)]);
            int _2712 = _164 + 4;
            uint _2714 = uint(int(uint(_2712) >> uint(2)));
            float _2716 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2714)]);
            int _2718 = _164 + 8;
            uint _2720 = uint(int(uint(_2718) >> uint(2)));
            float _2722 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2720)]);
            uint _2724 = uint(int(uint(_164) >> uint(2)));
            float _2726 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2724)]);
            int _2728 = _164 + 4;
            uint _2730 = uint(int(uint(_2728) >> uint(2)));
            float _2732 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2730)]);
            int _2734 = _164 + 8;
            uint _2736 = uint(int(uint(_2734) >> uint(2)));
            float _2738 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2736)]);
            uint _2740 = uint(int(uint(_164) >> uint(2)));
            float _2742 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2740)]);
            int _2744 = _164 + 4;
            uint _2746 = uint(int(uint(_2744) >> uint(2)));
            float _2748 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2746)]);
            int _2750 = _164 + 8;
            uint _2752 = uint(int(uint(_2750) >> uint(2)));
            float _2754 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2752)]);
            float _2756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2760 = _2716 * _2506;
            float _2762 = _2732 * _2506;
            float _2764 = _2748 * _2506;
            float _2766 = fma(_2710, _1554, _2760);
            float _2768 = fma(_2726, _1554, _2762);
            float _2770 = fma(_2742, _1554, _2764);
            float _2772 = fma(_2722, _1556, _2766);
            float _2774 = fma(_2738, _1556, _2768);
            float _2776 = fma(_2754, _1556, _2770);
            float _2778 = _2706 + _2772;
            float _2780 = _2756 + _2774;
            float _2782 = _2758 + _2776;
            _2704 = _2782;
            _2690 = _2778;
            _2696 = _2780;
        }
        float _2784 = _2704;
        float _2786 = _2690;
        float _2788 = _2696;
        bool _2790 = !_1666;
        float _2792 = _2786;
        float _2794 = _2784;
        float _2796 = _2788;
        if (!_2790)
        {
            uint _2798 = uint(int(uint(_164) >> uint(2)));
            float _2800 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2798)]);
            int _2802 = _164 + 4;
            uint _2804 = uint(int(uint(_2802) >> uint(2)));
            float _2806 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2804)]);
            int _2808 = _164 + 8;
            uint _2810 = uint(int(uint(_2808) >> uint(2)));
            float _2812 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2810)]);
            int _2814 = _164 + 12;
            uint _2816 = uint(int(uint(_2814) >> uint(2)));
            float _2818 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2816)]);
            uint _2820 = uint(int(uint(_164) >> uint(2)));
            float _2822 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2820)]);
            int _2824 = _164 + 4;
            uint _2826 = uint(int(uint(_2824) >> uint(2)));
            float _2828 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2826)]);
            int _2830 = _164 + 8;
            uint _2832 = uint(int(uint(_2830) >> uint(2)));
            float _2834 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2832)]);
            int _2836 = _164 + 12;
            uint _2838 = uint(int(uint(_2836) >> uint(2)));
            float _2840 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2838)]);
            uint _2842 = uint(int(uint(_164) >> uint(2)));
            float _2844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2842)]);
            int _2846 = _164 + 4;
            uint _2848 = uint(int(uint(_2846) >> uint(2)));
            float _2850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2848)]);
            int _2852 = _164 + 8;
            uint _2854 = uint(int(uint(_2852) >> uint(2)));
            float _2856 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2854)]);
            int _2858 = _164 + 12;
            uint _2860 = uint(int(uint(_2858) >> uint(2)));
            float _2862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2860)]);
            float _2864 = _2806 * _2506;
            float _2866 = _2828 * _2506;
            float _2868 = _2850 * _2506;
            float _2870 = fma(_2800, _1554, _2864);
            float _2872 = fma(_2822, _1554, _2866);
            float _2874 = fma(_2844, _1554, _2868);
            float _2876 = fma(_2812, _1556, _2870);
            float _2878 = fma(_2834, _1556, _2872);
            float _2880 = fma(_2856, _1556, _2874);
            float _2882 = _2876 + _2818;
            float _2884 = _2878 + _2840;
            float _2886 = _2880 + _2862;
            _2792 = _2882;
            _2794 = _2886;
            _2796 = _2884;
        }
        float _2888 = _2792;
        float _2890 = _2794;
        float _2892 = _2796;
        float _2894 = fma(_2888, 6.2500002968590706586837768554688e-05, 0.5);
        float _2896 = fma(_2890, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _7576 = float2(_2894, _2896);
        float _2898 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7576, float2(0.0), isnan(_7576)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7576, float2(0.0), isnan(_7576)), level(0.0)).x;
        float _2900 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2902 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2906 = _2898 * 2000.0;
        float _2908 = -_2900;
        float _2910 = _2908 + _2892;
        float _2912 = _2906 + (-0.300000011920928955078125);
        bool _2914 = _2910 > _2912;
        bool _2916 = _2910 < _2906;
        bool _2918 = _2916 && _2914;
        bool _2920 = !_2918;
        if (!_2920)
        {
            float _2922 = fma(_2888, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2924 = fma(_2888, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2926 = fma(_2890, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2928 = fma(_2890, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _7624 = float2(_2922, _2896);
            float _2930 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7624, float2(0.0), isnan(_7624)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7624, float2(0.0), isnan(_7624)), level(0.0)).x;
            float2 _7632 = float2(_2924, _2896);
            float _2932 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7632, float2(0.0), isnan(_7632)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7632, float2(0.0), isnan(_7632)), level(0.0)).x;
            float2 _7640 = float2(_2894, _2926);
            float _2934 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7640, float2(0.0), isnan(_7640)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7640, float2(0.0), isnan(_7640)), level(0.0)).x;
            float2 _7648 = float2(_2894, _2928);
            float _2936 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7648, float2(0.0), isnan(_7648)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7648, float2(0.0), isnan(_7648)), level(0.0)).x;
            float2 _7656 = float2(_2922, _2926);
            float _2938 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7656, float2(0.0), isnan(_7656)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7656, float2(0.0), isnan(_7656)), level(0.0)).x;
            float2 _7664 = float2(_2922, _2928);
            float _2940 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7664, float2(0.0), isnan(_7664)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7664, float2(0.0), isnan(_7664)), level(0.0)).x;
            float2 _7672 = float2(_2924, _2926);
            float _2942 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7672, float2(0.0), isnan(_7672)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7672, float2(0.0), isnan(_7672)), level(0.0)).x;
            float2 _7680 = float2(_2924, _2928);
            float _2944 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7680, float2(0.0), isnan(_7680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7680, float2(0.0), isnan(_7680)), level(0.0)).x;
            float _2946 = -_2930;
            float _2948 = _2898 + _2946;
            float _2950 = -_2932;
            float _2952 = _2898 + _2950;
            float _2954 = -_2934;
            float _2956 = _2898 + _2954;
            float _2958 = -_2936;
            float _2960 = _2898 + _2958;
            float _2962 = -_2938;
            float _2964 = _2898 + _2962;
            float _2966 = -_2940;
            float _2968 = _2898 + _2966;
            float _2970 = -_2942;
            float _2972 = _2898 + _2970;
            float _2974 = -_2944;
            float _2976 = _2898 + _2974;
            float _2978 = abs(_2948);
            float _2980 = abs(_2952);
            float _2982 = precise::max(_2978, _2980);
            float _2984 = abs(_2956);
            float _2986 = abs(_2960);
            float _2988 = precise::max(_2984, _2986);
            float _2990 = abs(_2964);
            float _2992 = abs(_2968);
            float _2994 = precise::max(_2990, _2992);
            float _2996 = precise::max(_2982, _2988);
            float _2998 = abs(_2972);
            float _3000 = abs(_2976);
            float _3002 = precise::max(_2998, _3000);
            bool _3004 = _2996 > 0.00150000001303851604461669921875;
            float _3006 = precise::max(_2994, _3002);
            bool _3008 = _3006 <= 0.00150000001303851604461669921875;
            bool _3010 = isnan(_3006);
            bool _3012 = _3008 || _3010;
            bool _3014 = isnan(0.00150000001303851604461669921875);
            bool _3016 = _3012 || _3014;
            bool _3018 = !_3004;
            bool _3020 = _3016 && _3018;
            bool _3022 = !_3020;
            if (!_3022)
            {
                float _3024 = -_2898;
                float _3026 = _3024 + _2930;
                float _3028 = -_2898;
                float _3030 = _3028 + _2934;
                float _3032 = _3026 * 2000.0;
                float _3034 = _3030 * 2000.0;
                bool _3036 = !_1658;
                float _3142;
                float _3144;
                float _3146;
                if (!_3036)
                {
                    float _3038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _3040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _3042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _3044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _3046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _3048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _3050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _3052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _3054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _3056 = _3042 * _3044;
                    float _3058 = _3042 * _3046;
                    float _3060 = _3040 * _3044;
                    float _3062 = -_3056;
                    float _3064 = fma(_3038, _3048, _3062);
                    float _3066 = -_3058;
                    float _3068 = fma(_3040, _3048, _3066);
                    float _3070 = _3054 * _3040;
                    float _3072 = _3052 * _3048;
                    float _3074 = _3064 * _3052;
                    float _3076 = -_3060;
                    float _3078 = fma(_3038, _3046, _3076);
                    float _3080 = _3050 * _3042;
                    float _3082 = -_3070;
                    float _3084 = fma(_3052, _3042, _3082);
                    float _3086 = -_3074;
                    float _3088 = fma(_3068, _3050, _3086);
                    float _3090 = _3054 * _3044;
                    float _3092 = -_3080;
                    float _3094 = fma(_3054, _3038, _3092);
                    float _3096 = -_3072;
                    float _3098 = fma(_3054, _3046, _3096);
                    float _3100 = fma(_3078, _3054, _3088);
                    float _3102 = _3050 * _3046;
                    float _3104 = _3052 * _3038;
                    float _3106 = -_3038;
                    float _3108 = fma(_3106, _3048, _3056);
                    float _3110 = -_3090;
                    float _3112 = fma(_3050, _3048, _3110);
                    float _3114 = -_3102;
                    float _3116 = fma(_3052, _3044, _3114);
                    float _3118 = 1.0 / _3100;
                    float _3120 = -_3104;
                    float _3122 = fma(_3050, _3040, _3120);
                    float _3124 = fma(_3068, _3032, _3098);
                    float _3126 = fma(_3108, _3032, _3112);
                    float _3128 = fma(_3078, _3032, _3116);
                    float _3130 = fma(_3084, _3034, _3124);
                    float _3132 = fma(_3094, _3034, _3126);
                    float _3134 = fma(_3122, _3034, _3128);
                    float _3136 = _3118 * _3130;
                    float _3138 = _3118 * _3132;
                    float _3140 = _3118 * _3134;
                    _3142 = _3138;
                    _3144 = _3136;
                    _3146 = _3140;
                    _3148 = true;
                }
                else
                {
                    float _3150 = fma(_3032, _516, _510);
                    float _3152 = fma(_3032, _518, _512);
                    float _3154 = fma(_3032, _520, _514);
                    float _3156 = fma(_3034, _522, _3150);
                    float _3158 = fma(_3034, _524, _3152);
                    float _3160 = fma(_3034, _526, _3154);
                    _3142 = _3158;
                    _3144 = _3156;
                    _3146 = _3160;
                }
                _3148 = false;
                float _3162 = _3142;
                float _3164 = _3144;
                float _3166 = _3146;
                float _3168 = _3162 * _3162;
                float _3170 = -_2910;
                float _3172 = _3170 + _2906;
                float _3174 = fma(_3164, _3164, _3168);
                float _3176 = _3172 + _2506;
                float _3178 = fma(_3166, _3166, _3174);
                float _3180 = rsqrt(_3178);
                float _3182 = _3180 * _3162;
                float _3184 = _3180 * _3164;
                float _3186 = _3180 * _3166;
                float _3188 = _3182 * _2480;
                float _3190 = fma(_3184, _2520, _3188);
                float _3192 = fma(_3186, _2522, _3190);
                float _3194 = _3182 * _3192;
                float _3196 = _3186 * _3192;
                float _3198 = _3184 * _3192;
                float _3200 = -_3194;
                float _3202 = _3200 + _2480;
                float _3204 = -_3196;
                float _3206 = _3204 + _2522;
                float _3208 = -_3198;
                float _3210 = _3208 + _2520;
                float _3212 = _2902 * _3198;
                float _3214 = _2902 * _3194;
                float _3216 = _2902 * _3196;
                float _3218 = -_3212;
                float _3220 = fma(_2904, _3210, _3218);
                float _3222 = -_3214;
                float _3224 = fma(_2904, _3202, _3222);
                float _3226 = -_3216;
                float _3228 = fma(_2904, _3206, _3226);
                _2546 = _3176;
                _2548 = _3220;
                _2550 = _3224;
                _2552 = _3228;
            }
        }
    }
    float _3230 = _2546;
    float _3232 = _2548;
    float _3234 = _2550;
    float _3236 = _2552;
    int _3238 = _164 + 4;
    int _3240 = _164 + 8;
    uint _3242 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3242)] = uint(_1640);
    float _3244 = -_168;
    float _3246 = _3244 + _1554;
    float _3248 = -_174;
    float _3250 = _3248 + _3230;
    uint _3252 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3252)] = as_type<uint>(_1554);
    float _3254 = -_180;
    float _3256 = _3254 + _1556;
    uint _3258 = uint(int(uint(_3238) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3258)] = as_type<uint>(_3230);
    uint _3260 = uint(int(uint(_3240) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3260)] = as_type<uint>(_1556);
    uint _3262 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3262)] = as_type<uint>(_3232);
    uint _3264 = uint(int(uint(_3238) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3264)] = as_type<uint>(_3234);
    uint _3266 = uint(int(uint(_3240) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3266)] = as_type<uint>(_3236);
    uint _3268 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3268)] = as_type<uint>(_3246);
    uint _3270 = uint(int(uint(_3238) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3270)] = as_type<uint>(_3250);
    uint _3272 = uint(int(uint(_3240) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3272)] = as_type<uint>(_3256);
    float _3274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3276 = _3250 * _3250;
    float _3278 = _3234 * _3234;
    float _3280 = fma(_3246, _3246, _3276);
    float _3282 = fma(_3232, _3232, _3278);
    float _3284 = fma(_3256, _3256, _3280);
    float _3286 = fma(_3236, _3236, _3282);
    float _3288 = sqrt(_3286);
    float _3290 = sqrt(_3284);
    bool _3292 = _3290 >= 9.9999999747524270787835121154785e-07;
    bool _3294 = isnan(_3290);
    bool _3296 = _3292 || _3294;
    bool _3298 = isnan(9.9999999747524270787835121154785e-07);
    bool _3300 = _3296 || _3298;
    if (!_3300)
    {
        bool _3302 = _534 != _292;
        bool _3304 = isnan(_534);
        bool _3306 = _3302 || _3304;
        bool _3308 = isnan(_292);
        bool _3310 = _3306 || _3308;
        _3312 = _3310;
        if (!_3312)
        {
            float _3314 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3316 = _3314 > 0.0;
            bool _3318 = !_3316;
            if (!_3318)
            {
                float _3320 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3322 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3324 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3326 = _3322 * _3322;
                float _3328 = fma(_3320, _3320, _3326);
                float _3330 = fma(_3324, _3324, _3328);
                float _3332 = rsqrt(_3330);
                float _3334 = _3332 * 9.9999999747524270787835121154785e-07;
                float _3336 = _3320 * _3334;
                float _3338 = _3322 * _3334;
                float _3340 = _3324 * _3334;
                _332 = as_type<int>(_3336);
                _334 = as_type<int>(_3338);
                _336 = as_type<int>(_3340);
                _3312 = true;
            }
            else
            {
                bool _3342 = _3288 >= 9.9999999747524270787835121154785e-07;
                bool _3344 = isnan(_3288);
                bool _3346 = _3342 || _3344;
                bool _3348 = isnan(9.9999999747524270787835121154785e-07);
                bool _3350 = _3346 || _3348;
                if (!_3350)
                {
                    float _3352 = _3230 * _3230;
                    float _3354 = fma(_1554, _1554, _3352);
                    float _3356 = fma(_1556, _1556, _3354);
                    float _3358 = sqrt(_3356);
                    bool _3360 = _3358 >= 9.9999999747524270787835121154785e-07;
                    bool _3362 = isnan(_3358);
                    bool _3364 = _3360 || _3362;
                    bool _3366 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3368 = _3364 || _3366;
                    float _3370 = _3358;
                    if (_3368)
                    {
                        float _3372 = rsqrt(_3356);
                        _3370 = _3372;
                    }
                    float _3374 = _3370;
                    if (!_3368)
                    {
                        _320 = 0;
                    }
                    int _3376 = _320;
                    int _3378 = _3376;
                    if (!_3368)
                    {
                        _322 = 897988541;
                    }
                    int _3380 = _322;
                    int _3382 = _3380;
                    if (!_3368)
                    {
                        _324 = 0;
                    }
                    int _3384 = _324;
                    float _3386 = _3374;
                    int _3388 = _3384;
                    if (_3368)
                    {
                        float _3390 = _3374 * 9.9999999747524270787835121154785e-07;
                        _3386 = _3390;
                    }
                    float _3392 = _3386;
                    if (_3368)
                    {
                        float _3394 = _1554 * _3392;
                        _3378 = as_type<int>(_3394);
                    }
                    int _3396 = _3378;
                    _332 = _3396;
                    if (_3368)
                    {
                        float _3398 = _3230 * _3392;
                        _3382 = as_type<int>(_3398);
                    }
                    int _3400 = _3382;
                    _334 = _3400;
                    if (_3368)
                    {
                        float _3402 = _1556 * _3392;
                        _3388 = as_type<int>(_3402);
                    }
                    int _3404 = _3388;
                    _336 = _3404;
                    _3312 = true;
                }
                else
                {
                    float _3406 = rsqrt(_3286);
                    float _3408 = _3406 * 9.9999999747524270787835121154785e-07;
                    float _3410 = _3232 * _3408;
                    float _3412 = _3234 * _3408;
                    float _3414 = _3236 * _3408;
                    _332 = as_type<int>(_3410);
                    _334 = as_type<int>(_3412);
                    _336 = as_type<int>(_3414);
                    _3312 = true;
                }
            }
        }
    }
    else
    {
        float _3416 = _3288 * _3274;
        bool _3418 = _3416 >= 0.001000000047497451305389404296875;
        bool _3420 = isnan(_3416);
        bool _3422 = _3418 || _3420;
        bool _3424 = isnan(0.001000000047497451305389404296875);
        bool _3426 = _3422 || _3424;
        bool _3428 = _3416 > 0.0;
        bool _3430 = !_3426;
        bool _3432 = _3428 && _3430;
        bool _3434 = _3290 < 0.001000000047497451305389404296875;
        bool _3436 = _3434 && _3432;
        if (!_3436)
        {
            _326 = as_type<int>(_3246);
        }
        int _3438 = _326;
        int _3440 = _3438;
        if (_3436)
        {
            float _3442 = _3274 * _3232;
            _3440 = as_type<int>(_3442);
        }
        int _3444 = _3440;
        _332 = _3444;
        if (!_3436)
        {
            _328 = as_type<int>(_3250);
        }
        int _3446 = _328;
        int _3448 = _3446;
        if (_3436)
        {
            float _3450 = _3274 * _3234;
            _3448 = as_type<int>(_3450);
        }
        int _3452 = _3448;
        _334 = _3452;
        if (!_3436)
        {
            _330 = as_type<int>(_3256);
        }
        int _3454 = _330;
        _336 = _3454;
        if (_3436)
        {
            float _3456 = _3274 * _3236;
            _336 = as_type<int>(_3456);
        }
    }
    _3312 = false;
    int _3458 = _332;
    int _3460 = _334;
    int _3462 = _336;
    uint _3464 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3464)] = uint(_3458);
    uint _3466 = uint(int(uint(_3238) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3466)] = uint(_3460);
    uint _3468 = uint(int(uint(_3240) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3468)] = uint(_3462);
}

