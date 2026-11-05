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
    bool _1370 = false;
    bool _1116 = false;
    bool _652 = false;
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
    float _150 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _164 = as_type<int>(_152) & 512;
    bool _166 = _164 != 0;
    float _168 = 0.0;
    float _170 = 0.0;
    float _172 = 0.0;
    bool _174 = _166;
    if (_166)
    {
        float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _168 = _176;
        _170 = _178;
        _172 = _180;
    }
    float _182 = _168;
    float _184 = _170;
    float _186 = _172;
    float _188 = 0.0;
    float _190 = 0.0;
    float _192 = 0.0;
    if (_166)
    {
        float _194 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _188 = _194;
        _190 = _196;
        _192 = _198;
    }
    float _200 = _188;
    float _202 = _190;
    float _204 = _192;
    float _206 = 0.0;
    float _208 = 0.0;
    float _210 = 0.0;
    if (_166)
    {
        float _212 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _206 = _212;
        _208 = _214;
        _210 = _216;
    }
    float _218 = _206;
    float _220 = _208;
    float _222 = _210;
    int _224 = _71 << 4;
    int _226 = _224 + 12;
    uint _228 = uint(int(uint(_224) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_228)]);
    int _232 = _224 + 4;
    uint _234 = uint(int(uint(_232) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_234)]);
    int _238 = _224 + 8;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_240)]);
    uint _244 = uint(int(uint(_226) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_244)]);
    uint _248 = uint(int(uint(_224) >> uint(2)));
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_248)]);
    int _252 = _224 + 4;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_254)]);
    int _258 = _224 + 8;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_260)]);
    uint _264 = uint(int(uint(_224) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_264)]);
    int _268 = _224 + 4;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_270)]);
    int _274 = _224 + 8;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
    uint _280 = uint(int(uint(_224) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_280)]);
    uint _284 = uint(int(uint(_226) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_284)]);
    float _288 = _200;
    float _290 = _202;
    float _292 = _204;
    float _294 = _182;
    float _296 = _184;
    float _298 = _186;
    float _300 = _218;
    float _302 = _220;
    float _304 = _222;
    int _306 = as_type<int>(_272);
    int _308 = as_type<int>(_278);
    int _310 = as_type<int>(_272);
    int _312 = as_type<int>(_278);
    if (!_166)
    {
        int _314 = _224 + 4;
        uint _316 = uint(int(uint(_224) >> uint(2)));
        float _318 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_316)]);
        int _320 = _224 + 8;
        uint _322 = uint(int(uint(_224) >> uint(2)));
        float _324 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_322)]);
        uint _326 = uint(int(uint(_314) >> uint(2)));
        float _328 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_326)]);
        uint _330 = uint(int(uint(_320) >> uint(2)));
        float _332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_330)]);
        uint _334 = uint(int(uint(_314) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_334)]);
        uint _338 = uint(int(uint(_320) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_338)]);
        uint _342 = uint(int(uint(_224) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_342)]);
        uint _346 = uint(int(uint(_314) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_346)]);
        uint _350 = uint(int(uint(_320) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_350)]);
        float _354 = _318 * _318;
        float _356 = fma(_324, _324, _354);
        float _358 = _328 * _328;
        float _360 = _332 * _332;
        float _362 = fma(_336, _336, _358);
        float _364 = fma(_340, _340, _360);
        float _366 = fma(_344, _344, _356);
        float _368 = fma(_348, _348, _362);
        float _370 = sqrt(_366);
        float _372 = fma(_352, _352, _364);
        float _374 = sqrt(_368);
        float _376 = sqrt(_372);
        bool _378 = _370 > 0.0;
        bool _380 = _374 > 0.0;
        bool _382 = _376 > 0.0;
        float _384 = _364;
        float _386 = _376;
        float _388 = _362;
        float _390 = _370;
        float _392 = _374;
        float _394 = _318;
        float _396 = _366;
        float _398 = _328;
        float _400 = _344;
        float _402 = _368;
        if (_378)
        {
            float _404 = rsqrt(_366);
            _384 = _404;
        }
        float _406 = _384;
        float _408 = 0.0;
        if (_380)
        {
            float _410 = rsqrt(_368);
            _408 = _410;
        }
        float _412 = _408;
        float _414 = 0.0;
        if (_382)
        {
            float _416 = rsqrt(_372);
            _414 = _416;
        }
        float _418 = _414;
        if (!_378)
        {
            _386 = 0.0;
        }
        float _420 = _386;
        float _422 = _420;
        if (_378)
        {
            float _424 = _318 * _406;
            _422 = _424;
        }
        float _426 = _422;
        _288 = _426;
        if (!_378)
        {
            _388 = 0.0;
        }
        float _428 = _388;
        float _430 = _428;
        if (_378)
        {
            float _432 = _344 * _406;
            _430 = _432;
        }
        float _434 = _430;
        _300 = _434;
        if (!_380)
        {
            _390 = 0.0;
        }
        float _436 = _390;
        float _438 = _436;
        if (!_378)
        {
            _392 = 0.0;
        }
        float _440 = _392;
        float _442 = _440;
        if (_380)
        {
            float _444 = _328 * _412;
            _438 = _444;
        }
        float _446 = _438;
        _290 = _446;
        if (!_380)
        {
            _394 = 0.0;
        }
        float _448 = _394;
        float _450 = _448;
        if (_378)
        {
            float _452 = _324 * _406;
            _442 = _452;
        }
        float _454 = _442;
        _294 = _454;
        if (!_380)
        {
            _396 = 0.0;
        }
        float _456 = _396;
        float _458 = _456;
        if (_380)
        {
            float _460 = _336 * _412;
            _450 = _460;
        }
        float _462 = _450;
        _296 = _462;
        if (!_382)
        {
            _398 = 0.0;
        }
        float _464 = _398;
        float _466 = _464;
        if (_380)
        {
            float _468 = _348 * _412;
            _458 = _468;
        }
        float _470 = _458;
        _302 = _470;
        if (!_382)
        {
            _400 = 0.0;
        }
        float _472 = _400;
        float _474 = _472;
        if (_382)
        {
            float _476 = _332 * _418;
            _466 = _476;
        }
        float _478 = _466;
        _292 = _478;
        if (!_382)
        {
            _402 = 0.0;
        }
        float _480 = _402;
        _304 = _480;
        if (_382)
        {
            float _482 = _340 * _418;
            _474 = _482;
        }
        float _484 = _474;
        _298 = _484;
        if (_382)
        {
            float _486 = _352 * _418;
            _304 = _486;
        }
    }
    float _488 = _288;
    float _490 = _290;
    float _492 = _292;
    float _494 = _294;
    float _496 = _296;
    float _498 = _298;
    float _500 = _300;
    float _502 = _302;
    float _504 = _304;
    float _506 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _508 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[65]);
    float _510 = abs(_162);
    float _512 = log2(_510);
    float _514 = _246 * _150;
    float _516 = _156 * _160;
    float _518 = _230 * _514;
    float _520 = _236 * _514;
    float _522 = _242 * _514;
    float _524 = _154 * _160;
    float _526 = _516 * _488;
    float _528 = _262 + _522;
    float _530 = _516 * _490;
    float _532 = _150 * _512;
    float _534 = _516 * _492;
    float _536 = exp2(_532);
    float _538 = _158 * _160;
    float _540 = fma(_524, _494, _526);
    float _542 = fma(_524, _496, _530);
    float _544 = fma(_524, _498, _534);
    float _546 = fma(_538, _500, _540);
    float _548 = fma(_538, _502, _542);
    float _550 = fma(_538, _504, _544);
    float _552 = _250 + _518;
    float _554 = _256 + _520;
    float _556 = _150 * _546;
    float _558 = _150 * _548;
    float _560 = _150 * _550;
    float _562 = fma(_230, _536, _556);
    float _564 = fma(_236, _536, _558);
    float _566 = fma(_242, _536, _560);
    bool _568 = _508 > 0.0;
    float _570 = 0.0;
    float _572 = _560;
    float _574 = _536;
    int _576 = as_type<int>(_518);
    float _578 = _494;
    int _580 = as_type<int>(_518);
    if (!_568)
    {
        _570 = _552;
    }
    float _582 = _570;
    float _584 = _582;
    float _586 = _582;
    if (!_568)
    {
        _572 = _554;
    }
    float _588 = _572;
    float _590 = _588;
    float _592 = _588;
    if (!_568)
    {
        _574 = _528;
    }
    float _594 = _574;
    bool _596 = !_568;
    float _598 = _594;
    float _600 = _594;
    if (!_596)
    {
        bool _602 = !_166;
        if (!_602)
        {
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _610 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _612 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _614 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _616 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _618 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _620 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _622 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _624 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _626 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _628 = _554 * _606;
            float _630 = _554 * _614;
            float _632 = fma(_552, _604, _628);
            float _634 = _554 * _622;
            float _636 = fma(_552, _612, _630);
            float _638 = fma(_528, _608, _632);
            float _640 = fma(_552, _620, _634);
            float _642 = fma(_528, _616, _636);
            float _644 = _610 + _638;
            float _646 = fma(_528, _624, _640);
            float _648 = _618 + _642;
            float _650 = _626 + _646;
            _586 = _644;
            _600 = _650;
            _592 = _648;
            _652 = true;
        }
        else
        {
            int _654 = as_type<int>(_152) & 1024;
            bool _656 = _654 != 0;
            bool _658 = !_656;
            if (!_658)
            {
                float _660 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _662 = uint(int(uint(_224) >> uint(2)));
                float _664 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_662)]);
                int _666 = _224 + 4;
                uint _668 = uint(int(uint(_666) >> uint(2)));
                float _670 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_668)]);
                int _672 = _224 + 8;
                uint _674 = uint(int(uint(_672) >> uint(2)));
                float _676 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_674)]);
                uint _678 = uint(int(uint(_224) >> uint(2)));
                float _680 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_678)]);
                int _682 = _224 + 4;
                uint _684 = uint(int(uint(_682) >> uint(2)));
                float _686 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_684)]);
                int _688 = _224 + 8;
                uint _690 = uint(int(uint(_688) >> uint(2)));
                float _692 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_690)]);
                uint _694 = uint(int(uint(_224) >> uint(2)));
                float _696 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_694)]);
                int _698 = _224 + 4;
                uint _700 = uint(int(uint(_698) >> uint(2)));
                float _702 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_700)]);
                int _704 = _224 + 8;
                uint _706 = uint(int(uint(_704) >> uint(2)));
                float _708 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_706)]);
                float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _714 = _554 * _670;
                float _716 = _554 * _686;
                float _718 = _554 * _702;
                float _720 = fma(_552, _664, _714);
                float _722 = fma(_552, _680, _716);
                float _724 = fma(_552, _696, _718);
                float _726 = fma(_528, _676, _720);
                float _728 = fma(_528, _692, _722);
                float _730 = fma(_528, _708, _724);
                float _732 = _660 + _726;
                float _734 = _710 + _728;
                float _736 = _712 + _730;
                _586 = _732;
                _600 = _736;
                _592 = _734;
                _652 = true;
            }
            else
            {
                int _738 = as_type<int>(_152) & 2048;
                bool _740 = _738 != 0;
                if (!_740)
                {
                    _584 = _552;
                }
                float _742 = _584;
                _586 = _742;
                if (!_740)
                {
                    _590 = _554;
                }
                float _744 = _590;
                _592 = _744;
                if (!_740)
                {
                    _598 = _528;
                }
                float _746 = _598;
                bool _748 = !_740;
                _600 = _746;
                if (!_748)
                {
                    uint _750 = uint(int(uint(_224) >> uint(2)));
                    float _752 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_750)]);
                    int _754 = _224 + 4;
                    uint _756 = uint(int(uint(_754) >> uint(2)));
                    float _758 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_756)]);
                    int _760 = _224 + 8;
                    uint _762 = uint(int(uint(_760) >> uint(2)));
                    float _764 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_762)]);
                    int _766 = _224 + 12;
                    uint _768 = uint(int(uint(_766) >> uint(2)));
                    float _770 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_768)]);
                    uint _772 = uint(int(uint(_224) >> uint(2)));
                    float _774 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_772)]);
                    int _776 = _224 + 4;
                    uint _778 = uint(int(uint(_776) >> uint(2)));
                    float _780 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_778)]);
                    int _782 = _224 + 8;
                    uint _784 = uint(int(uint(_782) >> uint(2)));
                    float _786 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_784)]);
                    int _788 = _224 + 12;
                    uint _790 = uint(int(uint(_788) >> uint(2)));
                    float _792 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_790)]);
                    uint _794 = uint(int(uint(_224) >> uint(2)));
                    float _796 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_794)]);
                    int _798 = _224 + 4;
                    uint _800 = uint(int(uint(_798) >> uint(2)));
                    float _802 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_800)]);
                    int _804 = _224 + 8;
                    uint _806 = uint(int(uint(_804) >> uint(2)));
                    float _808 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_806)]);
                    int _810 = _224 + 12;
                    uint _812 = uint(int(uint(_810) >> uint(2)));
                    float _814 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_812)]);
                    float _816 = _554 * _758;
                    float _818 = _554 * _780;
                    float _820 = _554 * _802;
                    float _822 = fma(_552, _752, _816);
                    float _824 = fma(_552, _774, _818);
                    float _826 = fma(_552, _796, _820);
                    float _828 = fma(_528, _764, _822);
                    float _830 = fma(_528, _786, _824);
                    float _832 = fma(_528, _808, _826);
                    float _834 = _828 + _770;
                    float _836 = _830 + _792;
                    float _838 = _832 + _814;
                    _586 = _834;
                    _600 = _838;
                    _592 = _836;
                }
            }
        }
    }
    _652 = false;
    float _840 = _586;
    float _842 = _600;
    float _844 = _592;
    float _846 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[64]);
    float _848 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[62]);
    float _852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _854 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[59]);
    float _856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[63]);
    bool _858 = _846 != 0.0;
    bool _860 = isnan(_846);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.0);
    bool _866 = _862 || _864;
    float _868 = _506 * _848;
    float _870 = _506 * _850;
    float _872 = _506 * _852;
    float _874 = fma(_854, _840, _868);
    float _876 = fma(_854, _842, _870);
    float _878 = fma(_854, _844, _872);
    float _880 = _856;
    if (_866)
    {
        float _882 = _282 * _856;
        _880 = _882;
    }
    float _884 = _880;
    float _886 = _878 + _884;
    float _888 = -_884;
    bool _890 = _874 >= _888;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan(_888);
    bool _898 = _894 || _896;
    float _900 = _874 + _884;
    float _902 = -_884;
    bool _904 = _876 >= _902;
    bool _906 = isnan(_876);
    bool _908 = _904 || _906;
    bool _910 = isnan(_902);
    bool _912 = _908 || _910;
    float _914 = _876 + _884;
    float _916 = -_884;
    bool _918 = _878 >= _916;
    bool _920 = isnan(_878);
    bool _922 = _918 || _920;
    bool _924 = isnan(_916);
    bool _926 = _922 || _924;
    bool _928 = !_898;
    float _930 = -_900;
    float _932 = _928 ? _930 : _900;
    bool _934 = !_912;
    float _936 = -_914;
    float _938 = _934 ? _936 : _914;
    bool _940 = !_926;
    float _942 = -_886;
    float _944 = _940 ? _942 : _886;
    float _946 = _932 * 0.03125;
    float _948 = _938 * 0.03125;
    float _950 = _944 * 0.03125;
    float3 _2952 = float3(_946, _950, _948);
    float3 _954 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_2952, float3(0.0), isnan(_2952)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_2952, float3(0.0), isnan(_2952)), level(0.0)).xyz;
    float _956 = _954.x;
    float _958 = _954.y;
    float _960 = _954.z;
    float _962 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[57]);
    float _964 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[56]);
    float _966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[58]);
    float _968 = _958 + (-0.5);
    float _970 = _956 + (-0.5);
    float _972 = _960 + (-0.5);
    float _974 = _968 * _962;
    float _976 = _970 * _964;
    float _978 = _972 * _966;
    float _980 = _962;
    float _982 = _976;
    float _984 = _978;
    if (!_568)
    {
        _980 = _974;
    }
    float _986 = _980;
    bool _988 = !_568;
    float _990 = _986;
    float _992 = _986;
    if (!_988)
    {
        bool _994 = !_166;
        if (!_994)
        {
            float _996 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _998 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1000 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1004 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1006 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1014 = _1000 * _1002;
            float _1016 = _1000 * _1004;
            float _1018 = _998 * _1002;
            float _1020 = -_1014;
            float _1022 = fma(_996, _1006, _1020);
            float _1024 = -_1016;
            float _1026 = fma(_998, _1006, _1024);
            float _1028 = -_1018;
            float _1030 = fma(_996, _1004, _1028);
            float _1032 = _1010 * _996;
            float _1034 = _1010 * _1022;
            float _1036 = _1012 * _998;
            float _1038 = _1008 * _1004;
            float _1040 = -_1032;
            float _1042 = fma(_1008, _998, _1040);
            float _1044 = -_1034;
            float _1046 = fma(_1008, _1026, _1044);
            float _1048 = _1010 * _1006;
            float _1050 = _1012 * _1002;
            float _1052 = _1008 * _1000;
            float _1054 = fma(_1012, _1030, _1046);
            float _1056 = -_1048;
            float _1058 = fma(_1012, _1004, _1056);
            float _1060 = -_1050;
            float _1062 = fma(_1008, _1006, _1060);
            float _1064 = -_1038;
            float _1066 = fma(_1010, _1002, _1064);
            float _1068 = 1.0 / _1054;
            float _1070 = -_1052;
            float _1072 = fma(_1012, _996, _1070);
            float _1074 = -_996;
            float _1076 = fma(_1074, _1006, _1014);
            float _1078 = -_1036;
            float _1080 = fma(_1010, _1000, _1078);
            float _1082 = _1058 * _1068;
            float _1084 = _1062 * _1068;
            float _1086 = _1066 * _1068;
            float _1088 = _976 * _1068;
            float _1090 = _974 * _1082;
            float _1092 = _974 * _1084;
            float _1094 = _1076 * _1068;
            float _1096 = _974 * _1086;
            float _1098 = _1080 * _1068;
            float _1100 = _1072 * _1068;
            float _1102 = fma(_1026, _1088, _1090);
            float _1104 = fma(_976, _1094, _1092);
            float _1106 = _1042 * _1068;
            float _1108 = fma(_1030, _1088, _1096);
            float _1110 = fma(_978, _1098, _1102);
            float _1112 = fma(_978, _1100, _1104);
            float _1114 = fma(_978, _1106, _1108);
            _982 = _1110;
            _992 = _1112;
            _984 = _1114;
            _1116 = true;
        }
        else
        {
            int _1118 = as_type<int>(_152) & 1024;
            bool _1120 = _1118 != 0;
            if (_1120)
            {
                _174 = true;
            }
            bool _1122 = _174;
            bool _1124 = _1122;
            if (!_1120)
            {
                int _1126 = as_type<int>(_152) & 2048;
                bool _1128 = _1126 != 0;
                _1124 = _1128;
            }
            bool _1130 = _1124;
            if (!_1130)
            {
                _990 = _974;
            }
            float _1132 = _990;
            bool _1134 = !_1130;
            _992 = _1132;
            if (!_1134)
            {
                uint _1136 = uint(int(uint(_224) >> uint(2)));
                float _1138 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1136)]);
                int _1140 = _224 + 4;
                uint _1142 = uint(int(uint(_1140) >> uint(2)));
                float _1144 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1142)]);
                int _1146 = _224 + 8;
                uint _1148 = uint(int(uint(_1146) >> uint(2)));
                float _1150 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1148)]);
                uint _1152 = uint(int(uint(_224) >> uint(2)));
                float _1154 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1152)]);
                int _1156 = _224 + 4;
                uint _1158 = uint(int(uint(_1156) >> uint(2)));
                float _1160 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1158)]);
                int _1162 = _224 + 8;
                uint _1164 = uint(int(uint(_1162) >> uint(2)));
                float _1166 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1164)]);
                uint _1168 = uint(int(uint(_224) >> uint(2)));
                float _1170 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1168)]);
                int _1172 = _224 + 4;
                uint _1174 = uint(int(uint(_1172) >> uint(2)));
                float _1176 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1174)]);
                int _1178 = _224 + 8;
                uint _1180 = uint(int(uint(_1178) >> uint(2)));
                float _1182 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1180)]);
                float _1184 = _1150 * _1154;
                float _1186 = _1150 * _1160;
                float _1188 = _1144 * _1154;
                float _1190 = -_1184;
                float _1192 = fma(_1138, _1166, _1190);
                float _1194 = -_1186;
                float _1196 = fma(_1144, _1166, _1194);
                float _1198 = -_1188;
                float _1200 = fma(_1138, _1160, _1198);
                float _1202 = _1176 * _1138;
                float _1204 = _1176 * _1192;
                float _1206 = _1182 * _1144;
                float _1208 = _1170 * _1160;
                float _1210 = -_1202;
                float _1212 = fma(_1170, _1144, _1210);
                float _1214 = -_1204;
                float _1216 = fma(_1170, _1196, _1214);
                float _1218 = _1176 * _1166;
                float _1220 = _1182 * _1154;
                float _1222 = _1170 * _1150;
                float _1224 = fma(_1182, _1200, _1216);
                float _1226 = -_1218;
                float _1228 = fma(_1182, _1160, _1226);
                float _1230 = -_1220;
                float _1232 = fma(_1170, _1166, _1230);
                float _1234 = -_1208;
                float _1236 = fma(_1176, _1154, _1234);
                float _1238 = 1.0 / _1224;
                float _1240 = -_1222;
                float _1242 = fma(_1182, _1138, _1240);
                float _1244 = -_1138;
                float _1246 = fma(_1244, _1166, _1184);
                float _1248 = -_1206;
                float _1250 = fma(_1176, _1150, _1248);
                float _1252 = _1228 * _1238;
                float _1254 = _1232 * _1238;
                float _1256 = _1236 * _1238;
                float _1258 = _976 * _1238;
                float _1260 = _974 * _1252;
                float _1262 = _974 * _1254;
                float _1264 = _1246 * _1238;
                float _1266 = _974 * _1256;
                float _1268 = _1250 * _1238;
                float _1270 = _1242 * _1238;
                float _1272 = fma(_1196, _1258, _1260);
                float _1274 = fma(_976, _1264, _1262);
                float _1276 = _1212 * _1238;
                float _1278 = fma(_1200, _1258, _1266);
                float _1280 = fma(_978, _1268, _1272);
                float _1282 = fma(_978, _1270, _1274);
                float _1284 = fma(_978, _1276, _1278);
                _982 = _1280;
                _992 = _1282;
                _984 = _1284;
            }
        }
    }
    _1116 = false;
    float _1286 = _982;
    float _1288 = _992;
    float _1290 = _984;
    uint _1292 = uint(int(uint(_226) >> uint(2)));
    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1292)]);
    int _1296 = _224 + 4;
    float _1298 = fma(_150, _1286, _562);
    int _1300 = _224 + 8;
    float _1302 = fma(_150, _1288, _564);
    float _1304 = fma(_150, _1290, _566);
    float _1306 = _520 * _520;
    float _1308 = fma(_518, _518, _1306);
    float _1310 = fma(_522, _522, _1308);
    float _1312 = sqrt(_1310);
    uint _1314 = uint(int(uint(_226) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1314)] = as_type<uint>(_1294);
    uint _1316 = uint(int(uint(_224) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1316)] = as_type<uint>(_552);
    uint _1318 = uint(int(uint(_1296) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1318)] = as_type<uint>(_554);
    uint _1320 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1320)] = as_type<uint>(_528);
    uint _1322 = uint(int(uint(_224) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1322)] = as_type<uint>(_1298);
    uint _1324 = uint(int(uint(_1296) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1324)] = as_type<uint>(_1302);
    uint _1326 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1326)] = as_type<uint>(_1304);
    uint _1328 = uint(int(uint(_224) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1328)] = as_type<uint>(_518);
    uint _1330 = uint(int(uint(_1296) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1330)] = as_type<uint>(_520);
    uint _1332 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1332)] = as_type<uint>(_522);
    float _1334 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1336 = _1302 * _1302;
    bool _1338 = _1312 >= 9.9999999747524270787835121154785e-07;
    bool _1340 = isnan(_1312);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan(9.9999999747524270787835121154785e-07);
    bool _1346 = _1342 || _1344;
    float _1348 = fma(_1298, _1298, _1336);
    float _1350 = fma(_1304, _1304, _1348);
    float _1352 = sqrt(_1350);
    int _1368;
    if (!_1346)
    {
        bool _1354 = _506 != _286;
        bool _1356 = isnan(_506);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan(_286);
        bool _1362 = _1358 || _1360;
        if (_1362)
        {
            _576 = as_type<int>(_266);
        }
        int _1364 = _576;
        int _1366 = _1364;
        _1368 = _1364;
        _1370 = _1362;
        if (!_1370)
        {
            float _1372 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1374 = _1372 > 0.0;
            bool _1376 = !_1374;
            if (!_1376)
            {
                float _1378 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1380 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1382 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1384 = _1380 * _490;
                float _1386 = _1380 * _488;
                float _1388 = _1380 * _492;
                float _1390 = fma(_1378, _496, _1384);
                float _1392 = fma(_1378, _494, _1386);
                float _1394 = fma(_1378, _498, _1388);
                float _1396 = fma(_1382, _502, _1390);
                float _1398 = fma(_1382, _500, _1392);
                float _1400 = fma(_1382, _504, _1394);
                float _1402 = _1396 * _1396;
                float _1404 = fma(_1398, _1398, _1402);
                float _1406 = fma(_1400, _1400, _1404);
                float _1408 = rsqrt(_1406);
                float _1410 = _1408 * 9.9999999747524270787835121154785e-07;
                float _1412 = _1398 * _1410;
                float _1414 = _1396 * _1410;
                float _1416 = _1400 * _1410;
                _1368 = as_type<int>(_1412);
                _310 = as_type<int>(_1414);
                _312 = as_type<int>(_1416);
                _1370 = true;
            }
            else
            {
                bool _1418 = _1352 >= 9.9999999747524270787835121154785e-07;
                bool _1420 = isnan(_1352);
                bool _1422 = _1418 || _1420;
                bool _1424 = isnan(9.9999999747524270787835121154785e-07);
                bool _1426 = _1422 || _1424;
                if (!_1426)
                {
                    float _1428 = _554 * _554;
                    float _1430 = fma(_552, _552, _1428);
                    float _1432 = fma(_528, _528, _1430);
                    float _1434 = sqrt(_1432);
                    bool _1436 = _1434 >= 9.9999999747524270787835121154785e-07;
                    bool _1438 = isnan(_1434);
                    bool _1440 = _1436 || _1438;
                    bool _1442 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1444 = _1440 || _1442;
                    int _1446 = as_type<int>(_278);
                    int _1448 = as_type<int>(_1434);
                    if (_1444)
                    {
                        float _1450 = rsqrt(_1432);
                        _1446 = as_type<int>(_1450);
                    }
                    int _1452 = _1446;
                    if (!_1444)
                    {
                        _1366 = 0;
                    }
                    int _1454 = _1366;
                    int _1456 = _1454;
                    if (!_1444)
                    {
                        _1448 = 897988541;
                    }
                    int _1458 = _1448;
                    int _1460 = _1452;
                    int _1462 = _1458;
                    if (_1444)
                    {
                        float _1464 = as_type<float>(_1452) * 9.9999999747524270787835121154785e-07;
                        _578 = _1464;
                    }
                    float _1466 = _578;
                    if (!_1444)
                    {
                        _1460 = 0;
                    }
                    int _1468 = _1460;
                    int _1470 = _1468;
                    if (_1444)
                    {
                        float _1472 = _552 * _1466;
                        _1456 = as_type<int>(_1472);
                    }
                    int _1474 = _1456;
                    _1368 = _1474;
                    if (_1444)
                    {
                        float _1476 = _554 * _1466;
                        _1462 = as_type<int>(_1476);
                    }
                    int _1478 = _1462;
                    _310 = _1478;
                    if (_1444)
                    {
                        float _1480 = _528 * _1466;
                        _1470 = as_type<int>(_1480);
                    }
                    int _1482 = _1470;
                    _312 = _1482;
                    _1370 = true;
                }
                else
                {
                    float _1484 = rsqrt(_1350);
                    float _1486 = _1484 * 9.9999999747524270787835121154785e-07;
                    float _1488 = _1298 * _1486;
                    float _1490 = _1302 * _1486;
                    float _1492 = _1304 * _1486;
                    _1368 = as_type<int>(_1488);
                    _310 = as_type<int>(_1490);
                    _312 = as_type<int>(_1492);
                    _1370 = true;
                }
            }
        }
    }
    else
    {
        float _1494 = _1352 * _1334;
        bool _1496 = _1494 >= 0.001000000047497451305389404296875;
        bool _1498 = isnan(_1494);
        bool _1500 = _1496 || _1498;
        bool _1502 = isnan(0.001000000047497451305389404296875);
        bool _1504 = _1500 || _1502;
        bool _1506 = _1494 > 0.0;
        bool _1508 = !_1504;
        bool _1510 = _1506 && _1508;
        bool _1512 = _1312 < 0.001000000047497451305389404296875;
        bool _1514 = _1512 && _1510;
        if (!_1514)
        {
            _306 = as_type<int>(_520);
        }
        int _1516 = _306;
        int _1518 = _1516;
        if (_1514)
        {
            float _1520 = _1298 * _1334;
            _580 = as_type<int>(_1520);
        }
        int _1522 = _580;
        _1368 = _1522;
        if (!_1514)
        {
            _308 = as_type<int>(_522);
        }
        int _1524 = _308;
        _312 = _1524;
        if (_1514)
        {
            float _1526 = _1302 * _1334;
            _1518 = as_type<int>(_1526);
        }
        int _1528 = _1518;
        _310 = _1528;
        if (_1514)
        {
            float _1530 = _1304 * _1334;
            _312 = as_type<int>(_1530);
        }
    }
    _1370 = false;
    int _1532 = _1368;
    int _1534 = _310;
    int _1536 = _312;
    uint _1538 = uint(int(uint(_224) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1538)] = uint(_1532);
    uint _1540 = uint(int(uint(_1296) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1540)] = uint(_1534);
    uint _1542 = uint(int(uint(_1300) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_1542)] = uint(_1536);
}

