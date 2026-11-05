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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c1 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    device _23* cp_s2 [[id(3)]];
    device _23* cp_s3 [[id(4)]];
    device _23* cp_s4 [[id(5)]];
    device _23* cp_s5 [[id(6)]];
    device _23* cp_s6 [[id(7)]];
    device _23* cp_s7 [[id(8)]];
    device _23* cp_s8 [[id(9)]];
    device _23* cp_s9 [[id(10)]];
    texture2d<float> cp_t_tcb_2A [[id(11)]];
    sampler cp_t_tcb_2ASmplr [[id(12)]];
    texture2d<float> cp_t_tcb_2C [[id(13)]];
    sampler cp_t_tcb_2CSmplr [[id(14)]];
    sampler cp_t_tcb_2ASmplr_w [[id(15)]];
    sampler cp_t_tcb_2CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2280 = false;
    bool _2114 = false;
    bool _1344 = false;
    float _64 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    float _68 = as_type<float>(gl_WorkGroupID.x);
    int _71 = as_type<int>(_68) << 5;
    int _73 = _71 + as_type<int>(_66);
    float _75 = trunc(_64);
    int _77 = int(_75);
    bool _81 = _73 >= _77;
    int _83 = 0;
    float _85 = as_type<float>(_77);
    if (_81)
    {
        _83 = 0;
    }
    int _87 = _83;
    int _89 = _87;
    int _91 = _87;
    float _93 = 0.0;
    if (!_81)
    {
        int _95 = _73 << 4;
        int _97 = _95 + 12;
        uint _100 = uint(int(uint(_97) >> uint(2)));
        float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
        float _104 = trunc(_102);
        int _106 = int(_104);
        bool _108 = _106 >= 1;
        int _110 = _108 ? (-1) : 0;
        _85 = as_type<float>(_97);
        _93 = as_type<float>(_106);
        if (!_108)
        {
            _89 = 0;
        }
        int _112 = _89;
        bool _114 = !_108;
        _91 = _112;
        if (!_114)
        {
            float _116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _118 = uint(int(uint(_97) >> uint(2)));
            float _120 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_118)]);
            float _122 = float(_106);
            float _124 = -_120;
            float _126 = _116 + _124;
            bool _128 = _126 > _122;
            int _130 = as_type<int>(_116);
            _85 = _120;
            _93 = _122;
            if (!_128)
            {
                bool _132 = _116 >= _120;
                bool _134 = isnan(_116);
                bool _136 = _132 || _134;
                bool _138 = isnan(_120);
                bool _140 = _136 || _138;
                _110 = _140 ? (-1) : 0;
            }
            int _142 = _110;
            if (_128)
            {
                _130 = 0;
            }
            int _144 = _130;
            _91 = _144;
            if (!_128)
            {
                int _146 = ~_142;
                int _148 = (_146 != 0) ? 0 : 1;
                _91 = _148;
            }
        }
    }
    int _150 = _91;
    float _152 = _85;
    float _154 = _93;
    int _156 = _150 & 1;
    bool _158 = _156 != 0;
    if (!_158)
    {
        return;
    }
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    int _176 = as_type<int>(_162) & 512;
    bool _178 = _176 != 0;
    float _180 = 0.0;
    float _182 = 0.0;
    float _184 = 0.0;
    float _186 = _162;
    if (_178)
    {
        float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _180 = _188;
        _182 = _190;
        _184 = _192;
    }
    float _194 = _180;
    float _196 = _182;
    float _198 = _184;
    float _200 = 0.0;
    float _202 = 0.0;
    float _204 = 0.0;
    if (_178)
    {
        float _206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _208 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _200 = _206;
        _202 = _208;
        _204 = _210;
    }
    float _212 = _200;
    float _214 = _202;
    float _216 = _204;
    float _218 = as_type<float>(_150);
    float _220 = _152;
    float _222 = _154;
    if (_178)
    {
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _226 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _218 = _224;
        _220 = _226;
        _222 = _228;
    }
    float _230 = _218;
    float _232 = _220;
    float _234 = _222;
    int _236 = _73 << 4;
    int _238 = _236 + 12;
    uint _240 = uint(int(uint(_236) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_240)]);
    int _244 = _236 + 4;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_246)]);
    int _250 = _236 + 8;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_252)]);
    int _256 = _236 + 12;
    uint _258 = uint(int(uint(_256) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_258)]);
    uint _262 = uint(int(uint(_238) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_262)]);
    uint _266 = uint(int(uint(_236) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_266)]);
    int _270 = _236 + 4;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_272)]);
    int _276 = _236 + 8;
    uint _278 = uint(int(uint(_276) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_278)]);
    uint _282 = uint(int(uint(_236) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_282)]);
    int _286 = _236 + 4;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_288)]);
    int _292 = _236 + 8;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_294)]);
    uint _298 = uint(int(uint(_238) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_298)]);
    float _302 = _260;
    float _304 = _170;
    float _306 = _194;
    float _308 = _212;
    float _310 = _196;
    float _312 = _214;
    float _314 = _198;
    float _316 = _216;
    float _318 = _230;
    float _320 = _232;
    float _322 = _234;
    float _324 = _268;
    float _326 = _280;
    float _328 = _242;
    float _330 = _248;
    float _332 = _254;
    float _334 = _164;
    float _336 = _166;
    float _338 = _168;
    float _340 = _268;
    float _342 = _280;
    int _344 = as_type<int>(_290);
    int _346 = as_type<int>(_290);
    int _348 = as_type<int>(_290);
    if (!_178)
    {
        int _350 = _236 + 4;
        uint _352 = uint(int(uint(_236) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_352)]);
        int _356 = _236 + 8;
        uint _358 = uint(int(uint(_236) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_350) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_362)]);
        uint _366 = uint(int(uint(_350) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_366)]);
        uint _370 = uint(int(uint(_356) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_370)]);
        uint _374 = uint(int(uint(_236) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_374)]);
        uint _378 = uint(int(uint(_356) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_378)]);
        uint _382 = uint(int(uint(_350) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_382)]);
        uint _386 = uint(int(uint(_356) >> uint(2)));
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_386)]);
        float _390 = _354 * _354;
        float _392 = fma(_360, _360, _390);
        float _394 = _364 * _364;
        float _396 = fma(_368, _368, _394);
        float _398 = _372 * _372;
        float _400 = fma(_376, _376, _392);
        float _402 = fma(_380, _380, _398);
        float _404 = sqrt(_400);
        float _406 = fma(_384, _384, _396);
        float _408 = fma(_388, _388, _402);
        float _410 = sqrt(_406);
        float _412 = sqrt(_408);
        bool _414 = _404 > 0.0;
        bool _416 = _410 > 0.0;
        bool _418 = _412 > 0.0;
        float _420 = _410;
        float _422 = _412;
        float _424 = _402;
        float _426 = _354;
        float _428 = _404;
        float _430 = _360;
        float _432 = _396;
        float _434 = _364;
        float _436 = _384;
        float _438 = _376;
        _304 = _408;
        if (_414)
        {
            float _440 = rsqrt(_400);
            _420 = _440;
        }
        float _442 = _420;
        float _444 = _260;
        if (_416)
        {
            float _446 = rsqrt(_406);
            _444 = _446;
        }
        float _448 = _444;
        float _450 = 0.0;
        if (_418)
        {
            float _452 = rsqrt(_408);
            _450 = _452;
        }
        float _454 = _450;
        if (!_414)
        {
            _422 = 0.0;
        }
        float _456 = _422;
        float _458 = _456;
        if (_414)
        {
            float _460 = _354 * _442;
            _458 = _460;
        }
        float _462 = _458;
        _308 = _462;
        if (!_414)
        {
            _424 = 0.0;
        }
        float _464 = _424;
        float _466 = _464;
        if (_414)
        {
            float _468 = _360 * _442;
            _466 = _468;
        }
        float _470 = _466;
        _306 = _470;
        if (!_414)
        {
            _426 = 0.0;
        }
        float _472 = _426;
        float _474 = _472;
        if (_414)
        {
            float _476 = _376 * _442;
            _474 = _476;
        }
        float _478 = _474;
        _318 = _478;
        if (!_416)
        {
            _428 = 0.0;
        }
        float _480 = _428;
        float _482 = _480;
        _302 = _448;
        if (_416)
        {
            float _484 = _364 * _448;
            _482 = _484;
        }
        float _486 = _482;
        _312 = _486;
        if (!_416)
        {
            _430 = 0.0;
        }
        float _488 = _430;
        float _490 = _488;
        if (_416)
        {
            float _492 = _384 * _448;
            _490 = _492;
        }
        float _494 = _490;
        _320 = _494;
        if (!_416)
        {
            _432 = 0.0;
        }
        float _496 = _432;
        float _498 = _496;
        if (_416)
        {
            float _500 = _368 * _448;
            _498 = _500;
        }
        float _502 = _498;
        _310 = _502;
        if (!_418)
        {
            _434 = 0.0;
        }
        float _504 = _434;
        float _506 = _504;
        if (!_418)
        {
            _436 = 0.0;
        }
        float _508 = _436;
        float _510 = _508;
        if (_418)
        {
            float _512 = _372 * _454;
            _506 = _512;
        }
        float _514 = _506;
        _316 = _514;
        if (!_418)
        {
            _438 = 0.0;
        }
        float _516 = _438;
        _322 = _516;
        if (_418)
        {
            float _518 = _380 * _454;
            _510 = _518;
        }
        float _520 = _510;
        _314 = _520;
        if (_418)
        {
            float _522 = _388 * _454;
            _322 = _522;
        }
    }
    float _524 = _302;
    float _526 = _304;
    float _528 = _306;
    float _530 = _308;
    float _532 = _310;
    float _534 = _312;
    float _536 = _314;
    float _538 = _316;
    float _540 = _318;
    float _542 = _320;
    float _544 = _322;
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _548 = abs(_172);
    float _550 = log2(_548);
    float _552 = _160 * _174;
    float _554 = _264 * _160;
    float _556 = _160 * _550;
    float _558 = _166 * _552;
    uint _560 = uint(int(uint(_238) >> uint(2)));
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_560)]);
    float _564 = exp2(_556);
    float _566 = fma(_248, _564, _558);
    bool _568 = _566 >= 0.0;
    bool _570 = isnan(_566);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = _164 * _552;
    float _580 = _168 * _552;
    float _582 = fma(_248, _554, _274);
    float _584 = _254 * _554;
    float _586 = _242 * _554;
    float _588 = fma(_242, _564, _578);
    float _590 = fma(_254, _564, _580);
    int _592 = as_type<int>(_162) & 1024;
    bool _594 = _592 != 0;
    float _596 = _280 + _584;
    int _598 = as_type<int>(_162) & 2048;
    bool _600 = _598 != 0;
    float _602 = _268 + _586;
    float _604 = _566;
    float _606 = _524;
    float _608 = _558;
    float _610 = _552;
    float _612 = 0.0;
    float _614 = _526;
    float _616 = _582;
    float _618 = 0.0;
    float _620 = _588;
    float _622 = _590;
    int _624 = as_type<int>(_586);
    int _626 = as_type<int>(_584);
    int _628 = as_type<int>(_586);
    int _630 = as_type<int>(_584);
    if (!_576)
    {
        float _632 = _242;
        float _634 = _248;
        float _636 = _254;
        float _638 = _524;
        if (_178)
        {
            float _640 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _642 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _644 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _646 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _632 = _640;
            _634 = _642;
            _636 = _644;
            _638 = _646;
        }
        float _648 = _632;
        float _650 = _634;
        float _652 = _636;
        float _654 = _638;
        float _656 = _558;
        float _658 = _552;
        float _660 = _162;
        float _662 = 0.0;
        if (_178)
        {
            float _664 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _666 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _668 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _656 = _664;
            _658 = _666;
            _660 = _668;
            _662 = _670;
        }
        float _672 = _656;
        float _674 = _658;
        float _676 = _660;
        float _678 = _662;
        float _680 = _164;
        float _682 = _166;
        float _684 = _168;
        float _686 = _526;
        if (_178)
        {
            float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _680 = _688;
            _682 = _690;
            _684 = _692;
            _686 = _694;
        }
        float _696 = _680;
        float _698 = _682;
        float _700 = _684;
        float _702 = _686;
        float _704 = 0.0;
        if (!_178)
        {
            _704 = 0.0;
        }
        float _706 = _704;
        float _708 = _650;
        float _710 = _648;
        float _712 = _706;
        float _714 = _654;
        float _716 = _652;
        if (_178)
        {
            float _718 = _582 * _650;
            _708 = _718;
        }
        float _720 = _708;
        float _722 = _698;
        float _724 = _676;
        float _726 = _700;
        float _728 = _672;
        float _730 = _674;
        float _732 = _678;
        float _734 = _696;
        float _736 = _702;
        if (_178)
        {
            float _738 = _582 * _674;
            _324 = _738;
        }
        float _740 = _324;
        float _742 = _740;
        if (_178)
        {
            float _744 = fma(_602, _648, _720);
            _326 = _744;
        }
        float _746 = _326;
        float _748 = _746;
        if (_178)
        {
            float _750 = _582 * _698;
            _722 = _750;
        }
        float _752 = _722;
        float _754 = _752;
        if (_178)
        {
            float _756 = fma(_602, _672, _740);
            _742 = _756;
        }
        float _758 = _742;
        float _760 = _758;
        if (_178)
        {
            float _762 = fma(_596, _652, _746);
            _748 = _762;
        }
        float _764 = _748;
        if (_178)
        {
            float _766 = fma(_602, _696, _752);
            _754 = _766;
        }
        float _768 = _754;
        float _770 = _768;
        if (_178)
        {
            float _772 = fma(_596, _676, _758);
            _724 = _772;
        }
        float _774 = _724;
        float _776 = _774;
        if (!_178)
        {
            _760 = 0.0;
        }
        float _778 = _760;
        float _780 = _778;
        if (_178)
        {
            float _782 = _654 + _764;
            _780 = _782;
        }
        float _784 = _780;
        if (_178)
        {
            float _786 = fma(_596, _700, _768);
            _726 = _786;
        }
        float _788 = _726;
        float _790 = _788;
        if (!_178)
        {
            _710 = 0.0;
        }
        float _792 = _710;
        float _794 = _792;
        if (_178)
        {
            float _796 = _678 + _774;
            _794 = _796;
        }
        float _798 = _794;
        float _800 = _798;
        if (_178)
        {
            float _802 = _702 + _788;
            _712 = _802;
        }
        float _804 = _712;
        float _806 = _804;
        if (!_594)
        {
            _714 = _784;
        }
        float _808 = _714;
        bool _810 = !_594;
        float _812 = _808;
        if (!_810)
        {
            float _814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _816 = uint(int(uint(_236) >> uint(2)));
            float _818 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_816)]);
            int _820 = _236 + 4;
            uint _822 = uint(int(uint(_820) >> uint(2)));
            float _824 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_822)]);
            int _826 = _236 + 8;
            uint _828 = uint(int(uint(_826) >> uint(2)));
            float _830 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_828)]);
            int _832 = _236 + 12;
            uint _834 = uint(int(uint(_832) >> uint(2)));
            float _836 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_834)]);
            uint _838 = uint(int(uint(_236) >> uint(2)));
            float _840 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_838)]);
            int _842 = _236 + 4;
            uint _844 = uint(int(uint(_842) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_844)]);
            int _848 = _236 + 8;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_850)]);
            int _854 = _236 + 12;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_856)]);
            uint _860 = uint(int(uint(_236) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_860)]);
            int _864 = _236 + 4;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_866)]);
            int _870 = _236 + 8;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_872)]);
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _880 = _582 * _824;
            float _882 = _582 * _846;
            float _884 = _582 * _868;
            float _886 = fma(_602, _818, _880);
            float _888 = fma(_602, _840, _882);
            float _890 = fma(_602, _862, _884);
            float _892 = fma(_596, _830, _886);
            float _894 = fma(_596, _852, _888);
            float _896 = fma(_596, _874, _890);
            float _898 = _814 + _892;
            float _900 = _876 + _894;
            float _902 = _878 + _896;
            _728 = _886;
            _730 = _824;
            _776 = _830;
            _732 = _836;
            _734 = _840;
            _770 = _894;
            _790 = _852;
            _736 = _858;
            _800 = _898;
            _716 = _874;
            _812 = _902;
            _806 = _900;
        }
        float _904 = _728;
        float _906 = _730;
        float _908 = _776;
        float _910 = _732;
        float _912 = _734;
        float _914 = _770;
        float _916 = _790;
        float _918 = _736;
        float _920 = _800;
        float _922 = _716;
        float _924 = _812;
        float _926 = _806;
        bool _928 = !_600;
        float _930 = _920;
        float _932 = _924;
        float _934 = _926;
        float _936 = _922;
        float _938 = _914;
        float _940 = _916;
        float _942 = _918;
        float _944 = _904;
        float _946 = _906;
        float _948 = _908;
        float _950 = _910;
        float _952 = _912;
        if (!_928)
        {
            uint _954 = uint(int(uint(_236) >> uint(2)));
            float _956 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_954)]);
            int _958 = _236 + 4;
            uint _960 = uint(int(uint(_958) >> uint(2)));
            float _962 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_960)]);
            int _964 = _236 + 8;
            uint _966 = uint(int(uint(_964) >> uint(2)));
            float _968 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_966)]);
            int _970 = _236 + 12;
            uint _972 = uint(int(uint(_970) >> uint(2)));
            float _974 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_972)]);
            uint _976 = uint(int(uint(_236) >> uint(2)));
            float _978 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_976)]);
            int _980 = _236 + 4;
            uint _982 = uint(int(uint(_980) >> uint(2)));
            float _984 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_982)]);
            int _986 = _236 + 8;
            uint _988 = uint(int(uint(_986) >> uint(2)));
            float _990 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_988)]);
            int _992 = _236 + 12;
            uint _994 = uint(int(uint(_992) >> uint(2)));
            float _996 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_994)]);
            uint _998 = uint(int(uint(_236) >> uint(2)));
            float _1000 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_998)]);
            int _1002 = _236 + 4;
            uint _1004 = uint(int(uint(_1002) >> uint(2)));
            float _1006 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1004)]);
            int _1008 = _236 + 8;
            uint _1010 = uint(int(uint(_1008) >> uint(2)));
            float _1012 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1010)]);
            int _1014 = _236 + 12;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            float _1018 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1016)]);
            float _1020 = _582 * _962;
            float _1022 = _582 * _984;
            float _1024 = _582 * _1006;
            float _1026 = fma(_602, _956, _1020);
            float _1028 = fma(_602, _978, _1022);
            float _1030 = fma(_602, _1000, _1024);
            float _1032 = fma(_596, _968, _1026);
            float _1034 = fma(_596, _990, _1028);
            float _1036 = fma(_596, _1012, _1030);
            float _1038 = _1032 + _974;
            float _1040 = _1034 + _996;
            float _1042 = _1036 + _1018;
            _930 = _1038;
            _932 = _1042;
            _934 = _1040;
            _936 = _1036;
            _938 = _1028;
            _940 = _1034;
            _942 = _996;
            _944 = _956;
            _946 = _962;
            _948 = _968;
            _950 = _974;
            _952 = _978;
        }
        float _1044 = _930;
        float _1046 = _932;
        float _1048 = _934;
        float _1050 = _936;
        float _1052 = _938;
        float _1054 = _940;
        float _1056 = _942;
        float _1058 = _944;
        float _1060 = _946;
        float _1062 = _948;
        float _1064 = _950;
        float _1066 = _952;
        float _1068 = fma(_1044, 6.2500002968590706586837768554688e-05, 0.5);
        float _1070 = fma(_1046, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _3874 = float2(_1068, _1070);
        float _1072 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3874, float2(0.0), isnan(_3874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3874, float2(0.0), isnan(_3874)), level(0.0)).x;
        int _1074 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 12;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1076)]);
        uint _1080 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _1082 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1080)]);
        int _1084 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
        uint _1086 = uint(int(uint(_1084) >> uint(2)));
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1086)]);
        float _1090 = _1072 * 2000.0;
        float _1092 = -_1078;
        float _1094 = _1092 + _1048;
        float _1096 = _1090 + (-0.300000011920928955078125);
        bool _1098 = _1094 > _1096;
        bool _1100 = _1094 < _1090;
        bool _1102 = _1100 && _1098;
        bool _1104 = !_1102;
        _328 = _1044;
        _330 = _1096;
        _332 = _1050;
        _606 = _1046;
        _608 = _1058;
        _610 = _1060;
        _186 = _1062;
        _612 = _1064;
        _334 = _1066;
        _336 = _1052;
        _338 = _1054;
        _614 = _1056;
        _340 = _1088;
        _342 = _1082;
        _618 = _1094;
        if (!_1104)
        {
            float _1106 = fma(_1044, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1108 = fma(_1044, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _1110 = fma(_1046, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1112 = fma(_1046, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _3969 = float2(_1106, _1070);
            float _1114 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3969, float2(0.0), isnan(_3969)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3969, float2(0.0), isnan(_3969)), level(0.0)).x;
            float2 _3977 = float2(_1108, _1070);
            float _1116 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3977, float2(0.0), isnan(_3977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3977, float2(0.0), isnan(_3977)), level(0.0)).x;
            float2 _3985 = float2(_1068, _1110);
            float _1118 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3985, float2(0.0), isnan(_3985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3985, float2(0.0), isnan(_3985)), level(0.0)).x;
            float2 _3993 = float2(_1068, _1112);
            float _1120 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3993, float2(0.0), isnan(_3993)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3993, float2(0.0), isnan(_3993)), level(0.0)).x;
            float2 _4001 = float2(_1106, _1110);
            float _1122 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4001, float2(0.0), isnan(_4001)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4001, float2(0.0), isnan(_4001)), level(0.0)).x;
            float2 _4009 = float2(_1106, _1112);
            float _1124 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4009, float2(0.0), isnan(_4009)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4009, float2(0.0), isnan(_4009)), level(0.0)).x;
            float2 _4017 = float2(_1108, _1110);
            float _1126 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4017, float2(0.0), isnan(_4017)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4017, float2(0.0), isnan(_4017)), level(0.0)).x;
            float2 _4025 = float2(_1108, _1112);
            float _1128 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4025, float2(0.0), isnan(_4025)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4025, float2(0.0), isnan(_4025)), level(0.0)).x;
            float _1130 = -_1114;
            float _1132 = _1072 + _1130;
            float _1134 = -_1116;
            float _1136 = _1072 + _1134;
            float _1138 = -_1118;
            float _1140 = _1072 + _1138;
            float _1142 = -_1120;
            float _1144 = _1072 + _1142;
            float _1146 = -_1122;
            float _1148 = _1072 + _1146;
            float _1150 = -_1124;
            float _1152 = _1072 + _1150;
            float _1154 = -_1126;
            float _1156 = _1072 + _1154;
            float _1158 = -_1128;
            float _1160 = _1072 + _1158;
            float _1162 = abs(_1132);
            float _1164 = abs(_1136);
            float _1166 = precise::max(_1162, _1164);
            float _1168 = abs(_1140);
            float _1170 = abs(_1144);
            float _1172 = precise::max(_1168, _1170);
            float _1174 = abs(_1148);
            float _1176 = abs(_1152);
            float _1178 = precise::max(_1174, _1176);
            float _1180 = precise::max(_1166, _1172);
            float _1182 = abs(_1156);
            float _1184 = abs(_1160);
            float _1186 = precise::max(_1182, _1184);
            bool _1188 = _1180 > 0.00150000001303851604461669921875;
            float _1190 = precise::max(_1178, _1186);
            bool _1192 = _1190 <= 0.00150000001303851604461669921875;
            bool _1194 = isnan(_1190);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan(0.00150000001303851604461669921875);
            bool _1200 = _1196 || _1198;
            bool _1202 = !_1188;
            bool _1204 = _1200 && _1202;
            bool _1206 = !_1204;
            float _1208 = _1156;
            float _1210 = _1186;
            float _1212 = _1166;
            float _1214 = _1136;
            float _1216 = _1180;
            float _1218 = _1152;
            _328 = _1108;
            _330 = _1106;
            _332 = _1140;
            _606 = _1112;
            _608 = _1156;
            _610 = _1186;
            _186 = _1166;
            _612 = _1136;
            _334 = _1110;
            _336 = _1180;
            _338 = _1190;
            _614 = _1152;
            if (!_1206)
            {
                float _1220 = -_1072;
                float _1222 = _1220 + _1114;
                float _1224 = -_1072;
                float _1226 = _1224 + _1118;
                float _1228 = _1222 * 2000.0;
                float _1230 = _1226 * 2000.0;
                bool _1232 = !_178;
                float _1338;
                float _1340;
                float _1342;
                if (!_1232)
                {
                    float _1234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _1236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _1238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _1242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _1244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _1248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _1252 = _1238 * _1240;
                    float _1254 = _1238 * _1242;
                    float _1256 = _1236 * _1240;
                    float _1258 = -_1252;
                    float _1260 = fma(_1234, _1244, _1258);
                    float _1262 = -_1254;
                    float _1264 = fma(_1236, _1244, _1262);
                    float _1266 = -_1256;
                    float _1268 = fma(_1234, _1242, _1266);
                    float _1270 = _1250 * _1236;
                    float _1272 = _1260 * _1248;
                    float _1274 = _1246 * _1238;
                    float _1276 = _1248 * _1234;
                    float _1278 = -_1270;
                    float _1280 = fma(_1248, _1238, _1278);
                    float _1282 = -_1272;
                    float _1284 = fma(_1264, _1246, _1282);
                    float _1286 = _1248 * _1244;
                    float _1288 = -_1274;
                    float _1290 = fma(_1250, _1234, _1288);
                    float _1292 = _1250 * _1240;
                    float _1294 = fma(_1268, _1250, _1284);
                    float _1296 = -_1286;
                    float _1298 = fma(_1250, _1242, _1296);
                    float _1300 = _1246 * _1242;
                    float _1302 = -_1234;
                    float _1304 = fma(_1302, _1244, _1252);
                    float _1306 = -_1292;
                    float _1308 = fma(_1246, _1244, _1306);
                    float _1310 = -_1276;
                    float _1312 = fma(_1246, _1236, _1310);
                    float _1314 = 1.0 / _1294;
                    float _1316 = -_1300;
                    float _1318 = fma(_1248, _1240, _1316);
                    float _1320 = fma(_1228, _1264, _1298);
                    float _1322 = fma(_1228, _1304, _1308);
                    float _1324 = fma(_1228, _1268, _1318);
                    float _1326 = fma(_1230, _1280, _1320);
                    float _1328 = fma(_1230, _1290, _1322);
                    float _1330 = fma(_1230, _1312, _1324);
                    float _1332 = _1314 * _1326;
                    float _1334 = _1314 * _1328;
                    float _1336 = _1314 * _1330;
                    _1338 = _1334;
                    _1340 = _1332;
                    _1342 = _1336;
                    _1208 = _1246;
                    _1210 = _1324;
                    _1212 = _1300;
                    _1214 = _1314;
                    _1216 = _1236;
                    _1218 = _1252;
                    _1344 = true;
                }
                else
                {
                    float _1346 = fma(_1228, _528, _530);
                    float _1348 = fma(_1228, _532, _534);
                    float _1350 = fma(_1228, _536, _538);
                    float _1352 = fma(_1230, _540, _1346);
                    float _1354 = fma(_1230, _542, _1348);
                    float _1356 = fma(_1230, _544, _1350);
                    _1338 = _1354;
                    _1340 = _1352;
                    _1342 = _1356;
                }
                _1344 = false;
                float _1358 = _1338;
                float _1360 = _1340;
                float _1362 = _1342;
                float _1364 = _1208;
                float _1366 = _1210;
                float _1368 = _1212;
                float _1370 = _1214;
                float _1372 = _1216;
                float _1374 = _1218;
                float _1376 = _1358 * _1358;
                float _1378 = -_1094;
                float _1380 = _1378 + _1090;
                float _1382 = fma(_1360, _1360, _1376);
                float _1384 = _582 + _1380;
                float _1386 = fma(_1362, _1362, _1382);
                float _1388 = rsqrt(_1386);
                float _1390 = _1388 * _1358;
                float _1392 = _1388 * _1360;
                float _1394 = _1388 * _1362;
                float _1396 = _566 * _1390;
                float _1398 = fma(_588, _1392, _1396);
                float _1400 = fma(_590, _1394, _1398);
                float _1402 = _1390 * _1400;
                float _1404 = _1392 * _1400;
                float _1406 = _1394 * _1400;
                float _1408 = -_1402;
                float _1410 = _566 + _1408;
                float _1412 = _1082 * _1404;
                float _1414 = _1082 * _1402;
                float _1416 = -_1404;
                float _1418 = _588 + _1416;
                float _1420 = -_1406;
                float _1422 = _590 + _1420;
                float _1424 = _1082 * _1406;
                float _1426 = -_1414;
                float _1428 = fma(_1088, _1410, _1426);
                float _1430 = -_1412;
                float _1432 = fma(_1088, _1418, _1430);
                float _1434 = -_1424;
                float _1436 = fma(_1088, _1422, _1434);
                _604 = _1428;
                _328 = _1406;
                _330 = _1412;
                _332 = _1404;
                _606 = _1388;
                _608 = _1364;
                _610 = _1366;
                _186 = _1368;
                _612 = _1370;
                _334 = _1414;
                _336 = _1372;
                _338 = _1398;
                _614 = _1374;
                _616 = _1384;
                _342 = _1424;
                _620 = _1432;
                _622 = _1436;
            }
        }
    }
    float _1438 = _604;
    float _1440 = _328;
    float _1442 = _330;
    float _1444 = _332;
    float _1446 = _606;
    float _1448 = _608;
    float _1450 = _610;
    float _1452 = _186;
    float _1454 = _612;
    float _1456 = _334;
    float _1458 = _336;
    float _1460 = _338;
    float _1462 = _614;
    float _1464 = _616;
    float _1466 = _340;
    float _1468 = _342;
    float _1470 = _618;
    float _1472 = _620;
    float _1474 = _622;
    bool _1476 = _1438 >= 0.0;
    bool _1478 = isnan(_1438);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan(0.0);
    bool _1484 = _1480 || _1482;
    float _1486 = _1470;
    float _1488 = _1466;
    float _1490 = _1468;
    float _1492 = _1464;
    float _1494 = _1472;
    float _1496 = _1438;
    float _1498 = _1474;
    if (!_1484)
    {
        float _1500 = _1440;
        float _1502 = _1442;
        float _1504 = _1444;
        float _1506 = _1446;
        if (_178)
        {
            float _1508 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1510 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1514 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1500 = _1508;
            _1502 = _1510;
            _1504 = _1512;
            _1506 = _1514;
        }
        float _1516 = _1500;
        float _1518 = _1502;
        float _1520 = _1504;
        float _1522 = _1506;
        float _1524 = _1448;
        float _1526 = _1450;
        float _1528 = _1452;
        float _1530 = _1454;
        if (_178)
        {
            float _1532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1536 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1524 = _1532;
            _1526 = _1534;
            _1528 = _1536;
            _1530 = _1538;
        }
        float _1540 = _1524;
        float _1542 = _1526;
        float _1544 = _1528;
        float _1546 = _1530;
        float _1548 = _1456;
        float _1550 = _1458;
        float _1552 = _1460;
        float _1554 = _1462;
        if (_178)
        {
            float _1556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1560 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1562 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1548 = _1556;
            _1550 = _1558;
            _1552 = _1560;
            _1554 = _1562;
        }
        float _1564 = _1548;
        float _1566 = _1550;
        float _1568 = _1552;
        float _1570 = _1554;
        if (!_178)
        {
            _1486 = 0.0;
        }
        float _1572 = _1486;
        float _1574 = _1518;
        float _1576 = _1516;
        float _1578 = _1572;
        float _1580 = _1522;
        if (_178)
        {
            float _1582 = _1518 * _1464;
            _1574 = _1582;
        }
        float _1584 = _1574;
        float _1586 = _1566;
        float _1588 = _1544;
        float _1590 = _1568;
        if (_178)
        {
            float _1592 = _1542 * _1464;
            _1488 = _1592;
        }
        float _1594 = _1488;
        float _1596 = _1594;
        if (_178)
        {
            float _1598 = fma(_602, _1516, _1584);
            _1490 = _1598;
        }
        float _1600 = _1490;
        float _1602 = _1600;
        if (_178)
        {
            float _1604 = _1566 * _1464;
            _1586 = _1604;
        }
        float _1606 = _1586;
        float _1608 = _1606;
        if (_178)
        {
            float _1610 = fma(_602, _1540, _1594);
            _1596 = _1610;
        }
        float _1612 = _1596;
        float _1614 = _1612;
        if (_178)
        {
            float _1616 = fma(_596, _1520, _1600);
            _1602 = _1616;
        }
        float _1618 = _1602;
        if (_178)
        {
            float _1620 = fma(_602, _1564, _1606);
            _1608 = _1620;
        }
        float _1622 = _1608;
        if (_178)
        {
            float _1624 = fma(_596, _1544, _1612);
            _1588 = _1624;
        }
        float _1626 = _1588;
        if (!_178)
        {
            _1614 = 0.0;
        }
        float _1628 = _1614;
        float _1630 = _1628;
        if (_178)
        {
            float _1632 = _1522 + _1618;
            _1630 = _1632;
        }
        float _1634 = _1630;
        if (_178)
        {
            float _1636 = fma(_596, _1568, _1622);
            _1590 = _1636;
        }
        float _1638 = _1590;
        if (!_178)
        {
            _1576 = 0.0;
        }
        float _1640 = _1576;
        float _1642 = _1640;
        if (_178)
        {
            float _1644 = _1546 + _1626;
            _1642 = _1644;
        }
        float _1646 = _1642;
        float _1648 = _1646;
        if (_178)
        {
            float _1650 = _1570 + _1638;
            _1578 = _1650;
        }
        float _1652 = _1578;
        float _1654 = _1652;
        if (!_594)
        {
            _1580 = _1634;
        }
        float _1656 = _1580;
        bool _1658 = !_594;
        float _1660 = _1656;
        if (!_1658)
        {
            float _1662 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _1664 = uint(int(uint(_236) >> uint(2)));
            float _1666 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1664)]);
            int _1668 = _236 + 4;
            uint _1670 = uint(int(uint(_1668) >> uint(2)));
            float _1672 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1670)]);
            int _1674 = _236 + 8;
            uint _1676 = uint(int(uint(_1674) >> uint(2)));
            float _1678 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1676)]);
            uint _1680 = uint(int(uint(_236) >> uint(2)));
            float _1682 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1680)]);
            int _1684 = _236 + 4;
            uint _1686 = uint(int(uint(_1684) >> uint(2)));
            float _1688 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1686)]);
            int _1690 = _236 + 8;
            uint _1692 = uint(int(uint(_1690) >> uint(2)));
            float _1694 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1692)]);
            uint _1696 = uint(int(uint(_236) >> uint(2)));
            float _1698 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1696)]);
            int _1700 = _236 + 4;
            uint _1702 = uint(int(uint(_1700) >> uint(2)));
            float _1704 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1702)]);
            int _1706 = _236 + 8;
            uint _1708 = uint(int(uint(_1706) >> uint(2)));
            float _1710 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1708)]);
            float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1716 = _1672 * _1464;
            float _1718 = _1688 * _1464;
            float _1720 = _1704 * _1464;
            float _1722 = fma(_602, _1666, _1716);
            float _1724 = fma(_602, _1682, _1718);
            float _1726 = fma(_602, _1698, _1720);
            float _1728 = fma(_596, _1678, _1722);
            float _1730 = fma(_596, _1694, _1724);
            float _1732 = fma(_596, _1710, _1726);
            float _1734 = _1662 + _1728;
            float _1736 = _1712 + _1730;
            float _1738 = _1714 + _1732;
            _1648 = _1734;
            _1660 = _1738;
            _1654 = _1736;
        }
        float _1740 = _1648;
        float _1742 = _1660;
        float _1744 = _1654;
        bool _1746 = !_600;
        float _1748 = _1740;
        float _1750 = _1742;
        float _1752 = _1744;
        if (!_1746)
        {
            uint _1754 = uint(int(uint(_236) >> uint(2)));
            float _1756 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1754)]);
            int _1758 = _236 + 4;
            uint _1760 = uint(int(uint(_1758) >> uint(2)));
            float _1762 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1760)]);
            int _1764 = _236 + 8;
            uint _1766 = uint(int(uint(_1764) >> uint(2)));
            float _1768 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1766)]);
            int _1770 = _236 + 12;
            uint _1772 = uint(int(uint(_1770) >> uint(2)));
            float _1774 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1772)]);
            uint _1776 = uint(int(uint(_236) >> uint(2)));
            float _1778 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1776)]);
            int _1780 = _236 + 4;
            uint _1782 = uint(int(uint(_1780) >> uint(2)));
            float _1784 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1782)]);
            int _1786 = _236 + 8;
            uint _1788 = uint(int(uint(_1786) >> uint(2)));
            float _1790 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1788)]);
            int _1792 = _236 + 12;
            uint _1794 = uint(int(uint(_1792) >> uint(2)));
            float _1796 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1794)]);
            uint _1798 = uint(int(uint(_236) >> uint(2)));
            float _1800 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1798)]);
            int _1802 = _236 + 4;
            uint _1804 = uint(int(uint(_1802) >> uint(2)));
            float _1806 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1804)]);
            int _1808 = _236 + 8;
            uint _1810 = uint(int(uint(_1808) >> uint(2)));
            float _1812 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1810)]);
            int _1814 = _236 + 12;
            uint _1816 = uint(int(uint(_1814) >> uint(2)));
            float _1818 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1816)]);
            float _1820 = _1762 * _1464;
            float _1822 = _1784 * _1464;
            float _1824 = _1806 * _1464;
            float _1826 = fma(_602, _1756, _1820);
            float _1828 = fma(_602, _1778, _1822);
            float _1830 = fma(_602, _1800, _1824);
            float _1832 = fma(_596, _1768, _1826);
            float _1834 = fma(_596, _1790, _1828);
            float _1836 = fma(_596, _1812, _1830);
            float _1838 = _1832 + _1774;
            float _1840 = _1834 + _1796;
            float _1842 = _1836 + _1818;
            _1748 = _1838;
            _1750 = _1842;
            _1752 = _1840;
        }
        float _1844 = _1748;
        float _1846 = _1750;
        float _1848 = _1752;
        float _1850 = fma(_1844, 6.2500002968590706586837768554688e-05, 0.5);
        float _1852 = fma(_1846, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _5073 = float2(_1850, _1852);
        float _1854 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5073, float2(0.0), isnan(_5073)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5073, float2(0.0), isnan(_5073)), level(0.0)).x;
        int _1856 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 12;
        uint _1858 = uint(int(uint(_1856) >> uint(2)));
        float _1860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1858)]);
        uint _1862 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _1864 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1862)]);
        int _1866 = as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x) + 4;
        uint _1868 = uint(int(uint(_1866) >> uint(2)));
        float _1870 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1868)]);
        float _1872 = _1854 * 2000.0;
        float _1874 = -_1860;
        float _1876 = _1874 + _1848;
        float _1878 = _1872 + (-0.300000011920928955078125);
        bool _1880 = _1876 > _1878;
        bool _1882 = _1876 < _1872;
        bool _1884 = _1882 && _1880;
        bool _1886 = !_1884;
        if (!_1886)
        {
            float _1888 = fma(_1844, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1890 = fma(_1844, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _1892 = fma(_1846, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1894 = fma(_1846, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _5146 = float2(_1888, _1852);
            float _1896 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5146, float2(0.0), isnan(_5146)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5146, float2(0.0), isnan(_5146)), level(0.0)).x;
            float2 _5154 = float2(_1890, _1852);
            float _1898 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5154, float2(0.0), isnan(_5154)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5154, float2(0.0), isnan(_5154)), level(0.0)).x;
            float2 _5162 = float2(_1850, _1892);
            float _1900 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5162, float2(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5162, float2(0.0), isnan(_5162)), level(0.0)).x;
            float2 _5170 = float2(_1850, _1894);
            float _1902 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5170, float2(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5170, float2(0.0), isnan(_5170)), level(0.0)).x;
            float2 _5178 = float2(_1888, _1892);
            float _1904 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5178, float2(0.0), isnan(_5178)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5178, float2(0.0), isnan(_5178)), level(0.0)).x;
            float2 _5186 = float2(_1888, _1894);
            float _1906 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5186, float2(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5186, float2(0.0), isnan(_5186)), level(0.0)).x;
            float2 _5194 = float2(_1890, _1892);
            float _1908 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5194, float2(0.0), isnan(_5194)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5194, float2(0.0), isnan(_5194)), level(0.0)).x;
            float2 _5202 = float2(_1890, _1894);
            float _1910 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5202, float2(0.0), isnan(_5202)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5202, float2(0.0), isnan(_5202)), level(0.0)).x;
            float _1912 = -_1896;
            float _1914 = _1854 + _1912;
            float _1916 = -_1898;
            float _1918 = _1854 + _1916;
            float _1920 = -_1900;
            float _1922 = _1854 + _1920;
            float _1924 = -_1902;
            float _1926 = _1854 + _1924;
            float _1928 = -_1904;
            float _1930 = _1854 + _1928;
            float _1932 = -_1906;
            float _1934 = _1854 + _1932;
            float _1936 = -_1908;
            float _1938 = _1854 + _1936;
            float _1940 = -_1910;
            float _1942 = _1854 + _1940;
            float _1944 = abs(_1914);
            float _1946 = abs(_1918);
            float _1948 = precise::max(_1944, _1946);
            float _1950 = abs(_1922);
            float _1952 = abs(_1926);
            float _1954 = precise::max(_1950, _1952);
            float _1956 = abs(_1930);
            float _1958 = abs(_1934);
            float _1960 = precise::max(_1956, _1958);
            float _1962 = precise::max(_1948, _1954);
            float _1964 = abs(_1938);
            float _1966 = abs(_1942);
            float _1968 = precise::max(_1964, _1966);
            bool _1970 = _1962 > 0.00150000001303851604461669921875;
            float _1972 = precise::max(_1960, _1968);
            bool _1974 = _1972 <= 0.00150000001303851604461669921875;
            bool _1976 = isnan(_1972);
            bool _1978 = _1974 || _1976;
            bool _1980 = isnan(0.00150000001303851604461669921875);
            bool _1982 = _1978 || _1980;
            bool _1984 = !_1970;
            bool _1986 = _1982 && _1984;
            bool _1988 = !_1986;
            if (!_1988)
            {
                float _1990 = -_1854;
                float _1992 = _1990 + _1896;
                float _1994 = -_1854;
                float _1996 = _1994 + _1900;
                float _1998 = _1992 * 2000.0;
                float _2000 = _1996 * 2000.0;
                bool _2002 = !_178;
                float _2108;
                float _2110;
                float _2112;
                if (!_2002)
                {
                    float _2004 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2006 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2018 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2020 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2022 = _2008 * _2010;
                    float _2024 = _2008 * _2012;
                    float _2026 = _2006 * _2010;
                    float _2028 = -_2022;
                    float _2030 = fma(_2004, _2014, _2028);
                    float _2032 = -_2024;
                    float _2034 = fma(_2006, _2014, _2032);
                    float _2036 = _2020 * _2006;
                    float _2038 = _2018 * _2014;
                    float _2040 = _2030 * _2018;
                    float _2042 = -_2026;
                    float _2044 = fma(_2004, _2012, _2042);
                    float _2046 = _2016 * _2008;
                    float _2048 = -_2036;
                    float _2050 = fma(_2018, _2008, _2048);
                    float _2052 = -_2040;
                    float _2054 = fma(_2034, _2016, _2052);
                    float _2056 = _2020 * _2010;
                    float _2058 = -_2046;
                    float _2060 = fma(_2020, _2004, _2058);
                    float _2062 = -_2038;
                    float _2064 = fma(_2020, _2012, _2062);
                    float _2066 = fma(_2044, _2020, _2054);
                    float _2068 = _2016 * _2012;
                    float _2070 = _2018 * _2004;
                    float _2072 = -_2004;
                    float _2074 = fma(_2072, _2014, _2022);
                    float _2076 = -_2056;
                    float _2078 = fma(_2016, _2014, _2076);
                    float _2080 = -_2068;
                    float _2082 = fma(_2018, _2010, _2080);
                    float _2084 = 1.0 / _2066;
                    float _2086 = -_2070;
                    float _2088 = fma(_2016, _2006, _2086);
                    float _2090 = fma(_2034, _1998, _2064);
                    float _2092 = fma(_2074, _1998, _2078);
                    float _2094 = fma(_2044, _1998, _2082);
                    float _2096 = fma(_2050, _2000, _2090);
                    float _2098 = fma(_2060, _2000, _2092);
                    float _2100 = fma(_2088, _2000, _2094);
                    float _2102 = _2084 * _2096;
                    float _2104 = _2084 * _2098;
                    float _2106 = _2084 * _2100;
                    _2108 = _2104;
                    _2110 = _2102;
                    _2112 = _2106;
                    _2114 = true;
                }
                else
                {
                    float _2116 = fma(_1998, _528, _530);
                    float _2118 = fma(_1998, _532, _534);
                    float _2120 = fma(_1998, _536, _538);
                    float _2122 = fma(_2000, _540, _2116);
                    float _2124 = fma(_2000, _542, _2118);
                    float _2126 = fma(_2000, _544, _2120);
                    _2108 = _2124;
                    _2110 = _2122;
                    _2112 = _2126;
                }
                _2114 = false;
                float _2128 = _2108;
                float _2130 = _2110;
                float _2132 = _2112;
                float _2134 = _2128 * _2128;
                float _2136 = -_1876;
                float _2138 = _2136 + _1872;
                float _2140 = fma(_2130, _2130, _2134);
                float _2142 = _2138 + _1464;
                float _2144 = fma(_2132, _2132, _2140);
                float _2146 = rsqrt(_2144);
                float _2148 = _2146 * _2128;
                float _2150 = _2146 * _2130;
                float _2152 = _2146 * _2132;
                float _2154 = _2148 * _1438;
                float _2156 = fma(_2150, _1472, _2154);
                float _2158 = fma(_2152, _1474, _2156);
                float _2160 = _2148 * _2158;
                float _2162 = _2150 * _2158;
                float _2164 = _2152 * _2158;
                float _2166 = -_2160;
                float _2168 = _2166 + _1438;
                float _2170 = _1864 * _2162;
                float _2172 = _1864 * _2160;
                float _2174 = -_2162;
                float _2176 = _2174 + _1472;
                float _2178 = -_2164;
                float _2180 = _2178 + _1474;
                float _2182 = _1864 * _2164;
                float _2184 = -_2172;
                float _2186 = fma(_1870, _2168, _2184);
                float _2188 = -_2170;
                float _2190 = fma(_1870, _2176, _2188);
                float _2192 = -_2182;
                float _2194 = fma(_1870, _2180, _2192);
                _1492 = _2142;
                _1494 = _2190;
                _1496 = _2186;
                _1498 = _2194;
            }
        }
    }
    float _2196 = _1492;
    float _2198 = _1494;
    float _2200 = _1496;
    float _2202 = _1498;
    int _2204 = _236 + 4;
    int _2206 = _236 + 8;
    uint _2208 = uint(int(uint(_238) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2208)] = as_type<uint>(_562);
    float _2210 = -_274;
    float _2212 = _2210 + _2196;
    uint _2214 = uint(int(uint(_236) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2214)] = as_type<uint>(_602);
    uint _2216 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2216)] = as_type<uint>(_2196);
    uint _2218 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2218)] = as_type<uint>(_596);
    uint _2220 = uint(int(uint(_236) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2220)] = as_type<uint>(_2198);
    uint _2222 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2222)] = as_type<uint>(_2200);
    uint _2224 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2224)] = as_type<uint>(_2202);
    uint _2226 = uint(int(uint(_236) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2226)] = as_type<uint>(_586);
    uint _2228 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2228)] = as_type<uint>(_2212);
    uint _2230 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2230)] = as_type<uint>(_584);
    float _2232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2234 = _2212 * _2212;
    float _2236 = _2200 * _2200;
    float _2238 = fma(_586, _586, _2234);
    float _2240 = fma(_2198, _2198, _2236);
    float _2242 = fma(_584, _584, _2238);
    float _2244 = fma(_2202, _2202, _2240);
    float _2246 = sqrt(_2242);
    float _2248 = sqrt(_2244);
    bool _2250 = _2246 >= 9.9999999747524270787835121154785e-07;
    bool _2252 = isnan(_2246);
    bool _2254 = _2250 || _2252;
    bool _2256 = isnan(9.9999999747524270787835121154785e-07);
    bool _2258 = _2254 || _2256;
    int _2274;
    if (!_2258)
    {
        bool _2260 = _546 != _300;
        bool _2262 = isnan(_546);
        bool _2264 = _2260 || _2262;
        bool _2266 = isnan(_300);
        bool _2268 = _2264 || _2266;
        if (_2268)
        {
            _624 = as_type<int>(_284);
        }
        int _2270 = _624;
        int _2272 = _2270;
        _2274 = _2270;
        if (_2268)
        {
            _626 = as_type<int>(_296);
        }
        int _2276 = _626;
        int _2278 = _2276;
        _630 = _2276;
        _2280 = _2268;
        if (!_2280)
        {
            float _2282 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2284 = _2282 > 0.0;
            bool _2286 = !_2284;
            if (!_2286)
            {
                float _2288 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2290 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2292 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2294 = _2290 * _2290;
                float _2296 = fma(_2288, _2288, _2294);
                float _2298 = fma(_2292, _2292, _2296);
                float _2300 = rsqrt(_2298);
                float _2302 = _2300 * 9.9999999747524270787835121154785e-07;
                float _2304 = _2288 * _2302;
                float _2306 = _2290 * _2302;
                float _2308 = _2292 * _2302;
                _2274 = as_type<int>(_2304);
                _348 = as_type<int>(_2306);
                _630 = as_type<int>(_2308);
                _2280 = true;
            }
            else
            {
                bool _2310 = _2248 >= 9.9999999747524270787835121154785e-07;
                bool _2312 = isnan(_2248);
                bool _2314 = _2310 || _2312;
                bool _2316 = isnan(9.9999999747524270787835121154785e-07);
                bool _2318 = _2314 || _2316;
                if (!_2318)
                {
                    float _2320 = _2196 * _2196;
                    float _2322 = fma(_602, _602, _2320);
                    float _2324 = fma(_596, _596, _2322);
                    float _2326 = sqrt(_2324);
                    bool _2328 = _2326 >= 9.9999999747524270787835121154785e-07;
                    bool _2330 = isnan(_2326);
                    bool _2332 = _2328 || _2330;
                    bool _2334 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2336 = _2332 || _2334;
                    float _2338 = _2326;
                    if (_2336)
                    {
                        float _2340 = rsqrt(_2324);
                        _2338 = _2340;
                    }
                    float _2342 = _2338;
                    if (!_2336)
                    {
                        _2272 = 0;
                    }
                    int _2344 = _2272;
                    int _2346 = _2344;
                    if (!_2336)
                    {
                        _344 = 897988541;
                    }
                    int _2348 = _344;
                    int _2350 = _2348;
                    if (!_2336)
                    {
                        _2278 = 0;
                    }
                    int _2352 = _2278;
                    float _2354 = _2342;
                    int _2356 = _2352;
                    if (_2336)
                    {
                        float _2358 = _2342 * 9.9999999747524270787835121154785e-07;
                        _2354 = _2358;
                    }
                    float _2360 = _2354;
                    if (_2336)
                    {
                        float _2362 = _602 * _2360;
                        _2346 = as_type<int>(_2362);
                    }
                    int _2364 = _2346;
                    _2274 = _2364;
                    if (_2336)
                    {
                        float _2366 = _2196 * _2360;
                        _2350 = as_type<int>(_2366);
                    }
                    int _2368 = _2350;
                    _348 = _2368;
                    if (_2336)
                    {
                        float _2370 = _596 * _2360;
                        _2356 = as_type<int>(_2370);
                    }
                    int _2372 = _2356;
                    _630 = _2372;
                    _2280 = true;
                }
                else
                {
                    float _2374 = rsqrt(_2244);
                    float _2376 = _2374 * 9.9999999747524270787835121154785e-07;
                    float _2378 = _2198 * _2376;
                    float _2380 = _2200 * _2376;
                    float _2382 = _2202 * _2376;
                    _2274 = as_type<int>(_2378);
                    _348 = as_type<int>(_2380);
                    _630 = as_type<int>(_2382);
                    _2280 = true;
                }
            }
        }
    }
    else
    {
        float _2384 = _2248 * _2232;
        bool _2386 = _2384 >= 0.001000000047497451305389404296875;
        bool _2388 = isnan(_2384);
        bool _2390 = _2386 || _2388;
        bool _2392 = isnan(0.001000000047497451305389404296875);
        bool _2394 = _2390 || _2392;
        bool _2396 = _2384 > 0.0;
        bool _2398 = !_2394;
        bool _2400 = _2396 && _2398;
        bool _2402 = _2246 < 0.001000000047497451305389404296875;
        bool _2404 = _2402 && _2400;
        if (!_2404)
        {
            _346 = as_type<int>(_2212);
        }
        int _2406 = _346;
        int _2408 = _2406;
        if (_2404)
        {
            float _2410 = _2232 * _2198;
            _628 = as_type<int>(_2410);
        }
        int _2412 = _628;
        _2274 = _2412;
        if (_2404)
        {
            float _2414 = _2232 * _2200;
            _2408 = as_type<int>(_2414);
        }
        int _2416 = _2408;
        _348 = _2416;
        if (_2404)
        {
            float _2418 = _2232 * _2202;
            _630 = as_type<int>(_2418);
        }
    }
    _2280 = false;
    int _2420 = _2274;
    int _2422 = _348;
    int _2424 = _630;
    uint _2426 = uint(int(uint(_236) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2426)] = uint(_2420);
    uint _2428 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2428)] = uint(_2422);
    uint _2430 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_2430)] = uint(_2424);
}

