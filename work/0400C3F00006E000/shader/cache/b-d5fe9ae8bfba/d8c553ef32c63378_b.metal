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
    texture2d<float> cp_t_tcb_2C [[id(11)]];
    sampler cp_t_tcb_2CSmplr [[id(12)]];
    sampler cp_t_tcb_2CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1090 = false;
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
    int _150 = _71 << 4;
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _154 = _150 + 12;
    float _156 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _158 = uint(int(uint(_154) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_158)]);
    uint _162 = uint(int(uint(_150) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_162)]);
    int _166 = _150 + 4;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_168)]);
    int _172 = _150 + 8;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_174)]);
    uint _178 = uint(int(uint(_150) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_178)]);
    int _182 = _150 + 4;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_184)]);
    int _188 = _150 + 8;
    uint _190 = uint(int(uint(_188) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_190)]);
    int _194 = as_type<int>(_152) & 512;
    bool _196 = _194 != 0;
    int _198 = as_type<int>(_152) & 1024;
    bool _200 = _198 != 0;
    int _202 = as_type<int>(_152) & 2048;
    bool _204 = _202 != 0;
    float _206 = 0.0;
    float _208 = 0.0;
    float _210 = 0.0;
    float _212 = 0.0;
    if (_196)
    {
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _206 = _214;
        _208 = _216;
        _210 = _218;
        _212 = _220;
    }
    float _222 = _206;
    float _224 = _208;
    float _226 = _210;
    float _228 = _212;
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = 0.0;
    float _236 = 0.0;
    if (_196)
    {
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _230 = _238;
        _232 = _240;
        _234 = _242;
        _236 = _244;
    }
    float _246 = _230;
    float _248 = _232;
    float _250 = _234;
    float _252 = _236;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_200)
    {
        uint _260 = uint(int(uint(_150) >> uint(2)));
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_260)]);
        int _264 = _150 + 4;
        uint _266 = uint(int(uint(_264) >> uint(2)));
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_266)]);
        int _270 = _150 + 8;
        uint _272 = uint(int(uint(_270) >> uint(2)));
        float _274 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_272)]);
        _254 = _262;
        _256 = _268;
        _258 = _274;
    }
    float _276 = _254;
    float _278 = _256;
    float _280 = _258;
    float _282 = 0.0;
    float _284 = 0.0;
    float _286 = 0.0;
    if (_200)
    {
        uint _288 = uint(int(uint(_150) >> uint(2)));
        float _290 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_288)]);
        int _292 = _150 + 4;
        uint _294 = uint(int(uint(_292) >> uint(2)));
        float _296 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_294)]);
        int _298 = _150 + 8;
        uint _300 = uint(int(uint(_298) >> uint(2)));
        float _302 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_300)]);
        _282 = _290;
        _284 = _296;
        _286 = _302;
    }
    float _304 = _282;
    float _306 = _284;
    float _308 = _286;
    float _310 = _152;
    float _312 = 0.0;
    float _314 = 0.0;
    float _316 = 0.0;
    if (_204)
    {
        uint _318 = uint(int(uint(_150) >> uint(2)));
        float _320 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_318)]);
        int _322 = _150 + 4;
        uint _324 = uint(int(uint(_322) >> uint(2)));
        float _326 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_324)]);
        int _328 = _150 + 8;
        uint _330 = uint(int(uint(_328) >> uint(2)));
        float _332 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_330)]);
        int _334 = _150 + 12;
        uint _336 = uint(int(uint(_334) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_336)]);
        _310 = _320;
        _312 = _326;
        _314 = _332;
        _316 = _338;
    }
    float _340 = _310;
    float _342 = _312;
    float _344 = _314;
    float _346 = _316;
    float _348 = 0.0;
    float _350 = 0.0;
    float _352 = 0.0;
    float _354 = 0.0;
    if (_204)
    {
        uint _356 = uint(int(uint(_150) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_356)]);
        int _360 = _150 + 4;
        uint _362 = uint(int(uint(_360) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_362)]);
        int _366 = _150 + 8;
        uint _368 = uint(int(uint(_366) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_368)]);
        int _372 = _150 + 12;
        uint _374 = uint(int(uint(_372) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_374)]);
        _348 = _358;
        _350 = _364;
        _352 = _370;
        _354 = _376;
    }
    float _378 = _348;
    float _380 = _350;
    float _382 = _352;
    float _384 = _354;
    float _386 = 0.0;
    if (_200)
    {
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _386 = _388;
    }
    float _390 = _386;
    float _392 = 0.0;
    if (_200)
    {
        float _394 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _392 = _394;
    }
    float _396 = _392;
    float _398 = _160 * _156;
    float _400 = _164 * _398;
    float _402 = fma(_170, _398, _186);
    float _404 = _180 + _400;
    float _406 = _176 * _398;
    float _408 = _192 + _406;
    float _410 = _192;
    float _412 = _180;
    float _414 = _402;
    int _416 = as_type<int>(_400);
    int _418 = as_type<int>(_400);
    if (!_196)
    {
        _410 = 0.0;
    }
    float _420 = _410;
    float _422 = _222;
    float _424 = _278;
    float _426 = _246;
    float _428 = _276;
    float _430 = _304;
    float _432 = _380;
    float _434 = _340;
    float _436 = _420;
    float _438 = _382;
    float _440 = _384;
    float _442 = _390;
    if (_196)
    {
        float _444 = _402 * _224;
        _412 = _444;
    }
    float _446 = _412;
    float _448 = _446;
    if (_196)
    {
        float _450 = fma(_404, _222, _446);
        _448 = _450;
    }
    float _452 = _448;
    float _454 = _452;
    if (_196)
    {
        float _456 = _402 * _248;
        _422 = _456;
    }
    float _458 = _422;
    float _460 = _458;
    if (_200)
    {
        float _462 = _402 * _278;
        _424 = _462;
    }
    float _464 = _424;
    float _466 = _464;
    if (_196)
    {
        float _468 = fma(_404, _246, _458);
        _426 = _468;
    }
    float _470 = _426;
    float _472 = _470;
    if (_200)
    {
        float _474 = _402 * _306;
        _460 = _474;
    }
    float _476 = _460;
    if (_200)
    {
        float _478 = fma(_404, _276, _464);
        _466 = _478;
    }
    float _480 = _466;
    float _482 = _480;
    if (_204)
    {
        float _484 = _402 * _342;
        _428 = _484;
    }
    float _486 = _428;
    if (_200)
    {
        float _488 = fma(_404, _304, _476);
        _430 = _488;
    }
    float _490 = _430;
    float _492 = _490;
    if (_204)
    {
        float _494 = _402 * _380;
        _432 = _494;
    }
    float _496 = _432;
    float _498 = _496;
    if (_196)
    {
        float _500 = fma(_408, _226, _452);
        _454 = _500;
    }
    float _502 = _454;
    float _504 = _502;
    if (_204)
    {
        float _506 = fma(_404, _340, _486);
        _434 = _506;
    }
    float _508 = _434;
    float _510 = _508;
    if (_204)
    {
        float _512 = fma(_404, _378, _496);
        _498 = _512;
    }
    float _514 = _498;
    if (_196)
    {
        float _516 = fma(_408, _250, _470);
        _472 = _516;
    }
    float _518 = _472;
    float _520 = _518;
    if (_200)
    {
        float _522 = fma(_408, _308, _490);
        _492 = _522;
    }
    float _524 = _492;
    if (_200)
    {
        float _526 = fma(_408, _280, _480);
        _482 = _526;
    }
    float _528 = _482;
    if (_196)
    {
        float _530 = _228 + _502;
        _436 = _530;
    }
    float _532 = _436;
    float _534 = _532;
    if (_204)
    {
        float _536 = fma(_408, _344, _508);
        _510 = _536;
    }
    float _538 = _510;
    if (_204)
    {
        float _540 = fma(_408, _382, _514);
        _438 = _540;
    }
    float _542 = _438;
    if (!_196)
    {
        _504 = 0.0;
    }
    float _544 = _504;
    float _546 = _544;
    if (_196)
    {
        float _548 = _252 + _518;
        _546 = _548;
    }
    float _550 = _546;
    float _552 = _550;
    if (_200)
    {
        float _554 = _390 + _524;
        _534 = _554;
    }
    float _556 = _534;
    float _558 = _556;
    if (_200)
    {
        float _560 = _396 + _528;
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (_204)
    {
        float _566 = _346 + _538;
        _558 = _566;
    }
    float _568 = _558;
    if (_204)
    {
        float _570 = _384 + _542;
        _564 = _570;
    }
    float _572 = _564;
    float _574 = fma(_568, 6.2500002968590706586837768554688e-05, 0.5);
    float _576 = fma(_572, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2003 = float2(_574, _576);
    float _578 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2003, float2(0.0), isnan(_2003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2003, float2(0.0), isnan(_2003)), level(0.0)).x;
    float _580 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _582 = uint(int(uint(_154) >> uint(2)));
    float _584 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_582)]);
    float _586 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _588 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _590 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _592 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _594 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    bool _596 = _578 != 0.0;
    bool _598 = isnan(_578);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = -_584;
    float _608 = _580 + _606;
    bool _610 = _608 > 0.001000000047497451305389404296875;
    bool _612 = isnan(_608);
    bool _614 = _610 || _612;
    bool _616 = isnan(0.001000000047497451305389404296875);
    bool _618 = _614 || _616;
    float _620 = _574;
    float _622 = _572;
    if (!_604)
    {
        _440 = 4.0;
    }
    float _624 = _440;
    float _626 = _578;
    if (!_604)
    {
        float2 _2084 = float2(_574, _576);
        float _628 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2084, float2(0.0), isnan(_2084)), level(_624)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2084, float2(0.0), isnan(_2084)), level(_624)).x;
        _626 = _628;
    }
    float _630 = _626;
    float _632 = _156 * _594;
    int _634 = as_type<int>(_524);
    if (!_618)
    {
        uint _636 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
        float _638 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_636)]);
        _634 = as_type<int>(_638);
    }
    int _640 = _634;
    float _642 = abs(_586);
    float _644 = log2(_642);
    float _646 = _156 * _644;
    float _648 = exp2(_646);
    float _650 = _588 * _632;
    float _652 = _590 * _632;
    float _654 = _592 * _632;
    int _656 = _150 + 4;
    uint _658 = uint(int(uint(_154) >> uint(2)));
    float _660 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_658)]);
    float _662 = fma(_164, _648, _650);
    float _664 = fma(_170, _648, _652);
    float _666 = fma(_176, _648, _654);
    uint _668 = uint(int(uint(_150) >> uint(2)));
    float _670 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_668)]);
    int _672 = _150 + 4;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    float _676 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_674)]);
    int _678 = _150 + 8;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    float _682 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_680)]);
    int _684 = _640;
    if (!_618)
    {
        float _686 = fma(_630, 2000.0, as_type<float>(_640));
        _684 = as_type<int>(_686);
    }
    int _688 = _684;
    if (!_618)
    {
        uint _690 = uint(int(uint(_656) >> uint(2)));
        (*spvDescriptorSet0.cp_s9)._m0[int(_690)] = uint(_688);
    }
    uint _692 = uint(int(uint(as_type<int>((*spvDescriptorSet0.cp_c1)._m0[0].x)) >> uint(2)));
    float _694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_692)]);
    uint _696 = uint(int(uint(_656) >> uint(2)));
    float _698 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_696)]);
    float _700 = fma(_630, 2000.0, _694);
    float _702 = _402 + _698;
    bool _704 = _702 >= _700;
    bool _706 = isnan(_702);
    bool _708 = _704 || _706;
    bool _710 = isnan(_700);
    bool _712 = _708 || _710;
    float _714 = _700;
    int _716 = as_type<int>(_702);
    int _718 = as_type<int>(_676);
    int _720 = as_type<int>(_682);
    int _722 = as_type<int>(_676);
    int _724 = as_type<int>(_682);
    int _726 = as_type<int>(_676);
    int _728 = as_type<int>(_682);
    if (!_712)
    {
        float _730 = -_698;
        float _732 = _700 + _730;
        _714 = _732;
    }
    float _734 = _714;
    int _736 = as_type<int>(_734);
    if (!_712)
    {
        float _738 = fma(_734, 0.00999999977648258209228515625, _698);
        _736 = as_type<int>(_738);
    }
    int _740 = _736;
    if (_618)
    {
        _716 = as_type<int>(_660);
    }
    int _742 = _716;
    int _744 = _742;
    if (!_712)
    {
        uint _746 = uint(int(uint(_656) >> uint(2)));
        (*spvDescriptorSet0.cp_s9)._m0[int(_746)] = uint(_740);
    }
    if (!_618)
    {
        float _748 = fma(_568, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _750 = fma(_568, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _2316 = float2(_748, _576);
        float _752 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2316, float2(0.0), isnan(_2316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2316, float2(0.0), isnan(_2316)), level(0.0)).x;
        float2 _2324 = float2(_750, _576);
        float _754 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2324, float2(0.0), isnan(_2324)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2324, float2(0.0), isnan(_2324)), level(0.0)).x;
        float _756 = fma(_572, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _758 = fma(_572, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _2336 = float2(_574, _756);
        float _760 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2336, float2(0.0), isnan(_2336)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2336, float2(0.0), isnan(_2336)), level(0.0)).x;
        float2 _2344 = float2(_574, _758);
        float _762 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2344, float2(0.0), isnan(_2344)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2344, float2(0.0), isnan(_2344)), level(0.0)).x;
        float2 _2352 = float2(_748, _756);
        float _764 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2352, float2(0.0), isnan(_2352)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2352, float2(0.0), isnan(_2352)), level(0.0)).x;
        float2 _2360 = float2(_748, _758);
        float _766 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2360, float2(0.0), isnan(_2360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2360, float2(0.0), isnan(_2360)), level(0.0)).x;
        float2 _2368 = float2(_750, _758);
        float _768 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2368, float2(0.0), isnan(_2368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2368, float2(0.0), isnan(_2368)), level(0.0)).x;
        float2 _2376 = float2(_750, _756);
        float _770 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2376, float2(0.0), isnan(_2376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2376, float2(0.0), isnan(_2376)), level(0.0)).x;
        bool _772 = _752 != 0.0;
        bool _774 = isnan(_752);
        bool _776 = _772 || _774;
        bool _778 = isnan(0.0);
        bool _780 = _776 || _778;
        bool _782 = _754 != 0.0;
        bool _784 = isnan(_754);
        bool _786 = _782 || _784;
        bool _788 = isnan(0.0);
        bool _790 = _786 || _788;
        float _792 = _764;
        float _794 = _576;
        float _796 = _768;
        float _798 = _748;
        float _800 = _750;
        if (!_780)
        {
            _442 = 4.0;
        }
        float _802 = _442;
        float _804 = _802;
        if (!_790)
        {
            _520 = 4.0;
        }
        float _806 = _520;
        float _808 = _752;
        float _810 = _806;
        if (!_780)
        {
            float2 _2427 = float2(_748, _576);
            float _812 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2427, float2(0.0), isnan(_2427)), level(_802)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2427, float2(0.0), isnan(_2427)), level(_802)).x;
            _808 = _812;
        }
        float _814 = _808;
        float _816 = _754;
        if (!_790)
        {
            float2 _2443 = float2(_750, _576);
            float _818 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2443, float2(0.0), isnan(_2443)), level(_806)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2443, float2(0.0), isnan(_2443)), level(_806)).x;
            _816 = _818;
        }
        float _820 = _816;
        bool _822 = _764 != 0.0;
        bool _824 = isnan(_764);
        bool _826 = _822 || _824;
        bool _828 = isnan(0.0);
        bool _830 = _826 || _828;
        bool _832 = _768 != 0.0;
        bool _834 = isnan(_768);
        bool _836 = _832 || _834;
        bool _838 = isnan(0.0);
        bool _840 = _836 || _838;
        bool _842 = _766 != 0.0;
        bool _844 = isnan(_766);
        bool _846 = _842 || _844;
        bool _848 = isnan(0.0);
        bool _850 = _846 || _848;
        bool _852 = _770 != 0.0;
        bool _854 = isnan(_770);
        bool _856 = _852 || _854;
        bool _858 = isnan(0.0);
        bool _860 = _856 || _858;
        bool _862 = _760 != 0.0;
        bool _864 = isnan(_760);
        bool _866 = _862 || _864;
        bool _868 = isnan(0.0);
        bool _870 = _866 || _868;
        bool _872 = _762 != 0.0;
        bool _874 = isnan(_762);
        bool _876 = _872 || _874;
        bool _878 = isnan(0.0);
        bool _880 = _876 || _878;
        if (_830)
        {
            _620 = _764;
        }
        float _882 = _620;
        if (_840)
        {
            _792 = _768;
        }
        float _884 = _792;
        if (!_850)
        {
            _804 = 4.0;
        }
        float _886 = _804;
        if (!_840)
        {
            _810 = 4.0;
        }
        float _888 = _810;
        if (!_830)
        {
            _794 = 4.0;
        }
        float _890 = _794;
        float _892 = _766;
        if (!_850)
        {
            float2 _2550 = float2(_748, _758);
            float _894 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2550, float2(0.0), isnan(_2550)), level(_886)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2550, float2(0.0), isnan(_2550)), level(_886)).x;
            _892 = _894;
        }
        float _896 = _892;
        float _898 = _884;
        if (!_840)
        {
            float2 _2566 = float2(_750, _758);
            float _900 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2566, float2(0.0), isnan(_2566)), level(_888)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2566, float2(0.0), isnan(_2566)), level(_888)).x;
            _898 = _900;
        }
        float _902 = _898;
        if (!_860)
        {
            _796 = 4.0;
        }
        float _904 = _796;
        float _906 = _882;
        if (!_830)
        {
            float2 _2587 = float2(_748, _756);
            float _908 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2587, float2(0.0), isnan(_2587)), level(_890)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2587, float2(0.0), isnan(_2587)), level(_890)).x;
            _906 = _908;
        }
        float _910 = _906;
        if (!_870)
        {
            _798 = 4.0;
        }
        float _912 = _798;
        if (!_880)
        {
            _800 = 4.0;
        }
        float _914 = _800;
        float _916 = _770;
        if (!_860)
        {
            float2 _2613 = float2(_750, _756);
            float _918 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2613, float2(0.0), isnan(_2613)), level(_904)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2613, float2(0.0), isnan(_2613)), level(_904)).x;
            _916 = _918;
        }
        float _920 = _916;
        float _922 = _760;
        if (!_870)
        {
            float2 _2629 = float2(_574, _756);
            float _924 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2629, float2(0.0), isnan(_2629)), level(_912)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2629, float2(0.0), isnan(_2629)), level(_912)).x;
            _922 = _924;
        }
        float _926 = _922;
        float _928 = _762;
        if (!_880)
        {
            float2 _2645 = float2(_574, _758);
            float _930 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2645, float2(0.0), isnan(_2645)), level(_914)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2645, float2(0.0), isnan(_2645)), level(_914)).x;
            _928 = _930;
        }
        float _932 = _928;
        float _934 = -_814;
        float _936 = _630 + _934;
        float _938 = -_820;
        float _940 = _630 + _938;
        float _942 = abs(_936);
        float _944 = abs(_940);
        float _946 = precise::max(_942, _944);
        float _948 = -_896;
        float _950 = _630 + _948;
        float _952 = -_902;
        float _954 = _630 + _952;
        float _956 = -_910;
        float _958 = _630 + _956;
        float _960 = -_920;
        float _962 = _630 + _960;
        float _964 = -_926;
        float _966 = _630 + _964;
        float _968 = abs(_958);
        float _970 = abs(_950);
        float _972 = precise::max(_968, _970);
        float _974 = -_932;
        float _976 = _630 + _974;
        float _978 = abs(_962);
        float _980 = abs(_954);
        float _982 = precise::max(_978, _980);
        float _984 = abs(_966);
        float _986 = abs(_976);
        float _988 = precise::max(_984, _986);
        float _990 = precise::max(_972, _982);
        float _992 = precise::max(_946, _988);
        bool _994 = _990 > 0.00150000001303851604461669921875;
        bool _996 = _992 > 0.00150000001303851604461669921875;
        bool _998 = _996 || _994;
        bool _1000 = !_998;
        int _1002 = _1000 ? as_type<int>(_660) : 0;
        _744 = _1002;
        _622 = _902;
    }
    int _1004 = _744;
    float _1006 = _622;
    float _1008 = _1006;
    if (!_712)
    {
        float _1010 = _402 * 0.9900000095367431640625;
        _414 = _1010;
    }
    float _1012 = _414;
    int _1014 = _150 + 8;
    uint _1016 = uint(int(uint(_154) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1016)] = uint(_1004);
    if (_712)
    {
        _1008 = _664;
    }
    float _1018 = _1008;
    float _1020 = _1018;
    if (!_712)
    {
        _1020 = 0.0;
    }
    float _1022 = _1020;
    uint _1024 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1024)] = as_type<uint>(_404);
    float _1026 = -_186;
    float _1028 = _1026 + _1012;
    uint _1030 = uint(int(uint(_656) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1030)] = as_type<uint>(_1012);
    uint _1032 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1032)] = as_type<uint>(_408);
    uint _1034 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1034)] = as_type<uint>(_662);
    uint _1036 = uint(int(uint(_656) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1036)] = as_type<uint>(_1022);
    uint _1038 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1038)] = as_type<uint>(_666);
    uint _1040 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1040)] = as_type<uint>(_400);
    uint _1042 = uint(int(uint(_656) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1042)] = as_type<uint>(_1028);
    uint _1044 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1044)] = as_type<uint>(_406);
    float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1048 = _1028 * _1028;
    float _1050 = _1022 * _1022;
    float _1052 = fma(_400, _400, _1048);
    float _1054 = fma(_662, _662, _1050);
    float _1056 = fma(_406, _406, _1052);
    float _1058 = fma(_666, _666, _1054);
    float _1060 = sqrt(_1058);
    float _1062 = sqrt(_1056);
    bool _1064 = _1062 >= 9.9999999747524270787835121154785e-07;
    bool _1066 = isnan(_1062);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(9.9999999747524270787835121154785e-07);
    bool _1072 = _1068 || _1070;
    int _1088;
    if (!_1072)
    {
        bool _1074 = _580 != _584;
        bool _1076 = isnan(_580);
        bool _1078 = _1074 || _1076;
        bool _1080 = isnan(_584);
        bool _1082 = _1078 || _1080;
        if (_1082)
        {
            _416 = as_type<int>(_670);
        }
        int _1084 = _416;
        int _1086 = _1084;
        _1088 = _1084;
        _1090 = _1082;
        if (!_1090)
        {
            float _1092 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1094 = _1092 > 0.0;
            bool _1096 = !_1094;
            if (!_1096)
            {
                float _1098 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1100 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1102 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1104 = _1100 * _1100;
                float _1106 = fma(_1098, _1098, _1104);
                float _1108 = fma(_1102, _1102, _1106);
                float _1110 = rsqrt(_1108);
                float _1112 = _1110 * 9.9999999747524270787835121154785e-07;
                float _1114 = _1098 * _1112;
                float _1116 = _1100 * _1112;
                float _1118 = _1102 * _1112;
                _1088 = as_type<int>(_1114);
                _726 = as_type<int>(_1116);
                _728 = as_type<int>(_1118);
                _1090 = true;
            }
            else
            {
                bool _1120 = _1060 >= 9.9999999747524270787835121154785e-07;
                bool _1122 = isnan(_1060);
                bool _1124 = _1120 || _1122;
                bool _1126 = isnan(9.9999999747524270787835121154785e-07);
                bool _1128 = _1124 || _1126;
                if (!_1128)
                {
                    float _1130 = _1012 * _1012;
                    float _1132 = fma(_404, _404, _1130);
                    float _1134 = fma(_408, _408, _1132);
                    float _1136 = sqrt(_1134);
                    bool _1138 = _1136 >= 9.9999999747524270787835121154785e-07;
                    bool _1140 = isnan(_1136);
                    bool _1142 = _1138 || _1140;
                    bool _1144 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1146 = _1142 || _1144;
                    float _1148 = _1136;
                    if (_1146)
                    {
                        float _1150 = rsqrt(_1134);
                        _1148 = _1150;
                    }
                    float _1152 = _1148;
                    if (!_1146)
                    {
                        _1086 = 0;
                    }
                    int _1154 = _1086;
                    int _1156 = _1154;
                    if (!_1146)
                    {
                        _718 = 897988541;
                    }
                    int _1158 = _718;
                    int _1160 = _1158;
                    if (!_1146)
                    {
                        _720 = 0;
                    }
                    int _1162 = _720;
                    float _1164 = _1152;
                    int _1166 = _1162;
                    if (_1146)
                    {
                        float _1168 = _1152 * 9.9999999747524270787835121154785e-07;
                        _1164 = _1168;
                    }
                    float _1170 = _1164;
                    if (_1146)
                    {
                        float _1172 = _404 * _1170;
                        _1156 = as_type<int>(_1172);
                    }
                    int _1174 = _1156;
                    _1088 = _1174;
                    if (_1146)
                    {
                        float _1176 = _1012 * _1170;
                        _1160 = as_type<int>(_1176);
                    }
                    int _1178 = _1160;
                    _726 = _1178;
                    if (_1146)
                    {
                        float _1180 = _408 * _1170;
                        _1166 = as_type<int>(_1180);
                    }
                    int _1182 = _1166;
                    _728 = _1182;
                    _1090 = true;
                }
                else
                {
                    float _1184 = rsqrt(_1058);
                    float _1186 = _1184 * 9.9999999747524270787835121154785e-07;
                    float _1188 = _662 * _1186;
                    float _1190 = _1022 * _1186;
                    float _1192 = _666 * _1186;
                    _1088 = as_type<int>(_1188);
                    _726 = as_type<int>(_1190);
                    _728 = as_type<int>(_1192);
                    _1090 = true;
                }
            }
        }
    }
    else
    {
        float _1194 = _1060 * _1046;
        bool _1196 = _1194 >= 0.001000000047497451305389404296875;
        bool _1198 = isnan(_1194);
        bool _1200 = _1196 || _1198;
        bool _1202 = isnan(0.001000000047497451305389404296875);
        bool _1204 = _1200 || _1202;
        bool _1206 = _1194 > 0.0;
        bool _1208 = !_1204;
        bool _1210 = _1206 && _1208;
        bool _1212 = _1062 < 0.001000000047497451305389404296875;
        bool _1214 = _1212 && _1210;
        if (!_1214)
        {
            _722 = as_type<int>(_1028);
        }
        int _1216 = _722;
        int _1218 = _1216;
        if (_1214)
        {
            float _1220 = _662 * _1046;
            _418 = as_type<int>(_1220);
        }
        int _1222 = _418;
        _1088 = _1222;
        if (!_1214)
        {
            _724 = as_type<int>(_406);
        }
        int _1224 = _724;
        _728 = _1224;
        if (_1214)
        {
            float _1226 = _1046 * _1022;
            _1218 = as_type<int>(_1226);
        }
        int _1228 = _1218;
        _726 = _1228;
        if (_1214)
        {
            float _1230 = _666 * _1046;
            _728 = as_type<int>(_1230);
        }
    }
    _1090 = false;
    int _1232 = _1088;
    int _1234 = _726;
    int _1236 = _728;
    uint _1238 = uint(int(uint(_150) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1238)] = uint(_1232);
    uint _1240 = uint(int(uint(_656) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1240)] = uint(_1234);
    uint _1242 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1242)] = uint(_1236);
}

