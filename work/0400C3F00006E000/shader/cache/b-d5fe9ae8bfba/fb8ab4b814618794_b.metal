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
    bool _796 = false;
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
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
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
    if (_204)
    {
        uint _240 = uint(int(uint(_148) >> uint(2)));
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_240)]);
        int _244 = _148 + 4;
        uint _246 = uint(int(uint(_244) >> uint(2)));
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_246)]);
        int _250 = _148 + 8;
        uint _252 = uint(int(uint(_250) >> uint(2)));
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_252)]);
        _234 = _242;
        _236 = _248;
        _238 = _254;
    }
    float _256 = _234;
    float _258 = _236;
    float _260 = _238;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = 0.0;
    float _268 = 0.0;
    if (_200)
    {
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _262 = _270;
        _264 = _272;
        _266 = _274;
        _268 = _276;
    }
    float _278 = _262;
    float _280 = _264;
    float _282 = _266;
    float _284 = _268;
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
    float _316 = 0.0;
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
        _316 = _330;
        _318 = _336;
        _320 = _342;
    }
    float _344 = _314;
    float _346 = _316;
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
    float _406 = _162 * _402;
    float _408 = _190 + _404;
    float _410 = _184 + _406;
    float _412 = _174 * _402;
    float _414 = _196 + _412;
    float _416 = _402;
    float _418 = _180;
    float _420 = _184;
    float _422 = _196;
    if (!_200)
    {
        _416 = 0.0;
    }
    float _424 = _416;
    float _426 = _424;
    if (!_200)
    {
        _418 = 0.0;
    }
    float _428 = _418;
    float _430 = _256;
    float _432 = _310;
    float _434 = _384;
    float _436 = _260;
    float _438 = _278;
    float _440 = _344;
    float _442 = _308;
    float _444 = _312;
    float _446 = _348;
    float _448 = _386;
    float _450 = _428;
    if (_200)
    {
        float _452 = _408 * _228;
        _420 = _452;
    }
    float _454 = _420;
    float _456 = _454;
    if (_200)
    {
        float _458 = fma(_410, _226, _454);
        _456 = _458;
    }
    float _460 = _456;
    float _462 = _460;
    if (_200)
    {
        float _464 = fma(_414, _230, _460);
        _462 = _464;
    }
    float _466 = _462;
    float _468 = _466;
    if (_200)
    {
        float _470 = _232 + _466;
        _426 = _470;
    }
    float _472 = _426;
    if (_204)
    {
        float _474 = _408 * _258;
        _468 = _474;
    }
    float _476 = _468;
    if (_200)
    {
        float _478 = _408 * _280;
        _422 = _478;
    }
    float _480 = _422;
    if (_204)
    {
        float _482 = fma(_410, _256, _476);
        _430 = _482;
    }
    float _484 = _430;
    float _486 = _484;
    if (_204)
    {
        float _488 = _408 * _310;
        _432 = _488;
    }
    float _490 = _432;
    float _492 = _490;
    if (_208)
    {
        float _494 = _408 * _384;
        _434 = _494;
    }
    float _496 = _434;
    float _498 = _496;
    if (_204)
    {
        float _500 = fma(_414, _260, _484);
        _486 = _500;
    }
    float _502 = _486;
    float _504 = _502;
    if (_208)
    {
        float _506 = _408 * _346;
        _436 = _506;
    }
    float _508 = _436;
    if (_200)
    {
        float _510 = fma(_410, _278, _480);
        _438 = _510;
    }
    float _512 = _438;
    float _514 = _512;
    if (_204)
    {
        float _516 = fma(_410, _308, _490);
        _492 = _516;
    }
    float _518 = _492;
    if (_208)
    {
        float _520 = fma(_410, _382, _496);
        _498 = _520;
    }
    float _522 = _498;
    if (_208)
    {
        float _524 = fma(_410, _344, _508);
        _440 = _524;
    }
    float _526 = _440;
    float _528 = _526;
    if (!_204)
    {
        _442 = _472;
    }
    float _530 = _442;
    float _532 = _530;
    if (_200)
    {
        float _534 = fma(_414, _282, _512);
        _514 = _534;
    }
    float _536 = _514;
    if (_204)
    {
        float _538 = _394 + _502;
        _532 = _538;
    }
    float _540 = _532;
    if (_204)
    {
        float _542 = fma(_414, _312, _518);
        _444 = _542;
    }
    float _544 = _444;
    if (_208)
    {
        float _546 = fma(_414, _348, _526);
        _446 = _546;
    }
    float _548 = _446;
    if (_208)
    {
        float _550 = fma(_414, _386, _522);
        _448 = _550;
    }
    float _552 = _448;
    if (_200)
    {
        float _554 = _284 + _536;
        _450 = _554;
    }
    float _556 = _450;
    float _558 = _556;
    if (_204)
    {
        float _560 = _400 + _544;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = _562;
    if (!_208)
    {
        _528 = _540;
    }
    float _566 = _528;
    float _568 = _566;
    if (_208)
    {
        float _570 = _350 + _548;
        _568 = _570;
    }
    float _572 = _568;
    int _574 = as_type<int>(_572);
    if (_208)
    {
        float _576 = _388 + _552;
        _564 = _576;
    }
    float _578 = _564;
    float _580 = fma(_572, 6.2500002968590706586837768554688e-05, 0.5);
    float _582 = fma(_578, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1733 = float2(_580, _582);
    float2 _586 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_1733, float2(0.0), isnan(_1733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_1733, float2(0.0), isnan(_1733)), level(0.0)).xy;
    float _588 = _586.x;
    float _590 = _586.y;
    float _592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _594 = uint(int(uint(_152) >> uint(2)));
    float _596 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_594)]);
    float _598 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _600 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _602 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _604 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _606 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    bool _608 = _588 != 0.0;
    bool _610 = isnan(_588);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -_596;
    float _620 = _592 + _618;
    bool _622 = _620 > 0.001000000047497451305389404296875;
    bool _624 = isnan(_620);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.001000000047497451305389404296875);
    bool _630 = _626 || _628;
    float _632 = _620;
    if (_616)
    {
        _632 = _590;
    }
    float _634 = _632;
    if (!_616)
    {
        _504 = 4.0;
    }
    float _636 = _504;
    if (!_630)
    {
        _574 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[41].x);
    }
    int _638 = _574;
    float _640 = _634;
    if (!_616)
    {
        float2 _1832 = float2(_580, _582);
        float _642 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_1832, float2(0.0), isnan(_1832)), level(_636)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_1832, float2(0.0), isnan(_1832)), level(_636)).y;
        _640 = _642;
    }
    float _644 = _640;
    uint _646 = uint(int(uint(_152) >> uint(2)));
    float _648 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_646)]);
    float _650 = abs(_598);
    float _652 = log2(_650);
    int _654 = _638;
    if (!_630)
    {
        float _656 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[76]);
        _654 = as_type<int>(_656);
    }
    int _658 = _654;
    float _660 = _154 * _606;
    float _662 = _154 * _652;
    float _664 = exp2(_662);
    float _666 = _602 * _660;
    float _668 = _600 * _660;
    float _670 = _604 * _660;
    int _672 = _148 + 4;
    int _674 = _148 + 8;
    float _676 = fma(_162, _664, _668);
    float _678 = fma(_168, _664, _666);
    float _680 = fma(_174, _664, _670);
    int _682 = _658;
    if (!_630)
    {
        float _684 = fma(_644, 2000.0, as_type<float>(_658));
        _682 = as_type<int>(_684);
    }
    int _686 = _682;
    uint _688 = uint(int(uint(_148) >> uint(2)));
    float _690 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_688)]);
    int _692 = _148 + 4;
    uint _694 = uint(int(uint(_692) >> uint(2)));
    float _696 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_694)]);
    int _698 = _148 + 8;
    uint _700 = uint(int(uint(_698) >> uint(2)));
    float _702 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_700)]);
    int _704 = _148 + 12;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    float _708 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_706)]);
    if (!_630)
    {
        uint _710 = uint(int(uint(_672) >> uint(2)));
        (*spvDescriptorSet0.cp_s9)._m0[int(_710)] = uint(_686);
    }
    uint _712 = uint(int(uint(_152) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_712)] = as_type<uint>(_648);
    uint _714 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_714)] = as_type<uint>(_410);
    uint _716 = uint(int(uint(_672) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_716)] = as_type<uint>(_408);
    uint _718 = uint(int(uint(_674) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_718)] = as_type<uint>(_414);
    uint _720 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_720)] = as_type<uint>(_676);
    uint _722 = uint(int(uint(_672) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_722)] = as_type<uint>(_678);
    uint _724 = uint(int(uint(_674) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_724)] = as_type<uint>(_680);
    uint _726 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_726)] = as_type<uint>(_406);
    uint _728 = uint(int(uint(_672) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_728)] = as_type<uint>(_404);
    uint _730 = uint(int(uint(_674) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_730)] = as_type<uint>(_412);
    float _732 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _734 = _404 * _404;
    float _736 = fma(_406, _406, _734);
    float _738 = fma(_412, _412, _736);
    float _740 = sqrt(_738);
    float _742 = _678 * _678;
    float _744 = fma(_676, _676, _742);
    float _746 = fma(_680, _680, _744);
    float _748 = sqrt(_746);
    bool _750 = _740 >= 9.9999999747524270787835121154785e-07;
    bool _752 = isnan(_740);
    bool _754 = _750 || _752;
    bool _756 = isnan(9.9999999747524270787835121154785e-07);
    bool _758 = _754 || _756;
    int _760 = as_type<int>(_708);
    int _762 = as_type<int>(_690);
    int _764 = as_type<int>(_696);
    float _766 = _740;
    int _768 = as_type<int>(_708);
    int _770 = as_type<int>(_696);
    int _772 = as_type<int>(_690);
    int _774 = as_type<int>(_696);
    int _790;
    int _794;
    if (!_758)
    {
        bool _776 = _592 != _596;
        bool _778 = isnan(_592);
        bool _780 = _776 || _778;
        bool _782 = isnan(_596);
        bool _784 = _780 || _782;
        if (_784)
        {
            _760 = as_type<int>(_690);
        }
        int _786 = _760;
        int _788 = _786;
        _790 = _786;
        if (_784)
        {
            _762 = as_type<int>(_702);
        }
        int _792 = _762;
        _794 = _792;
        _796 = _784;
        if (!_796)
        {
            float _798 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _800 = _798 > 0.0;
            bool _802 = !_800;
            if (!_802)
            {
                float _804 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _806 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _808 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _810 = _806 * _806;
                float _812 = fma(_804, _804, _810);
                float _814 = fma(_808, _808, _812);
                float _816 = rsqrt(_814);
                float _818 = _816 * 9.9999999747524270787835121154785e-07;
                float _820 = _804 * _818;
                float _822 = _806 * _818;
                float _824 = _808 * _818;
                _790 = as_type<int>(_820);
                _774 = as_type<int>(_822);
                _794 = as_type<int>(_824);
                _796 = true;
            }
            else
            {
                bool _826 = _748 >= 9.9999999747524270787835121154785e-07;
                bool _828 = isnan(_748);
                bool _830 = _826 || _828;
                bool _832 = isnan(9.9999999747524270787835121154785e-07);
                bool _834 = _830 || _832;
                if (!_834)
                {
                    float _836 = _408 * _408;
                    float _838 = fma(_410, _410, _836);
                    float _840 = fma(_414, _414, _838);
                    float _842 = sqrt(_840);
                    bool _844 = _842 >= 9.9999999747524270787835121154785e-07;
                    bool _846 = isnan(_842);
                    bool _848 = _844 || _846;
                    bool _850 = isnan(9.9999999747524270787835121154785e-07);
                    bool _852 = _848 || _850;
                    int _854 = as_type<int>(_842);
                    if (_852)
                    {
                        float _856 = rsqrt(_840);
                        _854 = as_type<int>(_856);
                    }
                    int _858 = _854;
                    if (!_852)
                    {
                        _788 = 0;
                    }
                    int _860 = _788;
                    int _862 = _860;
                    if (!_852)
                    {
                        _764 = 897988541;
                    }
                    int _864 = _764;
                    int _866 = _858;
                    int _868 = _864;
                    if (_852)
                    {
                        float _870 = as_type<float>(_858) * 9.9999999747524270787835121154785e-07;
                        _766 = _870;
                    }
                    float _872 = _766;
                    if (!_852)
                    {
                        _866 = 0;
                    }
                    int _874 = _866;
                    int _876 = _874;
                    if (_852)
                    {
                        float _878 = _410 * _872;
                        _862 = as_type<int>(_878);
                    }
                    int _880 = _862;
                    _790 = _880;
                    if (_852)
                    {
                        float _882 = _408 * _872;
                        _868 = as_type<int>(_882);
                    }
                    int _884 = _868;
                    _774 = _884;
                    if (_852)
                    {
                        float _886 = _414 * _872;
                        _876 = as_type<int>(_886);
                    }
                    int _888 = _876;
                    _794 = _888;
                    _796 = true;
                }
                else
                {
                    float _890 = rsqrt(_746);
                    float _892 = _890 * 9.9999999747524270787835121154785e-07;
                    float _894 = _676 * _892;
                    float _896 = _678 * _892;
                    float _898 = _680 * _892;
                    _790 = as_type<int>(_894);
                    _774 = as_type<int>(_896);
                    _794 = as_type<int>(_898);
                    _796 = true;
                }
            }
        }
    }
    else
    {
        float _900 = _748 * _732;
        bool _902 = _900 >= 0.001000000047497451305389404296875;
        bool _904 = isnan(_900);
        bool _906 = _902 || _904;
        bool _908 = isnan(0.001000000047497451305389404296875);
        bool _910 = _906 || _908;
        bool _912 = _900 > 0.0;
        bool _914 = !_910;
        bool _916 = _912 && _914;
        bool _918 = _740 < 0.001000000047497451305389404296875;
        bool _920 = _918 && _916;
        if (!_920)
        {
            _768 = as_type<int>(_406);
        }
        int _922 = _768;
        int _924 = _922;
        if (_920)
        {
            float _926 = _676 * _732;
            _924 = as_type<int>(_926);
        }
        int _928 = _924;
        _790 = _928;
        if (!_920)
        {
            _770 = as_type<int>(_404);
        }
        int _930 = _770;
        int _932 = _930;
        if (_920)
        {
            float _934 = _678 * _732;
            _932 = as_type<int>(_934);
        }
        int _936 = _932;
        _774 = _936;
        if (!_920)
        {
            _772 = as_type<int>(_412);
        }
        int _938 = _772;
        _794 = _938;
        if (_920)
        {
            float _940 = _680 * _732;
            _794 = as_type<int>(_940);
        }
    }
    _796 = false;
    int _942 = _790;
    int _944 = _774;
    int _946 = _794;
    uint _948 = uint(int(uint(_148) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_948)] = uint(_942);
    uint _950 = uint(int(uint(_672) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_950)] = uint(_944);
    uint _952 = uint(int(uint(_674) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_952)] = uint(_946);
}

