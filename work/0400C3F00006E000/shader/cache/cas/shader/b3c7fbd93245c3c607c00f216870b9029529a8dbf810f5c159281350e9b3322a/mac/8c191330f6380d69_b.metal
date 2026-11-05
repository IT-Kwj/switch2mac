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
    constant _16* cp_c0 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    device _21* cp_s1 [[id(2)]];
    device _21* cp_s2 [[id(3)]];
    device _21* cp_s3 [[id(4)]];
    device _21* cp_s4 [[id(5)]];
    device _21* cp_s5 [[id(6)]];
    device _21* cp_s6 [[id(7)]];
    device _21* cp_s7 [[id(8)]];
    device _21* cp_s8 [[id(9)]];
    device _21* cp_s9 [[id(10)]];
    device _21* cp_s10 [[id(11)]];
    device _21* cp_s11 [[id(12)]];
    device _21* cp_s12 [[id(13)]];
    texture2d<float> cp_t_tcb_2A [[id(14)]];
    sampler cp_t_tcb_2ASmplr [[id(15)]];
    sampler cp_t_tcb_2ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1846 = false;
    bool _814 = false;
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
    uint _204 = uint(int(uint(_164) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_204)]);
    int _208 = _164 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_210)]);
    int _214 = _164 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    float _220 = 0.0;
    float _222 = 0.0;
    float _224 = 0.0;
    float _226 = _162;
    if (_184)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _220 = _228;
        _222 = _230;
        _224 = _232;
    }
    float _234 = _220;
    float _236 = _222;
    float _238 = _224;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_184)
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
    float _258 = as_type<float>(_152);
    float _260 = _154;
    float _262 = _156;
    if (_184)
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
    uint _276 = uint(int(uint(_164) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    uint _280 = uint(int(uint(_186) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_280)]);
    uint _284 = uint(int(uint(_186) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_284)]);
    float _288 = _254;
    float _290 = _252;
    float _292 = _256;
    float _294 = _236;
    float _296 = _234;
    float _298 = _238;
    float _300 = _272;
    float _302 = _270;
    float _304 = _274;
    float _306 = _282;
    float _308 = _196;
    float _310 = _202;
    int _312 = as_type<int>(_168);
    int _314 = as_type<int>(_206);
    int _316 = as_type<int>(_212);
    int _318 = as_type<int>(_218);
    int _320 = as_type<int>(_206);
    int _322 = as_type<int>(_212);
    int _324 = as_type<int>(_218);
    int _326 = as_type<int>(_206);
    int _328 = as_type<int>(_212);
    int _330 = as_type<int>(_218);
    if (!_184)
    {
        int _332 = _164 + 4;
        uint _334 = uint(int(uint(_164) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_334)]);
        int _338 = _164 + 8;
        uint _340 = uint(int(uint(_164) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_340)]);
        uint _344 = uint(int(uint(_332) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_344)]);
        uint _348 = uint(int(uint(_332) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_348)]);
        uint _352 = uint(int(uint(_338) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_352)]);
        uint _356 = uint(int(uint(_164) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_356)]);
        uint _360 = uint(int(uint(_338) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_360)]);
        uint _364 = uint(int(uint(_332) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_364)]);
        uint _368 = uint(int(uint(_338) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_368)]);
        float _372 = _336 * _336;
        float _374 = fma(_342, _342, _372);
        float _376 = _346 * _346;
        float _378 = fma(_350, _350, _376);
        float _380 = _354 * _354;
        float _382 = fma(_358, _358, _374);
        float _384 = fma(_362, _362, _380);
        float _386 = sqrt(_382);
        float _388 = fma(_366, _366, _378);
        float _390 = fma(_370, _370, _384);
        float _392 = sqrt(_388);
        float _394 = sqrt(_390);
        bool _396 = _386 > 0.0;
        bool _398 = _392 > 0.0;
        bool _400 = _394 > 0.0;
        float _402 = _392;
        float _404 = _394;
        float _406 = _384;
        float _408 = _336;
        float _410 = _386;
        float _412 = _342;
        float _414 = _378;
        float _416 = _346;
        float _418 = _366;
        float _420 = _358;
        if (_396)
        {
            float _422 = rsqrt(_382);
            _402 = _422;
        }
        float _424 = _402;
        float _426 = 0.0;
        if (_398)
        {
            float _428 = rsqrt(_388);
            _426 = _428;
        }
        float _430 = _426;
        float _432 = 0.0;
        if (_400)
        {
            float _434 = rsqrt(_390);
            _432 = _434;
        }
        float _436 = _432;
        if (!_396)
        {
            _404 = 0.0;
        }
        float _438 = _404;
        float _440 = _438;
        if (_396)
        {
            float _442 = _336 * _424;
            _440 = _442;
        }
        float _444 = _440;
        _290 = _444;
        if (!_396)
        {
            _406 = 0.0;
        }
        float _446 = _406;
        float _448 = _446;
        if (_396)
        {
            float _450 = _342 * _424;
            _448 = _450;
        }
        float _452 = _448;
        _296 = _452;
        if (!_396)
        {
            _408 = 0.0;
        }
        float _454 = _408;
        float _456 = _454;
        if (_396)
        {
            float _458 = _358 * _424;
            _456 = _458;
        }
        float _460 = _456;
        _302 = _460;
        if (!_398)
        {
            _410 = 0.0;
        }
        float _462 = _410;
        float _464 = _462;
        if (_398)
        {
            float _466 = _346 * _430;
            _464 = _466;
        }
        float _468 = _464;
        _288 = _468;
        if (!_398)
        {
            _412 = 0.0;
        }
        float _470 = _412;
        float _472 = _470;
        if (_398)
        {
            float _474 = _366 * _430;
            _472 = _474;
        }
        float _476 = _472;
        _300 = _476;
        if (!_398)
        {
            _414 = 0.0;
        }
        float _478 = _414;
        float _480 = _478;
        if (_398)
        {
            float _482 = _350 * _430;
            _480 = _482;
        }
        float _484 = _480;
        _294 = _484;
        if (!_400)
        {
            _416 = 0.0;
        }
        float _486 = _416;
        float _488 = _486;
        if (!_400)
        {
            _418 = 0.0;
        }
        float _490 = _418;
        float _492 = _490;
        if (_400)
        {
            float _494 = _354 * _436;
            _488 = _494;
        }
        float _496 = _488;
        _292 = _496;
        if (!_400)
        {
            _420 = 0.0;
        }
        float _498 = _420;
        _304 = _498;
        if (_400)
        {
            float _500 = _362 * _436;
            _492 = _500;
        }
        float _502 = _492;
        _298 = _502;
        if (_400)
        {
            float _504 = _370 * _436;
            _304 = _504;
        }
    }
    float _506 = _288;
    float _508 = _290;
    float _510 = _292;
    float _512 = _294;
    float _514 = _296;
    float _516 = _298;
    float _518 = _300;
    float _520 = _302;
    float _522 = _304;
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _554 = uint(int(uint(_186) >> uint(2)));
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_554)]);
    int _558 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x) + 336;
    bool _560 = _526 > 0.0;
    float _562 = abs(_524);
    float _564 = log2(_562);
    bool _566 = _528 > 0.0;
    float _568 = 0.0;
    float _570 = _526;
    float _572 = _544;
    float _574 = _530;
    bool _576 = _566;
    float _578 = _534;
    float _580 = _546;
    float _582 = _548;
    float _584 = _550;
    float _586 = _552;
    if (_560)
    {
        float _588 = 1.0 / _526;
        _568 = _588;
    }
    float _590 = _568;
    float _592 = _530 * _538;
    float _594 = _532 * _538;
    float _596 = _534 * _538;
    float _598 = -_286;
    float _600 = _540 + _598;
    float _602 = _542 * _564;
    float _604 = _594 * _506;
    float _606 = _594 * _508;
    float _608 = exp2(_602);
    float _610 = _594 * _510;
    float _612 = _544 * _528;
    if (_560)
    {
        float _614 = _600 * _590;
        _570 = _614;
    }
    float _616 = _570;
    float _618 = fma(_592, _512, _604);
    float _620 = fma(_592, _514, _606);
    float _622 = fma(_592, _516, _610);
    float _624 = _622;
    if (_566)
    {
        float _626 = -_612;
        float _628 = fma(_278, _626, _544);
        _572 = _628;
    }
    float _630 = _572;
    float _632 = _630;
    if (_560)
    {
        float _634 = precise::min(_616, 1.0);
        _574 = _634;
    }
    float _636 = _574;
    float _638 = fma(_596, _518, _618);
    float _640 = fma(_596, _520, _620);
    float _642 = fma(_596, _522, _622);
    float _644 = _636;
    float _646 = _640;
    if (_560)
    {
        float _648 = _636 * _630;
        _632 = _648;
    }
    float _650 = _632;
    float _652 = _542 * _638;
    float _654 = _282 * _542;
    float _656 = _542 * _640;
    float _658 = _542 * _642;
    float _660 = _542 * _650;
    float _662 = fma(_196, _608, _652);
    float _664 = fma(_190, _608, _656);
    float _666 = fma(_190, _654, _168);
    float _668 = fma(_196, _654, _174);
    float _670 = fma(_202, _654, _180);
    float _672 = fma(_202, _608, _658);
    float _674 = _546 * _660;
    float _676 = _548 * _660;
    float _678 = _550 * _660;
    bool _680 = !_184;
    float _682 = _660;
    float _684 = _658;
    float _686 = _656;
    float _808;
    float _810;
    float _812;
    if (!_680)
    {
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _706 = _692 * _694;
        float _708 = _692 * _696;
        float _710 = _690 * _694;
        float _712 = -_706;
        float _714 = fma(_688, _698, _712);
        float _716 = -_708;
        float _718 = fma(_690, _698, _716);
        float _720 = -_710;
        float _722 = fma(_688, _696, _720);
        float _724 = _702 * _688;
        float _726 = _702 * _714;
        float _728 = _704 * _690;
        float _730 = _700 * _696;
        float _732 = -_724;
        float _734 = fma(_700, _690, _732);
        float _736 = -_726;
        float _738 = fma(_700, _718, _736);
        float _740 = _702 * _698;
        float _742 = _704 * _694;
        float _744 = _700 * _692;
        float _746 = fma(_704, _722, _738);
        float _748 = -_740;
        float _750 = fma(_704, _696, _748);
        float _752 = -_742;
        float _754 = fma(_700, _698, _752);
        float _756 = -_730;
        float _758 = fma(_702, _694, _756);
        float _760 = -_744;
        float _762 = fma(_704, _688, _760);
        float _764 = -_688;
        float _766 = fma(_764, _698, _706);
        float _768 = 1.0 / _746;
        float _770 = -_728;
        float _772 = fma(_702, _692, _770);
        float _774 = _750 * _768;
        float _776 = _754 * _768;
        float _778 = _758 * _768;
        float _780 = _674 * _768;
        float _782 = _676 * _774;
        float _784 = _676 * _776;
        float _786 = _676 * _778;
        float _788 = _766 * _768;
        float _790 = _772 * _768;
        float _792 = _762 * _768;
        float _794 = _734 * _768;
        float _796 = fma(_718, _780, _782);
        float _798 = fma(_674, _788, _784);
        float _800 = fma(_722, _780, _786);
        float _802 = fma(_678, _790, _796);
        float _804 = fma(_678, _792, _798);
        float _806 = fma(_678, _794, _800);
        _644 = _800;
        _624 = _792;
        _578 = _734;
        _646 = _772;
        _226 = _722;
        _306 = _700;
        _682 = _702;
        _684 = _704;
        _308 = _790;
        _310 = _782;
        _686 = _796;
        _580 = _784;
        _582 = _794;
        _584 = _780;
        _586 = _706;
        _808 = _804;
        _810 = _802;
        _812 = _806;
        _814 = true;
    }
    else
    {
        int _816 = as_type<int>(_162) & 1024;
        bool _818 = _816 != 0;
        if (_818)
        {
            _576 = true;
        }
        bool _820 = _576;
        bool _822 = _820;
        if (!_818)
        {
            int _824 = as_type<int>(_162) & 2048;
            bool _826 = _824 != 0;
            _822 = _826;
        }
        bool _828 = _822;
        float _830 = 0.0;
        if (!_828)
        {
            _830 = _674;
        }
        float _832 = _830;
        float _834 = 0.0;
        _810 = _832;
        if (!_828)
        {
            _834 = _676;
        }
        float _836 = _834;
        float _838 = 0.0;
        _808 = _836;
        if (!_828)
        {
            _838 = _678;
        }
        float _840 = _838;
        bool _842 = !_828;
        _812 = _840;
        if (!_842)
        {
            uint _844 = uint(int(uint(_164) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_844)]);
            int _848 = _164 + 4;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            int _854 = _164 + 8;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_856)]);
            uint _860 = uint(int(uint(_164) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_860)]);
            int _864 = _164 + 4;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            int _870 = _164 + 8;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_872)]);
            uint _876 = uint(int(uint(_164) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_876)]);
            int _880 = _164 + 4;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_882)]);
            int _886 = _164 + 8;
            uint _888 = uint(int(uint(_886) >> uint(2)));
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_888)]);
            float _892 = _858 * _862;
            float _894 = _858 * _868;
            float _896 = _852 * _862;
            float _898 = -_892;
            float _900 = fma(_846, _874, _898);
            float _902 = -_894;
            float _904 = fma(_852, _874, _902);
            float _906 = -_896;
            float _908 = fma(_846, _868, _906);
            float _910 = _884 * _846;
            float _912 = _884 * _900;
            float _914 = _890 * _852;
            float _916 = _878 * _868;
            float _918 = -_910;
            float _920 = fma(_878, _852, _918);
            float _922 = -_912;
            float _924 = fma(_878, _904, _922);
            float _926 = _884 * _874;
            float _928 = _890 * _862;
            float _930 = _878 * _858;
            float _932 = fma(_890, _908, _924);
            float _934 = -_926;
            float _936 = fma(_890, _868, _934);
            float _938 = -_928;
            float _940 = fma(_878, _874, _938);
            float _942 = -_916;
            float _944 = fma(_884, _862, _942);
            float _946 = -_930;
            float _948 = fma(_890, _846, _946);
            float _950 = -_846;
            float _952 = fma(_950, _874, _892);
            float _954 = 1.0 / _932;
            float _956 = -_914;
            float _958 = fma(_884, _858, _956);
            float _960 = _936 * _954;
            float _962 = _940 * _954;
            float _964 = _944 * _954;
            float _966 = _674 * _954;
            float _968 = _676 * _960;
            float _970 = _676 * _962;
            float _972 = _676 * _964;
            float _974 = _952 * _954;
            float _976 = _958 * _954;
            float _978 = _948 * _954;
            float _980 = _920 * _954;
            float _982 = fma(_904, _966, _968);
            float _984 = fma(_674, _974, _970);
            float _986 = fma(_908, _966, _972);
            float _988 = fma(_678, _976, _982);
            float _990 = fma(_678, _978, _984);
            float _992 = fma(_678, _980, _986);
            _644 = _986;
            _624 = _978;
            _578 = _920;
            _646 = _958;
            _226 = _908;
            _306 = _878;
            _682 = _884;
            _684 = _890;
            _308 = _976;
            _310 = _968;
            _686 = _982;
            _580 = _970;
            _582 = _980;
            _584 = _966;
            _586 = _892;
            _808 = _990;
            _810 = _988;
            _812 = _992;
        }
    }
    _814 = false;
    float _994 = _644;
    float _996 = _624;
    float _998 = _578;
    float _1000 = _646;
    float _1002 = _226;
    float _1004 = _306;
    float _1006 = _682;
    float _1008 = _684;
    float _1010 = _308;
    float _1012 = _310;
    float _1014 = _686;
    float _1016 = _580;
    float _1018 = _582;
    float _1020 = _584;
    float _1022 = _586;
    float _1024 = _808;
    float _1026 = _810;
    float _1028 = _812;
    uint _1030 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1030)] = as_type<uint>(_556);
    float _1032 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1034 = as_type<int>(_1032) & 512;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>(_1032) & 1024;
    bool _1040 = _1038 != 0;
    int _1042 = as_type<int>(_1032) & 2048;
    bool _1044 = _1042 != 0;
    float _1046 = _676;
    float _1048 = 0.0;
    float _1050 = _590;
    float _1052 = 0.0;
    float _1054 = _1024;
    float _1056 = _1026;
    float _1058 = _1028;
    if (_1036)
    {
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1046 = _1060;
        _1048 = _1062;
        _1050 = _1064;
        _1052 = _1066;
    }
    float _1068 = _1046;
    float _1070 = _1048;
    float _1072 = _1050;
    float _1074 = _1052;
    float _1076 = _994;
    float _1078 = _996;
    float _1080 = _998;
    float _1082 = _536;
    if (_1036)
    {
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1076 = _1084;
        _1078 = _1086;
        _1080 = _1088;
        _1082 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _1082;
    float _1100 = _678;
    float _1102 = _674;
    float _1104 = _1000;
    float _1106 = _1002;
    if (_1040)
    {
        uint _1108 = uint(int(uint(_164) >> uint(2)));
        float _1110 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1108)]);
        int _1112 = _164 + 4;
        uint _1114 = uint(int(uint(_1112) >> uint(2)));
        float _1116 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1114)]);
        int _1118 = _164 + 8;
        uint _1120 = uint(int(uint(_1118) >> uint(2)));
        float _1122 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1120)]);
        int _1124 = _164 + 12;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        float _1128 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1126)]);
        _1100 = _1110;
        _1102 = _1116;
        _1104 = _1122;
        _1106 = _1128;
    }
    float _1130 = _1100;
    float _1132 = _1102;
    float _1134 = _1104;
    float _1136 = _1106;
    float _1138 = _1004;
    float _1140 = _1006;
    float _1142 = _1008;
    if (_1040)
    {
        uint _1144 = uint(int(uint(_164) >> uint(2)));
        float _1146 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1144)]);
        int _1148 = _164 + 4;
        uint _1150 = uint(int(uint(_1148) >> uint(2)));
        float _1152 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1150)]);
        int _1154 = _164 + 8;
        uint _1156 = uint(int(uint(_1154) >> uint(2)));
        float _1158 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1156)]);
        _1138 = _1146;
        _1140 = _1152;
        _1142 = _1158;
    }
    float _1160 = _1138;
    float _1162 = _1140;
    float _1164 = _1142;
    float _1166 = _1032;
    float _1168 = _1010;
    float _1170 = _1012;
    float _1172 = _1014;
    if (_1044)
    {
        uint _1174 = uint(int(uint(_164) >> uint(2)));
        float _1176 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1174)]);
        int _1178 = _164 + 4;
        uint _1180 = uint(int(uint(_1178) >> uint(2)));
        float _1182 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1180)]);
        int _1184 = _164 + 8;
        uint _1186 = uint(int(uint(_1184) >> uint(2)));
        float _1188 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1186)]);
        int _1190 = _164 + 12;
        uint _1192 = uint(int(uint(_1190) >> uint(2)));
        float _1194 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1192)]);
        _1166 = _1176;
        _1168 = _1182;
        _1170 = _1188;
        _1172 = _1194;
    }
    float _1196 = _1166;
    float _1198 = _1168;
    float _1200 = _1170;
    float _1202 = _1172;
    float _1204 = _1016;
    float _1206 = _1018;
    float _1208 = _1020;
    float _1210 = _1022;
    if (_1044)
    {
        uint _1212 = uint(int(uint(_164) >> uint(2)));
        float _1214 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1212)]);
        int _1216 = _164 + 4;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1218)]);
        int _1222 = _164 + 8;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1224)]);
        int _1228 = _164 + 12;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1230)]);
        _1204 = _1214;
        _1206 = _1220;
        _1208 = _1226;
        _1210 = _1232;
    }
    float _1234 = _1204;
    float _1236 = _1206;
    float _1238 = _1208;
    float _1240 = _1210;
    float _1242 = 0.0;
    if (_1040)
    {
        float _1244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1242 = _1244;
    }
    float _1246 = _1242;
    float _1248 = 0.0;
    if (_1040)
    {
        float _1250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1248 = _1250;
    }
    float _1252 = _1248;
    float _1254 = _668 + _1024;
    float _1256 = _666 + _1026;
    float _1258 = _670 + _1028;
    if (!_1036)
    {
        _1054 = 0.0;
    }
    float _1260 = _1054;
    float _1262 = _1068;
    float _1264 = _1260;
    if (_1036)
    {
        float _1266 = _1254 * _1070;
        _1056 = _1266;
    }
    float _1268 = _1056;
    if (_1036)
    {
        float _1270 = fma(_1256, _1068, _1268);
        _1262 = _1270;
    }
    float _1272 = _1262;
    float _1274 = _1272;
    float _1276 = _1092;
    float _1278 = _1162;
    float _1280 = _1130;
    float _1282 = _1136;
    float _1284 = _1134;
    float _1286 = _1236;
    float _1288 = _1164;
    float _1290 = _1160;
    float _1292 = _1196;
    float _1294 = _1198;
    float _1296 = _1234;
    float _1298 = _1200;
    float _1300 = _1240;
    if (_1036)
    {
        float _1302 = _1254 * _1094;
        _1058 = _1302;
    }
    float _1304 = _1058;
    if (_1036)
    {
        float _1306 = fma(_1258, _1072, _1272);
        _1274 = _1306;
    }
    float _1308 = _1274;
    float _1310 = _1308;
    if (_1036)
    {
        float _1312 = fma(_1256, _1092, _1304);
        _1276 = _1312;
    }
    float _1314 = _1276;
    float _1316 = _1314;
    if (_1036)
    {
        float _1318 = _1074 + _1308;
        _1264 = _1318;
    }
    float _1320 = _1264;
    if (_1040)
    {
        float _1322 = _1254 * _1132;
        _1310 = _1322;
    }
    float _1324 = _1310;
    if (_1040)
    {
        float _1326 = _1254 * _1162;
        _1278 = _1326;
    }
    float _1328 = _1278;
    float _1330 = _1328;
    if (_1036)
    {
        float _1332 = fma(_1258, _1096, _1314);
        _1316 = _1332;
    }
    float _1334 = _1316;
    if (_1040)
    {
        float _1336 = fma(_1256, _1130, _1324);
        _1280 = _1336;
    }
    float _1338 = _1280;
    float _1340 = _1338;
    if (_1040)
    {
        float _1342 = fma(_1256, _1160, _1328);
        _1330 = _1342;
    }
    float _1344 = _1330;
    float _1346 = _1344;
    if (!_1036)
    {
        _1282 = 0.0;
    }
    float _1348 = _1282;
    float _1350 = _1348;
    if (_1036)
    {
        float _1352 = _1098 + _1334;
        _1350 = _1352;
    }
    float _1354 = _1350;
    if (_1040)
    {
        float _1356 = fma(_1258, _1134, _1338);
        _1340 = _1356;
    }
    float _1358 = _1340;
    if (_1044)
    {
        float _1360 = _1254 * _1198;
        _1284 = _1360;
    }
    float _1362 = _1284;
    uint _1364 = as_type<uint>(_1362);
    if (_1044)
    {
        float _1366 = _1254 * _1236;
        _1286 = _1366;
    }
    float _1368 = _1286;
    float _1370 = _1368;
    if (_1040)
    {
        float _1372 = fma(_1258, _1164, _1344);
        _1288 = _1372;
    }
    float _1374 = _1288;
    float _1376 = _1374;
    if (!_1040)
    {
        _1290 = _1320;
    }
    float _1378 = _1290;
    float _1380 = _1378;
    if (_1044)
    {
        float _1382 = fma(_1256, _1196, _1362);
        _1292 = _1382;
    }
    float _1384 = _1292;
    float _1386 = _1384;
    if (_1044)
    {
        float _1388 = fma(_1256, _1234, _1368);
        _1346 = _1388;
    }
    float _1390 = _1346;
    if (!_1040)
    {
        _1294 = _1354;
    }
    float _1392 = _1294;
    float _1394 = _1392;
    if (_1040)
    {
        float _1396 = _1246 + _1358;
        _1380 = _1396;
    }
    float _1398 = _1380;
    if (_1040)
    {
        float _1400 = _1252 + _1374;
        _1394 = _1400;
    }
    float _1402 = _1394;
    if (_1044)
    {
        float _1404 = fma(_1258, _1200, _1384);
        _1386 = _1404;
    }
    float _1406 = _1386;
    if (_1044)
    {
        float _1408 = fma(_1258, _1238, _1390);
        _1296 = _1408;
    }
    float _1410 = _1296;
    float _1412 = 6.2500002968590706586837768554688e-05;
    if (!_1044)
    {
        _1370 = _1398;
    }
    float _1414 = _1370;
    float _1416 = _1414;
    if (_1044)
    {
        float _1418 = _1202 + _1406;
        _1416 = _1418;
    }
    float _1420 = _1416;
    float _1422 = _1420;
    if (!_1044)
    {
        _1298 = _1402;
    }
    float _1424 = _1298;
    float _1426 = _1424;
    if (_1044)
    {
        float _1428 = _1240 + _1410;
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = fma(_1420, 6.2500002968590706586837768554688e-05, 0.5);
    float _1434 = fma(_1430, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4075 = float2(_1432, _1434);
    float _1436 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4075, float2(0.0), isnan(_4075)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4075, float2(0.0), isnan(_4075)), level(0.0)).x;
    bool _1438 = _600 > 0.001000000047497451305389404296875;
    bool _1440 = isnan(_600);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(0.001000000047497451305389404296875);
    bool _1446 = _1442 || _1444;
    float _1448 = as_type<float>(_558);
    float _1450 = _1434;
    float _1452 = _1432;
    if (!_1446)
    {
        float _1454 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1448 = _1454;
    }
    float _1456 = _1448;
    if (!_1446)
    {
        float _1458 = fma(_1420, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1376 = _1458;
    }
    float _1460 = _1376;
    bool _1462 = _1436 != 0.0;
    bool _1464 = isnan(_1436);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan(0.0);
    bool _1470 = _1466 || _1468;
    float _1472 = _1460;
    if (!_1470)
    {
        _1300 = 4.0;
    }
    float _1474 = _1300;
    float _1476 = _1436;
    float _1478 = _1474;
    if (!_1470)
    {
        float2 _4143 = float2(_1432, _1434);
        float _1480 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4143, float2(0.0), isnan(_4143)), level(_1474)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4143, float2(0.0), isnan(_4143)), level(_1474)).x;
        _1476 = _1480;
    }
    float _1482 = _1476;
    float _1484 = _1358;
    if (!_1446)
    {
        float2 _4159 = float2(_1460, _1434);
        float _1486 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4159, float2(0.0), isnan(_4159)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4159, float2(0.0), isnan(_4159)), level(0.0)).x;
        _1484 = _1486;
    }
    float _1488 = _1484;
    if (!_1446)
    {
        int _1490 = _164 + 4;
        _1364 = uint(_1490);
    }
    uint _1492 = _1364;
    float _1494 = -_168;
    float _1496 = _1494 + _1256;
    float _1498 = -_174;
    float _1500 = _1498 + _1254;
    float _1502 = -_180;
    float _1504 = _1502 + _1258;
    float _1506 = _1482 * 2000.0;
    bool _1508 = _1506 != 0.0;
    bool _1510 = isnan(_1506);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan(0.0);
    bool _1516 = _1512 || _1514;
    float _1518 = _1506;
    if (!_1446)
    {
        float _1520 = _1506 + _1456;
        _1518 = _1520;
    }
    float _1522 = _1518;
    bool _1524 = _600 <= 0.001000000047497451305389404296875;
    bool _1526 = !_1516;
    bool _1528 = _1524 && _1526;
    float _1530 = _1522;
    if (!_1446)
    {
        uint _1532 = uint(int(uint(int(_1492)) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1532)] = as_type<uint>(_1522);
    }
    bool _1534 = !_1528;
    int _1536 = _1534 ? as_type<int>(_556) : 0;
    if (_1446)
    {
        _312 = _1536;
    }
    int _1538 = _312;
    int _1540 = _1538;
    if (!_1446)
    {
        float _1542 = fma(_1420, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _1544 = fma(_1430, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1546 = fma(_1430, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _1548 = _1488 != 0.0;
        bool _1550 = isnan(_1488);
        bool _1552 = _1548 || _1550;
        bool _1554 = isnan(0.0);
        bool _1556 = _1552 || _1554;
        float2 _4272 = float2(_1542, _1434);
        float _1558 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4272, float2(0.0), isnan(_4272)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4272, float2(0.0), isnan(_4272)), level(0.0)).x;
        float2 _4280 = float2(_1432, _1544);
        float _1560 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4280, float2(0.0), isnan(_4280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4280, float2(0.0), isnan(_4280)), level(0.0)).x;
        float2 _4288 = float2(_1432, _1546);
        float _1562 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4288, float2(0.0), isnan(_4288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4288, float2(0.0), isnan(_4288)), level(0.0)).x;
        float2 _4296 = float2(_1460, _1544);
        float _1564 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4296, float2(0.0), isnan(_4296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4296, float2(0.0), isnan(_4296)), level(0.0)).x;
        float2 _4304 = float2(_1460, _1546);
        float _1566 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4304, float2(0.0), isnan(_4304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4304, float2(0.0), isnan(_4304)), level(0.0)).x;
        float2 _4312 = float2(_1542, _1544);
        float _1568 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4312, float2(0.0), isnan(_4312)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4312, float2(0.0), isnan(_4312)), level(0.0)).x;
        float2 _4320 = float2(_1542, _1546);
        float _1570 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4320, float2(0.0), isnan(_4320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4320, float2(0.0), isnan(_4320)), level(0.0)).x;
        float _1572 = _1434;
        if (_1556)
        {
            _1530 = _1488;
        }
        float _1574 = _1530;
        if (!_1556)
        {
            _1422 = 4.0;
        }
        float _1576 = _1422;
        float _1578 = _1574;
        float _1580 = _1576;
        if (!_1556)
        {
            float2 _4344 = float2(_1460, _1434);
            float _1582 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4344, float2(0.0), isnan(_4344)), level(_1576)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4344, float2(0.0), isnan(_4344)), level(_1576)).x;
            _1578 = _1582;
        }
        float _1584 = _1578;
        bool _1586 = _1558 != 0.0;
        bool _1588 = isnan(_1558);
        bool _1590 = _1586 || _1588;
        bool _1592 = isnan(0.0);
        bool _1594 = _1590 || _1592;
        bool _1596 = _1562 != 0.0;
        bool _1598 = isnan(_1562);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan(0.0);
        bool _1604 = _1600 || _1602;
        bool _1606 = _1566 != 0.0;
        bool _1608 = isnan(_1566);
        bool _1610 = _1606 || _1608;
        bool _1612 = isnan(0.0);
        bool _1614 = _1610 || _1612;
        bool _1616 = _1570 != 0.0;
        bool _1618 = isnan(_1570);
        bool _1620 = _1616 || _1618;
        bool _1622 = isnan(0.0);
        bool _1624 = _1620 || _1622;
        bool _1626 = _1564 != 0.0;
        bool _1628 = isnan(_1564);
        bool _1630 = _1626 || _1628;
        bool _1632 = isnan(0.0);
        bool _1634 = _1630 || _1632;
        bool _1636 = _1568 != 0.0;
        bool _1638 = isnan(_1568);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan(0.0);
        bool _1644 = _1640 || _1642;
        bool _1646 = _1560 != 0.0;
        bool _1648 = isnan(_1560);
        bool _1650 = _1646 || _1648;
        bool _1652 = isnan(0.0);
        bool _1654 = _1650 || _1652;
        float _1656 = _1558;
        if (!_1594)
        {
            _1580 = 4.0;
        }
        float _1658 = _1580;
        if (!_1604)
        {
            _1478 = 4.0;
        }
        float _1660 = _1478;
        if (!_1614)
        {
            _1450 = 4.0;
        }
        float _1662 = _1450;
        if (!_1624)
        {
            _1572 = 4.0;
        }
        float _1664 = _1572;
        if (!_1594)
        {
            float2 _4457 = float2(_1542, _1434);
            float _1666 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4457, float2(0.0), isnan(_4457)), level(_1658)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4457, float2(0.0), isnan(_4457)), level(_1658)).x;
            _1656 = _1666;
        }
        float _1668 = _1656;
        float _1670 = _1566;
        if (!_1614)
        {
            float2 _4473 = float2(_1460, _1546);
            float _1672 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4473, float2(0.0), isnan(_4473)), level(_1662)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4473, float2(0.0), isnan(_4473)), level(_1662)).x;
            _1670 = _1672;
        }
        float _1674 = _1670;
        if (!_1634)
        {
            _1452 = 4.0;
        }
        float _1676 = _1452;
        if (!_1644)
        {
            _1472 = 4.0;
        }
        float _1678 = _1472;
        float _1680 = _1570;
        if (!_1624)
        {
            float2 _4499 = float2(_1542, _1546);
            float _1682 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4499, float2(0.0), isnan(_4499)), level(_1664)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4499, float2(0.0), isnan(_4499)), level(_1664)).x;
            _1680 = _1682;
        }
        float _1684 = _1680;
        float _1686 = _1564;
        if (!_1634)
        {
            float2 _4515 = float2(_1460, _1544);
            float _1688 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4515, float2(0.0), isnan(_4515)), level(_1676)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4515, float2(0.0), isnan(_4515)), level(_1676)).x;
            _1686 = _1688;
        }
        float _1690 = _1686;
        if (!_1654)
        {
            _1412 = 4.0;
        }
        float _1692 = _1412;
        float _1694 = _1568;
        if (!_1644)
        {
            float2 _4536 = float2(_1542, _1544);
            float _1696 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4536, float2(0.0), isnan(_4536)), level(_1678)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4536, float2(0.0), isnan(_4536)), level(_1678)).x;
            _1694 = _1696;
        }
        float _1698 = _1694;
        float _1700 = _1562;
        if (!_1604)
        {
            float2 _4552 = float2(_1432, _1546);
            float _1702 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4552, float2(0.0), isnan(_4552)), level(_1660)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4552, float2(0.0), isnan(_4552)), level(_1660)).x;
            _1700 = _1702;
        }
        float _1704 = _1700;
        float _1706 = _1560;
        if (!_1654)
        {
            float2 _4568 = float2(_1432, _1544);
            float _1708 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4568, float2(0.0), isnan(_4568)), level(_1692)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4568, float2(0.0), isnan(_4568)), level(_1692)).x;
            _1706 = _1708;
        }
        float _1710 = _1706;
        float _1712 = -_1584;
        float _1714 = _1482 + _1712;
        float _1716 = -_1674;
        float _1718 = _1482 + _1716;
        float _1720 = -_1668;
        float _1722 = _1482 + _1720;
        float _1724 = -_1684;
        float _1726 = _1482 + _1724;
        float _1728 = -_1690;
        float _1730 = _1482 + _1728;
        float _1732 = abs(_1714);
        float _1734 = abs(_1722);
        float _1736 = precise::max(_1732, _1734);
        float _1738 = -_1698;
        float _1740 = _1482 + _1738;
        float _1742 = -_1704;
        float _1744 = _1482 + _1742;
        float _1746 = -_1710;
        float _1748 = _1482 + _1746;
        float _1750 = abs(_1730);
        float _1752 = abs(_1718);
        float _1754 = precise::max(_1750, _1752);
        float _1756 = abs(_1740);
        float _1758 = abs(_1726);
        float _1760 = precise::max(_1756, _1758);
        float _1762 = abs(_1748);
        float _1764 = abs(_1744);
        float _1766 = precise::max(_1762, _1764);
        float _1768 = precise::max(_1754, _1760);
        float _1770 = precise::max(_1736, _1766);
        bool _1772 = _1768 > 0.00150000001303851604461669921875;
        bool _1774 = _1770 > 0.00150000001303851604461669921875;
        bool _1776 = _1774 || _1772;
        bool _1778 = !_1776;
        int _1780 = _1778 ? _1536 : 0;
        _1540 = _1780;
    }
    int _1782 = _1540;
    int _1784 = _164 + 4;
    int _1786 = _164 + 8;
    uint _1788 = uint(int(uint(_186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1788)] = uint(_1782);
    uint _1790 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1790)] = as_type<uint>(_1256);
    uint _1792 = uint(int(uint(_1784) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1792)] = as_type<uint>(_1254);
    uint _1794 = uint(int(uint(_1786) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1794)] = as_type<uint>(_1258);
    uint _1796 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1796)] = as_type<uint>(_664);
    uint _1798 = uint(int(uint(_1784) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1798)] = as_type<uint>(_662);
    uint _1800 = uint(int(uint(_1786) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1800)] = as_type<uint>(_672);
    uint _1802 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1802)] = as_type<uint>(_1496);
    uint _1804 = uint(int(uint(_1784) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1804)] = as_type<uint>(_1500);
    uint _1806 = uint(int(uint(_1786) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1806)] = as_type<uint>(_1504);
    float _1808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1810 = _1500 * _1500;
    float _1812 = _662 * _662;
    float _1814 = fma(_1496, _1496, _1810);
    float _1816 = fma(_664, _664, _1812);
    float _1818 = fma(_1504, _1504, _1814);
    float _1820 = fma(_672, _672, _1816);
    float _1822 = sqrt(_1820);
    float _1824 = sqrt(_1818);
    bool _1826 = _1824 >= 9.9999999747524270787835121154785e-07;
    bool _1828 = isnan(_1824);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(9.9999999747524270787835121154785e-07);
    bool _1834 = _1830 || _1832;
    if (!_1834)
    {
        bool _1836 = _540 != _286;
        bool _1838 = isnan(_540);
        bool _1840 = _1836 || _1838;
        bool _1842 = isnan(_286);
        bool _1844 = _1840 || _1842;
        _1846 = _1844;
        if (!_1846)
        {
            float _1848 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1850 = _1848 > 0.0;
            bool _1852 = !_1850;
            if (!_1852)
            {
                float _1854 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1856 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1858 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1860 = _1856 * _506;
                float _1862 = _1856 * _508;
                float _1864 = _1856 * _510;
                float _1866 = fma(_1854, _512, _1860);
                float _1868 = fma(_1854, _514, _1862);
                float _1870 = fma(_1854, _516, _1864);
                float _1872 = fma(_1858, _518, _1866);
                float _1874 = fma(_1858, _520, _1868);
                float _1876 = fma(_1858, _522, _1870);
                float _1878 = _1872 * _1872;
                float _1880 = fma(_1874, _1874, _1878);
                float _1882 = fma(_1876, _1876, _1880);
                float _1884 = rsqrt(_1882);
                float _1886 = _1884 * 9.9999999747524270787835121154785e-07;
                float _1888 = _1874 * _1886;
                float _1890 = _1872 * _1886;
                float _1892 = _1876 * _1886;
                _326 = as_type<int>(_1888);
                _328 = as_type<int>(_1890);
                _330 = as_type<int>(_1892);
                _1846 = true;
            }
            else
            {
                bool _1894 = _1822 >= 9.9999999747524270787835121154785e-07;
                bool _1896 = isnan(_1822);
                bool _1898 = _1894 || _1896;
                bool _1900 = isnan(9.9999999747524270787835121154785e-07);
                bool _1902 = _1898 || _1900;
                if (!_1902)
                {
                    float _1904 = _1254 * _1254;
                    float _1906 = fma(_1256, _1256, _1904);
                    float _1908 = fma(_1258, _1258, _1906);
                    float _1910 = sqrt(_1908);
                    bool _1912 = _1910 >= 9.9999999747524270787835121154785e-07;
                    bool _1914 = isnan(_1910);
                    bool _1916 = _1912 || _1914;
                    bool _1918 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1920 = _1916 || _1918;
                    float _1922 = _1910;
                    if (_1920)
                    {
                        float _1924 = rsqrt(_1908);
                        _1922 = _1924;
                    }
                    float _1926 = _1922;
                    if (!_1920)
                    {
                        _314 = 0;
                    }
                    int _1928 = _314;
                    int _1930 = _1928;
                    if (!_1920)
                    {
                        _316 = 897988541;
                    }
                    int _1932 = _316;
                    int _1934 = _1932;
                    if (!_1920)
                    {
                        _318 = 0;
                    }
                    int _1936 = _318;
                    float _1938 = _1926;
                    int _1940 = _1936;
                    if (_1920)
                    {
                        float _1942 = _1926 * 9.9999999747524270787835121154785e-07;
                        _1938 = _1942;
                    }
                    float _1944 = _1938;
                    if (_1920)
                    {
                        float _1946 = _1256 * _1944;
                        _1930 = as_type<int>(_1946);
                    }
                    int _1948 = _1930;
                    _326 = _1948;
                    if (_1920)
                    {
                        float _1950 = _1254 * _1944;
                        _1934 = as_type<int>(_1950);
                    }
                    int _1952 = _1934;
                    _328 = _1952;
                    if (_1920)
                    {
                        float _1954 = _1258 * _1944;
                        _1940 = as_type<int>(_1954);
                    }
                    int _1956 = _1940;
                    _330 = _1956;
                    _1846 = true;
                }
                else
                {
                    float _1958 = rsqrt(_1820);
                    float _1960 = _1958 * 9.9999999747524270787835121154785e-07;
                    float _1962 = _664 * _1960;
                    float _1964 = _662 * _1960;
                    float _1966 = _672 * _1960;
                    _326 = as_type<int>(_1962);
                    _328 = as_type<int>(_1964);
                    _330 = as_type<int>(_1966);
                    _1846 = true;
                }
            }
        }
    }
    else
    {
        float _1968 = _1822 * _1808;
        bool _1970 = _1968 >= 0.001000000047497451305389404296875;
        bool _1972 = isnan(_1968);
        bool _1974 = _1970 || _1972;
        bool _1976 = isnan(0.001000000047497451305389404296875);
        bool _1978 = _1974 || _1976;
        bool _1980 = _1968 > 0.0;
        bool _1982 = !_1978;
        bool _1984 = _1980 && _1982;
        bool _1986 = _1824 < 0.001000000047497451305389404296875;
        bool _1988 = _1986 && _1984;
        if (!_1988)
        {
            _320 = as_type<int>(_1496);
        }
        int _1990 = _320;
        int _1992 = _1990;
        if (_1988)
        {
            float _1994 = _664 * _1808;
            _1992 = as_type<int>(_1994);
        }
        int _1996 = _1992;
        _326 = _1996;
        if (!_1988)
        {
            _322 = as_type<int>(_1500);
        }
        int _1998 = _322;
        int _2000 = _1998;
        if (_1988)
        {
            float _2002 = _662 * _1808;
            _2000 = as_type<int>(_2002);
        }
        int _2004 = _2000;
        _328 = _2004;
        if (!_1988)
        {
            _324 = as_type<int>(_1504);
        }
        int _2006 = _324;
        _330 = _2006;
        if (_1988)
        {
            float _2008 = _672 * _1808;
            _330 = as_type<int>(_2008);
        }
    }
    _1846 = false;
    int _2010 = _326;
    int _2012 = _328;
    int _2014 = _330;
    uint _2016 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2016)] = uint(_2010);
    uint _2018 = uint(int(uint(_1784) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2018)] = uint(_2012);
    uint _2020 = uint(int(uint(_1786) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2020)] = uint(_2014);
}

