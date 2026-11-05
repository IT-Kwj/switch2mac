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
    texture2d<float> cp_t_tcb_22 [[id(20)]];
    sampler cp_t_tcb_22Smplr [[id(21)]];
    sampler cp_t_tcb_14Smplr_w [[id(22)]];
    sampler cp_t_tcb_2ASmplr_w [[id(23)]];
    sampler cp_t_tcb_22Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2150 = false;
    bool _550 = false;
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
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _172 = _89 << 4;
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _176 = _172 + 12;
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _182 = uint(int(uint(_176) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_182)]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _188 = uint(int(uint(_172) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_188)]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    uint _204 = uint(int(uint(_172) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _172 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _172 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    uint _220 = uint(int(uint(_176) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_220)]);
    uint _224 = uint(int(uint(_172) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_224)]);
    int _228 = _172 + 4;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_230)]);
    int _234 = _172 + 8;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_236)]);
    int _240 = _172 + 12;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_242)]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _254 = uint(int(uint(_172) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_254)]);
    int _258 = _172 + 4;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_260)]);
    int _264 = _172 + 8;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_266)]);
    int _270 = _172 + 12;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_272)]);
    uint _276 = uint(int(uint(_176) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_276)]);
    bool _280 = _168 > 0.0;
    float _282 = abs(_170);
    float _284 = log2(_282);
    bool _286 = _174 > 0.0;
    float _288 = 0.0;
    float _290 = _186;
    float _292 = _244;
    float _294 = _196;
    float _296 = _178;
    float _298 = _192;
    float _300 = _246;
    float _302 = _248;
    float _304 = _250;
    float _306 = _252;
    float _308 = _198;
    float _310 = _202;
    float _312 = _180;
    if (_280)
    {
        float _314 = 1.0 / _168;
        _288 = _314;
    }
    float _316 = _288;
    float _318 = _178 * _284;
    float _320 = -_184;
    float _322 = _180 + _320;
    float _324 = exp2(_318);
    float _326 = _186 * _174;
    float _328 = 0.0;
    float _330 = _284;
    float _332 = _318;
    if (_280)
    {
        float _334 = _322 * _316;
        _328 = _334;
    }
    float _336 = _328;
    if (_286)
    {
        float _338 = -_326;
        float _340 = fma(_190, _338, _186);
        _290 = _340;
    }
    float _342 = _290;
    int _344 = as_type<int>(_192) & 512;
    bool _346 = _344 != 0;
    float _348 = _342;
    bool _350 = _346;
    if (_280)
    {
        float _352 = precise::min(_336, 1.0);
        _330 = _352;
    }
    float _354 = _330;
    float _356 = _178 * _194;
    float _358 = _196 * _356;
    float _360 = _198 * _356;
    float _362 = _200 * _356;
    float _364 = _360;
    float _366 = _362;
    if (_280)
    {
        float _368 = _354 * _342;
        _348 = _368;
    }
    float _370 = _348;
    float _372 = fma(_206, _324, _358);
    float _374 = fma(_212, _324, _360);
    float _376 = fma(_218, _324, _362);
    float _378 = _178 * _370;
    float _380 = _222 * _178;
    float _382 = fma(_206, _380, _226);
    float _384 = fma(_212, _380, _232);
    float _386 = fma(_218, _380, _238);
    float _388 = _246 * _378;
    float _390 = _248 * _378;
    float _392 = _250 * _378;
    bool _394 = !_346;
    float _396 = _274;
    float _398 = _370;
    float _400 = _380;
    float _402 = _378;
    float _404 = _382;
    int _406 = as_type<int>(_256);
    int _408 = as_type<int>(_262);
    int _410 = as_type<int>(_268);
    int _412 = as_type<int>(_256);
    int _414 = as_type<int>(_262);
    int _416 = as_type<int>(_268);
    int _418 = as_type<int>(_256);
    int _420 = as_type<int>(_262);
    int _422 = as_type<int>(_268);
    float _544;
    float _546;
    float _548;
    if (!_394)
    {
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _440 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _442 = _428 * _430;
        float _444 = _428 * _432;
        float _446 = _426 * _430;
        float _448 = -_442;
        float _450 = fma(_424, _434, _448);
        float _452 = -_444;
        float _454 = fma(_426, _434, _452);
        float _456 = -_446;
        float _458 = fma(_424, _432, _456);
        float _460 = _438 * _424;
        float _462 = _438 * _450;
        float _464 = _440 * _426;
        float _466 = _436 * _432;
        float _468 = -_460;
        float _470 = fma(_436, _426, _468);
        float _472 = -_462;
        float _474 = fma(_436, _454, _472);
        float _476 = _438 * _434;
        float _478 = _440 * _430;
        float _480 = -_466;
        float _482 = fma(_438, _430, _480);
        float _484 = fma(_440, _458, _474);
        float _486 = -_476;
        float _488 = fma(_440, _432, _486);
        float _490 = -_478;
        float _492 = fma(_436, _434, _490);
        float _494 = _436 * _428;
        float _496 = 1.0 / _484;
        float _498 = -_424;
        float _500 = fma(_498, _434, _442);
        float _502 = -_464;
        float _504 = fma(_438, _428, _502);
        float _506 = -_494;
        float _508 = fma(_440, _424, _506);
        float _510 = _488 * _496;
        float _512 = _492 * _496;
        float _514 = _482 * _496;
        float _516 = _500 * _496;
        float _518 = _390 * _510;
        float _520 = _388 * _496;
        float _522 = _390 * _512;
        float _524 = _390 * _514;
        float _526 = _504 * _496;
        float _528 = fma(_454, _520, _518);
        float _530 = _508 * _496;
        float _532 = _470 * _496;
        float _534 = fma(_388, _516, _522);
        float _536 = fma(_458, _520, _524);
        float _538 = fma(_392, _526, _528);
        float _540 = fma(_392, _530, _534);
        float _542 = fma(_392, _532, _536);
        _398 = _430;
        _400 = _432;
        _296 = _434;
        _298 = _458;
        _300 = _518;
        _302 = _520;
        _304 = _534;
        _306 = _484;
        _332 = _436;
        _402 = _438;
        _364 = _440;
        _366 = _512;
        _544 = _540;
        _546 = _538;
        _548 = _542;
        _308 = _530;
        _310 = _532;
        _550 = true;
    }
    else
    {
        int _552 = as_type<int>(_192) & 1024;
        bool _554 = _552 != 0;
        if (_554)
        {
            _350 = true;
        }
        bool _556 = _350;
        bool _558 = _556;
        if (!_554)
        {
            int _560 = as_type<int>(_192) & 2048;
            bool _562 = _560 != 0;
            _558 = _562;
        }
        bool _564 = _558;
        if (!_564)
        {
            _292 = _388;
        }
        float _566 = _292;
        _546 = _566;
        if (!_564)
        {
            _294 = _390;
        }
        float _568 = _294;
        _544 = _568;
        if (!_564)
        {
            _396 = _392;
        }
        float _570 = _396;
        bool _572 = !_564;
        _548 = _570;
        if (!_572)
        {
            uint _574 = uint(int(uint(_172) >> uint(2)));
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_574)]);
            int _578 = _172 + 4;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_580)]);
            int _584 = _172 + 8;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_586)]);
            uint _590 = uint(int(uint(_172) >> uint(2)));
            float _592 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_590)]);
            int _594 = _172 + 4;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_596)]);
            int _600 = _172 + 8;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_602)]);
            uint _606 = uint(int(uint(_172) >> uint(2)));
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_606)]);
            int _610 = _172 + 4;
            uint _612 = uint(int(uint(_610) >> uint(2)));
            float _614 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_612)]);
            int _616 = _172 + 8;
            uint _618 = uint(int(uint(_616) >> uint(2)));
            float _620 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_618)]);
            float _622 = _588 * _592;
            float _624 = _588 * _598;
            float _626 = _582 * _592;
            float _628 = -_622;
            float _630 = fma(_576, _604, _628);
            float _632 = -_624;
            float _634 = fma(_582, _604, _632);
            float _636 = -_626;
            float _638 = fma(_576, _598, _636);
            float _640 = _614 * _576;
            float _642 = _614 * _630;
            float _644 = _620 * _582;
            float _646 = _608 * _598;
            float _648 = -_640;
            float _650 = fma(_608, _582, _648);
            float _652 = -_642;
            float _654 = fma(_608, _634, _652);
            float _656 = _614 * _604;
            float _658 = _620 * _592;
            float _660 = -_646;
            float _662 = fma(_614, _592, _660);
            float _664 = fma(_620, _638, _654);
            float _666 = -_656;
            float _668 = fma(_620, _598, _666);
            float _670 = -_658;
            float _672 = fma(_608, _604, _670);
            float _674 = _608 * _588;
            float _676 = 1.0 / _664;
            float _678 = -_576;
            float _680 = fma(_678, _604, _622);
            float _682 = -_644;
            float _684 = fma(_614, _588, _682);
            float _686 = -_674;
            float _688 = fma(_620, _576, _686);
            float _690 = _668 * _676;
            float _692 = _672 * _676;
            float _694 = _662 * _676;
            float _696 = _680 * _676;
            float _698 = _390 * _690;
            float _700 = _388 * _676;
            float _702 = _390 * _692;
            float _704 = _390 * _694;
            float _706 = _684 * _676;
            float _708 = fma(_634, _700, _698);
            float _710 = _688 * _676;
            float _712 = _650 * _676;
            float _714 = fma(_388, _696, _702);
            float _716 = fma(_638, _700, _704);
            float _718 = fma(_392, _706, _708);
            float _720 = fma(_392, _710, _714);
            float _722 = fma(_392, _712, _716);
            _398 = _592;
            _400 = _598;
            _296 = _604;
            _298 = _638;
            _300 = _698;
            _302 = _700;
            _304 = _714;
            _306 = _664;
            _332 = _608;
            _402 = _614;
            _364 = _620;
            _366 = _692;
            _544 = _720;
            _546 = _718;
            _548 = _722;
            _308 = _710;
            _310 = _712;
        }
    }
    _550 = false;
    float _724 = _398;
    float _726 = _400;
    float _728 = _296;
    float _730 = _298;
    float _732 = _300;
    float _734 = _302;
    float _736 = _304;
    float _738 = _306;
    float _740 = _332;
    float _742 = _402;
    float _744 = _364;
    float _746 = _366;
    float _748 = _544;
    float _750 = _546;
    float _752 = _548;
    float _754 = _308;
    float _756 = _310;
    uint _758 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_758)] = as_type<uint>(_278);
    float _760 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _762 = as_type<int>(_760) & 512;
    bool _764 = _762 != 0;
    int _766 = as_type<int>(_760) & 1024;
    bool _768 = _766 != 0;
    float _770 = _724;
    float _772 = _726;
    float _774 = _728;
    float _776 = _730;
    float _778 = _754;
    float _780 = _756;
    if (_764)
    {
        float _782 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _770 = _782;
        _772 = _784;
        _774 = _786;
        _776 = _788;
    }
    float _790 = _770;
    float _792 = _772;
    float _794 = _774;
    float _796 = _776;
    float _798 = _732;
    float _800 = _734;
    float _802 = _736;
    float _804 = _738;
    if (_764)
    {
        float _806 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _808 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _810 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _812 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _798 = _806;
        _800 = _808;
        _802 = _810;
        _804 = _812;
    }
    float _814 = _798;
    float _816 = _800;
    float _818 = _802;
    float _820 = _804;
    float _822 = _740;
    float _824 = _742;
    float _826 = _744;
    float _828 = _746;
    if (_764)
    {
        float _830 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _832 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _834 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _836 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _822 = _830;
        _824 = _832;
        _826 = _834;
        _828 = _836;
    }
    float _838 = _822;
    float _840 = _824;
    float _842 = _826;
    float _844 = _828;
    float _846 = _384 + _748;
    float _848 = _382 + _750;
    float _850 = _386 + _752;
    if (!_764)
    {
        _778 = 0.0;
    }
    float _852 = _778;
    float _854 = _852;
    if (!_764)
    {
        _780 = 0.0;
    }
    float _856 = _780;
    int _858 = as_type<int>(_760) & 2048;
    bool _860 = _858 != 0;
    float _862 = _794;
    float _864 = _856;
    if (_764)
    {
        float _866 = _846 * _792;
        _404 = _866;
    }
    float _868 = _404;
    float _870 = _816;
    float _872 = _868;
    float _874 = _818;
    if (_764)
    {
        float _876 = _846 * _816;
        _870 = _876;
    }
    float _878 = _870;
    float _880 = _878;
    if (_764)
    {
        float _882 = fma(_848, _790, _868);
        _872 = _882;
    }
    float _884 = _872;
    float _886 = _840;
    float _888 = _884;
    float _890 = _838;
    if (_764)
    {
        float _892 = _846 * _840;
        _886 = _892;
    }
    float _894 = _886;
    if (_764)
    {
        float _896 = fma(_848, _814, _878);
        _880 = _896;
    }
    float _898 = _880;
    if (_764)
    {
        float _900 = fma(_850, _794, _884);
        _862 = _900;
    }
    float _902 = _862;
    if (!_764)
    {
        _888 = 0.0;
    }
    float _904 = _888;
    float _906 = _904;
    if (_764)
    {
        float _908 = fma(_848, _838, _894);
        _890 = _908;
    }
    float _910 = _890;
    float _912 = _910;
    if (_764)
    {
        float _914 = fma(_850, _818, _898);
        _874 = _914;
    }
    float _916 = _874;
    if (_764)
    {
        float _918 = _796 + _902;
        _854 = _918;
    }
    float _920 = _854;
    float _922 = _920;
    if (_764)
    {
        float _924 = fma(_850, _842, _910);
        _912 = _924;
    }
    float _926 = _912;
    if (_764)
    {
        float _928 = _820 + _916;
        _906 = _928;
    }
    float _930 = _906;
    float _932 = _930;
    if (_764)
    {
        float _934 = _844 + _926;
        _864 = _934;
    }
    float _936 = _864;
    bool _938 = !_768;
    float _940 = _936;
    if (!_938)
    {
        float _942 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _944 = uint(int(uint(_172) >> uint(2)));
        float _946 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_944)]);
        int _948 = _172 + 4;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        float _952 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_950)]);
        int _954 = _172 + 8;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        float _958 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_956)]);
        uint _960 = uint(int(uint(_172) >> uint(2)));
        float _962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_960)]);
        int _964 = _172 + 4;
        uint _966 = uint(int(uint(_964) >> uint(2)));
        float _968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_966)]);
        int _970 = _172 + 8;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        float _974 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_972)]);
        uint _976 = uint(int(uint(_172) >> uint(2)));
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_976)]);
        int _980 = _172 + 4;
        uint _982 = uint(int(uint(_980) >> uint(2)));
        float _984 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_982)]);
        int _986 = _172 + 8;
        uint _988 = uint(int(uint(_986) >> uint(2)));
        float _990 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_988)]);
        float _992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _996 = _846 * _952;
        float _998 = _846 * _968;
        float _1000 = _846 * _984;
        float _1002 = fma(_848, _946, _996);
        float _1004 = fma(_848, _962, _998);
        float _1006 = fma(_848, _978, _1000);
        float _1008 = fma(_850, _958, _1002);
        float _1010 = fma(_850, _974, _1004);
        float _1012 = fma(_850, _990, _1006);
        float _1014 = _942 + _1008;
        float _1016 = _992 + _1010;
        float _1018 = _994 + _1012;
        _932 = _1016;
        _922 = _1014;
        _940 = _1018;
    }
    float _1020 = _932;
    float _1022 = _922;
    float _1024 = _940;
    bool _1026 = !_860;
    float _1028 = _1020;
    float _1030 = _1022;
    float _1032 = _1024;
    if (!_1026)
    {
        uint _1034 = uint(int(uint(_172) >> uint(2)));
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1034)]);
        int _1038 = _172 + 4;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1040)]);
        int _1044 = _172 + 8;
        uint _1046 = uint(int(uint(_1044) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1046)]);
        int _1050 = _172 + 12;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1052)]);
        uint _1056 = uint(int(uint(_172) >> uint(2)));
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1056)]);
        int _1060 = _172 + 4;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1062)]);
        int _1066 = _172 + 8;
        uint _1068 = uint(int(uint(_1066) >> uint(2)));
        float _1070 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1068)]);
        int _1072 = _172 + 12;
        uint _1074 = uint(int(uint(_1072) >> uint(2)));
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1074)]);
        uint _1078 = uint(int(uint(_172) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1078)]);
        int _1082 = _172 + 4;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1084)]);
        int _1088 = _172 + 8;
        uint _1090 = uint(int(uint(_1088) >> uint(2)));
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1090)]);
        int _1094 = _172 + 12;
        uint _1096 = uint(int(uint(_1094) >> uint(2)));
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1096)]);
        float _1100 = _846 * _1042;
        float _1102 = _846 * _1064;
        float _1104 = _846 * _1086;
        float _1106 = fma(_848, _1036, _1100);
        float _1108 = fma(_848, _1058, _1102);
        float _1110 = fma(_848, _1080, _1104);
        float _1112 = fma(_850, _1048, _1106);
        float _1114 = fma(_850, _1070, _1108);
        float _1116 = fma(_850, _1092, _1110);
        float _1118 = _1112 + _1054;
        float _1120 = _1114 + _1076;
        float _1122 = _1116 + _1098;
        _1028 = _1120;
        _1030 = _1118;
        _1032 = _1122;
    }
    float _1124 = _1028;
    float _1126 = _1030;
    float _1128 = _1032;
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1154 = _1132 * _1124;
    float _1156 = fma(_1130, _1126, _1154);
    float _1158 = fma(_1134, _1128, _1156);
    float _1160 = _1136 + _1158;
    float _1162 = -_1160;
    bool _1164 = _1138 >= _1162;
    bool _1166 = isnan(_1138);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(_1162);
    bool _1172 = _1168 || _1170;
    float _1174 = -_1160;
    bool _1176 = _1140 >= _1174;
    bool _1178 = isnan(_1140);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1174);
    bool _1184 = _1180 || _1182;
    int _1186 = _1172 ? 0 : 1;
    int _1188 = 2;
    if (_1172)
    {
        _1188 = 1;
    }
    int _1190 = _1188;
    int _1192 = _1190;
    if (_1184)
    {
        _1192 = _1186;
    }
    int _1194 = _1192;
    int _1196 = _1194 << 6;
    int _1198 = _1196 + 96;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    float _1202 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1200)]);
    int _1204 = _1198 + 4;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    float _1208 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1206)]);
    int _1210 = _1198 + 8;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    float _1214 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1212)]);
    int _1216 = _1198 + 12;
    uint _1218 = uint(int(uint(_1216) >> uint(2)));
    float _1220 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1218)]);
    int _1222 = _1196 + 48;
    int _1224 = _1196 + 64;
    uint _1226 = uint(int(uint(_1222) >> uint(2)));
    float _1228 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1226)]);
    int _1230 = _1222 + 4;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    float _1234 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1232)]);
    int _1236 = _1222 + 8;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1238)]);
    int _1242 = _1222 + 12;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1244)]);
    uint _1248 = uint(int(uint(_1224) >> uint(2)));
    float _1250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1248)]);
    int _1252 = _1224 + 4;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    float _1256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1254)]);
    int _1258 = _1224 + 8;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    float _1262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1260)]);
    int _1264 = _1224 + 12;
    uint _1266 = uint(int(uint(_1264) >> uint(2)));
    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1266)]);
    int _1270 = _1196 + 80;
    float _1272 = _1142 + 1.0;
    float _1274 = _1272 + _1124;
    uint _1276 = uint(int(uint(_1270) >> uint(2)));
    float _1278 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1276)]);
    int _1280 = _1270 + 4;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    float _1284 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1282)]);
    int _1286 = _1270 + 8;
    uint _1288 = uint(int(uint(_1286) >> uint(2)));
    float _1290 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1288)]);
    int _1292 = _1270 + 12;
    uint _1294 = uint(int(uint(_1292) >> uint(2)));
    float _1296 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1294)]);
    float _1298 = _1274 * _1146;
    float _1300 = fma(_1144, _1126, _1298);
    float _1302 = fma(_1148, _1128, _1300);
    float _1304 = _1150 + _1302;
    float _1306 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1308 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1312 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1314 = trunc(_1304);
    int _1316 = int(_1314);
    int _1318 = ~as_type<int>(_1152);
    int _1320 = _1316 + _1318;
    int _1322 = _1320 + 1;
    float _1324 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1326 = _1322 >= 0;
    int _1328 = _1196;
    float _1330 = as_type<float>(_1194);
    if (_1326)
    {
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1328 = as_type<int>(_1332);
    }
    int _1334 = _1328;
    float _1336 = _1274 * _1208;
    float _1338 = fma(_1202, _1126, _1336);
    float _1340 = fma(_1214, _1128, _1338);
    float _1342 = _1220 + _1340;
    float _1344 = _1274 * _1234;
    float _1346 = 1.0 / _1342;
    float _1348 = fma(_1228, _1126, _1344);
    float _1350 = _1274 * _1256;
    float _1352 = fma(_1240, _1128, _1348);
    float _1354 = fma(_1250, _1126, _1350);
    float _1356 = _1246 + _1352;
    float _1358 = fma(_1262, _1128, _1354);
    float _1360 = _1356 * _1346;
    float _1362 = _1268 + _1358;
    bool _1364 = _1360 >= 0.0;
    float _1366 = _1362 * _1346;
    bool _1368 = _1360 <= 1.0;
    bool _1370 = _1368 && _1364;
    bool _1372 = _1366 >= 0.0;
    bool _1374 = _1372 && _1370;
    bool _1376 = _1366 <= 1.0;
    bool _1378 = _1376 && _1374;
    float _1380 = _1274 * _1284;
    float _1382 = fma(_1278, _1126, _1380);
    float _1384 = _1360;
    float _1386 = _1358;
    float _1388 = _1268;
    float _1390 = _1228;
    float _1392 = _1348;
    float _1394 = _1356;
    float _1396 = _1246;
    if (_1378)
    {
        float _1398 = float(_1194);
        _1330 = _1398;
    }
    float _1400 = _1330;
    float _1402 = _1250;
    if (_1378)
    {
        float _1404 = rint(_1400);
        float _1406 = precise::max(_1404, 0.0);
        uint _1408 = uint(_1406);
        uint _1410 = clamp(_1408, 0u, 65535u);
        _1402 = as_type<float>(_1410);
    }
    float _1412 = _1402;
    float _1414 = fma(_1290, _1128, _1382);
    float _1416 = _1296 + _1414;
    float _1418 = _1416 * _1346;
    float _1420 = _1412;
    if (_1378)
    {
        float3 _4390 = float3(_1360, _1366, float(as_type<int>(_1412)));
        float3 _4394 = select(_4390, float3(0.0), isnan(_4390));
        float _1422 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4394.xy, uint(rint(_4394.z)), _1418, level(0.0));
        _1420 = _1422;
    }
    float _1424 = _1420;
    float _1426 = _1274 * _1308;
    float _1428 = fma(_1306, _1126, _1426);
    float _1430 = fma(_1310, _1128, _1428);
    float _1432 = _1312 + _1430;
    float _1434 = trunc(_1432);
    int _1436 = int(_1434);
    bool _1438 = _1334 <= _1322;
    bool _1440 = !_1326;
    bool _1442 = _1438 || _1440;
    int _1444 = ~as_type<int>(_1324);
    int _1446 = _1436 + _1444;
    int _1448 = _1446 + 1;
    bool _1450 = _1448 < 0;
    bool _1452 = _1450 || _1442;
    float _1454 = _1428;
    float _1456 = as_type<float>(_1436);
    if (!_1452)
    {
        float _1458 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1454 = _1458;
    }
    float _1460 = _1454;
    bool _1462 = as_type<int>(_1460) <= _1448;
    bool _1464 = _1462 || _1452;
    float _1466 = _1460;
    if (_1464)
    {
        _1456 = 1.0;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1464)
    {
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1474 = _1448 * as_type<int>(_1472);
        int _1476 = _1474 + _1322;
        int _1478 = _1476 << 2;
        uint _1480 = uint(int(uint(_1476) >> uint(2)));
        int _1482 = 12 & _1478;
        int _1484 = int(_1480) << 4;
        int _1486 = _1484 + _1482;
        int _1488 = _1486 + 400;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1490)]);
        float _1494 = floor(_1432);
        float _1496 = floor(_1304);
        float _1498 = -_1494;
        float _1500 = _1432 + _1498;
        float _1502 = -_1496;
        float _1504 = _1304 + _1502;
        float _1506 = rint(_1492);
        float _1508 = precise::max(_1506, 0.0);
        uint _1510 = uint(_1508);
        uint _1512 = clamp(_1510, 0u, 65535u);
        float3 _4529 = float3(_1504, _1500, float(int(_1512)));
        float3 _4531 = select(_4529, float3(0.0), isnan(_4529));
        float _1514 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4531.xy, uint(rint(_4531.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4531.xy, uint(rint(_4531.z)), level(0.0)).x;
        int _1516 = _1476 << 4;
        int _1518 = _1516 + 2048;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        int _1524 = _1518 + 4;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
        int _1530 = _1518 + 8;
        uint _1532 = uint(int(uint(_1530) >> uint(2)));
        float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
        int _1536 = _1518 + 12;
        uint _1538 = uint(int(uint(_1536) >> uint(2)));
        float _1540 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1538)]);
        float _1542 = _1274 * _1528;
        float _1544 = fma(_1522, _1126, _1542);
        float _1546 = fma(_1534, _1128, _1544);
        float _1548 = _1540 + _1546;
        float _1550 = precise::clamp(_1548, 0.0, 1.0);
        float _1552 = -_1550;
        float _1554 = _1552 + _1514;
        float _1556 = fma(_1554, 500.0, 1.5);
        float _1558 = exp2(_1556);
        float _1560 = 0.0 + _1558;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        _1466 = _1492;
        _1470 = _1562;
        _1384 = 500.0;
        _1386 = as_type<float>(_1512);
        _1388 = _1504;
        _1390 = _1522;
        _1392 = _1544;
        _1394 = _1558;
        _1396 = _1540;
    }
    float _1564 = _1466;
    float _1566 = _1470;
    float _1568 = _1384;
    float _1570 = _1386;
    float _1572 = _1388;
    float _1574 = _1390;
    float _1576 = _1392;
    float _1578 = _1394;
    float _1580 = _1396;
    uint _1582 = uint(int(uint(_172) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1582)]);
    float _1586 = _1564;
    if (!_1378)
    {
        _1586 = 1.0;
    }
    float _1588 = _1586;
    bool _1590 = _322 > 0.001000000047497451305389404296875;
    bool _1592 = isnan(_322);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan(0.001000000047497451305389404296875);
    bool _1598 = _1594 || _1596;
    float _1600 = _1588;
    if (_1378)
    {
        bool _1602 = _1424 >= _1418;
        bool _1604 = isnan(_1424);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan(_1418);
        bool _1610 = _1606 || _1608;
        float _1612 = float(_1610);
        _1600 = _1612;
    }
    float _1614 = _1600;
    float _1616 = -_1614;
    float _1618 = fma(_1616, _1566, 1.0);
    float _1620 = -_1584;
    float _1622 = _1618 + _1620;
    float _1624 = _1618;
    float _1626 = _1622;
    if (_1598)
    {
        float _1628 = fma(_1622, 0.0500000007450580596923828125, _1584);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = precise::max(0.0, _1630);
    float _1634 = precise::min(_1632, 0.999000012874603271484375);
    uint _1636 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1636)] = as_type<uint>(_1634);
    float _1638 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _1640 = as_type<int>(_1638) & 512;
    bool _1642 = _1640 != 0;
    int _1644 = as_type<int>(_1638) & 1024;
    bool _1646 = _1644 != 0;
    float _1648 = _1424;
    float _1650 = _1568;
    float _1652 = _1570;
    float _1654 = _1572;
    float _1656 = _1632;
    float _1658 = _1634;
    bool _1660 = _1646;
    if (_1642)
    {
        float _1662 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1664 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1666 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1668 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1648 = _1662;
        _1650 = _1664;
        _1652 = _1666;
        _1654 = _1668;
    }
    float _1670 = _1648;
    float _1672 = _1650;
    float _1674 = _1652;
    float _1676 = _1654;
    float _1678 = _1574;
    float _1680 = _1576;
    float _1682 = _1578;
    float _1684 = _1580;
    if (_1642)
    {
        float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1678 = _1686;
        _1680 = _1688;
        _1682 = _1690;
        _1684 = _1692;
    }
    float _1694 = _1678;
    float _1696 = _1680;
    float _1698 = _1682;
    float _1700 = _1684;
    float _1702 = _1432;
    float _1704 = _1382;
    float _1706 = _1414;
    float _1708 = _1296;
    if (_1642)
    {
        float _1710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1702 = _1710;
        _1704 = _1712;
        _1706 = _1714;
        _1708 = _1716;
    }
    float _1718 = _1702;
    float _1720 = _1704;
    float _1722 = _1706;
    float _1724 = _1708;
    if (!_1642)
    {
        _1656 = 0.0;
        _1658 = 0.0;
    }
    float _1726 = _1656;
    float _1728 = _1658;
    int _1730 = as_type<int>(_1638) & 2048;
    bool _1732 = _1730 != 0;
    int _1734 = _172 + 8;
    float _1736 = _1674;
    float _1738 = _1728;
    float _1740 = _1726;
    if (_1642)
    {
        float _1742 = _846 * _1672;
        _1626 = _1742;
    }
    float _1744 = _1626;
    float _1746 = _1696;
    float _1748 = _1744;
    float _1750 = _1698;
    if (_1642)
    {
        float _1752 = _846 * _1696;
        _1746 = _1752;
    }
    float _1754 = _1746;
    float _1756 = _1754;
    if (_1642)
    {
        float _1758 = fma(_848, _1670, _1744);
        _1748 = _1758;
    }
    float _1760 = _1748;
    float _1762 = _1720;
    float _1764 = _1760;
    float _1766 = _1718;
    if (_1642)
    {
        float _1768 = _846 * _1720;
        _1762 = _1768;
    }
    float _1770 = _1762;
    if (_1642)
    {
        float _1772 = fma(_848, _1694, _1754);
        _1756 = _1772;
    }
    float _1774 = _1756;
    if (_1642)
    {
        float _1776 = fma(_850, _1674, _1760);
        _1736 = _1776;
    }
    float _1778 = _1736;
    if (!_1642)
    {
        _1764 = 0.0;
    }
    float _1780 = _1764;
    float _1782 = _1780;
    if (_1642)
    {
        float _1784 = fma(_848, _1718, _1770);
        _1766 = _1784;
    }
    float _1786 = _1766;
    float _1788 = _1786;
    if (_1642)
    {
        float _1790 = fma(_850, _1698, _1774);
        _1750 = _1790;
    }
    float _1792 = _1750;
    if (_1642)
    {
        float _1794 = _1676 + _1778;
        _1738 = _1794;
    }
    float _1796 = _1738;
    float _1798 = _1796;
    if (_1642)
    {
        float _1800 = fma(_850, _1722, _1786);
        _1788 = _1800;
    }
    float _1802 = _1788;
    if (_1642)
    {
        float _1804 = _1700 + _1792;
        _1740 = _1804;
    }
    float _1806 = _1740;
    float _1808 = _1806;
    if (_1642)
    {
        float _1810 = _1724 + _1802;
        _1782 = _1810;
    }
    float _1812 = _1782;
    bool _1814 = !_1646;
    float _1816 = _1812;
    if (!_1814)
    {
        float _1818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1820 = uint(int(uint(_172) >> uint(2)));
        float _1822 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1820)]);
        int _1824 = _172 + 4;
        uint _1826 = uint(int(uint(_1824) >> uint(2)));
        float _1828 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1826)]);
        int _1830 = _172 + 8;
        uint _1832 = uint(int(uint(_1830) >> uint(2)));
        float _1834 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1832)]);
        uint _1836 = uint(int(uint(_172) >> uint(2)));
        float _1838 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1836)]);
        int _1840 = _172 + 4;
        uint _1842 = uint(int(uint(_1840) >> uint(2)));
        float _1844 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1842)]);
        int _1846 = _172 + 8;
        uint _1848 = uint(int(uint(_1846) >> uint(2)));
        float _1850 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1848)]);
        uint _1852 = uint(int(uint(_172) >> uint(2)));
        float _1854 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1852)]);
        int _1856 = _172 + 4;
        uint _1858 = uint(int(uint(_1856) >> uint(2)));
        float _1860 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1858)]);
        int _1862 = _172 + 8;
        uint _1864 = uint(int(uint(_1862) >> uint(2)));
        float _1866 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1864)]);
        float _1868 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1872 = _846 * _1828;
        float _1874 = _846 * _1844;
        float _1876 = fma(_848, _1822, _1872);
        float _1878 = _846 * _1860;
        float _1880 = fma(_848, _1838, _1874);
        float _1882 = fma(_848, _1854, _1878);
        float _1884 = fma(_850, _1834, _1876);
        float _1886 = fma(_850, _1850, _1880);
        float _1888 = fma(_850, _1866, _1882);
        float _1890 = _1818 + _1884;
        float _1892 = _1868 + _1886;
        float _1894 = _1870 + _1888;
        _1808 = _1892;
        _1798 = _1890;
        _1816 = _1894;
    }
    float _1896 = _1808;
    float _1898 = _1798;
    float _1900 = _1816;
    bool _1902 = !_1732;
    float _1904 = _1898;
    float _1906 = _1900;
    float _1908 = _1896;
    if (!_1902)
    {
        uint _1910 = uint(int(uint(_172) >> uint(2)));
        float _1912 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1910)]);
        int _1914 = _172 + 4;
        uint _1916 = uint(int(uint(_1914) >> uint(2)));
        float _1918 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1916)]);
        int _1920 = _172 + 8;
        uint _1922 = uint(int(uint(_1920) >> uint(2)));
        float _1924 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1922)]);
        int _1926 = _172 + 12;
        uint _1928 = uint(int(uint(_1926) >> uint(2)));
        float _1930 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1928)]);
        uint _1932 = uint(int(uint(_172) >> uint(2)));
        float _1934 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1932)]);
        int _1936 = _172 + 4;
        uint _1938 = uint(int(uint(_1936) >> uint(2)));
        float _1940 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1938)]);
        int _1942 = _172 + 8;
        uint _1944 = uint(int(uint(_1942) >> uint(2)));
        float _1946 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1944)]);
        int _1948 = _172 + 12;
        uint _1950 = uint(int(uint(_1948) >> uint(2)));
        float _1952 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1950)]);
        uint _1954 = uint(int(uint(_172) >> uint(2)));
        float _1956 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1954)]);
        int _1958 = _172 + 4;
        uint _1960 = uint(int(uint(_1958) >> uint(2)));
        float _1962 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1960)]);
        int _1964 = _172 + 8;
        uint _1966 = uint(int(uint(_1964) >> uint(2)));
        float _1968 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1966)]);
        int _1970 = _172 + 12;
        uint _1972 = uint(int(uint(_1970) >> uint(2)));
        float _1974 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1972)]);
        float _1976 = _846 * _1918;
        float _1978 = _846 * _1940;
        float _1980 = fma(_848, _1912, _1976);
        float _1982 = _846 * _1962;
        float _1984 = fma(_848, _1934, _1978);
        float _1986 = fma(_848, _1956, _1982);
        float _1988 = fma(_850, _1924, _1980);
        float _1990 = fma(_850, _1946, _1984);
        float _1992 = fma(_850, _1968, _1986);
        float _1994 = _1988 + _1930;
        float _1996 = _1990 + _1952;
        float _1998 = _1992 + _1974;
        _1904 = _1994;
        _1906 = _1998;
        _1908 = _1996;
    }
    float _2000 = _1904;
    float _2002 = _1906;
    float _2004 = _1908;
    uint _2006 = uint(int(uint(_1734) >> uint(2)));
    float _2008 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2006)]);
    float _2010 = fma(_2000, 6.2500002968590706586837768554688e-05, 0.5);
    float _2012 = fma(_2002, 6.2500002968590706586837768554688e-05, 0.5);
    float _2014 = _1598 ? _2008 : 1.0;
    bool _2016 = _2014 > 0.00999999977648258209228515625;
    float _2018 = _2000;
    float _2020 = _2004;
    if (_2016)
    {
        float2 _5285 = float2(_2010, _2012);
        float _2022 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5285, float2(0.0), isnan(_5285)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5285, float2(0.0), isnan(_5285)), level(0.0)).x;
        _2018 = _2022;
    }
    float _2024 = _2018;
    float2 _5298 = float2(_2010, _2012);
    float _2026 = dm_bs(spvDescriptorSet0.cp_t_tcb_22.sample(spvDescriptorSet0.cp_t_tcb_22Smplr, select(_5298, float2(0.0), isnan(_5298)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_22, spvDescriptorSet0.cp_t_tcb_22Smplr_w, select(_5298, float2(0.0), isnan(_5298)), level(0.0)).x;
    if (_2016)
    {
        float _2028 = _2004 + 1.0;
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = _2024;
    if (_2016)
    {
        float _2034 = _2024 * 2000.0;
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = abs(_2026);
    bool _2040 = _2038 == 0.0;
    float _2042 = float(_2040);
    float _2044 = -_226;
    float _2046 = _2044 + _848;
    int _2048 = _172 + 4;
    float _2050 = _2042;
    if (_2016)
    {
        bool _2052 = _2030 >= _2036;
        bool _2054 = isnan(_2030);
        bool _2056 = _2052 || _2054;
        bool _2058 = isnan(_2036);
        bool _2060 = _2056 || _2058;
        _1660 = _2060;
    }
    bool _2062 = _1660;
    float _2064 = -_238;
    float _2066 = _2064 + _850;
    if (_2016)
    {
        float _2068 = _2062 ? _2042 : 1.0;
        _2050 = _2068;
    }
    float _2070 = _2050;
    float _2072 = -_2014;
    float _2074 = _2072 + _2070;
    float _2076 = _2070;
    if (_1598)
    {
        float _2078 = fma(_2074, 0.0500000007450580596923828125, _2014);
        _2076 = _2078;
    }
    float _2080 = _2076;
    float _2082 = 0.0 + _2080;
    float _2084 = precise::clamp(_2082, 0.0, 1.0);
    float _2086 = -_232;
    float _2088 = _2086 + _846;
    uint _2090 = uint(int(uint(_1734) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2090)] = as_type<uint>(_2084);
    uint _2092 = uint(int(uint(_176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2092)] = as_type<uint>(_278);
    uint _2094 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2094)] = as_type<uint>(_848);
    uint _2096 = uint(int(uint(_2048) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2096)] = as_type<uint>(_846);
    uint _2098 = uint(int(uint(_1734) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2098)] = as_type<uint>(_850);
    uint _2100 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2100)] = as_type<uint>(_372);
    uint _2102 = uint(int(uint(_2048) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2102)] = as_type<uint>(_374);
    uint _2104 = uint(int(uint(_1734) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2104)] = as_type<uint>(_376);
    uint _2106 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2106)] = as_type<uint>(_2046);
    uint _2108 = uint(int(uint(_2048) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2108)] = as_type<uint>(_2088);
    uint _2110 = uint(int(uint(_1734) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2110)] = as_type<uint>(_2066);
    float _2112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2114 = _2088 * _2088;
    float _2116 = _374 * _374;
    float _2118 = fma(_2046, _2046, _2114);
    float _2120 = fma(_372, _372, _2116);
    float _2122 = fma(_2066, _2066, _2118);
    float _2124 = fma(_376, _376, _2120);
    float _2126 = sqrt(_2124);
    float _2128 = sqrt(_2122);
    bool _2130 = _2128 >= 9.9999999747524270787835121154785e-07;
    bool _2132 = isnan(_2128);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan(9.9999999747524270787835121154785e-07);
    bool _2138 = _2134 || _2136;
    if (!_2138)
    {
        bool _2140 = _180 != _184;
        bool _2142 = isnan(_180);
        bool _2144 = _2140 || _2142;
        bool _2146 = isnan(_184);
        bool _2148 = _2144 || _2146;
        _2150 = _2148;
        if (!_2150)
        {
            float _2152 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _2154 = _2152 > 0.0;
            bool _2156 = !_2154;
            if (!_2156)
            {
                float _2158 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _2160 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _2162 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _2164 = _2160 * _2160;
                float _2166 = fma(_2158, _2158, _2164);
                float _2168 = fma(_2162, _2162, _2166);
                float _2170 = rsqrt(_2168);
                float _2172 = _2170 * 9.9999999747524270787835121154785e-07;
                float _2174 = _2158 * _2172;
                float _2176 = _2160 * _2172;
                float _2178 = _2162 * _2172;
                _418 = as_type<int>(_2174);
                _420 = as_type<int>(_2176);
                _422 = as_type<int>(_2178);
                _2150 = true;
            }
            else
            {
                bool _2180 = _2126 >= 9.9999999747524270787835121154785e-07;
                bool _2182 = isnan(_2126);
                bool _2184 = _2180 || _2182;
                bool _2186 = isnan(9.9999999747524270787835121154785e-07);
                bool _2188 = _2184 || _2186;
                if (!_2188)
                {
                    float _2190 = _846 * _846;
                    float _2192 = fma(_848, _848, _2190);
                    float _2194 = fma(_850, _850, _2192);
                    float _2196 = sqrt(_2194);
                    bool _2198 = _2196 >= 9.9999999747524270787835121154785e-07;
                    bool _2200 = isnan(_2196);
                    bool _2202 = _2198 || _2200;
                    bool _2204 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2206 = _2202 || _2204;
                    float _2208 = _2196;
                    if (_2206)
                    {
                        float _2210 = rsqrt(_2194);
                        _2208 = _2210;
                    }
                    float _2212 = _2208;
                    if (!_2206)
                    {
                        _406 = 0;
                    }
                    int _2214 = _406;
                    int _2216 = _2214;
                    if (!_2206)
                    {
                        _408 = 897988541;
                    }
                    int _2218 = _408;
                    int _2220 = _2218;
                    if (!_2206)
                    {
                        _410 = 0;
                    }
                    int _2222 = _410;
                    int _2224 = _2222;
                    if (_2206)
                    {
                        float _2226 = _2212 * 9.9999999747524270787835121154785e-07;
                        _312 = _2226;
                    }
                    float _2228 = _312;
                    if (_2206)
                    {
                        float _2230 = _848 * _2228;
                        _2216 = as_type<int>(_2230);
                    }
                    int _2232 = _2216;
                    _418 = _2232;
                    if (_2206)
                    {
                        float _2234 = _846 * _2228;
                        _2220 = as_type<int>(_2234);
                    }
                    int _2236 = _2220;
                    _420 = _2236;
                    if (_2206)
                    {
                        float _2238 = _850 * _2228;
                        _2224 = as_type<int>(_2238);
                    }
                    int _2240 = _2224;
                    _422 = _2240;
                    _2150 = true;
                }
                else
                {
                    float _2242 = rsqrt(_2124);
                    float _2244 = _2242 * 9.9999999747524270787835121154785e-07;
                    float _2246 = _372 * _2244;
                    float _2248 = _374 * _2244;
                    float _2250 = _376 * _2244;
                    _418 = as_type<int>(_2246);
                    _420 = as_type<int>(_2248);
                    _422 = as_type<int>(_2250);
                    _2150 = true;
                }
            }
        }
    }
    else
    {
        float _2252 = _2126 * _2112;
        bool _2254 = _2252 >= 0.001000000047497451305389404296875;
        bool _2256 = isnan(_2252);
        bool _2258 = _2254 || _2256;
        bool _2260 = isnan(0.001000000047497451305389404296875);
        bool _2262 = _2258 || _2260;
        bool _2264 = _2252 > 0.0;
        bool _2266 = !_2262;
        bool _2268 = _2264 && _2266;
        bool _2270 = _2128 < 0.001000000047497451305389404296875;
        bool _2272 = _2270 && _2268;
        if (!_2272)
        {
            _412 = as_type<int>(_2046);
        }
        int _2274 = _412;
        int _2276 = _2274;
        if (_2272)
        {
            float _2278 = _372 * _2112;
            _2276 = as_type<int>(_2278);
        }
        int _2280 = _2276;
        _418 = _2280;
        if (!_2272)
        {
            _414 = as_type<int>(_2088);
        }
        int _2282 = _414;
        int _2284 = _2282;
        if (_2272)
        {
            float _2286 = _374 * _2112;
            _2284 = as_type<int>(_2286);
        }
        int _2288 = _2284;
        _420 = _2288;
        if (!_2272)
        {
            _416 = as_type<int>(_2066);
        }
        int _2290 = _416;
        _422 = _2290;
        if (_2272)
        {
            float _2292 = _376 * _2112;
            _422 = as_type<int>(_2292);
        }
    }
    _2150 = false;
    int _2294 = _418;
    int _2296 = _420;
    int _2298 = _422;
    uint _2300 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2300)] = uint(_2294);
    uint _2302 = uint(int(uint(_2048) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2302)] = uint(_2296);
    uint _2304 = uint(int(uint(_1734) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2304)] = uint(_2298);
}

