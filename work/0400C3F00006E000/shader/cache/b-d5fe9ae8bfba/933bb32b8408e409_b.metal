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
    texture2d<float> cp_t_tcb_1A [[id(15)]];
    sampler cp_t_tcb_1ASmplr [[id(16)]];
    texture2d<float> cp_t_tcb_2A [[id(17)]];
    sampler cp_t_tcb_2ASmplr [[id(18)]];
    sampler cp_t_tcb_2CSmplr_w [[id(19)]];
    sampler cp_t_tcb_1ASmplr_w [[id(20)]];
    sampler cp_t_tcb_2ASmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1074 = false;
    bool _860 = false;
    bool _756 = false;
    float _70 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _72 = as_type<float>(gl_LocalInvocationID.x);
    float _74 = as_type<float>(gl_WorkGroupID.x);
    int _77 = as_type<int>(_74) << 5;
    int _79 = _77 + as_type<int>(_72);
    float _81 = trunc(_70);
    int _83 = int(_81);
    bool _87 = _79 >= _83;
    int _89 = 0;
    if (_87)
    {
        _89 = 0;
    }
    int _91 = _89;
    int _93 = _91;
    int _95 = _91;
    if (!_87)
    {
        int _97 = _79 << 4;
        int _99 = _97 + 12;
        uint _102 = uint(int(uint(_99) >> uint(2)));
        float _104 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_102)]);
        float _106 = trunc(_104);
        int _108 = int(_106);
        bool _110 = _108 >= 1;
        int _112 = _110 ? (-1) : 0;
        if (!_110)
        {
            _93 = 0;
        }
        int _114 = _93;
        bool _116 = !_110;
        _95 = _114;
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
            _95 = _146;
            if (!_130)
            {
                int _148 = ~_144;
                int _150 = (_148 != 0) ? 0 : 1;
                _95 = _150;
            }
        }
    }
    int _152 = _95;
    int _154 = _152 & 1;
    bool _156 = _154 != 0;
    if (!_156)
    {
        return;
    }
    int _158 = _79 << 4;
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _162 = _158 + 12;
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _166 = uint(int(uint(_162) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_166)]);
    uint _170 = uint(int(uint(_158) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_170)]);
    int _174 = _158 + 4;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_176)]);
    int _180 = _158 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_182)]);
    int _186 = _158 + 12;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    uint _192 = uint(int(uint(_158) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_192)]);
    int _196 = _158 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_198)]);
    int _202 = _158 + 8;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_204)]);
    int _208 = as_type<int>(_160) & 512;
    bool _210 = _208 != 0;
    int _212 = as_type<int>(_160) & 1024;
    bool _214 = _212 != 0;
    int _216 = as_type<int>(_160) & 2048;
    bool _218 = _216 != 0;
    float _220 = 0.0;
    float _222 = 0.0;
    float _224 = 0.0;
    float _226 = 0.0;
    if (_210)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _220 = _228;
        _222 = _230;
        _224 = _232;
        _226 = _234;
    }
    float _236 = _220;
    float _238 = _222;
    float _240 = _224;
    float _242 = _226;
    float _244 = 0.0;
    float _246 = 0.0;
    float _248 = 0.0;
    float _250 = 0.0;
    if (_214)
    {
        uint _252 = uint(int(uint(_158) >> uint(2)));
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_252)]);
        int _256 = _158 + 4;
        uint _258 = uint(int(uint(_256) >> uint(2)));
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_258)]);
        int _262 = _158 + 8;
        uint _264 = uint(int(uint(_262) >> uint(2)));
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_264)]);
        int _268 = _158 + 12;
        uint _270 = uint(int(uint(_268) >> uint(2)));
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_270)]);
        _244 = _254;
        _246 = _260;
        _248 = _266;
        _250 = _272;
    }
    float _274 = _244;
    float _276 = _246;
    float _278 = _248;
    float _280 = _250;
    float _282 = 0.0;
    float _284 = 0.0;
    float _286 = 0.0;
    float _288 = 0.0;
    if (_210)
    {
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _282 = _290;
        _284 = _292;
        _286 = _294;
        _288 = _296;
    }
    float _298 = _282;
    float _300 = _284;
    float _302 = _286;
    float _304 = _288;
    float _306 = 0.0;
    float _308 = 0.0;
    float _310 = 0.0;
    if (_214)
    {
        uint _312 = uint(int(uint(_158) >> uint(2)));
        float _314 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_312)]);
        int _316 = _158 + 4;
        uint _318 = uint(int(uint(_316) >> uint(2)));
        float _320 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_318)]);
        int _322 = _158 + 8;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        float _326 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_324)]);
        _306 = _314;
        _308 = _320;
        _310 = _326;
    }
    float _328 = _306;
    float _330 = _308;
    float _332 = _310;
    float _334 = _160;
    float _336 = 0.0;
    float _338 = 0.0;
    float _340 = 0.0;
    if (_218)
    {
        uint _342 = uint(int(uint(_158) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_342)]);
        int _346 = _158 + 4;
        uint _348 = uint(int(uint(_346) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_348)]);
        int _352 = _158 + 8;
        uint _354 = uint(int(uint(_352) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_354)]);
        int _358 = _158 + 12;
        uint _360 = uint(int(uint(_358) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_360)]);
        _334 = _344;
        _336 = _350;
        _338 = _356;
        _340 = _362;
    }
    float _364 = _334;
    float _366 = _336;
    float _368 = _338;
    float _370 = _340;
    float _372 = 0.0;
    float _374 = 0.0;
    float _376 = 0.0;
    float _378 = 0.0;
    if (_218)
    {
        uint _380 = uint(int(uint(_158) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_380)]);
        int _384 = _158 + 4;
        uint _386 = uint(int(uint(_384) >> uint(2)));
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_386)]);
        int _390 = _158 + 8;
        uint _392 = uint(int(uint(_390) >> uint(2)));
        float _394 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_392)]);
        int _396 = _158 + 12;
        uint _398 = uint(int(uint(_396) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_398)]);
        _372 = _382;
        _374 = _388;
        _376 = _394;
        _378 = _400;
    }
    float _402 = _372;
    float _404 = _374;
    float _406 = _376;
    float _408 = _378;
    float _410 = 0.0;
    if (_214)
    {
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _410 = _412;
    }
    float _414 = _410;
    float _416 = 0.0;
    if (_214)
    {
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _416 = _418;
    }
    float _420 = _416;
    float _422 = _168 * _164;
    float _424 = _178 * _422;
    float _426 = _172 * _422;
    float _428 = _200 + _424;
    float _430 = _194 + _426;
    float _432 = _184 * _422;
    float _434 = _206 + _432;
    float _436 = _194;
    float _438 = _276;
    float _440 = _236;
    float _442 = _184;
    float _444 = _280;
    float _446 = _298;
    float _448 = _274;
    float _450 = _328;
    float _452 = _404;
    float _454 = _364;
    float _456 = _190;
    float _458 = _368;
    float _460 = _406;
    int _462 = as_type<int>(_426);
    int _464 = as_type<int>(_426);
    if (_210)
    {
        float _466 = _428 * _238;
        _436 = _466;
    }
    float _468 = _436;
    float _470 = _468;
    if (_214)
    {
        float _472 = _428 * _276;
        _438 = _472;
    }
    float _474 = _438;
    float _476 = _474;
    if (_210)
    {
        float _478 = fma(_430, _236, _468);
        _440 = _478;
    }
    float _480 = _440;
    float _482 = _480;
    if (_210)
    {
        float _484 = _428 * _300;
        _442 = _484;
    }
    float _486 = _442;
    float _488 = _486;
    if (_214)
    {
        float _490 = fma(_430, _274, _474);
        _444 = _490;
    }
    float _492 = _444;
    float _494 = _492;
    if (_214)
    {
        float _496 = _428 * _330;
        _470 = _496;
    }
    float _498 = _470;
    if (_210)
    {
        float _500 = fma(_430, _298, _486);
        _446 = _500;
    }
    float _502 = _446;
    float _504 = _502;
    if (_218)
    {
        float _506 = _428 * _366;
        _448 = _506;
    }
    float _508 = _448;
    if (_214)
    {
        float _510 = fma(_430, _328, _498);
        _450 = _510;
    }
    float _512 = _450;
    if (_218)
    {
        float _514 = _428 * _404;
        _452 = _514;
    }
    float _516 = _452;
    float _518 = _516;
    if (_218)
    {
        float _520 = fma(_430, _364, _508);
        _454 = _520;
    }
    float _522 = _454;
    if (_210)
    {
        float _524 = fma(_434, _302, _502);
        _504 = _524;
    }
    float _526 = _504;
    if (_218)
    {
        float _528 = fma(_430, _402, _516);
        _518 = _528;
    }
    float _530 = _518;
    if (_210)
    {
        float _532 = fma(_434, _240, _480);
        _482 = _532;
    }
    float _534 = _482;
    if (_214)
    {
        float _536 = fma(_434, _332, _512);
        _476 = _536;
    }
    float _538 = _476;
    if (_214)
    {
        float _540 = fma(_434, _278, _492);
        _494 = _540;
    }
    float _542 = _494;
    if (!_210)
    {
        _488 = 0.0;
        _456 = 0.0;
    }
    float _544 = _488;
    float _546 = _456;
    float _548 = _544;
    float _550 = _546;
    if (_218)
    {
        float _552 = fma(_434, _368, _522);
        _458 = _552;
    }
    float _554 = _458;
    if (_218)
    {
        float _556 = fma(_434, _406, _530);
        _460 = _556;
    }
    float _558 = _460;
    if (_210)
    {
        float _560 = _304 + _526;
        _548 = _560;
    }
    float _562 = _548;
    float _564 = _562;
    if (_210)
    {
        float _566 = _242 + _534;
        _550 = _566;
    }
    float _568 = _550;
    float _570 = _568;
    if (_214)
    {
        float _572 = _414 + _538;
        _564 = _572;
    }
    float _574 = _564;
    float _576 = _574;
    if (_214)
    {
        float _578 = _420 + _542;
        _570 = _578;
    }
    float _580 = _570;
    float _582 = _580;
    if (_218)
    {
        float _584 = _370 + _554;
        _576 = _584;
    }
    float _586 = _576;
    if (_218)
    {
        float _588 = _408 + _558;
        _582 = _588;
    }
    float _590 = _582;
    float _592 = fma(_586, 6.2500002968590706586837768554688e-05, 0.5);
    float _594 = fma(_590, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2000 = float2(_592, _594);
    float2 _598 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2000, float2(0.0), isnan(_2000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2000, float2(0.0), isnan(_2000)), level(0.0)).xy;
    float _600 = _598.x;
    float _602 = _598.y;
    float2 _2014 = float2(_592, _594);
    float2 _604 = dm_bs(spvDescriptorSet0.cp_t_tcb_1A.sample(spvDescriptorSet0.cp_t_tcb_1ASmplr, select(_2014, float2(0.0), isnan(_2014)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_1A, spvDescriptorSet0.cp_t_tcb_1ASmplr_w, select(_2014, float2(0.0), isnan(_2014)), level(0.0)).xy;
    float _606 = _604.x;
    float _608 = _604.y;
    float _610 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _612 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _614 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _616 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[83]);
    float _618 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[0]);
    float _620 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _622 = uint(int(uint(_158) >> uint(2)));
    float _624 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_622)]);
    int _626 = _158 + 4;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    float _630 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_628)]);
    int _632 = _158 + 8;
    uint _634 = uint(int(uint(_632) >> uint(2)));
    float _636 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_634)]);
    int _638 = _158 + 12;
    uint _640 = uint(int(uint(_638) >> uint(2)));
    float _642 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_640)]);
    uint _644 = uint(int(uint(_162) >> uint(2)));
    float _646 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_644)]);
    uint _648 = uint(int(uint(_162) >> uint(2)));
    float _650 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_648)]);
    float _652 = abs(_610);
    float _654 = log2(_652);
    float _656 = _164 * _654;
    float _658 = exp2(_656);
    float _660 = _612 * _614;
    float _662 = _164 * _660;
    float _664 = _600 * 2000.0;
    bool _666 = _616 != 0.0;
    bool _668 = isnan(_616);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = fma(_178, _658, _662);
    float _678 = _602 * 2000.0;
    bool _680 = _678 >= _664;
    float _682 = _618 * 2.0;
    float _684 = _606 + (-0.5);
    float _686 = _608 + (-0.5);
    float _688 = _684 * _682;
    float _690 = _686 * _682;
    float _692 = _688;
    float _694 = _690;
    float _696 = _664;
    float _698 = _678;
    float _700 = _642;
    int _702 = as_type<int>(_630);
    int _704 = as_type<int>(_636);
    float _706 = _624;
    int _708 = as_type<int>(_630);
    int _710 = as_type<int>(_636);
    int _712 = as_type<int>(_630);
    int _714 = as_type<int>(_636);
    if (_674)
    {
        float _716 = _688 * _616;
        _692 = _716;
    }
    float _718 = _692;
    if (_674)
    {
        float _720 = _690 * _616;
        _694 = _720;
    }
    float _722 = _694;
    float _724 = _722;
    if (!_680)
    {
        _696 = 0.0;
    }
    float _726 = _696;
    bool _728 = !_680;
    float _730 = _726;
    if (!_728)
    {
        float2 _2200 = float2(_592, _594);
        float _732 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_2200, float2(0.0), isnan(_2200)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_2200, float2(0.0), isnan(_2200)), level(0.0)).y;
        float _734 = _732 * 2000.0;
        bool _736 = _678 >= _734;
        bool _738 = !_736;
        if (!_738)
        {
            float _740 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2606]);
            float _742 = precise::max(_740, 0.001000000047497451305389404296875);
            float _744 = -_600;
            float _746 = _744 + _602;
            float _748 = _746 * 2000.0;
            float _750 = 1.0 / _742;
            float _752 = _748 * _750;
            float _754 = precise::clamp(_752, 0.0, 1.0);
            _730 = _754;
            _698 = _750;
            _700 = _748;
            _756 = true;
        }
        else
        {
            float _758 = -_602;
            float _760 = _758 + _732;
            float _762 = _760 * 10000.0;
            float _764 = precise::clamp(_762, 0.0, 1.0);
            float _766 = -_764;
            float _768 = _766 + 1.0;
            _730 = _768;
            _700 = _764;
        }
    }
    _756 = false;
    float _770 = _730;
    float _772 = _698;
    float _774 = _700;
    float _776 = _718 * _770;
    float _778 = _722 * _770;
    bool _780 = !_210;
    float _782 = _774;
    float _784 = _772;
    float _856;
    float _858;
    if (!_780)
    {
        float _786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _804 = _790 * _792;
        float _806 = _790 * _794;
        float _808 = _788 * _792;
        float _810 = -_804;
        float _812 = fma(_786, _796, _810);
        float _814 = -_806;
        float _816 = fma(_788, _796, _814);
        float _818 = -_808;
        float _820 = fma(_786, _794, _818);
        float _822 = _788 * _802;
        float _824 = _812 * _800;
        float _826 = _786 * _800;
        float _828 = -_822;
        float _830 = fma(_790, _800, _828);
        float _832 = -_824;
        float _834 = fma(_816, _798, _832);
        float _836 = -_826;
        float _838 = fma(_788, _798, _836);
        float _840 = fma(_820, _802, _834);
        float _842 = 1.0 / _840;
        float _844 = _778 * _842;
        float _846 = _776 * _842;
        float _848 = _830 * _844;
        float _850 = _838 * _844;
        float _852 = fma(_816, _846, _848);
        float _854 = fma(_820, _846, _850);
        _784 = _848;
        _856 = _852;
        _858 = _854;
        _860 = true;
    }
    else
    {
        bool _862 = _212 != 0;
        bool _864 = _216 != 0;
        bool _866 = _864 || _862;
        if (!_866)
        {
            _724 = _776;
        }
        float _868 = _724;
        _856 = _868;
        if (!_866)
        {
            _782 = _778;
        }
        float _870 = _782;
        bool _872 = !_866;
        _858 = _870;
        if (!_872)
        {
            uint _874 = uint(int(uint(_158) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_874)]);
            int _878 = _158 + 4;
            uint _880 = uint(int(uint(_878) >> uint(2)));
            float _882 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_880)]);
            int _884 = _158 + 8;
            uint _886 = uint(int(uint(_884) >> uint(2)));
            float _888 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_886)]);
            uint _890 = uint(int(uint(_158) >> uint(2)));
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_890)]);
            int _894 = _158 + 4;
            uint _896 = uint(int(uint(_894) >> uint(2)));
            float _898 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_896)]);
            int _900 = _158 + 8;
            uint _902 = uint(int(uint(_900) >> uint(2)));
            float _904 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_902)]);
            uint _906 = uint(int(uint(_158) >> uint(2)));
            float _908 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_906)]);
            int _910 = _158 + 4;
            uint _912 = uint(int(uint(_910) >> uint(2)));
            float _914 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_912)]);
            int _916 = _158 + 8;
            uint _918 = uint(int(uint(_916) >> uint(2)));
            float _920 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_918)]);
            float _922 = _888 * _892;
            float _924 = _888 * _898;
            float _926 = _882 * _892;
            float _928 = -_922;
            float _930 = fma(_876, _904, _928);
            float _932 = -_924;
            float _934 = fma(_882, _904, _932);
            float _936 = -_926;
            float _938 = fma(_876, _898, _936);
            float _940 = _882 * _920;
            float _942 = _930 * _914;
            float _944 = _876 * _914;
            float _946 = -_940;
            float _948 = fma(_888, _914, _946);
            float _950 = -_942;
            float _952 = fma(_934, _908, _950);
            float _954 = -_944;
            float _956 = fma(_882, _908, _954);
            float _958 = fma(_938, _920, _952);
            float _960 = 1.0 / _958;
            float _962 = _778 * _960;
            float _964 = _776 * _960;
            float _966 = _948 * _962;
            float _968 = _956 * _962;
            float _970 = fma(_934, _964, _966);
            float _972 = fma(_938, _964, _968);
            _784 = _966;
            _856 = _970;
            _858 = _972;
        }
    }
    _860 = false;
    float _974 = _784;
    float _976 = _856;
    float _978 = _858;
    bool _980 = _600 != 0.0;
    bool _982 = isnan(_600);
    bool _984 = _980 || _982;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    float _990 = _974;
    if (!_988)
    {
        _990 = 4.0;
    }
    float _992 = _990;
    float _994 = _602;
    if (!_988)
    {
        float2 _2613 = float2(_592, _594);
        float _996 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2613, float2(0.0), isnan(_2613)), level(_992)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2613, float2(0.0), isnan(_2613)), level(_992)).y;
        _994 = _996;
    }
    float _998 = _994;
    float _1000 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[76]);
    int _1002 = _158 + 4;
    int _1004 = _158 + 8;
    float _1006 = _424 * _424;
    float _1008 = fma(_426, _426, _1006);
    float _1010 = fma(_432, _432, _1008);
    float _1012 = fma(_998, 2000.0, _1000);
    uint _1014 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_1014)] = as_type<uint>(_1012);
    uint _1016 = uint(int(uint(_162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1016)] = as_type<uint>(_646);
    uint _1018 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1018)] = as_type<uint>(_430);
    uint _1020 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1020)] = as_type<uint>(_428);
    uint _1022 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1022)] = as_type<uint>(_434);
    uint _1024 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1024)] = as_type<uint>(_976);
    uint _1026 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1026)] = as_type<uint>(_676);
    uint _1028 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1028)] = as_type<uint>(_978);
    uint _1030 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1030)] = as_type<uint>(_426);
    uint _1032 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1032)] = as_type<uint>(_424);
    uint _1034 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1034)] = as_type<uint>(_432);
    float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1038 = sqrt(_1010);
    float _1040 = _676 * _676;
    float _1042 = fma(_976, _976, _1040);
    float _1044 = fma(_978, _978, _1042);
    float _1046 = sqrt(_1044);
    bool _1048 = _1038 >= 9.9999999747524270787835121154785e-07;
    bool _1050 = isnan(_1038);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(9.9999999747524270787835121154785e-07);
    bool _1056 = _1052 || _1054;
    int _1072;
    if (!_1056)
    {
        bool _1058 = _620 != _650;
        bool _1060 = isnan(_620);
        bool _1062 = _1058 || _1060;
        bool _1064 = isnan(_650);
        bool _1066 = _1062 || _1064;
        if (_1066)
        {
            _462 = as_type<int>(_624);
        }
        int _1068 = _462;
        int _1070 = _1068;
        _1072 = _1068;
        _1074 = _1066;
        if (!_1074)
        {
            float _1076 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1078 = _1076 > 0.0;
            bool _1080 = !_1078;
            if (!_1080)
            {
                float _1082 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1084 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1086 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1088 = _1084 * _1084;
                float _1090 = fma(_1082, _1082, _1088);
                float _1092 = fma(_1086, _1086, _1090);
                float _1094 = rsqrt(_1092);
                float _1096 = _1094 * 9.9999999747524270787835121154785e-07;
                float _1098 = _1082 * _1096;
                float _1100 = _1084 * _1096;
                float _1102 = _1086 * _1096;
                _1072 = as_type<int>(_1098);
                _712 = as_type<int>(_1100);
                _714 = as_type<int>(_1102);
                _1074 = true;
            }
            else
            {
                bool _1104 = _1046 >= 9.9999999747524270787835121154785e-07;
                bool _1106 = isnan(_1046);
                bool _1108 = _1104 || _1106;
                bool _1110 = isnan(9.9999999747524270787835121154785e-07);
                bool _1112 = _1108 || _1110;
                if (!_1112)
                {
                    float _1114 = _428 * _428;
                    float _1116 = fma(_430, _430, _1114);
                    float _1118 = fma(_434, _434, _1116);
                    float _1120 = sqrt(_1118);
                    bool _1122 = _1120 >= 9.9999999747524270787835121154785e-07;
                    bool _1124 = isnan(_1120);
                    bool _1126 = _1122 || _1124;
                    bool _1128 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1130 = _1126 || _1128;
                    float _1132 = _1120;
                    if (_1130)
                    {
                        float _1134 = rsqrt(_1118);
                        _1132 = _1134;
                    }
                    float _1136 = _1132;
                    if (!_1130)
                    {
                        _1070 = 0;
                    }
                    int _1138 = _1070;
                    int _1140 = _1138;
                    if (!_1130)
                    {
                        _702 = 897988541;
                    }
                    int _1142 = _702;
                    int _1144 = _1142;
                    if (!_1130)
                    {
                        _704 = 0;
                    }
                    int _1146 = _704;
                    int _1148 = _1146;
                    if (_1130)
                    {
                        float _1150 = _1136 * 9.9999999747524270787835121154785e-07;
                        _706 = _1150;
                    }
                    float _1152 = _706;
                    if (_1130)
                    {
                        float _1154 = _430 * _1152;
                        _1140 = as_type<int>(_1154);
                    }
                    int _1156 = _1140;
                    _1072 = _1156;
                    if (_1130)
                    {
                        float _1158 = _428 * _1152;
                        _1144 = as_type<int>(_1158);
                    }
                    int _1160 = _1144;
                    _712 = _1160;
                    if (_1130)
                    {
                        float _1162 = _434 * _1152;
                        _1148 = as_type<int>(_1162);
                    }
                    int _1164 = _1148;
                    _714 = _1164;
                    _1074 = true;
                }
                else
                {
                    float _1166 = rsqrt(_1044);
                    float _1168 = _1166 * 9.9999999747524270787835121154785e-07;
                    float _1170 = _976 * _1168;
                    float _1172 = _676 * _1168;
                    float _1174 = _978 * _1168;
                    _1072 = as_type<int>(_1170);
                    _712 = as_type<int>(_1172);
                    _714 = as_type<int>(_1174);
                    _1074 = true;
                }
            }
        }
    }
    else
    {
        float _1176 = _1046 * _1036;
        bool _1178 = _1176 >= 0.001000000047497451305389404296875;
        bool _1180 = isnan(_1176);
        bool _1182 = _1178 || _1180;
        bool _1184 = isnan(0.001000000047497451305389404296875);
        bool _1186 = _1182 || _1184;
        bool _1188 = _1176 > 0.0;
        bool _1190 = !_1186;
        bool _1192 = _1188 && _1190;
        bool _1194 = _1038 < 0.001000000047497451305389404296875;
        bool _1196 = _1194 && _1192;
        if (!_1196)
        {
            _708 = as_type<int>(_424);
        }
        int _1198 = _708;
        int _1200 = _1198;
        if (_1196)
        {
            float _1202 = _1036 * _976;
            _464 = as_type<int>(_1202);
        }
        int _1204 = _464;
        _1072 = _1204;
        if (!_1196)
        {
            _710 = as_type<int>(_432);
        }
        int _1206 = _710;
        _714 = _1206;
        if (_1196)
        {
            float _1208 = _676 * _1036;
            _1200 = as_type<int>(_1208);
        }
        int _1210 = _1200;
        _712 = _1210;
        if (_1196)
        {
            float _1212 = _1036 * _978;
            _714 = as_type<int>(_1212);
        }
    }
    _1074 = false;
    int _1214 = _1072;
    int _1216 = _712;
    int _1218 = _714;
    uint _1220 = uint(int(uint(_158) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1220)] = uint(_1214);
    uint _1222 = uint(int(uint(_1002) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1222)] = uint(_1216);
    uint _1224 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s9)._m0[int(_1224)] = uint(_1218);
}

