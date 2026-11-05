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
    bool _1508 = false;
    bool _1248 = false;
    bool _862 = false;
    bool _384 = false;
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
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _156 = _73 << 4;
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    int _160 = _156 + 12;
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    uint _170 = uint(int(uint(_160) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_170)]);
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    uint _176 = uint(int(uint(_156) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_176)]);
    int _180 = _156 + 4;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_182)]);
    int _186 = _156 + 8;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    int _192 = _156 + 12;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    uint _198 = uint(int(uint(_156) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_198)]);
    int _202 = _156 + 4;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_204)]);
    int _208 = _156 + 8;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_210)]);
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _216 = uint(int(uint(_160) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    uint _220 = uint(int(uint(_156) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_220)]);
    int _224 = _156 + 4;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_226)]);
    int _230 = _156 + 8;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_232)]);
    uint _236 = uint(int(uint(_156) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_236)]);
    float _240 = abs(_154);
    float _242 = log2(_240);
    bool _244 = _158 > 0.0;
    float _246 = _152 * _242;
    float _248 = exp2(_246);
    float _250 = _162 * _168;
    float _252 = _164 * _168;
    float _254 = _166 * _168;
    float _256 = _172 * _152;
    float _258 = _152 * _250;
    float _260 = _152 * _252;
    float _262 = _152 * _254;
    float _264 = fma(_178, _256, _200);
    float _266 = fma(_184, _256, _206);
    int _268 = as_type<int>(_174) & 512;
    bool _270 = _268 != 0;
    float _272 = fma(_178, _248, _258);
    float _274 = fma(_190, _256, _212);
    float _276 = fma(_184, _248, _260);
    float _278 = fma(_190, _248, _262);
    float _280 = -_218;
    float _282 = _214 + _280;
    float _284 = _196;
    float _286 = _184;
    float _288 = _256;
    bool _290 = _244;
    float _292 = _282;
    float _294 = _174;
    if (!_244)
    {
        _284 = _264;
    }
    float _296 = _284;
    float _298 = _296;
    float _300 = _296;
    if (!_244)
    {
        _286 = _266;
    }
    float _302 = _286;
    float _304 = _302;
    float _306 = _302;
    if (!_244)
    {
        _288 = _274;
    }
    float _308 = _288;
    bool _310 = !_244;
    float _312 = _308;
    float _314 = _308;
    int _316 = as_type<int>(_222);
    int _318 = as_type<int>(_228);
    int _320 = as_type<int>(_234);
    int _322 = as_type<int>(_222);
    int _324 = as_type<int>(_228);
    int _326 = as_type<int>(_234);
    int _328 = as_type<int>(_222);
    int _330 = as_type<int>(_228);
    int _332 = as_type<int>(_234);
    if (!_310)
    {
        bool _334 = !_270;
        if (!_334)
        {
            float _336 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _338 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _340 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _342 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            float _344 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _346 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _348 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _350 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _352 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _354 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _356 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _358 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _360 = _266 * _338;
            float _362 = _266 * _346;
            float _364 = fma(_264, _336, _360);
            float _366 = _266 * _354;
            float _368 = fma(_264, _344, _362);
            float _370 = fma(_274, _340, _364);
            float _372 = fma(_264, _352, _366);
            float _374 = fma(_274, _348, _368);
            float _376 = _342 + _370;
            float _378 = fma(_274, _356, _372);
            float _380 = _350 + _374;
            float _382 = _358 + _378;
            _300 = _376;
            _314 = _382;
            _306 = _380;
            _384 = true;
        }
        else
        {
            int _386 = as_type<int>(_174) & 1024;
            bool _388 = _386 != 0;
            bool _390 = !_388;
            if (!_390)
            {
                float _392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                uint _394 = uint(int(uint(_156) >> uint(2)));
                float _396 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_394)]);
                int _398 = _156 + 4;
                uint _400 = uint(int(uint(_398) >> uint(2)));
                float _402 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_400)]);
                int _404 = _156 + 8;
                uint _406 = uint(int(uint(_404) >> uint(2)));
                float _408 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_406)]);
                uint _410 = uint(int(uint(_156) >> uint(2)));
                float _412 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_410)]);
                int _414 = _156 + 4;
                uint _416 = uint(int(uint(_414) >> uint(2)));
                float _418 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_416)]);
                int _420 = _156 + 8;
                uint _422 = uint(int(uint(_420) >> uint(2)));
                float _424 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_422)]);
                uint _426 = uint(int(uint(_156) >> uint(2)));
                float _428 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_426)]);
                int _430 = _156 + 4;
                uint _432 = uint(int(uint(_430) >> uint(2)));
                float _434 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_432)]);
                int _436 = _156 + 8;
                uint _438 = uint(int(uint(_436) >> uint(2)));
                float _440 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_438)]);
                float _442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _446 = _266 * _402;
                float _448 = _266 * _418;
                float _450 = _266 * _434;
                float _452 = fma(_264, _396, _446);
                float _454 = fma(_264, _412, _448);
                float _456 = fma(_264, _428, _450);
                float _458 = fma(_274, _408, _452);
                float _460 = fma(_274, _424, _454);
                float _462 = fma(_274, _440, _456);
                float _464 = _392 + _458;
                float _466 = _442 + _460;
                float _468 = _444 + _462;
                _300 = _464;
                _314 = _468;
                _306 = _466;
                _384 = true;
            }
            else
            {
                int _470 = as_type<int>(_174) & 2048;
                bool _472 = _470 != 0;
                if (!_472)
                {
                    _298 = _264;
                }
                float _474 = _298;
                _300 = _474;
                if (!_472)
                {
                    _304 = _266;
                }
                float _476 = _304;
                _306 = _476;
                if (!_472)
                {
                    _312 = _274;
                }
                float _478 = _312;
                bool _480 = !_472;
                _314 = _478;
                if (!_480)
                {
                    uint _482 = uint(int(uint(_156) >> uint(2)));
                    float _484 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_482)]);
                    int _486 = _156 + 4;
                    uint _488 = uint(int(uint(_486) >> uint(2)));
                    float _490 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_488)]);
                    int _492 = _156 + 8;
                    uint _494 = uint(int(uint(_492) >> uint(2)));
                    float _496 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_494)]);
                    int _498 = _156 + 12;
                    uint _500 = uint(int(uint(_498) >> uint(2)));
                    float _502 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_500)]);
                    uint _504 = uint(int(uint(_156) >> uint(2)));
                    float _506 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_504)]);
                    int _508 = _156 + 4;
                    uint _510 = uint(int(uint(_508) >> uint(2)));
                    float _512 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_510)]);
                    int _514 = _156 + 8;
                    uint _516 = uint(int(uint(_514) >> uint(2)));
                    float _518 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_516)]);
                    int _520 = _156 + 12;
                    uint _522 = uint(int(uint(_520) >> uint(2)));
                    float _524 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_522)]);
                    uint _526 = uint(int(uint(_156) >> uint(2)));
                    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_526)]);
                    int _530 = _156 + 4;
                    uint _532 = uint(int(uint(_530) >> uint(2)));
                    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_532)]);
                    int _536 = _156 + 8;
                    uint _538 = uint(int(uint(_536) >> uint(2)));
                    float _540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_538)]);
                    int _542 = _156 + 12;
                    uint _544 = uint(int(uint(_542) >> uint(2)));
                    float _546 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_544)]);
                    float _548 = _266 * _490;
                    float _550 = _266 * _512;
                    float _552 = _266 * _534;
                    float _554 = fma(_264, _484, _548);
                    float _556 = fma(_264, _506, _550);
                    float _558 = fma(_264, _528, _552);
                    float _560 = fma(_274, _496, _554);
                    float _562 = fma(_274, _518, _556);
                    float _564 = fma(_274, _540, _558);
                    float _566 = _560 + _502;
                    float _568 = _562 + _524;
                    float _570 = _564 + _546;
                    _300 = _566;
                    _314 = _570;
                    _306 = _568;
                }
            }
        }
    }
    _384 = false;
    float _572 = _300;
    float _574 = _314;
    float _576 = _306;
    float _578 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _580 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[60]);
    float _582 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[62]);
    float _584 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[61]);
    float _586 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[59]);
    float _588 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[63]);
    bool _590 = _578 != 0.0;
    bool _592 = isnan(_578);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _214 * _580;
    float _602 = _214 * _582;
    float _604 = _214 * _584;
    float _606 = fma(_586, _572, _600);
    float _608 = fma(_586, _574, _602);
    float _610 = fma(_586, _576, _604);
    float _612 = _588;
    float _614 = _572;
    if (_598)
    {
        float _616 = _238 * _588;
        _612 = _616;
    }
    float _618 = _612;
    float _620 = _610 + _618;
    float _622 = -_618;
    bool _624 = _606 >= _622;
    bool _626 = isnan(_606);
    bool _628 = _624 || _626;
    bool _630 = isnan(_622);
    bool _632 = _628 || _630;
    float _634 = _606 + _618;
    float _636 = -_618;
    bool _638 = _608 >= _636;
    bool _640 = isnan(_608);
    bool _642 = _638 || _640;
    bool _644 = isnan(_636);
    bool _646 = _642 || _644;
    float _648 = _608 + _618;
    float _650 = -_618;
    bool _652 = _610 >= _650;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan(_650);
    bool _660 = _656 || _658;
    bool _662 = !_632;
    float _664 = -_634;
    float _666 = _662 ? _664 : _634;
    bool _668 = !_646;
    float _670 = -_648;
    float _672 = _668 ? _670 : _648;
    bool _674 = !_660;
    float _676 = -_620;
    float _678 = _674 ? _676 : _620;
    float _680 = _666 * 0.03125;
    float _682 = _672 * 0.03125;
    float _684 = _678 * 0.03125;
    float3 _2689 = float3(_680, _684, _682);
    float3 _688 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, select(_2689, float3(0.0), isnan(_2689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, select(_2689, float3(0.0), isnan(_2689)), level(0.0)).xyz;
    float _690 = _688.x;
    float _692 = _688.y;
    float _694 = _688.z;
    float _696 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[56]);
    float _698 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[57]);
    float _700 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[58]);
    float _702 = _690 + (-0.5);
    float _704 = _692 + (-0.5);
    float _706 = _694 + (-0.5);
    float _708 = _702 * _696;
    float _710 = _704 * _698;
    float _712 = _706 * _700;
    float _714 = _702;
    float _716 = _706;
    float _718 = _700;
    if (!_244)
    {
        _714 = _708;
    }
    float _720 = _714;
    float _722 = _720;
    float _724 = _720;
    if (!_244)
    {
        _614 = _710;
    }
    float _726 = _614;
    float _728 = _726;
    float _730 = _726;
    if (!_244)
    {
        _716 = _712;
    }
    float _732 = _716;
    bool _734 = !_244;
    float _736 = _732;
    float _738 = _732;
    if (!_734)
    {
        bool _740 = !_270;
        if (!_740)
        {
            float _742 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _744 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _750 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _752 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _754 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _756 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _758 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _760 = _746 * _748;
            float _762 = _746 * _750;
            float _764 = _744 * _748;
            float _766 = -_760;
            float _768 = fma(_742, _752, _766);
            float _770 = -_762;
            float _772 = fma(_744, _752, _770);
            float _774 = -_764;
            float _776 = fma(_742, _750, _774);
            float _778 = _756 * _742;
            float _780 = _756 * _768;
            float _782 = _758 * _744;
            float _784 = _754 * _750;
            float _786 = -_778;
            float _788 = fma(_754, _744, _786);
            float _790 = -_780;
            float _792 = fma(_754, _772, _790);
            float _794 = _756 * _752;
            float _796 = _758 * _748;
            float _798 = -_784;
            float _800 = fma(_756, _748, _798);
            float _802 = fma(_758, _776, _792);
            float _804 = -_794;
            float _806 = fma(_758, _750, _804);
            float _808 = -_796;
            float _810 = fma(_754, _752, _808);
            float _812 = _754 * _746;
            float _814 = 1.0 / _802;
            float _816 = -_742;
            float _818 = fma(_816, _752, _760);
            float _820 = -_782;
            float _822 = fma(_756, _746, _820);
            float _824 = -_812;
            float _826 = fma(_758, _742, _824);
            float _828 = _806 * _814;
            float _830 = _810 * _814;
            float _832 = _800 * _814;
            float _834 = _708 * _814;
            float _836 = _710 * _828;
            float _838 = _710 * _830;
            float _840 = _710 * _832;
            float _842 = _818 * _814;
            float _844 = _822 * _814;
            float _846 = _826 * _814;
            float _848 = _788 * _814;
            float _850 = fma(_772, _834, _836);
            float _852 = fma(_708, _842, _838);
            float _854 = fma(_776, _834, _840);
            float _856 = fma(_712, _844, _850);
            float _858 = fma(_712, _846, _852);
            float _860 = fma(_712, _848, _854);
            _724 = _856;
            _718 = _754;
            _730 = _858;
            _738 = _860;
            _862 = true;
        }
        else
        {
            int _864 = as_type<int>(_174) & 1024;
            bool _866 = _864 != 0;
            if (_866)
            {
                _290 = true;
            }
            bool _868 = _290;
            bool _870 = _868;
            if (!_866)
            {
                int _872 = as_type<int>(_174) & 2048;
                bool _874 = _872 != 0;
                _870 = _874;
            }
            bool _876 = _870;
            if (!_876)
            {
                _722 = _708;
            }
            float _878 = _722;
            _724 = _878;
            if (!_876)
            {
                _728 = _710;
            }
            float _880 = _728;
            _730 = _880;
            if (!_876)
            {
                _736 = _712;
            }
            float _882 = _736;
            bool _884 = !_876;
            _738 = _882;
            if (!_884)
            {
                uint _886 = uint(int(uint(_156) >> uint(2)));
                float _888 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_886)]);
                int _890 = _156 + 4;
                uint _892 = uint(int(uint(_890) >> uint(2)));
                float _894 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_892)]);
                int _896 = _156 + 8;
                uint _898 = uint(int(uint(_896) >> uint(2)));
                float _900 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_898)]);
                uint _902 = uint(int(uint(_156) >> uint(2)));
                float _904 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_902)]);
                int _906 = _156 + 4;
                uint _908 = uint(int(uint(_906) >> uint(2)));
                float _910 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_908)]);
                int _912 = _156 + 8;
                uint _914 = uint(int(uint(_912) >> uint(2)));
                float _916 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_914)]);
                uint _918 = uint(int(uint(_156) >> uint(2)));
                float _920 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_918)]);
                int _922 = _156 + 4;
                uint _924 = uint(int(uint(_922) >> uint(2)));
                float _926 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_924)]);
                int _928 = _156 + 8;
                uint _930 = uint(int(uint(_928) >> uint(2)));
                float _932 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_930)]);
                float _934 = _900 * _904;
                float _936 = _900 * _910;
                float _938 = _894 * _904;
                float _940 = -_934;
                float _942 = fma(_888, _916, _940);
                float _944 = -_936;
                float _946 = fma(_894, _916, _944);
                float _948 = -_938;
                float _950 = fma(_888, _910, _948);
                float _952 = _926 * _888;
                float _954 = _926 * _942;
                float _956 = _932 * _894;
                float _958 = _920 * _910;
                float _960 = -_952;
                float _962 = fma(_920, _894, _960);
                float _964 = -_954;
                float _966 = fma(_920, _946, _964);
                float _968 = _926 * _916;
                float _970 = _932 * _904;
                float _972 = -_958;
                float _974 = fma(_926, _904, _972);
                float _976 = fma(_932, _950, _966);
                float _978 = -_968;
                float _980 = fma(_932, _910, _978);
                float _982 = -_970;
                float _984 = fma(_920, _916, _982);
                float _986 = _920 * _900;
                float _988 = 1.0 / _976;
                float _990 = -_888;
                float _992 = fma(_990, _916, _934);
                float _994 = -_956;
                float _996 = fma(_926, _900, _994);
                float _998 = -_986;
                float _1000 = fma(_932, _888, _998);
                float _1002 = _980 * _988;
                float _1004 = _984 * _988;
                float _1006 = _974 * _988;
                float _1008 = _708 * _988;
                float _1010 = _710 * _1002;
                float _1012 = _710 * _1004;
                float _1014 = _710 * _1006;
                float _1016 = _992 * _988;
                float _1018 = _996 * _988;
                float _1020 = _1000 * _988;
                float _1022 = _962 * _988;
                float _1024 = fma(_946, _1008, _1010);
                float _1026 = fma(_708, _1016, _1012);
                float _1028 = fma(_950, _1008, _1014);
                float _1030 = fma(_712, _1018, _1024);
                float _1032 = fma(_712, _1020, _1026);
                float _1034 = fma(_712, _1022, _1028);
                _724 = _1030;
                _718 = _920;
                _730 = _1032;
                _738 = _1034;
            }
        }
    }
    _862 = false;
    float _1036 = _724;
    float _1038 = _718;
    float _1040 = _730;
    float _1042 = _738;
    float _1044 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[86]);
    float _1046 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[85]);
    float _1048 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[84]);
    float _1050 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _1052 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _1054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _1056 = fma(_152, _1036, _272);
    uint _1058 = uint(int(uint(_160) >> uint(2)));
    float _1060 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_1058)]);
    bool _1062 = _1044 > 0.0;
    bool _1064 = _1046 > 0.0;
    float _1066 = _1048 * _1046;
    float _1068 = _152 * _1050;
    float _1070 = _1038;
    float _1072 = _1048;
    bool _1074 = _1064;
    if (_1062)
    {
        float _1076 = 1.0 / _1044;
        _1070 = _1076;
    }
    float _1078 = _1070;
    float _1080 = _152 * _1054;
    if (_1064)
    {
        float _1082 = -_1066;
        float _1084 = fma(_238, _1082, _1048);
        _1072 = _1084;
    }
    float _1086 = _1072;
    float _1088 = _152 * _1052;
    float _1090 = fma(_152, _1040, _276);
    float _1092 = fma(_152, _1042, _278);
    float _1094 = _1078;
    float _1096 = _1086;
    float _1098 = _1088;
    if (_1062)
    {
        float _1100 = _282 * _1078;
        _292 = _1100;
    }
    float _1102 = _292;
    float _1104 = _1102;
    if (_1062)
    {
        float _1106 = precise::min(_1102, 1.0);
        _1094 = _1106;
    }
    float _1108 = _1094;
    if (_1062)
    {
        float _1110 = _1108 * _1086;
        _1096 = _1110;
    }
    float _1112 = _1096;
    float _1114 = _1068 * _1112;
    float _1116 = _1088 * _1112;
    float _1118 = _1080 * _1112;
    bool _1120 = !_270;
    float _1242;
    float _1244;
    float _1246;
    if (!_1120)
    {
        float _1122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1128 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1132 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1138 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1140 = _1126 * _1128;
        float _1142 = _1126 * _1130;
        float _1144 = _1124 * _1128;
        float _1146 = -_1140;
        float _1148 = fma(_1122, _1132, _1146);
        float _1150 = -_1142;
        float _1152 = fma(_1124, _1132, _1150);
        float _1154 = -_1144;
        float _1156 = fma(_1122, _1130, _1154);
        float _1158 = _1136 * _1122;
        float _1160 = _1136 * _1148;
        float _1162 = _1138 * _1124;
        float _1164 = _1138 * _1128;
        float _1166 = -_1158;
        float _1168 = fma(_1134, _1124, _1166);
        float _1170 = -_1160;
        float _1172 = fma(_1134, _1152, _1170);
        float _1174 = _1136 * _1132;
        float _1176 = _1134 * _1130;
        float _1178 = -_1162;
        float _1180 = fma(_1136, _1126, _1178);
        float _1182 = fma(_1138, _1156, _1172);
        float _1184 = -_1174;
        float _1186 = fma(_1138, _1130, _1184);
        float _1188 = -_1164;
        float _1190 = fma(_1134, _1132, _1188);
        float _1192 = -_1176;
        float _1194 = fma(_1136, _1128, _1192);
        float _1196 = 1.0 / _1182;
        float _1198 = _1134 * _1126;
        float _1200 = -_1198;
        float _1202 = fma(_1138, _1122, _1200);
        float _1204 = _1186 * _1196;
        float _1206 = _1190 * _1196;
        float _1208 = _1194 * _1196;
        float _1210 = -_1122;
        float _1212 = fma(_1210, _1132, _1140);
        float _1214 = _1204 * _1116;
        float _1216 = _1206 * _1116;
        float _1218 = _1114 * _1196;
        float _1220 = _1208 * _1116;
        float _1222 = _1212 * _1196;
        float _1224 = _1180 * _1196;
        float _1226 = fma(_1152, _1218, _1214);
        float _1228 = _1202 * _1196;
        float _1230 = _1168 * _1196;
        float _1232 = fma(_1222, _1114, _1216);
        float _1234 = fma(_1156, _1218, _1220);
        float _1236 = fma(_1224, _1118, _1226);
        float _1238 = fma(_1228, _1118, _1232);
        float _1240 = fma(_1230, _1118, _1234);
        _1242 = _1236;
        _1244 = _1238;
        _1246 = _1240;
        _1248 = true;
    }
    else
    {
        int _1250 = as_type<int>(_174) & 1024;
        bool _1252 = _1250 != 0;
        if (_1252)
        {
            _1074 = true;
        }
        bool _1254 = _1074;
        bool _1256 = _1254;
        if (!_1252)
        {
            int _1258 = as_type<int>(_174) & 2048;
            bool _1260 = _1258 != 0;
            _1256 = _1260;
        }
        bool _1262 = _1256;
        if (!_1262)
        {
            _1098 = _1114;
        }
        float _1264 = _1098;
        _1242 = _1264;
        if (!_1262)
        {
            _1104 = _1116;
        }
        float _1266 = _1104;
        _1244 = _1266;
        if (!_1262)
        {
            _294 = _1118;
        }
        float _1268 = _294;
        bool _1270 = !_1262;
        _1246 = _1268;
        if (!_1270)
        {
            uint _1272 = uint(int(uint(_156) >> uint(2)));
            float _1274 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1272)]);
            int _1276 = _156 + 4;
            uint _1278 = uint(int(uint(_1276) >> uint(2)));
            float _1280 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1278)]);
            int _1282 = _156 + 8;
            uint _1284 = uint(int(uint(_1282) >> uint(2)));
            float _1286 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1284)]);
            uint _1288 = uint(int(uint(_156) >> uint(2)));
            float _1290 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1288)]);
            int _1292 = _156 + 4;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1294)]);
            int _1298 = _156 + 8;
            uint _1300 = uint(int(uint(_1298) >> uint(2)));
            float _1302 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1300)]);
            uint _1304 = uint(int(uint(_156) >> uint(2)));
            float _1306 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1304)]);
            int _1308 = _156 + 4;
            uint _1310 = uint(int(uint(_1308) >> uint(2)));
            float _1312 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1310)]);
            int _1314 = _156 + 8;
            uint _1316 = uint(int(uint(_1314) >> uint(2)));
            float _1318 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1316)]);
            float _1320 = _1286 * _1290;
            float _1322 = _1286 * _1296;
            float _1324 = _1280 * _1290;
            float _1326 = -_1320;
            float _1328 = fma(_1274, _1302, _1326);
            float _1330 = -_1322;
            float _1332 = fma(_1280, _1302, _1330);
            float _1334 = -_1324;
            float _1336 = fma(_1274, _1296, _1334);
            float _1338 = _1312 * _1274;
            float _1340 = _1312 * _1328;
            float _1342 = _1318 * _1280;
            float _1344 = _1318 * _1290;
            float _1346 = -_1338;
            float _1348 = fma(_1306, _1280, _1346);
            float _1350 = -_1340;
            float _1352 = fma(_1306, _1332, _1350);
            float _1354 = _1312 * _1302;
            float _1356 = _1306 * _1296;
            float _1358 = -_1342;
            float _1360 = fma(_1312, _1286, _1358);
            float _1362 = fma(_1318, _1336, _1352);
            float _1364 = -_1354;
            float _1366 = fma(_1318, _1296, _1364);
            float _1368 = -_1344;
            float _1370 = fma(_1306, _1302, _1368);
            float _1372 = -_1356;
            float _1374 = fma(_1312, _1290, _1372);
            float _1376 = 1.0 / _1362;
            float _1378 = _1306 * _1286;
            float _1380 = -_1378;
            float _1382 = fma(_1318, _1274, _1380);
            float _1384 = _1366 * _1376;
            float _1386 = _1370 * _1376;
            float _1388 = _1374 * _1376;
            float _1390 = -_1274;
            float _1392 = fma(_1390, _1302, _1320);
            float _1394 = _1384 * _1116;
            float _1396 = _1386 * _1116;
            float _1398 = _1114 * _1376;
            float _1400 = _1388 * _1116;
            float _1402 = _1392 * _1376;
            float _1404 = _1360 * _1376;
            float _1406 = fma(_1332, _1398, _1394);
            float _1408 = _1382 * _1376;
            float _1410 = _1348 * _1376;
            float _1412 = fma(_1402, _1114, _1396);
            float _1414 = fma(_1336, _1398, _1400);
            float _1416 = fma(_1404, _1118, _1406);
            float _1418 = fma(_1408, _1118, _1412);
            float _1420 = fma(_1410, _1118, _1414);
            _1242 = _1416;
            _1244 = _1418;
            _1246 = _1420;
        }
    }
    _1248 = false;
    float _1422 = _1242;
    float _1424 = _1244;
    float _1426 = _1246;
    float _1428 = _264 + _1422;
    float _1430 = _266 + _1424;
    int _1432 = _156 + 4;
    float _1434 = _274 + _1426;
    int _1436 = _156 + 8;
    uint _1438 = uint(int(uint(_160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1438)] = as_type<uint>(_1060);
    float _1440 = -_200;
    float _1442 = _1440 + _1428;
    float _1444 = -_206;
    float _1446 = _1444 + _1430;
    uint _1448 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1448)] = as_type<uint>(_1428);
    float _1450 = -_212;
    float _1452 = _1450 + _1434;
    uint _1454 = uint(int(uint(_1432) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1454)] = as_type<uint>(_1430);
    uint _1456 = uint(int(uint(_1436) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1456)] = as_type<uint>(_1434);
    uint _1458 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1458)] = as_type<uint>(_1056);
    uint _1460 = uint(int(uint(_1432) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1460)] = as_type<uint>(_1090);
    uint _1462 = uint(int(uint(_1436) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1462)] = as_type<uint>(_1092);
    uint _1464 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1464)] = as_type<uint>(_1442);
    uint _1466 = uint(int(uint(_1432) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1466)] = as_type<uint>(_1446);
    uint _1468 = uint(int(uint(_1436) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1468)] = as_type<uint>(_1452);
    float _1470 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1472 = _1446 * _1446;
    float _1474 = _1090 * _1090;
    float _1476 = fma(_1442, _1442, _1472);
    float _1478 = fma(_1056, _1056, _1474);
    float _1480 = fma(_1452, _1452, _1476);
    float _1482 = fma(_1092, _1092, _1478);
    float _1484 = sqrt(_1480);
    float _1486 = sqrt(_1482);
    bool _1488 = _1484 >= 9.9999999747524270787835121154785e-07;
    bool _1490 = isnan(_1484);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(9.9999999747524270787835121154785e-07);
    bool _1496 = _1492 || _1494;
    if (!_1496)
    {
        bool _1498 = _214 != _218;
        bool _1500 = isnan(_214);
        bool _1502 = _1498 || _1500;
        bool _1504 = isnan(_218);
        bool _1506 = _1502 || _1504;
        _1508 = _1506;
        if (!_1508)
        {
            float _1510 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1512 = _1510 > 0.0;
            bool _1514 = !_1512;
            if (!_1514)
            {
                float _1516 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1518 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1522 = _1518 * _1518;
                float _1524 = fma(_1516, _1516, _1522);
                float _1526 = fma(_1520, _1520, _1524);
                float _1528 = rsqrt(_1526);
                float _1530 = _1528 * 9.9999999747524270787835121154785e-07;
                float _1532 = _1516 * _1530;
                float _1534 = _1518 * _1530;
                float _1536 = _1520 * _1530;
                _328 = as_type<int>(_1532);
                _330 = as_type<int>(_1534);
                _332 = as_type<int>(_1536);
                _1508 = true;
            }
            else
            {
                bool _1538 = _1486 >= 9.9999999747524270787835121154785e-07;
                bool _1540 = isnan(_1486);
                bool _1542 = _1538 || _1540;
                bool _1544 = isnan(9.9999999747524270787835121154785e-07);
                bool _1546 = _1542 || _1544;
                if (!_1546)
                {
                    float _1548 = _1430 * _1430;
                    float _1550 = fma(_1428, _1428, _1548);
                    float _1552 = fma(_1434, _1434, _1550);
                    float _1554 = sqrt(_1552);
                    bool _1556 = _1554 >= 9.9999999747524270787835121154785e-07;
                    bool _1558 = isnan(_1554);
                    bool _1560 = _1556 || _1558;
                    bool _1562 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1564 = _1560 || _1562;
                    float _1566 = _1554;
                    if (_1564)
                    {
                        float _1568 = rsqrt(_1552);
                        _1566 = _1568;
                    }
                    float _1570 = _1566;
                    if (!_1564)
                    {
                        _316 = 0;
                    }
                    int _1572 = _316;
                    int _1574 = _1572;
                    if (!_1564)
                    {
                        _318 = 897988541;
                    }
                    int _1576 = _318;
                    int _1578 = _1576;
                    if (!_1564)
                    {
                        _320 = 0;
                    }
                    int _1580 = _320;
                    float _1582 = _1570;
                    int _1584 = _1580;
                    if (_1564)
                    {
                        float _1586 = _1570 * 9.9999999747524270787835121154785e-07;
                        _1582 = _1586;
                    }
                    float _1588 = _1582;
                    if (_1564)
                    {
                        float _1590 = _1428 * _1588;
                        _1574 = as_type<int>(_1590);
                    }
                    int _1592 = _1574;
                    _328 = _1592;
                    if (_1564)
                    {
                        float _1594 = _1430 * _1588;
                        _1578 = as_type<int>(_1594);
                    }
                    int _1596 = _1578;
                    _330 = _1596;
                    if (_1564)
                    {
                        float _1598 = _1434 * _1588;
                        _1584 = as_type<int>(_1598);
                    }
                    int _1600 = _1584;
                    _332 = _1600;
                    _1508 = true;
                }
                else
                {
                    float _1602 = rsqrt(_1482);
                    float _1604 = _1602 * 9.9999999747524270787835121154785e-07;
                    float _1606 = _1056 * _1604;
                    float _1608 = _1090 * _1604;
                    float _1610 = _1092 * _1604;
                    _328 = as_type<int>(_1606);
                    _330 = as_type<int>(_1608);
                    _332 = as_type<int>(_1610);
                    _1508 = true;
                }
            }
        }
    }
    else
    {
        float _1612 = _1486 * _1470;
        bool _1614 = _1612 >= 0.001000000047497451305389404296875;
        bool _1616 = isnan(_1612);
        bool _1618 = _1614 || _1616;
        bool _1620 = isnan(0.001000000047497451305389404296875);
        bool _1622 = _1618 || _1620;
        bool _1624 = _1612 > 0.0;
        bool _1626 = !_1622;
        bool _1628 = _1624 && _1626;
        bool _1630 = _1484 < 0.001000000047497451305389404296875;
        bool _1632 = _1630 && _1628;
        if (!_1632)
        {
            _322 = as_type<int>(_1442);
        }
        int _1634 = _322;
        int _1636 = _1634;
        if (_1632)
        {
            float _1638 = _1056 * _1470;
            _1636 = as_type<int>(_1638);
        }
        int _1640 = _1636;
        _328 = _1640;
        if (!_1632)
        {
            _324 = as_type<int>(_1446);
        }
        int _1642 = _324;
        int _1644 = _1642;
        if (_1632)
        {
            float _1646 = _1090 * _1470;
            _1644 = as_type<int>(_1646);
        }
        int _1648 = _1644;
        _330 = _1648;
        if (!_1632)
        {
            _326 = as_type<int>(_1452);
        }
        int _1650 = _326;
        _332 = _1650;
        if (_1632)
        {
            float _1652 = _1092 * _1470;
            _332 = as_type<int>(_1652);
        }
    }
    _1508 = false;
    int _1654 = _328;
    int _1656 = _330;
    int _1658 = _332;
    uint _1660 = uint(int(uint(_156) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1660)] = uint(_1654);
    uint _1662 = uint(int(uint(_1432) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1662)] = uint(_1656);
    uint _1664 = uint(int(uint(_1436) >> uint(2)));
    (*spvDescriptorSet0.cp_s6)._m0[int(_1664)] = uint(_1658);
}

