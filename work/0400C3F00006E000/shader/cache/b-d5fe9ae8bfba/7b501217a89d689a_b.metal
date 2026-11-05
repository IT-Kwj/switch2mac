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
    texture2d<float> cp_t_tcb_2A [[id(12)]];
    sampler cp_t_tcb_2ASmplr [[id(13)]];
    sampler cp_t_tcb_2ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1394 = false;
    float _62 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _69 = as_type<int>(_66) << 5;
    int _71 = _69 + as_type<int>(_64);
    float _73 = trunc(_62);
    int _75 = int(_73);
    bool _79 = _71 >= _75;
    int _81 = 0;
    float _83 = as_type<float>(_75);
    if (_79)
    {
        _81 = 0;
    }
    int _85 = _81;
    int _87 = _85;
    int _89 = _85;
    float _91 = 0.0;
    if (!_79)
    {
        int _93 = _71 << 4;
        int _95 = _93 + 12;
        uint _98 = uint(int(uint(_95) >> uint(2)));
        float _100 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_98)]);
        float _102 = trunc(_100);
        int _104 = int(_102);
        bool _106 = _104 >= 1;
        int _108 = _106 ? (-1) : 0;
        _83 = as_type<float>(_95);
        _91 = as_type<float>(_104);
        if (!_106)
        {
            _87 = 0;
        }
        int _110 = _87;
        bool _112 = !_106;
        _89 = _110;
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
            _83 = _118;
            _91 = _120;
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
            _89 = _142;
            if (!_126)
            {
                int _144 = ~_140;
                int _146 = (_144 != 0) ? 0 : 1;
                _89 = _146;
            }
        }
    }
    int _148 = _89;
    float _150 = _83;
    float _152 = _91;
    int _154 = _148 & 1;
    bool _156 = _154 != 0;
    if (!_156)
    {
        return;
    }
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _162 = _71 << 4;
    int _164 = _162 + 12;
    uint _166 = uint(int(uint(_162) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_166)]);
    int _170 = _162 + 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_172)]);
    int _176 = _162 + 8;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_178)]);
    int _182 = _162 + 12;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_184)]);
    uint _188 = uint(int(uint(_164) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_188)]);
    int _192 = as_type<int>(_160) & 512;
    bool _194 = _192 != 0;
    int _196 = as_type<int>(_160) & 1024;
    bool _198 = _196 != 0;
    int _200 = as_type<int>(_160) & 2048;
    bool _202 = _200 != 0;
    float _204 = 0.0;
    float _206 = 0.0;
    int _208 = 0;
    float _210 = 0.0;
    if (_194)
    {
        float _212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _204 = _212;
        _206 = _214;
        _208 = as_type<int>(_216);
        _210 = _218;
    }
    float _220 = _204;
    float _222 = _206;
    int _224 = _208;
    float _226 = _210;
    float _228 = 0.0;
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = 0.0;
    if (_194)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _228 = _236;
        _230 = _238;
        _232 = _240;
        _234 = _242;
    }
    float _244 = _228;
    float _246 = _230;
    float _248 = _232;
    float _250 = _234;
    float _252 = _160;
    float _254 = _150;
    float _256 = _152;
    if (_194)
    {
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _252 = _258;
        _254 = _260;
        _256 = _262;
    }
    float _264 = _252;
    float _266 = _254;
    float _268 = _256;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = 0.0;
    if (_194)
    {
        float _276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _270 = _276;
        _272 = _278;
        _274 = _280;
    }
    float _282 = _270;
    float _284 = _272;
    float _286 = _274;
    float _288 = 0.0;
    float _290 = 0.0;
    float _292 = 0.0;
    if (_194)
    {
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _288 = _294;
        _290 = _296;
        _292 = _298;
    }
    float _300 = _288;
    float _302 = _290;
    float _304 = _292;
    uint _306 = uint(int(uint(_162) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_306)]);
    int _310 = _162 + 4;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    float _314 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_312)]);
    int _316 = _162 + 8;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    float _320 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_318)]);
    int _322 = _162 + 12;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_324)]);
    uint _328 = uint(int(uint(_162) >> uint(2)));
    float _330 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_328)]);
    int _332 = _162 + 4;
    uint _334 = uint(int(uint(_332) >> uint(2)));
    float _336 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_334)]);
    int _338 = _162 + 8;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_340)]);
    uint _344 = uint(int(uint(_164) >> uint(2)));
    float _346 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_344)]);
    float _348 = _326;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = _186;
    float _360 = _284;
    float _362 = _266;
    float _364 = _302;
    float _366 = _282;
    float _368 = _286;
    float _370 = _264;
    float _372 = _268;
    float _374 = _300;
    float _376 = _304;
    float _378 = _168;
    float _380 = _220;
    float _382 = _244;
    float _384 = _180;
    int _386 = _224;
    int _388 = as_type<int>(_308);
    int _390 = as_type<int>(_336);
    int _392 = as_type<int>(_336);
    int _394 = as_type<int>(_336);
    if (!_194)
    {
        uint _396 = uint(int(uint(_162) >> uint(2)));
        float _398 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_396)]);
        int _400 = _162 + 4;
        uint _402 = uint(int(uint(_162) >> uint(2)));
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_402)]);
        int _406 = _162 + 8;
        uint _408 = uint(int(uint(_400) >> uint(2)));
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_408)]);
        uint _412 = uint(int(uint(_162) >> uint(2)));
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_412)]);
        uint _416 = uint(int(uint(_406) >> uint(2)));
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_416)]);
        uint _420 = uint(int(uint(_400) >> uint(2)));
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_420)]);
        uint _424 = uint(int(uint(_406) >> uint(2)));
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_424)]);
        uint _428 = uint(int(uint(_400) >> uint(2)));
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_428)]);
        uint _432 = uint(int(uint(_406) >> uint(2)));
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_432)]);
        float _436 = _398 * _398;
        float _438 = fma(_404, _404, _436);
        float _440 = _410 * _410;
        float _442 = fma(_414, _414, _438);
        float _444 = _418 * _418;
        float _446 = fma(_422, _422, _440);
        float _448 = fma(_426, _426, _444);
        float _450 = fma(_430, _430, _446);
        float _452 = sqrt(_442);
        float _454 = fma(_434, _434, _448);
        float _456 = sqrt(_450);
        float _458 = sqrt(_454);
        bool _460 = _452 > 0.0;
        bool _462 = _456 > 0.0;
        bool _464 = _458 > 0.0;
        float _466 = _440;
        float _468 = _458;
        float _470 = _456;
        float _472 = _452;
        float _474 = _442;
        float _476 = _448;
        float _478 = _404;
        float _480 = _410;
        float _482 = _398;
        float _484 = _430;
        _348 = _434;
        _356 = _454;
        _358 = _450;
        if (_460)
        {
            float _486 = rsqrt(_442);
            _466 = _486;
        }
        float _488 = _466;
        float _490 = 0.0;
        if (_462)
        {
            float _492 = rsqrt(_450);
            _490 = _492;
        }
        float _494 = _490;
        float _496 = 0.0;
        if (_464)
        {
            float _498 = rsqrt(_454);
            _496 = _498;
        }
        float _500 = _496;
        if (!_460)
        {
            _468 = 0.0;
        }
        float _502 = _468;
        float _504 = _502;
        _350 = _488;
        if (_460)
        {
            float _506 = _398 * _488;
            _504 = _506;
        }
        float _508 = _504;
        _366 = _508;
        if (!_460)
        {
            _470 = 0.0;
        }
        float _510 = _470;
        float _512 = _510;
        if (_460)
        {
            float _514 = _404 * _488;
            _512 = _514;
        }
        float _516 = _512;
        _370 = _516;
        if (!_462)
        {
            _472 = 0.0;
        }
        float _518 = _472;
        float _520 = _518;
        if (!_462)
        {
            _474 = 0.0;
        }
        float _522 = _474;
        float _524 = _522;
        _352 = _494;
        if (_462)
        {
            float _526 = _410 * _494;
            _520 = _526;
        }
        float _528 = _520;
        _360 = _528;
        if (_462)
        {
            float _530 = _430 * _494;
            _524 = _530;
        }
        float _532 = _524;
        _364 = _532;
        if (!_460)
        {
            _476 = 0.0;
        }
        float _534 = _476;
        float _536 = _534;
        if (_460)
        {
            float _538 = _414 * _488;
            _536 = _538;
        }
        float _540 = _536;
        _374 = _540;
        if (!_462)
        {
            _478 = 0.0;
        }
        float _542 = _478;
        float _544 = _542;
        if (_462)
        {
            float _546 = _422 * _494;
            _544 = _546;
        }
        float _548 = _544;
        _362 = _548;
        if (!_464)
        {
            _480 = 0.0;
        }
        float _550 = _480;
        float _552 = _550;
        if (!_464)
        {
            _482 = 0.0;
        }
        float _554 = _482;
        float _556 = _554;
        _354 = _500;
        if (_464)
        {
            float _558 = _418 * _500;
            _552 = _558;
        }
        float _560 = _552;
        _368 = _560;
        if (!_464)
        {
            _484 = 0.0;
        }
        float _562 = _484;
        _376 = _562;
        if (_464)
        {
            float _564 = _426 * _500;
            _556 = _564;
        }
        float _566 = _556;
        _372 = _566;
        if (_464)
        {
            float _568 = _434 * _500;
            _376 = _568;
        }
    }
    float _570 = _348;
    float _572 = _350;
    float _574 = _352;
    float _576 = _354;
    float _578 = _356;
    float _580 = _358;
    float _582 = _360;
    float _584 = _362;
    float _586 = _364;
    float _588 = _366;
    float _590 = _368;
    float _592 = _370;
    float _594 = _372;
    float _596 = _374;
    float _598 = _376;
    float _600 = _570;
    float _602 = _594;
    if (_198)
    {
        float _604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _600 = _604;
    }
    float _606 = _600;
    float _608 = 0.0;
    float _610 = 0.0;
    float _612 = 0.0;
    if (_198)
    {
        uint _614 = uint(int(uint(_162) >> uint(2)));
        float _616 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_614)]);
        int _618 = _162 + 4;
        uint _620 = uint(int(uint(_618) >> uint(2)));
        float _622 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_620)]);
        int _624 = _162 + 8;
        uint _626 = uint(int(uint(_624) >> uint(2)));
        float _628 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_626)]);
        _608 = _616;
        _610 = _622;
        _612 = _628;
    }
    float _630 = _608;
    float _632 = _610;
    float _634 = _612;
    float _636 = 0.0;
    float _638 = 0.0;
    float _640 = 0.0;
    if (_198)
    {
        uint _642 = uint(int(uint(_162) >> uint(2)));
        float _644 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_642)]);
        int _646 = _162 + 4;
        uint _648 = uint(int(uint(_646) >> uint(2)));
        float _650 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_648)]);
        int _652 = _162 + 8;
        uint _654 = uint(int(uint(_652) >> uint(2)));
        float _656 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_654)]);
        _636 = _644;
        _638 = _650;
        _640 = _656;
    }
    float _658 = _636;
    float _660 = _638;
    float _662 = _640;
    float _664 = _572;
    float _666 = _574;
    float _668 = _576;
    float _670 = _578;
    if (_202)
    {
        uint _672 = uint(int(uint(_162) >> uint(2)));
        float _674 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_672)]);
        int _676 = _162 + 4;
        uint _678 = uint(int(uint(_676) >> uint(2)));
        float _680 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_678)]);
        int _682 = _162 + 8;
        uint _684 = uint(int(uint(_682) >> uint(2)));
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_684)]);
        int _688 = _162 + 12;
        uint _690 = uint(int(uint(_688) >> uint(2)));
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_690)]);
        _664 = _674;
        _666 = _680;
        _668 = _686;
        _670 = _692;
    }
    float _694 = _664;
    float _696 = _666;
    float _698 = _668;
    float _700 = _670;
    float _702 = 0.0;
    float _704 = 0.0;
    float _706 = 0.0;
    float _708 = 0.0;
    if (_202)
    {
        uint _710 = uint(int(uint(_162) >> uint(2)));
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_710)]);
        int _714 = _162 + 4;
        uint _716 = uint(int(uint(_714) >> uint(2)));
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_716)]);
        int _720 = _162 + 8;
        uint _722 = uint(int(uint(_720) >> uint(2)));
        float _724 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_722)]);
        int _726 = _162 + 12;
        uint _728 = uint(int(uint(_726) >> uint(2)));
        float _730 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_728)]);
        _702 = _712;
        _704 = _718;
        _706 = _724;
        _708 = _730;
    }
    float _732 = _702;
    float _734 = _704;
    float _736 = _706;
    float _738 = _708;
    float _740 = _580;
    if (_198)
    {
        float _742 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _740 = _742;
    }
    float _744 = _740;
    float _746 = _190 * _158;
    float _748 = _314 * _746;
    float _750 = _308 * _746;
    float _752 = _174 + _748;
    float _754 = _168 + _750;
    int _756 = as_type<int>(_750);
    int _758 = as_type<int>(_750);
    if (_194)
    {
        float _760 = _752 * _222;
        _378 = _760;
    }
    float _762 = _378;
    float _764 = _320 * _746;
    float _766 = _762;
    int _768 = as_type<int>(_764);
    int _770 = as_type<int>(_764);
    if (_194)
    {
        float _772 = fma(_754, _220, _762);
        _380 = _772;
    }
    float _774 = _380;
    float _776 = _774;
    if (_194)
    {
        float _778 = _752 * _246;
        _766 = _778;
    }
    float _780 = _766;
    float _782 = _180 + _764;
    float _784 = _780;
    if (_194)
    {
        float _786 = fma(_754, _244, _780);
        _382 = _786;
    }
    float _788 = _382;
    float _790 = _788;
    if (_194)
    {
        float _792 = fma(_782, as_type<float>(_224), _774);
        _776 = _792;
    }
    float _794 = _776;
    float _796 = _794;
    if (!_194)
    {
        _384 = 0.0;
    }
    float _798 = _384;
    float _800 = _798;
    if (_194)
    {
        float _802 = fma(_782, _248, _788);
        _790 = _802;
    }
    float _804 = _790;
    float _806 = _804;
    if (_194)
    {
        float _808 = _226 + _794;
        _800 = _808;
    }
    float _810 = _800;
    float _812 = _810;
    if (!_194)
    {
        _784 = 0.0;
    }
    float _814 = _784;
    float _816 = _814;
    if (_194)
    {
        float _818 = _250 + _804;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = _820;
    if (_198)
    {
        float _824 = _752 * _632;
        _796 = _824;
    }
    float _826 = _796;
    float _828 = _660;
    float _830 = _826;
    float _832 = _734;
    float _834 = _662;
    float _836 = _736;
    float _838 = _698;
    if (_198)
    {
        float _840 = _752 * _660;
        _828 = _840;
    }
    float _842 = _828;
    float _844 = _842;
    if (_198)
    {
        float _846 = fma(_754, _630, _826);
        _830 = _846;
    }
    float _848 = _830;
    float _850 = _848;
    if (_202)
    {
        float _852 = _752 * _696;
        _806 = _852;
    }
    float _854 = _806;
    float _856 = _854;
    if (_198)
    {
        float _858 = fma(_754, _658, _842);
        _844 = _858;
    }
    float _860 = _844;
    if (_202)
    {
        float _862 = _752 * _734;
        _832 = _862;
    }
    float _864 = _832;
    float _866 = _864;
    if (_202)
    {
        float _868 = fma(_754, _694, _854);
        _856 = _868;
    }
    float _870 = _856;
    float _872 = _870;
    if (_202)
    {
        float _874 = fma(_754, _732, _864);
        _866 = _874;
    }
    float _876 = _866;
    if (_198)
    {
        float _878 = fma(_782, _634, _848);
        _850 = _878;
    }
    float _880 = _850;
    if (_198)
    {
        float _882 = fma(_782, _662, _860);
        _834 = _882;
    }
    float _884 = _834;
    if (_202)
    {
        float _886 = fma(_782, _698, _870);
        _872 = _886;
    }
    float _888 = _872;
    if (_202)
    {
        float _890 = fma(_782, _736, _876);
        _836 = _890;
    }
    float _892 = _836;
    float _894 = _892;
    if (_198)
    {
        float _896 = _606 + _880;
        _812 = _896;
    }
    float _898 = _812;
    float _900 = _898;
    if (_198)
    {
        float _902 = _744 + _884;
        _822 = _902;
    }
    float _904 = _822;
    float _906 = _904;
    float _908 = 6.2500002968590706586837768554688e-05;
    if (_202)
    {
        float _910 = _700 + _888;
        _900 = _910;
    }
    float _912 = _900;
    if (_202)
    {
        float _914 = _738 + _892;
        _906 = _914;
    }
    float _916 = _906;
    float _918 = fma(_912, 6.2500002968590706586837768554688e-05, 0.5);
    float _920 = fma(_916, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2797 = float2(_918, _920);
    float _922 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_2797, float2(0.0), isnan(_2797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_2797, float2(0.0), isnan(_2797)), level(0.0)).x;
    float _924 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _926 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _928 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _930 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _932 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _934 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    bool _936 = _922 != 0.0;
    bool _938 = isnan(_922);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = -_346;
    float _948 = _924 + _946;
    bool _950 = _948 > 0.001000000047497451305389404296875;
    bool _952 = isnan(_948);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.001000000047497451305389404296875);
    bool _958 = _954 || _956;
    float _960 = _918;
    if (!_944)
    {
        _838 = 4.0;
    }
    float _962 = _838;
    float _964 = _922;
    if (!_944)
    {
        float2 _2869 = float2(_918, _920);
        float _966 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_2869, float2(0.0), isnan(_2869)), level(_962)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_2869, float2(0.0), isnan(_2869)), level(_962)).x;
        _964 = _966;
    }
    float _968 = _964;
    if (!_958)
    {
        _386 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x);
    }
    int _970 = _386;
    uint _972 = uint(int(uint(_164) >> uint(2)));
    float _974 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_972)]);
    int _976 = _970;
    if (!_958)
    {
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _976 = as_type<int>(_978);
    }
    int _980 = _976;
    float _982 = abs(_926);
    float _984 = log2(_982);
    float _986 = _930 * _934;
    float _988 = _928 * _934;
    float _990 = _986 * _582;
    float _992 = _932 * _934;
    float _994 = _158 * _984;
    float _996 = fma(_988, _584, _990);
    float _998 = exp2(_994);
    float _1000 = fma(_992, _586, _996);
    float _1002 = _158 * _1000;
    float _1004 = _986 * _588;
    float _1006 = _986 * _590;
    float _1008 = fma(_988, _592, _1004);
    float _1010 = fma(_314, _998, _1002);
    float _1012 = fma(_988, _594, _1006);
    float _1014 = fma(_992, _596, _1008);
    float _1016 = fma(_992, _598, _1012);
    float _1018 = _158 * _1014;
    float _1020 = _158 * _1016;
    float _1022 = fma(_308, _998, _1018);
    float _1024 = fma(_320, _998, _1020);
    float _1026 = _968 * 2000.0;
    bool _1028 = _1026 != 0.0;
    bool _1030 = isnan(_1026);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    bool _1038 = _948 <= 0.001000000047497451305389404296875;
    bool _1040 = !_1036;
    bool _1042 = _1038 && _1040;
    int _1044 = _980;
    uint _1046 = as_type<uint>(_1026);
    float _1048 = _992;
    float _1050 = _1012;
    if (!_958)
    {
        float _1052 = _1026 + as_type<float>(_980);
        _1044 = as_type<int>(_1052);
    }
    int _1054 = _1044;
    if (!_958)
    {
        int _1056 = _162 + 4;
        _1046 = uint(_1056);
    }
    uint _1058 = _1046;
    bool _1060 = !_1042;
    int _1062 = _1060 ? as_type<int>(_974) : 0;
    if (!_958)
    {
        uint _1064 = uint(int(uint(int(_1058)) >> uint(2)));
        (*spvDescriptorSet0.cp_s10)._m0[int(_1064)] = uint(_1054);
    }
    if (_958)
    {
        _388 = _1062;
    }
    int _1066 = _388;
    int _1068 = _1066;
    if (!_958)
    {
        float _1070 = fma(_912, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float2 _3059 = float2(_1070, _920);
        float _1072 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3059, float2(0.0), isnan(_3059)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3059, float2(0.0), isnan(_3059)), level(0.0)).x;
        float _1074 = fma(_912, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _1076 = fma(_916, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1078 = fma(_916, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _3074 = float2(_1074, _920);
        float _1080 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3074, float2(0.0), isnan(_3074)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3074, float2(0.0), isnan(_3074)), level(0.0)).x;
        float2 _3082 = float2(_918, _1076);
        float _1082 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3082, float2(0.0), isnan(_3082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3082, float2(0.0), isnan(_3082)), level(0.0)).x;
        float2 _3090 = float2(_918, _1078);
        float _1084 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3090, float2(0.0), isnan(_3090)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3090, float2(0.0), isnan(_3090)), level(0.0)).x;
        float2 _3098 = float2(_1070, _1076);
        float _1086 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3098, float2(0.0), isnan(_3098)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3098, float2(0.0), isnan(_3098)), level(0.0)).x;
        float2 _3106 = float2(_1070, _1078);
        float _1088 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3106, float2(0.0), isnan(_3106)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3106, float2(0.0), isnan(_3106)), level(0.0)).x;
        float2 _3114 = float2(_1074, _1076);
        float _1090 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3114, float2(0.0), isnan(_3114)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3114, float2(0.0), isnan(_3114)), level(0.0)).x;
        float2 _3122 = float2(_1074, _1078);
        float _1092 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3122, float2(0.0), isnan(_3122)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3122, float2(0.0), isnan(_3122)), level(0.0)).x;
        bool _1094 = _1072 != 0.0;
        bool _1096 = isnan(_1072);
        bool _1098 = _1094 || _1096;
        bool _1100 = isnan(0.0);
        bool _1102 = _1098 || _1100;
        float _1104 = _1070;
        float _1106 = _920;
        float _1108 = _1092;
        float _1110 = _1080;
        float _1112 = _1090;
        if (!_1102)
        {
            _1048 = 4.0;
        }
        float _1114 = _1048;
        float _1116 = _1072;
        float _1118 = _1114;
        if (!_1102)
        {
            float2 _3156 = float2(_1070, _920);
            float _1120 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3156, float2(0.0), isnan(_3156)), level(_1114)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3156, float2(0.0), isnan(_3156)), level(_1114)).x;
            _1116 = _1120;
        }
        float _1122 = _1116;
        bool _1124 = _1080 != 0.0;
        bool _1126 = isnan(_1080);
        bool _1128 = _1124 || _1126;
        bool _1130 = isnan(0.0);
        bool _1132 = _1128 || _1130;
        bool _1134 = _1092 != 0.0;
        bool _1136 = isnan(_1092);
        bool _1138 = _1134 || _1136;
        bool _1140 = isnan(0.0);
        bool _1142 = _1138 || _1140;
        bool _1144 = _1088 != 0.0;
        bool _1146 = isnan(_1088);
        bool _1148 = _1144 || _1146;
        bool _1150 = isnan(0.0);
        bool _1152 = _1148 || _1150;
        bool _1154 = _1090 != 0.0;
        bool _1156 = isnan(_1090);
        bool _1158 = _1154 || _1156;
        bool _1160 = isnan(0.0);
        bool _1162 = _1158 || _1160;
        bool _1164 = _1086 != 0.0;
        bool _1166 = isnan(_1086);
        bool _1168 = _1164 || _1166;
        bool _1170 = isnan(0.0);
        bool _1172 = _1168 || _1170;
        bool _1174 = _1082 != 0.0;
        bool _1176 = isnan(_1082);
        bool _1178 = _1174 || _1176;
        bool _1180 = isnan(0.0);
        bool _1182 = _1178 || _1180;
        bool _1184 = _1084 != 0.0;
        bool _1186 = isnan(_1084);
        bool _1188 = _1184 || _1186;
        bool _1190 = isnan(0.0);
        bool _1192 = _1188 || _1190;
        if (!_1132)
        {
            _960 = 4.0;
        }
        float _1194 = _960;
        if (_1142)
        {
            _1104 = _1092;
        }
        float _1196 = _1104;
        if (!_1152)
        {
            _894 = 4.0;
        }
        float _1198 = _894;
        if (_1162)
        {
            _1106 = _1090;
        }
        float _1200 = _1106;
        if (!_1142)
        {
            _1108 = 4.0;
        }
        float _1202 = _1108;
        if (!_1132)
        {
            float2 _3273 = float2(_1074, _920);
            float _1204 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3273, float2(0.0), isnan(_3273)), level(_1194)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3273, float2(0.0), isnan(_3273)), level(_1194)).x;
            _1110 = _1204;
        }
        float _1206 = _1110;
        float _1208 = _1088;
        if (!_1152)
        {
            float2 _3289 = float2(_1070, _1078);
            float _1210 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3289, float2(0.0), isnan(_3289)), level(_1198)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3289, float2(0.0), isnan(_3289)), level(_1198)).x;
            _1208 = _1210;
        }
        float _1212 = _1208;
        if (!_1172)
        {
            _908 = 4.0;
        }
        float _1214 = _908;
        if (!_1162)
        {
            _1112 = 4.0;
        }
        float _1216 = _1112;
        float _1218 = _1196;
        if (!_1142)
        {
            float2 _3315 = float2(_1074, _1078);
            float _1220 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3315, float2(0.0), isnan(_3315)), level(_1202)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3315, float2(0.0), isnan(_3315)), level(_1202)).x;
            _1218 = _1220;
        }
        float _1222 = _1218;
        float _1224 = _1086;
        if (!_1172)
        {
            float2 _3331 = float2(_1070, _1076);
            float _1226 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3331, float2(0.0), isnan(_3331)), level(_1214)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3331, float2(0.0), isnan(_3331)), level(_1214)).x;
            _1224 = _1226;
        }
        float _1228 = _1224;
        if (!_1182)
        {
            _1118 = 4.0;
        }
        float _1230 = _1118;
        float _1232 = _1200;
        if (!_1162)
        {
            float2 _3352 = float2(_1074, _1076);
            float _1234 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3352, float2(0.0), isnan(_3352)), level(_1216)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3352, float2(0.0), isnan(_3352)), level(_1216)).x;
            _1232 = _1234;
        }
        float _1236 = _1232;
        if (!_1192)
        {
            _1050 = 4.0;
        }
        float _1238 = _1050;
        float _1240 = _1082;
        if (!_1182)
        {
            float2 _3373 = float2(_918, _1076);
            float _1242 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3373, float2(0.0), isnan(_3373)), level(_1230)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3373, float2(0.0), isnan(_3373)), level(_1230)).x;
            _1240 = _1242;
        }
        float _1244 = _1240;
        float _1246 = _1084;
        if (!_1192)
        {
            float2 _3389 = float2(_918, _1078);
            float _1248 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3389, float2(0.0), isnan(_3389)), level(_1238)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3389, float2(0.0), isnan(_3389)), level(_1238)).x;
            _1246 = _1248;
        }
        float _1250 = _1246;
        float _1252 = -_1122;
        float _1254 = _968 + _1252;
        float _1256 = -_1212;
        float _1258 = _968 + _1256;
        float _1260 = -_1206;
        float _1262 = _968 + _1260;
        float _1264 = abs(_1254);
        float _1266 = abs(_1262);
        float _1268 = precise::max(_1264, _1266);
        float _1270 = -_1222;
        float _1272 = _968 + _1270;
        float _1274 = -_1228;
        float _1276 = _968 + _1274;
        float _1278 = -_1236;
        float _1280 = _968 + _1278;
        float _1282 = -_1244;
        float _1284 = _968 + _1282;
        float _1286 = abs(_1276);
        float _1288 = abs(_1258);
        float _1290 = precise::max(_1286, _1288);
        float _1292 = -_1250;
        float _1294 = _968 + _1292;
        float _1296 = abs(_1280);
        float _1298 = abs(_1272);
        float _1300 = precise::max(_1296, _1298);
        float _1302 = abs(_1284);
        float _1304 = abs(_1294);
        float _1306 = precise::max(_1302, _1304);
        float _1308 = precise::max(_1290, _1300);
        float _1310 = precise::max(_1268, _1306);
        bool _1312 = _1308 > 0.00150000001303851604461669921875;
        bool _1314 = _1310 > 0.00150000001303851604461669921875;
        bool _1316 = _1314 || _1312;
        bool _1318 = !_1316;
        int _1320 = _1318 ? _1062 : 0;
        _1068 = _1320;
    }
    int _1322 = _1068;
    int _1324 = _162 + 4;
    int _1326 = _162 + 8;
    uint _1328 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1328)] = uint(_1322);
    uint _1330 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1330)] = as_type<uint>(_754);
    uint _1332 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1332)] = as_type<uint>(_752);
    uint _1334 = uint(int(uint(_1326) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1334)] = as_type<uint>(_782);
    uint _1336 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1336)] = as_type<uint>(_1022);
    uint _1338 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1338)] = as_type<uint>(_1010);
    uint _1340 = uint(int(uint(_1326) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1340)] = as_type<uint>(_1024);
    uint _1342 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1342)] = as_type<uint>(_750);
    uint _1344 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1344)] = as_type<uint>(_748);
    uint _1346 = uint(int(uint(_1326) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1346)] = as_type<uint>(_764);
    float _1348 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1350 = _748 * _748;
    float _1352 = _1010 * _1010;
    float _1354 = fma(_750, _750, _1350);
    float _1356 = fma(_1022, _1022, _1352);
    float _1358 = fma(_764, _764, _1354);
    float _1360 = fma(_1024, _1024, _1356);
    float _1362 = sqrt(_1360);
    float _1364 = sqrt(_1358);
    bool _1366 = _1364 >= 9.9999999747524270787835121154785e-07;
    bool _1368 = isnan(_1364);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan(9.9999999747524270787835121154785e-07);
    bool _1374 = _1370 || _1372;
    int _1390;
    if (!_1374)
    {
        bool _1376 = _924 != _346;
        bool _1378 = isnan(_924);
        bool _1380 = _1376 || _1378;
        bool _1382 = isnan(_346);
        bool _1384 = _1380 || _1382;
        if (_1384)
        {
            _756 = as_type<int>(_330);
        }
        int _1386 = _756;
        int _1388 = _1386;
        _1390 = _1386;
        if (_1384)
        {
            _768 = as_type<int>(_342);
        }
        int _1392 = _768;
        _770 = _1392;
        _1394 = _1384;
        if (!_1394)
        {
            float _1396 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1398 = _1396 > 0.0;
            bool _1400 = !_1398;
            int _1402 = as_type<int>(_1396);
            if (!_1400)
            {
                float _1404 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1406 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1408 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1410 = _1406 * _582;
                float _1412 = _1406 * _588;
                float _1414 = _1406 * _590;
                float _1416 = fma(_1404, _584, _1410);
                float _1418 = fma(_1404, _592, _1412);
                float _1420 = fma(_1404, _594, _1414);
                float _1422 = fma(_1408, _586, _1416);
                float _1424 = fma(_1408, _596, _1418);
                float _1426 = fma(_1408, _598, _1420);
                float _1428 = _1422 * _1422;
                float _1430 = fma(_1424, _1424, _1428);
                float _1432 = fma(_1426, _1426, _1430);
                float _1434 = rsqrt(_1432);
                float _1436 = _1434 * 9.9999999747524270787835121154785e-07;
                float _1438 = _1424 * _1436;
                float _1440 = _1422 * _1436;
                float _1442 = _1426 * _1436;
                _1390 = as_type<int>(_1438);
                _394 = as_type<int>(_1440);
                _770 = as_type<int>(_1442);
                _1394 = true;
            }
            else
            {
                bool _1444 = _1362 >= 9.9999999747524270787835121154785e-07;
                bool _1446 = isnan(_1362);
                bool _1448 = _1444 || _1446;
                bool _1450 = isnan(9.9999999747524270787835121154785e-07);
                bool _1452 = _1448 || _1450;
                if (!_1452)
                {
                    float _1454 = _752 * _752;
                    float _1456 = fma(_754, _754, _1454);
                    float _1458 = fma(_782, _782, _1456);
                    float _1460 = sqrt(_1458);
                    bool _1462 = _1460 >= 9.9999999747524270787835121154785e-07;
                    bool _1464 = isnan(_1460);
                    bool _1466 = _1462 || _1464;
                    bool _1468 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1470 = _1466 || _1468;
                    float _1472 = _1460;
                    if (_1470)
                    {
                        float _1474 = rsqrt(_1458);
                        _1472 = _1474;
                    }
                    float _1476 = _1472;
                    if (!_1470)
                    {
                        _1388 = 0;
                    }
                    int _1478 = _1388;
                    int _1480 = _1478;
                    if (!_1470)
                    {
                        _390 = 897988541;
                    }
                    int _1482 = _390;
                    int _1484 = _1482;
                    if (!_1470)
                    {
                        _1402 = 0;
                    }
                    int _1486 = _1402;
                    int _1488 = _1486;
                    if (_1470)
                    {
                        float _1490 = _1476 * 9.9999999747524270787835121154785e-07;
                        _602 = _1490;
                    }
                    float _1492 = _602;
                    if (_1470)
                    {
                        float _1494 = _754 * _1492;
                        _1480 = as_type<int>(_1494);
                    }
                    int _1496 = _1480;
                    _1390 = _1496;
                    if (_1470)
                    {
                        float _1498 = _752 * _1492;
                        _1484 = as_type<int>(_1498);
                    }
                    int _1500 = _1484;
                    _394 = _1500;
                    if (_1470)
                    {
                        float _1502 = _782 * _1492;
                        _1488 = as_type<int>(_1502);
                    }
                    int _1504 = _1488;
                    _770 = _1504;
                    _1394 = true;
                }
                else
                {
                    float _1506 = rsqrt(_1360);
                    float _1508 = _1506 * 9.9999999747524270787835121154785e-07;
                    float _1510 = _1022 * _1508;
                    float _1512 = _1010 * _1508;
                    float _1514 = _1024 * _1508;
                    _1390 = as_type<int>(_1510);
                    _394 = as_type<int>(_1512);
                    _770 = as_type<int>(_1514);
                    _1394 = true;
                }
            }
        }
    }
    else
    {
        float _1516 = _1362 * _1348;
        bool _1518 = _1516 >= 0.001000000047497451305389404296875;
        bool _1520 = isnan(_1516);
        bool _1522 = _1518 || _1520;
        bool _1524 = isnan(0.001000000047497451305389404296875);
        bool _1526 = _1522 || _1524;
        bool _1528 = _1516 > 0.0;
        bool _1530 = !_1526;
        bool _1532 = _1528 && _1530;
        bool _1534 = _1364 < 0.001000000047497451305389404296875;
        bool _1536 = _1534 && _1532;
        if (!_1536)
        {
            _392 = as_type<int>(_748);
        }
        int _1538 = _392;
        int _1540 = _1538;
        if (_1536)
        {
            float _1542 = _1022 * _1348;
            _758 = as_type<int>(_1542);
        }
        int _1544 = _758;
        _1390 = _1544;
        if (_1536)
        {
            float _1546 = _1010 * _1348;
            _1540 = as_type<int>(_1546);
        }
        int _1548 = _1540;
        _394 = _1548;
        if (_1536)
        {
            float _1550 = _1024 * _1348;
            _770 = as_type<int>(_1550);
        }
    }
    _1394 = false;
    int _1552 = _1390;
    int _1554 = _394;
    int _1556 = _770;
    uint _1558 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1558)] = uint(_1552);
    uint _1560 = uint(int(uint(_1324) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1560)] = uint(_1554);
    uint _1562 = uint(int(uint(_1326) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1562)] = uint(_1556);
}

