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
    texture3d<float> cp_t_tcb_12 [[id(11)]];
    sampler cp_t_tcb_12Smplr [[id(12)]];
    sampler cp_t_tcb_12Smplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2542 = false;
    bool _2282 = false;
    bool _1818 = false;
    bool _1236 = false;
    float _62 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    float _66 = as_type<float>(gl_WorkGroupID.x);
    int _69 = as_type<int>(_66) << 5;
    int _71 = _69 + as_type<int>(_64);
    float _73 = trunc(_62);
    int _75 = int(_73);
    bool _79 = _71 >= _75;
    int _81 = 0;
    if (_79)
    {
        _81 = 0;
    }
    int _83 = _81;
    int _85 = _83;
    int _87 = _83;
    if (!_79)
    {
        int _89 = _71 << 4;
        int _91 = _89 + 12;
        uint _94 = uint(int(uint(_91) >> uint(2)));
        float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
        float _98 = trunc(_96);
        int _100 = int(_98);
        bool _102 = _100 >= 1;
        int _104 = _102 ? (-1) : 0;
        if (!_102)
        {
            _85 = 0;
        }
        int _106 = _85;
        bool _108 = !_102;
        _87 = _106;
        if (!_108)
        {
            float _110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _112 = uint(int(uint(_91) >> uint(2)));
            float _114 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_112)]);
            float _116 = float(_100);
            float _118 = -_114;
            float _120 = _110 + _118;
            bool _122 = _120 > _116;
            int _124 = as_type<int>(_110);
            if (!_122)
            {
                bool _126 = _110 >= _114;
                bool _128 = isnan(_110);
                bool _130 = _126 || _128;
                bool _132 = isnan(_114);
                bool _134 = _130 || _132;
                _104 = _134 ? (-1) : 0;
            }
            int _136 = _104;
            if (_122)
            {
                _124 = 0;
            }
            int _138 = _124;
            _87 = _138;
            if (!_122)
            {
                int _140 = ~_136;
                int _142 = (_140 != 0) ? 0 : 1;
                _87 = _142;
            }
        }
    }
    int _144 = _87;
    int _146 = _144 & 1;
    bool _148 = _146 != 0;
    if (!_148)
    {
        return;
    }
    float _150 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _152 = _71 << 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_154)]);
    int _158 = _152 + 4;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_160)]);
    int _164 = _152 + 8;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_166)]);
    int _170 = as_type<int>(_150) & 512;
    bool _172 = _170 != 0;
    int _174 = _152 + 12;
    uint _176 = uint(int(uint(_152) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_176)]);
    int _180 = _152 + 4;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_182)]);
    int _186 = _152 + 8;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    uint _192 = uint(int(uint(_152) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_192)]);
    int _196 = _152 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_198)]);
    int _202 = _152 + 8;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_204)]);
    float _208 = 0.0;
    float _210 = 0.0;
    float _212 = 0.0;
    if (_172)
    {
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _208 = _214;
        _210 = _216;
        _212 = _218;
    }
    float _220 = _208;
    float _222 = _210;
    float _224 = _212;
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = 0.0;
    if (_172)
    {
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _226 = _232;
        _228 = _234;
        _230 = _236;
    }
    float _238 = _226;
    float _240 = _228;
    float _242 = _230;
    float _244 = 0.0;
    float _246 = 0.0;
    float _248 = 0.0;
    if (_172)
    {
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _244 = _250;
        _246 = _252;
        _248 = _254;
    }
    float _256 = _244;
    float _258 = _246;
    float _260 = _248;
    uint _262 = uint(int(uint(_152) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_262)]);
    uint _266 = uint(int(uint(_174) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_266)]);
    uint _270 = uint(int(uint(_174) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_270)]);
    float _274 = 0.0;
    float _276 = _238;
    float _278 = _240;
    float _280 = _242;
    float _282 = _220;
    float _284 = _222;
    float _286 = _224;
    float _288 = _256;
    float _290 = _258;
    float _292 = _260;
    float _294 = _178;
    float _296 = _190;
    int _298 = as_type<int>(_194);
    int _300 = as_type<int>(_200);
    int _302 = as_type<int>(_206);
    int _304 = as_type<int>(_194);
    int _306 = as_type<int>(_200);
    int _308 = as_type<int>(_206);
    int _310 = as_type<int>(_194);
    int _312 = as_type<int>(_200);
    int _314 = as_type<int>(_206);
    if (!_172)
    {
        int _316 = _152 + 4;
        uint _318 = uint(int(uint(_152) >> uint(2)));
        float _320 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_318)]);
        int _322 = _152 + 8;
        uint _324 = uint(int(uint(_152) >> uint(2)));
        float _326 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_324)]);
        uint _328 = uint(int(uint(_316) >> uint(2)));
        float _330 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_328)]);
        uint _332 = uint(int(uint(_322) >> uint(2)));
        float _334 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_332)]);
        uint _336 = uint(int(uint(_316) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_336)]);
        uint _340 = uint(int(uint(_152) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_340)]);
        uint _344 = uint(int(uint(_322) >> uint(2)));
        float _346 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_344)]);
        uint _348 = uint(int(uint(_316) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_348)]);
        uint _352 = uint(int(uint(_322) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_352)]);
        float _356 = _320 * _320;
        float _358 = fma(_326, _326, _356);
        float _360 = _330 * _330;
        float _362 = _334 * _334;
        float _364 = fma(_338, _338, _360);
        float _366 = fma(_342, _342, _358);
        float _368 = fma(_346, _346, _362);
        float _370 = fma(_350, _350, _364);
        float _372 = sqrt(_366);
        float _374 = fma(_354, _354, _368);
        float _376 = sqrt(_370);
        float _378 = sqrt(_374);
        bool _380 = _372 > 0.0;
        bool _382 = _376 > 0.0;
        bool _384 = _378 > 0.0;
        float _386 = _362;
        float _388 = _364;
        float _390 = _368;
        float _392 = _372;
        float _394 = _376;
        float _396 = _378;
        float _398 = _366;
        float _400 = _330;
        float _402 = _342;
        float _404 = _370;
        _274 = _374;
        if (_380)
        {
            float _406 = rsqrt(_366);
            _386 = _406;
        }
        float _408 = _386;
        float _410 = 0.0;
        if (_382)
        {
            float _412 = rsqrt(_370);
            _410 = _412;
        }
        float _414 = _410;
        float _416 = 0.0;
        if (_384)
        {
            float _418 = rsqrt(_374);
            _416 = _418;
        }
        float _420 = _416;
        if (!_380)
        {
            _388 = 0.0;
        }
        float _422 = _388;
        float _424 = _422;
        if (_380)
        {
            float _426 = _342 * _408;
            _424 = _426;
        }
        float _428 = _424;
        _288 = _428;
        if (!_382)
        {
            _390 = 0.0;
        }
        float _430 = _390;
        float _432 = _430;
        if (!_380)
        {
            _392 = 0.0;
        }
        float _434 = _392;
        float _436 = _434;
        if (_380)
        {
            float _438 = _320 * _408;
            _436 = _438;
        }
        float _440 = _436;
        _276 = _440;
        if (!_380)
        {
            _394 = 0.0;
        }
        float _442 = _394;
        float _444 = _442;
        if (_382)
        {
            float _446 = _330 * _414;
            _432 = _446;
        }
        float _448 = _432;
        _278 = _448;
        if (!_382)
        {
            _396 = 0.0;
        }
        float _450 = _396;
        float _452 = _450;
        if (_380)
        {
            float _454 = _326 * _408;
            _444 = _454;
        }
        float _456 = _444;
        _282 = _456;
        if (!_382)
        {
            _398 = 0.0;
        }
        float _458 = _398;
        float _460 = _458;
        if (_382)
        {
            float _462 = _338 * _414;
            _452 = _462;
        }
        float _464 = _452;
        _284 = _464;
        if (!_384)
        {
            _400 = 0.0;
        }
        float _466 = _400;
        float _468 = _466;
        if (_382)
        {
            float _470 = _350 * _414;
            _460 = _470;
        }
        float _472 = _460;
        _290 = _472;
        if (!_384)
        {
            _402 = 0.0;
        }
        float _474 = _402;
        float _476 = _474;
        if (_384)
        {
            float _478 = _334 * _420;
            _468 = _478;
        }
        float _480 = _468;
        _280 = _480;
        if (!_384)
        {
            _404 = 0.0;
        }
        float _482 = _404;
        _292 = _482;
        if (_384)
        {
            float _484 = _346 * _420;
            _476 = _484;
        }
        float _486 = _476;
        _286 = _486;
        if (_384)
        {
            float _488 = _354 * _420;
            _292 = _488;
        }
    }
    float _490 = _274;
    float _492 = _276;
    float _494 = _278;
    float _496 = _280;
    float _498 = _282;
    float _500 = _284;
    float _502 = _286;
    float _504 = _288;
    float _506 = _290;
    float _508 = _292;
    float _510 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _512 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[45]);
    float _514 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _516 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _518 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    bool _526 = _512 > 0.0;
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _530 = _490;
    if (_526)
    {
        float _532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _530 = _532;
    }
    float _534 = _530;
    float _536 = abs(_510);
    float _538 = log2(_536);
    float _540 = _516 * _522;
    float _542 = _514 * _522;
    float _544 = _540 * _492;
    float _546 = _540 * _494;
    float _548 = _540 * _496;
    float _550 = _518 * _522;
    float _552 = _524 * _538;
    float _554 = exp2(_552);
    float _556 = fma(_542, _498, _544);
    float _558 = fma(_542, _500, _546);
    float _560 = fma(_542, _502, _548);
    float _562 = fma(_550, _504, _556);
    float _564 = fma(_550, _506, _558);
    float _566 = fma(_550, _508, _560);
    float _568 = _524 * _562;
    float _570 = _272 * _524;
    float _572 = _524 * _564;
    float _574 = _524 * _566;
    float _576 = fma(_184, _570, _162);
    float _578 = fma(_178, _554, _568);
    float _580 = fma(_178, _570, _156);
    float _582 = fma(_190, _570, _168);
    float _584 = fma(_190, _554, _574);
    float _586 = fma(_184, _554, _572);
    bool _588 = _534 == 0.0;
    bool _590 = _534 == 0.0;
    bool _592 = _590 && _526;
    float _594 = _566;
    float _596 = _534;
    float _598 = _520;
    float _600 = _520;
    float _602 = _576;
    if (_592)
    {
        _594 = 0.0;
    }
    float _604 = _594;
    float _606 = _604;
    if (_592)
    {
        _294 = 0.0;
    }
    float _608 = _294;
    float _610 = _608;
    if (_592)
    {
        _296 = 0.0;
    }
    float _612 = _296;
    bool _614 = _526 && _588;
    float _616 = _612;
    if (!_614)
    {
        float _618 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[44]);
        bool _620 = _534 > 0.0;
        bool _622 = _620 && _526;
        float _624 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[40]);
        float _626 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[41]);
        float _628 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[42]);
        float _630 = trunc(_618);
        int _632 = int(_630);
        bool _634 = _632 > 0;
        if (!_634)
        {
            _596 = 0.0;
        }
        float _636 = _596;
        float _638 = 0.0;
        float _640 = _636;
        float _642 = _636;
        if (!_634)
        {
            _638 = 0.0;
        }
        float _644 = _638;
        float _646 = 0.0;
        float _648 = _644;
        float _650 = _644;
        if (!_634)
        {
            _646 = 0.0;
        }
        float _652 = _646;
        bool _654 = !_634;
        float _656 = _652;
        float _658 = _652;
        float _660 = _624;
        float _662 = _626;
        float _664 = _628;
        if (!_654)
        {
            int _666 = as_type<int>(_150) & 2048;
            bool _668 = _666 != 0;
            if (!_668)
            {
                _640 = 0.0;
            }
            float _670 = _640;
            _642 = _670;
            if (!_668)
            {
                _648 = 0.0;
            }
            float _672 = _648;
            _650 = _672;
            if (!_668)
            {
                _656 = 0.0;
            }
            float _674 = _656;
            bool _676 = !_668;
            _658 = _674;
            if (!_676)
            {
                float _678 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _680 = uint(int(uint(_152) >> uint(2)));
                float _682 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_680)]);
                int _684 = _152 + 4;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                float _688 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_686)]);
                int _690 = _152 + 8;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                float _694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_692)]);
                int _696 = _152 + 12;
                uint _698 = uint(int(uint(_696) >> uint(2)));
                float _700 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_698)]);
                uint _702 = uint(int(uint(_152) >> uint(2)));
                float _704 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_702)]);
                int _706 = _152 + 4;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                float _710 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_708)]);
                int _712 = _152 + 8;
                uint _714 = uint(int(uint(_712) >> uint(2)));
                float _716 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_714)]);
                int _718 = _152 + 12;
                uint _720 = uint(int(uint(_718) >> uint(2)));
                float _722 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_720)]);
                uint _724 = uint(int(uint(_152) >> uint(2)));
                float _726 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_724)]);
                int _728 = _152 + 4;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                float _732 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_730)]);
                int _734 = _152 + 8;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                float _738 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_736)]);
                int _740 = _152 + 12;
                uint _742 = uint(int(uint(_740) >> uint(2)));
                float _744 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_742)]);
                float _746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _750 = _694 * _704;
                float _752 = _694 * _710;
                float _754 = -_750;
                float _756 = fma(_682, _716, _754);
                float _758 = _700 * _716;
                float _760 = _700 * _710;
                float _762 = _700 * _704;
                float _764 = _688 * _704;
                float _766 = -_752;
                float _768 = fma(_688, _716, _766);
                float _770 = _732 * _756;
                float _772 = -_764;
                float _774 = fma(_682, _710, _772);
                float _776 = -_770;
                float _778 = fma(_726, _768, _776);
                float _780 = fma(_738, _774, _778);
                float _782 = _732 * _716;
                float _784 = -_760;
                float _786 = fma(_688, _722, _784);
                float _788 = 1.0 / _780;
                float _790 = -_762;
                float _792 = fma(_682, _722, _790);
                float _794 = -_782;
                float _796 = fma(_738, _710, _794);
                float _798 = _726 * _710;
                float _800 = _738 * _688;
                float _802 = _726 * _694;
                float _804 = -_758;
                float _806 = fma(_694, _722, _804);
                float _808 = _738 * _792;
                float _810 = _738 * _704;
                float _812 = -_800;
                float _814 = fma(_732, _694, _812);
                float _816 = -_682;
                float _818 = fma(_816, _716, _750);
                float _820 = -_802;
                float _822 = fma(_738, _682, _820);
                float _824 = _732 * _682;
                float _826 = _732 * _792;
                float _828 = -_808;
                float _830 = fma(_726, _806, _828);
                float _832 = -_810;
                float _834 = fma(_726, _716, _832);
                float _836 = -_798;
                float _838 = fma(_732, _704, _836);
                float _840 = _738 * _786;
                float _842 = -_824;
                float _844 = fma(_726, _688, _842);
                float _846 = -_826;
                float _848 = fma(_726, _786, _846);
                float _850 = fma(_744, _756, _830);
                float _852 = _834 * _788;
                float _854 = _796 * _788;
                float _856 = _838 * _788;
                float _858 = -_840;
                float _860 = fma(_732, _806, _858);
                float _862 = _818 * _788;
                float _864 = _678 * _852;
                float _866 = _746 * _788;
                float _868 = _678 * _854;
                float _870 = _678 * _856;
                float _872 = fma(_744, _768, _860);
                float _874 = fma(_746, _862, _864);
                float _876 = fma(_768, _866, _868);
                float _878 = fma(_774, _866, _870);
                float _880 = _814 * _788;
                float _882 = _822 * _788;
                float _884 = _844 * _788;
                float _886 = fma(_744, _774, _848);
                float _888 = fma(_748, _880, _876);
                float _890 = fma(_748, _882, _874);
                float _892 = fma(_748, _884, _878);
                float _894 = -_872;
                float _896 = fma(_894, _788, _888);
                float _898 = fma(_850, _788, _890);
                float _900 = -_886;
                float _902 = fma(_900, _788, _892);
                _598 = _866;
                _642 = _896;
                _650 = _898;
                _658 = _902;
            }
        }
        float _904 = _598;
        float _906 = _642;
        float _908 = _650;
        float _910 = _658;
        bool _912 = !_622;
        float _914 = _904;
        if (!_912)
        {
            float _916 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _918 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _920 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            bool _922 = !_172;
            _660 = _916;
            _662 = _918;
            _664 = _920;
            if (!_922)
            {
                float _924 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _926 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _928 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _936 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _938 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _940 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _942 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _944 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _946 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _948 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _952 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _956 = _930 * _934;
                float _958 = _930 * _936;
                float _960 = _930 * _932;
                float _962 = _946 * _928;
                float _964 = _946 * _926;
                float _966 = _946 * _924;
                float _968 = _946 * _936;
                float _970 = _946 * _934;
                float _972 = _946 * _932;
                float _974 = -_956;
                float _976 = fma(_926, _938, _974);
                float _978 = -_962;
                float _980 = fma(_944, _930, _978);
                float _982 = -_964;
                float _984 = fma(_942, _930, _982);
                float _986 = -_966;
                float _988 = fma(_940, _930, _986);
                float _990 = _928 * _934;
                float _992 = _928 * _932;
                float _994 = _944 * _934;
                float _996 = _944 * _932;
                float _998 = -_958;
                float _1000 = fma(_928, _938, _998);
                float _1002 = -_960;
                float _1004 = fma(_924, _938, _1002);
                float _1006 = -_968;
                float _1008 = fma(_944, _938, _1006);
                float _1010 = -_970;
                float _1012 = fma(_942, _938, _1010);
                float _1014 = -_972;
                float _1016 = fma(_940, _938, _1014);
                float _1018 = _926 * _932;
                float _1020 = -_990;
                float _1022 = fma(_926, _936, _1020);
                float _1024 = -_992;
                float _1026 = fma(_924, _936, _1024);
                float _1028 = -_994;
                float _1030 = fma(_942, _936, _1028);
                float _1032 = -_996;
                float _1034 = fma(_940, _936, _1032);
                float _1036 = _944 * _926;
                float _1038 = _944 * _924;
                float _1040 = -_1018;
                float _1042 = fma(_924, _934, _1040);
                float _1044 = _942 * _924;
                float _1046 = -_1036;
                float _1048 = fma(_942, _928, _1046);
                float _1050 = -_1038;
                float _1052 = fma(_940, _928, _1050);
                float _1054 = _944 * _1004;
                float _1056 = -_1044;
                float _1058 = fma(_940, _926, _1056);
                float _1060 = _944 * _976;
                float _1062 = _942 * _932;
                float _1064 = -_1054;
                float _1066 = fma(_940, _1000, _1064);
                float _1068 = _942 * _1004;
                float _1070 = -_1060;
                float _1072 = fma(_942, _1000, _1070);
                float _1074 = -_1062;
                float _1076 = fma(_940, _934, _1074);
                float _1078 = fma(_946, _1026, _1066);
                float _1080 = _942 * _1026;
                float _1082 = -_1068;
                float _1084 = fma(_940, _976, _1082);
                float _1086 = fma(_946, _1022, _1072);
                float _1088 = _950 * _1078;
                float _1090 = -_1080;
                float _1092 = fma(_940, _1022, _1090);
                float _1094 = _952 * _976;
                float _1096 = fma(_946, _1042, _1084);
                float _1098 = -_1088;
                float _1100 = fma(_948, _1086, _1098);
                float _1102 = fma(_944, _1042, _1092);
                float _1104 = -_1094;
                float _1106 = fma(_950, _1000, _1104);
                float _1108 = _952 * _1004;
                float _1110 = fma(_952, _1096, _1100);
                float _1112 = _950 * _1004;
                float _1114 = _952 * _984;
                float _1116 = -_1108;
                float _1118 = fma(_948, _1000, _1116);
                float _1120 = -_954;
                float _1122 = fma(_1120, _1102, _1110);
                float _1124 = _952 * _1016;
                float _1126 = -_1112;
                float _1128 = fma(_948, _976, _1126);
                float _1130 = _952 * _1012;
                float _1132 = 1.0 / _1122;
                float _1134 = -_1124;
                float _1136 = fma(_948, _1008, _1134);
                float _1138 = _952 * _988;
                float _1140 = fma(_954, _1022, _1106);
                float _1142 = _950 * _1016;
                float _1144 = -_1114;
                float _1146 = fma(_950, _980, _1144);
                float _1148 = fma(_954, _1042, _1128);
                float _1150 = _950 * _988;
                float _1152 = -_1138;
                float _1154 = fma(_948, _980, _1152);
                float _1156 = fma(_954, _1026, _1118);
                float _1158 = -_1130;
                float _1160 = fma(_950, _1008, _1158);
                float _1162 = -_1142;
                float _1164 = fma(_948, _1012, _1162);
                float _1166 = -_1150;
                float _1168 = fma(_948, _984, _1166);
                float _1170 = fma(_954, _1034, _1136);
                float _1172 = fma(_954, _1030, _1160);
                float _1174 = fma(_954, _1076, _1164);
                float _1176 = _1078 * _1132;
                float _1178 = _1140 * _1132;
                float _1180 = _1148 * _1132;
                float _1182 = _1156 * _1132;
                float _1184 = _916 * _1176;
                float _1186 = _1086 * _1132;
                float _1188 = _918 * _1178;
                float _1190 = _1096 * _1132;
                float _1192 = _918 * _1180;
                float _1194 = -_1184;
                float _1196 = fma(_918, _1182, _1194);
                float _1198 = -_1188;
                float _1200 = fma(_916, _1186, _1198);
                float _1202 = _1172 * _1132;
                float _1204 = -_1192;
                float _1206 = fma(_916, _1190, _1204);
                float _1208 = _1170 * _1132;
                float _1210 = _1174 * _1132;
                float _1212 = fma(_954, _1048, _1146);
                float _1214 = fma(_920, _1202, _1200);
                float _1216 = fma(_954, _1052, _1154);
                float _1218 = fma(_954, _1058, _1168);
                float _1220 = -_1208;
                float _1222 = fma(_920, _1220, _1196);
                float _1224 = fma(_920, _1210, _1206);
                float _1226 = -_1212;
                float _1228 = fma(_1226, _1132, _1214);
                float _1230 = fma(_1216, _1132, _1222);
                float _1232 = -_1218;
                float _1234 = fma(_1232, _1132, _1224);
                _660 = _1228;
                _662 = _1230;
                _664 = _1234;
                _914 = _1190;
                _1236 = true;
            }
            else
            {
                int _1238 = as_type<int>(_150) & 1024;
                bool _1240 = _1238 != 0;
                bool _1242 = !_1240;
                if (!_1242)
                {
                    float _1244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1246 = uint(int(uint(_152) >> uint(2)));
                    float _1248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1246)]);
                    int _1250 = _152 + 4;
                    uint _1252 = uint(int(uint(_1250) >> uint(2)));
                    float _1254 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1252)]);
                    int _1256 = _152 + 8;
                    uint _1258 = uint(int(uint(_1256) >> uint(2)));
                    float _1260 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1258)]);
                    uint _1262 = uint(int(uint(_152) >> uint(2)));
                    float _1264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1262)]);
                    int _1266 = _152 + 4;
                    uint _1268 = uint(int(uint(_1266) >> uint(2)));
                    float _1270 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1268)]);
                    int _1272 = _152 + 8;
                    uint _1274 = uint(int(uint(_1272) >> uint(2)));
                    float _1276 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1274)]);
                    uint _1278 = uint(int(uint(_152) >> uint(2)));
                    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1278)]);
                    int _1282 = _152 + 4;
                    uint _1284 = uint(int(uint(_1282) >> uint(2)));
                    float _1286 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1284)]);
                    int _1288 = _152 + 8;
                    uint _1290 = uint(int(uint(_1288) >> uint(2)));
                    float _1292 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1290)]);
                    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1298 = _1260 * _1264;
                    float _1300 = _1260 * _1270;
                    float _1302 = -_1298;
                    float _1304 = fma(_1248, _1276, _1302);
                    float _1306 = _1254 * _1264;
                    float _1308 = -_1300;
                    float _1310 = fma(_1254, _1276, _1308);
                    float _1312 = _1286 * _1304;
                    float _1314 = -_1306;
                    float _1316 = fma(_1248, _1270, _1314);
                    float _1318 = -_1312;
                    float _1320 = fma(_1280, _1310, _1318);
                    float _1322 = _1244 * _1276;
                    float _1324 = _1244 * _1270;
                    float _1326 = _1244 * _1264;
                    float _1328 = fma(_1292, _1316, _1320);
                    float _1330 = 1.0 / _1328;
                    float _1332 = _1292 * _1264;
                    float _1334 = _1286 * _1276;
                    float _1336 = -_1324;
                    float _1338 = fma(_1294, _1254, _1336);
                    float _1340 = -_1248;
                    float _1342 = fma(_1340, _1276, _1298);
                    float _1344 = _1280 * _1270;
                    float _1346 = -_1322;
                    float _1348 = fma(_1294, _1260, _1346);
                    float _1350 = -_1326;
                    float _1352 = fma(_1294, _1248, _1350);
                    float _1354 = _1280 * _1260;
                    float _1356 = -_1332;
                    float _1358 = fma(_1280, _1276, _1356);
                    float _1360 = -_1334;
                    float _1362 = fma(_1292, _1270, _1360);
                    float _1364 = _1286 * _1248;
                    float _1366 = -_1344;
                    float _1368 = fma(_1286, _1264, _1366);
                    float _1370 = -_1354;
                    float _1372 = fma(_1292, _1248, _1370);
                    float _1374 = _1292 * _1254;
                    float _1376 = _1292 * _1338;
                    float _1378 = _1362 * _1330;
                    float _1380 = _1358 * _1330;
                    float _1382 = -_1364;
                    float _1384 = fma(_1280, _1254, _1382);
                    float _1386 = _1368 * _1330;
                    float _1388 = _1292 * _1352;
                    float _1390 = -_1374;
                    float _1392 = fma(_1286, _1260, _1390);
                    float _1394 = _1286 * _1352;
                    float _1396 = -_1376;
                    float _1398 = fma(_1286, _1348, _1396);
                    float _1400 = _1378 * _918;
                    float _1402 = _1380 * _918;
                    float _1404 = _1386 * _918;
                    float _1406 = _1342 * _1330;
                    float _1408 = _1310 * _1330;
                    float _1410 = _1316 * _1330;
                    float _1412 = -_1388;
                    float _1414 = fma(_1280, _1348, _1412);
                    float _1416 = fma(_1406, _916, _1402);
                    float _1418 = fma(_916, _1408, _1400);
                    float _1420 = fma(_916, _1410, _1404);
                    float _1422 = _1372 * _1330;
                    float _1424 = _1392 * _1330;
                    float _1426 = _1384 * _1330;
                    float _1428 = -_1394;
                    float _1430 = fma(_1280, _1338, _1428);
                    float _1432 = fma(_1422, _920, _1416);
                    float _1434 = fma(_1424, _920, _1418);
                    float _1436 = fma(_1296, _1304, _1414);
                    float _1438 = fma(_1426, _920, _1420);
                    float _1440 = fma(_1296, _1310, _1398);
                    float _1442 = fma(_1296, _1316, _1430);
                    float _1444 = fma(_1436, _1330, _1432);
                    float _1446 = -_1440;
                    float _1448 = fma(_1446, _1330, _1434);
                    float _1450 = -_1442;
                    float _1452 = fma(_1450, _1330, _1438);
                    _660 = _1448;
                    _662 = _1444;
                    _664 = _1452;
                    _914 = _1338;
                    _1236 = true;
                }
                else
                {
                    int _1454 = as_type<int>(_150) & 2048;
                    bool _1456 = _1454 != 0;
                    bool _1458 = !_1456;
                    if (!_1458)
                    {
                        uint _1460 = uint(int(uint(_152) >> uint(2)));
                        float _1462 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1460)]);
                        int _1464 = _152 + 4;
                        uint _1466 = uint(int(uint(_1464) >> uint(2)));
                        float _1468 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1466)]);
                        int _1470 = _152 + 8;
                        uint _1472 = uint(int(uint(_1470) >> uint(2)));
                        float _1474 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1472)]);
                        int _1476 = _152 + 12;
                        uint _1478 = uint(int(uint(_1476) >> uint(2)));
                        float _1480 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1478)]);
                        uint _1482 = uint(int(uint(_152) >> uint(2)));
                        float _1484 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1482)]);
                        int _1486 = _152 + 4;
                        uint _1488 = uint(int(uint(_1486) >> uint(2)));
                        float _1490 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1488)]);
                        int _1492 = _152 + 8;
                        uint _1494 = uint(int(uint(_1492) >> uint(2)));
                        float _1496 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1494)]);
                        int _1498 = _152 + 12;
                        uint _1500 = uint(int(uint(_1498) >> uint(2)));
                        float _1502 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1500)]);
                        uint _1504 = uint(int(uint(_152) >> uint(2)));
                        float _1506 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1504)]);
                        int _1508 = _152 + 4;
                        uint _1510 = uint(int(uint(_1508) >> uint(2)));
                        float _1512 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1510)]);
                        int _1514 = _152 + 8;
                        uint _1516 = uint(int(uint(_1514) >> uint(2)));
                        float _1518 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1516)]);
                        int _1520 = _152 + 12;
                        uint _1522 = uint(int(uint(_1520) >> uint(2)));
                        float _1524 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1522)]);
                        float _1526 = _1474 * _1484;
                        float _1528 = _1474 * _1490;
                        float _1530 = _1468 * _1484;
                        float _1532 = _1480 * _1490;
                        float _1534 = -_1526;
                        float _1536 = fma(_1462, _1496, _1534);
                        float _1538 = -_1528;
                        float _1540 = fma(_1468, _1496, _1538);
                        float _1542 = -_1530;
                        float _1544 = fma(_1462, _1490, _1542);
                        float _1546 = _1512 * _1496;
                        float _1548 = _1512 * _1536;
                        float _1550 = _1506 * _1490;
                        float _1552 = _1480 * _1496;
                        float _1554 = -_1546;
                        float _1556 = fma(_1518, _1490, _1554);
                        float _1558 = -_1548;
                        float _1560 = fma(_1506, _1540, _1558);
                        float _1562 = _1518 * _1484;
                        float _1564 = _1480 * _1484;
                        float _1566 = -_1532;
                        float _1568 = fma(_1468, _1502, _1566);
                        float _1570 = fma(_1518, _1544, _1560);
                        float _1572 = -_1462;
                        float _1574 = fma(_1572, _1496, _1526);
                        float _1576 = -_1562;
                        float _1578 = fma(_1506, _1496, _1576);
                        float _1580 = -_1550;
                        float _1582 = fma(_1512, _1484, _1580);
                        float _1584 = -_1552;
                        float _1586 = fma(_1474, _1502, _1584);
                        float _1588 = -_1564;
                        float _1590 = fma(_1462, _1502, _1588);
                        float _1592 = 1.0 / _1570;
                        float _1594 = _1506 * _1474;
                        float _1596 = _1518 * _1468;
                        float _1598 = _1512 * _1462;
                        float _1600 = _1512 * _1590;
                        float _1602 = -_1594;
                        float _1604 = fma(_1518, _1462, _1602);
                        float _1606 = -_1596;
                        float _1608 = fma(_1512, _1474, _1606);
                        float _1610 = _1518 * _1568;
                        float _1612 = -_1598;
                        float _1614 = fma(_1506, _1468, _1612);
                        float _1616 = _1518 * _1590;
                        float _1618 = -_1600;
                        float _1620 = fma(_1506, _1568, _1618);
                        float _1622 = -_1610;
                        float _1624 = fma(_1512, _1586, _1622);
                        float _1626 = -_1616;
                        float _1628 = fma(_1506, _1586, _1626);
                        float _1630 = fma(_1524, _1544, _1620);
                        float _1632 = fma(_1524, _1540, _1624);
                        float _1634 = _1556 * _1592;
                        float _1636 = _1578 * _1592;
                        float _1638 = _1582 * _1592;
                        float _1640 = _1574 * _1592;
                        float _1642 = _1634 * _918;
                        float _1644 = _1636 * _918;
                        float _1646 = _1638 * _918;
                        float _1648 = _1540 * _1592;
                        float _1650 = _1544 * _1592;
                        float _1652 = fma(_1640, _916, _1644);
                        float _1654 = _1604 * _1592;
                        float _1656 = fma(_916, _1648, _1642);
                        float _1658 = fma(_916, _1650, _1646);
                        float _1660 = _1608 * _1592;
                        float _1662 = _1614 * _1592;
                        float _1664 = fma(_1654, _920, _1652);
                        float _1666 = fma(_1524, _1536, _1628);
                        float _1668 = fma(_1660, _920, _1656);
                        float _1670 = fma(_1662, _920, _1658);
                        float _1672 = fma(_1666, _1592, _1664);
                        float _1674 = -_1632;
                        float _1676 = fma(_1674, _1592, _1668);
                        float _1678 = -_1630;
                        float _1680 = fma(_1678, _1592, _1670);
                        _660 = _1676;
                        _662 = _1672;
                        _664 = _1680;
                        _914 = _1664;
                    }
                }
            }
        }
        _1236 = false;
        float _1682 = _660;
        float _1684 = _662;
        float _1686 = _664;
        float _1688 = _914;
        float _1690 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[43]);
        float _1692 = _906 + _1682;
        float _1694 = _908 + _1684;
        float _1696 = _910 + _1686;
        float _1698 = -_580;
        float _1700 = _1692 + _1698;
        float _1702 = -_576;
        float _1704 = _1694 + _1702;
        float _1706 = -_582;
        float _1708 = _1696 + _1706;
        float _1710 = _272 * _1690;
        float _1712 = _1700 * _1710;
        float _1714 = _1704 * _1710;
        float _1716 = _1708 * _1710;
        float _1718 = _524 * _1712;
        float _1720 = _524 * _1714;
        float _1722 = _524 * _1716;
        _606 = _1718;
        _610 = _1720;
        _616 = _1722;
        _600 = _1688;
    }
    float _1724 = _606;
    float _1726 = _610;
    float _1728 = _616;
    float _1730 = _600;
    float _1732 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _1734 = _1724 + _580;
    float _1736 = _1726 + _576;
    float _1738 = _1728 + _582;
    bool _1740 = _1732 > 0.0;
    float _1742 = _1732;
    float _1744 = _1730;
    bool _1746 = _1740;
    if (!_1740)
    {
        _1742 = _1734;
    }
    float _1748 = _1742;
    float _1750 = _1748;
    float _1752 = _1748;
    if (!_1740)
    {
        _602 = _1736;
    }
    float _1754 = _602;
    float _1756 = _1754;
    float _1758 = _1754;
    if (!_1740)
    {
        _1744 = _1738;
    }
    float _1760 = _1744;
    bool _1762 = !_1740;
    float _1764 = _1760;
    float _1766 = _1760;
    if (!_1762)
    {
        bool _1768 = !_172;
        if (!_1768)
        {
            float _1770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _1778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1780 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _1786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _1794 = _1772 * _1736;
            float _1796 = _1780 * _1736;
            float _1798 = fma(_1770, _1734, _1794);
            float _1800 = _1788 * _1736;
            float _1802 = fma(_1778, _1734, _1796);
            float _1804 = fma(_1774, _1738, _1798);
            float _1806 = fma(_1786, _1734, _1800);
            float _1808 = fma(_1782, _1738, _1802);
            float _1810 = _1776 + _1804;
            float _1812 = fma(_1790, _1738, _1806);
            float _1814 = _1784 + _1808;
            float _1816 = _1792 + _1812;
            _1752 = _1810;
            _1766 = _1816;
            _1758 = _1814;
            _1818 = true;
        }
        else
        {
            int _1820 = as_type<int>(_150) & 1024;
            bool _1822 = _1820 != 0;
            bool _1824 = !_1822;
            if (!_1824)
            {
                float _1826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _1828 = uint(int(uint(_152) >> uint(2)));
                float _1830 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1828)]);
                int _1832 = _152 + 4;
                uint _1834 = uint(int(uint(_1832) >> uint(2)));
                float _1836 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1834)]);
                int _1838 = _152 + 8;
                uint _1840 = uint(int(uint(_1838) >> uint(2)));
                float _1842 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1840)]);
                uint _1844 = uint(int(uint(_152) >> uint(2)));
                float _1846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1844)]);
                int _1848 = _152 + 4;
                uint _1850 = uint(int(uint(_1848) >> uint(2)));
                float _1852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1850)]);
                int _1854 = _152 + 8;
                uint _1856 = uint(int(uint(_1854) >> uint(2)));
                float _1858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1856)]);
                uint _1860 = uint(int(uint(_152) >> uint(2)));
                float _1862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1860)]);
                int _1864 = _152 + 4;
                uint _1866 = uint(int(uint(_1864) >> uint(2)));
                float _1868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1866)]);
                int _1870 = _152 + 8;
                uint _1872 = uint(int(uint(_1870) >> uint(2)));
                float _1874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1872)]);
                float _1876 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _1878 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _1880 = _1836 * _1736;
                float _1882 = _1852 * _1736;
                float _1884 = fma(_1830, _1734, _1880);
                float _1886 = _1868 * _1736;
                float _1888 = fma(_1846, _1734, _1882);
                float _1890 = fma(_1862, _1734, _1886);
                float _1892 = fma(_1842, _1738, _1884);
                float _1894 = fma(_1858, _1738, _1888);
                float _1896 = fma(_1874, _1738, _1890);
                float _1898 = _1826 + _1892;
                float _1900 = _1876 + _1894;
                float _1902 = _1878 + _1896;
                _1752 = _1898;
                _1766 = _1902;
                _1758 = _1900;
                _1818 = true;
            }
            else
            {
                int _1904 = as_type<int>(_150) & 2048;
                bool _1906 = _1904 != 0;
                if (!_1906)
                {
                    _1750 = _1734;
                }
                float _1908 = _1750;
                _1752 = _1908;
                if (!_1906)
                {
                    _1756 = _1736;
                }
                float _1910 = _1756;
                _1758 = _1910;
                if (!_1906)
                {
                    _1764 = _1738;
                }
                float _1912 = _1764;
                bool _1914 = !_1906;
                _1766 = _1912;
                if (!_1914)
                {
                    uint _1916 = uint(int(uint(_152) >> uint(2)));
                    float _1918 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1916)]);
                    int _1920 = _152 + 4;
                    uint _1922 = uint(int(uint(_1920) >> uint(2)));
                    float _1924 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1922)]);
                    int _1926 = _152 + 8;
                    uint _1928 = uint(int(uint(_1926) >> uint(2)));
                    float _1930 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1928)]);
                    int _1932 = _152 + 12;
                    uint _1934 = uint(int(uint(_1932) >> uint(2)));
                    float _1936 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1934)]);
                    uint _1938 = uint(int(uint(_152) >> uint(2)));
                    float _1940 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1938)]);
                    int _1942 = _152 + 4;
                    uint _1944 = uint(int(uint(_1942) >> uint(2)));
                    float _1946 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1944)]);
                    int _1948 = _152 + 8;
                    uint _1950 = uint(int(uint(_1948) >> uint(2)));
                    float _1952 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1950)]);
                    int _1954 = _152 + 12;
                    uint _1956 = uint(int(uint(_1954) >> uint(2)));
                    float _1958 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1956)]);
                    uint _1960 = uint(int(uint(_152) >> uint(2)));
                    float _1962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1960)]);
                    int _1964 = _152 + 4;
                    uint _1966 = uint(int(uint(_1964) >> uint(2)));
                    float _1968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1966)]);
                    int _1970 = _152 + 8;
                    uint _1972 = uint(int(uint(_1970) >> uint(2)));
                    float _1974 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1972)]);
                    int _1976 = _152 + 12;
                    uint _1978 = uint(int(uint(_1976) >> uint(2)));
                    float _1980 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1978)]);
                    float _1982 = _1924 * _1736;
                    float _1984 = _1946 * _1736;
                    float _1986 = _1968 * _1736;
                    float _1988 = fma(_1918, _1734, _1982);
                    float _1990 = fma(_1940, _1734, _1984);
                    float _1992 = fma(_1962, _1734, _1986);
                    float _1994 = fma(_1930, _1738, _1988);
                    float _1996 = fma(_1952, _1738, _1990);
                    float _1998 = fma(_1974, _1738, _1992);
                    float _2000 = _1936 + _1994;
                    float _2002 = _1958 + _1996;
                    float _2004 = _1980 + _1998;
                    _1752 = _2000;
                    _1766 = _2004;
                    _1758 = _2002;
                }
            }
        }
    }
    _1818 = false;
    float _2006 = _1752;
    float _2008 = _1766;
    float _2010 = _1758;
    float _2012 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _2014 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _2016 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _2018 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _2020 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _2022 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _2024 = _2012 != 0.0;
    bool _2026 = isnan(_2012);
    bool _2028 = _2024 || _2026;
    bool _2030 = isnan(0.0);
    bool _2032 = _2028 || _2030;
    float _2034 = _528 * _2014;
    float _2036 = _528 * _2016;
    float _2038 = _528 * _2018;
    float _2040 = fma(_2020, _2006, _2034);
    float _2042 = fma(_2020, _2008, _2036);
    float _2044 = _2022;
    if (_2032)
    {
        float _2046 = _264 * _2022;
        _2044 = _2046;
    }
    float _2048 = _2044;
    float _2050 = fma(_2020, _2010, _2038);
    float _2052 = -_2048;
    bool _2054 = _2040 >= _2052;
    bool _2056 = isnan(_2040);
    bool _2058 = _2054 || _2056;
    bool _2060 = isnan(_2052);
    bool _2062 = _2058 || _2060;
    float _2064 = _2040 + _2048;
    float _2066 = -_2048;
    bool _2068 = _2042 >= _2066;
    bool _2070 = isnan(_2042);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan(_2066);
    bool _2076 = _2072 || _2074;
    float _2078 = _2042 + _2048;
    float _2080 = _2050 + _2048;
    float _2082 = -_2048;
    bool _2084 = _2050 >= _2082;
    bool _2086 = isnan(_2050);
    bool _2088 = _2084 || _2086;
    bool _2090 = isnan(_2082);
    bool _2092 = _2088 || _2090;
    bool _2094 = !_2062;
    float _2096 = -_2064;
    float _2098 = _2094 ? _2096 : _2064;
    bool _2100 = !_2076;
    float _2102 = -_2078;
    float _2104 = _2100 ? _2102 : _2078;
    bool _2106 = !_2092;
    float _2108 = -_2080;
    float _2110 = _2106 ? _2108 : _2080;
    float _2112 = _2098 * 0.03125;
    float _2114 = _2104 * 0.03125;
    float _2116 = _2110 * 0.03125;
    float3 _5954 = float3(_2112, _2116, _2114);
    float3 _2120 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_5954, float3(0.0), isnan(_5954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_5954, float3(0.0), isnan(_5954)), level(0.0)).xyz;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _2130 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _2132 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _2134 = _2124 + (-0.5);
    float _2136 = _2122 + (-0.5);
    float _2138 = _2126 + (-0.5);
    float _2140 = _2134 * _2128;
    float _2142 = _2136 * _2130;
    float _2144 = _2138 * _2132;
    float _2146 = _2124;
    float _2148 = _2142;
    float _2150 = _2144;
    if (!_1740)
    {
        _2146 = _2140;
    }
    float _2152 = _2146;
    bool _2154 = !_1740;
    float _2156 = _2152;
    float _2158 = _2152;
    if (!_2154)
    {
        bool _2160 = !_172;
        if (!_2160)
        {
            float _2162 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2170 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2172 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2174 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2180 = _2166 * _2168;
            float _2182 = _2166 * _2170;
            float _2184 = _2164 * _2168;
            float _2186 = -_2180;
            float _2188 = fma(_2162, _2172, _2186);
            float _2190 = -_2182;
            float _2192 = fma(_2164, _2172, _2190);
            float _2194 = -_2184;
            float _2196 = fma(_2162, _2170, _2194);
            float _2198 = _2176 * _2162;
            float _2200 = _2176 * _2188;
            float _2202 = _2178 * _2164;
            float _2204 = _2178 * _2168;
            float _2206 = -_2198;
            float _2208 = fma(_2174, _2164, _2206);
            float _2210 = -_2200;
            float _2212 = fma(_2174, _2192, _2210);
            float _2214 = _2176 * _2172;
            float _2216 = _2174 * _2170;
            float _2218 = _2174 * _2166;
            float _2220 = fma(_2178, _2196, _2212);
            float _2222 = -_2214;
            float _2224 = fma(_2178, _2170, _2222);
            float _2226 = -_2204;
            float _2228 = fma(_2174, _2172, _2226);
            float _2230 = -_2216;
            float _2232 = fma(_2176, _2168, _2230);
            float _2234 = 1.0 / _2220;
            float _2236 = -_2218;
            float _2238 = fma(_2178, _2162, _2236);
            float _2240 = -_2162;
            float _2242 = fma(_2240, _2172, _2180);
            float _2244 = -_2202;
            float _2246 = fma(_2176, _2166, _2244);
            float _2248 = _2224 * _2234;
            float _2250 = _2228 * _2234;
            float _2252 = _2232 * _2234;
            float _2254 = _2142 * _2234;
            float _2256 = _2140 * _2248;
            float _2258 = _2140 * _2250;
            float _2260 = _2242 * _2234;
            float _2262 = _2140 * _2252;
            float _2264 = _2246 * _2234;
            float _2266 = _2238 * _2234;
            float _2268 = fma(_2192, _2254, _2256);
            float _2270 = fma(_2142, _2260, _2258);
            float _2272 = _2208 * _2234;
            float _2274 = fma(_2196, _2254, _2262);
            float _2276 = fma(_2144, _2264, _2268);
            float _2278 = fma(_2144, _2266, _2270);
            float _2280 = fma(_2144, _2272, _2274);
            _2158 = _2278;
            _2148 = _2276;
            _2150 = _2280;
            _2282 = true;
        }
        else
        {
            int _2284 = as_type<int>(_150) & 1024;
            bool _2286 = _2284 != 0;
            if (_2286)
            {
                _1746 = true;
            }
            bool _2288 = _1746;
            bool _2290 = _2288;
            if (!_2286)
            {
                int _2292 = as_type<int>(_150) & 2048;
                bool _2294 = _2292 != 0;
                _2290 = _2294;
            }
            bool _2296 = _2290;
            if (!_2296)
            {
                _2156 = _2140;
            }
            float _2298 = _2156;
            bool _2300 = !_2296;
            _2158 = _2298;
            if (!_2300)
            {
                uint _2302 = uint(int(uint(_152) >> uint(2)));
                float _2304 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2302)]);
                int _2306 = _152 + 4;
                uint _2308 = uint(int(uint(_2306) >> uint(2)));
                float _2310 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2308)]);
                int _2312 = _152 + 8;
                uint _2314 = uint(int(uint(_2312) >> uint(2)));
                float _2316 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2314)]);
                uint _2318 = uint(int(uint(_152) >> uint(2)));
                float _2320 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2318)]);
                int _2322 = _152 + 4;
                uint _2324 = uint(int(uint(_2322) >> uint(2)));
                float _2326 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2324)]);
                int _2328 = _152 + 8;
                uint _2330 = uint(int(uint(_2328) >> uint(2)));
                float _2332 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2330)]);
                uint _2334 = uint(int(uint(_152) >> uint(2)));
                float _2336 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2334)]);
                int _2338 = _152 + 4;
                uint _2340 = uint(int(uint(_2338) >> uint(2)));
                float _2342 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2340)]);
                int _2344 = _152 + 8;
                uint _2346 = uint(int(uint(_2344) >> uint(2)));
                float _2348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2346)]);
                float _2350 = _2316 * _2320;
                float _2352 = _2316 * _2326;
                float _2354 = _2310 * _2320;
                float _2356 = -_2350;
                float _2358 = fma(_2304, _2332, _2356);
                float _2360 = -_2352;
                float _2362 = fma(_2310, _2332, _2360);
                float _2364 = -_2354;
                float _2366 = fma(_2304, _2326, _2364);
                float _2368 = _2342 * _2304;
                float _2370 = _2342 * _2358;
                float _2372 = _2348 * _2310;
                float _2374 = _2348 * _2320;
                float _2376 = -_2368;
                float _2378 = fma(_2336, _2310, _2376);
                float _2380 = -_2370;
                float _2382 = fma(_2336, _2362, _2380);
                float _2384 = _2342 * _2332;
                float _2386 = _2336 * _2326;
                float _2388 = -_2372;
                float _2390 = fma(_2342, _2316, _2388);
                float _2392 = fma(_2348, _2366, _2382);
                float _2394 = -_2384;
                float _2396 = fma(_2348, _2326, _2394);
                float _2398 = -_2374;
                float _2400 = fma(_2336, _2332, _2398);
                float _2402 = -_2386;
                float _2404 = fma(_2342, _2320, _2402);
                float _2406 = 1.0 / _2392;
                float _2408 = _2336 * _2316;
                float _2410 = -_2408;
                float _2412 = fma(_2348, _2304, _2410);
                float _2414 = -_2304;
                float _2416 = fma(_2414, _2332, _2350);
                float _2418 = _2396 * _2406;
                float _2420 = _2400 * _2406;
                float _2422 = _2404 * _2406;
                float _2424 = _2142 * _2406;
                float _2426 = _2418 * _2140;
                float _2428 = _2420 * _2140;
                float _2430 = _2416 * _2406;
                float _2432 = _2422 * _2140;
                float _2434 = _2390 * _2406;
                float _2436 = _2412 * _2406;
                float _2438 = fma(_2362, _2424, _2426);
                float _2440 = fma(_2430, _2142, _2428);
                float _2442 = _2378 * _2406;
                float _2444 = fma(_2366, _2424, _2432);
                float _2446 = fma(_2434, _2144, _2438);
                float _2448 = fma(_2436, _2144, _2440);
                float _2450 = fma(_2442, _2144, _2444);
                _2158 = _2448;
                _2148 = _2446;
                _2150 = _2450;
            }
        }
    }
    _2282 = false;
    float _2452 = _2158;
    float _2454 = _2148;
    float _2456 = _2150;
    uint _2458 = uint(int(uint(_174) >> uint(2)));
    float _2460 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_2458)]);
    float _2462 = fma(_524, _2452, _586);
    int _2464 = _152 + 4;
    float _2466 = fma(_524, _2454, _578);
    int _2468 = _152 + 8;
    float _2470 = fma(_524, _2456, _584);
    float _2472 = -_156;
    float _2474 = _2472 + _1734;
    float _2476 = -_162;
    float _2478 = _2476 + _1736;
    float _2480 = -_168;
    float _2482 = _2480 + _1738;
    float _2484 = _2478 * _2478;
    float _2486 = fma(_2474, _2474, _2484);
    float _2488 = fma(_2482, _2482, _2486);
    uint _2490 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2490)] = as_type<uint>(_2460);
    uint _2492 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2492)] = as_type<uint>(_1734);
    uint _2494 = uint(int(uint(_2464) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2494)] = as_type<uint>(_1736);
    uint _2496 = uint(int(uint(_2468) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2496)] = as_type<uint>(_1738);
    uint _2498 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2498)] = as_type<uint>(_2466);
    uint _2500 = uint(int(uint(_2464) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2500)] = as_type<uint>(_2462);
    uint _2502 = uint(int(uint(_2468) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2502)] = as_type<uint>(_2470);
    uint _2504 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2504)] = as_type<uint>(_2474);
    uint _2506 = uint(int(uint(_2464) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2506)] = as_type<uint>(_2478);
    uint _2508 = uint(int(uint(_2468) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2508)] = as_type<uint>(_2482);
    float _2510 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2512 = sqrt(_2488);
    float _2514 = _2462 * _2462;
    float _2516 = fma(_2466, _2466, _2514);
    float _2518 = fma(_2470, _2470, _2516);
    float _2520 = sqrt(_2518);
    bool _2522 = _2512 >= 9.9999999747524270787835121154785e-07;
    bool _2524 = isnan(_2512);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan(9.9999999747524270787835121154785e-07);
    bool _2530 = _2526 || _2528;
    if (!_2530)
    {
        bool _2532 = _528 != _268;
        bool _2534 = isnan(_528);
        bool _2536 = _2532 || _2534;
        bool _2538 = isnan(_268);
        bool _2540 = _2536 || _2538;
        _2542 = _2540;
        if (!_2542)
        {
            float _2544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2546 = _2544 > 0.0;
            bool _2548 = !_2546;
            if (!_2548)
            {
                float _2550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2556 = _2552 * _494;
                float _2558 = _2552 * _492;
                float _2560 = _2552 * _496;
                float _2562 = fma(_2550, _500, _2556);
                float _2564 = fma(_2550, _498, _2558);
                float _2566 = fma(_2550, _502, _2560);
                float _2568 = fma(_2554, _506, _2562);
                float _2570 = fma(_2554, _504, _2564);
                float _2572 = fma(_2554, _508, _2566);
                float _2574 = _2568 * _2568;
                float _2576 = fma(_2570, _2570, _2574);
                float _2578 = fma(_2572, _2572, _2576);
                float _2580 = rsqrt(_2578);
                float _2582 = _2580 * 9.9999999747524270787835121154785e-07;
                float _2584 = _2570 * _2582;
                float _2586 = _2568 * _2582;
                float _2588 = _2572 * _2582;
                _310 = as_type<int>(_2584);
                _312 = as_type<int>(_2586);
                _314 = as_type<int>(_2588);
                _2542 = true;
            }
            else
            {
                bool _2590 = _2520 >= 9.9999999747524270787835121154785e-07;
                bool _2592 = isnan(_2520);
                bool _2594 = _2590 || _2592;
                bool _2596 = isnan(9.9999999747524270787835121154785e-07);
                bool _2598 = _2594 || _2596;
                if (!_2598)
                {
                    float _2600 = _1736 * _1736;
                    float _2602 = fma(_1734, _1734, _2600);
                    float _2604 = fma(_1738, _1738, _2602);
                    float _2606 = sqrt(_2604);
                    bool _2608 = _2606 >= 9.9999999747524270787835121154785e-07;
                    bool _2610 = isnan(_2606);
                    bool _2612 = _2608 || _2610;
                    bool _2614 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2616 = _2612 || _2614;
                    float _2618 = _2606;
                    if (_2616)
                    {
                        float _2620 = rsqrt(_2604);
                        _2618 = _2620;
                    }
                    float _2622 = _2618;
                    if (!_2616)
                    {
                        _298 = 0;
                    }
                    int _2624 = _298;
                    int _2626 = _2624;
                    if (!_2616)
                    {
                        _300 = 897988541;
                    }
                    int _2628 = _300;
                    int _2630 = _2628;
                    if (!_2616)
                    {
                        _302 = 0;
                    }
                    int _2632 = _302;
                    float _2634 = _2622;
                    int _2636 = _2632;
                    if (_2616)
                    {
                        float _2638 = _2622 * 9.9999999747524270787835121154785e-07;
                        _2634 = _2638;
                    }
                    float _2640 = _2634;
                    if (_2616)
                    {
                        float _2642 = _1734 * _2640;
                        _2626 = as_type<int>(_2642);
                    }
                    int _2644 = _2626;
                    _310 = _2644;
                    if (_2616)
                    {
                        float _2646 = _1736 * _2640;
                        _2630 = as_type<int>(_2646);
                    }
                    int _2648 = _2630;
                    _312 = _2648;
                    if (_2616)
                    {
                        float _2650 = _1738 * _2640;
                        _2636 = as_type<int>(_2650);
                    }
                    int _2652 = _2636;
                    _314 = _2652;
                    _2542 = true;
                }
                else
                {
                    float _2654 = rsqrt(_2518);
                    float _2656 = _2654 * 9.9999999747524270787835121154785e-07;
                    float _2658 = _2466 * _2656;
                    float _2660 = _2462 * _2656;
                    float _2662 = _2470 * _2656;
                    _310 = as_type<int>(_2658);
                    _312 = as_type<int>(_2660);
                    _314 = as_type<int>(_2662);
                    _2542 = true;
                }
            }
        }
    }
    else
    {
        float _2664 = _2520 * _2510;
        bool _2666 = _2664 >= 0.001000000047497451305389404296875;
        bool _2668 = isnan(_2664);
        bool _2670 = _2666 || _2668;
        bool _2672 = isnan(0.001000000047497451305389404296875);
        bool _2674 = _2670 || _2672;
        bool _2676 = _2664 > 0.0;
        bool _2678 = !_2674;
        bool _2680 = _2676 && _2678;
        bool _2682 = _2512 < 0.001000000047497451305389404296875;
        bool _2684 = _2682 && _2680;
        if (!_2684)
        {
            _304 = as_type<int>(_2474);
        }
        int _2686 = _304;
        int _2688 = _2686;
        if (_2684)
        {
            float _2690 = _2466 * _2510;
            _2688 = as_type<int>(_2690);
        }
        int _2692 = _2688;
        _310 = _2692;
        if (!_2684)
        {
            _306 = as_type<int>(_2478);
        }
        int _2694 = _306;
        int _2696 = _2694;
        if (_2684)
        {
            float _2698 = _2462 * _2510;
            _2696 = as_type<int>(_2698);
        }
        int _2700 = _2696;
        _312 = _2700;
        if (!_2684)
        {
            _308 = as_type<int>(_2482);
        }
        int _2702 = _308;
        _314 = _2702;
        if (_2684)
        {
            float _2704 = _2470 * _2510;
            _314 = as_type<int>(_2704);
        }
    }
    _2542 = false;
    int _2706 = _310;
    int _2708 = _312;
    int _2710 = _314;
    uint _2712 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2712)] = uint(_2706);
    uint _2714 = uint(int(uint(_2464) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2714)] = uint(_2708);
    uint _2716 = uint(int(uint(_2468) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2716)] = uint(_2710);
}

