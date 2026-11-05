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
    bool _1608 = false;
    bool _814 = false;
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
    bool _228 = _186;
    float _230 = _164;
    if (_186)
    {
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _222 = _232;
        _224 = _234;
        _226 = _236;
    }
    float _238 = _222;
    float _240 = _224;
    float _242 = _226;
    float _244 = 0.0;
    float _246 = 0.0;
    float _248 = 0.0;
    if (_186)
    {
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _244 = _250;
        _246 = _252;
        _248 = _254;
    }
    float _256 = _244;
    float _258 = _246;
    float _260 = _248;
    float _262 = as_type<float>(_154);
    float _264 = _156;
    float _266 = _158;
    if (_186)
    {
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _262 = _268;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _262;
    float _276 = _264;
    float _278 = _266;
    uint _280 = uint(int(uint(_166) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_280)]);
    uint _284 = uint(int(uint(_188) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_284)]);
    uint _288 = uint(int(uint(_188) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_288)]);
    float _292 = _256;
    float _294 = _258;
    float _296 = _260;
    float _298 = _238;
    float _300 = _240;
    float _302 = _242;
    float _304 = _274;
    float _306 = _276;
    float _308 = _278;
    float _310 = _192;
    float _312 = _198;
    float _314 = _204;
    int _316 = as_type<int>(_208);
    int _318 = as_type<int>(_214);
    int _320 = as_type<int>(_220);
    int _322 = as_type<int>(_208);
    int _324 = as_type<int>(_214);
    int _326 = as_type<int>(_220);
    int _328 = as_type<int>(_208);
    int _330 = as_type<int>(_214);
    int _332 = as_type<int>(_220);
    if (!_186)
    {
        int _334 = _166 + 4;
        uint _336 = uint(int(uint(_166) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_336)]);
        int _340 = _166 + 8;
        uint _342 = uint(int(uint(_166) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_342)]);
        uint _346 = uint(int(uint(_334) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_334) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_340) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_166) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_358)]);
        uint _362 = uint(int(uint(_340) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        uint _366 = uint(int(uint(_334) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        uint _370 = uint(int(uint(_340) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        float _374 = _338 * _338;
        float _376 = fma(_344, _344, _374);
        float _378 = _348 * _348;
        float _380 = fma(_352, _352, _378);
        float _382 = _356 * _356;
        float _384 = fma(_360, _360, _376);
        float _386 = fma(_364, _364, _382);
        float _388 = sqrt(_384);
        float _390 = fma(_368, _368, _380);
        float _392 = fma(_372, _372, _386);
        float _394 = sqrt(_390);
        float _396 = sqrt(_392);
        bool _398 = _388 > 0.0;
        bool _400 = _394 > 0.0;
        bool _402 = _396 > 0.0;
        float _404 = _394;
        float _406 = _396;
        float _408 = _386;
        float _410 = _338;
        float _412 = _388;
        float _414 = _344;
        float _416 = _380;
        float _418 = _348;
        float _420 = _368;
        float _422 = _360;
        if (_398)
        {
            float _424 = rsqrt(_384);
            _404 = _424;
        }
        float _426 = _404;
        float _428 = 0.0;
        if (_400)
        {
            float _430 = rsqrt(_390);
            _428 = _430;
        }
        float _432 = _428;
        float _434 = 0.0;
        if (_402)
        {
            float _436 = rsqrt(_392);
            _434 = _436;
        }
        float _438 = _434;
        if (!_398)
        {
            _406 = 0.0;
        }
        float _440 = _406;
        float _442 = _440;
        if (_398)
        {
            float _444 = _338 * _426;
            _442 = _444;
        }
        float _446 = _442;
        _292 = _446;
        if (!_398)
        {
            _408 = 0.0;
        }
        float _448 = _408;
        float _450 = _448;
        if (_398)
        {
            float _452 = _344 * _426;
            _450 = _452;
        }
        float _454 = _450;
        _298 = _454;
        if (!_398)
        {
            _410 = 0.0;
        }
        float _456 = _410;
        float _458 = _456;
        if (_398)
        {
            float _460 = _360 * _426;
            _458 = _460;
        }
        float _462 = _458;
        _304 = _462;
        if (!_400)
        {
            _412 = 0.0;
        }
        float _464 = _412;
        float _466 = _464;
        if (_400)
        {
            float _468 = _348 * _432;
            _466 = _468;
        }
        float _470 = _466;
        _294 = _470;
        if (!_400)
        {
            _414 = 0.0;
        }
        float _472 = _414;
        float _474 = _472;
        if (_400)
        {
            float _476 = _368 * _432;
            _474 = _476;
        }
        float _478 = _474;
        _306 = _478;
        if (!_400)
        {
            _416 = 0.0;
        }
        float _480 = _416;
        float _482 = _480;
        if (_400)
        {
            float _484 = _352 * _432;
            _482 = _484;
        }
        float _486 = _482;
        _300 = _486;
        if (!_402)
        {
            _418 = 0.0;
        }
        float _488 = _418;
        float _490 = _488;
        if (!_402)
        {
            _420 = 0.0;
        }
        float _492 = _420;
        float _494 = _492;
        if (_402)
        {
            float _496 = _356 * _438;
            _490 = _496;
        }
        float _498 = _490;
        _296 = _498;
        if (!_402)
        {
            _422 = 0.0;
        }
        float _500 = _422;
        _308 = _500;
        if (_402)
        {
            float _502 = _364 * _438;
            _494 = _502;
        }
        float _504 = _494;
        _302 = _504;
        if (_402)
        {
            float _506 = _372 * _438;
            _308 = _506;
        }
    }
    float _508 = _292;
    float _510 = _294;
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _554 = uint(int(uint(_188) >> uint(2)));
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_554)]);
    bool _558 = _528 > 0.0;
    float _560 = abs(_526);
    float _562 = log2(_560);
    bool _564 = _530 > 0.0;
    float _566 = 0.0;
    float _568 = _544;
    float _570 = _538;
    float _572 = _546;
    float _574 = _548;
    float _576 = _550;
    float _578 = _552;
    float _580 = _532;
    if (_558)
    {
        float _582 = 1.0 / _528;
        _566 = _582;
    }
    float _584 = _566;
    float _586 = _534 * _540;
    float _588 = _532 * _562;
    float _590 = _536 * _540;
    float _592 = _538 * _540;
    float _594 = -_290;
    float _596 = _542 + _594;
    float _598 = _590 * _508;
    float _600 = exp2(_588);
    float _602 = _590 * _510;
    float _604 = _544 * _530;
    float _606 = _590 * _512;
    float _608 = _562;
    float _610 = _596;
    if (_558)
    {
        float _612 = _596 * _584;
        _608 = _612;
    }
    float _614 = _608;
    float _616 = fma(_586, _514, _598);
    float _618 = fma(_586, _516, _602);
    float _620 = _616;
    if (_564)
    {
        float _622 = -_604;
        float _624 = fma(_282, _622, _544);
        _568 = _624;
    }
    float _626 = _568;
    float _628 = _626;
    if (_558)
    {
        float _630 = precise::min(_614, 1.0);
        _570 = _630;
    }
    float _632 = _570;
    float _634 = fma(_586, _518, _606);
    float _636 = fma(_592, _520, _616);
    float _638 = fma(_592, _522, _618);
    float _640 = _638;
    if (_558)
    {
        float _642 = _632 * _626;
        _628 = _642;
    }
    float _644 = _628;
    float _646 = fma(_592, _524, _634);
    float _648 = _532 * _636;
    float _650 = _532 * _638;
    float _652 = _286 * _532;
    float _654 = _532 * _644;
    float _656 = _532 * _646;
    float _658 = fma(_192, _600, _648);
    float _660 = fma(_198, _600, _650);
    float _662 = fma(_192, _652, _170);
    float _664 = fma(_198, _652, _176);
    float _666 = _546 * _654;
    float _668 = _548 * _654;
    float _670 = fma(_204, _652, _182);
    float _672 = fma(_204, _600, _656);
    float _674 = _550 * _654;
    bool _676 = !_186;
    float _678 = _656;
    float _680 = _666;
    float _682 = _674;
    float _684 = _664;
    int _686 = as_type<int>(_556);
    float _688 = _660;
    float _810;
    float _812;
    if (!_676)
    {
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _708 = _694 * _696;
        float _710 = _694 * _698;
        float _712 = _692 * _696;
        float _714 = -_708;
        float _716 = fma(_690, _700, _714);
        float _718 = -_710;
        float _720 = fma(_692, _700, _718);
        float _722 = -_712;
        float _724 = fma(_690, _698, _722);
        float _726 = _704 * _690;
        float _728 = _704 * _716;
        float _730 = _706 * _692;
        float _732 = _702 * _698;
        float _734 = -_726;
        float _736 = fma(_702, _692, _734);
        float _738 = -_728;
        float _740 = fma(_702, _720, _738);
        float _742 = _704 * _700;
        float _744 = _706 * _696;
        float _746 = _702 * _694;
        float _748 = fma(_706, _724, _740);
        float _750 = -_742;
        float _752 = fma(_706, _698, _750);
        float _754 = -_744;
        float _756 = fma(_702, _700, _754);
        float _758 = -_732;
        float _760 = fma(_704, _696, _758);
        float _762 = -_746;
        float _764 = fma(_706, _690, _762);
        float _766 = -_690;
        float _768 = fma(_766, _700, _708);
        float _770 = 1.0 / _748;
        float _772 = -_730;
        float _774 = fma(_704, _694, _772);
        float _776 = _752 * _770;
        float _778 = _756 * _770;
        float _780 = _760 * _770;
        float _782 = _666 * _770;
        float _784 = _668 * _776;
        float _786 = _668 * _778;
        float _788 = _768 * _770;
        float _790 = _668 * _780;
        float _792 = _774 * _770;
        float _794 = _764 * _770;
        float _796 = fma(_720, _782, _784);
        float _798 = fma(_666, _788, _786);
        float _800 = _736 * _770;
        float _802 = fma(_724, _782, _790);
        float _804 = fma(_674, _792, _796);
        float _806 = fma(_674, _794, _798);
        float _808 = fma(_674, _800, _802);
        _572 = _782;
        _574 = _698;
        _576 = _700;
        _578 = _708;
        _310 = _794;
        _312 = _798;
        _314 = _796;
        _640 = _802;
        _580 = _702;
        _230 = _704;
        _620 = _706;
        _810 = _770;
        _812 = _806;
        _680 = _804;
        _682 = _808;
        _814 = true;
    }
    else
    {
        int _816 = as_type<int>(_164) & 1024;
        bool _818 = _816 != 0;
        if (_818)
        {
            _228 = true;
        }
        bool _820 = _228;
        bool _822 = _820;
        if (!_818)
        {
            int _824 = as_type<int>(_164) & 2048;
            bool _826 = _824 != 0;
            _822 = _826;
        }
        bool _828 = _822;
        if (!_828)
        {
            _678 = _668;
        }
        float _830 = _678;
        bool _832 = !_828;
        _810 = 0.0;
        _812 = _830;
        if (!_832)
        {
            uint _834 = uint(int(uint(_166) >> uint(2)));
            float _836 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_834)]);
            int _838 = _166 + 4;
            uint _840 = uint(int(uint(_838) >> uint(2)));
            float _842 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_840)]);
            int _844 = _166 + 8;
            uint _846 = uint(int(uint(_844) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_846)]);
            uint _850 = uint(int(uint(_166) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_850)]);
            int _854 = _166 + 4;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_856)]);
            int _860 = _166 + 8;
            uint _862 = uint(int(uint(_860) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_862)]);
            uint _866 = uint(int(uint(_166) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_866)]);
            int _870 = _166 + 4;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_872)]);
            int _876 = _166 + 8;
            uint _878 = uint(int(uint(_876) >> uint(2)));
            float _880 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_878)]);
            float _882 = _848 * _852;
            float _884 = _848 * _858;
            float _886 = _842 * _852;
            float _888 = -_882;
            float _890 = fma(_836, _864, _888);
            float _892 = -_884;
            float _894 = fma(_842, _864, _892);
            float _896 = -_886;
            float _898 = fma(_836, _858, _896);
            float _900 = _874 * _836;
            float _902 = _874 * _890;
            float _904 = _880 * _842;
            float _906 = _868 * _858;
            float _908 = -_900;
            float _910 = fma(_868, _842, _908);
            float _912 = -_902;
            float _914 = fma(_868, _894, _912);
            float _916 = _874 * _864;
            float _918 = _880 * _852;
            float _920 = _868 * _848;
            float _922 = fma(_880, _898, _914);
            float _924 = -_916;
            float _926 = fma(_880, _858, _924);
            float _928 = -_918;
            float _930 = fma(_868, _864, _928);
            float _932 = -_906;
            float _934 = fma(_874, _852, _932);
            float _936 = -_920;
            float _938 = fma(_880, _836, _936);
            float _940 = -_836;
            float _942 = fma(_940, _864, _882);
            float _944 = 1.0 / _922;
            float _946 = -_904;
            float _948 = fma(_874, _848, _946);
            float _950 = _926 * _944;
            float _952 = _930 * _944;
            float _954 = _934 * _944;
            float _956 = _666 * _944;
            float _958 = _668 * _950;
            float _960 = _668 * _952;
            float _962 = _942 * _944;
            float _964 = _668 * _954;
            float _966 = _948 * _944;
            float _968 = _938 * _944;
            float _970 = fma(_894, _956, _958);
            float _972 = fma(_666, _962, _960);
            float _974 = _910 * _944;
            float _976 = fma(_898, _956, _964);
            float _978 = fma(_674, _966, _970);
            float _980 = fma(_674, _968, _972);
            float _982 = fma(_674, _974, _976);
            _572 = _956;
            _574 = _858;
            _576 = _864;
            _578 = _882;
            _310 = _968;
            _312 = _972;
            _314 = _970;
            _640 = _976;
            _580 = _868;
            _230 = _874;
            _620 = _880;
            _810 = _944;
            _812 = _980;
            _680 = _978;
            _682 = _982;
        }
    }
    _814 = false;
    float _984 = _572;
    float _986 = _574;
    float _988 = _576;
    float _990 = _578;
    float _992 = _310;
    float _994 = _312;
    float _996 = _314;
    float _998 = _640;
    float _1000 = _580;
    float _1002 = _230;
    float _1004 = _620;
    float _1006 = _810;
    float _1008 = _812;
    float _1010 = _680;
    float _1012 = _682;
    uint _1014 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1014)] = as_type<uint>(_556);
    float _1016 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1018 = as_type<int>(_1016) & 512;
    bool _1020 = _1018 != 0;
    int _1022 = as_type<int>(_1016) & 1024;
    bool _1024 = _1022 != 0;
    float _1026 = _984;
    float _1028 = _986;
    float _1030 = _988;
    float _1032 = _990;
    bool _1034 = _1024;
    if (_1020)
    {
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1026 = _1036;
        _1028 = _1038;
        _1030 = _1040;
        _1032 = _1042;
    }
    float _1044 = _1026;
    float _1046 = _1028;
    float _1048 = _1030;
    float _1050 = _1032;
    float _1052 = _992;
    float _1054 = _994;
    float _1056 = _996;
    float _1058 = _998;
    if (_1020)
    {
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1052 = _1060;
        _1054 = _1062;
        _1056 = _1064;
        _1058 = _1066;
    }
    float _1068 = _1052;
    float _1070 = _1054;
    float _1072 = _1056;
    float _1074 = _1058;
    float _1076 = _1000;
    float _1078 = _1002;
    float _1080 = _1004;
    float _1082 = _1006;
    if (_1020)
    {
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1076 = _1084;
        _1078 = _1086;
        _1080 = _1088;
        _1082 = _1090;
    }
    float _1092 = _1076;
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _1082;
    float _1100 = _664 + _1008;
    float _1102 = _662 + _1010;
    float _1104 = _670 + _1012;
    int _1106 = as_type<int>(_1016) & 2048;
    bool _1108 = _1106 != 0;
    float _1110 = _1044;
    float _1112 = _1048;
    float _1114 = _1046;
    if (_1020)
    {
        float _1116 = _1100 * _1046;
        _684 = _1116;
    }
    float _1118 = _684;
    float _1120 = _1070;
    float _1122 = _1118;
    float _1124 = _1094;
    float _1126 = _1072;
    float _1128 = _1096;
    float _1130 = _1068;
    float _1132 = _1074;
    if (_1020)
    {
        float _1134 = _1100 * _1070;
        _1120 = _1134;
    }
    float _1136 = _1120;
    float _1138 = _1136;
    if (_1020)
    {
        float _1140 = fma(_1102, _1044, _1118);
        _1110 = _1140;
    }
    float _1142 = _1110;
    float _1144 = _1142;
    if (_1020)
    {
        float _1146 = fma(_1102, _1068, _1136);
        _1122 = _1146;
    }
    float _1148 = _1122;
    if (_1020)
    {
        float _1150 = _1100 * _1094;
        _1124 = _1150;
    }
    float _1152 = _1124;
    float _1154 = _1152;
    if (_1020)
    {
        float _1156 = fma(_1104, _1048, _1142);
        _1112 = _1156;
    }
    float _1158 = _1112;
    if (_1020)
    {
        float _1160 = fma(_1104, _1072, _1148);
        _1126 = _1160;
    }
    float _1162 = _1126;
    if (_1020)
    {
        float _1164 = fma(_1102, _1092, _1152);
        _1154 = _1164;
    }
    float _1166 = _1154;
    if (!_1020)
    {
        _1144 = 0.0;
    }
    float _1168 = _1144;
    float _1170 = _1168;
    if (_1020)
    {
        float _1172 = _1074 + _1162;
        _1170 = _1172;
    }
    float _1174 = _1170;
    if (_1020)
    {
        float _1176 = fma(_1104, _1096, _1166);
        _1128 = _1176;
    }
    float _1178 = _1128;
    if (!_1020)
    {
        _1130 = 0.0;
        _1138 = 0.0;
    }
    float _1180 = _1130;
    float _1182 = _1138;
    float _1184 = _1182;
    float _1186 = _1180;
    if (_1020)
    {
        float _1188 = _1050 + _1158;
        _1184 = _1188;
    }
    float _1190 = _1184;
    float _1192 = _1190;
    if (_1020)
    {
        float _1194 = _1098 + _1178;
        _1186 = _1194;
    }
    float _1196 = _1186;
    float _1198 = _1196;
    if (!_1024)
    {
        _1132 = _1174;
    }
    float _1200 = _1132;
    bool _1202 = !_1024;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1208 = uint(int(uint(_166) >> uint(2)));
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1208)]);
        int _1212 = _166 + 4;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1214)]);
        int _1218 = _166 + 8;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1220)]);
        uint _1224 = uint(int(uint(_166) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1224)]);
        int _1228 = _166 + 4;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1230)]);
        int _1234 = _166 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        float _1238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1236)]);
        uint _1240 = uint(int(uint(_166) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1240)]);
        int _1244 = _166 + 4;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1246)]);
        int _1250 = _166 + 8;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        float _1254 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1252)]);
        float _1256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1260 = _1100 * _1216;
        float _1262 = _1100 * _1232;
        float _1264 = _1100 * _1248;
        float _1266 = fma(_1102, _1210, _1260);
        float _1268 = fma(_1102, _1226, _1262);
        float _1270 = fma(_1102, _1242, _1264);
        float _1272 = fma(_1104, _1222, _1266);
        float _1274 = fma(_1104, _1238, _1268);
        float _1276 = fma(_1104, _1254, _1270);
        float _1278 = _1206 + _1272;
        float _1280 = _1256 + _1274;
        float _1282 = _1258 + _1276;
        _1114 = _1216;
        _1198 = _1280;
        _1192 = _1278;
        _1204 = _1282;
    }
    float _1284 = _1114;
    float _1286 = _1198;
    float _1288 = _1192;
    float _1290 = _1204;
    bool _1292 = !_1108;
    float _1294 = _1288;
    float _1296 = _1290;
    float _1298 = _1284;
    float _1300 = _1286;
    if (!_1292)
    {
        uint _1302 = uint(int(uint(_166) >> uint(2)));
        float _1304 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1302)]);
        int _1306 = _166 + 4;
        uint _1308 = uint(int(uint(_1306) >> uint(2)));
        float _1310 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1308)]);
        int _1312 = _166 + 8;
        uint _1314 = uint(int(uint(_1312) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        int _1318 = _166 + 12;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1320)]);
        uint _1324 = uint(int(uint(_166) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1324)]);
        int _1328 = _166 + 4;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1330)]);
        int _1334 = _166 + 8;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1336)]);
        int _1340 = _166 + 12;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1342)]);
        uint _1346 = uint(int(uint(_166) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1346)]);
        int _1350 = _166 + 4;
        uint _1352 = uint(int(uint(_1350) >> uint(2)));
        float _1354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1352)]);
        int _1356 = _166 + 8;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        float _1360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1358)]);
        int _1362 = _166 + 12;
        uint _1364 = uint(int(uint(_1362) >> uint(2)));
        float _1366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1364)]);
        float _1368 = _1100 * _1310;
        float _1370 = _1100 * _1332;
        float _1372 = _1100 * _1354;
        float _1374 = fma(_1102, _1304, _1368);
        float _1376 = fma(_1102, _1326, _1370);
        float _1378 = fma(_1102, _1348, _1372);
        float _1380 = fma(_1104, _1316, _1374);
        float _1382 = fma(_1104, _1338, _1376);
        float _1384 = fma(_1104, _1360, _1378);
        float _1386 = _1380 + _1322;
        float _1388 = _1382 + _1344;
        float _1390 = _1384 + _1366;
        _1294 = _1386;
        _1296 = _1390;
        _1298 = _1310;
        _1300 = _1388;
    }
    float _1392 = _1294;
    float _1394 = _1296;
    float _1396 = _1298;
    float _1398 = _1300;
    float _1400 = fma(_1392, 6.2500002968590706586837768554688e-05, 0.5);
    float _1402 = fma(_1394, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3810 = float2(_1400, _1402);
    float2 _1406 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3810, float2(0.0), isnan(_3810)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3810, float2(0.0), isnan(_3810)), level(0.0)).xy;
    float _1408 = _1406.x;
    float _1410 = _1406.y;
    bool _1412 = _596 > 0.001000000047497451305389404296875;
    bool _1414 = isnan(_596);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.001000000047497451305389404296875);
    bool _1420 = _1416 || _1418;
    bool _1422 = _1408 != 0.0;
    bool _1424 = isnan(_1408);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    int _1432 = as_type<int>(_1408);
    float _1434 = _1396;
    float _1436 = _1398;
    if (!_1420)
    {
        float _1438 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1432 = as_type<int>(_1438);
    }
    int _1440 = _1432;
    if (_1430)
    {
        _610 = _1410;
    }
    float _1442 = _610;
    if (!_1430)
    {
        _1434 = 4.0;
    }
    float _1444 = _1434;
    float _1446 = _1442;
    if (!_1430)
    {
        float2 _3877 = float2(_1400, _1402);
        float _1448 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3877, float2(0.0), isnan(_3877)), level(_1444)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3877, float2(0.0), isnan(_3877)), level(_1444)).y;
        _1446 = _1448;
    }
    float _1450 = _1446;
    float _1452 = _1410;
    if (!_1420)
    {
        float2 _3893 = float2(_1400, _1402);
        float _1454 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3893, float2(0.0), isnan(_3893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3893, float2(0.0), isnan(_3893)), level(0.0)).x;
        _1452 = _1454;
    }
    float _1456 = _1452;
    int _1458 = _166 + 4;
    int _1460 = _1440;
    float _1462 = _1456;
    if (!_1420)
    {
        float _1464 = fma(_1450, 2000.0, as_type<float>(_1440));
        _1460 = as_type<int>(_1464);
    }
    int _1466 = _1460;
    if (!_1420)
    {
        uint _1468 = uint(int(uint(_1458) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1468)] = uint(_1466);
    }
    float _1470 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _1472 = uint(int(uint(_1458) >> uint(2)));
    float _1474 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1472)]);
    if (!_1420)
    {
        float _1476 = _1456 * 2000.0;
        _1462 = _1476;
    }
    float _1478 = _1462;
    if (!_1420)
    {
        bool _1480 = _1398 >= _1478;
        bool _1482 = isnan(_1398);
        bool _1484 = _1480 || _1482;
        bool _1486 = isnan(_1478);
        bool _1488 = _1484 || _1486;
        _1034 = _1488;
    }
    bool _1490 = _1034;
    if (!_1420)
    {
        int _1492 = _1490 ? as_type<int>(_556) : 0;
        _686 = _1492;
    }
    int _1494 = _686;
    int _1496 = _166 + 8;
    float _1498 = -_170;
    float _1500 = _1498 + _1102;
    float _1502 = -_182;
    float _1504 = _1502 + _1104;
    float _1506 = fma(_1450, 2000.0, _1470);
    float _1508 = _1100 + _1474;
    bool _1510 = _1508 >= _1506;
    bool _1512 = isnan(_1508);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1506);
    bool _1518 = _1514 || _1516;
    float _1520 = _1506;
    if (!_1518)
    {
        float _1522 = -_1474;
        float _1524 = _1506 + _1522;
        _1520 = _1524;
    }
    float _1526 = _1520;
    int _1528 = as_type<int>(_1526);
    if (_1518)
    {
        _1436 = _1100;
    }
    float _1530 = _1436;
    float _1532 = _1530;
    if (!_1518)
    {
        float _1534 = fma(_1526, 0.00999999977648258209228515625, _1474);
        _1528 = as_type<int>(_1534);
    }
    int _1536 = _1528;
    if (!_1518)
    {
        float _1538 = _1100 * 0.9900000095367431640625;
        _1532 = _1538;
    }
    float _1540 = _1532;
    if (!_1518)
    {
        _688 = 0.0;
    }
    float _1542 = _688;
    if (!_1518)
    {
        uint _1544 = uint(int(uint(_1458) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1544)] = uint(_1536);
    }
    uint _1546 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1546)] = uint(_1494);
    float _1548 = -_176;
    float _1550 = _1548 + _1540;
    uint _1552 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1552)] = as_type<uint>(_1102);
    uint _1554 = uint(int(uint(_1458) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1554)] = as_type<uint>(_1540);
    uint _1556 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1556)] = as_type<uint>(_1104);
    uint _1558 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1558)] = as_type<uint>(_658);
    uint _1560 = uint(int(uint(_1458) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1560)] = as_type<uint>(_1542);
    uint _1562 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1562)] = as_type<uint>(_672);
    uint _1564 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1564)] = as_type<uint>(_1500);
    uint _1566 = uint(int(uint(_1458) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1566)] = as_type<uint>(_1550);
    uint _1568 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1568)] = as_type<uint>(_1504);
    float _1570 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1572 = _1550 * _1550;
    float _1574 = fma(_1500, _1500, _1572);
    float _1576 = fma(_1504, _1504, _1574);
    float _1578 = sqrt(_1576);
    float _1580 = _1542 * _1542;
    float _1582 = fma(_658, _658, _1580);
    float _1584 = fma(_672, _672, _1582);
    float _1586 = sqrt(_1584);
    bool _1588 = _1578 >= 9.9999999747524270787835121154785e-07;
    bool _1590 = isnan(_1578);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(9.9999999747524270787835121154785e-07);
    bool _1596 = _1592 || _1594;
    if (!_1596)
    {
        bool _1598 = _542 != _290;
        bool _1600 = isnan(_542);
        bool _1602 = _1598 || _1600;
        bool _1604 = isnan(_290);
        bool _1606 = _1602 || _1604;
        _1608 = _1606;
        if (!_1608)
        {
            float _1610 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1612 = _1610 > 0.0;
            bool _1614 = !_1612;
            if (!_1614)
            {
                float _1616 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1618 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1620 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1622 = _1618 * _510;
                float _1624 = _1618 * _508;
                float _1626 = _1618 * _512;
                float _1628 = fma(_1616, _516, _1622);
                float _1630 = fma(_1616, _514, _1624);
                float _1632 = fma(_1616, _518, _1626);
                float _1634 = fma(_1620, _522, _1628);
                float _1636 = fma(_1620, _520, _1630);
                float _1638 = fma(_1620, _524, _1632);
                float _1640 = _1634 * _1634;
                float _1642 = fma(_1636, _1636, _1640);
                float _1644 = fma(_1638, _1638, _1642);
                float _1646 = rsqrt(_1644);
                float _1648 = _1646 * 9.9999999747524270787835121154785e-07;
                float _1650 = _1636 * _1648;
                float _1652 = _1634 * _1648;
                float _1654 = _1638 * _1648;
                _328 = as_type<int>(_1650);
                _330 = as_type<int>(_1652);
                _332 = as_type<int>(_1654);
                _1608 = true;
            }
            else
            {
                bool _1656 = _1586 >= 9.9999999747524270787835121154785e-07;
                bool _1658 = isnan(_1586);
                bool _1660 = _1656 || _1658;
                bool _1662 = isnan(9.9999999747524270787835121154785e-07);
                bool _1664 = _1660 || _1662;
                if (!_1664)
                {
                    float _1666 = _1540 * _1540;
                    float _1668 = fma(_1102, _1102, _1666);
                    float _1670 = fma(_1104, _1104, _1668);
                    float _1672 = sqrt(_1670);
                    bool _1674 = _1672 >= 9.9999999747524270787835121154785e-07;
                    bool _1676 = isnan(_1672);
                    bool _1678 = _1674 || _1676;
                    bool _1680 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1682 = _1678 || _1680;
                    float _1684 = _1672;
                    if (_1682)
                    {
                        float _1686 = rsqrt(_1670);
                        _1684 = _1686;
                    }
                    float _1688 = _1684;
                    if (!_1682)
                    {
                        _316 = 0;
                    }
                    int _1690 = _316;
                    int _1692 = _1690;
                    if (!_1682)
                    {
                        _318 = 897988541;
                    }
                    int _1694 = _318;
                    int _1696 = _1694;
                    if (!_1682)
                    {
                        _320 = 0;
                    }
                    int _1698 = _320;
                    float _1700 = _1688;
                    int _1702 = _1698;
                    if (_1682)
                    {
                        float _1704 = _1688 * 9.9999999747524270787835121154785e-07;
                        _1700 = _1704;
                    }
                    float _1706 = _1700;
                    if (_1682)
                    {
                        float _1708 = _1102 * _1706;
                        _1692 = as_type<int>(_1708);
                    }
                    int _1710 = _1692;
                    _328 = _1710;
                    if (_1682)
                    {
                        float _1712 = _1540 * _1706;
                        _1696 = as_type<int>(_1712);
                    }
                    int _1714 = _1696;
                    _330 = _1714;
                    if (_1682)
                    {
                        float _1716 = _1104 * _1706;
                        _1702 = as_type<int>(_1716);
                    }
                    int _1718 = _1702;
                    _332 = _1718;
                    _1608 = true;
                }
                else
                {
                    float _1720 = rsqrt(_1584);
                    float _1722 = _1720 * 9.9999999747524270787835121154785e-07;
                    float _1724 = _658 * _1722;
                    float _1726 = _1542 * _1722;
                    float _1728 = _672 * _1722;
                    _328 = as_type<int>(_1724);
                    _330 = as_type<int>(_1726);
                    _332 = as_type<int>(_1728);
                    _1608 = true;
                }
            }
        }
    }
    else
    {
        float _1730 = _1586 * _1570;
        bool _1732 = _1730 >= 0.001000000047497451305389404296875;
        bool _1734 = isnan(_1730);
        bool _1736 = _1732 || _1734;
        bool _1738 = isnan(0.001000000047497451305389404296875);
        bool _1740 = _1736 || _1738;
        bool _1742 = _1730 > 0.0;
        bool _1744 = !_1740;
        bool _1746 = _1742 && _1744;
        bool _1748 = _1578 < 0.001000000047497451305389404296875;
        bool _1750 = _1748 && _1746;
        if (!_1750)
        {
            _322 = as_type<int>(_1500);
        }
        int _1752 = _322;
        int _1754 = _1752;
        if (_1750)
        {
            float _1756 = _658 * _1570;
            _1754 = as_type<int>(_1756);
        }
        int _1758 = _1754;
        _328 = _1758;
        if (!_1750)
        {
            _324 = as_type<int>(_1550);
        }
        int _1760 = _324;
        int _1762 = _1760;
        if (_1750)
        {
            float _1764 = _1570 * _1542;
            _1762 = as_type<int>(_1764);
        }
        int _1766 = _1762;
        _330 = _1766;
        if (!_1750)
        {
            _326 = as_type<int>(_1504);
        }
        int _1768 = _326;
        _332 = _1768;
        if (_1750)
        {
            float _1770 = _672 * _1570;
            _332 = as_type<int>(_1770);
        }
    }
    _1608 = false;
    int _1772 = _328;
    int _1774 = _330;
    int _1776 = _332;
    uint _1778 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1778)] = uint(_1772);
    uint _1780 = uint(int(uint(_1458) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1780)] = uint(_1774);
    uint _1782 = uint(int(uint(_1496) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1782)] = uint(_1776);
}

