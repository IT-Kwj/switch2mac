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
    bool _3518 = false;
    bool _2264 = false;
    bool _1376 = false;
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
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _180 = as_type<int>(_164) & 512;
    bool _182 = _180 != 0;
    float _184 = 0.0;
    float _186 = 0.0;
    float _188 = 0.0;
    float _190 = _164;
    if (_182)
    {
        float _192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _184 = _192;
        _186 = _194;
        _188 = _196;
    }
    float _198 = _184;
    float _200 = _186;
    float _202 = _188;
    float _204 = 0.0;
    float _206 = 0.0;
    float _208 = 0.0;
    if (_182)
    {
        float _210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _204 = _210;
        _206 = _212;
        _208 = _214;
    }
    float _216 = _204;
    float _218 = _206;
    float _220 = _208;
    float _222 = as_type<float>(_152);
    float _224 = _154;
    float _226 = _156;
    if (_182)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _222 = _228;
        _224 = _230;
        _226 = _232;
    }
    float _234 = _222;
    float _236 = _224;
    float _238 = _226;
    int _240 = _75 << 4;
    int _242 = _240 + 12;
    uint _244 = uint(int(uint(_240) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_244)]);
    int _248 = _240 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_250)]);
    int _254 = _240 + 8;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_256)]);
    int _260 = _240 + 12;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_262)]);
    uint _266 = uint(int(uint(_242) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_266)]);
    uint _270 = uint(int(uint(_240) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_270)]);
    int _274 = _240 + 4;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_276)]);
    int _280 = _240 + 8;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_282)]);
    uint _286 = uint(int(uint(_242) >> uint(2)));
    float _288 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_286)]);
    uint _290 = uint(int(uint(_240) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_290)]);
    int _294 = _240 + 4;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_296)]);
    int _300 = _240 + 8;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_302)]);
    float _306 = _218;
    float _308 = _200;
    float _310 = _236;
    float _312 = _216;
    float _314 = _220;
    float _316 = _198;
    float _318 = _202;
    float _320 = _238;
    float _322 = _234;
    float _324 = _264;
    float _326 = _172;
    float _328 = 0.0;
    float _330 = _284;
    float _332 = _272;
    float _334 = _246;
    float _336 = _252;
    float _338 = _258;
    float _340 = _178;
    float _342 = _272;
    float _344 = _284;
    int _346 = as_type<int>(_298);
    int _348 = as_type<int>(_298);
    int _350 = as_type<int>(_298);
    if (!_182)
    {
        int _352 = _240 + 4;
        uint _354 = uint(int(uint(_240) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_354)]);
        int _358 = _240 + 8;
        uint _360 = uint(int(uint(_240) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_360)]);
        uint _364 = uint(int(uint(_352) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_364)]);
        uint _368 = uint(int(uint(_352) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_368)]);
        uint _372 = uint(int(uint(_358) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_372)]);
        uint _376 = uint(int(uint(_240) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_376)]);
        uint _380 = uint(int(uint(_358) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_380)]);
        uint _384 = uint(int(uint(_352) >> uint(2)));
        float _386 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_384)]);
        uint _388 = uint(int(uint(_358) >> uint(2)));
        float _390 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_388)]);
        float _392 = _356 * _356;
        float _394 = fma(_362, _362, _392);
        float _396 = _366 * _366;
        float _398 = fma(_370, _370, _396);
        float _400 = _374 * _374;
        float _402 = fma(_378, _378, _394);
        float _404 = fma(_382, _382, _400);
        float _406 = sqrt(_402);
        float _408 = fma(_386, _386, _398);
        float _410 = fma(_390, _390, _404);
        float _412 = sqrt(_408);
        float _414 = sqrt(_410);
        bool _416 = _406 > 0.0;
        bool _418 = _412 > 0.0;
        bool _420 = _414 > 0.0;
        float _422 = _412;
        float _424 = _414;
        float _426 = _404;
        float _428 = _356;
        float _430 = _406;
        float _432 = _362;
        float _434 = _398;
        float _436 = _366;
        float _438 = _386;
        float _440 = _378;
        _326 = _410;
        if (_416)
        {
            float _442 = rsqrt(_402);
            _422 = _442;
        }
        float _444 = _422;
        float _446 = _264;
        if (_418)
        {
            float _448 = rsqrt(_408);
            _446 = _448;
        }
        float _450 = _446;
        float _452 = 0.0;
        if (_420)
        {
            float _454 = rsqrt(_410);
            _452 = _454;
        }
        float _456 = _452;
        if (!_416)
        {
            _424 = 0.0;
        }
        float _458 = _424;
        float _460 = _458;
        if (_416)
        {
            float _462 = _356 * _444;
            _460 = _462;
        }
        float _464 = _460;
        _312 = _464;
        if (!_416)
        {
            _426 = 0.0;
        }
        float _466 = _426;
        float _468 = _466;
        if (_416)
        {
            float _470 = _362 * _444;
            _468 = _470;
        }
        float _472 = _468;
        _316 = _472;
        if (!_416)
        {
            _428 = 0.0;
        }
        float _474 = _428;
        float _476 = _474;
        if (_416)
        {
            float _478 = _378 * _444;
            _476 = _478;
        }
        float _480 = _476;
        _322 = _480;
        if (!_418)
        {
            _430 = 0.0;
        }
        float _482 = _430;
        float _484 = _482;
        _324 = _450;
        if (_418)
        {
            float _486 = _366 * _450;
            _484 = _486;
        }
        float _488 = _484;
        _306 = _488;
        if (!_418)
        {
            _432 = 0.0;
        }
        float _490 = _432;
        float _492 = _490;
        if (_418)
        {
            float _494 = _386 * _450;
            _492 = _494;
        }
        float _496 = _492;
        _310 = _496;
        if (!_418)
        {
            _434 = 0.0;
        }
        float _498 = _434;
        float _500 = _498;
        if (_418)
        {
            float _502 = _370 * _450;
            _500 = _502;
        }
        float _504 = _500;
        _308 = _504;
        if (!_420)
        {
            _436 = 0.0;
        }
        float _506 = _436;
        float _508 = _506;
        if (!_420)
        {
            _438 = 0.0;
        }
        float _510 = _438;
        float _512 = _510;
        _328 = _456;
        if (_420)
        {
            float _514 = _374 * _456;
            _508 = _514;
        }
        float _516 = _508;
        _314 = _516;
        if (!_420)
        {
            _440 = 0.0;
        }
        float _518 = _440;
        _320 = _518;
        if (_420)
        {
            float _520 = _382 * _456;
            _512 = _520;
        }
        float _522 = _512;
        _318 = _522;
        if (_420)
        {
            float _524 = _390 * _456;
            _320 = _524;
        }
    }
    float _526 = _306;
    float _528 = _308;
    float _530 = _310;
    float _532 = _312;
    float _534 = _314;
    float _536 = _316;
    float _538 = _318;
    float _540 = _320;
    float _542 = _322;
    float _544 = _324;
    float _546 = _326;
    float _548 = _328;
    float _550 = abs(_178);
    float _552 = log2(_550);
    float _554 = _168 * _176;
    float _556 = _166 * _176;
    float _558 = _554 * _526;
    float _560 = _170 * _176;
    uint _562 = uint(int(uint(_242) >> uint(2)));
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_562)]);
    float _566 = fma(_556, _528, _558);
    int _568 = as_type<int>(_164) & 1024;
    bool _570 = _568 != 0;
    float _572 = -_288;
    float _574 = _174 + _572;
    int _576 = as_type<int>(_164) & 2048;
    bool _578 = _576 != 0;
    float _580 = fma(_560, _530, _566);
    float _582 = _554 * _532;
    float _584 = _554 * _534;
    float _586 = _162 * _552;
    float _588 = _162 * _580;
    float _590 = fma(_556, _536, _582);
    float _592 = fma(_556, _538, _584);
    float _594 = exp2(_586);
    float _596 = _268 * _162;
    float _598 = fma(_560, _540, _592);
    float _600 = fma(_252, _596, _278);
    float _602 = _162 * _598;
    float _604 = fma(_560, _542, _590);
    float _606 = _162 * _604;
    float _608 = _258 * _596;
    float _610 = _246 * _596;
    float _612 = fma(_252, _594, _588);
    float _614 = fma(_246, _594, _606);
    float _616 = fma(_258, _594, _602);
    float _618 = _284 + _608;
    float _620 = _272 + _610;
    bool _622 = _612 >= 0.0;
    bool _624 = isnan(_612);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = _612;
    float _634 = _600;
    float _636 = _544;
    float _638 = _590;
    float _640 = _602;
    float _642 = _588;
    float _644 = _546;
    float _646 = _560;
    float _648 = _548;
    float _650 = 0.0;
    float _652 = 0.0;
    float _654 = _614;
    float _656 = _616;
    float _658 = 0.0;
    float _660 = 0.0;
    bool _662 = _570;
    int _664 = as_type<int>(_610);
    int _666 = as_type<int>(_608);
    int _668 = as_type<int>(_610);
    int _670 = as_type<int>(_608);
    if (!_630)
    {
        float _672 = _246;
        float _674 = _252;
        float _676 = _258;
        float _678 = _544;
        if (_182)
        {
            float _680 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _672 = _680;
            _674 = _682;
            _676 = _684;
            _678 = _686;
        }
        float _688 = _672;
        float _690 = _674;
        float _692 = _676;
        float _694 = _678;
        float _696 = _590;
        float _698 = _602;
        float _700 = _588;
        float _702 = _546;
        if (_182)
        {
            float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _696 = _704;
            _698 = _706;
            _700 = _708;
            _702 = _710;
        }
        float _712 = _696;
        float _714 = _698;
        float _716 = _700;
        float _718 = _702;
        float _720 = _178;
        float _722 = _560;
        float _724 = _548;
        float _726 = _164;
        if (_182)
        {
            float _728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _730 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _734 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _720 = _728;
            _722 = _730;
            _724 = _732;
            _726 = _734;
        }
        float _736 = _720;
        float _738 = _722;
        float _740 = _724;
        float _742 = _726;
        if (!_182)
        {
            _330 = 0.0;
        }
        float _744 = _330;
        float _746 = 0.0;
        float _748 = _744;
        if (!_182)
        {
            _746 = 0.0;
        }
        float _750 = _746;
        float _752 = _692;
        float _754 = _750;
        float _756 = _694;
        float _758 = _690;
        _660 = 6.2500002968590706586837768554688e-05;
        if (_182)
        {
            float _760 = _600 * _690;
            _332 = _760;
        }
        float _762 = _332;
        float _764 = _714;
        float _766 = _762;
        float _768 = _738;
        float _770 = _712;
        float _772 = _740;
        float _774 = _742;
        float _776 = _736;
        float _778 = _716;
        float _780 = _718;
        if (_182)
        {
            float _782 = _600 * _714;
            _764 = _782;
        }
        float _784 = _764;
        float _786 = _784;
        if (_182)
        {
            float _788 = fma(_620, _688, _762);
            _766 = _788;
        }
        float _790 = _766;
        float _792 = _790;
        if (_182)
        {
            float _794 = _600 * _738;
            _768 = _794;
        }
        float _796 = _768;
        float _798 = _796;
        if (_182)
        {
            float _800 = fma(_620, _712, _784);
            _770 = _800;
        }
        float _802 = _770;
        float _804 = _802;
        if (_182)
        {
            float _806 = fma(_618, _692, _790);
            _752 = _806;
        }
        float _808 = _752;
        float _810 = _808;
        if (_182)
        {
            float _812 = fma(_620, _736, _796);
            _798 = _812;
        }
        float _814 = _798;
        float _816 = _814;
        if (_182)
        {
            float _818 = fma(_618, _716, _802);
            _804 = _818;
        }
        float _820 = _804;
        float _822 = _820;
        if (!_182)
        {
            _792 = 0.0;
        }
        float _824 = _792;
        float _826 = _824;
        if (_182)
        {
            float _828 = _694 + _808;
            _748 = _828;
        }
        float _830 = _748;
        if (_182)
        {
            float _832 = fma(_618, _740, _814);
            _772 = _832;
        }
        float _834 = _772;
        float _836 = _834;
        if (_182)
        {
            float _838 = _718 + _820;
            _826 = _838;
        }
        float _840 = _826;
        if (_182)
        {
            float _842 = _742 + _834;
            _754 = _842;
        }
        float _844 = _754;
        float _846 = _844;
        if (!_570)
        {
            _774 = _830;
        }
        float _848 = _774;
        float _850 = _848;
        if (!_570)
        {
            _756 = _840;
        }
        float _852 = _756;
        bool _854 = !_570;
        float _856 = _852;
        if (!_854)
        {
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _860 = uint(int(uint(_240) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_860)]);
            int _864 = _240 + 4;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_866)]);
            int _870 = _240 + 8;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_872)]);
            uint _876 = uint(int(uint(_240) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_876)]);
            int _880 = _240 + 4;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_882)]);
            int _886 = _240 + 8;
            uint _888 = uint(int(uint(_886) >> uint(2)));
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_888)]);
            int _892 = _240 + 12;
            uint _894 = uint(int(uint(_892) >> uint(2)));
            float _896 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_894)]);
            uint _898 = uint(int(uint(_240) >> uint(2)));
            float _900 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_898)]);
            int _902 = _240 + 4;
            uint _904 = uint(int(uint(_902) >> uint(2)));
            float _906 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_904)]);
            int _908 = _240 + 8;
            uint _910 = uint(int(uint(_908) >> uint(2)));
            float _912 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_910)]);
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _916 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _918 = _600 * _868;
            float _920 = _600 * _884;
            float _922 = _600 * _906;
            float _924 = fma(_620, _862, _918);
            float _926 = fma(_620, _878, _920);
            float _928 = fma(_620, _900, _922);
            float _930 = fma(_618, _874, _924);
            float _932 = fma(_618, _890, _926);
            float _934 = fma(_618, _912, _928);
            float _936 = _858 + _930;
            float _938 = _914 + _932;
            float _940 = _916 + _934;
            _776 = _924;
            _816 = _868;
            _836 = _874;
            _850 = _936;
            _822 = _878;
            _786 = _926;
            _778 = _932;
            _780 = _896;
            _758 = _934;
            _810 = _912;
            _856 = _940;
            _846 = _938;
        }
        float _942 = _776;
        float _944 = _816;
        float _946 = _836;
        float _948 = _850;
        float _950 = _822;
        float _952 = _786;
        float _954 = _778;
        float _956 = _780;
        float _958 = _758;
        float _960 = _810;
        float _962 = _856;
        float _964 = _846;
        bool _966 = !_578;
        float _968 = _948;
        float _970 = _962;
        float _972 = _964;
        float _974 = _958;
        float _976 = _950;
        float _978 = _952;
        float _980 = _954;
        float _982 = _956;
        float _984 = _942;
        float _986 = _960;
        float _988 = _944;
        float _990 = _946;
        if (!_966)
        {
            uint _992 = uint(int(uint(_240) >> uint(2)));
            float _994 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_992)]);
            int _996 = _240 + 4;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            float _1000 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_998)]);
            int _1002 = _240 + 8;
            uint _1004 = uint(int(uint(_1002) >> uint(2)));
            float _1006 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1004)]);
            int _1008 = _240 + 12;
            uint _1010 = uint(int(uint(_1008) >> uint(2)));
            float _1012 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1010)]);
            uint _1014 = uint(int(uint(_240) >> uint(2)));
            float _1016 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1014)]);
            int _1018 = _240 + 4;
            uint _1020 = uint(int(uint(_1018) >> uint(2)));
            float _1022 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1020)]);
            int _1024 = _240 + 8;
            uint _1026 = uint(int(uint(_1024) >> uint(2)));
            float _1028 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1026)]);
            int _1030 = _240 + 12;
            uint _1032 = uint(int(uint(_1030) >> uint(2)));
            float _1034 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1032)]);
            uint _1036 = uint(int(uint(_240) >> uint(2)));
            float _1038 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1036)]);
            int _1040 = _240 + 4;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1042)]);
            int _1046 = _240 + 8;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1048)]);
            int _1052 = _240 + 12;
            uint _1054 = uint(int(uint(_1052) >> uint(2)));
            float _1056 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1054)]);
            float _1058 = _600 * _1000;
            float _1060 = _600 * _1022;
            float _1062 = _600 * _1044;
            float _1064 = fma(_620, _994, _1058);
            float _1066 = fma(_620, _1016, _1060);
            float _1068 = fma(_620, _1038, _1062);
            float _1070 = fma(_618, _1006, _1064);
            float _1072 = fma(_618, _1028, _1066);
            float _1074 = fma(_618, _1050, _1068);
            float _1076 = _1070 + _1012;
            float _1078 = _1072 + _1034;
            float _1080 = _1074 + _1056;
            _968 = _1076;
            _970 = _1080;
            _972 = _1078;
            _974 = _1068;
            _976 = _1016;
            _978 = _1066;
            _980 = _1072;
            _982 = _1034;
            _984 = _994;
            _986 = _1074;
            _988 = _1000;
            _990 = _1006;
        }
        float _1082 = _968;
        float _1084 = _970;
        float _1086 = _972;
        float _1088 = _974;
        float _1090 = _976;
        float _1092 = _978;
        float _1094 = _980;
        float _1096 = _982;
        float _1098 = _984;
        float _1100 = _986;
        float _1102 = _988;
        float _1104 = _990;
        float _1106 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.5);
        float _1108 = fma(_1084, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _5178 = float2(_1106, _1108);
        float _1110 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5178, float2(0.0), isnan(_5178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5178, float2(0.0), isnan(_5178)), level(0.0)).x;
        float _1112 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[71]);
        float _1114 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[68]);
        float _1116 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[69]);
        float _1118 = _1110 * 2000.0;
        float _1120 = -_1112;
        float _1122 = _1120 + _1086;
        float _1124 = _1118 + (-0.300000011920928955078125);
        bool _1126 = _1122 > _1124;
        bool _1128 = _1122 < _1118;
        bool _1130 = _1128 && _1126;
        bool _1132 = !_1130;
        float _1134 = _1106;
        _334 = _1124;
        _336 = _1088;
        _338 = _1100;
        _636 = _1084;
        _638 = _1090;
        _640 = _1092;
        _642 = _1094;
        _644 = _1096;
        _340 = _1098;
        _646 = _1102;
        _648 = _1104;
        _190 = _1082;
        _342 = _1116;
        _344 = _1114;
        _650 = _1122;
        _652 = _1118;
        _658 = _1106;
        if (!_1132)
        {
            float _1136 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1138 = fma(_1082, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _1140 = fma(_1084, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _1142 = fma(_1084, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _5252 = float2(_1136, _1108);
            float _1144 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5252, float2(0.0), isnan(_5252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5252, float2(0.0), isnan(_5252)), level(0.0)).x;
            float2 _5260 = float2(_1138, _1108);
            float _1146 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5260, float2(0.0), isnan(_5260)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5260, float2(0.0), isnan(_5260)), level(0.0)).x;
            float2 _5268 = float2(_1106, _1140);
            float _1148 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5268, float2(0.0), isnan(_5268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5268, float2(0.0), isnan(_5268)), level(0.0)).x;
            float2 _5276 = float2(_1106, _1142);
            float _1150 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5276, float2(0.0), isnan(_5276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5276, float2(0.0), isnan(_5276)), level(0.0)).x;
            float2 _5284 = float2(_1136, _1140);
            float _1152 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5284, float2(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5284, float2(0.0), isnan(_5284)), level(0.0)).x;
            float2 _5292 = float2(_1136, _1142);
            float _1154 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5292, float2(0.0), isnan(_5292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5292, float2(0.0), isnan(_5292)), level(0.0)).x;
            float2 _5300 = float2(_1138, _1140);
            float _1156 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5300, float2(0.0), isnan(_5300)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5300, float2(0.0), isnan(_5300)), level(0.0)).x;
            float2 _5308 = float2(_1138, _1142);
            float _1158 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5308, float2(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5308, float2(0.0), isnan(_5308)), level(0.0)).x;
            float _1160 = -_1144;
            float _1162 = _1110 + _1160;
            float _1164 = -_1146;
            float _1166 = _1110 + _1164;
            float _1168 = -_1148;
            float _1170 = _1110 + _1168;
            float _1172 = -_1150;
            float _1174 = _1110 + _1172;
            float _1176 = -_1152;
            float _1178 = _1110 + _1176;
            float _1180 = -_1154;
            float _1182 = _1110 + _1180;
            float _1184 = -_1156;
            float _1186 = _1110 + _1184;
            float _1188 = -_1158;
            float _1190 = _1110 + _1188;
            float _1192 = abs(_1162);
            float _1194 = abs(_1166);
            float _1196 = precise::max(_1192, _1194);
            float _1198 = abs(_1170);
            float _1200 = abs(_1174);
            float _1202 = precise::max(_1198, _1200);
            float _1204 = abs(_1178);
            float _1206 = abs(_1182);
            float _1208 = precise::max(_1204, _1206);
            float _1210 = precise::max(_1196, _1202);
            float _1212 = abs(_1186);
            float _1214 = abs(_1190);
            float _1216 = precise::max(_1212, _1214);
            bool _1218 = _1210 > 0.00150000001303851604461669921875;
            float _1220 = precise::max(_1208, _1216);
            bool _1222 = _1220 <= 0.00150000001303851604461669921875;
            bool _1224 = isnan(_1220);
            bool _1226 = _1222 || _1224;
            bool _1228 = isnan(0.00150000001303851604461669921875);
            bool _1230 = _1226 || _1228;
            bool _1232 = !_1218;
            bool _1234 = _1230 && _1232;
            bool _1236 = !_1234;
            float _1238 = _1220;
            float _1240 = _1186;
            float _1242 = _1216;
            float _1244 = _1196;
            float _1246 = _1166;
            float _1248 = _1138;
            float _1250 = _1144;
            _334 = _1136;
            _336 = _1170;
            _338 = _1140;
            _636 = _1142;
            _638 = _1210;
            _640 = _1220;
            _642 = _1182;
            _644 = _1186;
            _340 = _1216;
            _646 = _1196;
            _648 = _1166;
            _190 = _1138;
            _660 = _1144;
            if (!_1236)
            {
                float _1252 = -_1110;
                float _1254 = _1252 + _1144;
                float _1256 = -_1110;
                float _1258 = _1256 + _1148;
                float _1260 = _1254 * 2000.0;
                float _1262 = _1258 * 2000.0;
                bool _1264 = !_182;
                float _1370;
                float _1372;
                float _1374;
                if (!_1264)
                {
                    float _1266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _1270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _1272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _1274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _1276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _1278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _1282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _1284 = _1270 * _1272;
                    float _1286 = _1270 * _1274;
                    float _1288 = _1268 * _1272;
                    float _1290 = -_1284;
                    float _1292 = fma(_1266, _1276, _1290);
                    float _1294 = -_1286;
                    float _1296 = fma(_1268, _1276, _1294);
                    float _1298 = -_1288;
                    float _1300 = fma(_1266, _1274, _1298);
                    float _1302 = _1282 * _1268;
                    float _1304 = _1292 * _1280;
                    float _1306 = _1278 * _1270;
                    float _1308 = _1280 * _1266;
                    float _1310 = -_1302;
                    float _1312 = fma(_1280, _1270, _1310);
                    float _1314 = -_1304;
                    float _1316 = fma(_1296, _1278, _1314);
                    float _1318 = _1280 * _1276;
                    float _1320 = -_1306;
                    float _1322 = fma(_1282, _1266, _1320);
                    float _1324 = _1282 * _1272;
                    float _1326 = fma(_1300, _1282, _1316);
                    float _1328 = -_1318;
                    float _1330 = fma(_1282, _1274, _1328);
                    float _1332 = _1278 * _1274;
                    float _1334 = -_1266;
                    float _1336 = fma(_1334, _1276, _1284);
                    float _1338 = -_1324;
                    float _1340 = fma(_1278, _1276, _1338);
                    float _1342 = -_1308;
                    float _1344 = fma(_1278, _1268, _1342);
                    float _1346 = 1.0 / _1326;
                    float _1348 = -_1332;
                    float _1350 = fma(_1280, _1272, _1348);
                    float _1352 = fma(_1260, _1296, _1330);
                    float _1354 = fma(_1260, _1336, _1340);
                    float _1356 = fma(_1260, _1300, _1350);
                    float _1358 = fma(_1262, _1312, _1352);
                    float _1360 = fma(_1262, _1322, _1354);
                    float _1362 = fma(_1262, _1344, _1356);
                    float _1364 = _1346 * _1358;
                    float _1366 = _1346 * _1360;
                    float _1368 = _1346 * _1362;
                    _1370 = _1366;
                    _1372 = _1364;
                    _1374 = _1368;
                    _1238 = _1268;
                    _1240 = _1284;
                    _1242 = _1278;
                    _1244 = _1356;
                    _1246 = _1332;
                    _1248 = _1346;
                    _1134 = _1354;
                    _1250 = _1300;
                    _1376 = true;
                }
                else
                {
                    float _1378 = fma(_1260, _536, _532);
                    float _1380 = fma(_1260, _528, _526);
                    float _1382 = fma(_1260, _538, _534);
                    float _1384 = fma(_1262, _542, _1378);
                    float _1386 = fma(_1262, _530, _1380);
                    float _1388 = fma(_1262, _540, _1382);
                    _1370 = _1386;
                    _1372 = _1384;
                    _1374 = _1388;
                }
                _1376 = false;
                float _1390 = _1370;
                float _1392 = _1372;
                float _1394 = _1374;
                float _1396 = _1238;
                float _1398 = _1240;
                float _1400 = _1242;
                float _1402 = _1244;
                float _1404 = _1246;
                float _1406 = _1248;
                float _1408 = _1134;
                float _1410 = _1250;
                float _1412 = _1390 * _1390;
                float _1414 = -_1122;
                float _1416 = _1414 + _1118;
                float _1418 = fma(_1392, _1392, _1412);
                float _1420 = _600 + _1416;
                float _1422 = fma(_1394, _1394, _1418);
                float _1424 = rsqrt(_1422);
                float _1426 = _1424 * _1390;
                float _1428 = _1424 * _1392;
                float _1430 = _1424 * _1394;
                float _1432 = _612 * _1426;
                float _1434 = fma(_614, _1428, _1432);
                float _1436 = fma(_616, _1430, _1434);
                float _1438 = _1426 * _1436;
                float _1440 = _1428 * _1436;
                float _1442 = _1430 * _1436;
                float _1444 = -_1438;
                float _1446 = _612 + _1444;
                float _1448 = _1114 * _1440;
                float _1450 = _1114 * _1438;
                float _1452 = -_1440;
                float _1454 = _614 + _1452;
                float _1456 = -_1442;
                float _1458 = _616 + _1456;
                float _1460 = _1114 * _1442;
                float _1462 = -_1450;
                float _1464 = fma(_1116, _1446, _1462);
                float _1466 = -_1448;
                float _1468 = fma(_1116, _1454, _1466);
                float _1470 = -_1460;
                float _1472 = fma(_1116, _1458, _1470);
                _632 = _1464;
                _634 = _1420;
                _334 = _1442;
                _336 = _1448;
                _338 = _1440;
                _636 = _1424;
                _638 = _1450;
                _640 = _1396;
                _642 = _1434;
                _644 = _1398;
                _340 = _1400;
                _646 = _1402;
                _648 = _1404;
                _190 = _1406;
                _344 = _1460;
                _650 = _1416;
                _654 = _1468;
                _656 = _1472;
                _658 = _1408;
                _660 = _1410;
            }
        }
    }
    float _1474 = _632;
    float _1476 = _634;
    float _1478 = _334;
    float _1480 = _336;
    float _1482 = _338;
    float _1484 = _636;
    float _1486 = _638;
    float _1488 = _640;
    float _1490 = _642;
    float _1492 = _644;
    float _1494 = _340;
    float _1496 = _646;
    float _1498 = _648;
    float _1500 = _190;
    float _1502 = _342;
    float _1504 = _344;
    float _1506 = _650;
    float _1508 = _652;
    float _1510 = _654;
    float _1512 = _656;
    float _1514 = _658;
    float _1516 = _660;
    bool _1518 = _1474 >= 0.0;
    bool _1520 = isnan(_1474);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = _1502;
    float _1530 = _1504;
    float _1532 = _1508;
    float _1534 = _1506;
    float _1536 = _1508;
    float _1538 = _1514;
    float _1540 = _1494;
    float _1542 = _1496;
    float _1544 = _1498;
    float _1546 = _1500;
    float _1548 = _1486;
    float _1550 = _1488;
    float _1552 = _1490;
    float _1554 = _1492;
    float _1556 = _1516;
    float _1558 = _1510;
    float _1560 = _1474;
    float _1562 = _1512;
    if (_1526)
    {
        _1528 = _1476;
    }
    float _1564 = _1528;
    float _1566 = _1564;
    float _1568 = _1564;
    if (!_1526)
    {
        float _1570 = _1478;
        float _1572 = _1480;
        float _1574 = _1482;
        float _1576 = _1484;
        if (_182)
        {
            float _1578 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1582 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1584 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1570 = _1578;
            _1572 = _1580;
            _1574 = _1582;
            _1576 = _1584;
        }
        float _1586 = _1570;
        float _1588 = _1572;
        float _1590 = _1574;
        float _1592 = _1576;
        float _1594 = _1486;
        float _1596 = _1488;
        float _1598 = _1490;
        float _1600 = _1492;
        if (_182)
        {
            float _1602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1608 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1594 = _1602;
            _1596 = _1604;
            _1598 = _1606;
            _1600 = _1608;
        }
        float _1610 = _1594;
        float _1612 = _1596;
        float _1614 = _1598;
        float _1616 = _1600;
        float _1618 = _1494;
        float _1620 = _1496;
        float _1622 = _1498;
        float _1624 = _1500;
        if (_182)
        {
            float _1626 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1628 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1630 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1632 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1618 = _1626;
            _1620 = _1628;
            _1622 = _1630;
            _1624 = _1632;
        }
        float _1634 = _1618;
        float _1636 = _1620;
        float _1638 = _1622;
        float _1640 = _1624;
        if (!_182)
        {
            _1530 = 0.0;
        }
        float _1642 = _1530;
        float _1644 = _1642;
        if (!_182)
        {
            _1532 = 0.0;
        }
        float _1646 = _1532;
        float _1648 = _1590;
        float _1650 = _1646;
        float _1652 = _1592;
        _1556 = 6.2500002968590706586837768554688e-05;
        if (_182)
        {
            float _1654 = _1588 * _1476;
            _1566 = _1654;
        }
        float _1656 = _1566;
        float _1658 = _1612;
        float _1660 = _1656;
        float _1662 = _1610;
        float _1664 = _1614;
        float _1666 = _1616;
        if (_182)
        {
            float _1668 = _1612 * _1476;
            _1658 = _1668;
        }
        float _1670 = _1658;
        float _1672 = _1670;
        if (_182)
        {
            float _1674 = fma(_620, _1586, _1656);
            _1660 = _1674;
        }
        float _1676 = _1660;
        float _1678 = _1636;
        float _1680 = _1676;
        float _1682 = _1638;
        float _1684 = _1640;
        float _1686 = _1634;
        if (_182)
        {
            float _1688 = _1636 * _1476;
            _1678 = _1688;
        }
        float _1690 = _1678;
        float _1692 = _1690;
        if (_182)
        {
            float _1694 = fma(_620, _1610, _1670);
            _1662 = _1694;
        }
        float _1696 = _1662;
        float _1698 = _1696;
        if (_182)
        {
            float _1700 = fma(_618, _1590, _1676);
            _1648 = _1700;
        }
        float _1702 = _1648;
        if (_182)
        {
            float _1704 = fma(_620, _1634, _1690);
            _1692 = _1704;
        }
        float _1706 = _1692;
        float _1708 = _1706;
        if (_182)
        {
            float _1710 = fma(_618, _1614, _1696);
            _1698 = _1710;
        }
        float _1712 = _1698;
        float _1714 = _1712;
        if (!_182)
        {
            _1680 = 0.0;
        }
        float _1716 = _1680;
        float _1718 = _1716;
        if (_182)
        {
            float _1720 = _1592 + _1702;
            _1644 = _1720;
        }
        float _1722 = _1644;
        if (_182)
        {
            float _1724 = fma(_618, _1638, _1706);
            _1682 = _1724;
        }
        float _1726 = _1682;
        if (_182)
        {
            float _1728 = _1616 + _1712;
            _1718 = _1728;
        }
        float _1730 = _1718;
        float _1732 = _1730;
        if (_182)
        {
            float _1734 = _1640 + _1726;
            _1650 = _1734;
        }
        float _1736 = _1650;
        float _1738 = _1736;
        if (!_570)
        {
            _1684 = _1722;
        }
        float _1740 = _1684;
        float _1742 = _1740;
        if (!_570)
        {
            _1652 = _1730;
        }
        float _1744 = _1652;
        bool _1746 = !_570;
        float _1748 = _1744;
        if (!_1746)
        {
            float _1750 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _1752 = uint(int(uint(_240) >> uint(2)));
            float _1754 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1752)]);
            int _1756 = _240 + 4;
            uint _1758 = uint(int(uint(_1756) >> uint(2)));
            float _1760 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1758)]);
            int _1762 = _240 + 8;
            uint _1764 = uint(int(uint(_1762) >> uint(2)));
            float _1766 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1764)]);
            uint _1768 = uint(int(uint(_240) >> uint(2)));
            float _1770 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1768)]);
            int _1772 = _240 + 4;
            uint _1774 = uint(int(uint(_1772) >> uint(2)));
            float _1776 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1774)]);
            int _1778 = _240 + 8;
            uint _1780 = uint(int(uint(_1778) >> uint(2)));
            float _1782 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1780)]);
            int _1784 = _240 + 12;
            uint _1786 = uint(int(uint(_1784) >> uint(2)));
            float _1788 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1786)]);
            uint _1790 = uint(int(uint(_240) >> uint(2)));
            float _1792 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1790)]);
            int _1794 = _240 + 4;
            uint _1796 = uint(int(uint(_1794) >> uint(2)));
            float _1798 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1796)]);
            int _1800 = _240 + 8;
            uint _1802 = uint(int(uint(_1800) >> uint(2)));
            float _1804 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1802)]);
            float _1806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1810 = _1760 * _1476;
            float _1812 = _1776 * _1476;
            float _1814 = _1798 * _1476;
            float _1816 = fma(_620, _1754, _1810);
            float _1818 = fma(_620, _1770, _1812);
            float _1820 = fma(_620, _1792, _1814);
            float _1822 = fma(_618, _1766, _1816);
            float _1824 = fma(_618, _1782, _1818);
            float _1826 = fma(_618, _1804, _1820);
            float _1828 = _1750 + _1822;
            float _1830 = _1806 + _1824;
            float _1832 = _1808 + _1826;
            _1686 = _1754;
            _1708 = _1760;
            _1742 = _1828;
            _1714 = _1770;
            _1672 = _1824;
            _1664 = _1782;
            _1666 = _1788;
            _1748 = _1832;
            _1738 = _1830;
            _1732 = _1822;
        }
        float _1834 = _1686;
        float _1836 = _1708;
        float _1838 = _1742;
        float _1840 = _1714;
        float _1842 = _1672;
        float _1844 = _1664;
        float _1846 = _1666;
        float _1848 = _1748;
        float _1850 = _1738;
        float _1852 = _1732;
        bool _1854 = !_578;
        float _1856 = _1838;
        float _1858 = _1848;
        float _1860 = _1850;
        float _1862 = _1840;
        float _1864 = _1842;
        float _1866 = _1844;
        float _1868 = _1846;
        float _1870 = _1834;
        float _1872 = _1836;
        float _1874 = _1852;
        if (!_1854)
        {
            uint _1876 = uint(int(uint(_240) >> uint(2)));
            float _1878 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1876)]);
            int _1880 = _240 + 4;
            uint _1882 = uint(int(uint(_1880) >> uint(2)));
            float _1884 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1882)]);
            int _1886 = _240 + 8;
            uint _1888 = uint(int(uint(_1886) >> uint(2)));
            float _1890 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1888)]);
            int _1892 = _240 + 12;
            uint _1894 = uint(int(uint(_1892) >> uint(2)));
            float _1896 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1894)]);
            uint _1898 = uint(int(uint(_240) >> uint(2)));
            float _1900 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1898)]);
            int _1902 = _240 + 4;
            uint _1904 = uint(int(uint(_1902) >> uint(2)));
            float _1906 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1904)]);
            int _1908 = _240 + 8;
            uint _1910 = uint(int(uint(_1908) >> uint(2)));
            float _1912 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1910)]);
            int _1914 = _240 + 12;
            uint _1916 = uint(int(uint(_1914) >> uint(2)));
            float _1918 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1916)]);
            uint _1920 = uint(int(uint(_240) >> uint(2)));
            float _1922 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1920)]);
            int _1924 = _240 + 4;
            uint _1926 = uint(int(uint(_1924) >> uint(2)));
            float _1928 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1926)]);
            int _1930 = _240 + 8;
            uint _1932 = uint(int(uint(_1930) >> uint(2)));
            float _1934 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1932)]);
            int _1936 = _240 + 12;
            uint _1938 = uint(int(uint(_1936) >> uint(2)));
            float _1940 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1938)]);
            float _1942 = _1884 * _1476;
            float _1944 = _1906 * _1476;
            float _1946 = _1928 * _1476;
            float _1948 = fma(_620, _1878, _1942);
            float _1950 = fma(_620, _1900, _1944);
            float _1952 = fma(_620, _1922, _1946);
            float _1954 = fma(_618, _1890, _1948);
            float _1956 = fma(_618, _1912, _1950);
            float _1958 = fma(_618, _1934, _1952);
            float _1960 = _1954 + _1896;
            float _1962 = _1956 + _1918;
            float _1964 = _1958 + _1940;
            _1856 = _1960;
            _1858 = _1964;
            _1860 = _1962;
            _1862 = _1900;
            _1864 = _1950;
            _1866 = _1956;
            _1868 = _1918;
            _1870 = _1878;
            _1872 = _1884;
            _1874 = _1954;
        }
        float _1966 = _1856;
        float _1968 = _1858;
        float _1970 = _1860;
        float _1972 = _1862;
        float _1974 = _1864;
        float _1976 = _1866;
        float _1978 = _1868;
        float _1980 = _1870;
        float _1982 = _1872;
        float _1984 = _1874;
        float _1986 = fma(_1966, 6.2500002968590706586837768554688e-05, 0.5);
        float _1988 = fma(_1968, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _6445 = float2(_1986, _1988);
        float _1990 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6445, float2(0.0), isnan(_6445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6445, float2(0.0), isnan(_6445)), level(0.0)).x;
        float _1992 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[71]);
        float _1994 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[68]);
        float _1996 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[69]);
        float _1998 = _1990 * 2000.0;
        float _2000 = -_1992;
        float _2002 = _2000 + _1970;
        float _2004 = _1998 + (-0.300000011920928955078125);
        bool _2006 = _2002 > _2004;
        bool _2008 = _2002 < _1998;
        bool _2010 = _2008 && _2006;
        float _2012 = _1984;
        float _2014 = _1986;
        _1536 = _2002;
        _1538 = _1998;
        _1540 = _1980;
        _1542 = _1982;
        _1544 = _1986;
        _1546 = _1966;
        _1548 = _1972;
        _1550 = _1974;
        _1552 = _1976;
        _1554 = _1978;
        if (!_2010)
        {
            _2012 = _1476;
        }
        float _2016 = _2012;
        bool _2018 = !_2010;
        _1534 = _1994;
        _1568 = _2016;
        if (!_2018)
        {
            float _2020 = fma(_1966, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2022 = fma(_1966, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2024 = fma(_1968, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2026 = fma(_1968, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _6513 = float2(_2020, _1988);
            float _2028 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6513, float2(0.0), isnan(_6513)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6513, float2(0.0), isnan(_6513)), level(0.0)).x;
            float2 _6521 = float2(_2022, _1988);
            float _2030 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6521, float2(0.0), isnan(_6521)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6521, float2(0.0), isnan(_6521)), level(0.0)).x;
            float2 _6529 = float2(_1986, _2024);
            float _2032 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6529, float2(0.0), isnan(_6529)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6529, float2(0.0), isnan(_6529)), level(0.0)).x;
            float2 _6537 = float2(_1986, _2026);
            float _2034 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6537, float2(0.0), isnan(_6537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6537, float2(0.0), isnan(_6537)), level(0.0)).x;
            float2 _6545 = float2(_2020, _2024);
            float _2036 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).x;
            float2 _6553 = float2(_2020, _2026);
            float _2038 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6553, float2(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6553, float2(0.0), isnan(_6553)), level(0.0)).x;
            float2 _6561 = float2(_2022, _2024);
            float _2040 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6561, float2(0.0), isnan(_6561)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6561, float2(0.0), isnan(_6561)), level(0.0)).x;
            float2 _6569 = float2(_2022, _2026);
            float _2042 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6569, float2(0.0), isnan(_6569)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6569, float2(0.0), isnan(_6569)), level(0.0)).x;
            float _2044 = -_2028;
            float _2046 = _1990 + _2044;
            float _2048 = -_2030;
            float _2050 = _1990 + _2048;
            float _2052 = -_2032;
            float _2054 = _1990 + _2052;
            float _2056 = -_2034;
            float _2058 = _1990 + _2056;
            float _2060 = -_2036;
            float _2062 = _1990 + _2060;
            float _2064 = -_2038;
            float _2066 = _1990 + _2064;
            float _2068 = -_2040;
            float _2070 = _1990 + _2068;
            float _2072 = -_2042;
            float _2074 = _1990 + _2072;
            float _2076 = abs(_2046);
            float _2078 = abs(_2050);
            float _2080 = precise::max(_2076, _2078);
            float _2082 = abs(_2054);
            float _2084 = abs(_2058);
            float _2086 = precise::max(_2082, _2084);
            float _2088 = abs(_2062);
            float _2090 = abs(_2066);
            float _2092 = precise::max(_2088, _2090);
            float _2094 = precise::max(_2080, _2086);
            float _2096 = abs(_2070);
            float _2098 = abs(_2074);
            float _2100 = precise::max(_2096, _2098);
            bool _2102 = _2094 > 0.00150000001303851604461669921875;
            float _2104 = precise::max(_2092, _2100);
            bool _2106 = _2104 <= 0.00150000001303851604461669921875;
            bool _2108 = isnan(_2104);
            bool _2110 = _2106 || _2108;
            bool _2112 = isnan(0.00150000001303851604461669921875);
            bool _2114 = _2110 || _2112;
            bool _2116 = !_2102;
            bool _2118 = _2114 && _2116;
            float _2120 = _2020;
            float _2122 = _2094;
            float _2124 = _2050;
            float _2126 = _2022;
            float _2128 = _2104;
            float _2130 = _2066;
            float _2132 = _2070;
            float _2134 = _2100;
            _1540 = _2094;
            _1542 = _2050;
            _1546 = _2022;
            _1548 = _2104;
            _1550 = _2066;
            _1552 = _2070;
            _1554 = _2100;
            _1556 = _2028;
            if (!_2118)
            {
                _2120 = _1476;
            }
            float _2136 = _2120;
            bool _2138 = !_2118;
            _1568 = _2136;
            if (!_2138)
            {
                float _2140 = -_1990;
                float _2142 = _2140 + _2028;
                float _2144 = -_1990;
                float _2146 = _2144 + _2032;
                float _2148 = _2142 * 2000.0;
                float _2150 = _2146 * 2000.0;
                bool _2152 = !_182;
                _1556 = _2150;
                float _2258;
                float _2260;
                float _2262;
                if (!_2152)
                {
                    float _2154 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2156 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2160 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2172 = _2158 * _2160;
                    float _2174 = _2158 * _2162;
                    float _2176 = _2156 * _2160;
                    float _2178 = -_2172;
                    float _2180 = fma(_2154, _2164, _2178);
                    float _2182 = -_2174;
                    float _2184 = fma(_2156, _2164, _2182);
                    float _2186 = _2170 * _2156;
                    float _2188 = _2166 * _2158;
                    float _2190 = _2180 * _2168;
                    float _2192 = -_2176;
                    float _2194 = fma(_2154, _2162, _2192);
                    float _2196 = _2168 * _2164;
                    float _2198 = -_2186;
                    float _2200 = fma(_2168, _2158, _2198);
                    float _2202 = -_2190;
                    float _2204 = fma(_2184, _2166, _2202);
                    float _2206 = _2170 * _2160;
                    float _2208 = _2166 * _2162;
                    float _2210 = -_2188;
                    float _2212 = fma(_2170, _2154, _2210);
                    float _2214 = fma(_2194, _2170, _2204);
                    float _2216 = -_2196;
                    float _2218 = fma(_2170, _2162, _2216);
                    float _2220 = _2168 * _2154;
                    float _2222 = -_2154;
                    float _2224 = fma(_2222, _2164, _2172);
                    float _2226 = -_2206;
                    float _2228 = fma(_2166, _2164, _2226);
                    float _2230 = -_2208;
                    float _2232 = fma(_2168, _2160, _2230);
                    float _2234 = 1.0 / _2214;
                    float _2236 = -_2220;
                    float _2238 = fma(_2166, _2156, _2236);
                    float _2240 = fma(_2184, _2148, _2218);
                    float _2242 = fma(_2224, _2148, _2228);
                    float _2244 = fma(_2194, _2148, _2232);
                    float _2246 = fma(_2200, _2150, _2240);
                    float _2248 = fma(_2212, _2150, _2242);
                    float _2250 = fma(_2238, _2150, _2244);
                    float _2252 = _2234 * _2246;
                    float _2254 = _2234 * _2248;
                    float _2256 = _2234 * _2250;
                    _2258 = _2254;
                    _2260 = _2252;
                    _2262 = _2256;
                    _2122 = _2166;
                    _2124 = _2232;
                    _2014 = _2220;
                    _2126 = _2218;
                    _2128 = _2160;
                    _2130 = _2162;
                    _2132 = _2164;
                    _2134 = _2234;
                    _2264 = true;
                }
                else
                {
                    float _2266 = fma(_2148, _536, _532);
                    float _2268 = fma(_2148, _528, _526);
                    float _2270 = fma(_2148, _538, _534);
                    float _2272 = fma(_2150, _542, _2266);
                    float _2274 = fma(_2150, _530, _2268);
                    float _2276 = fma(_2150, _540, _2270);
                    _2258 = _2274;
                    _2260 = _2272;
                    _2262 = _2276;
                }
                _2264 = false;
                float _2278 = _2258;
                float _2280 = _2260;
                float _2282 = _2262;
                float _2284 = _2122;
                float _2286 = _2124;
                float _2288 = _2014;
                float _2290 = _2126;
                float _2292 = _2128;
                float _2294 = _2130;
                float _2296 = _2132;
                float _2298 = _2134;
                float _2300 = _2278 * _2278;
                float _2302 = -_2002;
                float _2304 = _2302 + _1998;
                float _2306 = fma(_2280, _2280, _2300);
                float _2308 = fma(_2282, _2282, _2306);
                float _2310 = rsqrt(_2308);
                float _2312 = _2310 * _2278;
                float _2314 = _2310 * _2280;
                float _2316 = _2310 * _2282;
                float _2318 = _2312 * _1474;
                float _2320 = fma(_2314, _1510, _2318);
                float _2322 = fma(_2316, _1512, _2320);
                float _2324 = _2314 * _2322;
                float _2326 = _2312 * _2322;
                float _2328 = _2316 * _2322;
                float _2330 = -_2324;
                float _2332 = _2330 + _1510;
                float _2334 = -_2326;
                float _2336 = _2334 + _1474;
                float _2338 = _1994 * _2324;
                float _2340 = -_2328;
                float _2342 = _2340 + _1512;
                float _2344 = _1994 * _2326;
                float _2346 = _1994 * _2328;
                float _2348 = _2304 + _1476;
                float _2350 = -_2338;
                float _2352 = fma(_1996, _2332, _2350);
                float _2354 = -_2344;
                float _2356 = fma(_1996, _2336, _2354);
                float _2358 = -_2346;
                float _2360 = fma(_1996, _2342, _2358);
                _1538 = _2304;
                _1540 = _2284;
                _1542 = _2286;
                _1544 = _2288;
                _1546 = _2290;
                _1548 = _2292;
                _1550 = _2294;
                _1552 = _2296;
                _1554 = _2298;
                _1568 = _2348;
                _1558 = _2352;
                _1560 = _2356;
                _1562 = _2360;
            }
        }
    }
    float _2362 = _1534;
    float _2364 = _1536;
    float _2366 = _1538;
    float _2368 = _1540;
    float _2370 = _1542;
    float _2372 = _1544;
    float _2374 = _1546;
    float _2376 = _1548;
    float _2378 = _1550;
    float _2380 = _1552;
    float _2382 = _1554;
    float _2384 = _1568;
    float _2386 = _1556;
    float _2388 = _1558;
    float _2390 = _1560;
    float _2392 = _1562;
    float _2394 = _1476;
    float _2396 = _2362;
    float _2398 = _2364;
    float _2400 = _2366;
    float _2402 = _2386;
    if (_182)
    {
        float _2404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _2406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _2408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _2410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _2394 = _2404;
        _2396 = _2406;
        _2398 = _2408;
        _2400 = _2410;
    }
    float _2412 = _2394;
    float _2414 = _2396;
    float _2416 = _2398;
    float _2418 = _2400;
    float _2420 = _2368;
    float _2422 = _2370;
    float _2424 = _2372;
    float _2426 = _2374;
    if (_182)
    {
        float _2428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _2430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _2432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _2434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _2420 = _2428;
        _2422 = _2430;
        _2424 = _2432;
        _2426 = _2434;
    }
    float _2436 = _2420;
    float _2438 = _2422;
    float _2440 = _2424;
    float _2442 = _2426;
    float _2444 = _2376;
    float _2446 = _2378;
    float _2448 = _2380;
    float _2450 = _2382;
    if (_182)
    {
        float _2452 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2456 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2458 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2444 = _2452;
        _2446 = _2454;
        _2448 = _2456;
        _2450 = _2458;
    }
    float _2460 = _2444;
    float _2462 = _2446;
    float _2464 = _2448;
    float _2466 = _2450;
    float _2468 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _2470 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _2472 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[18]);
    float _2474 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _2476 = _2412;
    float _2478 = _2416;
    float _2480 = _2418;
    if (_182)
    {
        float _2482 = _2414 * _2384;
        _2402 = _2482;
    }
    float _2484 = _2402;
    float _2486 = _2438;
    float _2488 = _2436;
    float _2490 = _2440;
    float _2492 = _2460;
    float _2494 = _2464;
    if (_182)
    {
        float _2496 = _2438 * _2384;
        _2486 = _2496;
    }
    float _2498 = _2486;
    float _2500 = _2498;
    if (_182)
    {
        float _2502 = fma(_620, _2412, _2484);
        _2476 = _2502;
    }
    float _2504 = _2476;
    float _2506 = _2504;
    if (_182)
    {
        float _2508 = fma(_620, _2436, _2498);
        _2500 = _2508;
    }
    float _2510 = _2500;
    float _2512 = _2510;
    if (_182)
    {
        float _2514 = _2462 * _2384;
        _2488 = _2514;
    }
    float _2516 = _2488;
    float _2518 = _2516;
    if (_182)
    {
        float _2520 = fma(_618, _2416, _2504);
        _2506 = _2520;
    }
    float _2522 = _2506;
    float _2524 = _2522;
    if (_182)
    {
        float _2526 = fma(_618, _2440, _2510);
        _2490 = _2526;
    }
    float _2528 = _2490;
    if (_182)
    {
        float _2530 = fma(_620, _2460, _2516);
        _2478 = _2530;
    }
    float _2532 = _2478;
    float _2534 = _2532;
    if (!_182)
    {
        _2492 = 0.0;
    }
    float _2536 = _2492;
    float _2538 = _2536;
    if (_182)
    {
        float _2540 = _2418 + _2522;
        _2538 = _2540;
    }
    float _2542 = _2538;
    if (!_182)
    {
        _2518 = 0.0;
        _2512 = 0.0;
    }
    float _2544 = _2518;
    float _2546 = _2512;
    float _2548 = _2544;
    float _2550 = _2546;
    if (_182)
    {
        float _2552 = fma(_618, _2464, _2532);
        _2494 = _2552;
    }
    float _2554 = _2494;
    if (_182)
    {
        float _2556 = _2442 + _2528;
        _2548 = _2556;
    }
    float _2558 = _2548;
    float _2560 = _2558;
    if (!_570)
    {
        _2480 = _2542;
    }
    float _2562 = _2480;
    float _2564 = _2562;
    if (_182)
    {
        float _2566 = _2466 + _2554;
        _2550 = _2566;
    }
    float _2568 = _2550;
    bool _2570 = !_570;
    float _2572 = _2568;
    if (!_2570)
    {
        float _2574 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _2576 = uint(int(uint(_240) >> uint(2)));
        float _2578 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2576)]);
        int _2580 = _240 + 4;
        uint _2582 = uint(int(uint(_2580) >> uint(2)));
        float _2584 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2582)]);
        int _2586 = _240 + 8;
        uint _2588 = uint(int(uint(_2586) >> uint(2)));
        float _2590 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2588)]);
        uint _2592 = uint(int(uint(_240) >> uint(2)));
        float _2594 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2592)]);
        int _2596 = _240 + 4;
        uint _2598 = uint(int(uint(_2596) >> uint(2)));
        float _2600 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2598)]);
        int _2602 = _240 + 8;
        uint _2604 = uint(int(uint(_2602) >> uint(2)));
        float _2606 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2604)]);
        uint _2608 = uint(int(uint(_240) >> uint(2)));
        float _2610 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2608)]);
        int _2612 = _240 + 4;
        uint _2614 = uint(int(uint(_2612) >> uint(2)));
        float _2616 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2614)]);
        int _2618 = _240 + 8;
        uint _2620 = uint(int(uint(_2618) >> uint(2)));
        float _2622 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2620)]);
        float _2624 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _2626 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2628 = _2584 * _2384;
        float _2630 = _2600 * _2384;
        float _2632 = fma(_620, _2578, _2628);
        float _2634 = _2616 * _2384;
        float _2636 = fma(_620, _2594, _2630);
        float _2638 = fma(_620, _2610, _2634);
        float _2640 = fma(_618, _2590, _2632);
        float _2642 = fma(_618, _2606, _2636);
        float _2644 = fma(_618, _2622, _2638);
        float _2646 = _2574 + _2640;
        float _2648 = _2624 + _2642;
        float _2650 = _2626 + _2644;
        _2524 = _2642;
        _2534 = _2606;
        _2564 = _2648;
        _2560 = _2646;
        _2572 = _2650;
    }
    float _2652 = _2524;
    float _2654 = _2534;
    float _2656 = _2564;
    float _2658 = _2560;
    float _2660 = _2572;
    bool _2662 = !_578;
    float _2664 = _2658;
    float _2666 = _2656;
    float _2668 = _2660;
    float _2670 = _2652;
    float _2672 = _2654;
    if (!_2662)
    {
        uint _2674 = uint(int(uint(_240) >> uint(2)));
        float _2676 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2674)]);
        int _2678 = _240 + 4;
        uint _2680 = uint(int(uint(_2678) >> uint(2)));
        float _2682 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2680)]);
        int _2684 = _240 + 8;
        uint _2686 = uint(int(uint(_2684) >> uint(2)));
        float _2688 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2686)]);
        int _2690 = _240 + 12;
        uint _2692 = uint(int(uint(_2690) >> uint(2)));
        float _2694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2692)]);
        uint _2696 = uint(int(uint(_240) >> uint(2)));
        float _2698 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2696)]);
        int _2700 = _240 + 4;
        uint _2702 = uint(int(uint(_2700) >> uint(2)));
        float _2704 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2702)]);
        int _2706 = _240 + 8;
        uint _2708 = uint(int(uint(_2706) >> uint(2)));
        float _2710 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2708)]);
        int _2712 = _240 + 12;
        uint _2714 = uint(int(uint(_2712) >> uint(2)));
        float _2716 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2714)]);
        uint _2718 = uint(int(uint(_240) >> uint(2)));
        float _2720 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2718)]);
        int _2722 = _240 + 4;
        uint _2724 = uint(int(uint(_2722) >> uint(2)));
        float _2726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2724)]);
        int _2728 = _240 + 8;
        uint _2730 = uint(int(uint(_2728) >> uint(2)));
        float _2732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2730)]);
        int _2734 = _240 + 12;
        uint _2736 = uint(int(uint(_2734) >> uint(2)));
        float _2738 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2736)]);
        float _2740 = _2682 * _2384;
        float _2742 = _2704 * _2384;
        float _2744 = _2726 * _2384;
        float _2746 = fma(_620, _2676, _2740);
        float _2748 = fma(_620, _2698, _2742);
        float _2750 = fma(_620, _2720, _2744);
        float _2752 = fma(_618, _2688, _2746);
        float _2754 = fma(_618, _2710, _2748);
        float _2756 = fma(_618, _2732, _2750);
        float _2758 = _2752 + _2694;
        float _2760 = _2754 + _2716;
        float _2762 = _2756 + _2738;
        _2664 = _2760;
        _2666 = _2758;
        _2668 = _2762;
        _2670 = _2752;
        _2672 = _2688;
    }
    float _2764 = _2664;
    float _2766 = _2666;
    float _2768 = _2668;
    float _2770 = _2670;
    float _2772 = _2672;
    float _2774 = -_2764;
    float _2776 = _2470 + _2774;
    float _2778 = -_2766;
    float _2780 = _2468 + _2778;
    float _2782 = -_2768;
    float _2784 = _2472 + _2782;
    bool _2786 = _574 > 0.001000000047497451305389404296875;
    bool _2788 = isnan(_574);
    bool _2790 = _2786 || _2788;
    bool _2792 = isnan(0.001000000047497451305389404296875);
    bool _2794 = _2790 || _2792;
    float _2796 = _2776 * _2776;
    float _2798 = fma(_2780, _2780, _2796);
    float _2800 = fma(_2784, _2784, _2798);
    float _2802 = sqrt(_2800);
    float _2804 = _2784;
    int _2806 = as_type<int>(_2764);
    float _2808 = 0.0;
    float _2810 = 0.0;
    float _2812 = 0.0;
    if (!_2794)
    {
        bool _2814 = _2802 > _2474;
        float _2816 = float(_2814);
        _2804 = _2816;
    }
    float _2818 = _2804;
    bool _2820 = !_2794;
    float _2822 = _2818;
    if (!_2820)
    {
        float _2824 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[20]);
        float _2826 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[21]);
        float _2828 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[22]);
        float _2830 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
        float _2832 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
        float _2834 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
        float _2836 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[28]);
        float _2838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[29]);
        float _2840 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[30]);
        uint _2842 = uint(int(uint(_242) >> uint(2)));
        float _2844 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_2842)]);
        bool _2846 = _2802 > _2474;
        float _2848 = -_2764;
        float _2850 = _2826 + _2848;
        float _2852 = -_2766;
        float _2854 = _2824 + _2852;
        float _2856 = -_2768;
        float _2858 = _2828 + _2856;
        float _2860 = -_2764;
        float _2862 = _2832 + _2860;
        float _2864 = _2850 * _2850;
        float _2866 = -_2766;
        float _2868 = _2830 + _2866;
        float _2870 = -_2768;
        float _2872 = _2834 + _2870;
        float _2874 = -_2764;
        float _2876 = _2838 + _2874;
        float _2878 = _2862 * _2862;
        float _2880 = -_2766;
        float _2882 = _2836 + _2880;
        float _2884 = fma(_2854, _2854, _2864);
        float _2886 = _2876 * _2876;
        float _2888 = fma(_2868, _2868, _2878);
        float _2890 = -_2768;
        float _2892 = _2840 + _2890;
        float _2894 = fma(_2858, _2858, _2884);
        float _2896 = fma(_2882, _2882, _2886);
        float _2898 = fma(_2872, _2872, _2888);
        int _2900 = as_type<int>(_2882);
        int _2902 = as_type<int>(_2872);
        if (!_2846)
        {
            float _2904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
            _2900 = as_type<int>(_2904);
        }
        int _2906 = _2900;
        float _2908 = fma(_2892, _2892, _2896);
        float _2910 = sqrt(_2894);
        float _2912 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[14]);
        float _2914 = sqrt(_2898);
        float _2916 = sqrt(_2908);
        bool _2918 = _2910 > _2474;
        bool _2920 = _2914 > _2474;
        float _2922 = _2770;
        if (!_2918)
        {
            float _2924 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
            _2922 = _2924;
        }
        float _2926 = _2922;
        bool _2928 = _2916 > _2474;
        float _2930 = _2772;
        if (!_2920)
        {
            float _2932 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
            _2930 = _2932;
        }
        float _2934 = _2930;
        float _2936 = _2854;
        if (!_2928)
        {
            float _2938 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
            _2936 = _2938;
        }
        float _2940 = _2936;
        int _2942 = as_type<int>(_2844) << 24;
        int _2944 = _2942 >> 24;
        float _2946 = float(_2944);
        float _2948 = _2946 * 0.0078740157186985015869140625;
        float _2950 = precise::min(_2948, 1.0);
        float _2952 = precise::max(_2950, -1.0);
        int _2954 = as_type<int>(_2844) << 16;
        int _2956 = as_type<int>(_2844) << 8;
        bool _2958 = _2952 > 0.0;
        bool _2960 = _2958 || _2846;
        int _2962 = _2954 >> 24;
        int _2964 = _2956 >> 24;
        int _2966 = _2962;
        if (!_2846)
        {
            bool _2968 = _2952 >= 0.0;
            bool _2970 = isnan(_2952);
            bool _2972 = _2968 || _2970;
            bool _2974 = isnan(0.0);
            bool _2976 = _2972 || _2974;
            _662 = _2976;
        }
        bool _2978 = _662;
        float _2980 = float(_2962);
        int _2982 = as_type<int>(_2844) >> 24;
        float _2984 = _2980;
        bool _2986 = _2978;
        if (!_2846)
        {
            int _2988 = _2978 ? 0 : 1;
            _2902 = _2988;
        }
        int _2990 = _2902;
        float _2992 = float(_2964);
        float _2994 = _2980 * 0.0078740157186985015869140625;
        float _2996 = float(_2982);
        int _2998 = _2990;
        if (!_2846)
        {
            int _3000 = ~_2990;
            int _3002 = _3000 + 1;
            int _3004 = _3002 + 1;
            _2966 = _3004;
        }
        int _3006 = _2966;
        float _3008 = _2992 * 0.0078740157186985015869140625;
        int _3010 = _3006;
        if (!_2960)
        {
            int _3012 = ~_2990;
            int _3014 = _3012 + 1;
            _3010 = _3014;
        }
        int _3016 = _3010;
        float _3018 = _2996 * 0.0078740157186985015869140625;
        float _3020 = precise::min(_2994, 1.0);
        int _3022 = _3016;
        if (!_2846)
        {
            float _3024 = float(_3016);
            _3022 = as_type<int>(_3024);
        }
        int _3026 = _3022;
        float _3028 = precise::min(_3008, 1.0);
        float _3030 = precise::max(_3020, -1.0);
        float _3032 = precise::min(_3018, 1.0);
        int _3034 = as_type<int>(_3032);
        int _3036 = _3026;
        int _3038 = as_type<int>(_3028);
        if (_2846)
        {
            _2984 = 1.0;
        }
        float _3040 = _2984;
        float _3042 = precise::max(_3028, -1.0);
        float _3044 = precise::max(_3032, -1.0);
        bool _3046 = false;
        float _3048 = _3040;
        if (!_2920)
        {
            bool _3050 = _3042 >= 0.0;
            bool _3052 = isnan(_3042);
            bool _3054 = _3050 || _3052;
            bool _3056 = isnan(0.0);
            bool _3058 = _3054 || _3056;
            _3046 = _3058;
        }
        bool _3060 = _3046;
        bool _3062 = _3030 > 0.0;
        bool _3064 = _3062 || _2918;
        bool _3066 = _3060;
        bool _3068 = _3064;
        if (!_2920)
        {
            int _3070 = _3060 ? 0 : 1;
            _3034 = _3070;
        }
        int _3072 = _3034;
        if (!_2928)
        {
            bool _3074 = _3044 >= 0.0;
            bool _3076 = isnan(_3044);
            bool _3078 = _3074 || _3076;
            bool _3080 = isnan(0.0);
            bool _3082 = _3078 || _3080;
            _3066 = _3082;
        }
        bool _3084 = _3066;
        if (!_2920)
        {
            int _3086 = ~_3072;
            int _3088 = _3086 + 1;
            int _3090 = _3088 + 1;
            _2998 = _3090;
        }
        int _3092 = _2998;
        int _3094 = _2906;
        int _3096 = _3092;
        if (!_2846)
        {
            bool _3098 = _2802 >= as_type<float>(_2906);
            bool _3100 = isnan(_2802);
            bool _3102 = _3098 || _3100;
            bool _3104 = isnan(as_type<float>(_2906));
            bool _3106 = _3102 || _3104;
            _2986 = _3106;
        }
        bool _3108 = _2986;
        bool _3110 = _3108;
        if (!_2846)
        {
            float _3112 = _3108 ? as_type<float>(_3026) : (-1.0);
            _3048 = _3112;
        }
        float _3114 = _3048;
        if (!_2918)
        {
            bool _3116 = _3030 >= 0.0;
            bool _3118 = isnan(_3030);
            bool _3120 = _3116 || _3118;
            bool _3122 = isnan(0.0);
            bool _3124 = _3120 || _3122;
            _3110 = _3124;
        }
        bool _3126 = _3110;
        bool _3128 = _3042 > 0.0;
        bool _3130 = _3128 || _2920;
        bool _3132 = _3130;
        if (!_2918)
        {
            int _3134 = _3126 ? 0 : 1;
            _3094 = _3134;
        }
        int _3136 = _3094;
        bool _3138 = _3044 > 0.0;
        bool _3140 = _3138 || _2928;
        float _3142 = 1.0 / _2912;
        float _3144 = _2912;
        float _3146 = as_type<float>(_3136);
        bool _3148 = _3140;
        if (!_2928)
        {
            int _3150 = _3084 ? 0 : 1;
            _3036 = _3150;
        }
        int _3152 = _3036;
        float _3154 = as_type<float>(_3152);
        if (!_2918)
        {
            int _3156 = ~_3136;
            int _3158 = _3156 + 1;
            int _3160 = _3158 + 1;
            _3038 = _3160;
        }
        int _3162 = _3038;
        int _3164 = _3162;
        if (!_2928)
        {
            int _3166 = ~_3152;
            int _3168 = _3166 + 1;
            int _3170 = _3168 + 1;
            _2806 = _3170;
        }
        int _3172 = _2806;
        int _3174 = _3172;
        if (!_3064)
        {
            int _3176 = ~_3136;
            int _3178 = _3176 + 1;
            _3164 = _3178;
        }
        int _3180 = _3164;
        int _3182 = _3180;
        if (!_3130)
        {
            int _3184 = ~_3072;
            int _3186 = _3184 + 1;
            _3096 = _3186;
        }
        int _3188 = _3096;
        int _3190 = _3188;
        if (!_3140)
        {
            int _3192 = ~_3152;
            int _3194 = _3192 + 1;
            _3174 = _3194;
        }
        int _3196 = _3174;
        int _3198 = _3196;
        if (!_2918)
        {
            float _3200 = float(_3180);
            _3182 = as_type<int>(_3200);
        }
        int _3202 = _3182;
        if (!_2920)
        {
            float _3204 = float(_3188);
            _3190 = as_type<int>(_3204);
        }
        int _3206 = _3190;
        if (!_2928)
        {
            float _3208 = float(_3196);
            _3198 = as_type<int>(_3208);
        }
        int _3210 = _3198;
        if (!_2918)
        {
            bool _3212 = _2910 >= _2926;
            bool _3214 = isnan(_2910);
            bool _3216 = _3212 || _3214;
            bool _3218 = isnan(_2926);
            bool _3220 = _3216 || _3218;
            _3068 = _3220;
        }
        bool _3222 = _3068;
        float _3224 = _162 * _3142;
        if (_2918)
        {
            _3144 = 1.0;
        }
        float _3226 = _3144;
        float _3228 = _3226;
        if (_2920)
        {
            _3146 = 1.0;
        }
        float _3230 = _3146;
        float _3232 = _3230;
        if (!_2920)
        {
            bool _3234 = _2914 >= _2934;
            bool _3236 = isnan(_2914);
            bool _3238 = _3234 || _3236;
            bool _3240 = isnan(_2934);
            bool _3242 = _3238 || _3240;
            _3132 = _3242;
        }
        bool _3244 = _3132;
        if (_2928)
        {
            _3154 = 1.0;
        }
        float _3246 = _3154;
        float _3248 = _3246;
        if (!_2918)
        {
            float _3250 = _3222 ? as_type<float>(_3202) : (-1.0);
            _3228 = _3250;
        }
        float _3252 = _3228;
        if (!_2928)
        {
            bool _3254 = _2916 >= _2940;
            bool _3256 = isnan(_2916);
            bool _3258 = _3254 || _3256;
            bool _3260 = isnan(_2940);
            bool _3262 = _3258 || _3260;
            _3148 = _3262;
        }
        bool _3264 = _3148;
        if (!_2920)
        {
            float _3266 = _3244 ? as_type<float>(_3206) : (-1.0);
            _3232 = _3266;
        }
        float _3268 = _3232;
        if (!_2928)
        {
            float _3270 = _3264 ? as_type<float>(_3210) : (-1.0);
            _3248 = _3270;
        }
        float _3272 = _3248;
        float _3274 = abs(_2952);
        float _3276 = fma(_3224, _3114, _3274);
        float _3278 = precise::clamp(_3276, 0.0, 1.0);
        float _3280 = abs(_3030);
        float _3282 = fma(_3224, _3252, _3280);
        float _3284 = precise::clamp(_3282, 0.0, 1.0);
        float _3286 = abs(_3042);
        float _3288 = fma(_3224, _3268, _3286);
        float _3290 = precise::clamp(_3288, 0.0, 1.0);
        float _3292 = abs(_3044);
        float _3294 = fma(_3224, _3272, _3292);
        float _3296 = precise::clamp(_3294, 0.0, 1.0);
        float _3298 = _3278 * _3114;
        float _3300 = _3284 * _3252;
        float _3302 = _3290 * _3268;
        float _3304 = _3296 * _3272;
        _2822 = _3298;
        _2808 = _3300;
        _2810 = _3302;
        _2812 = _3304;
    }
    float _3306 = _2822;
    float _3308 = _2808;
    float _3310 = _2810;
    float _3312 = _2812;
    float _3314 = precise::min(_3306, 1.0);
    float _3316 = -_278;
    float _3318 = _3316 + _2384;
    float _3320 = precise::max(_3314, -1.0);
    float _3322 = precise::min(_3308, 1.0);
    int _3324 = _240 + 8;
    float _3326 = _3320 * 127.0;
    float _3328 = precise::max(_3322, -1.0);
    float _3330 = precise::min(_3310, 1.0);
    float _3332 = precise::min(_3312, 1.0);
    float _3334 = _3328 * 127.0;
    float _3336 = precise::max(_3330, -1.0);
    float _3338 = rint(_3326);
    int _3340 = int(_3338);
    float _3342 = precise::max(_3332, -1.0);
    float _3344 = _3336 * 127.0;
    float _3346 = _3342 * 127.0;
    float _3348 = rint(_3334);
    int _3350 = int(_3348);
    float _3352 = rint(_3344);
    int _3354 = int(_3352);
    uint _3356 = extract_bits(uint(_3340), 0u, 8u);
    int _3358 = int(_3356) & 255;
    float _3360 = rint(_3346);
    int _3362 = int(_3360);
    uint _3364 = extract_bits(uint(_3358), 0u, 8u);
    int _3366 = int(_3364) & 255;
    uint _3368 = extract_bits(uint(_3350), 0u, 8u);
    int _3370 = int(_3368) & 255;
    int _3372 = _3370 << 8;
    int _3374 = _3366 | _3372;
    uint _3376 = extract_bits(uint(_3358), 16u, 8u);
    int _3378 = int(_3376) & 255;
    int _3380 = _3378 << 16;
    int _3382 = _3374 | _3380;
    uint _3384 = extract_bits(uint(_3358), 24u, 8u);
    int _3386 = int(_3384) & 255;
    int _3388 = _3386 << 24;
    int _3390 = _3382 | _3388;
    int _3392 = _240 + 4;
    uint _3394 = extract_bits(uint(_3390), 0u, 8u);
    int _3396 = int(_3394) & 255;
    uint _3398 = extract_bits(uint(_3390), 8u, 8u);
    int _3400 = int(_3398) & 255;
    int _3402 = _3400 << 8;
    int _3404 = _3396 | _3402;
    uint _3406 = extract_bits(uint(_3354), 0u, 8u);
    int _3408 = int(_3406) & 255;
    int _3410 = _3408 << 16;
    int _3412 = _3404 | _3410;
    uint _3414 = extract_bits(uint(_3390), 24u, 8u);
    int _3416 = int(_3414) & 255;
    int _3418 = _3416 << 24;
    int _3420 = _3412 | _3418;
    uint _3422 = extract_bits(uint(_3420), 0u, 8u);
    int _3424 = int(_3422) & 255;
    uint _3426 = extract_bits(uint(_3420), 8u, 8u);
    int _3428 = int(_3426) & 255;
    int _3430 = _3428 << 8;
    int _3432 = _3424 | _3430;
    uint _3434 = extract_bits(uint(_3420), 16u, 8u);
    int _3436 = int(_3434) & 255;
    int _3438 = _3436 << 16;
    int _3440 = _3432 | _3438;
    uint _3442 = extract_bits(uint(_3362), 0u, 8u);
    int _3444 = int(_3442) & 255;
    int _3446 = _3444 << 24;
    int _3448 = _3440 | _3446;
    uint _3450 = uint(int(uint(_242) >> uint(2)));
    (*spvDescriptorSet0.cp_s11)._m0[int(_3450)] = uint(_3448);
    uint _3452 = uint(int(uint(_242) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3452)] = as_type<uint>(_564);
    uint _3454 = uint(int(uint(_240) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3454)] = as_type<uint>(_620);
    uint _3456 = uint(int(uint(_3392) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3456)] = as_type<uint>(_2384);
    uint _3458 = uint(int(uint(_3324) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3458)] = as_type<uint>(_618);
    uint _3460 = uint(int(uint(_240) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3460)] = as_type<uint>(_2388);
    uint _3462 = uint(int(uint(_3392) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3462)] = as_type<uint>(_2390);
    uint _3464 = uint(int(uint(_3324) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3464)] = as_type<uint>(_2392);
    uint _3466 = uint(int(uint(_240) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3466)] = as_type<uint>(_610);
    uint _3468 = uint(int(uint(_3392) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3468)] = as_type<uint>(_3318);
    uint _3470 = uint(int(uint(_3324) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3470)] = as_type<uint>(_608);
    float _3472 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3474 = _3318 * _3318;
    float _3476 = _2390 * _2390;
    float _3478 = fma(_610, _610, _3474);
    float _3480 = fma(_2388, _2388, _3476);
    float _3482 = fma(_608, _608, _3478);
    float _3484 = fma(_2392, _2392, _3480);
    float _3486 = sqrt(_3484);
    float _3488 = sqrt(_3482);
    bool _3490 = _3488 >= 9.9999999747524270787835121154785e-07;
    bool _3492 = isnan(_3488);
    bool _3494 = _3490 || _3492;
    bool _3496 = isnan(9.9999999747524270787835121154785e-07);
    bool _3498 = _3494 || _3496;
    int _3514;
    if (!_3498)
    {
        bool _3500 = _174 != _288;
        bool _3502 = isnan(_174);
        bool _3504 = _3500 || _3502;
        bool _3506 = isnan(_288);
        bool _3508 = _3504 || _3506;
        if (_3508)
        {
            _664 = as_type<int>(_292);
        }
        int _3510 = _664;
        int _3512 = _3510;
        _3514 = _3510;
        if (_3508)
        {
            _666 = as_type<int>(_304);
        }
        int _3516 = _666;
        _670 = _3516;
        _3518 = _3508;
        if (!_3518)
        {
            float _3520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3522 = _3520 > 0.0;
            bool _3524 = !_3522;
            int _3526 = as_type<int>(_3520);
            if (!_3524)
            {
                float _3528 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3532 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3534 = _3530 * _526;
                float _3536 = _3530 * _532;
                float _3538 = _3530 * _534;
                float _3540 = fma(_3528, _528, _3534);
                float _3542 = fma(_3528, _536, _3536);
                float _3544 = fma(_3528, _538, _3538);
                float _3546 = fma(_3532, _530, _3540);
                float _3548 = fma(_3532, _542, _3542);
                float _3550 = fma(_3532, _540, _3544);
                float _3552 = _3546 * _3546;
                float _3554 = fma(_3548, _3548, _3552);
                float _3556 = fma(_3550, _3550, _3554);
                float _3558 = rsqrt(_3556);
                float _3560 = _3558 * 9.9999999747524270787835121154785e-07;
                float _3562 = _3548 * _3560;
                float _3564 = _3546 * _3560;
                float _3566 = _3550 * _3560;
                _3514 = as_type<int>(_3562);
                _350 = as_type<int>(_3564);
                _670 = as_type<int>(_3566);
                _3518 = true;
            }
            else
            {
                bool _3568 = _3486 >= 9.9999999747524270787835121154785e-07;
                bool _3570 = isnan(_3486);
                bool _3572 = _3568 || _3570;
                bool _3574 = isnan(9.9999999747524270787835121154785e-07);
                bool _3576 = _3572 || _3574;
                if (!_3576)
                {
                    float _3578 = _2384 * _2384;
                    float _3580 = fma(_620, _620, _3578);
                    float _3582 = fma(_618, _618, _3580);
                    float _3584 = sqrt(_3582);
                    bool _3586 = _3584 >= 9.9999999747524270787835121154785e-07;
                    bool _3588 = isnan(_3584);
                    bool _3590 = _3586 || _3588;
                    bool _3592 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3594 = _3590 || _3592;
                    float _3596 = _3584;
                    if (_3594)
                    {
                        float _3598 = rsqrt(_3582);
                        _3596 = _3598;
                    }
                    float _3600 = _3596;
                    if (!_3594)
                    {
                        _3512 = 0;
                    }
                    int _3602 = _3512;
                    int _3604 = _3602;
                    if (!_3594)
                    {
                        _346 = 897988541;
                    }
                    int _3606 = _346;
                    int _3608 = _3606;
                    if (!_3594)
                    {
                        _3526 = 0;
                    }
                    int _3610 = _3526;
                    float _3612 = _3600;
                    int _3614 = _3610;
                    if (_3594)
                    {
                        float _3616 = _3600 * 9.9999999747524270787835121154785e-07;
                        _3612 = _3616;
                    }
                    float _3618 = _3612;
                    if (_3594)
                    {
                        float _3620 = _620 * _3618;
                        _3604 = as_type<int>(_3620);
                    }
                    int _3622 = _3604;
                    _3514 = _3622;
                    if (_3594)
                    {
                        float _3624 = _2384 * _3618;
                        _3608 = as_type<int>(_3624);
                    }
                    int _3626 = _3608;
                    _350 = _3626;
                    if (_3594)
                    {
                        float _3628 = _618 * _3618;
                        _3614 = as_type<int>(_3628);
                    }
                    int _3630 = _3614;
                    _670 = _3630;
                    _3518 = true;
                }
                else
                {
                    float _3632 = rsqrt(_3484);
                    float _3634 = _3632 * 9.9999999747524270787835121154785e-07;
                    float _3636 = _2388 * _3634;
                    float _3638 = _2390 * _3634;
                    float _3640 = _2392 * _3634;
                    _3514 = as_type<int>(_3636);
                    _350 = as_type<int>(_3638);
                    _670 = as_type<int>(_3640);
                    _3518 = true;
                }
            }
        }
    }
    else
    {
        float _3642 = _3486 * _3472;
        bool _3644 = _3642 >= 0.001000000047497451305389404296875;
        bool _3646 = isnan(_3642);
        bool _3648 = _3644 || _3646;
        bool _3650 = isnan(0.001000000047497451305389404296875);
        bool _3652 = _3648 || _3650;
        bool _3654 = _3642 > 0.0;
        bool _3656 = !_3652;
        bool _3658 = _3654 && _3656;
        bool _3660 = _3488 < 0.001000000047497451305389404296875;
        bool _3662 = _3660 && _3658;
        if (!_3662)
        {
            _348 = as_type<int>(_3318);
        }
        int _3664 = _348;
        int _3666 = _3664;
        if (_3662)
        {
            float _3668 = _3472 * _2388;
            _668 = as_type<int>(_3668);
        }
        int _3670 = _668;
        _3514 = _3670;
        if (_3662)
        {
            float _3672 = _3472 * _2390;
            _3666 = as_type<int>(_3672);
        }
        int _3674 = _3666;
        _350 = _3674;
        if (_3662)
        {
            float _3676 = _3472 * _2392;
            _670 = as_type<int>(_3676);
        }
    }
    _3518 = false;
    int _3678 = _3514;
    int _3680 = _350;
    int _3682 = _670;
    uint _3684 = uint(int(uint(_240) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3684)] = uint(_3678);
    uint _3686 = uint(int(uint(_3392) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3686)] = uint(_3680);
    uint _3688 = uint(int(uint(_3324) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_3688)] = uint(_3682);
}

