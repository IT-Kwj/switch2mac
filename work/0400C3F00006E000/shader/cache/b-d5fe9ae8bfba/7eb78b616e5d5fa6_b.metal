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
    texture2d<float> cp_t_tcb_2C [[id(13)]];
    sampler cp_t_tcb_2CSmplr [[id(14)]];
    texture2d_array<float> cp_t_tcb_14 [[id(15)]];
    sampler cp_t_tcb_14Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_16 [[id(17)]];
    sampler cp_t_tcb_16Smplr [[id(18)]];
    sampler cp_t_tcb_2CSmplr_w [[id(19)]];
    sampler cp_t_tcb_14Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _3236 = false;
    bool _1406 = false;
    float _76 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _78 = as_type<float>(gl_LocalInvocationID.x);
    float _80 = as_type<float>(gl_WorkGroupID.x);
    int _83 = as_type<int>(_80) << 5;
    int _85 = _83 + as_type<int>(_78);
    float _87 = trunc(_76);
    int _89 = int(_87);
    bool _93 = _85 >= _89;
    int _95 = 0;
    if (_93)
    {
        _95 = 0;
    }
    int _97 = _95;
    int _99 = _97;
    int _101 = _97;
    if (!_93)
    {
        int _103 = _85 << 4;
        int _105 = _103 + 12;
        uint _108 = uint(int(uint(_105) >> uint(2)));
        float _110 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_108)]);
        float _112 = trunc(_110);
        int _114 = int(_112);
        bool _116 = _114 >= 1;
        int _118 = _116 ? (-1) : 0;
        if (!_116)
        {
            _99 = 0;
        }
        int _120 = _99;
        bool _122 = !_116;
        _101 = _120;
        if (!_122)
        {
            float _124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _126 = uint(int(uint(_105) >> uint(2)));
            float _128 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_126)]);
            float _130 = float(_114);
            float _132 = -_128;
            float _134 = _124 + _132;
            bool _136 = _134 > _130;
            int _138 = as_type<int>(_124);
            if (!_136)
            {
                bool _140 = _124 >= _128;
                bool _142 = isnan(_124);
                bool _144 = _140 || _142;
                bool _146 = isnan(_128);
                bool _148 = _144 || _146;
                _118 = _148 ? (-1) : 0;
            }
            int _150 = _118;
            if (_136)
            {
                _138 = 0;
            }
            int _152 = _138;
            _101 = _152;
            if (!_136)
            {
                int _154 = ~_150;
                int _156 = (_154 != 0) ? 0 : 1;
                _101 = _156;
            }
        }
    }
    int _158 = _101;
    int _160 = _158 & 1;
    bool _162 = _160 != 0;
    if (!_162)
    {
        return;
    }
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _166 = _85 << 4;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = _166 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_174)]);
    int _178 = _166 + 8;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    int _184 = as_type<int>(_164) & 512;
    bool _186 = _184 != 0;
    int _188 = _166 + 12;
    uint _190 = uint(int(uint(_166) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_190)]);
    int _194 = _166 + 4;
    uint _196 = uint(int(uint(_194) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_196)]);
    int _200 = _166 + 8;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    uint _206 = uint(int(uint(_166) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_206)]);
    int _210 = _166 + 4;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_212)]);
    int _216 = _166 + 8;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    float _222 = 0.0;
    float _224 = 0.0;
    float _226 = 0.0;
    if (_186)
    {
        float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _230 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _222 = _228;
        _224 = _230;
        _226 = _232;
    }
    float _234 = _222;
    float _236 = _224;
    float _238 = _226;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = 0.0;
    if (_186)
    {
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _240 = _246;
        _242 = _248;
        _244 = _250;
    }
    float _252 = _240;
    float _254 = _242;
    float _256 = _244;
    float _258 = 0.0;
    float _260 = 0.0;
    float _262 = 0.0;
    if (_186)
    {
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _258 = _264;
        _260 = _266;
        _262 = _268;
    }
    float _270 = _258;
    float _272 = _260;
    float _274 = _262;
    uint _276 = uint(int(uint(_188) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_276)]);
    uint _280 = uint(int(uint(_188) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_280)]);
    float _284 = _252;
    float _286 = _254;
    float _288 = _256;
    float _290 = _236;
    float _292 = _238;
    float _294 = _234;
    float _296 = _272;
    float _298 = _274;
    float _300 = _270;
    float _302 = _198;
    float _304 = _204;
    float _306 = _192;
    int _308 = as_type<int>(_208);
    int _310 = as_type<int>(_214);
    int _312 = as_type<int>(_220);
    int _314 = as_type<int>(_208);
    int _316 = as_type<int>(_214);
    int _318 = as_type<int>(_220);
    int _320 = as_type<int>(_208);
    int _322 = as_type<int>(_214);
    int _324 = as_type<int>(_220);
    if (!_186)
    {
        int _326 = _166 + 4;
        uint _328 = uint(int(uint(_166) >> uint(2)));
        float _330 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_328)]);
        int _332 = _166 + 8;
        uint _334 = uint(int(uint(_166) >> uint(2)));
        float _336 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_334)]);
        uint _338 = uint(int(uint(_326) >> uint(2)));
        float _340 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_338)]);
        uint _342 = uint(int(uint(_332) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_342)]);
        uint _346 = uint(int(uint(_326) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_166) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_350)]);
        uint _354 = uint(int(uint(_332) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_326) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_332) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        float _366 = _330 * _330;
        float _368 = fma(_336, _336, _366);
        float _370 = _340 * _340;
        float _372 = _344 * _344;
        float _374 = fma(_348, _348, _370);
        float _376 = fma(_352, _352, _368);
        float _378 = fma(_356, _356, _372);
        float _380 = fma(_360, _360, _374);
        float _382 = sqrt(_376);
        float _384 = fma(_364, _364, _378);
        float _386 = sqrt(_380);
        float _388 = sqrt(_384);
        bool _390 = _382 > 0.0;
        bool _392 = _386 > 0.0;
        bool _394 = _388 > 0.0;
        float _396 = _372;
        float _398 = _374;
        float _400 = _378;
        float _402 = _382;
        float _404 = _386;
        float _406 = _388;
        float _408 = _376;
        float _410 = _340;
        float _412 = _352;
        float _414 = _380;
        if (_390)
        {
            float _416 = rsqrt(_376);
            _396 = _416;
        }
        float _418 = _396;
        float _420 = 0.0;
        if (_392)
        {
            float _422 = rsqrt(_380);
            _420 = _422;
        }
        float _424 = _420;
        float _426 = 0.0;
        if (_394)
        {
            float _428 = rsqrt(_384);
            _426 = _428;
        }
        float _430 = _426;
        if (!_390)
        {
            _398 = 0.0;
        }
        float _432 = _398;
        float _434 = _432;
        if (_390)
        {
            float _436 = _352 * _418;
            _434 = _436;
        }
        float _438 = _434;
        _300 = _438;
        if (!_392)
        {
            _400 = 0.0;
        }
        float _440 = _400;
        float _442 = _440;
        if (!_390)
        {
            _402 = 0.0;
        }
        float _444 = _402;
        float _446 = _444;
        if (_390)
        {
            float _448 = _330 * _418;
            _446 = _448;
        }
        float _450 = _446;
        _284 = _450;
        if (!_390)
        {
            _404 = 0.0;
        }
        float _452 = _404;
        float _454 = _452;
        if (_392)
        {
            float _456 = _340 * _424;
            _442 = _456;
        }
        float _458 = _442;
        _286 = _458;
        if (!_392)
        {
            _406 = 0.0;
        }
        float _460 = _406;
        float _462 = _460;
        if (_390)
        {
            float _464 = _336 * _418;
            _454 = _464;
        }
        float _466 = _454;
        _294 = _466;
        if (!_392)
        {
            _408 = 0.0;
        }
        float _468 = _408;
        float _470 = _468;
        if (_392)
        {
            float _472 = _348 * _424;
            _462 = _472;
        }
        float _474 = _462;
        _290 = _474;
        if (!_394)
        {
            _410 = 0.0;
        }
        float _476 = _410;
        float _478 = _476;
        if (_392)
        {
            float _480 = _360 * _424;
            _470 = _480;
        }
        float _482 = _470;
        _296 = _482;
        if (!_394)
        {
            _412 = 0.0;
        }
        float _484 = _412;
        float _486 = _484;
        if (_394)
        {
            float _488 = _344 * _430;
            _478 = _488;
        }
        float _490 = _478;
        _288 = _490;
        if (!_394)
        {
            _414 = 0.0;
        }
        float _492 = _414;
        _298 = _492;
        if (_394)
        {
            float _494 = _356 * _430;
            _486 = _494;
        }
        float _496 = _486;
        _292 = _496;
        if (_394)
        {
            float _498 = _364 * _430;
            _298 = _498;
        }
    }
    float _500 = _284;
    float _502 = _286;
    float _504 = _288;
    float _506 = _290;
    float _508 = _292;
    float _510 = _294;
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _520 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[27]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[45]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[24]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[25]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[26]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    bool _544 = _532 > 0.0;
    float _546 = 0.0;
    if (_544)
    {
        float _548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[52]);
        _546 = _548;
    }
    float _550 = _546;
    float _552 = abs(_518);
    float _554 = log2(_552);
    float _556 = _522 * _530;
    float _558 = trunc(_528);
    int _560 = int(_558);
    float _562 = _520 * _530;
    float _564 = _556 * _500;
    float _566 = _556 * _502;
    float _568 = _556 * _504;
    float _570 = _534 * _554;
    float _572 = exp2(_570);
    float _574 = _524 * _530;
    float _576 = fma(_562, _506, _566);
    float _578 = fma(_562, _508, _568);
    bool _580 = _560 != 1;
    float _582 = fma(_562, _510, _564);
    float _584 = fma(_574, _512, _576);
    float _586 = fma(_574, _514, _578);
    float _588 = fma(_574, _516, _582);
    float _590 = _282 * _538;
    float _592 = _534 * _584;
    float _594 = _534 * _586;
    float _596 = _534 * _588;
    float _598 = _282 * _536;
    float _600 = _534 * _590;
    float _602 = fma(_198, _572, _592);
    float _604 = fma(_204, _572, _594);
    float _606 = _198 * _534;
    float _608 = _204 * _534;
    float _610 = fma(_192, _572, _596);
    float _612 = _282 * _540;
    float _614 = _534 * _598;
    float _616 = _572;
    float _618 = _614;
    float _620 = _600;
    float _622 = _526;
    float _624 = _592;
    float _626 = _578;
    float _628 = _586;
    float _630 = _608;
    float _632 = _590;
    float _634 = as_type<float>(_560);
    float _636 = _606;
    float _638 = _590;
    float _640 = as_type<float>(_560);
    float _642 = _606;
    float _644 = _598;
    float _646 = _608;
    float _648 = _612;
    float _650 = _586;
    if (!_580)
    {
        float _652 = _600 * _500;
        _302 = _652;
    }
    float _654 = _302;
    if (!_580)
    {
        float _656 = _600 * _502;
        _304 = _656;
    }
    float _658 = _304;
    float _660 = _658;
    if (!_580)
    {
        float _662 = _600 * _504;
        _616 = _662;
    }
    float _664 = _616;
    float _666 = _192 * _534;
    float _668 = _534 * _612;
    float _670 = _664;
    float _672 = _668;
    if (!_580)
    {
        float _674 = fma(_614, _510, _654);
        _306 = _674;
    }
    float _676 = _306;
    if (!_580)
    {
        float _678 = fma(_614, _506, _658);
        _660 = _678;
    }
    float _680 = _660;
    float _682 = _680;
    if (!_580)
    {
        float _684 = fma(_614, _508, _664);
        _670 = _684;
    }
    float _686 = _670;
    float _688 = _686;
    if (!_580)
    {
        float _690 = fma(_668, _516, _676);
        _618 = _690;
    }
    float _692 = _618;
    if (!_580)
    {
        float _694 = fma(_668, _512, _680);
        _620 = _694;
    }
    float _696 = _620;
    if (!_580)
    {
        float _698 = fma(_668, _514, _686);
        _672 = _698;
    }
    float _700 = _672;
    float _702 = fma(_282, _666, _170);
    float _704 = fma(_282, _606, _176);
    float _706 = fma(_282, _608, _182);
    float _708 = -_278;
    float _710 = _542 + _708;
    float _712 = _692 + _702;
    float _714 = _696 + _704;
    float _716 = _700 + _706;
    bool _718 = _550 == 0.0;
    bool _720 = _550 == 0.0;
    bool _722 = _720 && _544;
    float _724 = _702;
    float _726 = _550;
    float _728 = _706;
    float _730 = _704;
    float _732 = _550;
    float _734 = _702;
    if (_722)
    {
        _622 = 0.0;
    }
    float _736 = _622;
    float _738 = _736;
    if (_722)
    {
        _624 = 0.0;
        _626 = 0.0;
    }
    float _740 = _624;
    float _742 = _626;
    bool _744 = _544 && _718;
    float _746 = _742;
    float _748 = _740;
    float _750 = 0.0;
    if (!_744)
    {
        float _752 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[44]);
        float _754 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[40]);
        float _756 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[41]);
        float _758 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[42]);
        float _760 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        bool _762 = _550 > 0.0;
        bool _764 = _762 && _544;
        float _766 = trunc(_752);
        int _768 = int(_766);
        bool _770 = _768 > 0;
        float _772 = 0.0;
        if (!_770)
        {
            _772 = 0.0;
        }
        float _774 = _772;
        float _776 = 0.0;
        float _778 = 0.0;
        float _780 = _774;
        float _782 = _774;
        if (!_770)
        {
            _776 = 0.0;
            _778 = 0.0;
        }
        float _784 = _776;
        float _786 = _778;
        bool _788 = !_770;
        float _790 = _784;
        float _792 = _786;
        float _794 = _760;
        float _796 = _784;
        float _798 = _786;
        float _800 = _754;
        float _802 = _756;
        float _804 = _758;
        if (!_788)
        {
            int _806 = as_type<int>(_164) & 2048;
            bool _808 = _806 != 0;
            if (!_808)
            {
                _780 = 0.0;
            }
            float _810 = _780;
            _782 = _810;
            if (!_808)
            {
                _790 = 0.0;
                _792 = 0.0;
            }
            float _812 = _790;
            float _814 = _792;
            bool _816 = !_808;
            _796 = _812;
            _798 = _814;
            if (!_816)
            {
                float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                uint _820 = uint(int(uint(_166) >> uint(2)));
                float _822 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_820)]);
                int _824 = _166 + 4;
                uint _826 = uint(int(uint(_824) >> uint(2)));
                float _828 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_826)]);
                int _830 = _166 + 8;
                uint _832 = uint(int(uint(_830) >> uint(2)));
                float _834 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_832)]);
                int _836 = _166 + 12;
                uint _838 = uint(int(uint(_836) >> uint(2)));
                float _840 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_838)]);
                uint _842 = uint(int(uint(_166) >> uint(2)));
                float _844 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_842)]);
                int _846 = _166 + 4;
                uint _848 = uint(int(uint(_846) >> uint(2)));
                float _850 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_848)]);
                int _852 = _166 + 8;
                uint _854 = uint(int(uint(_852) >> uint(2)));
                float _856 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_854)]);
                int _858 = _166 + 12;
                uint _860 = uint(int(uint(_858) >> uint(2)));
                float _862 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_860)]);
                uint _864 = uint(int(uint(_166) >> uint(2)));
                float _866 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_864)]);
                int _868 = _166 + 4;
                uint _870 = uint(int(uint(_868) >> uint(2)));
                float _872 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_870)]);
                int _874 = _166 + 8;
                uint _876 = uint(int(uint(_874) >> uint(2)));
                float _878 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_876)]);
                int _880 = _166 + 12;
                uint _882 = uint(int(uint(_880) >> uint(2)));
                float _884 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_882)]);
                float _886 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _888 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _890 = _834 * _844;
                float _892 = _834 * _850;
                float _894 = -_890;
                float _896 = fma(_822, _856, _894);
                float _898 = _840 * _856;
                float _900 = _840 * _850;
                float _902 = _840 * _844;
                float _904 = _828 * _844;
                float _906 = -_892;
                float _908 = fma(_828, _856, _906);
                float _910 = _872 * _896;
                float _912 = -_904;
                float _914 = fma(_822, _850, _912);
                float _916 = -_910;
                float _918 = fma(_866, _908, _916);
                float _920 = fma(_878, _914, _918);
                float _922 = _872 * _856;
                float _924 = -_900;
                float _926 = fma(_828, _862, _924);
                float _928 = 1.0 / _920;
                float _930 = -_902;
                float _932 = fma(_822, _862, _930);
                float _934 = -_922;
                float _936 = fma(_878, _850, _934);
                float _938 = _866 * _850;
                float _940 = _878 * _828;
                float _942 = _866 * _834;
                float _944 = -_898;
                float _946 = fma(_834, _862, _944);
                float _948 = _878 * _932;
                float _950 = _878 * _844;
                float _952 = -_940;
                float _954 = fma(_872, _834, _952);
                float _956 = -_822;
                float _958 = fma(_956, _856, _890);
                float _960 = -_942;
                float _962 = fma(_878, _822, _960);
                float _964 = _872 * _822;
                float _966 = _872 * _932;
                float _968 = -_948;
                float _970 = fma(_866, _946, _968);
                float _972 = -_950;
                float _974 = fma(_866, _856, _972);
                float _976 = -_938;
                float _978 = fma(_872, _844, _976);
                float _980 = -_964;
                float _982 = fma(_866, _828, _980);
                float _984 = -_966;
                float _986 = fma(_866, _926, _984);
                float _988 = fma(_884, _896, _970);
                float _990 = _878 * _926;
                float _992 = _974 * _928;
                float _994 = _936 * _928;
                float _996 = _978 * _928;
                float _998 = -_990;
                float _1000 = fma(_872, _946, _998);
                float _1002 = _818 * _992;
                float _1004 = _818 * _994;
                float _1006 = _958 * _928;
                float _1008 = _886 * _928;
                float _1010 = _818 * _996;
                float _1012 = _954 * _928;
                float _1014 = fma(_886, _1006, _1002);
                float _1016 = fma(_908, _1008, _1004);
                float _1018 = fma(_914, _1008, _1010);
                float _1020 = _962 * _928;
                float _1022 = _982 * _928;
                float _1024 = fma(_884, _908, _1000);
                float _1026 = fma(_884, _914, _986);
                float _1028 = fma(_888, _1012, _1016);
                float _1030 = fma(_888, _1020, _1014);
                float _1032 = fma(_888, _1022, _1018);
                float _1034 = -_1024;
                float _1036 = fma(_1034, _928, _1028);
                float _1038 = fma(_988, _928, _1030);
                float _1040 = -_1026;
                float _1042 = fma(_1040, _928, _1032);
                _794 = _886;
                _628 = _856;
                _630 = _1032;
                _724 = _1028;
                _632 = _1002;
                _634 = _1008;
                _636 = _1024;
                _726 = _884;
                _782 = _1036;
                _796 = _1038;
                _798 = _1042;
            }
        }
        float _1044 = _794;
        float _1046 = _628;
        float _1048 = _630;
        float _1050 = _724;
        float _1052 = _632;
        float _1054 = _634;
        float _1056 = _636;
        float _1058 = _726;
        float _1060 = _782;
        float _1062 = _796;
        float _1064 = _798;
        bool _1066 = !_764;
        float _1068 = _1044;
        float _1070 = _1052;
        float _1072 = _1054;
        float _1074 = _1056;
        float _1076 = _1058;
        float _1078 = _1048;
        float _1080 = _1050;
        float _1082 = _1046;
        if (!_1066)
        {
            float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[48]);
            float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[49]);
            float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[50]);
            float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[51]);
            bool _1092 = !_186;
            _800 = _1084;
            _802 = _1086;
            _804 = _1088;
            _1068 = _1090;
            if (!_1092)
            {
                float _1094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                float _1096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                float _1098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                float _1100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                float _1102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[28]);
                float _1104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[29]);
                float _1106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[30]);
                float _1108 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[31]);
                float _1110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                float _1112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                float _1114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                float _1116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                float _1118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                float _1120 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                float _1122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                float _1124 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                float _1126 = _1100 * _1104;
                float _1128 = _1100 * _1106;
                float _1130 = _1100 * _1102;
                float _1132 = _1116 * _1098;
                float _1134 = _1116 * _1096;
                float _1136 = _1116 * _1094;
                float _1138 = _1116 * _1106;
                float _1140 = _1116 * _1104;
                float _1142 = _1116 * _1102;
                float _1144 = -_1126;
                float _1146 = fma(_1096, _1108, _1144);
                float _1148 = -_1132;
                float _1150 = fma(_1114, _1100, _1148);
                float _1152 = -_1134;
                float _1154 = fma(_1112, _1100, _1152);
                float _1156 = -_1136;
                float _1158 = fma(_1110, _1100, _1156);
                float _1160 = _1098 * _1104;
                float _1162 = _1098 * _1102;
                float _1164 = _1114 * _1104;
                float _1166 = _1114 * _1102;
                float _1168 = -_1128;
                float _1170 = fma(_1098, _1108, _1168);
                float _1172 = -_1130;
                float _1174 = fma(_1094, _1108, _1172);
                float _1176 = -_1138;
                float _1178 = fma(_1114, _1108, _1176);
                float _1180 = -_1140;
                float _1182 = fma(_1112, _1108, _1180);
                float _1184 = -_1142;
                float _1186 = fma(_1110, _1108, _1184);
                float _1188 = _1096 * _1102;
                float _1190 = -_1160;
                float _1192 = fma(_1096, _1106, _1190);
                float _1194 = -_1162;
                float _1196 = fma(_1094, _1106, _1194);
                float _1198 = -_1164;
                float _1200 = fma(_1112, _1106, _1198);
                float _1202 = -_1166;
                float _1204 = fma(_1110, _1106, _1202);
                float _1206 = _1114 * _1096;
                float _1208 = _1114 * _1094;
                float _1210 = -_1188;
                float _1212 = fma(_1094, _1104, _1210);
                float _1214 = _1112 * _1094;
                float _1216 = -_1206;
                float _1218 = fma(_1112, _1098, _1216);
                float _1220 = -_1208;
                float _1222 = fma(_1110, _1098, _1220);
                float _1224 = _1114 * _1174;
                float _1226 = -_1214;
                float _1228 = fma(_1110, _1096, _1226);
                float _1230 = _1114 * _1146;
                float _1232 = _1112 * _1102;
                float _1234 = -_1224;
                float _1236 = fma(_1110, _1170, _1234);
                float _1238 = _1112 * _1174;
                float _1240 = -_1230;
                float _1242 = fma(_1112, _1170, _1240);
                float _1244 = -_1232;
                float _1246 = fma(_1110, _1104, _1244);
                float _1248 = fma(_1116, _1196, _1236);
                float _1250 = _1112 * _1196;
                float _1252 = -_1238;
                float _1254 = fma(_1110, _1146, _1252);
                float _1256 = fma(_1116, _1192, _1242);
                float _1258 = _1120 * _1248;
                float _1260 = -_1250;
                float _1262 = fma(_1110, _1192, _1260);
                float _1264 = _1122 * _1146;
                float _1266 = fma(_1116, _1212, _1254);
                float _1268 = -_1258;
                float _1270 = fma(_1118, _1256, _1268);
                float _1272 = fma(_1114, _1212, _1262);
                float _1274 = -_1264;
                float _1276 = fma(_1120, _1170, _1274);
                float _1278 = _1122 * _1174;
                float _1280 = fma(_1122, _1266, _1270);
                float _1282 = _1120 * _1174;
                float _1284 = _1122 * _1154;
                float _1286 = -_1278;
                float _1288 = fma(_1118, _1170, _1286);
                float _1290 = -_1124;
                float _1292 = fma(_1290, _1272, _1280);
                float _1294 = _1122 * _1186;
                float _1296 = -_1282;
                float _1298 = fma(_1118, _1146, _1296);
                float _1300 = _1122 * _1182;
                float _1302 = 1.0 / _1292;
                float _1304 = -_1294;
                float _1306 = fma(_1118, _1178, _1304);
                float _1308 = _1122 * _1158;
                float _1310 = fma(_1124, _1192, _1276);
                float _1312 = _1120 * _1186;
                float _1314 = -_1284;
                float _1316 = fma(_1120, _1150, _1314);
                float _1318 = fma(_1124, _1212, _1298);
                float _1320 = _1120 * _1158;
                float _1322 = -_1308;
                float _1324 = fma(_1118, _1150, _1322);
                float _1326 = fma(_1124, _1196, _1288);
                float _1328 = -_1300;
                float _1330 = fma(_1120, _1178, _1328);
                float _1332 = -_1312;
                float _1334 = fma(_1118, _1182, _1332);
                float _1336 = -_1320;
                float _1338 = fma(_1118, _1154, _1336);
                float _1340 = fma(_1124, _1204, _1306);
                float _1342 = fma(_1124, _1200, _1330);
                float _1344 = fma(_1124, _1246, _1334);
                float _1346 = _1248 * _1302;
                float _1348 = _1310 * _1302;
                float _1350 = _1318 * _1302;
                float _1352 = _1326 * _1302;
                float _1354 = _1084 * _1346;
                float _1356 = _1256 * _1302;
                float _1358 = _1086 * _1348;
                float _1360 = _1266 * _1302;
                float _1362 = _1086 * _1350;
                float _1364 = -_1354;
                float _1366 = fma(_1086, _1352, _1364);
                float _1368 = -_1358;
                float _1370 = fma(_1084, _1356, _1368);
                float _1372 = _1342 * _1302;
                float _1374 = -_1362;
                float _1376 = fma(_1084, _1360, _1374);
                float _1378 = _1340 * _1302;
                float _1380 = _1344 * _1302;
                float _1382 = fma(_1124, _1218, _1316);
                float _1384 = fma(_1088, _1372, _1370);
                float _1386 = fma(_1124, _1222, _1324);
                float _1388 = fma(_1124, _1228, _1338);
                float _1390 = -_1378;
                float _1392 = fma(_1088, _1390, _1366);
                float _1394 = fma(_1088, _1380, _1376);
                float _1396 = -_1382;
                float _1398 = fma(_1396, _1302, _1384);
                float _1400 = fma(_1386, _1302, _1392);
                float _1402 = -_1388;
                float _1404 = fma(_1402, _1302, _1394);
                _800 = _1398;
                _802 = _1400;
                _804 = _1404;
                _1068 = _1392;
                _1070 = _1354;
                _1072 = _1370;
                _1074 = _1344;
                _1076 = _1124;
                _1078 = _1394;
                _1080 = _1360;
                _1082 = _1248;
                _1406 = true;
            }
            else
            {
                int _1408 = as_type<int>(_164) & 1024;
                bool _1410 = _1408 != 0;
                bool _1412 = !_1410;
                if (!_1412)
                {
                    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
                    uint _1416 = uint(int(uint(_166) >> uint(2)));
                    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1416)]);
                    int _1420 = _166 + 4;
                    uint _1422 = uint(int(uint(_1420) >> uint(2)));
                    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1422)]);
                    int _1426 = _166 + 8;
                    uint _1428 = uint(int(uint(_1426) >> uint(2)));
                    float _1430 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1428)]);
                    uint _1432 = uint(int(uint(_166) >> uint(2)));
                    float _1434 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1432)]);
                    int _1436 = _166 + 4;
                    uint _1438 = uint(int(uint(_1436) >> uint(2)));
                    float _1440 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1438)]);
                    int _1442 = _166 + 8;
                    uint _1444 = uint(int(uint(_1442) >> uint(2)));
                    float _1446 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1444)]);
                    uint _1448 = uint(int(uint(_166) >> uint(2)));
                    float _1450 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1448)]);
                    int _1452 = _166 + 4;
                    uint _1454 = uint(int(uint(_1452) >> uint(2)));
                    float _1456 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1454)]);
                    int _1458 = _166 + 8;
                    uint _1460 = uint(int(uint(_1458) >> uint(2)));
                    float _1462 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1460)]);
                    float _1464 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
                    float _1466 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _1468 = _1430 * _1434;
                    float _1470 = _1430 * _1440;
                    float _1472 = -_1468;
                    float _1474 = fma(_1418, _1446, _1472);
                    float _1476 = _1424 * _1434;
                    float _1478 = -_1470;
                    float _1480 = fma(_1424, _1446, _1478);
                    float _1482 = _1456 * _1474;
                    float _1484 = -_1476;
                    float _1486 = fma(_1418, _1440, _1484);
                    float _1488 = -_1482;
                    float _1490 = fma(_1450, _1480, _1488);
                    float _1492 = _1414 * _1446;
                    float _1494 = _1414 * _1440;
                    float _1496 = _1414 * _1434;
                    float _1498 = fma(_1462, _1486, _1490);
                    float _1500 = 1.0 / _1498;
                    float _1502 = _1462 * _1434;
                    float _1504 = _1456 * _1446;
                    float _1506 = -_1494;
                    float _1508 = fma(_1464, _1424, _1506);
                    float _1510 = -_1418;
                    float _1512 = fma(_1510, _1446, _1468);
                    float _1514 = _1450 * _1440;
                    float _1516 = -_1492;
                    float _1518 = fma(_1464, _1430, _1516);
                    float _1520 = -_1496;
                    float _1522 = fma(_1464, _1418, _1520);
                    float _1524 = _1450 * _1430;
                    float _1526 = -_1502;
                    float _1528 = fma(_1450, _1446, _1526);
                    float _1530 = -_1504;
                    float _1532 = fma(_1462, _1440, _1530);
                    float _1534 = _1456 * _1418;
                    float _1536 = -_1514;
                    float _1538 = fma(_1456, _1434, _1536);
                    float _1540 = -_1524;
                    float _1542 = fma(_1462, _1418, _1540);
                    float _1544 = _1462 * _1424;
                    float _1546 = _1462 * _1508;
                    float _1548 = _1532 * _1500;
                    float _1550 = _1528 * _1500;
                    float _1552 = -_1534;
                    float _1554 = fma(_1450, _1424, _1552);
                    float _1556 = _1538 * _1500;
                    float _1558 = _1462 * _1522;
                    float _1560 = -_1544;
                    float _1562 = fma(_1456, _1430, _1560);
                    float _1564 = _1456 * _1522;
                    float _1566 = -_1546;
                    float _1568 = fma(_1456, _1518, _1566);
                    float _1570 = _1548 * _1086;
                    float _1572 = _1550 * _1086;
                    float _1574 = _1556 * _1086;
                    float _1576 = _1512 * _1500;
                    float _1578 = _1480 * _1500;
                    float _1580 = _1486 * _1500;
                    float _1582 = -_1558;
                    float _1584 = fma(_1450, _1518, _1582);
                    float _1586 = fma(_1576, _1084, _1572);
                    float _1588 = fma(_1084, _1578, _1570);
                    float _1590 = fma(_1084, _1580, _1574);
                    float _1592 = _1542 * _1500;
                    float _1594 = _1562 * _1500;
                    float _1596 = _1554 * _1500;
                    float _1598 = -_1564;
                    float _1600 = fma(_1450, _1508, _1598);
                    float _1602 = fma(_1592, _1088, _1586);
                    float _1604 = fma(_1594, _1088, _1588);
                    float _1606 = fma(_1466, _1474, _1584);
                    float _1608 = fma(_1596, _1088, _1590);
                    float _1610 = fma(_1466, _1480, _1568);
                    float _1612 = fma(_1466, _1486, _1600);
                    float _1614 = fma(_1606, _1500, _1602);
                    float _1616 = -_1610;
                    float _1618 = fma(_1616, _1500, _1604);
                    float _1620 = -_1612;
                    float _1622 = fma(_1620, _1500, _1608);
                    _800 = _1618;
                    _802 = _1614;
                    _804 = _1622;
                    _1068 = _1518;
                    _1070 = _1610;
                    _1072 = _1606;
                    _1074 = _1580;
                    _1076 = _1612;
                    _1078 = _1604;
                    _1080 = _1508;
                    _1082 = _1548;
                    _1406 = true;
                }
                else
                {
                    int _1624 = as_type<int>(_164) & 2048;
                    bool _1626 = _1624 != 0;
                    bool _1628 = !_1626;
                    if (!_1628)
                    {
                        uint _1630 = uint(int(uint(_166) >> uint(2)));
                        float _1632 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1630)]);
                        int _1634 = _166 + 4;
                        uint _1636 = uint(int(uint(_1634) >> uint(2)));
                        float _1638 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1636)]);
                        int _1640 = _166 + 8;
                        uint _1642 = uint(int(uint(_1640) >> uint(2)));
                        float _1644 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1642)]);
                        int _1646 = _166 + 12;
                        uint _1648 = uint(int(uint(_1646) >> uint(2)));
                        float _1650 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_1648)]);
                        uint _1652 = uint(int(uint(_166) >> uint(2)));
                        float _1654 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1652)]);
                        int _1656 = _166 + 4;
                        uint _1658 = uint(int(uint(_1656) >> uint(2)));
                        float _1660 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1658)]);
                        int _1662 = _166 + 8;
                        uint _1664 = uint(int(uint(_1662) >> uint(2)));
                        float _1666 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1664)]);
                        int _1668 = _166 + 12;
                        uint _1670 = uint(int(uint(_1668) >> uint(2)));
                        float _1672 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1670)]);
                        uint _1674 = uint(int(uint(_166) >> uint(2)));
                        float _1676 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1674)]);
                        int _1678 = _166 + 4;
                        uint _1680 = uint(int(uint(_1678) >> uint(2)));
                        float _1682 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1680)]);
                        int _1684 = _166 + 8;
                        uint _1686 = uint(int(uint(_1684) >> uint(2)));
                        float _1688 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1686)]);
                        int _1690 = _166 + 12;
                        uint _1692 = uint(int(uint(_1690) >> uint(2)));
                        float _1694 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1692)]);
                        float _1696 = _1644 * _1654;
                        float _1698 = _1644 * _1660;
                        float _1700 = _1638 * _1654;
                        float _1702 = _1650 * _1660;
                        float _1704 = -_1696;
                        float _1706 = fma(_1632, _1666, _1704);
                        float _1708 = -_1698;
                        float _1710 = fma(_1638, _1666, _1708);
                        float _1712 = -_1700;
                        float _1714 = fma(_1632, _1660, _1712);
                        float _1716 = _1682 * _1666;
                        float _1718 = _1682 * _1706;
                        float _1720 = _1676 * _1660;
                        float _1722 = _1650 * _1666;
                        float _1724 = -_1716;
                        float _1726 = fma(_1688, _1660, _1724);
                        float _1728 = -_1718;
                        float _1730 = fma(_1676, _1710, _1728);
                        float _1732 = _1688 * _1654;
                        float _1734 = _1650 * _1654;
                        float _1736 = -_1702;
                        float _1738 = fma(_1638, _1672, _1736);
                        float _1740 = fma(_1688, _1714, _1730);
                        float _1742 = -_1632;
                        float _1744 = fma(_1742, _1666, _1696);
                        float _1746 = -_1732;
                        float _1748 = fma(_1676, _1666, _1746);
                        float _1750 = -_1720;
                        float _1752 = fma(_1682, _1654, _1750);
                        float _1754 = -_1722;
                        float _1756 = fma(_1644, _1672, _1754);
                        float _1758 = -_1734;
                        float _1760 = fma(_1632, _1672, _1758);
                        float _1762 = 1.0 / _1740;
                        float _1764 = _1676 * _1644;
                        float _1766 = _1688 * _1638;
                        float _1768 = _1682 * _1632;
                        float _1770 = _1682 * _1760;
                        float _1772 = -_1764;
                        float _1774 = fma(_1688, _1632, _1772);
                        float _1776 = -_1766;
                        float _1778 = fma(_1682, _1644, _1776);
                        float _1780 = _1688 * _1738;
                        float _1782 = -_1768;
                        float _1784 = fma(_1676, _1638, _1782);
                        float _1786 = _1688 * _1760;
                        float _1788 = -_1770;
                        float _1790 = fma(_1676, _1738, _1788);
                        float _1792 = -_1780;
                        float _1794 = fma(_1682, _1756, _1792);
                        float _1796 = -_1786;
                        float _1798 = fma(_1676, _1756, _1796);
                        float _1800 = fma(_1694, _1714, _1790);
                        float _1802 = fma(_1694, _1710, _1794);
                        float _1804 = _1726 * _1762;
                        float _1806 = _1748 * _1762;
                        float _1808 = _1752 * _1762;
                        float _1810 = _1744 * _1762;
                        float _1812 = _1804 * _1086;
                        float _1814 = _1806 * _1086;
                        float _1816 = _1808 * _1086;
                        float _1818 = _1710 * _1762;
                        float _1820 = _1714 * _1762;
                        float _1822 = fma(_1810, _1084, _1814);
                        float _1824 = _1774 * _1762;
                        float _1826 = fma(_1084, _1818, _1812);
                        float _1828 = fma(_1084, _1820, _1816);
                        float _1830 = _1778 * _1762;
                        float _1832 = _1784 * _1762;
                        float _1834 = fma(_1824, _1088, _1822);
                        float _1836 = fma(_1694, _1706, _1798);
                        float _1838 = fma(_1830, _1088, _1826);
                        float _1840 = fma(_1832, _1088, _1828);
                        float _1842 = fma(_1836, _1762, _1834);
                        float _1844 = -_1802;
                        float _1846 = fma(_1844, _1762, _1838);
                        float _1848 = -_1800;
                        float _1850 = fma(_1848, _1762, _1840);
                        _800 = _1846;
                        _802 = _1842;
                        _804 = _1850;
                        _1068 = _1838;
                        _1070 = _1826;
                        _1072 = _1682;
                        _1074 = _1836;
                        _1076 = _1694;
                        _1078 = _1840;
                        _1080 = _1834;
                        _1082 = _1822;
                    }
                }
            }
        }
        _1406 = false;
        float _1852 = _800;
        float _1854 = _802;
        float _1856 = _804;
        float _1858 = _1068;
        float _1860 = _1070;
        float _1862 = _1072;
        float _1864 = _1074;
        float _1866 = _1076;
        float _1868 = _1078;
        float _1870 = _1080;
        float _1872 = _1082;
        float _1874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[43]);
        float _1876 = _1060 + _1852;
        float _1878 = _1062 + _1854;
        float _1880 = _1064 + _1856;
        float _1882 = -_712;
        float _1884 = _1882 + _1876;
        float _1886 = -_714;
        float _1888 = _1886 + _1878;
        float _1890 = -_716;
        float _1892 = _1890 + _1880;
        float _1894 = _1884 * _1874;
        float _1896 = _1888 * _1874;
        float _1898 = _1892 * _1874;
        float _1900 = _282 * _1894;
        float _1902 = _282 * _1896;
        float _1904 = _282 * _1898;
        float _1906 = _534 * _1900;
        float _1908 = _534 * _1902;
        float _1910 = _534 * _1904;
        _728 = _1900;
        _730 = _1888;
        _682 = _1904;
        _688 = _1858;
        _638 = _1860;
        _640 = _1862;
        _642 = _1864;
        _732 = _1866;
        _644 = _1874;
        _646 = _1868;
        _648 = _1902;
        _734 = _1870;
        _746 = _1908;
        _738 = _1906;
        _748 = _1910;
        _650 = _1872;
        _750 = _1884;
    }
    float _1912 = _728;
    float _1914 = _730;
    float _1916 = _682;
    float _1918 = _688;
    float _1920 = _638;
    float _1922 = _640;
    float _1924 = _642;
    float _1926 = _732;
    float _1928 = _644;
    float _1930 = _646;
    float _1932 = _648;
    float _1934 = _734;
    float _1936 = _746;
    float _1938 = _738;
    float _1940 = _748;
    float _1942 = _650;
    float _1944 = _750;
    float _1946 = _1912;
    float _1948 = _1914;
    float _1950 = _1916;
    float _1952 = _1918;
    float _1954 = _1940;
    float _1956 = _1944;
    float _1958 = _1942;
    if (_186)
    {
        float _1960 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1962 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1964 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1966 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1946 = _1960;
        _1948 = _1962;
        _1950 = _1964;
        _1952 = _1966;
    }
    float _1968 = _1946;
    float _1970 = _1948;
    float _1972 = _1950;
    float _1974 = _1952;
    float _1976 = _1920;
    float _1978 = _1922;
    float _1980 = _1924;
    float _1982 = _1926;
    if (_186)
    {
        float _1984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1976 = _1984;
        _1978 = _1986;
        _1980 = _1988;
        _1982 = _1990;
    }
    float _1992 = _1976;
    float _1994 = _1978;
    float _1996 = _1980;
    float _1998 = _1982;
    float _2000 = _1928;
    float _2002 = _1930;
    float _2004 = _1932;
    float _2006 = _1934;
    if (_186)
    {
        float _2008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2000 = _2008;
        _2002 = _2010;
        _2004 = _2012;
        _2006 = _2014;
    }
    float _2016 = _2000;
    float _2018 = _2002;
    float _2020 = _2004;
    float _2022 = _2006;
    float _2024 = _714 + _1936;
    float _2026 = _712 + _1938;
    int _2028 = as_type<int>(_164) & 1024;
    bool _2030 = _2028 != 0;
    float _2032 = _716 + _1940;
    float _2034 = _2024;
    if (!_186)
    {
        _1954 = 0.0;
    }
    float _2036 = _1954;
    uint _2038 = uint(int(uint(_188) >> uint(2)));
    float _2040 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_2038)]);
    float _2042 = _2036;
    if (!_186)
    {
        _1956 = 0.0;
    }
    float _2044 = _1956;
    int _2046 = as_type<int>(_164) & 2048;
    bool _2048 = _2046 != 0;
    float _2050 = _1968;
    float _2052 = _1972;
    float _2054 = _2044;
    if (_186)
    {
        float _2056 = _2024 * _1970;
        _1958 = _2056;
    }
    float _2058 = _1958;
    float _2060 = _1994;
    float _2062 = _1992;
    float _2064 = _1996;
    float _2066 = _2016;
    float _2068 = _1998;
    if (_186)
    {
        float _2070 = _2024 * _1994;
        _2060 = _2070;
    }
    float _2072 = _2060;
    float _2074 = _2072;
    if (_186)
    {
        float _2076 = fma(_2026, _1968, _2058);
        _2050 = _2076;
    }
    float _2078 = _2050;
    float _2080 = _2078;
    if (_186)
    {
        float _2082 = fma(_2026, _1992, _2072);
        _2074 = _2082;
    }
    float _2084 = _2074;
    if (_186)
    {
        float _2086 = _2024 * _2018;
        _2062 = _2086;
    }
    float _2088 = _2062;
    if (_186)
    {
        float _2090 = fma(_2032, _1972, _2078);
        _2052 = _2090;
    }
    float _2092 = _2052;
    if (!_186)
    {
        _2080 = 0.0;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (_186)
    {
        float _2098 = fma(_2032, _1996, _2084);
        _2064 = _2098;
    }
    float _2100 = _2064;
    if (_186)
    {
        float _2102 = fma(_2026, _2016, _2088);
        _2066 = _2102;
    }
    float _2104 = _2066;
    float _2106 = _2104;
    if (_186)
    {
        float _2108 = _2092 + _1974;
        _2096 = _2108;
    }
    float _2110 = _2096;
    if (_186)
    {
        float _2112 = _2100 + _1998;
        _2042 = _2112;
    }
    float _2114 = _2042;
    float _2116 = _2114;
    if (_186)
    {
        float _2118 = fma(_2032, _2020, _2104);
        _2106 = _2118;
    }
    float _2120 = _2106;
    if (!_2030)
    {
        _2068 = _2110;
    }
    float _2122 = _2068;
    float _2124 = _2122;
    if (_186)
    {
        float _2126 = _2120 + _2022;
        _2054 = _2126;
    }
    float _2128 = _2054;
    bool _2130 = !_2030;
    float _2132 = _2128;
    int _2134 = as_type<int>(_2040);
    if (!_2130)
    {
        float _2136 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2138 = uint(int(uint(_166) >> uint(2)));
        float _2140 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2138)]);
        int _2142 = _166 + 4;
        uint _2144 = uint(int(uint(_2142) >> uint(2)));
        float _2146 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2144)]);
        int _2148 = _166 + 8;
        uint _2150 = uint(int(uint(_2148) >> uint(2)));
        float _2152 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2150)]);
        uint _2154 = uint(int(uint(_166) >> uint(2)));
        float _2156 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2154)]);
        int _2158 = _166 + 4;
        uint _2160 = uint(int(uint(_2158) >> uint(2)));
        float _2162 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2160)]);
        int _2164 = _166 + 8;
        uint _2166 = uint(int(uint(_2164) >> uint(2)));
        float _2168 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2166)]);
        uint _2170 = uint(int(uint(_166) >> uint(2)));
        float _2172 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2170)]);
        int _2174 = _166 + 4;
        uint _2176 = uint(int(uint(_2174) >> uint(2)));
        float _2178 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2176)]);
        int _2180 = _166 + 8;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        float _2184 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2182)]);
        float _2186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2190 = _2146 * _2024;
        float _2192 = _2162 * _2024;
        float _2194 = _2178 * _2024;
        float _2196 = fma(_2140, _2026, _2190);
        float _2198 = fma(_2156, _2026, _2192);
        float _2200 = fma(_2172, _2026, _2194);
        float _2202 = fma(_2152, _2032, _2196);
        float _2204 = fma(_2168, _2032, _2198);
        float _2206 = fma(_2184, _2032, _2200);
        float _2208 = _2136 + _2202;
        float _2210 = _2186 + _2204;
        float _2212 = _2188 + _2206;
        _2124 = _2208;
        _2116 = _2210;
        _2132 = _2212;
    }
    float _2214 = _2124;
    float _2216 = _2116;
    float _2218 = _2132;
    bool _2220 = !_2048;
    float _2222 = _2216;
    float _2224 = _2214;
    float _2226 = _2218;
    if (!_2220)
    {
        uint _2228 = uint(int(uint(_166) >> uint(2)));
        float _2230 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2228)]);
        int _2232 = _166 + 4;
        uint _2234 = uint(int(uint(_2232) >> uint(2)));
        float _2236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2234)]);
        int _2238 = _166 + 8;
        uint _2240 = uint(int(uint(_2238) >> uint(2)));
        float _2242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2240)]);
        int _2244 = _166 + 12;
        uint _2246 = uint(int(uint(_2244) >> uint(2)));
        float _2248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2246)]);
        uint _2250 = uint(int(uint(_166) >> uint(2)));
        float _2252 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2250)]);
        int _2254 = _166 + 4;
        uint _2256 = uint(int(uint(_2254) >> uint(2)));
        float _2258 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2256)]);
        int _2260 = _166 + 8;
        uint _2262 = uint(int(uint(_2260) >> uint(2)));
        float _2264 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2262)]);
        int _2266 = _166 + 12;
        uint _2268 = uint(int(uint(_2266) >> uint(2)));
        float _2270 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_2268)]);
        uint _2272 = uint(int(uint(_166) >> uint(2)));
        float _2274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2272)]);
        int _2276 = _166 + 4;
        uint _2278 = uint(int(uint(_2276) >> uint(2)));
        float _2280 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2278)]);
        int _2282 = _166 + 8;
        uint _2284 = uint(int(uint(_2282) >> uint(2)));
        float _2286 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2284)]);
        int _2288 = _166 + 12;
        uint _2290 = uint(int(uint(_2288) >> uint(2)));
        float _2292 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2290)]);
        float _2294 = _2236 * _2024;
        float _2296 = _2258 * _2024;
        float _2298 = _2280 * _2024;
        float _2300 = fma(_2230, _2026, _2294);
        float _2302 = fma(_2252, _2026, _2296);
        float _2304 = fma(_2274, _2026, _2298);
        float _2306 = fma(_2242, _2032, _2300);
        float _2308 = fma(_2264, _2032, _2302);
        float _2310 = fma(_2286, _2032, _2304);
        float _2312 = _2248 + _2306;
        float _2314 = _2270 + _2308;
        float _2316 = _2292 + _2310;
        _2222 = _2314;
        _2224 = _2312;
        _2226 = _2316;
    }
    float _2318 = _2222;
    float _2320 = _2224;
    float _2322 = _2226;
    float _2324 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[70]);
    float _2326 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[504]);
    float _2328 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[505]);
    float _2330 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[506]);
    float _2332 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[507]);
    float _2334 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[501]);
    float _2336 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _2338 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _2340 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _2342 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _2344 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[61]);
    float _2346 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[60]);
    float _2348 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[502]);
    float _2350 = _2324 + 1.0;
    float _2352 = _2350 + _2318;
    float _2354 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[508]);
    float _2356 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[509]);
    float _2358 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[510]);
    float _2360 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[511]);
    float _2362 = _2352 * _2328;
    float _2364 = fma(_2326, _2320, _2362);
    float _2366 = fma(_2330, _2322, _2364);
    float _2368 = _2332 + _2366;
    float _2370 = trunc(_2368);
    int _2372 = int(_2370);
    int _2374 = ~as_type<int>(_2334);
    int _2376 = _2372 + _2374;
    int _2378 = _2376 + 1;
    bool _2380 = _2378 >= 0;
    int _2382 = as_type<int>(_164);
    float _2384 = _2320;
    float _2386 = _2322;
    if (_2380)
    {
        float _2388 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2382 = as_type<int>(_2388);
    }
    int _2390 = _2382;
    float _2392 = fma(_2320, 6.2500002968590706586837768554688e-05, 0.5);
    float _2394 = fma(_2322, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _6947 = float2(_2392, _2394);
    float _2396 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6947, float2(0.0), isnan(_6947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6947, float2(0.0), isnan(_6947)), level(0.0)).x;
    float _2398 = _2338 * _2318;
    float _2400 = fma(_2336, _2320, _2398);
    float _2402 = fma(_2340, _2322, _2400);
    float _2404 = _2342 + _2402;
    float _2406 = -_2404;
    bool _2408 = _2344 >= _2406;
    bool _2410 = isnan(_2344);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan(_2406);
    bool _2416 = _2412 || _2414;
    float _2418 = -_2404;
    bool _2420 = _2346 >= _2418;
    bool _2422 = isnan(_2346);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan(_2418);
    bool _2428 = _2424 || _2426;
    int _2430 = _2416 ? 0 : 1;
    int _2432 = 2;
    float _2434 = 6.2500002968590706586837768554688e-05;
    float _2436 = _2394;
    float _2438 = _2392;
    if (_2416)
    {
        _2432 = 1;
    }
    int _2440 = _2432;
    int _2442 = _2440;
    if (_2428)
    {
        _2442 = _2430;
    }
    int _2444 = _2442;
    int _2446 = _2444 << 6;
    int _2448 = _2446 + 96;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    float _2452 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2450)]);
    int _2454 = _2448 + 4;
    uint _2456 = uint(int(uint(_2454) >> uint(2)));
    float _2458 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2456)]);
    int _2460 = _2448 + 8;
    uint _2462 = uint(int(uint(_2460) >> uint(2)));
    float _2464 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2462)]);
    int _2466 = _2448 + 12;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    float _2470 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2468)]);
    int _2472 = _2446 + 48;
    uint _2474 = uint(int(uint(_2472) >> uint(2)));
    float _2476 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2474)]);
    int _2478 = _2472 + 4;
    uint _2480 = uint(int(uint(_2478) >> uint(2)));
    float _2482 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2480)]);
    int _2484 = _2472 + 8;
    uint _2486 = uint(int(uint(_2484) >> uint(2)));
    float _2488 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2486)]);
    int _2490 = _2472 + 12;
    uint _2492 = uint(int(uint(_2490) >> uint(2)));
    float _2494 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2492)]);
    float _2496 = _2352 * _2356;
    float _2498 = fma(_2354, _2320, _2496);
    float _2500 = fma(_2358, _2322, _2498);
    float _2502 = _2360 + _2500;
    int _2504 = _2446 + 64;
    float _2506 = trunc(_2502);
    int _2508 = int(_2506);
    uint _2510 = uint(int(uint(_2504) >> uint(2)));
    float _2512 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2510)]);
    int _2514 = _2504 + 4;
    uint _2516 = uint(int(uint(_2514) >> uint(2)));
    float _2518 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2516)]);
    int _2520 = _2504 + 8;
    uint _2522 = uint(int(uint(_2520) >> uint(2)));
    float _2524 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2522)]);
    int _2526 = _2504 + 12;
    uint _2528 = uint(int(uint(_2526) >> uint(2)));
    float _2530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2528)]);
    int _2532 = _2446 + 80;
    bool _2534 = _2390 <= _2378;
    bool _2536 = !_2380;
    bool _2538 = _2534 || _2536;
    int _2540 = ~as_type<int>(_2348);
    int _2542 = _2508 + _2540;
    int _2544 = _2542 + 1;
    uint _2546 = uint(int(uint(_2532) >> uint(2)));
    float _2548 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2546)]);
    int _2550 = _2532 + 4;
    uint _2552 = uint(int(uint(_2550) >> uint(2)));
    float _2554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2552)]);
    int _2556 = _2532 + 8;
    uint _2558 = uint(int(uint(_2556) >> uint(2)));
    float _2560 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2558)]);
    int _2562 = _2532 + 12;
    uint _2564 = uint(int(uint(_2562) >> uint(2)));
    float _2566 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2564)]);
    bool _2568 = _2544 < 0;
    bool _2570 = _2568 || _2538;
    int _2572 = as_type<int>(_2348);
    if (!_2570)
    {
        float _2574 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        _2572 = as_type<int>(_2574);
    }
    int _2576 = _2572;
    float _2578 = _2352 * _2458;
    float _2580 = fma(_2452, _2320, _2578);
    float _2582 = fma(_2464, _2322, _2580);
    float _2584 = _2470 + _2582;
    float _2586 = _2352 * _2482;
    float _2588 = 1.0 / _2584;
    float _2590 = fma(_2476, _2320, _2586);
    float _2592 = fma(_2488, _2322, _2590);
    float _2594 = _2352 * _2518;
    float _2596 = fma(_2512, _2320, _2594);
    float _2598 = _2494 + _2592;
    float _2600 = fma(_2524, _2322, _2596);
    float _2602 = _2598 * _2588;
    float _2604 = _2530 + _2600;
    bool _2606 = _2602 >= 0.0;
    float _2608 = _2604 * _2588;
    bool _2610 = _2602 <= 1.0;
    bool _2612 = _2610 && _2606;
    bool _2614 = _2608 >= 0.0;
    bool _2616 = _2614 && _2612;
    bool _2618 = _2608 <= 1.0;
    bool _2620 = _2618 && _2616;
    float _2622 = _2352 * _2554;
    float _2624 = fma(_2548, _2320, _2622);
    bool _2626 = _2576 <= _2544;
    bool _2628 = _2626 || _2570;
    float _2630 = fma(_2560, _2322, _2624);
    float _2632 = _2512;
    float _2634 = _2548;
    if (_2620)
    {
        float _2636 = float(_2444);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = _2566 + _2630;
    if (_2628)
    {
        _2634 = 1.0;
    }
    float _2642 = _2634;
    float _2644 = _2642;
    float _2646 = _2396;
    if (!_2628)
    {
        float _2648 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[500]);
        int _2650 = _2544 * as_type<int>(_2648);
        int _2652 = _2650 + _2378;
        int _2654 = _2652 << 2;
        uint _2656 = uint(int(uint(_2652) >> uint(2)));
        int _2658 = 12 & _2654;
        int _2660 = int(_2656) << 4;
        int _2662 = _2660 + _2658;
        int _2664 = _2662 + 400;
        uint _2666 = uint(int(uint(_2664) >> uint(2)));
        float _2668 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2666)]);
        float _2670 = floor(_2502);
        float _2672 = floor(_2368);
        float _2674 = -_2670;
        float _2676 = _2502 + _2674;
        float _2678 = -_2672;
        float _2680 = _2368 + _2678;
        float _2682 = rint(_2668);
        float _2684 = precise::max(_2682, 0.0);
        uint _2686 = uint(_2684);
        uint _2688 = clamp(_2686, 0u, 65535u);
        float3 _7398 = float3(_2680, _2676, float(int(_2688)));
        float3 _7402 = select(_7398, float3(0.0), isnan(_7398));
        float _2690 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _7402.xy, uint(rint(_7402.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _7402.xy, uint(rint(_7402.z)), level(0.0)).x;
        int _2692 = _2652 << 4;
        int _2694 = _2692 + 2048;
        uint _2696 = uint(int(uint(_2694) >> uint(2)));
        float _2698 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2696)]);
        int _2700 = _2694 + 4;
        uint _2702 = uint(int(uint(_2700) >> uint(2)));
        float _2704 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2702)]);
        int _2706 = _2694 + 8;
        uint _2708 = uint(int(uint(_2706) >> uint(2)));
        float _2710 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2708)]);
        int _2712 = _2694 + 12;
        uint _2714 = uint(int(uint(_2712) >> uint(2)));
        float _2716 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2714)]);
        float _2718 = _2352 * _2704;
        float _2720 = fma(_2698, _2320, _2718);
        float _2722 = fma(_2710, _2322, _2720);
        float _2724 = _2716 + _2722;
        float _2726 = precise::clamp(_2724, 0.0, 1.0);
        float _2728 = -_2726;
        float _2730 = _2728 + _2690;
        float _2732 = fma(_2730, 500.0, 1.5);
        float _2734 = exp2(_2732);
        float _2736 = 0.0 + _2734;
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        _2644 = _2738;
    }
    float _2740 = _2644;
    float _2742 = _2638;
    if (_2620)
    {
        float _2744 = rint(_2638);
        float _2746 = precise::max(_2744, 0.0);
        uint _2748 = uint(_2746);
        uint _2750 = clamp(_2748, 0u, 65535u);
        _2742 = as_type<float>(_2750);
    }
    float _2752 = _2742;
    float _2754 = _2640 * _2588;
    bool _2756 = _2396 != 0.0;
    bool _2758 = isnan(_2396);
    bool _2760 = _2756 || _2758;
    bool _2762 = isnan(0.0);
    bool _2764 = _2760 || _2762;
    uint _2766 = uint(int(uint(_166) >> uint(2)));
    float _2768 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2766)]);
    float _2770 = fma(_2320, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2772 = fma(_2320, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2774 = fma(_2322, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _2776 = fma(_2322, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _2778 = _2752;
    float _2780 = _2772;
    float _2782 = _2770;
    if (_2620)
    {
        float3 _7539 = float3(_2602, _2608, float(as_type<int>(_2752)));
        float3 _7541 = select(_7539, float3(0.0), isnan(_7539));
        float _2784 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _7541.xy, uint(rint(_7541.z)), _2754, level(0.0));
        _2778 = _2784;
    }
    float _2786 = _2778;
    if (_2764)
    {
        _2434 = _2396;
    }
    float _2788 = _2434;
    if (!_2764)
    {
        _2646 = 4.0;
    }
    float _2790 = _2646;
    float _2792 = _2788;
    float _2794 = _2790;
    if (!_2764)
    {
        float2 _7566 = float2(_2392, _2394);
        float _2796 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7566, float2(0.0), isnan(_7566)), level(_2790)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7566, float2(0.0), isnan(_7566)), level(_2790)).x;
        _2792 = _2796;
    }
    float _2798 = _2792;
    float2 _7578 = float2(_2770, _2394);
    float _2800 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7578, float2(0.0), isnan(_7578)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7578, float2(0.0), isnan(_7578)), level(0.0)).x;
    float2 _7586 = float2(_2392, _2774);
    float _2802 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7586, float2(0.0), isnan(_7586)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7586, float2(0.0), isnan(_7586)), level(0.0)).x;
    float2 _7594 = float2(_2772, _2394);
    float _2804 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7594, float2(0.0), isnan(_7594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7594, float2(0.0), isnan(_7594)), level(0.0)).x;
    float2 _7602 = float2(_2392, _2776);
    float _2806 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).x;
    if (!_2620)
    {
        _2384 = 1.0;
    }
    float _2808 = _2384;
    bool _2810 = _710 > 0.001000000047497451305389404296875;
    bool _2812 = isnan(_710);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan(0.001000000047497451305389404296875);
    bool _2818 = _2814 || _2816;
    float _2820 = _2808;
    float _2822 = _2800;
    float _2824 = _2804;
    if (_2620)
    {
        bool _2826 = _2786 >= _2754;
        bool _2828 = isnan(_2786);
        bool _2830 = _2826 || _2828;
        bool _2832 = isnan(_2754);
        bool _2834 = _2830 || _2832;
        float _2836 = float(_2834);
        _2820 = _2836;
    }
    float _2838 = _2820;
    float _2840 = -_2838;
    float _2842 = fma(_2840, _2740, 1.0);
    float _2844 = -_2768;
    float _2846 = _2842 + _2844;
    float _2848 = _2842;
    if (_2818)
    {
        float _2850 = fma(_2846, 0.0500000007450580596923828125, _2768);
        _2848 = _2850;
    }
    float _2852 = _2848;
    float _2854 = precise::max(0.0, _2852);
    float _2856 = precise::min(_2854, 0.999000012874603271484375);
    uint _2858 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s12)._m0[int(_2858)] = as_type<uint>(_2856);
    int _2860 = as_type<int>(_2754);
    if (!_2818)
    {
        float _2862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
        _2860 = as_type<int>(_2862);
    }
    int _2864 = _2860;
    int _2866 = _166 + 4;
    int _2868 = _2864;
    if (!_2818)
    {
        float _2870 = fma(_2798, 2000.0, as_type<float>(_2864));
        _2868 = as_type<int>(_2870);
    }
    int _2872 = _2868;
    if (!_2818)
    {
        uint _2874 = uint(int(uint(_2866) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2874)] = uint(_2872);
    }
    float _2876 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[76]);
    uint _2878 = uint(int(uint(_2866) >> uint(2)));
    float _2880 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_2878)]);
    float _2882 = fma(_2798, 2000.0, _2876);
    float _2884 = _2024 + _2880;
    bool _2886 = _2884 >= _2882;
    bool _2888 = isnan(_2884);
    bool _2890 = _2886 || _2888;
    bool _2892 = isnan(_2882);
    bool _2894 = _2890 || _2892;
    float _2896 = _2884;
    int _2898 = as_type<int>(_2880);
    float _2900 = _2882;
    if (!_2894)
    {
        float _2902 = -_2880;
        float _2904 = _2882 + _2902;
        _2896 = _2904;
    }
    float _2906 = _2896;
    if (!_2894)
    {
        float _2908 = fma(_2906, 0.00999999977648258209228515625, _2880);
        _2898 = as_type<int>(_2908);
    }
    int _2910 = _2898;
    if (_2894)
    {
        _2386 = _602;
    }
    float _2912 = _2386;
    float _2914 = _2912;
    if (!_2894)
    {
        uint _2916 = uint(int(uint(_2866) >> uint(2)));
        (*spvDescriptorSet0.cp_s12)._m0[int(_2916)] = uint(_2910);
    }
    if (!_2818)
    {
        float2 _7800 = float2(_2770, _2774);
        float _2918 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7800, float2(0.0), isnan(_7800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7800, float2(0.0), isnan(_7800)), level(0.0)).x;
        float2 _7808 = float2(_2770, _2776);
        float _2920 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7808, float2(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7808, float2(0.0), isnan(_7808)), level(0.0)).x;
        float2 _7816 = float2(_2772, _2774);
        float _2922 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7816, float2(0.0), isnan(_7816)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7816, float2(0.0), isnan(_7816)), level(0.0)).x;
        float2 _7824 = float2(_2772, _2776);
        float _2924 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7824, float2(0.0), isnan(_7824)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7824, float2(0.0), isnan(_7824)), level(0.0)).x;
        bool _2926 = _2800 != 0.0;
        bool _2928 = isnan(_2800);
        bool _2930 = _2926 || _2928;
        bool _2932 = isnan(0.0);
        bool _2934 = _2930 || _2932;
        bool _2936 = _2804 != 0.0;
        bool _2938 = isnan(_2804);
        bool _2940 = _2936 || _2938;
        bool _2942 = isnan(0.0);
        bool _2944 = _2940 || _2942;
        float _2946 = _2394;
        float _2948 = _2394;
        if (_2934)
        {
            _2900 = _2800;
        }
        float _2950 = _2900;
        if (_2944)
        {
            _2794 = _2804;
        }
        float _2952 = _2794;
        if (!_2934)
        {
            _2436 = 4.0;
        }
        float _2954 = _2436;
        float _2956 = _2954;
        if (!_2944)
        {
            _2822 = 4.0;
        }
        float _2958 = _2822;
        float _2960 = _2950;
        float _2962 = _2958;
        if (!_2934)
        {
            float2 _7882 = float2(_2770, _2394);
            float _2964 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7882, float2(0.0), isnan(_7882)), level(_2954)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7882, float2(0.0), isnan(_7882)), level(_2954)).x;
            _2960 = _2964;
        }
        float _2966 = _2960;
        float _2968 = _2952;
        if (!_2944)
        {
            float2 _7898 = float2(_2772, _2394);
            float _2970 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_7898, float2(0.0), isnan(_7898)), level(_2958)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_7898, float2(0.0), isnan(_7898)), level(_2958)).x;
            _2968 = _2970;
        }
        float _2972 = _2968;
        bool _2974 = _2802 != 0.0;
        bool _2976 = isnan(_2802);
        bool _2978 = _2974 || _2976;
        bool _2980 = isnan(0.0);
        bool _2982 = _2978 || _2980;
        bool _2984 = _2806 != 0.0;
        bool _2986 = isnan(_2806);
        bool _2988 = _2984 || _2986;
        bool _2990 = isnan(0.0);
        bool _2992 = _2988 || _2990;
        if (_2982)
        {
            _2956 = _2802;
        }
        float _2994 = _2956;
        if (_2992)
        {
            _2438 = _2806;
        }
        float _2996 = _2438;
        if (!_2982)
        {
            _2946 = 4.0;
        }
        float _2998 = _2946;
        if (!_2992)
        {
            _2780 = 4.0;
        }
        float _3000 = _2780;
        bool _3002 = _2918 != 0.0;
        bool _3004 = isnan(_2918);
        bool _3006 = _3002 || _3004;
        bool _3008 = isnan(0.0);
        bool _3010 = _3006 || _3008;
        bool _3012 = _2920 != 0.0;
        bool _3014 = isnan(_2920);
        bool _3016 = _3012 || _3014;
        bool _3018 = isnan(0.0);
        bool _3020 = _3016 || _3018;
        bool _3022 = _2922 != 0.0;
        bool _3024 = isnan(_2922);
        bool _3026 = _3022 || _3024;
        bool _3028 = isnan(0.0);
        bool _3030 = _3026 || _3028;
        bool _3032 = _2924 != 0.0;
        bool _3034 = isnan(_2924);
        bool _3036 = _3032 || _3034;
        bool _3038 = isnan(0.0);
        bool _3040 = _3036 || _3038;
        if (!_3010)
        {
            _2782 = 4.0;
        }
        float _3042 = _2782;
        if (!_3020)
        {
            _2948 = 4.0;
        }
        float _3044 = _2948;
        if (!_3030)
        {
            _2962 = 4.0;
        }
        float _3046 = _2962;
        float _3048 = _2918;
        if (!_3010)
        {
            float2 _8015 = float2(_2770, _2774);
            float _3050 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8015, float2(0.0), isnan(_8015)), level(_3042)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8015, float2(0.0), isnan(_8015)), level(_3042)).x;
            _3048 = _3050;
        }
        float _3052 = _3048;
        float _3054 = _2920;
        if (!_3020)
        {
            float2 _8031 = float2(_2770, _2776);
            float _3056 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8031, float2(0.0), isnan(_8031)), level(_3044)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8031, float2(0.0), isnan(_8031)), level(_3044)).x;
            _3054 = _3056;
        }
        float _3058 = _3054;
        if (!_3040)
        {
            _2824 = 4.0;
        }
        float _3060 = _2824;
        float _3062 = _2922;
        if (!_3030)
        {
            float2 _8052 = float2(_2772, _2774);
            float _3064 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8052, float2(0.0), isnan(_8052)), level(_3046)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8052, float2(0.0), isnan(_8052)), level(_3046)).x;
            _3062 = _3064;
        }
        float _3066 = _3062;
        float _3068 = _2924;
        if (!_3040)
        {
            float2 _8068 = float2(_2772, _2776);
            float _3070 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8068, float2(0.0), isnan(_8068)), level(_3060)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8068, float2(0.0), isnan(_8068)), level(_3060)).x;
            _3068 = _3070;
        }
        float _3072 = _3068;
        float _3074 = _2994;
        if (!_2982)
        {
            float2 _8084 = float2(_2392, _2774);
            float _3076 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8084, float2(0.0), isnan(_8084)), level(_2998)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8084, float2(0.0), isnan(_8084)), level(_2998)).x;
            _3074 = _3076;
        }
        float _3078 = _3074;
        float _3080 = _2996;
        if (!_2992)
        {
            float2 _8100 = float2(_2392, _2776);
            float _3082 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8100, float2(0.0), isnan(_8100)), level(_3000)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8100, float2(0.0), isnan(_8100)), level(_3000)).x;
            _3080 = _3082;
        }
        float _3084 = _3080;
        float _3086 = -_2966;
        float _3088 = _2798 + _3086;
        float _3090 = -_2972;
        float _3092 = _2798 + _3090;
        float _3094 = abs(_3088);
        float _3096 = abs(_3092);
        float _3098 = precise::max(_3094, _3096);
        float _3100 = -_3052;
        float _3102 = _2798 + _3100;
        float _3104 = -_3058;
        float _3106 = _2798 + _3104;
        float _3108 = -_3066;
        float _3110 = _2798 + _3108;
        float _3112 = -_3072;
        float _3114 = _2798 + _3112;
        float _3116 = -_3078;
        float _3118 = _2798 + _3116;
        float _3120 = -_3084;
        float _3122 = _2798 + _3120;
        float _3124 = abs(_3102);
        float _3126 = abs(_3106);
        float _3128 = precise::max(_3124, _3126);
        float _3130 = abs(_3110);
        float _3132 = abs(_3114);
        float _3134 = precise::max(_3130, _3132);
        float _3136 = abs(_3118);
        float _3138 = abs(_3122);
        float _3140 = precise::max(_3136, _3138);
        float _3142 = precise::max(_3128, _3134);
        float _3144 = precise::max(_3098, _3140);
        bool _3146 = _3142 > 0.00150000001303851604461669921875;
        bool _3148 = _3144 > 0.00150000001303851604461669921875;
        bool _3150 = _3148 || _3146;
        bool _3152 = !_3150;
        int _3154 = _3152 ? as_type<int>(_2040) : 0;
        _2134 = _3154;
    }
    int _3156 = _2134;
    if (!_2894)
    {
        float _3158 = _2024 * 0.9900000095367431640625;
        _2034 = _3158;
    }
    float _3160 = _2034;
    int _3162 = _166 + 8;
    uint _3164 = uint(int(uint(_188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3164)] = uint(_3156);
    if (!_2894)
    {
        _2914 = 0.0;
    }
    float _3166 = _2914;
    float _3168 = -_170;
    float _3170 = _3168 + _2026;
    uint _3172 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3172)] = as_type<uint>(_2026);
    float _3174 = -_176;
    float _3176 = _3174 + _3160;
    float _3178 = -_182;
    float _3180 = _3178 + _2032;
    uint _3182 = uint(int(uint(_2866) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3182)] = as_type<uint>(_3160);
    uint _3184 = uint(int(uint(_3162) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3184)] = as_type<uint>(_2032);
    uint _3186 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3186)] = as_type<uint>(_610);
    uint _3188 = uint(int(uint(_2866) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3188)] = as_type<uint>(_3166);
    uint _3190 = uint(int(uint(_3162) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3190)] = as_type<uint>(_604);
    uint _3192 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3192)] = as_type<uint>(_3170);
    uint _3194 = uint(int(uint(_2866) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3194)] = as_type<uint>(_3176);
    uint _3196 = uint(int(uint(_3162) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3196)] = as_type<uint>(_3180);
    float _3198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3200 = _3176 * _3176;
    float _3202 = _3166 * _3166;
    float _3204 = fma(_3170, _3170, _3200);
    float _3206 = fma(_610, _610, _3202);
    float _3208 = fma(_3180, _3180, _3204);
    float _3210 = fma(_604, _604, _3206);
    float _3212 = sqrt(_3208);
    float _3214 = sqrt(_3210);
    bool _3216 = _3212 >= 9.9999999747524270787835121154785e-07;
    bool _3218 = isnan(_3212);
    bool _3220 = _3216 || _3218;
    bool _3222 = isnan(9.9999999747524270787835121154785e-07);
    bool _3224 = _3220 || _3222;
    if (!_3224)
    {
        bool _3226 = _542 != _278;
        bool _3228 = isnan(_542);
        bool _3230 = _3226 || _3228;
        bool _3232 = isnan(_278);
        bool _3234 = _3230 || _3232;
        _3236 = _3234;
        if (!_3236)
        {
            float _3238 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3240 = _3238 > 0.0;
            bool _3242 = !_3240;
            if (!_3242)
            {
                float _3244 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3246 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3248 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3250 = _3246 * _502;
                float _3252 = _3246 * _500;
                float _3254 = _3246 * _504;
                float _3256 = fma(_3244, _506, _3250);
                float _3258 = fma(_3244, _510, _3252);
                float _3260 = fma(_3244, _508, _3254);
                float _3262 = fma(_3248, _512, _3256);
                float _3264 = fma(_3248, _516, _3258);
                float _3266 = fma(_3248, _514, _3260);
                float _3268 = _3262 * _3262;
                float _3270 = fma(_3264, _3264, _3268);
                float _3272 = fma(_3266, _3266, _3270);
                float _3274 = rsqrt(_3272);
                float _3276 = _3274 * 9.9999999747524270787835121154785e-07;
                float _3278 = _3264 * _3276;
                float _3280 = _3262 * _3276;
                float _3282 = _3266 * _3276;
                _320 = as_type<int>(_3278);
                _322 = as_type<int>(_3280);
                _324 = as_type<int>(_3282);
                _3236 = true;
            }
            else
            {
                bool _3284 = _3214 >= 9.9999999747524270787835121154785e-07;
                bool _3286 = isnan(_3214);
                bool _3288 = _3284 || _3286;
                bool _3290 = isnan(9.9999999747524270787835121154785e-07);
                bool _3292 = _3288 || _3290;
                if (!_3292)
                {
                    float _3294 = _3160 * _3160;
                    float _3296 = fma(_2026, _2026, _3294);
                    float _3298 = fma(_2032, _2032, _3296);
                    float _3300 = sqrt(_3298);
                    bool _3302 = _3300 >= 9.9999999747524270787835121154785e-07;
                    bool _3304 = isnan(_3300);
                    bool _3306 = _3302 || _3304;
                    bool _3308 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3310 = _3306 || _3308;
                    float _3312 = _3300;
                    if (_3310)
                    {
                        float _3314 = rsqrt(_3298);
                        _3312 = _3314;
                    }
                    float _3316 = _3312;
                    if (!_3310)
                    {
                        _308 = 0;
                    }
                    int _3318 = _308;
                    int _3320 = _3318;
                    if (!_3310)
                    {
                        _310 = 897988541;
                    }
                    int _3322 = _310;
                    int _3324 = _3322;
                    if (!_3310)
                    {
                        _312 = 0;
                    }
                    int _3326 = _312;
                    float _3328 = _3316;
                    int _3330 = _3326;
                    if (_3310)
                    {
                        float _3332 = _3316 * 9.9999999747524270787835121154785e-07;
                        _3328 = _3332;
                    }
                    float _3334 = _3328;
                    if (_3310)
                    {
                        float _3336 = _2026 * _3334;
                        _3320 = as_type<int>(_3336);
                    }
                    int _3338 = _3320;
                    _320 = _3338;
                    if (_3310)
                    {
                        float _3340 = _3160 * _3334;
                        _3324 = as_type<int>(_3340);
                    }
                    int _3342 = _3324;
                    _322 = _3342;
                    if (_3310)
                    {
                        float _3344 = _2032 * _3334;
                        _3330 = as_type<int>(_3344);
                    }
                    int _3346 = _3330;
                    _324 = _3346;
                    _3236 = true;
                }
                else
                {
                    float _3348 = rsqrt(_3210);
                    float _3350 = _3348 * 9.9999999747524270787835121154785e-07;
                    float _3352 = _610 * _3350;
                    float _3354 = _3166 * _3350;
                    float _3356 = _604 * _3350;
                    _320 = as_type<int>(_3352);
                    _322 = as_type<int>(_3354);
                    _324 = as_type<int>(_3356);
                    _3236 = true;
                }
            }
        }
    }
    else
    {
        float _3358 = _3214 * _3198;
        bool _3360 = _3358 >= 0.001000000047497451305389404296875;
        bool _3362 = isnan(_3358);
        bool _3364 = _3360 || _3362;
        bool _3366 = isnan(0.001000000047497451305389404296875);
        bool _3368 = _3364 || _3366;
        bool _3370 = _3358 > 0.0;
        bool _3372 = !_3368;
        bool _3374 = _3370 && _3372;
        bool _3376 = _3212 < 0.001000000047497451305389404296875;
        bool _3378 = _3376 && _3374;
        if (!_3378)
        {
            _314 = as_type<int>(_3170);
        }
        int _3380 = _314;
        int _3382 = _3380;
        if (_3378)
        {
            float _3384 = _610 * _3198;
            _3382 = as_type<int>(_3384);
        }
        int _3386 = _3382;
        _320 = _3386;
        if (!_3378)
        {
            _316 = as_type<int>(_3176);
        }
        int _3388 = _316;
        int _3390 = _3388;
        if (_3378)
        {
            float _3392 = _3198 * _3166;
            _3390 = as_type<int>(_3392);
        }
        int _3394 = _3390;
        _322 = _3394;
        if (!_3378)
        {
            _318 = as_type<int>(_3180);
        }
        int _3396 = _318;
        _324 = _3396;
        if (_3378)
        {
            float _3398 = _604 * _3198;
            _324 = as_type<int>(_3398);
        }
    }
    _3236 = false;
    int _3400 = _320;
    int _3402 = _322;
    int _3404 = _324;
    uint _3406 = uint(int(uint(_166) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3406)] = uint(_3400);
    uint _3408 = uint(int(uint(_2866) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3408)] = uint(_3402);
    uint _3410 = uint(int(uint(_3162) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3410)] = uint(_3404);
}

