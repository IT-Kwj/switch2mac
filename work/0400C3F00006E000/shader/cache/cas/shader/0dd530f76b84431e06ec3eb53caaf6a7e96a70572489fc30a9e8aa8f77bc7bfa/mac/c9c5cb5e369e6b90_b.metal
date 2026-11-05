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
    texture3d<float> cp_t_tcb_12 [[id(12)]];
    sampler cp_t_tcb_12Smplr [[id(13)]];
    sampler cp_t_tcb_12Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1856 = false;
    bool _1594 = false;
    bool _1210 = false;
    bool _730 = false;
    float _64 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    float _68 = as_type<float>(gl_WorkGroupID.x);
    int _71 = as_type<int>(_68) << 5;
    int _73 = _71 + as_type<int>(_66);
    float _75 = trunc(_64);
    int _77 = int(_75);
    bool _81 = _73 >= _77;
    int _83 = 0;
    if (_81)
    {
        _83 = 0;
    }
    int _85 = _83;
    int _87 = _85;
    int _89 = _85;
    if (!_81)
    {
        int _91 = _73 << 4;
        int _93 = _91 + 12;
        uint _96 = uint(int(uint(_93) >> uint(2)));
        float _98 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_96)]);
        float _100 = trunc(_98);
        int _102 = int(_100);
        bool _104 = _102 >= 1;
        int _106 = _104 ? (-1) : 0;
        if (!_104)
        {
            _87 = 0;
        }
        int _108 = _87;
        bool _110 = !_104;
        _89 = _108;
        if (!_110)
        {
            float _112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _114 = uint(int(uint(_93) >> uint(2)));
            float _116 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_114)]);
            float _118 = float(_102);
            float _120 = -_116;
            float _122 = _112 + _120;
            bool _124 = _122 > _118;
            int _126 = as_type<int>(_112);
            if (!_124)
            {
                bool _128 = _112 >= _116;
                bool _130 = isnan(_112);
                bool _132 = _128 || _130;
                bool _134 = isnan(_116);
                bool _136 = _132 || _134;
                _106 = _136 ? (-1) : 0;
            }
            int _138 = _106;
            if (_124)
            {
                _126 = 0;
            }
            int _140 = _126;
            _89 = _140;
            if (!_124)
            {
                int _142 = ~_138;
                int _144 = (_142 != 0) ? 0 : 1;
                _89 = _144;
            }
        }
    }
    int _146 = _89;
    int _148 = _146 & 1;
    bool _150 = _148 != 0;
    if (!_150)
    {
        return;
    }
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _154 = _73 << 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_156)]);
    int _160 = _154 + 4;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_162)]);
    int _166 = _154 + 8;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = as_type<int>(_152) & 512;
    bool _174 = _172 != 0;
    int _176 = _154 + 12;
    uint _178 = uint(int(uint(_154) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    int _182 = _154 + 4;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_184)]);
    int _188 = _154 + 8;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    uint _194 = uint(int(uint(_154) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_194)]);
    int _198 = _154 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_200)]);
    int _204 = _154 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    float _210 = 0.0;
    float _212 = 0.0;
    float _214 = 0.0;
    if (_174)
    {
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _210 = _216;
        _212 = _218;
        _214 = _220;
    }
    float _222 = _210;
    float _224 = _212;
    float _226 = _214;
    float _228 = 0.0;
    float _230 = 0.0;
    float _232 = 0.0;
    if (_174)
    {
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _228 = _234;
        _230 = _236;
        _232 = _238;
    }
    float _240 = _228;
    float _242 = _230;
    float _244 = _232;
    float _246 = 0.0;
    float _248 = 0.0;
    float _250 = 0.0;
    if (_174)
    {
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _246 = _252;
        _248 = _254;
        _250 = _256;
    }
    float _258 = _246;
    float _260 = _248;
    float _262 = _250;
    uint _264 = uint(int(uint(_154) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_264)]);
    uint _268 = uint(int(uint(_176) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_268)]);
    uint _272 = uint(int(uint(_176) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_272)]);
    float _276 = _224;
    float _278 = _240;
    float _280 = _222;
    float _282 = _242;
    float _284 = _244;
    float _286 = _224;
    float _288 = _226;
    float _290 = _260;
    float _292 = _258;
    float _294 = _262;
    int _296 = as_type<int>(_202);
    int _298 = as_type<int>(_202);
    int _300 = as_type<int>(_208);
    int _302 = as_type<int>(_196);
    int _304 = as_type<int>(_202);
    int _306 = as_type<int>(_208);
    if (!_174)
    {
        int _308 = _154 + 4;
        int _310 = _154 + 8;
        uint _312 = uint(int(uint(_154) >> uint(2)));
        float _314 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_312)]);
        uint _316 = uint(int(uint(_308) >> uint(2)));
        float _318 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_316)]);
        uint _320 = uint(int(uint(_310) >> uint(2)));
        float _322 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_320)]);
        uint _324 = uint(int(uint(_308) >> uint(2)));
        float _326 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_324)]);
        uint _328 = uint(int(uint(_154) >> uint(2)));
        float _330 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_328)]);
        uint _332 = uint(int(uint(_310) >> uint(2)));
        float _334 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_332)]);
        uint _336 = uint(int(uint(_308) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_336)]);
        uint _340 = uint(int(uint(_154) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_340)]);
        uint _344 = uint(int(uint(_310) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_344)]);
        float _348 = _314 * _314;
        float _350 = _318 * _318;
        float _352 = _322 * _322;
        float _354 = fma(_326, _326, _350);
        float _356 = fma(_330, _330, _348);
        float _358 = fma(_334, _334, _352);
        float _360 = fma(_338, _338, _354);
        float _362 = fma(_342, _342, _356);
        float _364 = sqrt(_360);
        float _366 = fma(_346, _346, _358);
        float _368 = sqrt(_362);
        float _370 = sqrt(_366);
        bool _372 = _364 > 0.0;
        bool _374 = _368 > 0.0;
        bool _376 = _370 > 0.0;
        float _378 = 0.0;
        float _380 = _368;
        float _382 = _354;
        float _384 = _364;
        float _386 = _350;
        float _388 = _370;
        float _390 = _362;
        float _392 = _360;
        float _394 = _326;
        if (_372)
        {
            float _396 = rsqrt(_360);
            _378 = _396;
        }
        float _398 = _378;
        float _400 = _358;
        if (_374)
        {
            float _402 = rsqrt(_362);
            _400 = _402;
        }
        float _404 = _400;
        float _406 = 0.0;
        if (_376)
        {
            float _408 = rsqrt(_366);
            _406 = _408;
        }
        float _410 = _406;
        if (!_372)
        {
            _276 = 0.0;
        }
        float _412 = _276;
        float _414 = _412;
        if (_372)
        {
            float _416 = _326 * _398;
            _414 = _416;
        }
        float _418 = _414;
        _286 = _418;
        if (!_374)
        {
            _380 = 0.0;
        }
        float _420 = _380;
        float _422 = _420;
        if (!_374)
        {
            _382 = 0.0;
        }
        float _424 = _382;
        float _426 = _424;
        if (!_374)
        {
            _384 = 0.0;
        }
        float _428 = _384;
        float _430 = _428;
        if (_374)
        {
            float _432 = _314 * _404;
            _422 = _432;
        }
        float _434 = _422;
        _278 = _434;
        if (!_372)
        {
            _386 = 0.0;
        }
        float _436 = _386;
        float _438 = _436;
        if (_374)
        {
            float _440 = _330 * _404;
            _426 = _440;
        }
        float _442 = _426;
        _280 = _442;
        if (!_372)
        {
            _388 = 0.0;
        }
        float _444 = _388;
        float _446 = _444;
        if (_374)
        {
            float _448 = _342 * _404;
            _430 = _448;
        }
        float _450 = _430;
        _292 = _450;
        if (!_376)
        {
            _390 = 0.0;
        }
        float _452 = _390;
        float _454 = _452;
        if (_372)
        {
            float _456 = _318 * _398;
            _438 = _456;
        }
        float _458 = _438;
        _282 = _458;
        if (!_376)
        {
            _392 = 0.0;
        }
        float _460 = _392;
        float _462 = _460;
        if (_372)
        {
            float _464 = _338 * _398;
            _446 = _464;
        }
        float _466 = _446;
        _290 = _466;
        if (!_376)
        {
            _394 = 0.0;
        }
        float _468 = _394;
        _294 = _468;
        if (_376)
        {
            float _470 = _322 * _410;
            _454 = _470;
        }
        float _472 = _454;
        _284 = _472;
        if (_376)
        {
            float _474 = _334 * _410;
            _462 = _474;
        }
        float _476 = _462;
        _288 = _476;
        if (_376)
        {
            float _478 = _346 * _410;
            _294 = _478;
        }
    }
    float _480 = _278;
    float _482 = _280;
    float _484 = _282;
    float _486 = _284;
    float _488 = _286;
    float _490 = _288;
    float _492 = _290;
    float _494 = _292;
    float _496 = _294;
    float _498 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _500 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[27]);
    float _502 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[24]);
    float _504 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[25]);
    float _506 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[26]);
    float _508 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _510 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _512 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _514 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _516 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _518 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _522 = trunc(_500);
    int _524 = int(_522);
    float _526 = _274 * _504;
    float _528 = _274 * _502;
    float _530 = _498 * _526;
    bool _532 = _524 != 1;
    float _534 = abs(_508);
    float _536 = log2(_534);
    float _538 = _498 * _528;
    float _540 = _274 * _506;
    float _542 = _480;
    float _544 = _482;
    float _546 = _484;
    float _548 = _490;
    float _550 = _530;
    float _552 = _492;
    float _554 = _538;
    float _556 = _512;
    float _558 = _498;
    if (!_532)
    {
        float _560 = _530 * _480;
        _542 = _560;
    }
    float _562 = _542;
    float _564 = _562;
    if (!_532)
    {
        float _566 = fma(_538, _482, _562);
        _564 = _566;
    }
    float _568 = _564;
    if (!_532)
    {
        float _570 = _530 * _484;
        _544 = _570;
    }
    float _572 = _544;
    float _574 = _572;
    if (!_532)
    {
        float _576 = _530 * _486;
        _546 = _576;
    }
    float _578 = _546;
    float _580 = _498 * _540;
    float _582 = _498 * _536;
    if (!_532)
    {
        float _584 = fma(_538, _488, _572);
        _574 = _584;
    }
    float _586 = _574;
    if (!_532)
    {
        float _588 = fma(_538, _490, _578);
        _548 = _588;
    }
    float _590 = _548;
    float _592 = _274 * _498;
    float _594 = exp2(_582);
    if (!_532)
    {
        float _596 = fma(_580, _492, _586);
        _550 = _596;
    }
    float _598 = _550;
    if (_532)
    {
        _552 = _580;
    }
    float _600 = _552;
    float _602 = _600;
    if (!_532)
    {
        float _604 = fma(_580, _494, _568);
        _554 = _604;
    }
    float _606 = _554;
    if (!_532)
    {
        float _608 = fma(_580, _496, _590);
        _602 = _608;
    }
    float _610 = _602;
    bool _612 = _520 > 0.0;
    float _614 = fma(_180, _592, _158);
    float _616 = fma(_186, _592, _164);
    float _618 = _510 * _516;
    float _620 = _512 * _516;
    float _622 = _606 + _614;
    float _624 = _514 * _516;
    float _626 = fma(_192, _592, _170);
    float _628 = _598 + _616;
    float _630 = _498 * _618;
    float _632 = _498 * _620;
    float _634 = _498 * _624;
    float _636 = _610 + _626;
    float _638 = fma(_180, _594, _630);
    float _640 = fma(_186, _594, _632);
    float _642 = fma(_192, _594, _634);
    float _644 = -_270;
    float _646 = _518 + _644;
    float _648 = _594;
    float _650 = _626;
    float _652 = _630;
    bool _654 = _612;
    float _656 = _646;
    float _658 = _638;
    if (!_612)
    {
        _648 = _622;
    }
    float _660 = _648;
    float _662 = _660;
    float _664 = _660;
    if (!_612)
    {
        _650 = _628;
    }
    float _666 = _650;
    float _668 = _666;
    float _670 = _666;
    if (!_612)
    {
        _652 = _636;
    }
    float _672 = _652;
    bool _674 = !_612;
    float _676 = _672;
    float _678 = _672;
    if (!_674)
    {
        bool _680 = !_174;
        if (!_680)
        {
            float _682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _706 = _628 * _684;
            float _708 = _628 * _692;
            float _710 = fma(_622, _682, _706);
            float _712 = _628 * _700;
            float _714 = fma(_622, _690, _708);
            float _716 = fma(_636, _686, _710);
            float _718 = fma(_622, _698, _712);
            float _720 = fma(_636, _694, _714);
            float _722 = _688 + _716;
            float _724 = fma(_636, _702, _718);
            float _726 = _696 + _720;
            float _728 = _704 + _724;
            _664 = _722;
            _678 = _728;
            _670 = _726;
            _556 = _718;
            _730 = true;
        }
        else
        {
            int _732 = as_type<int>(_152) & 1024;
            bool _734 = _732 != 0;
            bool _736 = !_734;
            if (!_736)
            {
                float _738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _740 = uint(int(uint(_154) >> uint(2)));
                float _742 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_740)]);
                int _744 = _154 + 4;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                float _748 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_746)]);
                int _750 = _154 + 8;
                uint _752 = uint(int(uint(_750) >> uint(2)));
                float _754 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_752)]);
                uint _756 = uint(int(uint(_154) >> uint(2)));
                float _758 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_756)]);
                int _760 = _154 + 4;
                uint _762 = uint(int(uint(_760) >> uint(2)));
                float _764 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_762)]);
                int _766 = _154 + 8;
                uint _768 = uint(int(uint(_766) >> uint(2)));
                float _770 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_768)]);
                uint _772 = uint(int(uint(_154) >> uint(2)));
                float _774 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_772)]);
                int _776 = _154 + 4;
                uint _778 = uint(int(uint(_776) >> uint(2)));
                float _780 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_778)]);
                int _782 = _154 + 8;
                uint _784 = uint(int(uint(_782) >> uint(2)));
                float _786 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_784)]);
                float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _792 = _628 * _748;
                float _794 = _628 * _764;
                float _796 = fma(_622, _742, _792);
                float _798 = _628 * _780;
                float _800 = fma(_622, _758, _794);
                float _802 = fma(_622, _774, _798);
                float _804 = fma(_636, _754, _796);
                float _806 = fma(_636, _770, _800);
                float _808 = fma(_636, _786, _802);
                float _810 = _738 + _804;
                float _812 = _788 + _806;
                float _814 = _790 + _808;
                _664 = _810;
                _678 = _814;
                _670 = _812;
                _556 = _790;
                _730 = true;
            }
            else
            {
                int _816 = as_type<int>(_152) & 2048;
                bool _818 = _816 != 0;
                if (!_818)
                {
                    _662 = _622;
                }
                float _820 = _662;
                _664 = _820;
                if (!_818)
                {
                    _668 = _628;
                }
                float _822 = _668;
                _670 = _822;
                if (!_818)
                {
                    _676 = _636;
                }
                float _824 = _676;
                bool _826 = !_818;
                _678 = _824;
                if (!_826)
                {
                    uint _828 = uint(int(uint(_154) >> uint(2)));
                    float _830 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_828)]);
                    int _832 = _154 + 4;
                    uint _834 = uint(int(uint(_832) >> uint(2)));
                    float _836 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_834)]);
                    int _838 = _154 + 8;
                    uint _840 = uint(int(uint(_838) >> uint(2)));
                    float _842 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_840)]);
                    int _844 = _154 + 12;
                    uint _846 = uint(int(uint(_844) >> uint(2)));
                    float _848 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_846)]);
                    uint _850 = uint(int(uint(_154) >> uint(2)));
                    float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
                    int _854 = _154 + 4;
                    uint _856 = uint(int(uint(_854) >> uint(2)));
                    float _858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_856)]);
                    int _860 = _154 + 8;
                    uint _862 = uint(int(uint(_860) >> uint(2)));
                    float _864 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_862)]);
                    int _866 = _154 + 12;
                    uint _868 = uint(int(uint(_866) >> uint(2)));
                    float _870 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_868)]);
                    uint _872 = uint(int(uint(_154) >> uint(2)));
                    float _874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_872)]);
                    int _876 = _154 + 4;
                    uint _878 = uint(int(uint(_876) >> uint(2)));
                    float _880 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_878)]);
                    int _882 = _154 + 8;
                    uint _884 = uint(int(uint(_882) >> uint(2)));
                    float _886 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_884)]);
                    int _888 = _154 + 12;
                    uint _890 = uint(int(uint(_888) >> uint(2)));
                    float _892 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_890)]);
                    float _894 = _628 * _836;
                    float _896 = _628 * _858;
                    float _898 = fma(_622, _830, _894);
                    float _900 = _628 * _880;
                    float _902 = fma(_622, _852, _896);
                    float _904 = fma(_622, _874, _900);
                    float _906 = fma(_636, _842, _898);
                    float _908 = fma(_636, _864, _902);
                    float _910 = fma(_636, _886, _904);
                    float _912 = _906 + _848;
                    float _914 = _908 + _870;
                    float _916 = _910 + _892;
                    _664 = _912;
                    _678 = _916;
                    _670 = _914;
                    _556 = _904;
                }
            }
        }
    }
    _730 = false;
    float _918 = _664;
    float _920 = _678;
    float _922 = _670;
    float _924 = _556;
    float _926 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _928 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _930 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _932 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _934 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _936 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _938 = _926 != 0.0;
    bool _940 = isnan(_926);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.0);
    bool _946 = _942 || _944;
    float _948 = _518 * _928;
    float _950 = _518 * _930;
    float _952 = fma(_932, _918, _948);
    float _954 = fma(_932, _920, _950);
    float _956 = _518 * _934;
    float _958 = _936;
    float _960 = _924;
    if (_946)
    {
        float _962 = _266 * _936;
        _958 = _962;
    }
    float _964 = _958;
    float _966 = fma(_932, _922, _956);
    float _968 = -_964;
    bool _970 = _952 >= _968;
    bool _972 = isnan(_952);
    bool _974 = _970 || _972;
    bool _976 = isnan(_968);
    bool _978 = _974 || _976;
    float _980 = _952 + _964;
    float _982 = -_964;
    bool _984 = _954 >= _982;
    bool _986 = isnan(_954);
    bool _988 = _984 || _986;
    bool _990 = isnan(_982);
    bool _992 = _988 || _990;
    float _994 = _954 + _964;
    float _996 = _966 + _964;
    float _998 = -_964;
    bool _1000 = _966 >= _998;
    bool _1002 = isnan(_966);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan(_998);
    bool _1008 = _1004 || _1006;
    bool _1010 = !_978;
    float _1012 = -_980;
    float _1014 = _1010 ? _1012 : _980;
    bool _1016 = !_992;
    float _1018 = -_994;
    float _1020 = _1016 ? _1018 : _994;
    bool _1022 = !_1008;
    float _1024 = -_996;
    float _1026 = _1022 ? _1024 : _996;
    float _1028 = _1014 * 0.03125;
    float _1030 = _1020 * 0.03125;
    float _1032 = _1026 * 0.03125;
    float3 _3548 = float3(_1028, _1032, _1030);
    float3 _1036 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_3548, float3(0.0), isnan(_3548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_3548, float3(0.0), isnan(_3548)), level(0.0)).xyz;
    float _1038 = _1036.x;
    float _1040 = _1036.y;
    float _1042 = _1036.z;
    float _1044 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _1046 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _1048 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _1050 = _1038 + (-0.5);
    float _1052 = _1040 + (-0.5);
    float _1054 = _1042 + (-0.5);
    float _1056 = _1050 * _1044;
    float _1058 = _1052 * _1046;
    float _1060 = _1054 * _1048;
    float _1062 = _1048;
    float _1064 = _1046;
    float _1066 = _1050;
    if (!_612)
    {
        _1062 = _1056;
    }
    float _1068 = _1062;
    float _1070 = _1068;
    float _1072 = _1068;
    if (!_612)
    {
        _1064 = _1058;
    }
    float _1074 = _1064;
    float _1076 = _1074;
    float _1078 = _1074;
    if (!_612)
    {
        _1066 = _1060;
    }
    float _1080 = _1066;
    bool _1082 = !_612;
    float _1084 = _1080;
    float _1086 = _1080;
    if (!_1082)
    {
        bool _1088 = !_174;
        if (!_1088)
        {
            float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1092 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1108 = _1094 * _1096;
            float _1110 = _1094 * _1098;
            float _1112 = _1092 * _1096;
            float _1114 = -_1108;
            float _1116 = fma(_1090, _1100, _1114);
            float _1118 = -_1110;
            float _1120 = fma(_1092, _1100, _1118);
            float _1122 = -_1112;
            float _1124 = fma(_1090, _1098, _1122);
            float _1126 = _1104 * _1090;
            float _1128 = _1104 * _1116;
            float _1130 = _1106 * _1092;
            float _1132 = _1102 * _1098;
            float _1134 = -_1126;
            float _1136 = fma(_1102, _1092, _1134);
            float _1138 = -_1128;
            float _1140 = fma(_1102, _1120, _1138);
            float _1142 = _1104 * _1100;
            float _1144 = _1106 * _1096;
            float _1146 = -_1132;
            float _1148 = fma(_1104, _1096, _1146);
            float _1150 = fma(_1106, _1124, _1140);
            float _1152 = -_1142;
            float _1154 = fma(_1106, _1098, _1152);
            float _1156 = -_1144;
            float _1158 = fma(_1102, _1100, _1156);
            float _1160 = _1102 * _1094;
            float _1162 = -_1090;
            float _1164 = fma(_1162, _1100, _1108);
            float _1166 = -_1130;
            float _1168 = fma(_1104, _1094, _1166);
            float _1170 = 1.0 / _1150;
            float _1172 = -_1160;
            float _1174 = fma(_1106, _1090, _1172);
            float _1176 = _1154 * _1170;
            float _1178 = _1158 * _1170;
            float _1180 = _1148 * _1170;
            float _1182 = _1056 * _1170;
            float _1184 = _1058 * _1176;
            float _1186 = _1058 * _1178;
            float _1188 = _1058 * _1180;
            float _1190 = _1164 * _1170;
            float _1192 = _1168 * _1170;
            float _1194 = fma(_1120, _1182, _1184);
            float _1196 = _1174 * _1170;
            float _1198 = _1136 * _1170;
            float _1200 = fma(_1056, _1190, _1186);
            float _1202 = fma(_1124, _1182, _1188);
            float _1204 = fma(_1060, _1192, _1194);
            float _1206 = fma(_1060, _1196, _1200);
            float _1208 = fma(_1060, _1198, _1202);
            _1086 = _1208;
            _1078 = _1206;
            _1072 = _1204;
            _960 = _1104;
            _1210 = true;
        }
        else
        {
            int _1212 = as_type<int>(_152) & 1024;
            bool _1214 = _1212 != 0;
            if (_1214)
            {
                _654 = true;
            }
            bool _1216 = _654;
            bool _1218 = _1216;
            if (!_1214)
            {
                int _1220 = as_type<int>(_152) & 2048;
                bool _1222 = _1220 != 0;
                _1218 = _1222;
            }
            bool _1224 = _1218;
            if (!_1224)
            {
                _1070 = _1056;
            }
            float _1226 = _1070;
            _1072 = _1226;
            if (!_1224)
            {
                _1076 = _1058;
            }
            float _1228 = _1076;
            _1078 = _1228;
            if (!_1224)
            {
                _1084 = _1060;
            }
            float _1230 = _1084;
            bool _1232 = !_1224;
            _1086 = _1230;
            if (!_1232)
            {
                uint _1234 = uint(int(uint(_154) >> uint(2)));
                float _1236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1234)]);
                int _1238 = _154 + 4;
                uint _1240 = uint(int(uint(_1238) >> uint(2)));
                float _1242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1240)]);
                int _1244 = _154 + 8;
                uint _1246 = uint(int(uint(_1244) >> uint(2)));
                float _1248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1246)]);
                uint _1250 = uint(int(uint(_154) >> uint(2)));
                float _1252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1250)]);
                int _1254 = _154 + 4;
                uint _1256 = uint(int(uint(_1254) >> uint(2)));
                float _1258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1256)]);
                int _1260 = _154 + 8;
                uint _1262 = uint(int(uint(_1260) >> uint(2)));
                float _1264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1262)]);
                uint _1266 = uint(int(uint(_154) >> uint(2)));
                float _1268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1266)]);
                int _1270 = _154 + 4;
                uint _1272 = uint(int(uint(_1270) >> uint(2)));
                float _1274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1272)]);
                int _1276 = _154 + 8;
                uint _1278 = uint(int(uint(_1276) >> uint(2)));
                float _1280 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1278)]);
                float _1282 = _1248 * _1252;
                float _1284 = _1248 * _1258;
                float _1286 = _1242 * _1252;
                float _1288 = -_1282;
                float _1290 = fma(_1236, _1264, _1288);
                float _1292 = -_1284;
                float _1294 = fma(_1242, _1264, _1292);
                float _1296 = -_1286;
                float _1298 = fma(_1236, _1258, _1296);
                float _1300 = _1274 * _1236;
                float _1302 = _1274 * _1290;
                float _1304 = _1280 * _1242;
                float _1306 = _1268 * _1258;
                float _1308 = -_1300;
                float _1310 = fma(_1268, _1242, _1308);
                float _1312 = -_1302;
                float _1314 = fma(_1268, _1294, _1312);
                float _1316 = _1274 * _1264;
                float _1318 = _1280 * _1252;
                float _1320 = -_1306;
                float _1322 = fma(_1274, _1252, _1320);
                float _1324 = fma(_1280, _1298, _1314);
                float _1326 = -_1316;
                float _1328 = fma(_1280, _1258, _1326);
                float _1330 = -_1318;
                float _1332 = fma(_1268, _1264, _1330);
                float _1334 = _1268 * _1248;
                float _1336 = -_1236;
                float _1338 = fma(_1336, _1264, _1282);
                float _1340 = -_1304;
                float _1342 = fma(_1274, _1248, _1340);
                float _1344 = 1.0 / _1324;
                float _1346 = -_1334;
                float _1348 = fma(_1280, _1236, _1346);
                float _1350 = _1328 * _1344;
                float _1352 = _1332 * _1344;
                float _1354 = _1322 * _1344;
                float _1356 = _1056 * _1344;
                float _1358 = _1058 * _1350;
                float _1360 = _1058 * _1352;
                float _1362 = _1058 * _1354;
                float _1364 = _1338 * _1344;
                float _1366 = _1342 * _1344;
                float _1368 = fma(_1294, _1356, _1358);
                float _1370 = _1348 * _1344;
                float _1372 = _1310 * _1344;
                float _1374 = fma(_1056, _1364, _1360);
                float _1376 = fma(_1298, _1356, _1362);
                float _1378 = fma(_1060, _1366, _1368);
                float _1380 = fma(_1060, _1370, _1374);
                float _1382 = fma(_1060, _1372, _1376);
                _1086 = _1382;
                _1078 = _1380;
                _1072 = _1378;
                _960 = _1274;
            }
        }
    }
    _1210 = false;
    float _1384 = _1086;
    float _1386 = _1078;
    float _1388 = _1072;
    float _1390 = _960;
    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1404 = fma(_498, _1384, _642);
    uint _1406 = uint(int(uint(_176) >> uint(2)));
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1406)]);
    float _1410 = fma(_498, _1386, _640);
    bool _1412 = _1392 > 0.0;
    bool _1414 = _1394 > 0.0;
    float _1416 = _1396 * _1394;
    float _1418 = _498 * _1400;
    float _1420 = _1392;
    float _1422 = _1396;
    float _1424 = _1390;
    bool _1426 = _1414;
    float _1428 = _1398;
    if (_1412)
    {
        float _1430 = 1.0 / _1392;
        _1420 = _1430;
    }
    float _1432 = _1420;
    float _1434 = _498 * _1402;
    if (_1414)
    {
        float _1436 = -_1416;
        float _1438 = fma(_266, _1436, _1396);
        _1422 = _1438;
    }
    float _1440 = _1422;
    float _1442 = _498 * _1398;
    float _1444 = _1440;
    if (_1412)
    {
        float _1446 = _646 * _1432;
        _656 = _1446;
    }
    float _1448 = _656;
    if (_1412)
    {
        float _1450 = precise::min(_1448, 1.0);
        _1424 = _1450;
    }
    float _1452 = _1424;
    float _1454 = fma(_498, _1388, _638);
    if (_1412)
    {
        float _1456 = _1452 * _1440;
        _1444 = _1456;
    }
    float _1458 = _1444;
    float _1460 = _1442 * _1458;
    float _1462 = _1418 * _1458;
    float _1464 = _1434 * _1458;
    bool _1466 = !_174;
    float _1588;
    float _1590;
    float _1592;
    if (!_1466)
    {
        float _1468 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1470 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1474 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1476 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1478 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1480 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1482 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1484 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1486 = _1472 * _1474;
        float _1488 = _1472 * _1476;
        float _1490 = _1470 * _1474;
        float _1492 = -_1486;
        float _1494 = fma(_1468, _1478, _1492);
        float _1496 = -_1488;
        float _1498 = fma(_1470, _1478, _1496);
        float _1500 = _1484 * _1470;
        float _1502 = _1484 * _1474;
        float _1504 = _1482 * _1494;
        float _1506 = -_1490;
        float _1508 = fma(_1468, _1476, _1506);
        float _1510 = _1482 * _1468;
        float _1512 = _1480 * _1476;
        float _1514 = -_1504;
        float _1516 = fma(_1480, _1498, _1514);
        float _1518 = -_1502;
        float _1520 = fma(_1480, _1478, _1518);
        float _1522 = -_1510;
        float _1524 = fma(_1480, _1470, _1522);
        float _1526 = _1482 * _1478;
        float _1528 = fma(_1484, _1508, _1516);
        float _1530 = -_1500;
        float _1532 = fma(_1482, _1472, _1530);
        float _1534 = -_1512;
        float _1536 = fma(_1482, _1474, _1534);
        float _1538 = -_1526;
        float _1540 = fma(_1484, _1476, _1538);
        float _1542 = 1.0 / _1528;
        float _1544 = _1480 * _1472;
        float _1546 = -_1544;
        float _1548 = fma(_1484, _1468, _1546);
        float _1550 = _1540 * _1542;
        float _1552 = _1520 * _1542;
        float _1554 = -_1468;
        float _1556 = fma(_1554, _1478, _1486);
        float _1558 = _1536 * _1542;
        float _1560 = _1550 * _1462;
        float _1562 = _1460 * _1542;
        float _1564 = _1552 * _1462;
        float _1566 = _1556 * _1542;
        float _1568 = _1558 * _1462;
        float _1570 = _1532 * _1542;
        float _1572 = fma(_1498, _1562, _1560);
        float _1574 = _1548 * _1542;
        float _1576 = fma(_1566, _1460, _1564);
        float _1578 = _1524 * _1542;
        float _1580 = fma(_1508, _1562, _1568);
        float _1582 = fma(_1570, _1464, _1572);
        float _1584 = fma(_1574, _1464, _1576);
        float _1586 = fma(_1578, _1464, _1580);
        _1588 = _1582;
        _1590 = _1584;
        _1592 = _1586;
        _1594 = true;
    }
    else
    {
        int _1596 = as_type<int>(_152) & 1024;
        bool _1598 = _1596 != 0;
        if (_1598)
        {
            _1426 = true;
        }
        bool _1600 = _1426;
        bool _1602 = _1600;
        if (!_1598)
        {
            int _1604 = as_type<int>(_152) & 2048;
            bool _1606 = _1604 != 0;
            _1602 = _1606;
        }
        bool _1608 = _1602;
        if (!_1608)
        {
            _1428 = _1460;
        }
        float _1610 = _1428;
        _1588 = _1610;
        if (!_1608)
        {
            _558 = _1462;
        }
        float _1612 = _558;
        _1590 = _1612;
        if (!_1608)
        {
            _658 = _1464;
        }
        float _1614 = _658;
        bool _1616 = !_1608;
        _1592 = _1614;
        if (!_1616)
        {
            uint _1618 = uint(int(uint(_154) >> uint(2)));
            float _1620 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1618)]);
            int _1622 = _154 + 4;
            uint _1624 = uint(int(uint(_1622) >> uint(2)));
            float _1626 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1624)]);
            int _1628 = _154 + 8;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            float _1632 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1630)]);
            uint _1634 = uint(int(uint(_154) >> uint(2)));
            float _1636 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1634)]);
            int _1638 = _154 + 4;
            uint _1640 = uint(int(uint(_1638) >> uint(2)));
            float _1642 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1640)]);
            int _1644 = _154 + 8;
            uint _1646 = uint(int(uint(_1644) >> uint(2)));
            float _1648 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1646)]);
            uint _1650 = uint(int(uint(_154) >> uint(2)));
            float _1652 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1650)]);
            int _1654 = _154 + 4;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            float _1658 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1656)]);
            int _1660 = _154 + 8;
            uint _1662 = uint(int(uint(_1660) >> uint(2)));
            float _1664 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1662)]);
            float _1666 = _1632 * _1636;
            float _1668 = _1632 * _1642;
            float _1670 = _1626 * _1636;
            float _1672 = -_1666;
            float _1674 = fma(_1620, _1648, _1672);
            float _1676 = -_1668;
            float _1678 = fma(_1626, _1648, _1676);
            float _1680 = _1664 * _1626;
            float _1682 = _1664 * _1636;
            float _1684 = _1658 * _1674;
            float _1686 = -_1670;
            float _1688 = fma(_1620, _1642, _1686);
            float _1690 = _1658 * _1620;
            float _1692 = _1652 * _1642;
            float _1694 = -_1684;
            float _1696 = fma(_1652, _1678, _1694);
            float _1698 = -_1682;
            float _1700 = fma(_1652, _1648, _1698);
            float _1702 = -_1690;
            float _1704 = fma(_1652, _1626, _1702);
            float _1706 = _1658 * _1648;
            float _1708 = fma(_1664, _1688, _1696);
            float _1710 = -_1680;
            float _1712 = fma(_1658, _1632, _1710);
            float _1714 = -_1692;
            float _1716 = fma(_1658, _1636, _1714);
            float _1718 = -_1706;
            float _1720 = fma(_1664, _1642, _1718);
            float _1722 = 1.0 / _1708;
            float _1724 = _1652 * _1632;
            float _1726 = -_1724;
            float _1728 = fma(_1664, _1620, _1726);
            float _1730 = _1720 * _1722;
            float _1732 = _1700 * _1722;
            float _1734 = -_1620;
            float _1736 = fma(_1734, _1648, _1666);
            float _1738 = _1716 * _1722;
            float _1740 = _1730 * _1462;
            float _1742 = _1460 * _1722;
            float _1744 = _1732 * _1462;
            float _1746 = _1736 * _1722;
            float _1748 = _1738 * _1462;
            float _1750 = _1712 * _1722;
            float _1752 = fma(_1678, _1742, _1740);
            float _1754 = _1728 * _1722;
            float _1756 = fma(_1746, _1460, _1744);
            float _1758 = _1704 * _1722;
            float _1760 = fma(_1688, _1742, _1748);
            float _1762 = fma(_1750, _1464, _1752);
            float _1764 = fma(_1754, _1464, _1756);
            float _1766 = fma(_1758, _1464, _1760);
            _1588 = _1762;
            _1590 = _1764;
            _1592 = _1766;
        }
    }
    _1594 = false;
    float _1768 = _1588;
    float _1770 = _1590;
    float _1772 = _1592;
    float _1774 = _622 + _1768;
    float _1776 = _628 + _1770;
    int _1778 = _154 + 4;
    float _1780 = _636 + _1772;
    int _1782 = _154 + 8;
    uint _1784 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1784)] = as_type<uint>(_1408);
    float _1786 = -_158;
    float _1788 = _1786 + _1774;
    float _1790 = -_164;
    float _1792 = _1790 + _1776;
    uint _1794 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1794)] = as_type<uint>(_1774);
    float _1796 = -_170;
    float _1798 = _1796 + _1780;
    uint _1800 = uint(int(uint(_1778) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1800)] = as_type<uint>(_1776);
    uint _1802 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1802)] = as_type<uint>(_1780);
    uint _1804 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1804)] = as_type<uint>(_1454);
    uint _1806 = uint(int(uint(_1778) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1806)] = as_type<uint>(_1410);
    uint _1808 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1808)] = as_type<uint>(_1404);
    uint _1810 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1810)] = as_type<uint>(_1788);
    uint _1812 = uint(int(uint(_1778) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1812)] = as_type<uint>(_1792);
    uint _1814 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1814)] = as_type<uint>(_1798);
    float _1816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1818 = _1792 * _1792;
    float _1820 = _1410 * _1410;
    float _1822 = fma(_1788, _1788, _1818);
    float _1824 = fma(_1454, _1454, _1820);
    float _1826 = fma(_1798, _1798, _1822);
    float _1828 = fma(_1404, _1404, _1824);
    float _1830 = sqrt(_1828);
    float _1832 = sqrt(_1826);
    bool _1834 = _1832 >= 9.9999999747524270787835121154785e-07;
    bool _1836 = isnan(_1832);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(9.9999999747524270787835121154785e-07);
    bool _1842 = _1838 || _1840;
    float _1844 = _1832;
    if (!_1842)
    {
        bool _1846 = _518 != _270;
        bool _1848 = isnan(_518);
        bool _1850 = _1846 || _1848;
        bool _1852 = isnan(_270);
        bool _1854 = _1850 || _1852;
        _1856 = _1854;
        if (!_1856)
        {
            float _1858 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1860 = _1858 > 0.0;
            bool _1862 = !_1860;
            if (!_1862)
            {
                float _1864 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1866 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1868 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1870 = _1866 * _1866;
                float _1872 = fma(_1864, _1864, _1870);
                float _1874 = fma(_1868, _1868, _1872);
                float _1876 = rsqrt(_1874);
                float _1878 = _1876 * 9.9999999747524270787835121154785e-07;
                float _1880 = _1864 * _1878;
                float _1882 = _1866 * _1878;
                float _1884 = _1868 * _1878;
                _302 = as_type<int>(_1880);
                _304 = as_type<int>(_1882);
                _306 = as_type<int>(_1884);
                _1856 = true;
            }
            else
            {
                bool _1886 = _1830 >= 9.9999999747524270787835121154785e-07;
                bool _1888 = isnan(_1830);
                bool _1890 = _1886 || _1888;
                bool _1892 = isnan(9.9999999747524270787835121154785e-07);
                bool _1894 = _1890 || _1892;
                if (!_1894)
                {
                    float _1896 = _1776 * _1776;
                    float _1898 = fma(_1774, _1774, _1896);
                    float _1900 = fma(_1780, _1780, _1898);
                    float _1902 = sqrt(_1900);
                    bool _1904 = _1902 >= 9.9999999747524270787835121154785e-07;
                    bool _1906 = isnan(_1902);
                    bool _1908 = _1904 || _1906;
                    bool _1910 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1912 = _1908 || _1910;
                    int _1914 = as_type<int>(_208);
                    int _1916 = as_type<int>(_1902);
                    if (_1912)
                    {
                        float _1918 = rsqrt(_1900);
                        _1914 = as_type<int>(_1918);
                    }
                    int _1920 = _1914;
                    if (!_1912)
                    {
                        _1916 = 0;
                    }
                    int _1922 = _1916;
                    int _1924 = _1922;
                    if (!_1912)
                    {
                        _296 = 897988541;
                    }
                    int _1926 = _296;
                    int _1928 = _1920;
                    int _1930 = _1926;
                    if (_1912)
                    {
                        float _1932 = as_type<float>(_1920) * 9.9999999747524270787835121154785e-07;
                        _1844 = _1932;
                    }
                    float _1934 = _1844;
                    if (!_1912)
                    {
                        _1928 = 0;
                    }
                    int _1936 = _1928;
                    int _1938 = _1936;
                    if (_1912)
                    {
                        float _1940 = _1774 * _1934;
                        _1924 = as_type<int>(_1940);
                    }
                    int _1942 = _1924;
                    _302 = _1942;
                    if (_1912)
                    {
                        float _1944 = _1776 * _1934;
                        _1930 = as_type<int>(_1944);
                    }
                    int _1946 = _1930;
                    _304 = _1946;
                    if (_1912)
                    {
                        float _1948 = _1780 * _1934;
                        _1938 = as_type<int>(_1948);
                    }
                    int _1950 = _1938;
                    _306 = _1950;
                    _1856 = true;
                }
                else
                {
                    float _1952 = rsqrt(_1828);
                    float _1954 = _1952 * 9.9999999747524270787835121154785e-07;
                    float _1956 = _1454 * _1954;
                    float _1958 = _1410 * _1954;
                    float _1960 = _1404 * _1954;
                    _302 = as_type<int>(_1956);
                    _304 = as_type<int>(_1958);
                    _306 = as_type<int>(_1960);
                    _1856 = true;
                }
            }
        }
    }
    else
    {
        float _1962 = _1830 * _1816;
        bool _1964 = _1962 >= 0.001000000047497451305389404296875;
        bool _1966 = isnan(_1962);
        bool _1968 = _1964 || _1966;
        bool _1970 = isnan(0.001000000047497451305389404296875);
        bool _1972 = _1968 || _1970;
        bool _1974 = _1962 > 0.0;
        bool _1976 = !_1972;
        bool _1978 = _1974 && _1976;
        bool _1980 = _1832 < 0.001000000047497451305389404296875;
        bool _1982 = _1980 && _1978;
        int _1984 = as_type<int>(_1962);
        if (!_1982)
        {
            _1984 = as_type<int>(_1788);
        }
        int _1986 = _1984;
        int _1988 = _1986;
        if (_1982)
        {
            float _1990 = _1454 * _1816;
            _1988 = as_type<int>(_1990);
        }
        int _1992 = _1988;
        _302 = _1992;
        if (!_1982)
        {
            _298 = as_type<int>(_1792);
        }
        int _1994 = _298;
        int _1996 = _1994;
        if (_1982)
        {
            float _1998 = _1410 * _1816;
            _1996 = as_type<int>(_1998);
        }
        int _2000 = _1996;
        _304 = _2000;
        if (!_1982)
        {
            _300 = as_type<int>(_1798);
        }
        int _2002 = _300;
        _306 = _2002;
        if (_1982)
        {
            float _2004 = _1404 * _1816;
            _306 = as_type<int>(_2004);
        }
    }
    _1856 = false;
    int _2006 = _302;
    int _2008 = _304;
    int _2010 = _306;
    uint _2012 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2012)] = uint(_2006);
    uint _2014 = uint(int(uint(_1778) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2014)] = uint(_2008);
    uint _2016 = uint(int(uint(_1782) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2016)] = uint(_2010);
}

