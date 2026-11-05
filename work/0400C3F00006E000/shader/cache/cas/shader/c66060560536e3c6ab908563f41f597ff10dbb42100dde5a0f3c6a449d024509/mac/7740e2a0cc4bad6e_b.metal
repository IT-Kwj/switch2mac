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
    texture2d<float> cp_t_tcb_2C [[id(11)]];
    sampler cp_t_tcb_2CSmplr [[id(12)]];
    sampler cp_t_tcb_2CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1062 = false;
    float _60 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    float _64 = as_type<float>(gl_WorkGroupID.x);
    int _67 = as_type<int>(_64) << 5;
    int _69 = _67 + as_type<int>(_62);
    float _71 = trunc(_60);
    int _73 = int(_71);
    bool _77 = _69 >= _73;
    int _79 = 0;
    if (_77)
    {
        _79 = 0;
    }
    int _81 = _79;
    int _83 = _81;
    int _85 = _81;
    if (!_77)
    {
        int _87 = _69 << 4;
        int _89 = _87 + 12;
        uint _92 = uint(int(uint(_89) >> uint(2)));
        float _94 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_92)]);
        float _96 = trunc(_94);
        int _98 = int(_96);
        bool _100 = _98 >= 1;
        int _102 = _100 ? (-1) : 0;
        if (!_100)
        {
            _83 = 0;
        }
        int _104 = _83;
        bool _106 = !_100;
        _85 = _104;
        if (!_106)
        {
            float _108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _110 = uint(int(uint(_89) >> uint(2)));
            float _112 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_110)]);
            float _114 = float(_98);
            float _116 = -_112;
            float _118 = _108 + _116;
            bool _120 = _118 > _114;
            int _122 = as_type<int>(_108);
            if (!_120)
            {
                bool _124 = _108 >= _112;
                bool _126 = isnan(_108);
                bool _128 = _124 || _126;
                bool _130 = isnan(_112);
                bool _132 = _128 || _130;
                _102 = _132 ? (-1) : 0;
            }
            int _134 = _102;
            if (_120)
            {
                _122 = 0;
            }
            int _136 = _122;
            _85 = _136;
            if (!_120)
            {
                int _138 = ~_134;
                int _140 = (_138 != 0) ? 0 : 1;
                _85 = _140;
            }
        }
    }
    int _142 = _85;
    int _144 = _142 & 1;
    bool _146 = _144 != 0;
    if (!_146)
    {
        return;
    }
    int _148 = _69 << 4;
    float _150 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _152 = _148 + 12;
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    uint _156 = uint(int(uint(_152) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_156)]);
    uint _160 = uint(int(uint(_148) >> uint(2)));
    float _162 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_160)]);
    int _164 = _148 + 4;
    uint _166 = uint(int(uint(_164) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_166)]);
    int _170 = _148 + 8;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_172)]);
    int _176 = _148 + 12;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_178)]);
    uint _182 = uint(int(uint(_148) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = _148 + 4;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _148 + 8;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = as_type<int>(_150) & 512;
    bool _200 = _198 != 0;
    int _202 = as_type<int>(_150) & 1024;
    bool _204 = _202 != 0;
    int _206 = as_type<int>(_150) & 2048;
    bool _208 = _206 != 0;
    float _210 = 0.0;
    float _212 = 0.0;
    float _214 = 0.0;
    float _216 = 0.0;
    if (_200)
    {
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _210 = _218;
        _212 = _220;
        _214 = _222;
        _216 = _224;
    }
    float _226 = _210;
    float _228 = _212;
    float _230 = _214;
    float _232 = _216;
    float _234 = 0.0;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = 0.0;
    if (_200)
    {
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _234 = _242;
        _236 = _244;
        _238 = _246;
        _240 = _248;
    }
    float _250 = _234;
    float _252 = _236;
    float _254 = _238;
    float _256 = _240;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = 0.0;
    if (_204)
    {
        uint _264 = uint(int(uint(_148) >> uint(2)));
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_264)]);
        int _268 = _148 + 4;
        uint _270 = uint(int(uint(_268) >> uint(2)));
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_270)]);
        int _274 = _148 + 8;
        uint _276 = uint(int(uint(_274) >> uint(2)));
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_276)]);
        _258 = _266;
        _260 = _272;
        _262 = _278;
    }
    float _280 = _258;
    float _282 = _260;
    float _284 = _262;
    float _286 = 0.0;
    float _288 = 0.0;
    float _290 = 0.0;
    if (_204)
    {
        uint _292 = uint(int(uint(_148) >> uint(2)));
        float _294 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_292)]);
        int _296 = _148 + 4;
        uint _298 = uint(int(uint(_296) >> uint(2)));
        float _300 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_298)]);
        int _302 = _148 + 8;
        uint _304 = uint(int(uint(_302) >> uint(2)));
        float _306 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_304)]);
        _286 = _294;
        _288 = _300;
        _290 = _306;
    }
    float _308 = _286;
    float _310 = _288;
    float _312 = _290;
    float _314 = _150;
    int _316 = 0;
    float _318 = 0.0;
    float _320 = 0.0;
    if (_208)
    {
        uint _322 = uint(int(uint(_148) >> uint(2)));
        float _324 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_322)]);
        int _326 = _148 + 4;
        uint _328 = uint(int(uint(_326) >> uint(2)));
        float _330 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_328)]);
        int _332 = _148 + 8;
        uint _334 = uint(int(uint(_332) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_334)]);
        int _338 = _148 + 12;
        uint _340 = uint(int(uint(_338) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_340)]);
        _314 = _324;
        _316 = as_type<int>(_330);
        _318 = _336;
        _320 = _342;
    }
    float _344 = _314;
    int _346 = _316;
    float _348 = _318;
    float _350 = _320;
    float _352 = 0.0;
    float _354 = 0.0;
    float _356 = 0.0;
    float _358 = 0.0;
    if (_208)
    {
        uint _360 = uint(int(uint(_148) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_360)]);
        int _364 = _148 + 4;
        uint _366 = uint(int(uint(_364) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_366)]);
        int _370 = _148 + 8;
        uint _372 = uint(int(uint(_370) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_372)]);
        int _376 = _148 + 12;
        uint _378 = uint(int(uint(_376) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_378)]);
        _352 = _362;
        _354 = _368;
        _356 = _374;
        _358 = _380;
    }
    float _382 = _352;
    float _384 = _354;
    float _386 = _356;
    float _388 = _358;
    float _390 = 0.0;
    if (_204)
    {
        float _392 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _390 = _392;
    }
    float _394 = _390;
    float _396 = 0.0;
    if (_204)
    {
        float _398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _396 = _398;
    }
    float _400 = _396;
    float _402 = _158 * _154;
    float _404 = _168 * _402;
    float _406 = _174 * _402;
    float _408 = _162 * _402;
    float _410 = _190 + _404;
    float _412 = _196 + _406;
    float _414 = _184 + _408;
    float _416 = _180;
    float _418 = _196;
    float _420 = _184;
    float _422 = _190;
    int _424 = as_type<int>(_408);
    int _426 = as_type<int>(_408);
    if (!_200)
    {
        _416 = 0.0;
    }
    float _428 = _416;
    float _430 = _226;
    float _432 = _250;
    float _434 = _310;
    float _436 = _280;
    float _438 = _284;
    float _440 = _384;
    float _442 = _344;
    float _444 = _428;
    float _446 = _308;
    float _448 = _386;
    float _450 = _382;
    float _452 = _348;
    float _454 = _312;
    int _456 = _346;
    if (_200)
    {
        float _458 = _410 * _228;
        _418 = _458;
    }
    float _460 = _418;
    float _462 = _460;
    if (_200)
    {
        float _464 = _410 * _252;
        _420 = _464;
    }
    float _466 = _420;
    float _468 = _466;
    if (_200)
    {
        float _470 = fma(_414, _226, _460);
        _430 = _470;
    }
    float _472 = _430;
    float _474 = _472;
    if (_204)
    {
        float _476 = _410 * _282;
        _462 = _476;
    }
    float _478 = _462;
    if (_200)
    {
        float _480 = fma(_414, _250, _466);
        _432 = _480;
    }
    float _482 = _432;
    float _484 = _482;
    if (_204)
    {
        float _486 = _410 * _310;
        _434 = _486;
    }
    float _488 = _434;
    float _490 = _488;
    if (_204)
    {
        float _492 = fma(_414, _280, _478);
        _436 = _492;
    }
    float _494 = _436;
    float _496 = _494;
    if (_200)
    {
        float _498 = fma(_412, _254, _482);
        _484 = _498;
    }
    float _500 = _484;
    if (!_200)
    {
        _468 = 0.0;
    }
    float _502 = _468;
    float _504 = _502;
    if (_204)
    {
        float _506 = fma(_414, _308, _488);
        _490 = _506;
    }
    float _508 = _490;
    float _510 = _508;
    if (_204)
    {
        float _512 = fma(_412, _284, _494);
        _496 = _512;
    }
    float _514 = _496;
    if (_200)
    {
        float _516 = _256 + _500;
        _504 = _516;
    }
    float _518 = _504;
    float _520 = _518;
    if (_208)
    {
        float _522 = _410 * as_type<float>(_346);
        _438 = _522;
    }
    float _524 = _438;
    if (_208)
    {
        float _526 = _410 * _384;
        _440 = _526;
    }
    float _528 = _440;
    float _530 = _528;
    if (_200)
    {
        float _532 = fma(_412, _230, _472);
        _474 = _532;
    }
    float _534 = _474;
    if (_204)
    {
        float _536 = fma(_412, _312, _508);
        _510 = _536;
    }
    float _538 = _510;
    if (_208)
    {
        float _540 = fma(_414, _344, _524);
        _442 = _540;
    }
    float _542 = _442;
    float _544 = _542;
    if (_208)
    {
        float _546 = fma(_414, _382, _528);
        _530 = _546;
    }
    float _548 = _530;
    if (_200)
    {
        float _550 = _232 + _534;
        _444 = _550;
    }
    float _552 = _444;
    float _554 = _552;
    if (!_204)
    {
        _446 = _518;
    }
    float _556 = _446;
    float _558 = _556;
    if (_204)
    {
        float _560 = _394 + _514;
        _558 = _560;
    }
    float _562 = _558;
    if (_204)
    {
        float _564 = _400 + _538;
        _554 = _564;
    }
    float _566 = _554;
    if (_208)
    {
        float _568 = fma(_412, _348, _542);
        _544 = _568;
    }
    float _570 = _544;
    int _572 = as_type<int>(_570);
    if (_208)
    {
        float _574 = fma(_412, _386, _548);
        _448 = _574;
    }
    float _576 = _448;
    float _578 = 6.2500002968590706586837768554688e-05;
    if (!_208)
    {
        _450 = _562;
    }
    float _580 = _450;
    float _582 = _580;
    if (_208)
    {
        float _584 = _350 + _570;
        _582 = _584;
    }
    float _586 = _582;
    if (!_208)
    {
        _452 = _566;
    }
    float _588 = _452;
    float _590 = _588;
    if (_208)
    {
        float _592 = _388 + _576;
        _590 = _592;
    }
    float _594 = _590;
    float _596 = fma(_586, 6.2500002968590706586837768554688e-05, 0.5);
    float _598 = fma(_594, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2014 = float2(_596, _598);
    float _600 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2014, float2(0.0), isnan(_2014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2014, float2(0.0), isnan(_2014)), level(0.0)).x;
    float _602 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _604 = uint(int(uint(_152) >> uint(2)));
    float _606 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_604)]);
    float _608 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _610 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _612 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _614 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _616 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _618 = -_606;
    float _620 = _602 + _618;
    bool _622 = _600 != 0.0;
    bool _624 = isnan(_600);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    bool _632 = _620 > 0.001000000047497451305389404296875;
    bool _634 = isnan(_620);
    bool _636 = _632 || _634;
    bool _638 = isnan(0.001000000047497451305389404296875);
    bool _640 = _636 || _638;
    float _642 = _596;
    float _644 = _598;
    if (!_630)
    {
        _454 = 4.0;
    }
    float _646 = _454;
    if (!_640)
    {
        _572 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x);
    }
    int _648 = _572;
    if (!_640)
    {
        _456 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].y);
    }
    int _650 = _456;
    float _652 = _600;
    int _654 = _650;
    if (!_630)
    {
        float2 _2114 = float2(_596, _598);
        float _656 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2114, float2(0.0), isnan(_2114)), level(_646)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2114, float2(0.0), isnan(_2114)), level(_646)).x;
        _652 = _656;
    }
    float _658 = _652;
    uint _660 = uint(int(uint(_152) >> uint(2)));
    float _662 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_660)]);
    float _664 = abs(_608);
    float _666 = log2(_664);
    float _668 = _154 * _610;
    int _670 = _648;
    if (!_640)
    {
        float _672 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[76]);
        _670 = as_type<int>(_672);
    }
    int _674 = _670;
    float _676 = _154 * _666;
    float _678 = exp2(_676);
    float _680 = _612 * _668;
    float _682 = _614 * _668;
    float _684 = _616 * _668;
    uint _686 = as_type<uint>(_666);
    if (!_640)
    {
        int _688 = _148 + 4;
        _686 = uint(_688);
    }
    uint _690 = _686;
    float _692 = fma(_162, _678, _680);
    float _694 = fma(_168, _678, _682);
    float _696 = fma(_174, _678, _684);
    uint _698 = uint(int(uint(_148) >> uint(2)));
    float _700 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_698)]);
    int _702 = _148 + 4;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    float _706 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_704)]);
    int _708 = _148 + 8;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    float _712 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_710)]);
    int _714 = _674;
    if (!_640)
    {
        float _716 = fma(_658, 2000.0, as_type<float>(_674));
        _714 = as_type<int>(_716);
    }
    int _718 = _714;
    if (_640)
    {
        _654 = as_type<int>(_662);
    }
    int _720 = _654;
    int _722 = _720;
    if (!_640)
    {
        uint _724 = uint(int(uint(int(_690)) >> uint(2)));
        (*spvDescriptorSet0.cp_s9)._m0[int(_724)] = uint(_718);
    }
    int _726 = as_type<int>(_706);
    int _728 = as_type<int>(_712);
    int _730 = as_type<int>(_706);
    int _732 = as_type<int>(_712);
    if (!_640)
    {
        float _734 = fma(_586, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float2 _2265 = float2(_734, _598);
        float _736 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2265, float2(0.0), isnan(_2265)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2265, float2(0.0), isnan(_2265)), level(0.0)).x;
        float _738 = fma(_586, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _740 = fma(_594, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _742 = fma(_594, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _2280 = float2(_738, _598);
        float _744 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2280, float2(0.0), isnan(_2280)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2280, float2(0.0), isnan(_2280)), level(0.0)).x;
        float2 _2288 = float2(_596, _740);
        float _746 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2288, float2(0.0), isnan(_2288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2288, float2(0.0), isnan(_2288)), level(0.0)).x;
        float2 _2296 = float2(_596, _742);
        float _748 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2296, float2(0.0), isnan(_2296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2296, float2(0.0), isnan(_2296)), level(0.0)).x;
        float2 _2304 = float2(_734, _740);
        float _750 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2304, float2(0.0), isnan(_2304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2304, float2(0.0), isnan(_2304)), level(0.0)).x;
        float2 _2312 = float2(_734, _742);
        float _752 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2312, float2(0.0), isnan(_2312)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2312, float2(0.0), isnan(_2312)), level(0.0)).x;
        float2 _2320 = float2(_738, _740);
        float _754 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2320, float2(0.0), isnan(_2320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2320, float2(0.0), isnan(_2320)), level(0.0)).x;
        float2 _2328 = float2(_738, _742);
        float _756 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2328, float2(0.0), isnan(_2328)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2328, float2(0.0), isnan(_2328)), level(0.0)).x;
        bool _758 = _736 != 0.0;
        bool _760 = isnan(_736);
        bool _762 = _758 || _760;
        bool _764 = isnan(0.0);
        bool _766 = _762 || _764;
        float _768 = _598;
        float _770 = _752;
        float _772 = _734;
        float _774 = _756;
        float _776 = _744;
        float _778 = _754;
        if (!_766)
        {
            _578 = 4.0;
        }
        float _780 = _578;
        float _782 = _736;
        float _784 = _780;
        if (!_766)
        {
            float2 _2363 = float2(_734, _598);
            float _786 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2363, float2(0.0), isnan(_2363)), level(_780)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2363, float2(0.0), isnan(_2363)), level(_780)).x;
            _782 = _786;
        }
        float _788 = _782;
        bool _790 = _752 != 0.0;
        bool _792 = isnan(_752);
        bool _794 = _790 || _792;
        bool _796 = isnan(0.0);
        bool _798 = _794 || _796;
        bool _800 = _744 != 0.0;
        bool _802 = isnan(_744);
        bool _804 = _800 || _802;
        bool _806 = isnan(0.0);
        bool _808 = _804 || _806;
        bool _810 = _756 != 0.0;
        bool _812 = isnan(_756);
        bool _814 = _810 || _812;
        bool _816 = isnan(0.0);
        bool _818 = _814 || _816;
        bool _820 = _754 != 0.0;
        bool _822 = isnan(_754);
        bool _824 = _820 || _822;
        bool _826 = isnan(0.0);
        bool _828 = _824 || _826;
        bool _830 = _750 != 0.0;
        bool _832 = isnan(_750);
        bool _834 = _830 || _832;
        bool _836 = isnan(0.0);
        bool _838 = _834 || _836;
        bool _840 = _746 != 0.0;
        bool _842 = isnan(_746);
        bool _844 = _840 || _842;
        bool _846 = isnan(0.0);
        bool _848 = _844 || _846;
        bool _850 = _748 != 0.0;
        bool _852 = isnan(_748);
        bool _854 = _850 || _852;
        bool _856 = isnan(0.0);
        bool _858 = _854 || _856;
        if (_798)
        {
            _768 = _752;
        }
        float _860 = _768;
        if (!_808)
        {
            _784 = 4.0;
        }
        float _862 = _784;
        if (_818)
        {
            _770 = _756;
        }
        float _864 = _770;
        if (!_798)
        {
            _422 = 4.0;
        }
        float _866 = _422;
        if (_828)
        {
            _772 = _754;
        }
        float _868 = _772;
        if (!_818)
        {
            _774 = 4.0;
        }
        float _870 = _774;
        if (!_808)
        {
            float2 _2485 = float2(_738, _598);
            float _872 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2485, float2(0.0), isnan(_2485)), level(_862)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2485, float2(0.0), isnan(_2485)), level(_862)).x;
            _776 = _872;
        }
        float _874 = _776;
        float _876 = _860;
        if (!_798)
        {
            float2 _2501 = float2(_734, _742);
            float _878 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2501, float2(0.0), isnan(_2501)), level(_866)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2501, float2(0.0), isnan(_2501)), level(_866)).x;
            _876 = _878;
        }
        float _880 = _876;
        if (!_838)
        {
            _520 = 4.0;
        }
        float _882 = _520;
        if (!_828)
        {
            _778 = 4.0;
        }
        float _884 = _778;
        float _886 = _864;
        if (!_818)
        {
            float2 _2527 = float2(_738, _742);
            float _888 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2527, float2(0.0), isnan(_2527)), level(_870)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2527, float2(0.0), isnan(_2527)), level(_870)).x;
            _886 = _888;
        }
        float _890 = _886;
        float _892 = _750;
        if (!_838)
        {
            float2 _2543 = float2(_734, _740);
            float _894 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2543, float2(0.0), isnan(_2543)), level(_882)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2543, float2(0.0), isnan(_2543)), level(_882)).x;
            _892 = _894;
        }
        float _896 = _892;
        float _898 = _868;
        if (!_828)
        {
            float2 _2559 = float2(_738, _740);
            float _900 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2559, float2(0.0), isnan(_2559)), level(_884)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2559, float2(0.0), isnan(_2559)), level(_884)).x;
            _898 = _900;
        }
        float _902 = _898;
        if (!_848)
        {
            _642 = 4.0;
        }
        float _904 = _642;
        if (!_858)
        {
            _644 = 4.0;
        }
        float _906 = _644;
        float _908 = _746;
        if (!_848)
        {
            float2 _2585 = float2(_596, _740);
            float _910 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2585, float2(0.0), isnan(_2585)), level(_904)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2585, float2(0.0), isnan(_2585)), level(_904)).x;
            _908 = _910;
        }
        float _912 = _908;
        float _914 = _748;
        if (!_858)
        {
            float2 _2601 = float2(_596, _742);
            float _916 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_2601, float2(0.0), isnan(_2601)), level(_906)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_2601, float2(0.0), isnan(_2601)), level(_906)).x;
            _914 = _916;
        }
        float _918 = _914;
        float _920 = -_788;
        float _922 = _658 + _920;
        float _924 = -_880;
        float _926 = _658 + _924;
        float _928 = -_874;
        float _930 = _658 + _928;
        float _932 = abs(_922);
        float _934 = abs(_930);
        float _936 = precise::max(_932, _934);
        float _938 = -_890;
        float _940 = _658 + _938;
        float _942 = -_896;
        float _944 = _658 + _942;
        float _946 = -_902;
        float _948 = _658 + _946;
        float _950 = abs(_944);
        float _952 = abs(_926);
        float _954 = precise::max(_950, _952);
        float _956 = -_912;
        float _958 = _658 + _956;
        float _960 = abs(_948);
        float _962 = abs(_940);
        float _964 = precise::max(_960, _962);
        float _966 = -_918;
        float _968 = _658 + _966;
        float _970 = precise::max(_954, _964);
        float _972 = abs(_958);
        float _974 = abs(_968);
        float _976 = precise::max(_972, _974);
        bool _978 = _970 > 0.00150000001303851604461669921875;
        float _980 = precise::max(_936, _976);
        bool _982 = _980 > 0.00150000001303851604461669921875;
        bool _984 = _982 || _978;
        bool _986 = !_984;
        int _988 = _986 ? as_type<int>(_662) : 0;
        _722 = _988;
    }
    int _990 = _722;
    int _992 = _148 + 4;
    int _994 = _148 + 8;
    uint _996 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_996)] = uint(_990);
    uint _998 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_998)] = as_type<uint>(_414);
    uint _1000 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1000)] = as_type<uint>(_410);
    uint _1002 = uint(int(uint(_994) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1002)] = as_type<uint>(_412);
    uint _1004 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1004)] = as_type<uint>(_692);
    uint _1006 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1006)] = as_type<uint>(_694);
    uint _1008 = uint(int(uint(_994) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1008)] = as_type<uint>(_696);
    uint _1010 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1010)] = as_type<uint>(_408);
    uint _1012 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1012)] = as_type<uint>(_404);
    uint _1014 = uint(int(uint(_994) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1014)] = as_type<uint>(_406);
    float _1016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1018 = _404 * _404;
    float _1020 = _694 * _694;
    float _1022 = fma(_408, _408, _1018);
    float _1024 = fma(_692, _692, _1020);
    float _1026 = fma(_406, _406, _1022);
    float _1028 = fma(_696, _696, _1024);
    float _1030 = sqrt(_1028);
    float _1032 = sqrt(_1026);
    bool _1034 = _1032 >= 9.9999999747524270787835121154785e-07;
    bool _1036 = isnan(_1032);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(9.9999999747524270787835121154785e-07);
    bool _1042 = _1038 || _1040;
    float _1044 = _1032;
    int _1060;
    if (!_1042)
    {
        bool _1046 = _602 != _606;
        bool _1048 = isnan(_602);
        bool _1050 = _1046 || _1048;
        bool _1052 = isnan(_606);
        bool _1054 = _1050 || _1052;
        if (_1054)
        {
            _424 = as_type<int>(_700);
        }
        int _1056 = _424;
        int _1058 = _1056;
        _1060 = _1056;
        _1062 = _1054;
        if (!_1062)
        {
            float _1064 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _1066 = _1064 > 0.0;
            bool _1068 = !_1066;
            if (!_1068)
            {
                float _1070 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _1072 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _1074 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _1076 = _1072 * _1072;
                float _1078 = fma(_1070, _1070, _1076);
                float _1080 = fma(_1074, _1074, _1078);
                float _1082 = rsqrt(_1080);
                float _1084 = _1082 * 9.9999999747524270787835121154785e-07;
                float _1086 = _1070 * _1084;
                float _1088 = _1072 * _1084;
                float _1090 = _1074 * _1084;
                _1060 = as_type<int>(_1086);
                _730 = as_type<int>(_1088);
                _732 = as_type<int>(_1090);
                _1062 = true;
            }
            else
            {
                bool _1092 = _1030 >= 9.9999999747524270787835121154785e-07;
                bool _1094 = isnan(_1030);
                bool _1096 = _1092 || _1094;
                bool _1098 = isnan(9.9999999747524270787835121154785e-07);
                bool _1100 = _1096 || _1098;
                if (!_1100)
                {
                    float _1102 = _410 * _410;
                    float _1104 = fma(_414, _414, _1102);
                    float _1106 = fma(_412, _412, _1104);
                    float _1108 = sqrt(_1106);
                    bool _1110 = _1108 >= 9.9999999747524270787835121154785e-07;
                    bool _1112 = isnan(_1108);
                    bool _1114 = _1110 || _1112;
                    bool _1116 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1118 = _1114 || _1116;
                    int _1120 = as_type<int>(_712);
                    int _1122 = as_type<int>(_1108);
                    if (_1118)
                    {
                        float _1124 = rsqrt(_1106);
                        _1120 = as_type<int>(_1124);
                    }
                    int _1126 = _1120;
                    if (!_1118)
                    {
                        _1058 = 0;
                    }
                    int _1128 = _1058;
                    int _1130 = _1128;
                    if (!_1118)
                    {
                        _1122 = 897988541;
                    }
                    int _1132 = _1122;
                    int _1134 = _1126;
                    int _1136 = _1132;
                    if (_1118)
                    {
                        float _1138 = as_type<float>(_1126) * 9.9999999747524270787835121154785e-07;
                        _1044 = _1138;
                    }
                    float _1140 = _1044;
                    if (!_1118)
                    {
                        _1134 = 0;
                    }
                    int _1142 = _1134;
                    int _1144 = _1142;
                    if (_1118)
                    {
                        float _1146 = _414 * _1140;
                        _1130 = as_type<int>(_1146);
                    }
                    int _1148 = _1130;
                    _1060 = _1148;
                    if (_1118)
                    {
                        float _1150 = _410 * _1140;
                        _1136 = as_type<int>(_1150);
                    }
                    int _1152 = _1136;
                    _730 = _1152;
                    if (_1118)
                    {
                        float _1154 = _412 * _1140;
                        _1144 = as_type<int>(_1154);
                    }
                    int _1156 = _1144;
                    _732 = _1156;
                    _1062 = true;
                }
                else
                {
                    float _1158 = rsqrt(_1028);
                    float _1160 = _1158 * 9.9999999747524270787835121154785e-07;
                    float _1162 = _692 * _1160;
                    float _1164 = _694 * _1160;
                    float _1166 = _696 * _1160;
                    _1060 = as_type<int>(_1162);
                    _730 = as_type<int>(_1164);
                    _732 = as_type<int>(_1166);
                    _1062 = true;
                }
            }
        }
    }
    else
    {
        float _1168 = _1030 * _1016;
        bool _1170 = _1168 >= 0.001000000047497451305389404296875;
        bool _1172 = isnan(_1168);
        bool _1174 = _1170 || _1172;
        bool _1176 = isnan(0.001000000047497451305389404296875);
        bool _1178 = _1174 || _1176;
        bool _1180 = _1168 > 0.0;
        bool _1182 = !_1178;
        bool _1184 = _1180 && _1182;
        bool _1186 = _1032 < 0.001000000047497451305389404296875;
        bool _1188 = _1186 && _1184;
        if (!_1188)
        {
            _726 = as_type<int>(_404);
        }
        int _1190 = _726;
        int _1192 = _1190;
        if (_1188)
        {
            float _1194 = _692 * _1016;
            _426 = as_type<int>(_1194);
        }
        int _1196 = _426;
        _1060 = _1196;
        if (!_1188)
        {
            _728 = as_type<int>(_406);
        }
        int _1198 = _728;
        _732 = _1198;
        if (_1188)
        {
            float _1200 = _694 * _1016;
            _1192 = as_type<int>(_1200);
        }
        int _1202 = _1192;
        _730 = _1202;
        if (_1188)
        {
            float _1204 = _696 * _1016;
            _732 = as_type<int>(_1204);
        }
    }
    _1062 = false;
    int _1206 = _1060;
    int _1208 = _730;
    int _1210 = _732;
    uint _1212 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1212)] = uint(_1206);
    uint _1214 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1214)] = uint(_1208);
    uint _1216 = uint(int(uint(_994) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1216)] = uint(_1210);
}

