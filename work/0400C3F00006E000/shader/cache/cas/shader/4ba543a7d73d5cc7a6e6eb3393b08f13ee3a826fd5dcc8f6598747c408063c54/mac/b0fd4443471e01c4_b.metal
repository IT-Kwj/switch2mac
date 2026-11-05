#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    device _21* cp_s13 [[id(13)]];
    texture2d_array<float> cp_t_tcb_16 [[id(14)]];
    sampler cp_t_tcb_16Smplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d<float> cp_t_tcb_2A [[id(18)]];
    sampler cp_t_tcb_2ASmplr [[id(19)]];
    texture2d<float> cp_t_tcb_2C [[id(20)]];
    sampler cp_t_tcb_2CSmplr [[id(21)]];
    sampler cp_t_tcb_14Smplr_w [[id(22)]];
    sampler cp_t_tcb_2ASmplr_w [[id(23)]];
    sampler cp_t_tcb_2CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3550 = false;
    bool _3386 = false;
    bool _2624 = false;
    bool _804 = false;
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _82 = as_type<float>(gl_LocalInvocationID.x);
    float _84 = as_type<float>(gl_WorkGroupID.x);
    int _87 = as_type<int>(_84) << 5;
    int _89 = _87 + as_type<int>(_82);
    float _91 = trunc(_80);
    int _93 = int(_91);
    bool _97 = _89 >= _93;
    int _99 = 0;
    if (_97)
    {
        _99 = 0;
    }
    int _101 = _99;
    int _103 = _101;
    int _105 = _101;
    if (!_97)
    {
        int _107 = _89 << 4;
        int _109 = _107 + 12;
        uint _112 = uint(int(uint(_109) >> uint(2)));
        float _114 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_112)]);
        float _116 = trunc(_114);
        int _118 = int(_116);
        bool _120 = _118 >= 1;
        int _122 = _120 ? (-1) : 0;
        if (!_120)
        {
            _103 = 0;
        }
        int _124 = _103;
        bool _126 = !_120;
        _105 = _124;
        if (!_126)
        {
            float _128 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _130 = uint(int(uint(_109) >> uint(2)));
            float _132 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_130)]);
            float _134 = float(_118);
            float _136 = -_132;
            float _138 = _128 + _136;
            bool _140 = _138 > _134;
            int _142 = as_type<int>(_128);
            if (!_140)
            {
                bool _144 = _128 >= _132;
                bool _146 = isnan(_128);
                bool _148 = _144 || _146;
                bool _150 = isnan(_132);
                bool _152 = _148 || _150;
                _122 = _152 ? (-1) : 0;
            }
            int _154 = _122;
            if (_140)
            {
                _142 = 0;
            }
            int _156 = _142;
            _105 = _156;
            if (!_140)
            {
                int _158 = ~_154;
                int _160 = (_158 != 0) ? 0 : 1;
                _105 = _160;
            }
        }
    }
    int _162 = _105;
    int _164 = _162 & 1;
    bool _166 = _164 != 0;
    if (!_166)
    {
        return;
    }
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _170 = _89 << 4;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_172)]);
    int _176 = _170 + 4;
    uint _178 = uint(int(uint(_176) >> uint(2)));
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_178)]);
    int _182 = _170 + 8;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_184)]);
    int _188 = as_type<int>(_168) & 512;
    bool _190 = _188 != 0;
    int _192 = _170 + 12;
    uint _194 = uint(int(uint(_170) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_194)]);
    int _198 = _170 + 4;
    uint _200 = uint(int(uint(_198) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    int _204 = _170 + 8;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    int _210 = _170 + 12;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    uint _216 = uint(int(uint(_170) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    int _220 = _170 + 4;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_222)]);
    int _226 = _170 + 8;
    uint _228 = uint(int(uint(_226) >> uint(2)));
    float _230 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_228)]);
    float _232 = 0.0;
    float _234 = 0.0;
    float _236 = 0.0;
    bool _238 = _190;
    float _240 = _168;
    if (_190)
    {
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _232 = _242;
        _234 = _244;
        _236 = _246;
    }
    float _248 = _232;
    float _250 = _234;
    float _252 = _236;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_190)
    {
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _254 = _260;
        _256 = _262;
        _258 = _264;
    }
    float _266 = _254;
    float _268 = _256;
    float _270 = _258;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = 0.0;
    if (_190)
    {
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _272 = _278;
        _274 = _280;
        _276 = _282;
    }
    float _284 = _272;
    float _286 = _274;
    float _288 = _276;
    uint _290 = uint(int(uint(_170) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_290)]);
    uint _294 = uint(int(uint(_192) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_294)]);
    uint _298 = uint(int(uint(_192) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_298)]);
    float _302 = _248;
    float _304 = _266;
    float _306 = _250;
    float _308 = _268;
    float _310 = _252;
    float _312 = _270;
    float _314 = _284;
    float _316 = _286;
    float _318 = _288;
    float _320 = _214;
    float _322 = _196;
    float _324 = _202;
    float _326 = _208;
    int _328 = as_type<int>(_218);
    int _330 = as_type<int>(_224);
    int _332 = as_type<int>(_230);
    int _334 = as_type<int>(_218);
    int _336 = as_type<int>(_224);
    int _338 = as_type<int>(_230);
    int _340 = as_type<int>(_218);
    int _342 = as_type<int>(_224);
    int _344 = as_type<int>(_230);
    if (!_190)
    {
        int _346 = _170 + 4;
        uint _348 = uint(int(uint(_170) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_348)]);
        int _352 = _170 + 8;
        uint _354 = uint(int(uint(_170) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_346) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_352) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_362)]);
        uint _366 = uint(int(uint(_346) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_366)]);
        uint _370 = uint(int(uint(_352) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_370)]);
        uint _374 = uint(int(uint(_170) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_374)]);
        uint _378 = uint(int(uint(_346) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_378)]);
        uint _382 = uint(int(uint(_352) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_382)]);
        float _386 = _350 * _350;
        float _388 = fma(_356, _356, _386);
        float _390 = _360 * _360;
        float _392 = _364 * _364;
        float _394 = fma(_368, _368, _390);
        float _396 = fma(_372, _372, _392);
        float _398 = fma(_376, _376, _388);
        float _400 = fma(_380, _380, _394);
        float _402 = sqrt(_398);
        float _404 = fma(_384, _384, _396);
        float _406 = sqrt(_400);
        float _408 = sqrt(_404);
        bool _410 = _402 > 0.0;
        bool _412 = _406 > 0.0;
        bool _414 = _408 > 0.0;
        float _416 = _396;
        float _418 = _394;
        float _420 = _388;
        float _422 = _402;
        float _424 = _406;
        float _426 = _408;
        float _428 = _398;
        float _430 = _360;
        float _432 = _376;
        float _434 = _400;
        if (_410)
        {
            float _436 = rsqrt(_398);
            _416 = _436;
        }
        float _438 = _416;
        float _440 = 0.0;
        if (_412)
        {
            float _442 = rsqrt(_400);
            _440 = _442;
        }
        float _444 = _440;
        float _446 = 0.0;
        if (_414)
        {
            float _448 = rsqrt(_404);
            _446 = _448;
        }
        float _450 = _446;
        if (!_410)
        {
            _418 = 0.0;
        }
        float _452 = _418;
        float _454 = _452;
        if (_410)
        {
            float _456 = _376 * _438;
            _454 = _456;
        }
        float _458 = _454;
        _314 = _458;
        if (!_412)
        {
            _420 = 0.0;
        }
        float _460 = _420;
        float _462 = _460;
        if (!_410)
        {
            _422 = 0.0;
        }
        float _464 = _422;
        float _466 = _464;
        if (_410)
        {
            float _468 = _350 * _438;
            _466 = _468;
        }
        float _470 = _466;
        _304 = _470;
        if (!_410)
        {
            _424 = 0.0;
        }
        float _472 = _424;
        float _474 = _472;
        if (_412)
        {
            float _476 = _360 * _444;
            _462 = _476;
        }
        float _478 = _462;
        _308 = _478;
        if (!_412)
        {
            _426 = 0.0;
        }
        float _480 = _426;
        float _482 = _480;
        if (_410)
        {
            float _484 = _356 * _438;
            _474 = _484;
        }
        float _486 = _474;
        _302 = _486;
        if (!_412)
        {
            _428 = 0.0;
        }
        float _488 = _428;
        float _490 = _488;
        if (_412)
        {
            float _492 = _368 * _444;
            _482 = _492;
        }
        float _494 = _482;
        _306 = _494;
        if (!_414)
        {
            _430 = 0.0;
        }
        float _496 = _430;
        float _498 = _496;
        if (_412)
        {
            float _500 = _380 * _444;
            _490 = _500;
        }
        float _502 = _490;
        _316 = _502;
        if (!_414)
        {
            _432 = 0.0;
        }
        float _504 = _432;
        float _506 = _504;
        if (_414)
        {
            float _508 = _364 * _450;
            _498 = _508;
        }
        float _510 = _498;
        _312 = _510;
        if (!_414)
        {
            _434 = 0.0;
        }
        float _512 = _434;
        _318 = _512;
        if (_414)
        {
            float _514 = _372 * _450;
            _506 = _514;
        }
        float _516 = _506;
        _310 = _516;
        if (_414)
        {
            float _518 = _384 * _450;
            _318 = _518;
        }
    }
    float _520 = _302;
    float _522 = _304;
    float _524 = _306;
    float _526 = _308;
    float _528 = _310;
    float _530 = _312;
    float _532 = _314;
    float _534 = _316;
    float _536 = _318;
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _568 = uint(int(uint(_192) >> uint(2)));
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_568)]);
    bool _572 = _540 > 0.0;
    float _574 = abs(_538);
    float _576 = log2(_574);
    bool _578 = _542 > 0.0;
    float _580 = 0.0;
    float _582 = _548;
    float _584 = _552;
    float _586 = _554;
    float _588 = _558;
    float _590 = _560;
    float _592 = _562;
    float _594 = _564;
    float _596 = _566;
    if (_572)
    {
        float _598 = 1.0 / _540;
        _580 = _598;
    }
    float _600 = _580;
    float _602 = -_300;
    float _604 = _546 + _602;
    float _606 = _544 * _576;
    float _608 = _548 * _542;
    float _610 = exp2(_606);
    float _612 = _600;
    if (_572)
    {
        float _614 = _604 * _600;
        _320 = _614;
    }
    float _616 = _320;
    float _618 = _616;
    if (_578)
    {
        float _620 = -_608;
        float _622 = fma(_292, _620, _548);
        _582 = _622;
    }
    float _624 = _582;
    float _626 = _544 * _550;
    float _628 = _624;
    if (_572)
    {
        float _630 = precise::min(_616, 1.0);
        _612 = _630;
    }
    float _632 = _612;
    float _634 = _552 * _626;
    float _636 = _554 * _626;
    if (_572)
    {
        float _638 = _632 * _624;
        _628 = _638;
    }
    float _640 = _628;
    float _642 = _296 * _544;
    float _644 = _556 * _626;
    float _646 = _544 * _640;
    float _648 = fma(_196, _610, _634);
    float _650 = fma(_202, _610, _636);
    float _652 = fma(_196, _642, _174);
    float _654 = fma(_202, _642, _180);
    float _656 = _560 * _646;
    float _658 = _562 * _646;
    float _660 = fma(_208, _642, _186);
    float _662 = fma(_208, _610, _644);
    float _664 = _564 * _646;
    bool _666 = !_190;
    float _668 = _644;
    float _670 = _656;
    float _672 = _664;
    float _674 = _658;
    float _676 = _650;
    float _678 = _648;
    float _680 = _662;
    float _802;
    if (!_666)
    {
        float _682 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _684 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _700 = _686 * _688;
        float _702 = _686 * _690;
        float _704 = _684 * _688;
        float _706 = -_700;
        float _708 = fma(_682, _692, _706);
        float _710 = -_702;
        float _712 = fma(_684, _692, _710);
        float _714 = -_704;
        float _716 = fma(_682, _690, _714);
        float _718 = _696 * _682;
        float _720 = _696 * _708;
        float _722 = _698 * _684;
        float _724 = _694 * _690;
        float _726 = -_718;
        float _728 = fma(_694, _684, _726);
        float _730 = -_720;
        float _732 = fma(_694, _712, _730);
        float _734 = _696 * _692;
        float _736 = _698 * _688;
        float _738 = _694 * _686;
        float _740 = fma(_698, _716, _732);
        float _742 = -_734;
        float _744 = fma(_698, _690, _742);
        float _746 = -_736;
        float _748 = fma(_694, _692, _746);
        float _750 = -_724;
        float _752 = fma(_696, _688, _750);
        float _754 = -_738;
        float _756 = fma(_698, _682, _754);
        float _758 = -_682;
        float _760 = fma(_758, _692, _700);
        float _762 = 1.0 / _740;
        float _764 = -_722;
        float _766 = fma(_696, _686, _764);
        float _768 = _744 * _762;
        float _770 = _748 * _762;
        float _772 = _752 * _762;
        float _774 = _656 * _762;
        float _776 = _658 * _768;
        float _778 = _658 * _770;
        float _780 = _760 * _762;
        float _782 = _658 * _772;
        float _784 = _766 * _762;
        float _786 = _756 * _762;
        float _788 = fma(_712, _774, _776);
        float _790 = fma(_656, _780, _778);
        float _792 = _728 * _762;
        float _794 = fma(_716, _774, _782);
        float _796 = fma(_664, _784, _788);
        float _798 = fma(_664, _786, _790);
        float _800 = fma(_664, _792, _794);
        _322 = _786;
        _324 = _790;
        _326 = _788;
        _618 = _794;
        _584 = _694;
        _586 = _696;
        _668 = _698;
        _588 = _762;
        _590 = _774;
        _592 = _690;
        _594 = _692;
        _596 = _700;
        _802 = _798;
        _670 = _796;
        _672 = _800;
        _804 = true;
    }
    else
    {
        int _806 = as_type<int>(_168) & 1024;
        bool _808 = _806 != 0;
        if (_808)
        {
            _238 = true;
        }
        bool _810 = _238;
        bool _812 = _810;
        if (!_808)
        {
            int _814 = as_type<int>(_168) & 2048;
            bool _816 = _814 != 0;
            _812 = _816;
        }
        bool _818 = _812;
        if (!_818)
        {
            _240 = _658;
        }
        float _820 = _240;
        bool _822 = !_818;
        _802 = _820;
        if (!_822)
        {
            uint _824 = uint(int(uint(_170) >> uint(2)));
            float _826 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_824)]);
            int _828 = _170 + 4;
            uint _830 = uint(int(uint(_828) >> uint(2)));
            float _832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_830)]);
            int _834 = _170 + 8;
            uint _836 = uint(int(uint(_834) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_836)]);
            uint _840 = uint(int(uint(_170) >> uint(2)));
            float _842 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_840)]);
            int _844 = _170 + 4;
            uint _846 = uint(int(uint(_844) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_846)]);
            int _850 = _170 + 8;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_852)]);
            uint _856 = uint(int(uint(_170) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_856)]);
            int _860 = _170 + 4;
            uint _862 = uint(int(uint(_860) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_862)]);
            int _866 = _170 + 8;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_868)]);
            float _872 = _838 * _842;
            float _874 = _838 * _848;
            float _876 = _832 * _842;
            float _878 = -_872;
            float _880 = fma(_826, _854, _878);
            float _882 = -_874;
            float _884 = fma(_832, _854, _882);
            float _886 = -_876;
            float _888 = fma(_826, _848, _886);
            float _890 = _864 * _826;
            float _892 = _864 * _880;
            float _894 = _870 * _832;
            float _896 = _858 * _848;
            float _898 = -_890;
            float _900 = fma(_858, _832, _898);
            float _902 = -_892;
            float _904 = fma(_858, _884, _902);
            float _906 = _864 * _854;
            float _908 = _870 * _842;
            float _910 = _858 * _838;
            float _912 = fma(_870, _888, _904);
            float _914 = -_906;
            float _916 = fma(_870, _848, _914);
            float _918 = -_908;
            float _920 = fma(_858, _854, _918);
            float _922 = -_896;
            float _924 = fma(_864, _842, _922);
            float _926 = -_910;
            float _928 = fma(_870, _826, _926);
            float _930 = -_826;
            float _932 = fma(_930, _854, _872);
            float _934 = 1.0 / _912;
            float _936 = -_894;
            float _938 = fma(_864, _838, _936);
            float _940 = _916 * _934;
            float _942 = _920 * _934;
            float _944 = _924 * _934;
            float _946 = _656 * _934;
            float _948 = _658 * _940;
            float _950 = _658 * _942;
            float _952 = _932 * _934;
            float _954 = _658 * _944;
            float _956 = _938 * _934;
            float _958 = _928 * _934;
            float _960 = fma(_884, _946, _948);
            float _962 = fma(_656, _952, _950);
            float _964 = _900 * _934;
            float _966 = fma(_888, _946, _954);
            float _968 = fma(_664, _956, _960);
            float _970 = fma(_664, _958, _962);
            float _972 = fma(_664, _964, _966);
            _322 = _958;
            _324 = _962;
            _326 = _960;
            _618 = _966;
            _584 = _858;
            _586 = _864;
            _668 = _870;
            _588 = _934;
            _590 = _946;
            _592 = _848;
            _594 = _854;
            _596 = _872;
            _802 = _970;
            _670 = _968;
            _672 = _972;
        }
    }
    _804 = false;
    float _974 = _322;
    float _976 = _324;
    float _978 = _326;
    float _980 = _618;
    float _982 = _584;
    float _984 = _586;
    float _986 = _668;
    float _988 = _588;
    float _990 = _590;
    float _992 = _592;
    float _994 = _594;
    float _996 = _596;
    float _998 = _802;
    float _1000 = _670;
    float _1002 = _672;
    uint _1004 = uint(int(uint(_192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1004)] = as_type<uint>(_570);
    float _1006 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1008 = as_type<int>(_1006) & 512;
    bool _1010 = _1008 != 0;
    int _1012 = as_type<int>(_1006) & 1024;
    bool _1014 = _1012 != 0;
    float _1016 = _974;
    float _1018 = _976;
    float _1020 = _978;
    float _1022 = _980;
    float _1024 = _1002;
    float _1026 = _1000;
    if (_1010)
    {
        float _1028 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1030 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1032 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1016 = _1028;
        _1018 = _1030;
        _1020 = _1032;
        _1022 = _1034;
    }
    float _1036 = _1016;
    float _1038 = _1018;
    float _1040 = _1020;
    float _1042 = _1022;
    float _1044 = _982;
    float _1046 = _984;
    float _1048 = _986;
    float _1050 = _988;
    if (_1010)
    {
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1044 = _1052;
        _1046 = _1054;
        _1048 = _1056;
        _1050 = _1058;
    }
    float _1060 = _1044;
    float _1062 = _1046;
    float _1064 = _1048;
    float _1066 = _1050;
    float _1068 = _990;
    float _1070 = _992;
    float _1072 = _994;
    float _1074 = _996;
    if (_1010)
    {
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1068 = _1076;
        _1070 = _1078;
        _1072 = _1080;
        _1074 = _1082;
    }
    float _1084 = _1068;
    float _1086 = _1070;
    float _1088 = _1072;
    float _1090 = _1074;
    float _1092 = _654 + _998;
    float _1094 = _652 + _1000;
    float _1096 = _660 + _1002;
    float _1098 = 0.0;
    float _1100 = _1092;
    if (!_1010)
    {
        _674 = 0.0;
        _1098 = 0.0;
    }
    float _1102 = _674;
    float _1104 = _1098;
    float _1106 = _1102;
    float _1108 = _1104;
    if (!_1010)
    {
        _1024 = 0.0;
    }
    float _1110 = _1024;
    int _1112 = as_type<int>(_1006) & 2048;
    bool _1114 = _1112 != 0;
    float _1116 = _1036;
    float _1118 = _1110;
    if (_1010)
    {
        float _1120 = _1092 * _1038;
        _1026 = _1120;
    }
    float _1122 = _1026;
    float _1124 = _1062;
    float _1126 = _1086;
    float _1128 = _1084;
    float _1130 = _1064;
    if (_1010)
    {
        float _1132 = _1092 * _1062;
        _1124 = _1132;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    if (_1010)
    {
        float _1138 = fma(_1094, _1036, _1122);
        _1116 = _1138;
    }
    float _1140 = _1116;
    float _1142 = _1140;
    if (_1010)
    {
        float _1144 = _1092 * _1086;
        _1126 = _1144;
    }
    float _1146 = _1126;
    if (_1010)
    {
        float _1148 = fma(_1094, _1060, _1134);
        _1136 = _1148;
    }
    float _1150 = _1136;
    if (_1010)
    {
        float _1152 = fma(_1096, _1040, _1140);
        _1142 = _1152;
    }
    float _1154 = _1142;
    if (_1010)
    {
        float _1156 = fma(_1094, _1084, _1146);
        _1128 = _1156;
    }
    float _1158 = _1128;
    float _1160 = _1158;
    if (_1010)
    {
        float _1162 = fma(_1096, _1064, _1150);
        _1130 = _1162;
    }
    float _1164 = _1130;
    if (_1010)
    {
        float _1166 = _1042 + _1154;
        _1118 = _1166;
    }
    float _1168 = _1118;
    float _1170 = _1168;
    if (_1010)
    {
        float _1172 = fma(_1096, _1088, _1158);
        _1160 = _1172;
    }
    float _1174 = _1160;
    if (_1010)
    {
        float _1176 = _1066 + _1164;
        _1106 = _1176;
    }
    float _1178 = _1106;
    float _1180 = _1178;
    if (_1010)
    {
        float _1182 = _1090 + _1174;
        _1108 = _1182;
    }
    float _1184 = _1108;
    bool _1186 = !_1014;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1192 = uint(int(uint(_170) >> uint(2)));
        float _1194 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1192)]);
        int _1196 = _170 + 4;
        uint _1198 = uint(int(uint(_1196) >> uint(2)));
        float _1200 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1198)]);
        int _1202 = _170 + 8;
        uint _1204 = uint(int(uint(_1202) >> uint(2)));
        float _1206 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1204)]);
        uint _1208 = uint(int(uint(_170) >> uint(2)));
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1208)]);
        int _1212 = _170 + 4;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1214)]);
        int _1218 = _170 + 8;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1220)]);
        uint _1224 = uint(int(uint(_170) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1224)]);
        int _1228 = _170 + 4;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1230)]);
        int _1234 = _170 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        float _1238 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1236)]);
        float _1240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1244 = _1092 * _1200;
        float _1246 = _1092 * _1216;
        float _1248 = _1092 * _1232;
        float _1250 = fma(_1094, _1194, _1244);
        float _1252 = fma(_1094, _1210, _1246);
        float _1254 = fma(_1094, _1226, _1248);
        float _1256 = fma(_1096, _1206, _1250);
        float _1258 = fma(_1096, _1222, _1252);
        float _1260 = fma(_1096, _1238, _1254);
        float _1262 = _1190 + _1256;
        float _1264 = _1240 + _1258;
        float _1266 = _1242 + _1260;
        _1180 = _1264;
        _1170 = _1262;
        _1188 = _1266;
    }
    float _1268 = _1180;
    float _1270 = _1170;
    float _1272 = _1188;
    bool _1274 = !_1114;
    float _1276 = _1268;
    float _1278 = _1270;
    float _1280 = _1272;
    if (!_1274)
    {
        uint _1282 = uint(int(uint(_170) >> uint(2)));
        float _1284 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1282)]);
        int _1286 = _170 + 4;
        uint _1288 = uint(int(uint(_1286) >> uint(2)));
        float _1290 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1288)]);
        int _1292 = _170 + 8;
        uint _1294 = uint(int(uint(_1292) >> uint(2)));
        float _1296 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1294)]);
        int _1298 = _170 + 12;
        uint _1300 = uint(int(uint(_1298) >> uint(2)));
        float _1302 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1300)]);
        uint _1304 = uint(int(uint(_170) >> uint(2)));
        float _1306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1304)]);
        int _1308 = _170 + 4;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1310)]);
        int _1314 = _170 + 8;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        float _1318 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1316)]);
        int _1320 = _170 + 12;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        float _1324 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1322)]);
        uint _1326 = uint(int(uint(_170) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1326)]);
        int _1330 = _170 + 4;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1332)]);
        int _1336 = _170 + 8;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        float _1340 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1338)]);
        int _1342 = _170 + 12;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        float _1346 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1344)]);
        float _1348 = _1092 * _1290;
        float _1350 = _1092 * _1312;
        float _1352 = _1092 * _1334;
        float _1354 = fma(_1094, _1284, _1348);
        float _1356 = fma(_1094, _1306, _1350);
        float _1358 = fma(_1094, _1328, _1352);
        float _1360 = fma(_1096, _1296, _1354);
        float _1362 = fma(_1096, _1318, _1356);
        float _1364 = fma(_1096, _1340, _1358);
        float _1366 = _1360 + _1302;
        float _1368 = _1362 + _1324;
        float _1370 = _1364 + _1346;
        _1276 = _1368;
        _1278 = _1366;
        _1280 = _1370;
    }
    float _1372 = _1276;
    float _1374 = _1278;
    float _1376 = _1280;
    float _1378 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1380 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1382 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1384 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1386 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1402 = _1380 * _1372;
    float _1404 = fma(_1378, _1374, _1402);
    float _1406 = fma(_1382, _1376, _1404);
    float _1408 = _1384 + _1406;
    float _1410 = -_1408;
    bool _1412 = _1386 >= _1410;
    bool _1414 = isnan(_1386);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(_1410);
    bool _1420 = _1416 || _1418;
    float _1422 = -_1408;
    bool _1424 = _1388 >= _1422;
    bool _1426 = isnan(_1388);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(_1422);
    bool _1432 = _1428 || _1430;
    int _1434 = _1420 ? 0 : 1;
    int _1436 = 2;
    float _1438 = _1374;
    if (_1420)
    {
        _1436 = 1;
    }
    int _1440 = _1436;
    int _1442 = _1440;
    if (_1432)
    {
        _1442 = _1434;
    }
    int _1444 = _1442;
    int _1446 = _1444 << 6;
    int _1448 = _1446 + 96;
    uint _1450 = uint(int(uint(_1448) >> uint(2)));
    float _1452 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1450)]);
    int _1454 = _1448 + 4;
    uint _1456 = uint(int(uint(_1454) >> uint(2)));
    float _1458 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1456)]);
    int _1460 = _1448 + 8;
    uint _1462 = uint(int(uint(_1460) >> uint(2)));
    float _1464 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1462)]);
    int _1466 = _1448 + 12;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    float _1470 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1468)]);
    int _1472 = _1446 + 48;
    int _1474 = _1446 + 64;
    uint _1476 = uint(int(uint(_1472) >> uint(2)));
    float _1478 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1476)]);
    int _1480 = _1472 + 4;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    float _1484 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1482)]);
    int _1486 = _1472 + 8;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    float _1490 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1488)]);
    int _1492 = _1472 + 12;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    float _1496 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1494)]);
    uint _1498 = uint(int(uint(_1474) >> uint(2)));
    float _1500 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1498)]);
    int _1502 = _1474 + 4;
    uint _1504 = uint(int(uint(_1502) >> uint(2)));
    float _1506 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1504)]);
    int _1508 = _1474 + 8;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    float _1512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1510)]);
    int _1514 = _1474 + 12;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1516)]);
    int _1520 = _1446 + 80;
    float _1522 = _1390 + 1.0;
    float _1524 = _1522 + _1372;
    uint _1526 = uint(int(uint(_1520) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
    int _1530 = _1520 + 4;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
    int _1536 = _1520 + 8;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    float _1540 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1538)]);
    int _1542 = _1520 + 12;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    float _1546 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1544)]);
    float _1548 = _1524 * _1394;
    float _1550 = fma(_1392, _1374, _1548);
    float _1552 = fma(_1396, _1376, _1550);
    float _1554 = _1398 + _1552;
    float _1556 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1558 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1560 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1562 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1564 = trunc(_1554);
    int _1566 = int(_1564);
    int _1568 = ~as_type<int>(_1400);
    int _1570 = _1566 + _1568;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1576 = _1572 >= 0;
    int _1578 = _1566;
    float _1580 = as_type<float>(_1444);
    if (_1576)
    {
        float _1582 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1578 = as_type<int>(_1582);
    }
    int _1584 = _1578;
    float _1586 = _1524 * _1458;
    float _1588 = fma(_1452, _1374, _1586);
    float _1590 = fma(_1464, _1376, _1588);
    float _1592 = _1470 + _1590;
    float _1594 = _1524 * _1484;
    float _1596 = 1.0 / _1592;
    float _1598 = fma(_1478, _1374, _1594);
    float _1600 = _1524 * _1506;
    float _1602 = fma(_1490, _1376, _1598);
    float _1604 = fma(_1500, _1374, _1600);
    float _1606 = _1496 + _1602;
    float _1608 = fma(_1512, _1376, _1604);
    float _1610 = _1606 * _1596;
    float _1612 = _1518 + _1608;
    bool _1614 = _1610 >= 0.0;
    float _1616 = _1612 * _1596;
    bool _1618 = _1610 <= 1.0;
    bool _1620 = _1618 && _1614;
    bool _1622 = _1616 >= 0.0;
    bool _1624 = _1622 && _1620;
    bool _1626 = _1616 <= 1.0;
    bool _1628 = _1626 && _1624;
    float _1630 = _1524 * _1534;
    float _1632 = fma(_1528, _1374, _1630);
    float _1634 = _1606;
    float _1636 = _1496;
    float _1638 = _1562;
    float _1640 = _1500;
    float _1642 = _1604;
    float _1644 = _1608;
    float _1646 = _1518;
    if (_1628)
    {
        float _1648 = float(_1444);
        _1580 = _1648;
    }
    float _1650 = _1580;
    float _1652 = fma(_1540, _1376, _1632);
    float _1654 = _1650;
    if (_1628)
    {
        float _1656 = rint(_1650);
        float _1658 = precise::max(_1656, 0.0);
        uint _1660 = uint(_1658);
        uint _1662 = clamp(_1660, 0u, 65535u);
        _1654 = as_type<float>(_1662);
    }
    float _1664 = _1654;
    float _1666 = _1546 + _1652;
    float _1668 = _1666 * _1596;
    float _1670 = _1616;
    float _1672 = _1668;
    if (_1628)
    {
        float3 _6131 = float3(_1610, _1616, float(as_type<int>(_1664)));
        float3 _6135 = select(_6131, float3(0.0), isnan(_6131));
        float _1674 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _6135.xy, uint(rint(_6135.z)), _1668, level(0.0));
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = _1524 * _1558;
    float _1680 = fma(_1556, _1374, _1678);
    float _1682 = fma(_1560, _1376, _1680);
    float _1684 = _1562 + _1682;
    float _1686 = trunc(_1684);
    int _1688 = int(_1686);
    bool _1690 = _1584 <= _1572;
    bool _1692 = !_1576;
    bool _1694 = _1690 || _1692;
    int _1696 = ~as_type<int>(_1574);
    int _1698 = _1688 + _1696;
    int _1700 = _1698 + 1;
    bool _1702 = _1700 < 0;
    bool _1704 = _1702 || _1694;
    float _1706 = _1680;
    float _1708 = as_type<float>(_1688);
    float _1710 = _1684;
    float _1712 = _1684;
    if (!_1704)
    {
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1706 = _1714;
    }
    float _1716 = _1706;
    bool _1718 = as_type<int>(_1716) <= _1700;
    bool _1720 = _1718 || _1704;
    float _1722 = _1716;
    if (_1720)
    {
        _1708 = 1.0;
    }
    float _1724 = _1708;
    float _1726 = _1724;
    float _1728 = _1676;
    if (!_1720)
    {
        float _1730 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1732 = _1700 * as_type<int>(_1730);
        int _1734 = _1732 + _1572;
        int _1736 = _1734 << 2;
        uint _1738 = uint(int(uint(_1734) >> uint(2)));
        int _1740 = 12 & _1736;
        int _1742 = int(_1738) << 4;
        int _1744 = _1742 + _1740;
        int _1746 = _1744 + 400;
        uint _1748 = uint(int(uint(_1746) >> uint(2)));
        float _1750 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1748)]);
        float _1752 = floor(_1684);
        float _1754 = floor(_1554);
        float _1756 = -_1752;
        float _1758 = _1684 + _1756;
        float _1760 = -_1754;
        float _1762 = _1554 + _1760;
        float _1764 = rint(_1750);
        float _1766 = precise::max(_1764, 0.0);
        uint _1768 = uint(_1766);
        uint _1770 = clamp(_1768, 0u, 65535u);
        float3 _6273 = float3(_1762, _1758, float(int(_1770)));
        float3 _6275 = select(_6273, float3(0.0), isnan(_6273));
        float _1772 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _6275.xy, uint(rint(_6275.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _6275.xy, uint(rint(_6275.z)), level(0.0)).x;
        int _1774 = _1734 << 4;
        int _1776 = _1774 + 2048;
        uint _1778 = uint(int(uint(_1776) >> uint(2)));
        float _1780 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1778)]);
        int _1782 = _1776 + 4;
        uint _1784 = uint(int(uint(_1782) >> uint(2)));
        float _1786 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1784)]);
        int _1788 = _1776 + 8;
        uint _1790 = uint(int(uint(_1788) >> uint(2)));
        float _1792 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1790)]);
        int _1794 = _1776 + 12;
        uint _1796 = uint(int(uint(_1794) >> uint(2)));
        float _1798 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1796)]);
        float _1800 = _1524 * _1786;
        float _1802 = fma(_1780, _1374, _1800);
        float _1804 = fma(_1792, _1376, _1802);
        float _1806 = _1798 + _1804;
        float _1808 = precise::clamp(_1806, 0.0, 1.0);
        float _1810 = -_1808;
        float _1812 = _1810 + _1772;
        float _1814 = fma(_1812, 500.0, 1.5);
        float _1816 = exp2(_1814);
        float _1818 = 0.0 + _1816;
        float _1820 = precise::clamp(_1818, 0.0, 1.0);
        _1438 = 500.0;
        _1726 = _1820;
        _1634 = as_type<float>(_1770);
        _1636 = _1762;
        _1722 = _1750;
        _1638 = _1772;
        _1640 = _1780;
        _1642 = _1802;
        _1644 = _1816;
        _1646 = _1798;
    }
    float _1822 = _1438;
    float _1824 = _1726;
    float _1826 = _1634;
    float _1828 = _1636;
    float _1830 = _1722;
    float _1832 = _1638;
    float _1834 = _1640;
    float _1836 = _1642;
    float _1838 = _1644;
    float _1840 = _1646;
    uint _1842 = uint(int(uint(_170) >> uint(2)));
    float _1844 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1842)]);
    float _1846 = _1822;
    float _1848 = _1826;
    float _1850 = _1828;
    float _1852 = _1824;
    float _1854 = _1830;
    float _1856 = _1832;
    float _1858 = _1834;
    float _1860 = _1836;
    float _1862 = _1838;
    float _1864 = _1840;
    if (!_1628)
    {
        _1846 = 1.0;
    }
    float _1866 = _1846;
    bool _1868 = _604 > 0.001000000047497451305389404296875;
    bool _1870 = isnan(_604);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan(0.001000000047497451305389404296875);
    bool _1876 = _1872 || _1874;
    float _1878 = _1866;
    if (_1628)
    {
        bool _1880 = _1676 >= _1668;
        bool _1882 = isnan(_1676);
        bool _1884 = _1880 || _1882;
        bool _1886 = isnan(_1668);
        bool _1888 = _1884 || _1886;
        float _1890 = float(_1888);
        _1878 = _1890;
    }
    float _1892 = _1878;
    float _1894 = -_1892;
    float _1896 = fma(_1894, _1824, 1.0);
    float _1898 = -_1844;
    float _1900 = _1896 + _1898;
    float _1902 = _1896;
    float _1904 = _1844;
    if (_1876)
    {
        float _1906 = fma(_1900, 0.0500000007450580596923828125, _1844);
        _1902 = _1906;
    }
    float _1908 = _1902;
    bool _1910 = _650 >= 0.0;
    bool _1912 = isnan(_650);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = precise::max(0.0, _1908);
    float _1922 = precise::min(_1920, 0.999000012874603271484375);
    uint _1924 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1924)] = as_type<uint>(_1922);
    if (!_1918)
    {
        float _1926 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _1928 = as_type<int>(_1926) & 512;
        bool _1930 = _1928 != 0;
        float _1932 = _1676;
        float _1934 = _1668;
        float _1936 = _1826;
        float _1938 = _1828;
        if (_1930)
        {
            float _1940 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1942 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1944 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1946 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1932 = _1940;
            _1934 = _1942;
            _1936 = _1944;
            _1938 = _1946;
        }
        float _1948 = _1932;
        float _1950 = _1934;
        float _1952 = _1936;
        float _1954 = _1938;
        float _1956 = _1824;
        float _1958 = _1830;
        float _1960 = _1844;
        float _1962 = _1832;
        if (_1930)
        {
            float _1964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1966 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1968 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1970 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1956 = _1964;
            _1958 = _1966;
            _1960 = _1968;
            _1962 = _1970;
        }
        float _1972 = _1956;
        float _1974 = _1958;
        float _1976 = _1960;
        float _1978 = _1962;
        float _1980 = _1834;
        float _1982 = _1836;
        float _1984 = _1838;
        float _1986 = _1840;
        if (_1930)
        {
            float _1988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _1990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _1992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _1994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1980 = _1988;
            _1982 = _1990;
            _1984 = _1992;
            _1986 = _1994;
        }
        float _1996 = _1980;
        float _1998 = _1982;
        float _2000 = _1984;
        float _2002 = _1986;
        int _2004 = as_type<int>(_1926) & 1024;
        bool _2006 = _2004 != 0;
        int _2008 = as_type<int>(_1926) & 2048;
        bool _2010 = _2008 != 0;
        float _2012 = _1950;
        float _2014 = _1948;
        float _2016 = _1952;
        float _2018 = _1954;
        if (_1930)
        {
            float _2020 = _1092 * _1950;
            _2012 = _2020;
        }
        float _2022 = _2012;
        float _2024 = _2022;
        if (_1930)
        {
            float _2026 = fma(_1094, _1948, _2022);
            _2024 = _2026;
        }
        float _2028 = _2024;
        float _2030 = _1972;
        float _2032 = _1976;
        float _2034 = _1974;
        float _2036 = _2028;
        if (_1930)
        {
            float _2038 = _1092 * _1974;
            _1710 = _2038;
        }
        float _2040 = _1710;
        float _2042 = _2040;
        float _2044 = _1996;
        float _2046 = _1998;
        float _2048 = _2000;
        float _2050 = _2002;
        if (_1930)
        {
            float _2052 = _1092 * _1998;
            _2014 = _2052;
        }
        float _2054 = _2014;
        float _2056 = _2054;
        if (_1930)
        {
            float _2058 = fma(_1094, _1972, _2040);
            _2030 = _2058;
        }
        float _2060 = _2030;
        float _2062 = _2060;
        if (_1930)
        {
            float _2064 = fma(_1094, _1996, _2054);
            _2056 = _2064;
        }
        float _2066 = _2056;
        float _2068 = _2066;
        if (_1930)
        {
            float _2070 = fma(_1096, _1976, _2060);
            _2032 = _2070;
        }
        float _2072 = _2032;
        float _2074 = _2072;
        if (_1930)
        {
            float _2076 = fma(_1096, _1952, _2028);
            _2016 = _2076;
        }
        float _2078 = _2016;
        float _2080 = _2078;
        if (_1930)
        {
            float _2082 = fma(_1096, _2000, _2066);
            _2068 = _2082;
        }
        float _2084 = _2068;
        float _2086 = _2084;
        if (!_1930)
        {
            _2062 = 0.0;
            _2034 = 0.0;
        }
        float _2088 = _2062;
        float _2090 = _2034;
        float _2092 = _2090;
        float _2094 = _2088;
        if (!_1930)
        {
            _2042 = 0.0;
        }
        float _2096 = _2042;
        float _2098 = _2096;
        if (_1930)
        {
            float _2100 = _1978 + _2072;
            _2092 = _2100;
        }
        float _2102 = _2092;
        float _2104 = _2102;
        if (_1930)
        {
            float _2106 = _1954 + _2078;
            _2098 = _2106;
        }
        float _2108 = _2098;
        float _2110 = _2108;
        if (_1930)
        {
            float _2112 = _2002 + _2084;
            _2094 = _2112;
        }
        float _2114 = _2094;
        bool _2116 = !_2006;
        float _2118 = _2114;
        if (!_2116)
        {
            float _2120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2122 = uint(int(uint(_170) >> uint(2)));
            float _2124 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2122)]);
            int _2126 = _170 + 4;
            uint _2128 = uint(int(uint(_2126) >> uint(2)));
            float _2130 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2128)]);
            int _2132 = _170 + 8;
            uint _2134 = uint(int(uint(_2132) >> uint(2)));
            float _2136 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2134)]);
            uint _2138 = uint(int(uint(_170) >> uint(2)));
            float _2140 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2138)]);
            int _2142 = _170 + 4;
            uint _2144 = uint(int(uint(_2142) >> uint(2)));
            float _2146 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2144)]);
            int _2148 = _170 + 8;
            uint _2150 = uint(int(uint(_2148) >> uint(2)));
            float _2152 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2150)]);
            int _2154 = _170 + 12;
            uint _2156 = uint(int(uint(_2154) >> uint(2)));
            float _2158 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2156)]);
            uint _2160 = uint(int(uint(_170) >> uint(2)));
            float _2162 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2160)]);
            int _2164 = _170 + 4;
            uint _2166 = uint(int(uint(_2164) >> uint(2)));
            float _2168 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2166)]);
            int _2170 = _170 + 8;
            uint _2172 = uint(int(uint(_2170) >> uint(2)));
            float _2174 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2172)]);
            int _2176 = _170 + 12;
            uint _2178 = uint(int(uint(_2176) >> uint(2)));
            float _2180 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2178)]);
            float _2182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2186 = _1092 * _2130;
            float _2188 = _1092 * _2146;
            float _2190 = fma(_1094, _2124, _2186);
            float _2192 = _1092 * _2168;
            float _2194 = fma(_1094, _2140, _2188);
            float _2196 = fma(_1094, _2162, _2192);
            float _2198 = fma(_1096, _2136, _2190);
            float _2200 = fma(_1096, _2152, _2194);
            float _2202 = fma(_1096, _2174, _2196);
            float _2204 = _2120 + _2198;
            float _2206 = _2182 + _2200;
            float _2208 = _2184 + _2202;
            _2118 = _2208;
            _2104 = _2204;
            _2074 = _2136;
            _2044 = _2162;
            _2046 = _2196;
            _2048 = _2202;
            _2050 = _2180;
            _2110 = _2206;
            _2036 = _2200;
            _2080 = _2152;
            _2018 = _2158;
            _2086 = _2140;
        }
        float _2210 = _2118;
        float _2212 = _2104;
        float _2214 = _2074;
        float _2216 = _2044;
        float _2218 = _2046;
        float _2220 = _2048;
        float _2222 = _2050;
        float _2224 = _2110;
        float _2226 = _2036;
        float _2228 = _2080;
        float _2230 = _2018;
        float _2232 = _2086;
        bool _2234 = !_2010;
        float _2236 = _2212;
        float _2238 = _2210;
        float _2240 = _2224;
        float _2242 = _2216;
        float _2244 = _2218;
        float _2246 = _2232;
        float _2248 = _2214;
        float _2250 = _2220;
        float _2252 = _2222;
        _1672 = _2226;
        _1848 = _2228;
        _1850 = _2230;
        if (!_2234)
        {
            uint _2254 = uint(int(uint(_170) >> uint(2)));
            float _2256 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2254)]);
            int _2258 = _170 + 4;
            uint _2260 = uint(int(uint(_2258) >> uint(2)));
            float _2262 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2260)]);
            int _2264 = _170 + 8;
            uint _2266 = uint(int(uint(_2264) >> uint(2)));
            float _2268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2266)]);
            int _2270 = _170 + 12;
            uint _2272 = uint(int(uint(_2270) >> uint(2)));
            float _2274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2272)]);
            uint _2276 = uint(int(uint(_170) >> uint(2)));
            float _2278 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2276)]);
            int _2280 = _170 + 4;
            uint _2282 = uint(int(uint(_2280) >> uint(2)));
            float _2284 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2282)]);
            int _2286 = _170 + 8;
            uint _2288 = uint(int(uint(_2286) >> uint(2)));
            float _2290 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2288)]);
            int _2292 = _170 + 12;
            uint _2294 = uint(int(uint(_2292) >> uint(2)));
            float _2296 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2294)]);
            uint _2298 = uint(int(uint(_170) >> uint(2)));
            float _2300 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2298)]);
            int _2302 = _170 + 4;
            uint _2304 = uint(int(uint(_2302) >> uint(2)));
            float _2306 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2304)]);
            int _2308 = _170 + 8;
            uint _2310 = uint(int(uint(_2308) >> uint(2)));
            float _2312 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2310)]);
            int _2314 = _170 + 12;
            uint _2316 = uint(int(uint(_2314) >> uint(2)));
            float _2318 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2316)]);
            float _2320 = _1092 * _2262;
            float _2322 = _1092 * _2284;
            float _2324 = fma(_1094, _2256, _2320);
            float _2326 = _1092 * _2306;
            float _2328 = fma(_1094, _2278, _2322);
            float _2330 = fma(_1094, _2300, _2326);
            float _2332 = fma(_1096, _2268, _2324);
            float _2334 = fma(_1096, _2290, _2328);
            float _2336 = fma(_1096, _2312, _2330);
            float _2338 = _2332 + _2274;
            float _2340 = _2334 + _2296;
            float _2342 = _2336 + _2318;
            _2236 = _2338;
            _2238 = _2342;
            _2240 = _2340;
            _2242 = _2278;
            _2244 = _2328;
            _2246 = _2320;
            _2248 = _2268;
            _2250 = _2334;
            _2252 = _2296;
        }
        float _2344 = _2236;
        float _2346 = _2238;
        float _2348 = _2240;
        float _2350 = _2242;
        float _2352 = _2244;
        float _2354 = _2246;
        float _2356 = _2248;
        float _2358 = _2250;
        float _2360 = _2252;
        float _2362 = fma(_2344, 6.2500002968590706586837768554688e-05, 0.5);
        float _2364 = fma(_2346, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _7101 = float2(_2362, _2364);
        float _2366 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7101, float2(0.0), isnan(_7101)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7101, float2(0.0), isnan(_7101)), level(0.0)).x;
        float _2368 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2370 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2372 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2374 = _2366 * 2000.0;
        float _2376 = -_2368;
        float _2378 = _2376 + _2348;
        float _2380 = _2374 + (-0.300000011920928955078125);
        bool _2382 = _2378 > _2380;
        bool _2384 = _2378 < _2374;
        bool _2386 = _2384 && _2382;
        bool _2388 = !_2386;
        _1728 = _2354;
        _1852 = _2346;
        _1854 = _2344;
        _1904 = _2356;
        _1856 = _2380;
        _1858 = _2350;
        _1860 = _2352;
        _1862 = _2358;
        _1864 = _2360;
        _1712 = _2378;
        if (!_2388)
        {
            float _2390 = fma(_2344, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2392 = fma(_2344, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2394 = fma(_2346, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2396 = fma(_2346, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _7167 = float2(_2390, _2364);
            float _2398 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7167, float2(0.0), isnan(_7167)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7167, float2(0.0), isnan(_7167)), level(0.0)).x;
            float2 _7175 = float2(_2392, _2364);
            float _2400 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7175, float2(0.0), isnan(_7175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7175, float2(0.0), isnan(_7175)), level(0.0)).x;
            float2 _7183 = float2(_2362, _2394);
            float _2402 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7183, float2(0.0), isnan(_7183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7183, float2(0.0), isnan(_7183)), level(0.0)).x;
            float2 _7191 = float2(_2362, _2396);
            float _2404 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7191, float2(0.0), isnan(_7191)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7191, float2(0.0), isnan(_7191)), level(0.0)).x;
            float2 _7199 = float2(_2390, _2394);
            float _2406 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7199, float2(0.0), isnan(_7199)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7199, float2(0.0), isnan(_7199)), level(0.0)).x;
            float2 _7207 = float2(_2390, _2396);
            float _2408 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7207, float2(0.0), isnan(_7207)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7207, float2(0.0), isnan(_7207)), level(0.0)).x;
            float2 _7215 = float2(_2392, _2394);
            float _2410 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7215, float2(0.0), isnan(_7215)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7215, float2(0.0), isnan(_7215)), level(0.0)).x;
            float2 _7223 = float2(_2392, _2396);
            float _2412 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7223, float2(0.0), isnan(_7223)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7223, float2(0.0), isnan(_7223)), level(0.0)).x;
            float _2414 = -_2398;
            float _2416 = _2366 + _2414;
            float _2418 = -_2400;
            float _2420 = _2366 + _2418;
            float _2422 = -_2402;
            float _2424 = _2366 + _2422;
            float _2426 = -_2404;
            float _2428 = _2366 + _2426;
            float _2430 = -_2406;
            float _2432 = _2366 + _2430;
            float _2434 = -_2408;
            float _2436 = _2366 + _2434;
            float _2438 = -_2410;
            float _2440 = _2366 + _2438;
            float _2442 = -_2412;
            float _2444 = _2366 + _2442;
            float _2446 = abs(_2416);
            float _2448 = abs(_2420);
            float _2450 = precise::max(_2446, _2448);
            float _2452 = abs(_2424);
            float _2454 = abs(_2428);
            float _2456 = precise::max(_2452, _2454);
            float _2458 = abs(_2432);
            float _2460 = abs(_2436);
            float _2462 = precise::max(_2458, _2460);
            float _2464 = precise::max(_2450, _2456);
            float _2466 = abs(_2440);
            float _2468 = abs(_2444);
            float _2470 = precise::max(_2466, _2468);
            bool _2472 = _2464 > 0.00150000001303851604461669921875;
            float _2474 = precise::max(_2462, _2470);
            bool _2476 = _2474 <= 0.00150000001303851604461669921875;
            bool _2478 = isnan(_2474);
            bool _2480 = _2476 || _2478;
            bool _2482 = isnan(0.00150000001303851604461669921875);
            bool _2484 = _2480 || _2482;
            bool _2486 = !_2472;
            bool _2488 = _2484 && _2486;
            bool _2490 = !_2488;
            float _2492 = _2464;
            float _2494 = _2436;
            float _2496 = _2470;
            float _2498 = _2420;
            _1728 = _2396;
            _1672 = _2464;
            _1848 = _2474;
            _1850 = _2436;
            _1852 = _2424;
            _1854 = _2392;
            _1904 = _2390;
            _1856 = _2394;
            _1858 = _2440;
            _1860 = _2470;
            _1862 = _2450;
            _1864 = _2420;
            if (!_2490)
            {
                float _2500 = -_2366;
                float _2502 = _2500 + _2398;
                float _2504 = -_2366;
                float _2506 = _2504 + _2402;
                float _2508 = _2502 * 2000.0;
                float _2510 = _2506 * 2000.0;
                bool _2512 = !_1930;
                float _2618;
                float _2620;
                float _2622;
                if (!_2512)
                {
                    float _2514 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2516 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2518 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2520 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2522 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2524 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2530 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2532 = _2518 * _2520;
                    float _2534 = _2518 * _2522;
                    float _2536 = _2516 * _2520;
                    float _2538 = -_2532;
                    float _2540 = fma(_2514, _2524, _2538);
                    float _2542 = -_2534;
                    float _2544 = fma(_2516, _2524, _2542);
                    float _2546 = -_2536;
                    float _2548 = fma(_2514, _2522, _2546);
                    float _2550 = _2530 * _2516;
                    float _2552 = _2540 * _2528;
                    float _2554 = _2526 * _2518;
                    float _2556 = _2528 * _2514;
                    float _2558 = -_2550;
                    float _2560 = fma(_2528, _2518, _2558);
                    float _2562 = -_2552;
                    float _2564 = fma(_2544, _2526, _2562);
                    float _2566 = _2528 * _2524;
                    float _2568 = -_2554;
                    float _2570 = fma(_2530, _2514, _2568);
                    float _2572 = _2530 * _2520;
                    float _2574 = fma(_2548, _2530, _2564);
                    float _2576 = -_2566;
                    float _2578 = fma(_2530, _2522, _2576);
                    float _2580 = _2526 * _2522;
                    float _2582 = -_2514;
                    float _2584 = fma(_2582, _2524, _2532);
                    float _2586 = -_2572;
                    float _2588 = fma(_2526, _2524, _2586);
                    float _2590 = -_2556;
                    float _2592 = fma(_2526, _2516, _2590);
                    float _2594 = 1.0 / _2574;
                    float _2596 = -_2580;
                    float _2598 = fma(_2528, _2520, _2596);
                    float _2600 = fma(_2508, _2544, _2578);
                    float _2602 = fma(_2508, _2584, _2588);
                    float _2604 = fma(_2508, _2548, _2598);
                    float _2606 = fma(_2510, _2560, _2600);
                    float _2608 = fma(_2510, _2570, _2602);
                    float _2610 = fma(_2510, _2592, _2604);
                    float _2612 = _2594 * _2606;
                    float _2614 = _2594 * _2608;
                    float _2616 = _2594 * _2610;
                    _2618 = _2614;
                    _2620 = _2612;
                    _2622 = _2616;
                    _2492 = _2522;
                    _2494 = _2600;
                    _2496 = _2516;
                    _2498 = _2532;
                    _2624 = true;
                }
                else
                {
                    float _2626 = fma(_2508, _520, _522);
                    float _2628 = fma(_2508, _524, _526);
                    float _2630 = fma(_2508, _528, _530);
                    float _2632 = fma(_2510, _532, _2626);
                    float _2634 = fma(_2510, _534, _2628);
                    float _2636 = fma(_2510, _536, _2630);
                    _2618 = _2634;
                    _2620 = _2632;
                    _2622 = _2636;
                }
                _2624 = false;
                float _2638 = _2618;
                float _2640 = _2620;
                float _2642 = _2622;
                float _2644 = _2492;
                float _2646 = _2494;
                float _2648 = _2496;
                float _2650 = _2498;
                float _2652 = _2638 * _2638;
                float _2654 = -_2378;
                float _2656 = _2654 + _2374;
                float _2658 = fma(_2640, _2640, _2652);
                float _2660 = _1092 + _2656;
                float _2662 = fma(_2642, _2642, _2658);
                float _2664 = rsqrt(_2662);
                float _2666 = _2664 * _2638;
                float _2668 = _2664 * _2640;
                float _2670 = _2664 * _2642;
                float _2672 = _650 * _2666;
                float _2674 = fma(_648, _2668, _2672);
                float _2676 = fma(_662, _2670, _2674);
                float _2678 = _2668 * _2676;
                float _2680 = _2666 * _2676;
                float _2682 = _2670 * _2676;
                float _2684 = -_2678;
                float _2686 = _648 + _2684;
                float _2688 = -_2680;
                float _2690 = _650 + _2688;
                float _2692 = -_2682;
                float _2694 = _662 + _2692;
                float _2696 = _2370 * _2678;
                float _2698 = _2370 * _2680;
                float _2700 = _2370 * _2682;
                float _2702 = -_2696;
                float _2704 = fma(_2372, _2686, _2702);
                float _2706 = -_2698;
                float _2708 = fma(_2372, _2690, _2706);
                float _2710 = -_2700;
                float _2712 = fma(_2372, _2694, _2710);
                _676 = _2708;
                _1728 = _2680;
                _1672 = _2644;
                _1848 = _2686;
                _1850 = _2646;
                _1852 = _2682;
                _1854 = _2676;
                _1904 = _2696;
                _1856 = _2664;
                _1858 = _2690;
                _1860 = _2648;
                _1862 = _2694;
                _1864 = _2650;
                _1100 = _2660;
                _678 = _2704;
                _680 = _2712;
            }
        }
    }
    float _2714 = _676;
    float _2716 = _1728;
    float _2718 = _1672;
    float _2720 = _1848;
    float _2722 = _1850;
    float _2724 = _1852;
    float _2726 = _1854;
    float _2728 = _1904;
    float _2730 = _1856;
    float _2732 = _1858;
    float _2734 = _1860;
    float _2736 = _1862;
    float _2738 = _1864;
    float _2740 = _1100;
    float _2742 = _1712;
    float _2744 = _678;
    float _2746 = _680;
    bool _2748 = _2714 >= 0.0;
    bool _2750 = isnan(_2714);
    bool _2752 = _2748 || _2750;
    bool _2754 = isnan(0.0);
    bool _2756 = _2752 || _2754;
    float _2758 = _2742;
    float _2760 = _2740;
    float _2762 = _2744;
    float _2764 = _2714;
    float _2766 = _2746;
    if (!_2756)
    {
        float _2768 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _2770 = as_type<int>(_2768) & 512;
        bool _2772 = _2770 != 0;
        float _2774 = _2716;
        float _2776 = _2718;
        float _2778 = _2720;
        float _2780 = _2722;
        if (_2772)
        {
            float _2782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _2774 = _2782;
            _2776 = _2784;
            _2778 = _2786;
            _2780 = _2788;
        }
        float _2790 = _2774;
        float _2792 = _2776;
        float _2794 = _2778;
        float _2796 = _2780;
        float _2798 = _2724;
        float _2800 = _2726;
        float _2802 = _2728;
        float _2804 = _2730;
        if (_2772)
        {
            float _2806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _2798 = _2806;
            _2800 = _2808;
            _2802 = _2810;
            _2804 = _2812;
        }
        float _2814 = _2798;
        float _2816 = _2800;
        float _2818 = _2802;
        float _2820 = _2804;
        float _2822 = _2732;
        float _2824 = _2734;
        float _2826 = _2736;
        float _2828 = _2738;
        if (_2772)
        {
            float _2830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2832 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2834 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2822 = _2830;
            _2824 = _2832;
            _2826 = _2834;
            _2828 = _2836;
        }
        float _2838 = _2822;
        float _2840 = _2824;
        float _2842 = _2826;
        float _2844 = _2828;
        int _2846 = as_type<int>(_2768) & 1024;
        bool _2848 = _2846 != 0;
        int _2850 = as_type<int>(_2768) & 2048;
        bool _2852 = _2850 != 0;
        float _2854 = _2792;
        float _2856 = _2790;
        float _2858 = _2794;
        if (_2772)
        {
            float _2860 = _2792 * _2740;
            _2854 = _2860;
        }
        float _2862 = _2854;
        float _2864 = _2862;
        if (_2772)
        {
            float _2866 = fma(_1094, _2790, _2862);
            _2864 = _2866;
        }
        float _2868 = _2864;
        float _2870 = _2814;
        float _2872 = _2818;
        float _2874 = _2816;
        if (_2772)
        {
            float _2876 = _2816 * _2740;
            _2758 = _2876;
        }
        float _2878 = _2758;
        float _2880 = _2878;
        if (_2772)
        {
            float _2882 = _2840 * _2740;
            _2856 = _2882;
        }
        float _2884 = _2856;
        float _2886 = _2884;
        if (_2772)
        {
            float _2888 = fma(_1094, _2814, _2878);
            _2870 = _2888;
        }
        float _2890 = _2870;
        float _2892 = _2890;
        if (_2772)
        {
            float _2894 = fma(_1094, _2838, _2884);
            _2886 = _2894;
        }
        float _2896 = _2886;
        float _2898 = _2896;
        if (_2772)
        {
            float _2900 = fma(_1096, _2818, _2890);
            _2872 = _2900;
        }
        float _2902 = _2872;
        if (_2772)
        {
            float _2904 = fma(_1096, _2794, _2868);
            _2858 = _2904;
        }
        float _2906 = _2858;
        if (_2772)
        {
            float _2908 = fma(_1096, _2842, _2896);
            _2898 = _2908;
        }
        float _2910 = _2898;
        if (!_2772)
        {
            _2874 = 0.0;
            _2892 = 0.0;
        }
        float _2912 = _2874;
        float _2914 = _2892;
        float _2916 = _2912;
        float _2918 = _2914;
        if (!_2772)
        {
            _2880 = 0.0;
        }
        float _2920 = _2880;
        float _2922 = _2920;
        if (_2772)
        {
            float _2924 = _2820 + _2902;
            _2916 = _2924;
        }
        float _2926 = _2916;
        float _2928 = _2926;
        if (_2772)
        {
            float _2930 = _2796 + _2906;
            _2922 = _2930;
        }
        float _2932 = _2922;
        float _2934 = _2932;
        if (_2772)
        {
            float _2936 = _2844 + _2910;
            _2918 = _2936;
        }
        float _2938 = _2918;
        bool _2940 = !_2848;
        float _2942 = _2938;
        if (!_2940)
        {
            float _2944 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2946 = uint(int(uint(_170) >> uint(2)));
            float _2948 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2946)]);
            int _2950 = _170 + 4;
            uint _2952 = uint(int(uint(_2950) >> uint(2)));
            float _2954 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2952)]);
            int _2956 = _170 + 8;
            uint _2958 = uint(int(uint(_2956) >> uint(2)));
            float _2960 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2958)]);
            uint _2962 = uint(int(uint(_170) >> uint(2)));
            float _2964 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2962)]);
            int _2966 = _170 + 4;
            uint _2968 = uint(int(uint(_2966) >> uint(2)));
            float _2970 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2968)]);
            int _2972 = _170 + 8;
            uint _2974 = uint(int(uint(_2972) >> uint(2)));
            float _2976 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2974)]);
            uint _2978 = uint(int(uint(_170) >> uint(2)));
            float _2980 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2978)]);
            int _2982 = _170 + 4;
            uint _2984 = uint(int(uint(_2982) >> uint(2)));
            float _2986 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2984)]);
            int _2988 = _170 + 8;
            uint _2990 = uint(int(uint(_2988) >> uint(2)));
            float _2992 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2990)]);
            float _2994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2996 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2998 = _2954 * _2740;
            float _3000 = _2970 * _2740;
            float _3002 = fma(_1094, _2948, _2998);
            float _3004 = _2986 * _2740;
            float _3006 = fma(_1094, _2964, _3000);
            float _3008 = fma(_1094, _2980, _3004);
            float _3010 = fma(_1096, _2960, _3002);
            float _3012 = fma(_1096, _2976, _3006);
            float _3014 = fma(_1096, _2992, _3008);
            float _3016 = _2944 + _3010;
            float _3018 = _2994 + _3012;
            float _3020 = _2996 + _3014;
            _2942 = _3020;
            _2928 = _3016;
            _2934 = _3018;
        }
        float _3022 = _2942;
        float _3024 = _2928;
        float _3026 = _2934;
        bool _3028 = !_2852;
        float _3030 = _3024;
        float _3032 = _3022;
        float _3034 = _3026;
        if (!_3028)
        {
            uint _3036 = uint(int(uint(_170) >> uint(2)));
            float _3038 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3036)]);
            int _3040 = _170 + 4;
            uint _3042 = uint(int(uint(_3040) >> uint(2)));
            float _3044 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3042)]);
            int _3046 = _170 + 8;
            uint _3048 = uint(int(uint(_3046) >> uint(2)));
            float _3050 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3048)]);
            int _3052 = _170 + 12;
            uint _3054 = uint(int(uint(_3052) >> uint(2)));
            float _3056 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3054)]);
            uint _3058 = uint(int(uint(_170) >> uint(2)));
            float _3060 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3058)]);
            int _3062 = _170 + 4;
            uint _3064 = uint(int(uint(_3062) >> uint(2)));
            float _3066 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3064)]);
            int _3068 = _170 + 8;
            uint _3070 = uint(int(uint(_3068) >> uint(2)));
            float _3072 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3070)]);
            int _3074 = _170 + 12;
            uint _3076 = uint(int(uint(_3074) >> uint(2)));
            float _3078 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3076)]);
            uint _3080 = uint(int(uint(_170) >> uint(2)));
            float _3082 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3080)]);
            int _3084 = _170 + 4;
            uint _3086 = uint(int(uint(_3084) >> uint(2)));
            float _3088 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3086)]);
            int _3090 = _170 + 8;
            uint _3092 = uint(int(uint(_3090) >> uint(2)));
            float _3094 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3092)]);
            int _3096 = _170 + 12;
            uint _3098 = uint(int(uint(_3096) >> uint(2)));
            float _3100 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3098)]);
            float _3102 = _3044 * _2740;
            float _3104 = _3066 * _2740;
            float _3106 = fma(_1094, _3038, _3102);
            float _3108 = _3088 * _2740;
            float _3110 = fma(_1094, _3060, _3104);
            float _3112 = fma(_1094, _3082, _3108);
            float _3114 = fma(_1096, _3050, _3106);
            float _3116 = fma(_1096, _3072, _3110);
            float _3118 = fma(_1096, _3094, _3112);
            float _3120 = _3114 + _3056;
            float _3122 = _3116 + _3078;
            float _3124 = _3118 + _3100;
            _3030 = _3120;
            _3032 = _3124;
            _3034 = _3122;
        }
        float _3126 = _3030;
        float _3128 = _3032;
        float _3130 = _3034;
        float _3132 = fma(_3126, 6.2500002968590706586837768554688e-05, 0.5);
        float _3134 = fma(_3128, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _8267 = float2(_3132, _3134);
        float _3136 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8267, float2(0.0), isnan(_8267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8267, float2(0.0), isnan(_8267)), level(0.0)).x;
        float _3138 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _3140 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _3142 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _3144 = _3136 * 2000.0;
        float _3146 = -_3138;
        float _3148 = _3146 + _3130;
        float _3150 = _3144 + (-0.300000011920928955078125);
        bool _3152 = _3148 > _3150;
        bool _3154 = _3148 < _3144;
        bool _3156 = _3154 && _3152;
        bool _3158 = !_3156;
        if (!_3158)
        {
            float _3160 = fma(_3126, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3162 = fma(_3126, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _3164 = fma(_3128, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3166 = fma(_3128, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _8315 = float2(_3160, _3134);
            float _3168 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8315, float2(0.0), isnan(_8315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8315, float2(0.0), isnan(_8315)), level(0.0)).x;
            float2 _8323 = float2(_3162, _3134);
            float _3170 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8323, float2(0.0), isnan(_8323)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8323, float2(0.0), isnan(_8323)), level(0.0)).x;
            float2 _8331 = float2(_3132, _3164);
            float _3172 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8331, float2(0.0), isnan(_8331)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8331, float2(0.0), isnan(_8331)), level(0.0)).x;
            float2 _8339 = float2(_3132, _3166);
            float _3174 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8339, float2(0.0), isnan(_8339)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8339, float2(0.0), isnan(_8339)), level(0.0)).x;
            float2 _8347 = float2(_3160, _3164);
            float _3176 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8347, float2(0.0), isnan(_8347)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8347, float2(0.0), isnan(_8347)), level(0.0)).x;
            float2 _8355 = float2(_3160, _3166);
            float _3178 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8355, float2(0.0), isnan(_8355)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8355, float2(0.0), isnan(_8355)), level(0.0)).x;
            float2 _8363 = float2(_3162, _3164);
            float _3180 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8363, float2(0.0), isnan(_8363)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8363, float2(0.0), isnan(_8363)), level(0.0)).x;
            float2 _8371 = float2(_3162, _3166);
            float _3182 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8371, float2(0.0), isnan(_8371)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8371, float2(0.0), isnan(_8371)), level(0.0)).x;
            float _3184 = -_3168;
            float _3186 = _3136 + _3184;
            float _3188 = -_3170;
            float _3190 = _3136 + _3188;
            float _3192 = -_3172;
            float _3194 = _3136 + _3192;
            float _3196 = -_3174;
            float _3198 = _3136 + _3196;
            float _3200 = -_3176;
            float _3202 = _3136 + _3200;
            float _3204 = -_3178;
            float _3206 = _3136 + _3204;
            float _3208 = -_3180;
            float _3210 = _3136 + _3208;
            float _3212 = -_3182;
            float _3214 = _3136 + _3212;
            float _3216 = abs(_3186);
            float _3218 = abs(_3190);
            float _3220 = precise::max(_3216, _3218);
            float _3222 = abs(_3194);
            float _3224 = abs(_3198);
            float _3226 = precise::max(_3222, _3224);
            float _3228 = abs(_3202);
            float _3230 = abs(_3206);
            float _3232 = precise::max(_3228, _3230);
            float _3234 = precise::max(_3220, _3226);
            float _3236 = abs(_3210);
            float _3238 = abs(_3214);
            float _3240 = precise::max(_3236, _3238);
            bool _3242 = _3234 > 0.00150000001303851604461669921875;
            float _3244 = precise::max(_3232, _3240);
            bool _3246 = _3244 <= 0.00150000001303851604461669921875;
            bool _3248 = isnan(_3244);
            bool _3250 = _3246 || _3248;
            bool _3252 = isnan(0.00150000001303851604461669921875);
            bool _3254 = _3250 || _3252;
            bool _3256 = !_3242;
            bool _3258 = _3254 && _3256;
            bool _3260 = !_3258;
            if (!_3260)
            {
                float _3262 = -_3136;
                float _3264 = _3262 + _3168;
                float _3266 = -_3136;
                float _3268 = _3266 + _3172;
                float _3270 = _3264 * 2000.0;
                float _3272 = _3268 * 2000.0;
                bool _3274 = !_2772;
                float _3380;
                float _3382;
                float _3384;
                if (!_3274)
                {
                    float _3276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _3278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _3280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _3282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _3284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _3286 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _3288 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _3290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _3292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _3294 = _3280 * _3282;
                    float _3296 = _3280 * _3284;
                    float _3298 = _3278 * _3282;
                    float _3300 = -_3294;
                    float _3302 = fma(_3276, _3286, _3300);
                    float _3304 = -_3296;
                    float _3306 = fma(_3278, _3286, _3304);
                    float _3308 = _3292 * _3278;
                    float _3310 = _3290 * _3286;
                    float _3312 = _3302 * _3290;
                    float _3314 = -_3298;
                    float _3316 = fma(_3276, _3284, _3314);
                    float _3318 = _3288 * _3280;
                    float _3320 = -_3308;
                    float _3322 = fma(_3290, _3280, _3320);
                    float _3324 = -_3312;
                    float _3326 = fma(_3306, _3288, _3324);
                    float _3328 = _3292 * _3282;
                    float _3330 = -_3318;
                    float _3332 = fma(_3292, _3276, _3330);
                    float _3334 = -_3310;
                    float _3336 = fma(_3292, _3284, _3334);
                    float _3338 = fma(_3316, _3292, _3326);
                    float _3340 = _3288 * _3284;
                    float _3342 = _3290 * _3276;
                    float _3344 = -_3276;
                    float _3346 = fma(_3344, _3286, _3294);
                    float _3348 = -_3328;
                    float _3350 = fma(_3288, _3286, _3348);
                    float _3352 = -_3340;
                    float _3354 = fma(_3290, _3282, _3352);
                    float _3356 = 1.0 / _3338;
                    float _3358 = -_3342;
                    float _3360 = fma(_3288, _3278, _3358);
                    float _3362 = fma(_3306, _3270, _3336);
                    float _3364 = fma(_3346, _3270, _3350);
                    float _3366 = fma(_3316, _3270, _3354);
                    float _3368 = fma(_3322, _3272, _3362);
                    float _3370 = fma(_3332, _3272, _3364);
                    float _3372 = fma(_3360, _3272, _3366);
                    float _3374 = _3356 * _3368;
                    float _3376 = _3356 * _3370;
                    float _3378 = _3356 * _3372;
                    _3380 = _3376;
                    _3382 = _3374;
                    _3384 = _3378;
                    _3386 = true;
                }
                else
                {
                    float _3388 = fma(_3270, _520, _522);
                    float _3390 = fma(_3270, _524, _526);
                    float _3392 = fma(_3270, _528, _530);
                    float _3394 = fma(_3272, _532, _3388);
                    float _3396 = fma(_3272, _534, _3390);
                    float _3398 = fma(_3272, _536, _3392);
                    _3380 = _3396;
                    _3382 = _3394;
                    _3384 = _3398;
                }
                _3386 = false;
                float _3400 = _3380;
                float _3402 = _3382;
                float _3404 = _3384;
                float _3406 = _3400 * _3400;
                float _3408 = -_3148;
                float _3410 = _3408 + _3144;
                float _3412 = fma(_3402, _3402, _3406);
                float _3414 = _3410 + _2740;
                float _3416 = fma(_3404, _3404, _3412);
                float _3418 = rsqrt(_3416);
                float _3420 = _3418 * _3400;
                float _3422 = _3418 * _3402;
                float _3424 = _3418 * _3404;
                float _3426 = _3420 * _2714;
                float _3428 = fma(_3422, _2744, _3426);
                float _3430 = fma(_3424, _2746, _3428);
                float _3432 = _3422 * _3430;
                float _3434 = _3420 * _3430;
                float _3436 = _3424 * _3430;
                float _3438 = -_3432;
                float _3440 = _3438 + _2744;
                float _3442 = -_3434;
                float _3444 = _3442 + _2714;
                float _3446 = -_3436;
                float _3448 = _3446 + _2746;
                float _3450 = _3140 * _3432;
                float _3452 = _3140 * _3434;
                float _3454 = _3140 * _3436;
                float _3456 = -_3450;
                float _3458 = fma(_3142, _3440, _3456);
                float _3460 = -_3452;
                float _3462 = fma(_3142, _3444, _3460);
                float _3464 = -_3454;
                float _3466 = fma(_3142, _3448, _3464);
                _2760 = _3414;
                _2762 = _3458;
                _2764 = _3462;
                _2766 = _3466;
            }
        }
    }
    float _3468 = _2760;
    float _3470 = _2762;
    float _3472 = _2764;
    float _3474 = _2766;
    int _3476 = _170 + 4;
    int _3478 = _170 + 8;
    uint _3480 = uint(int(uint(_192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3480)] = as_type<uint>(_570);
    float _3482 = -_174;
    float _3484 = _3482 + _1094;
    float _3486 = -_180;
    float _3488 = _3486 + _3468;
    uint _3490 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3490)] = as_type<uint>(_1094);
    float _3492 = -_186;
    float _3494 = _3492 + _1096;
    uint _3496 = uint(int(uint(_3476) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3496)] = as_type<uint>(_3468);
    uint _3498 = uint(int(uint(_3478) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3498)] = as_type<uint>(_1096);
    uint _3500 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3500)] = as_type<uint>(_3470);
    uint _3502 = uint(int(uint(_3476) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3502)] = as_type<uint>(_3472);
    uint _3504 = uint(int(uint(_3478) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3504)] = as_type<uint>(_3474);
    uint _3506 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3506)] = as_type<uint>(_3484);
    uint _3508 = uint(int(uint(_3476) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3508)] = as_type<uint>(_3488);
    uint _3510 = uint(int(uint(_3478) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3510)] = as_type<uint>(_3494);
    float _3512 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3514 = _3488 * _3488;
    float _3516 = _3472 * _3472;
    float _3518 = fma(_3484, _3484, _3514);
    float _3520 = fma(_3470, _3470, _3516);
    float _3522 = fma(_3494, _3494, _3518);
    float _3524 = fma(_3474, _3474, _3520);
    float _3526 = sqrt(_3522);
    float _3528 = sqrt(_3524);
    bool _3530 = _3526 >= 9.9999999747524270787835121154785e-07;
    bool _3532 = isnan(_3526);
    bool _3534 = _3530 || _3532;
    bool _3536 = isnan(9.9999999747524270787835121154785e-07);
    bool _3538 = _3534 || _3536;
    if (!_3538)
    {
        bool _3540 = _546 != _300;
        bool _3542 = isnan(_546);
        bool _3544 = _3540 || _3542;
        bool _3546 = isnan(_300);
        bool _3548 = _3544 || _3546;
        _3550 = _3548;
        if (!_3550)
        {
            float _3552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3554 = _3552 > 0.0;
            bool _3556 = !_3554;
            if (!_3556)
            {
                float _3558 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3560 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3562 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3564 = _3560 * _3560;
                float _3566 = fma(_3558, _3558, _3564);
                float _3568 = fma(_3562, _3562, _3566);
                float _3570 = rsqrt(_3568);
                float _3572 = _3570 * 9.9999999747524270787835121154785e-07;
                float _3574 = _3558 * _3572;
                float _3576 = _3560 * _3572;
                float _3578 = _3562 * _3572;
                _340 = as_type<int>(_3574);
                _342 = as_type<int>(_3576);
                _344 = as_type<int>(_3578);
                _3550 = true;
            }
            else
            {
                bool _3580 = _3528 >= 9.9999999747524270787835121154785e-07;
                bool _3582 = isnan(_3528);
                bool _3584 = _3580 || _3582;
                bool _3586 = isnan(9.9999999747524270787835121154785e-07);
                bool _3588 = _3584 || _3586;
                if (!_3588)
                {
                    float _3590 = _3468 * _3468;
                    float _3592 = fma(_1094, _1094, _3590);
                    float _3594 = fma(_1096, _1096, _3592);
                    float _3596 = sqrt(_3594);
                    bool _3598 = _3596 >= 9.9999999747524270787835121154785e-07;
                    bool _3600 = isnan(_3596);
                    bool _3602 = _3598 || _3600;
                    bool _3604 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3606 = _3602 || _3604;
                    float _3608 = _3596;
                    if (_3606)
                    {
                        float _3610 = rsqrt(_3594);
                        _3608 = _3610;
                    }
                    float _3612 = _3608;
                    if (!_3606)
                    {
                        _328 = 0;
                    }
                    int _3614 = _328;
                    int _3616 = _3614;
                    if (!_3606)
                    {
                        _330 = 897988541;
                    }
                    int _3618 = _330;
                    int _3620 = _3618;
                    if (!_3606)
                    {
                        _332 = 0;
                    }
                    int _3622 = _332;
                    float _3624 = _3612;
                    int _3626 = _3622;
                    if (_3606)
                    {
                        float _3628 = _3612 * 9.9999999747524270787835121154785e-07;
                        _3624 = _3628;
                    }
                    float _3630 = _3624;
                    if (_3606)
                    {
                        float _3632 = _1094 * _3630;
                        _3616 = as_type<int>(_3632);
                    }
                    int _3634 = _3616;
                    _340 = _3634;
                    if (_3606)
                    {
                        float _3636 = _3468 * _3630;
                        _3620 = as_type<int>(_3636);
                    }
                    int _3638 = _3620;
                    _342 = _3638;
                    if (_3606)
                    {
                        float _3640 = _1096 * _3630;
                        _3626 = as_type<int>(_3640);
                    }
                    int _3642 = _3626;
                    _344 = _3642;
                    _3550 = true;
                }
                else
                {
                    float _3644 = rsqrt(_3524);
                    float _3646 = _3644 * 9.9999999747524270787835121154785e-07;
                    float _3648 = _3470 * _3646;
                    float _3650 = _3472 * _3646;
                    float _3652 = _3474 * _3646;
                    _340 = as_type<int>(_3648);
                    _342 = as_type<int>(_3650);
                    _344 = as_type<int>(_3652);
                    _3550 = true;
                }
            }
        }
    }
    else
    {
        float _3654 = _3528 * _3512;
        bool _3656 = _3654 >= 0.001000000047497451305389404296875;
        bool _3658 = isnan(_3654);
        bool _3660 = _3656 || _3658;
        bool _3662 = isnan(0.001000000047497451305389404296875);
        bool _3664 = _3660 || _3662;
        bool _3666 = _3654 > 0.0;
        bool _3668 = !_3664;
        bool _3670 = _3666 && _3668;
        bool _3672 = _3526 < 0.001000000047497451305389404296875;
        bool _3674 = _3672 && _3670;
        if (!_3674)
        {
            _334 = as_type<int>(_3484);
        }
        int _3676 = _334;
        int _3678 = _3676;
        if (_3674)
        {
            float _3680 = _3512 * _3470;
            _3678 = as_type<int>(_3680);
        }
        int _3682 = _3678;
        _340 = _3682;
        if (!_3674)
        {
            _336 = as_type<int>(_3488);
        }
        int _3684 = _336;
        int _3686 = _3684;
        if (_3674)
        {
            float _3688 = _3512 * _3472;
            _3686 = as_type<int>(_3688);
        }
        int _3690 = _3686;
        _342 = _3690;
        if (!_3674)
        {
            _338 = as_type<int>(_3494);
        }
        int _3692 = _338;
        _344 = _3692;
        if (_3674)
        {
            float _3694 = _3512 * _3474;
            _344 = as_type<int>(_3694);
        }
    }
    _3550 = false;
    int _3696 = _340;
    int _3698 = _342;
    int _3700 = _344;
    uint _3702 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3702)] = uint(_3696);
    uint _3704 = uint(int(uint(_3476) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3704)] = uint(_3698);
    uint _3706 = uint(int(uint(_3478) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3706)] = uint(_3700);
}

