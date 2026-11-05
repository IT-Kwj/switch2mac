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
    bool _1528 = false;
    bool _522 = false;
    float _66 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _73 = as_type<int>(_70) << 5;
    int _75 = _73 + as_type<int>(_68);
    float _77 = trunc(_66);
    int _79 = int(_77);
    bool _83 = _75 >= _79;
    int _85 = 0;
    if (_83)
    {
        _85 = 0;
    }
    int _87 = _85;
    int _89 = _87;
    int _91 = _87;
    if (!_83)
    {
        int _93 = _75 << 4;
        int _95 = _93 + 12;
        uint _98 = uint(int(uint(_95) >> uint(2)));
        float _100 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_98)]);
        float _102 = trunc(_100);
        int _104 = int(_102);
        bool _106 = _104 >= 1;
        int _108 = _106 ? (-1) : 0;
        if (!_106)
        {
            _89 = 0;
        }
        int _110 = _89;
        bool _112 = !_106;
        _91 = _110;
        if (!_112)
        {
            float _114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _116 = uint(int(uint(_95) >> uint(2)));
            float _118 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_116)]);
            float _120 = float(_104);
            float _122 = -_118;
            float _124 = _114 + _122;
            bool _126 = _124 > _120;
            int _128 = as_type<int>(_114);
            if (!_126)
            {
                bool _130 = _114 >= _118;
                bool _132 = isnan(_114);
                bool _134 = _130 || _132;
                bool _136 = isnan(_118);
                bool _138 = _134 || _136;
                _108 = _138 ? (-1) : 0;
            }
            int _140 = _108;
            if (_126)
            {
                _128 = 0;
            }
            int _142 = _128;
            _91 = _142;
            if (!_126)
            {
                int _144 = ~_140;
                int _146 = (_144 != 0) ? 0 : 1;
                _91 = _146;
            }
        }
    }
    int _148 = _91;
    int _150 = _148 & 1;
    bool _152 = _150 != 0;
    if (!_152)
    {
        return;
    }
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _158 = _75 << 4;
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _162 = _158 + 12;
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _166 = uint(int(uint(_162) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_166)]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _174 = uint(int(uint(_158) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_174)]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _188 = uint(int(uint(_158) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    int _192 = _158 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _158 + 8;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    uint _204 = uint(int(uint(_162) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_204)]);
    uint _208 = uint(int(uint(_158) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_208)]);
    int _212 = _158 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_214)]);
    int _218 = _158 + 8;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_220)]);
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _232 = uint(int(uint(_158) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_232)]);
    int _236 = _158 + 4;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_238)]);
    int _242 = _158 + 8;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_244)]);
    int _248 = _158 + 12;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_250)]);
    uint _254 = uint(int(uint(_162) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_254)]);
    int _258 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x) + 336;
    bool _260 = _154 > 0.0;
    float _262 = abs(_156);
    float _264 = log2(_262);
    bool _266 = _160 > 0.0;
    float _268 = 0.0;
    float _270 = _172;
    float _272 = _182;
    float _274 = _184;
    float _276 = _186;
    float _278 = _170;
    float _280 = _226;
    float _282 = _228;
    float _284 = _230;
    float _286 = _190;
    float _288 = _196;
    float _290 = _202;
    int _292 = as_type<int>(_210);
    if (_260)
    {
        float _294 = 1.0 / _154;
        _268 = _294;
    }
    float _296 = _268;
    float _298 = -_168;
    float _300 = _164 + _298;
    float _302 = _170 * _264;
    float _304 = _172 * _160;
    float _306 = exp2(_302);
    float _308 = 0.0;
    float _310 = _264;
    if (_260)
    {
        float _312 = _300 * _296;
        _308 = _312;
    }
    float _314 = _308;
    float _316 = _314;
    if (_266)
    {
        float _318 = -_304;
        float _320 = fma(_176, _318, _172);
        _270 = _320;
    }
    float _322 = _270;
    int _324 = as_type<int>(_178) & 512;
    bool _326 = _324 != 0;
    float _328 = _322;
    bool _330 = _326;
    if (_260)
    {
        float _332 = precise::min(_314, 1.0);
        _310 = _332;
    }
    float _334 = _310;
    float _336 = _170 * _180;
    if (_260)
    {
        float _338 = _334 * _322;
        _328 = _338;
    }
    float _340 = _328;
    float _342 = _182 * _336;
    float _344 = _184 * _336;
    float _346 = _186 * _336;
    float _348 = _170 * _340;
    float _350 = fma(_190, _306, _342);
    float _352 = _206 * _170;
    float _354 = fma(_196, _306, _344);
    float _356 = fma(_202, _306, _346);
    float _358 = fma(_190, _352, _210);
    float _360 = fma(_196, _352, _216);
    float _362 = fma(_202, _352, _222);
    float _364 = _224 * _348;
    float _366 = _226 * _348;
    float _368 = _228 * _348;
    bool _370 = !_326;
    float _372 = _252;
    float _374 = _340;
    float _376 = _352;
    float _378 = _348;
    float _380 = _364;
    float _382 = _368;
    float _384 = _346;
    int _386 = as_type<int>(_240);
    int _388 = as_type<int>(_234);
    int _390 = as_type<int>(_240);
    int _392 = as_type<int>(_246);
    int _394 = as_type<int>(_234);
    int _396 = as_type<int>(_240);
    int _398 = as_type<int>(_246);
    float _520;
    if (!_370)
    {
        float _400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _418 = _404 * _406;
        float _420 = _404 * _408;
        float _422 = _402 * _406;
        float _424 = -_418;
        float _426 = fma(_400, _410, _424);
        float _428 = -_420;
        float _430 = fma(_402, _410, _428);
        float _432 = -_422;
        float _434 = fma(_400, _408, _432);
        float _436 = _414 * _400;
        float _438 = _414 * _426;
        float _440 = _416 * _402;
        float _442 = _412 * _408;
        float _444 = -_436;
        float _446 = fma(_412, _402, _444);
        float _448 = -_438;
        float _450 = fma(_412, _430, _448);
        float _452 = _414 * _410;
        float _454 = _416 * _406;
        float _456 = _412 * _404;
        float _458 = fma(_416, _434, _450);
        float _460 = -_452;
        float _462 = fma(_416, _408, _460);
        float _464 = -_454;
        float _466 = fma(_412, _410, _464);
        float _468 = -_442;
        float _470 = fma(_414, _406, _468);
        float _472 = 1.0 / _458;
        float _474 = -_456;
        float _476 = fma(_416, _400, _474);
        float _478 = -_400;
        float _480 = fma(_478, _410, _418);
        float _482 = -_440;
        float _484 = fma(_414, _404, _482);
        float _486 = _462 * _472;
        float _488 = _466 * _472;
        float _490 = _470 * _472;
        float _492 = _480 * _472;
        float _494 = _366 * _486;
        float _496 = _364 * _472;
        float _498 = _366 * _488;
        float _500 = _366 * _490;
        float _502 = _484 * _472;
        float _504 = fma(_430, _496, _494);
        float _506 = _476 * _472;
        float _508 = fma(_364, _492, _498);
        float _510 = _446 * _472;
        float _512 = fma(_434, _496, _500);
        float _514 = fma(_368, _502, _504);
        float _516 = fma(_368, _506, _508);
        float _518 = fma(_368, _510, _512);
        _272 = _502;
        _274 = _506;
        _276 = _512;
        _316 = _472;
        _374 = _412;
        _376 = _414;
        _278 = _416;
        _280 = _496;
        _282 = _494;
        _284 = _418;
        _286 = _406;
        _288 = _408;
        _290 = _410;
        _378 = _458;
        _520 = _516;
        _380 = _514;
        _382 = _518;
        _384 = _434;
        _522 = true;
    }
    else
    {
        int _524 = as_type<int>(_178) & 1024;
        bool _526 = _524 != 0;
        if (_526)
        {
            _330 = true;
        }
        bool _528 = _330;
        bool _530 = _528;
        if (!_526)
        {
            int _532 = as_type<int>(_178) & 2048;
            bool _534 = _532 != 0;
            _530 = _534;
        }
        bool _536 = _530;
        if (!_536)
        {
            _372 = _366;
        }
        float _538 = _372;
        bool _540 = !_536;
        _520 = _538;
        if (!_540)
        {
            uint _542 = uint(int(uint(_158) >> uint(2)));
            float _544 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_542)]);
            int _546 = _158 + 4;
            uint _548 = uint(int(uint(_546) >> uint(2)));
            float _550 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_548)]);
            int _552 = _158 + 8;
            uint _554 = uint(int(uint(_552) >> uint(2)));
            float _556 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_554)]);
            uint _558 = uint(int(uint(_158) >> uint(2)));
            float _560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_558)]);
            int _562 = _158 + 4;
            uint _564 = uint(int(uint(_562) >> uint(2)));
            float _566 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_564)]);
            int _568 = _158 + 8;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            float _572 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_570)]);
            uint _574 = uint(int(uint(_158) >> uint(2)));
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_574)]);
            int _578 = _158 + 4;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_580)]);
            int _584 = _158 + 8;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_586)]);
            float _590 = _556 * _560;
            float _592 = _556 * _566;
            float _594 = _550 * _560;
            float _596 = -_590;
            float _598 = fma(_544, _572, _596);
            float _600 = -_592;
            float _602 = fma(_550, _572, _600);
            float _604 = -_594;
            float _606 = fma(_544, _566, _604);
            float _608 = _582 * _544;
            float _610 = _582 * _598;
            float _612 = _588 * _550;
            float _614 = _576 * _566;
            float _616 = -_608;
            float _618 = fma(_576, _550, _616);
            float _620 = -_610;
            float _622 = fma(_576, _602, _620);
            float _624 = _582 * _572;
            float _626 = _588 * _560;
            float _628 = _576 * _556;
            float _630 = fma(_588, _606, _622);
            float _632 = -_624;
            float _634 = fma(_588, _566, _632);
            float _636 = -_626;
            float _638 = fma(_576, _572, _636);
            float _640 = -_614;
            float _642 = fma(_582, _560, _640);
            float _644 = 1.0 / _630;
            float _646 = -_628;
            float _648 = fma(_588, _544, _646);
            float _650 = -_544;
            float _652 = fma(_650, _572, _590);
            float _654 = -_612;
            float _656 = fma(_582, _556, _654);
            float _658 = _634 * _644;
            float _660 = _638 * _644;
            float _662 = _642 * _644;
            float _664 = _652 * _644;
            float _666 = _366 * _658;
            float _668 = _364 * _644;
            float _670 = _366 * _660;
            float _672 = _366 * _662;
            float _674 = _656 * _644;
            float _676 = fma(_602, _668, _666);
            float _678 = _648 * _644;
            float _680 = fma(_364, _664, _670);
            float _682 = _618 * _644;
            float _684 = fma(_606, _668, _672);
            float _686 = fma(_368, _674, _676);
            float _688 = fma(_368, _678, _680);
            float _690 = fma(_368, _682, _684);
            _272 = _674;
            _274 = _678;
            _276 = _684;
            _316 = _644;
            _374 = _576;
            _376 = _582;
            _278 = _588;
            _280 = _668;
            _282 = _666;
            _284 = _590;
            _286 = _560;
            _288 = _566;
            _290 = _572;
            _378 = _630;
            _520 = _688;
            _380 = _686;
            _382 = _690;
            _384 = _606;
        }
    }
    _522 = false;
    float _692 = _272;
    float _694 = _274;
    float _696 = _276;
    float _698 = _316;
    float _700 = _374;
    float _702 = _376;
    float _704 = _278;
    float _706 = _280;
    float _708 = _282;
    float _710 = _284;
    float _712 = _286;
    float _714 = _288;
    float _716 = _290;
    float _718 = _378;
    float _720 = _520;
    float _722 = _380;
    float _724 = _382;
    float _726 = _384;
    uint _728 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_728)] = as_type<uint>(_256);
    float _730 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _732 = as_type<int>(_730) & 512;
    bool _734 = _732 != 0;
    int _736 = as_type<int>(_730) & 1024;
    bool _738 = _736 != 0;
    int _740 = as_type<int>(_730) & 2048;
    bool _742 = _740 != 0;
    float _744 = 0.0;
    float _746 = 0.0;
    float _748 = 0.0;
    float _750 = 0.0;
    float _752 = _726;
    float _754 = _720;
    float _756 = _722;
    float _758 = _724;
    if (_734)
    {
        float _760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _744 = _760;
        _746 = _762;
        _748 = _764;
        _750 = _766;
    }
    float _768 = _744;
    float _770 = _746;
    float _772 = _748;
    float _774 = _750;
    float _776 = _692;
    float _778 = _694;
    float _780 = _696;
    if (_738)
    {
        uint _782 = uint(int(uint(_158) >> uint(2)));
        float _784 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_782)]);
        int _786 = _158 + 4;
        uint _788 = uint(int(uint(_786) >> uint(2)));
        float _790 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_788)]);
        int _792 = _158 + 8;
        uint _794 = uint(int(uint(_792) >> uint(2)));
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_794)]);
        _776 = _784;
        _778 = _790;
        _780 = _796;
    }
    float _798 = _776;
    float _800 = _778;
    float _802 = _780;
    float _804 = _698;
    float _806 = _304;
    float _808 = _366;
    float _810 = _296;
    if (_734)
    {
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _814 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _804 = _812;
        _806 = _814;
        _808 = _816;
        _810 = _818;
    }
    float _820 = _804;
    float _822 = _806;
    float _824 = _808;
    float _826 = _810;
    float _828 = _700;
    float _830 = _702;
    float _832 = _704;
    if (_738)
    {
        uint _834 = uint(int(uint(_158) >> uint(2)));
        float _836 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_834)]);
        int _838 = _158 + 4;
        uint _840 = uint(int(uint(_838) >> uint(2)));
        float _842 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_840)]);
        int _844 = _158 + 8;
        uint _846 = uint(int(uint(_844) >> uint(2)));
        float _848 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_846)]);
        _828 = _836;
        _830 = _842;
        _832 = _848;
    }
    float _850 = _828;
    float _852 = _830;
    float _854 = _832;
    float _856 = _730;
    float _858 = _706;
    float _860 = _708;
    float _862 = _710;
    if (_742)
    {
        uint _864 = uint(int(uint(_158) >> uint(2)));
        float _866 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_864)]);
        int _868 = _158 + 4;
        uint _870 = uint(int(uint(_868) >> uint(2)));
        float _872 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_870)]);
        int _874 = _158 + 8;
        uint _876 = uint(int(uint(_874) >> uint(2)));
        float _878 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_876)]);
        int _880 = _158 + 12;
        uint _882 = uint(int(uint(_880) >> uint(2)));
        float _884 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_882)]);
        _856 = _866;
        _858 = _872;
        _860 = _878;
        _862 = _884;
    }
    float _886 = _856;
    float _888 = _858;
    float _890 = _860;
    float _892 = _862;
    float _894 = _712;
    float _896 = _714;
    float _898 = _716;
    float _900 = _718;
    if (_742)
    {
        uint _902 = uint(int(uint(_158) >> uint(2)));
        float _904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_902)]);
        int _906 = _158 + 4;
        uint _908 = uint(int(uint(_906) >> uint(2)));
        float _910 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_908)]);
        int _912 = _158 + 8;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        float _916 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_914)]);
        int _918 = _158 + 12;
        uint _920 = uint(int(uint(_918) >> uint(2)));
        float _922 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_920)]);
        _894 = _904;
        _896 = _910;
        _898 = _916;
        _900 = _922;
    }
    float _924 = _894;
    float _926 = _896;
    float _928 = _898;
    float _930 = _900;
    float _932 = 0.0;
    if (_738)
    {
        float _934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _932 = _934;
    }
    float _936 = _932;
    float _938 = 0.0;
    if (_738)
    {
        float _940 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _938 = _940;
    }
    float _942 = _938;
    float _944 = _360 + _720;
    float _946 = _358 + _722;
    float _948 = _362 + _724;
    if (!_734)
    {
        _752 = 0.0;
    }
    float _950 = _752;
    float _952 = _950;
    if (!_734)
    {
        _754 = 0.0;
    }
    float _954 = _754;
    float _956 = _768;
    float _958 = _954;
    if (_734)
    {
        float _960 = _944 * _770;
        _756 = _960;
    }
    float _962 = _756;
    if (_734)
    {
        float _964 = fma(_946, _768, _962);
        _956 = _964;
    }
    float _966 = _956;
    float _968 = _966;
    if (_734)
    {
        float _970 = fma(_948, _772, _966);
        _968 = _970;
    }
    float _972 = _968;
    float _974 = _972;
    if (_734)
    {
        float _976 = _774 + _972;
        _952 = _976;
    }
    float _978 = _952;
    float _980 = _798;
    float _982 = _852;
    float _984 = _802;
    float _986 = _850;
    float _988 = _854;
    if (_738)
    {
        float _990 = _944 * _800;
        _974 = _990;
    }
    float _992 = _974;
    float _994 = _926;
    float _996 = _820;
    float _998 = _886;
    float _1000 = _928;
    float _1002 = _890;
    float _1004 = _930;
    if (_734)
    {
        float _1006 = _944 * _822;
        _758 = _1006;
    }
    float _1008 = _758;
    if (_738)
    {
        float _1010 = fma(_946, _798, _992);
        _980 = _1010;
    }
    float _1012 = _980;
    float _1014 = _1012;
    if (_738)
    {
        float _1016 = _944 * _852;
        _982 = _1016;
    }
    float _1018 = _982;
    float _1020 = _1018;
    if (_742)
    {
        float _1022 = _944 * _926;
        _994 = _1022;
    }
    float _1024 = _994;
    float _1026 = _1024;
    if (_738)
    {
        float _1028 = fma(_948, _802, _1012);
        _1014 = _1028;
    }
    float _1030 = _1014;
    float _1032 = _1030;
    if (_742)
    {
        float _1034 = _944 * _888;
        _984 = _1034;
    }
    float _1036 = _984;
    if (_734)
    {
        float _1038 = fma(_946, _820, _1008);
        _996 = _1038;
    }
    float _1040 = _996;
    float _1042 = _1040;
    if (_738)
    {
        float _1044 = fma(_946, _850, _1018);
        _1020 = _1044;
    }
    float _1046 = _1020;
    if (_742)
    {
        float _1048 = fma(_946, _924, _1024);
        _1026 = _1048;
    }
    float _1050 = _1026;
    if (_742)
    {
        float _1052 = fma(_946, _886, _1036);
        _998 = _1052;
    }
    float _1054 = _998;
    float _1056 = _1054;
    if (!_738)
    {
        _986 = _978;
    }
    float _1058 = _986;
    float _1060 = _1058;
    if (_734)
    {
        float _1062 = fma(_948, _824, _1040);
        _1042 = _1062;
    }
    float _1064 = _1042;
    if (_738)
    {
        float _1066 = _936 + _1030;
        _1060 = _1066;
    }
    float _1068 = _1060;
    if (_738)
    {
        float _1070 = fma(_948, _854, _1046);
        _988 = _1070;
    }
    float _1072 = _988;
    float _1074 = _1072;
    if (_742)
    {
        float _1076 = fma(_948, _890, _1054);
        _1056 = _1076;
    }
    float _1078 = _1056;
    if (_742)
    {
        float _1080 = fma(_948, _928, _1050);
        _1000 = _1080;
    }
    float _1082 = _1000;
    uint _1084 = as_type<uint>(_1082);
    if (_734)
    {
        float _1086 = _826 + _1064;
        _958 = _1086;
    }
    float _1088 = _958;
    float _1090 = _1088;
    if (_738)
    {
        float _1092 = _942 + _1072;
        _1090 = _1092;
    }
    float _1094 = _1090;
    float _1096 = _1094;
    if (!_742)
    {
        _1002 = _1068;
    }
    float _1098 = _1002;
    float _1100 = _1098;
    if (_742)
    {
        float _1102 = _892 + _1078;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = 6.2500002968590706586837768554688e-05;
    if (_742)
    {
        float _1108 = _930 + _1082;
        _1096 = _1108;
    }
    float _1110 = _1096;
    float _1112 = fma(_1104, 6.2500002968590706586837768554688e-05, 0.5);
    float _1114 = fma(_1110, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3281 = float2(_1112, _1114);
    float _1116 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3281, float2(0.0), isnan(_3281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3281, float2(0.0), isnan(_3281)), level(0.0)).x;
    bool _1118 = _300 > 0.001000000047497451305389404296875;
    bool _1120 = isnan(_300);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.001000000047497451305389404296875);
    bool _1126 = _1122 || _1124;
    float _1128 = as_type<float>(_258);
    float _1130 = _1114;
    float _1132 = _1112;
    if (!_1126)
    {
        float _1134 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
        _1128 = _1134;
    }
    float _1136 = _1128;
    if (!_1126)
    {
        float _1138 = fma(_1104, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1074 = _1138;
    }
    float _1140 = _1074;
    bool _1142 = _1116 != 0.0;
    bool _1144 = isnan(_1116);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan(0.0);
    bool _1150 = _1146 || _1148;
    float _1152 = _1140;
    if (!_1150)
    {
        _1004 = 4.0;
    }
    float _1154 = _1004;
    float _1156 = _1116;
    if (!_1150)
    {
        float2 _3348 = float2(_1112, _1114);
        float _1158 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3348, float2(0.0), isnan(_3348)), level(_1154)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3348, float2(0.0), isnan(_3348)), level(_1154)).x;
        _1156 = _1158;
    }
    float _1160 = _1156;
    float _1162 = _978;
    if (!_1126)
    {
        float2 _3364 = float2(_1140, _1114);
        float _1164 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3364, float2(0.0), isnan(_3364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3364, float2(0.0), isnan(_3364)), level(0.0)).x;
        _1162 = _1164;
    }
    float _1166 = _1162;
    if (!_1126)
    {
        int _1168 = _158 + 4;
        _1084 = uint(_1168);
    }
    uint _1170 = _1084;
    float _1172 = -_210;
    float _1174 = _1172 + _946;
    float _1176 = -_222;
    float _1178 = _1176 + _948;
    float _1180 = _1160 * 2000.0;
    bool _1182 = _1180 != 0.0;
    bool _1184 = isnan(_1180);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = _1180;
    float _1194 = _1166;
    if (!_1126)
    {
        float _1196 = _1180 + _1136;
        _1192 = _1196;
    }
    float _1198 = _1192;
    bool _1200 = _300 <= 0.001000000047497451305389404296875;
    bool _1202 = !_1190;
    bool _1204 = _1200 && _1202;
    float _1206 = _1198;
    if (!_1126)
    {
        uint _1208 = uint(int(uint(int(_1170)) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_1208)] = as_type<uint>(_1198);
    }
    bool _1210 = !_1204;
    int _1212 = _1210 ? as_type<int>(_256) : 0;
    float _1214 = -_216;
    float _1216 = _1214 + _944;
    if (_1126)
    {
        _292 = _1212;
    }
    int _1218 = _292;
    int _1220 = _1218;
    if (!_1126)
    {
        float _1222 = fma(_1104, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _1224 = fma(_1110, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1226 = fma(_1110, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _1228 = _1166 != 0.0;
        bool _1230 = isnan(_1166);
        bool _1232 = _1228 || _1230;
        bool _1234 = isnan(0.0);
        bool _1236 = _1232 || _1234;
        float2 _3478 = float2(_1222, _1114);
        float _1238 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3478, float2(0.0), isnan(_3478)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3478, float2(0.0), isnan(_3478)), level(0.0)).x;
        float2 _3486 = float2(_1112, _1224);
        float _1240 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3486, float2(0.0), isnan(_3486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3486, float2(0.0), isnan(_3486)), level(0.0)).x;
        float2 _3494 = float2(_1112, _1226);
        float _1242 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3494, float2(0.0), isnan(_3494)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3494, float2(0.0), isnan(_3494)), level(0.0)).x;
        float2 _3502 = float2(_1140, _1224);
        float _1244 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3502, float2(0.0), isnan(_3502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3502, float2(0.0), isnan(_3502)), level(0.0)).x;
        float2 _3510 = float2(_1140, _1226);
        float _1246 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3510, float2(0.0), isnan(_3510)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3510, float2(0.0), isnan(_3510)), level(0.0)).x;
        float2 _3518 = float2(_1222, _1224);
        float _1248 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3518, float2(0.0), isnan(_3518)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3518, float2(0.0), isnan(_3518)), level(0.0)).x;
        float2 _3526 = float2(_1222, _1226);
        float _1250 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3526, float2(0.0), isnan(_3526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3526, float2(0.0), isnan(_3526)), level(0.0)).x;
        float _1252 = _1114;
        if (_1236)
        {
            _1206 = _1166;
        }
        float _1254 = _1206;
        if (!_1236)
        {
            _1106 = 4.0;
        }
        float _1256 = _1106;
        float _1258 = _1254;
        float _1260 = _1256;
        if (!_1236)
        {
            float2 _3550 = float2(_1140, _1114);
            float _1262 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3550, float2(0.0), isnan(_3550)), level(_1256)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3550, float2(0.0), isnan(_3550)), level(_1256)).x;
            _1258 = _1262;
        }
        float _1264 = _1258;
        bool _1266 = _1238 != 0.0;
        bool _1268 = isnan(_1238);
        bool _1270 = _1266 || _1268;
        bool _1272 = isnan(0.0);
        bool _1274 = _1270 || _1272;
        bool _1276 = _1242 != 0.0;
        bool _1278 = isnan(_1242);
        bool _1280 = _1276 || _1278;
        bool _1282 = isnan(0.0);
        bool _1284 = _1280 || _1282;
        bool _1286 = _1246 != 0.0;
        bool _1288 = isnan(_1246);
        bool _1290 = _1286 || _1288;
        bool _1292 = isnan(0.0);
        bool _1294 = _1290 || _1292;
        bool _1296 = _1250 != 0.0;
        bool _1298 = isnan(_1250);
        bool _1300 = _1296 || _1298;
        bool _1302 = isnan(0.0);
        bool _1304 = _1300 || _1302;
        bool _1306 = _1244 != 0.0;
        bool _1308 = isnan(_1244);
        bool _1310 = _1306 || _1308;
        bool _1312 = isnan(0.0);
        bool _1314 = _1310 || _1312;
        bool _1316 = _1248 != 0.0;
        bool _1318 = isnan(_1248);
        bool _1320 = _1316 || _1318;
        bool _1322 = isnan(0.0);
        bool _1324 = _1320 || _1322;
        bool _1326 = _1240 != 0.0;
        bool _1328 = isnan(_1240);
        bool _1330 = _1326 || _1328;
        bool _1332 = isnan(0.0);
        bool _1334 = _1330 || _1332;
        float _1336 = _1238;
        if (!_1274)
        {
            _1260 = 4.0;
        }
        float _1338 = _1260;
        if (!_1284)
        {
            _1130 = 4.0;
        }
        float _1340 = _1130;
        if (!_1294)
        {
            _1252 = 4.0;
        }
        float _1342 = _1252;
        if (!_1304)
        {
            _1032 = 4.0;
        }
        float _1344 = _1032;
        if (!_1274)
        {
            float2 _3663 = float2(_1222, _1114);
            float _1346 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3663, float2(0.0), isnan(_3663)), level(_1338)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3663, float2(0.0), isnan(_3663)), level(_1338)).x;
            _1336 = _1346;
        }
        float _1348 = _1336;
        float _1350 = _1246;
        if (!_1294)
        {
            float2 _3679 = float2(_1140, _1226);
            float _1352 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3679, float2(0.0), isnan(_3679)), level(_1342)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3679, float2(0.0), isnan(_3679)), level(_1342)).x;
            _1350 = _1352;
        }
        float _1354 = _1350;
        if (!_1314)
        {
            _1152 = 4.0;
        }
        float _1356 = _1152;
        if (!_1324)
        {
            _1194 = 4.0;
        }
        float _1358 = _1194;
        float _1360 = _1250;
        if (!_1304)
        {
            float2 _3705 = float2(_1222, _1226);
            float _1362 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3705, float2(0.0), isnan(_3705)), level(_1344)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3705, float2(0.0), isnan(_3705)), level(_1344)).x;
            _1360 = _1362;
        }
        float _1364 = _1360;
        float _1366 = _1244;
        if (!_1314)
        {
            float2 _3721 = float2(_1140, _1224);
            float _1368 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3721, float2(0.0), isnan(_3721)), level(_1356)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3721, float2(0.0), isnan(_3721)), level(_1356)).x;
            _1366 = _1368;
        }
        float _1370 = _1366;
        if (!_1334)
        {
            _1132 = 4.0;
        }
        float _1372 = _1132;
        float _1374 = _1248;
        if (!_1324)
        {
            float2 _3742 = float2(_1222, _1224);
            float _1376 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3742, float2(0.0), isnan(_3742)), level(_1358)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3742, float2(0.0), isnan(_3742)), level(_1358)).x;
            _1374 = _1376;
        }
        float _1378 = _1374;
        float _1380 = _1242;
        if (!_1284)
        {
            float2 _3758 = float2(_1112, _1226);
            float _1382 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3758, float2(0.0), isnan(_3758)), level(_1340)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3758, float2(0.0), isnan(_3758)), level(_1340)).x;
            _1380 = _1382;
        }
        float _1384 = _1380;
        float _1386 = _1240;
        if (!_1334)
        {
            float2 _3774 = float2(_1112, _1224);
            float _1388 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3774, float2(0.0), isnan(_3774)), level(_1372)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3774, float2(0.0), isnan(_3774)), level(_1372)).x;
            _1386 = _1388;
        }
        float _1390 = _1386;
        float _1392 = -_1264;
        float _1394 = _1160 + _1392;
        float _1396 = -_1354;
        float _1398 = _1160 + _1396;
        float _1400 = -_1348;
        float _1402 = _1160 + _1400;
        float _1404 = -_1364;
        float _1406 = _1160 + _1404;
        float _1408 = -_1370;
        float _1410 = _1160 + _1408;
        float _1412 = abs(_1394);
        float _1414 = abs(_1402);
        float _1416 = precise::max(_1412, _1414);
        float _1418 = -_1378;
        float _1420 = _1160 + _1418;
        float _1422 = -_1384;
        float _1424 = _1160 + _1422;
        float _1426 = -_1390;
        float _1428 = _1160 + _1426;
        float _1430 = abs(_1410);
        float _1432 = abs(_1398);
        float _1434 = precise::max(_1430, _1432);
        float _1436 = abs(_1420);
        float _1438 = abs(_1406);
        float _1440 = precise::max(_1436, _1438);
        float _1442 = abs(_1428);
        float _1444 = abs(_1424);
        float _1446 = precise::max(_1442, _1444);
        float _1448 = precise::max(_1434, _1440);
        float _1450 = precise::max(_1416, _1446);
        bool _1452 = _1448 > 0.00150000001303851604461669921875;
        bool _1454 = _1450 > 0.00150000001303851604461669921875;
        bool _1456 = _1454 || _1452;
        bool _1458 = !_1456;
        int _1460 = _1458 ? _1212 : 0;
        _1220 = _1460;
    }
    int _1462 = _1220;
    int _1464 = _158 + 4;
    int _1466 = _158 + 8;
    uint _1468 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1468)] = uint(_1462);
    uint _1470 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1470)] = as_type<uint>(_946);
    uint _1472 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1472)] = as_type<uint>(_944);
    uint _1474 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1474)] = as_type<uint>(_948);
    uint _1476 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1476)] = as_type<uint>(_350);
    uint _1478 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1478)] = as_type<uint>(_354);
    uint _1480 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1480)] = as_type<uint>(_356);
    uint _1482 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1482)] = as_type<uint>(_1174);
    uint _1484 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1484)] = as_type<uint>(_1216);
    uint _1486 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1486)] = as_type<uint>(_1178);
    float _1488 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1490 = _1216 * _1216;
    float _1492 = _354 * _354;
    float _1494 = fma(_1174, _1174, _1490);
    float _1496 = fma(_350, _350, _1492);
    float _1498 = fma(_1178, _1178, _1494);
    float _1500 = fma(_356, _356, _1496);
    float _1502 = sqrt(_1500);
    float _1504 = sqrt(_1498);
    bool _1506 = _1504 >= 9.9999999747524270787835121154785e-07;
    bool _1508 = isnan(_1504);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(9.9999999747524270787835121154785e-07);
    bool _1514 = _1510 || _1512;
    float _1516 = _1502;
    if (!_1514)
    {
        bool _1518 = _164 != _168;
        bool _1520 = isnan(_164);
        bool _1522 = _1518 || _1520;
        bool _1524 = isnan(_168);
        bool _1526 = _1522 || _1524;
        _1528 = _1526;
        if (!_1528)
        {
            float _1530 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1532 = _1530 > 0.0;
            bool _1534 = !_1532;
            if (!_1534)
            {
                float _1536 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1538 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1540 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1542 = _1538 * _1538;
                float _1544 = fma(_1536, _1536, _1542);
                float _1546 = fma(_1540, _1540, _1544);
                float _1548 = rsqrt(_1546);
                float _1550 = _1548 * 9.9999999747524270787835121154785e-07;
                float _1552 = _1536 * _1550;
                float _1554 = _1538 * _1550;
                float _1556 = _1540 * _1550;
                _394 = as_type<int>(_1552);
                _396 = as_type<int>(_1554);
                _398 = as_type<int>(_1556);
                _1528 = true;
            }
            else
            {
                bool _1558 = _1502 >= 9.9999999747524270787835121154785e-07;
                bool _1560 = isnan(_1502);
                bool _1562 = _1558 || _1560;
                bool _1564 = isnan(9.9999999747524270787835121154785e-07);
                bool _1566 = _1562 || _1564;
                if (!_1566)
                {
                    float _1568 = _944 * _944;
                    float _1570 = fma(_946, _946, _1568);
                    float _1572 = fma(_948, _948, _1570);
                    float _1574 = sqrt(_1572);
                    bool _1576 = _1574 >= 9.9999999747524270787835121154785e-07;
                    bool _1578 = isnan(_1574);
                    bool _1580 = _1576 || _1578;
                    bool _1582 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1584 = _1580 || _1582;
                    int _1586 = as_type<int>(_246);
                    int _1588 = as_type<int>(_1574);
                    if (_1584)
                    {
                        float _1590 = rsqrt(_1572);
                        _1586 = as_type<int>(_1590);
                    }
                    int _1592 = _1586;
                    if (!_1584)
                    {
                        _1588 = 0;
                    }
                    int _1594 = _1588;
                    int _1596 = _1594;
                    if (!_1584)
                    {
                        _386 = 897988541;
                    }
                    int _1598 = _386;
                    int _1600 = _1592;
                    int _1602 = _1598;
                    if (_1584)
                    {
                        float _1604 = as_type<float>(_1592) * 9.9999999747524270787835121154785e-07;
                        _1516 = _1604;
                    }
                    float _1606 = _1516;
                    if (!_1584)
                    {
                        _1600 = 0;
                    }
                    int _1608 = _1600;
                    int _1610 = _1608;
                    if (_1584)
                    {
                        float _1612 = _946 * _1606;
                        _1596 = as_type<int>(_1612);
                    }
                    int _1614 = _1596;
                    _394 = _1614;
                    if (_1584)
                    {
                        float _1616 = _944 * _1606;
                        _1602 = as_type<int>(_1616);
                    }
                    int _1618 = _1602;
                    _396 = _1618;
                    if (_1584)
                    {
                        float _1620 = _948 * _1606;
                        _1610 = as_type<int>(_1620);
                    }
                    int _1622 = _1610;
                    _398 = _1622;
                    _1528 = true;
                }
                else
                {
                    float _1624 = rsqrt(_1500);
                    float _1626 = _1624 * 9.9999999747524270787835121154785e-07;
                    float _1628 = _350 * _1626;
                    float _1630 = _354 * _1626;
                    float _1632 = _356 * _1626;
                    _394 = as_type<int>(_1628);
                    _396 = as_type<int>(_1630);
                    _398 = as_type<int>(_1632);
                    _1528 = true;
                }
            }
        }
    }
    else
    {
        float _1634 = _1502 * _1488;
        bool _1636 = _1634 >= 0.001000000047497451305389404296875;
        bool _1638 = isnan(_1634);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan(0.001000000047497451305389404296875);
        bool _1644 = _1640 || _1642;
        bool _1646 = _1634 > 0.0;
        bool _1648 = !_1644;
        bool _1650 = _1646 && _1648;
        bool _1652 = _1504 < 0.001000000047497451305389404296875;
        bool _1654 = _1652 && _1650;
        if (!_1654)
        {
            _388 = as_type<int>(_1174);
        }
        int _1656 = _388;
        int _1658 = _1656;
        if (_1654)
        {
            float _1660 = _350 * _1488;
            _1658 = as_type<int>(_1660);
        }
        int _1662 = _1658;
        _394 = _1662;
        if (!_1654)
        {
            _390 = as_type<int>(_1216);
        }
        int _1664 = _390;
        int _1666 = _1664;
        if (_1654)
        {
            float _1668 = _354 * _1488;
            _1666 = as_type<int>(_1668);
        }
        int _1670 = _1666;
        _396 = _1670;
        if (!_1654)
        {
            _392 = as_type<int>(_1178);
        }
        int _1672 = _392;
        _398 = _1672;
        if (_1654)
        {
            float _1674 = _356 * _1488;
            _398 = as_type<int>(_1674);
        }
    }
    _1528 = false;
    int _1676 = _394;
    int _1678 = _396;
    int _1680 = _398;
    uint _1682 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1682)] = uint(_1676);
    uint _1684 = uint(int(uint(_1464) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1684)] = uint(_1678);
    uint _1686 = uint(int(uint(_1466) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1686)] = uint(_1680);
}

