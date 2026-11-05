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
    texture2d<float> cp_t_tcb_2C [[id(12)]];
    sampler cp_t_tcb_2CSmplr [[id(13)]];
    sampler cp_t_tcb_2CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1110 = false;
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
    float _208 = 0.0;
    float _210 = 0.0;
    if (_194)
    {
        float _212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _204 = _212;
        _206 = _214;
        _208 = _216;
        _210 = _218;
    }
    float _220 = _204;
    float _222 = _206;
    float _224 = _208;
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
    float _348 = _186;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = _326;
    float _360 = _282;
    float _362 = _284;
    float _364 = _286;
    float _366 = _264;
    float _368 = _266;
    float _370 = _268;
    float _372 = _300;
    float _374 = _302;
    float _376 = _304;
    float _378 = _168;
    float _380 = _180;
    float _382 = _220;
    float _384 = _244;
    float _386 = _224;
    float _388 = _248;
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
        _348 = _450;
        _356 = _454;
        _358 = _434;
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
        _360 = _508;
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
        _366 = _516;
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
        _362 = _528;
        if (_462)
        {
            float _530 = _430 * _494;
            _524 = _530;
        }
        float _532 = _524;
        _374 = _532;
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
        _372 = _540;
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
        _368 = _548;
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
        _364 = _560;
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
        _370 = _566;
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
    float _602 = _580;
    float _604 = _592;
    if (_198)
    {
        float _606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _600 = _606;
    }
    float _608 = _600;
    float _610 = 0.0;
    float _612 = 0.0;
    float _614 = 0.0;
    if (_198)
    {
        uint _616 = uint(int(uint(_162) >> uint(2)));
        float _618 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_616)]);
        int _620 = _162 + 4;
        uint _622 = uint(int(uint(_620) >> uint(2)));
        float _624 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_622)]);
        int _626 = _162 + 8;
        uint _628 = uint(int(uint(_626) >> uint(2)));
        float _630 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_628)]);
        _610 = _618;
        _612 = _624;
        _614 = _630;
    }
    float _632 = _610;
    float _634 = _612;
    float _636 = _614;
    float _638 = 0.0;
    float _640 = 0.0;
    float _642 = 0.0;
    if (_198)
    {
        uint _644 = uint(int(uint(_162) >> uint(2)));
        float _646 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_644)]);
        int _648 = _162 + 4;
        uint _650 = uint(int(uint(_648) >> uint(2)));
        float _652 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_650)]);
        int _654 = _162 + 8;
        uint _656 = uint(int(uint(_654) >> uint(2)));
        float _658 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_656)]);
        _638 = _646;
        _640 = _652;
        _642 = _658;
    }
    float _660 = _638;
    float _662 = _640;
    float _664 = _642;
    float _666 = _572;
    float _668 = _574;
    float _670 = _576;
    float _672 = _578;
    if (_202)
    {
        uint _674 = uint(int(uint(_162) >> uint(2)));
        float _676 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_674)]);
        int _678 = _162 + 4;
        uint _680 = uint(int(uint(_678) >> uint(2)));
        float _682 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_680)]);
        int _684 = _162 + 8;
        uint _686 = uint(int(uint(_684) >> uint(2)));
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_686)]);
        int _690 = _162 + 12;
        uint _692 = uint(int(uint(_690) >> uint(2)));
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_692)]);
        _666 = _676;
        _668 = _682;
        _670 = _688;
        _672 = _694;
    }
    float _696 = _666;
    float _698 = _668;
    float _700 = _670;
    float _702 = _672;
    float _704 = 0.0;
    float _706 = 0.0;
    float _708 = 0.0;
    float _710 = 0.0;
    if (_202)
    {
        uint _712 = uint(int(uint(_162) >> uint(2)));
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_712)]);
        int _716 = _162 + 4;
        uint _718 = uint(int(uint(_716) >> uint(2)));
        float _720 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_718)]);
        int _722 = _162 + 8;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        float _726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_724)]);
        int _728 = _162 + 12;
        uint _730 = uint(int(uint(_728) >> uint(2)));
        float _732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_730)]);
        _704 = _714;
        _706 = _720;
        _708 = _726;
        _710 = _732;
    }
    float _734 = _704;
    float _736 = _706;
    float _738 = _708;
    float _740 = _710;
    float _742 = 0.0;
    if (_198)
    {
        float _744 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _742 = _744;
    }
    float _746 = _742;
    float _748 = _190 * _158;
    float _750 = _314 * _748;
    float _752 = _308 * _748;
    float _754 = _174 + _750;
    float _756 = _168 + _752;
    float _758 = _320 * _748;
    int _760 = as_type<int>(_752);
    int _762 = as_type<int>(_758);
    int _764 = as_type<int>(_752);
    int _766 = as_type<int>(_758);
    if (_194)
    {
        float _768 = _754 * _222;
        _378 = _768;
    }
    float _770 = _378;
    float _772 = _180 + _758;
    float _774 = _770;
    if (_194)
    {
        float _776 = _754 * _246;
        _380 = _776;
    }
    float _778 = _380;
    float _780 = _778;
    if (_194)
    {
        float _782 = fma(_756, _220, _770);
        _774 = _782;
    }
    float _784 = _774;
    if (!_194)
    {
        _382 = 0.0;
    }
    float _786 = _382;
    float _788 = _786;
    if (_194)
    {
        float _790 = fma(_756, _244, _778);
        _384 = _790;
    }
    float _792 = _384;
    float _794 = _792;
    if (_194)
    {
        float _796 = fma(_772, _224, _784);
        _386 = _796;
    }
    float _798 = _386;
    float _800 = _798;
    if (_194)
    {
        float _802 = fma(_772, _248, _792);
        _794 = _802;
    }
    float _804 = _794;
    float _806 = _804;
    if (_194)
    {
        float _808 = _226 + _798;
        _788 = _808;
    }
    float _810 = _788;
    float _812 = _810;
    if (!_194)
    {
        _602 = 0.0;
    }
    float _814 = _602;
    float _816 = _814;
    if (_194)
    {
        float _818 = _250 + _804;
        _816 = _818;
    }
    float _820 = _816;
    float _822 = _820;
    if (!_198)
    {
        _806 = _810;
    }
    float _824 = _806;
    float _826 = _824;
    if (_198)
    {
        float _828 = _754 * _634;
        _800 = _828;
    }
    float _830 = _800;
    float _832 = _662;
    float _834 = _830;
    float _836 = _736;
    float _838 = _664;
    float _840 = _738;
    if (_198)
    {
        float _842 = _754 * _662;
        _832 = _842;
    }
    float _844 = _832;
    float _846 = _844;
    if (_198)
    {
        float _848 = fma(_756, _632, _830);
        _834 = _848;
    }
    float _850 = _834;
    float _852 = _850;
    if (_202)
    {
        float _854 = _754 * _698;
        _388 = _854;
    }
    float _856 = _388;
    float _858 = _856;
    if (_198)
    {
        float _860 = fma(_756, _660, _844);
        _846 = _860;
    }
    float _862 = _846;
    if (_202)
    {
        float _864 = _754 * _736;
        _836 = _864;
    }
    float _866 = _836;
    float _868 = _866;
    if (_202)
    {
        float _870 = fma(_756, _696, _856);
        _858 = _870;
    }
    float _872 = _858;
    float _874 = _872;
    if (_202)
    {
        float _876 = fma(_756, _734, _866);
        _868 = _876;
    }
    float _878 = _868;
    if (_198)
    {
        float _880 = fma(_772, _636, _850);
        _852 = _880;
    }
    float _882 = _852;
    if (_198)
    {
        float _884 = fma(_772, _664, _862);
        _838 = _884;
    }
    float _886 = _838;
    if (_202)
    {
        float _888 = fma(_772, _700, _872);
        _874 = _888;
    }
    float _890 = _874;
    if (_202)
    {
        float _892 = fma(_772, _738, _878);
        _840 = _892;
    }
    float _894 = _840;
    if (_198)
    {
        float _896 = _608 + _882;
        _826 = _896;
    }
    float _898 = _826;
    float _900 = _898;
    if (_198)
    {
        float _902 = _746 + _886;
        _822 = _902;
    }
    float _904 = _822;
    float _906 = _904;
    if (_202)
    {
        float _908 = _702 + _890;
        _900 = _908;
    }
    float _910 = _900;
    if (_202)
    {
        float _912 = _740 + _894;
        _906 = _912;
    }
    float _914 = _906;
    float _916 = fma(_910, 6.2500002968590706586837768554688e-05, 0.5);
    float _918 = fma(_914, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2513 = float2(_916, _918);
    float2 _922 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2513, float2(0.0), isnan(_2513)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2513, float2(0.0), isnan(_2513)), level(0.0)).xy;
    float _924 = _922.x;
    float _926 = _922.y;
    float _928 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _930 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _932 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _934 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _936 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _938 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _940 = -_346;
    float _942 = _928 + _940;
    bool _944 = _924 != 0.0;
    bool _946 = isnan(_924);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = _942 > 0.001000000047497451305389404296875;
    bool _956 = isnan(_942);
    bool _958 = _954 || _956;
    bool _960 = isnan(0.001000000047497451305389404296875);
    bool _962 = _958 || _960;
    int _964 = as_type<int>(_942);
    if (_952)
    {
        _964 = as_type<int>(_926);
    }
    int _966 = _964;
    if (!_952)
    {
        _780 = 4.0;
    }
    float _968 = _780;
    if (!_962)
    {
        _812 = (*spvDescriptorSet0.cp_c0)._m0[41].x;
    }
    float _970 = _812;
    int _972 = _966;
    if (!_952)
    {
        float2 _2604 = float2(_916, _918);
        float _974 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2604, float2(0.0), isnan(_2604)), level(_968)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2604, float2(0.0), isnan(_2604)), level(_968)).y;
        _972 = as_type<int>(_974);
    }
    int _976 = _972;
    float _978 = _970;
    if (!_962)
    {
        float _980 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _978 = _980;
    }
    float _982 = _978;
    uint _984 = uint(int(uint(_164) >> uint(2)));
    float _986 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_984)]);
    float _988 = abs(_930);
    float _990 = log2(_988);
    float _992 = _934 * _938;
    float _994 = _932 * _938;
    float _996 = _992 * _582;
    float _998 = _992 * _584;
    float _1000 = _992 * _586;
    float _1002 = _158 * _990;
    float _1004 = _936 * _938;
    float _1006 = fma(_994, _588, _996);
    float _1008 = exp2(_1002);
    float _1010 = fma(_994, _590, _998);
    float _1012 = fma(_994, _592, _1000);
    float _1014 = fma(_1004, _594, _1006);
    float _1016 = fma(_1004, _596, _1010);
    float _1018 = fma(_1004, _598, _1012);
    float _1020 = _158 * _1014;
    float _1022 = _158 * _1016;
    float _1024 = _158 * _1018;
    int _1026 = _162 + 8;
    float _1028 = fma(_308, _1008, _1020);
    float _1030 = fma(_314, _1008, _1022);
    float _1032 = fma(_320, _1008, _1024);
    int _1034 = _976;
    if (!_962)
    {
        float _1036 = fma(as_type<float>(_976), 2000.0, _982);
        _1034 = as_type<int>(_1036);
    }
    int _1038 = _1034;
    int _1040 = _162 + 4;
    if (!_962)
    {
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        (*spvDescriptorSet0.cp_s10)._m0[int(_1042)] = uint(_1038);
    }
    uint _1044 = uint(int(uint(_164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1044)] = as_type<uint>(_986);
    uint _1046 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1046)] = as_type<uint>(_756);
    uint _1048 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1048)] = as_type<uint>(_754);
    uint _1050 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1050)] = as_type<uint>(_772);
    uint _1052 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1052)] = as_type<uint>(_1028);
    uint _1054 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1054)] = as_type<uint>(_1030);
    uint _1056 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1056)] = as_type<uint>(_1032);
    uint _1058 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1058)] = as_type<uint>(_752);
    uint _1060 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1060)] = as_type<uint>(_750);
    uint _1062 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1062)] = as_type<uint>(_758);
    float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1066 = _750 * _750;
    float _1068 = fma(_752, _752, _1066);
    float _1070 = fma(_758, _758, _1068);
    float _1072 = sqrt(_1070);
    float _1074 = _1030 * _1030;
    float _1076 = fma(_1028, _1028, _1074);
    float _1078 = fma(_1032, _1032, _1076);
    float _1080 = sqrt(_1078);
    bool _1082 = _1072 >= 9.9999999747524270787835121154785e-07;
    bool _1084 = isnan(_1072);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(9.9999999747524270787835121154785e-07);
    bool _1090 = _1086 || _1088;
    int _1106;
    if (!_1090)
    {
        bool _1092 = _928 != _346;
        bool _1094 = isnan(_928);
        bool _1096 = _1092 || _1094;
        bool _1098 = isnan(_346);
        bool _1100 = _1096 || _1098;
        if (_1100)
        {
            _760 = as_type<int>(_330);
        }
        int _1102 = _760;
        int _1104 = _1102;
        _1106 = _1102;
        if (_1100)
        {
            _762 = as_type<int>(_342);
        }
        int _1108 = _762;
        _766 = _1108;
        _1110 = _1100;
        if (!_1110)
        {
            float _1112 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1114 = _1112 > 0.0;
            bool _1116 = !_1114;
            int _1118 = as_type<int>(_1112);
            if (!_1116)
            {
                float _1120 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1122 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1124 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1126 = _1122 * _584;
                float _1128 = _1122 * _582;
                float _1130 = _1122 * _586;
                float _1132 = fma(_1120, _590, _1126);
                float _1134 = fma(_1120, _588, _1128);
                float _1136 = fma(_1120, _592, _1130);
                float _1138 = fma(_1124, _596, _1132);
                float _1140 = fma(_1124, _594, _1134);
                float _1142 = fma(_1124, _598, _1136);
                float _1144 = _1138 * _1138;
                float _1146 = fma(_1140, _1140, _1144);
                float _1148 = fma(_1142, _1142, _1146);
                float _1150 = rsqrt(_1148);
                float _1152 = _1150 * 9.9999999747524270787835121154785e-07;
                float _1154 = _1140 * _1152;
                float _1156 = _1138 * _1152;
                float _1158 = _1142 * _1152;
                _1106 = as_type<int>(_1154);
                _394 = as_type<int>(_1156);
                _766 = as_type<int>(_1158);
                _1110 = true;
            }
            else
            {
                bool _1160 = _1080 >= 9.9999999747524270787835121154785e-07;
                bool _1162 = isnan(_1080);
                bool _1164 = _1160 || _1162;
                bool _1166 = isnan(9.9999999747524270787835121154785e-07);
                bool _1168 = _1164 || _1166;
                if (!_1168)
                {
                    float _1170 = _754 * _754;
                    float _1172 = fma(_756, _756, _1170);
                    float _1174 = fma(_772, _772, _1172);
                    float _1176 = sqrt(_1174);
                    bool _1178 = _1176 >= 9.9999999747524270787835121154785e-07;
                    bool _1180 = isnan(_1176);
                    bool _1182 = _1178 || _1180;
                    bool _1184 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1186 = _1182 || _1184;
                    float _1188 = _1176;
                    if (_1186)
                    {
                        float _1190 = rsqrt(_1174);
                        _1188 = _1190;
                    }
                    float _1192 = _1188;
                    if (!_1186)
                    {
                        _1104 = 0;
                    }
                    int _1194 = _1104;
                    int _1196 = _1194;
                    if (!_1186)
                    {
                        _390 = 897988541;
                    }
                    int _1198 = _390;
                    int _1200 = _1198;
                    if (!_1186)
                    {
                        _1118 = 0;
                    }
                    int _1202 = _1118;
                    int _1204 = _1202;
                    if (_1186)
                    {
                        float _1206 = _1192 * 9.9999999747524270787835121154785e-07;
                        _604 = _1206;
                    }
                    float _1208 = _604;
                    if (_1186)
                    {
                        float _1210 = _756 * _1208;
                        _1196 = as_type<int>(_1210);
                    }
                    int _1212 = _1196;
                    _1106 = _1212;
                    if (_1186)
                    {
                        float _1214 = _754 * _1208;
                        _1200 = as_type<int>(_1214);
                    }
                    int _1216 = _1200;
                    _394 = _1216;
                    if (_1186)
                    {
                        float _1218 = _772 * _1208;
                        _1204 = as_type<int>(_1218);
                    }
                    int _1220 = _1204;
                    _766 = _1220;
                    _1110 = true;
                }
                else
                {
                    float _1222 = rsqrt(_1078);
                    float _1224 = _1222 * 9.9999999747524270787835121154785e-07;
                    float _1226 = _1028 * _1224;
                    float _1228 = _1030 * _1224;
                    float _1230 = _1032 * _1224;
                    _1106 = as_type<int>(_1226);
                    _394 = as_type<int>(_1228);
                    _766 = as_type<int>(_1230);
                    _1110 = true;
                }
            }
        }
    }
    else
    {
        float _1232 = _1080 * _1064;
        bool _1234 = _1232 >= 0.001000000047497451305389404296875;
        bool _1236 = isnan(_1232);
        bool _1238 = _1234 || _1236;
        bool _1240 = isnan(0.001000000047497451305389404296875);
        bool _1242 = _1238 || _1240;
        bool _1244 = _1232 > 0.0;
        bool _1246 = !_1242;
        bool _1248 = _1244 && _1246;
        bool _1250 = _1072 < 0.001000000047497451305389404296875;
        bool _1252 = _1250 && _1248;
        if (!_1252)
        {
            _392 = as_type<int>(_750);
        }
        int _1254 = _392;
        int _1256 = _1254;
        if (_1252)
        {
            float _1258 = _1028 * _1064;
            _764 = as_type<int>(_1258);
        }
        int _1260 = _764;
        _1106 = _1260;
        if (_1252)
        {
            float _1262 = _1030 * _1064;
            _1256 = as_type<int>(_1262);
        }
        int _1264 = _1256;
        _394 = _1264;
        if (_1252)
        {
            float _1266 = _1032 * _1064;
            _766 = as_type<int>(_1266);
        }
    }
    _1110 = false;
    int _1268 = _1106;
    int _1270 = _394;
    int _1272 = _766;
    uint _1274 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1274)] = uint(_1268);
    uint _1276 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1276)] = uint(_1270);
    uint _1278 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1278)] = uint(_1272);
}

