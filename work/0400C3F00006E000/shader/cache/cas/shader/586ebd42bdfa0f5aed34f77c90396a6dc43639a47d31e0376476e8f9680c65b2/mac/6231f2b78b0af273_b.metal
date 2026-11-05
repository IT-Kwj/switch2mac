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
    texture2d<float> cp_t_tcb_2C [[id(14)]];
    sampler cp_t_tcb_2CSmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_16 [[id(18)]];
    sampler cp_t_tcb_16Smplr [[id(19)]];
    sampler cp_t_tcb_2CSmplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1720 = false;
    bool _540 = false;
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _80 = as_type<float>(gl_LocalInvocationID.x);
    float _82 = as_type<float>(gl_WorkGroupID.x);
    int _85 = as_type<int>(_82) << 5;
    int _87 = _85 + as_type<int>(_80);
    float _89 = trunc(_78);
    int _91 = int(_89);
    bool _95 = _87 >= _91;
    int _97 = 0;
    if (_95)
    {
        _97 = 0;
    }
    int _99 = _97;
    int _101 = _99;
    int _103 = _99;
    if (!_95)
    {
        int _105 = _87 << 4;
        int _107 = _105 + 12;
        uint _110 = uint(int(uint(_107) >> uint(2)));
        float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
        float _114 = trunc(_112);
        int _116 = int(_114);
        bool _118 = _116 >= 1;
        int _120 = _118 ? (-1) : 0;
        if (!_118)
        {
            _101 = 0;
        }
        int _122 = _101;
        bool _124 = !_118;
        _103 = _122;
        if (!_124)
        {
            float _126 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _128 = uint(int(uint(_107) >> uint(2)));
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_128)]);
            float _132 = float(_116);
            float _134 = -_130;
            float _136 = _126 + _134;
            bool _138 = _136 > _132;
            int _140 = as_type<int>(_126);
            if (!_138)
            {
                bool _142 = _126 >= _130;
                bool _144 = isnan(_126);
                bool _146 = _142 || _144;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                _120 = _150 ? (-1) : 0;
            }
            int _152 = _120;
            if (_138)
            {
                _140 = 0;
            }
            int _154 = _140;
            _103 = _154;
            if (!_138)
            {
                int _156 = ~_152;
                int _158 = (_156 != 0) ? 0 : 1;
                _103 = _158;
            }
        }
    }
    int _160 = _103;
    int _162 = _160 & 1;
    bool _164 = _162 != 0;
    if (!_164)
    {
        return;
    }
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    int _168 = _87 << 4;
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _172 = _168 + 12;
    float _174 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _180 = uint(int(uint(_172) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_180)]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _186 = uint(int(uint(_168) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_186)]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _200 = uint(int(uint(_168) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    int _204 = _168 + 4;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    int _210 = _168 + 8;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    uint _216 = uint(int(uint(_172) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_216)]);
    uint _220 = uint(int(uint(_168) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_220)]);
    int _224 = _168 + 4;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_226)]);
    int _230 = _168 + 8;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _168 + 12;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _250 = uint(int(uint(_168) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_250)]);
    int _254 = _168 + 4;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_256)]);
    int _260 = _168 + 8;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _168 + 12;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    uint _272 = uint(int(uint(_172) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_272)]);
    bool _276 = _166 > 0.0;
    float _278 = abs(_170);
    float _280 = log2(_278);
    bool _282 = _174 > 0.0;
    float _284 = 0.0;
    float _286 = _184;
    float _288 = _194;
    float _290 = _240;
    float _292 = _176;
    float _294 = _190;
    float _296 = _242;
    float _298 = _244;
    float _300 = _246;
    float _302 = _248;
    float _304 = _166;
    float _306 = _196;
    if (_276)
    {
        float _308 = 1.0 / _166;
        _284 = _308;
    }
    float _310 = _284;
    float _312 = _176 * _280;
    float _314 = -_182;
    float _316 = _178 + _314;
    float _318 = exp2(_312);
    float _320 = _184 * _174;
    float _322 = _310;
    float _324 = _320;
    float _326 = _312;
    if (_276)
    {
        float _328 = _316 * _310;
        _322 = _328;
    }
    float _330 = _322;
    if (_282)
    {
        float _332 = -_320;
        float _334 = fma(_188, _332, _184);
        _286 = _334;
    }
    float _336 = _286;
    int _338 = as_type<int>(_190) & 512;
    bool _340 = _338 != 0;
    float _342 = _336;
    bool _344 = _340;
    if (_276)
    {
        float _346 = precise::min(_330, 1.0);
        _324 = _346;
    }
    float _348 = _324;
    float _350 = _176 * _192;
    float _352 = _194 * _350;
    float _354 = _196 * _350;
    float _356 = _198 * _350;
    float _358 = _356;
    if (_276)
    {
        float _360 = _348 * _336;
        _342 = _360;
    }
    float _362 = _342;
    float _364 = fma(_202, _318, _352);
    float _366 = fma(_208, _318, _354);
    float _368 = fma(_214, _318, _356);
    float _370 = _176 * _362;
    float _372 = _218 * _176;
    float _374 = fma(_202, _372, _222);
    float _376 = fma(_208, _372, _228);
    float _378 = fma(_214, _372, _234);
    float _380 = _242 * _370;
    float _382 = _244 * _370;
    float _384 = _246 * _370;
    bool _386 = !_340;
    float _388 = _270;
    float _390 = _362;
    float _392 = _372;
    float _394 = _370;
    float _396 = _378;
    float _398 = _374;
    int _400 = as_type<int>(_258);
    int _402 = as_type<int>(_252);
    int _404 = as_type<int>(_258);
    int _406 = as_type<int>(_264);
    int _408 = as_type<int>(_252);
    int _410 = as_type<int>(_258);
    int _412 = as_type<int>(_264);
    float _534;
    float _536;
    float _538;
    if (!_386)
    {
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _432 = _418 * _420;
        float _434 = _418 * _422;
        float _436 = _416 * _420;
        float _438 = -_432;
        float _440 = fma(_414, _424, _438);
        float _442 = -_434;
        float _444 = fma(_416, _424, _442);
        float _446 = -_436;
        float _448 = fma(_414, _422, _446);
        float _450 = _428 * _414;
        float _452 = _428 * _440;
        float _454 = _430 * _416;
        float _456 = _426 * _422;
        float _458 = -_450;
        float _460 = fma(_426, _416, _458);
        float _462 = -_452;
        float _464 = fma(_426, _444, _462);
        float _466 = _428 * _424;
        float _468 = _430 * _420;
        float _470 = -_456;
        float _472 = fma(_428, _420, _470);
        float _474 = fma(_430, _448, _464);
        float _476 = -_466;
        float _478 = fma(_430, _422, _476);
        float _480 = -_468;
        float _482 = fma(_426, _424, _480);
        float _484 = _426 * _418;
        float _486 = 1.0 / _474;
        float _488 = -_414;
        float _490 = fma(_488, _424, _432);
        float _492 = -_454;
        float _494 = fma(_428, _418, _492);
        float _496 = -_484;
        float _498 = fma(_430, _414, _496);
        float _500 = _478 * _486;
        float _502 = _482 * _486;
        float _504 = _472 * _486;
        float _506 = _490 * _486;
        float _508 = _382 * _500;
        float _510 = _380 * _486;
        float _512 = _382 * _502;
        float _514 = _382 * _504;
        float _516 = _494 * _486;
        float _518 = fma(_444, _510, _508);
        float _520 = _498 * _486;
        float _522 = _460 * _486;
        float _524 = fma(_380, _506, _512);
        float _526 = fma(_448, _510, _514);
        float _528 = fma(_384, _516, _518);
        float _530 = fma(_384, _520, _524);
        float _532 = fma(_384, _522, _526);
        _390 = _420;
        _392 = _422;
        _292 = _424;
        _294 = _448;
        _296 = _508;
        _298 = _510;
        _300 = _524;
        _302 = _474;
        _326 = _426;
        _394 = _428;
        _304 = _430;
        _358 = _502;
        _534 = _530;
        _536 = _528;
        _538 = _532;
        _306 = _520;
        _540 = true;
    }
    else
    {
        int _542 = as_type<int>(_190) & 1024;
        bool _544 = _542 != 0;
        if (_544)
        {
            _344 = true;
        }
        bool _546 = _344;
        bool _548 = _546;
        if (!_544)
        {
            int _550 = as_type<int>(_190) & 2048;
            bool _552 = _550 != 0;
            _548 = _552;
        }
        bool _554 = _548;
        if (!_554)
        {
            _388 = _380;
        }
        float _556 = _388;
        _536 = _556;
        if (!_554)
        {
            _288 = _382;
        }
        float _558 = _288;
        _534 = _558;
        if (!_554)
        {
            _290 = _384;
        }
        float _560 = _290;
        bool _562 = !_554;
        _538 = _560;
        if (!_562)
        {
            uint _564 = uint(int(uint(_168) >> uint(2)));
            float _566 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_564)]);
            int _568 = _168 + 4;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            float _572 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_570)]);
            int _574 = _168 + 8;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_576)]);
            uint _580 = uint(int(uint(_168) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_580)]);
            int _584 = _168 + 4;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_586)]);
            int _590 = _168 + 8;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_592)]);
            uint _596 = uint(int(uint(_168) >> uint(2)));
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_596)]);
            int _600 = _168 + 4;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_602)]);
            int _606 = _168 + 8;
            uint _608 = uint(int(uint(_606) >> uint(2)));
            float _610 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_608)]);
            float _612 = _578 * _582;
            float _614 = _578 * _588;
            float _616 = _572 * _582;
            float _618 = -_612;
            float _620 = fma(_566, _594, _618);
            float _622 = -_614;
            float _624 = fma(_572, _594, _622);
            float _626 = -_616;
            float _628 = fma(_566, _588, _626);
            float _630 = _604 * _566;
            float _632 = _604 * _620;
            float _634 = _610 * _572;
            float _636 = _598 * _588;
            float _638 = -_630;
            float _640 = fma(_598, _572, _638);
            float _642 = -_632;
            float _644 = fma(_598, _624, _642);
            float _646 = _604 * _594;
            float _648 = _610 * _582;
            float _650 = -_636;
            float _652 = fma(_604, _582, _650);
            float _654 = fma(_610, _628, _644);
            float _656 = -_646;
            float _658 = fma(_610, _588, _656);
            float _660 = -_648;
            float _662 = fma(_598, _594, _660);
            float _664 = _598 * _578;
            float _666 = 1.0 / _654;
            float _668 = -_566;
            float _670 = fma(_668, _594, _612);
            float _672 = -_634;
            float _674 = fma(_604, _578, _672);
            float _676 = -_664;
            float _678 = fma(_610, _566, _676);
            float _680 = _658 * _666;
            float _682 = _662 * _666;
            float _684 = _652 * _666;
            float _686 = _670 * _666;
            float _688 = _382 * _680;
            float _690 = _380 * _666;
            float _692 = _382 * _682;
            float _694 = _382 * _684;
            float _696 = _674 * _666;
            float _698 = fma(_624, _690, _688);
            float _700 = _678 * _666;
            float _702 = _640 * _666;
            float _704 = fma(_380, _686, _692);
            float _706 = fma(_628, _690, _694);
            float _708 = fma(_384, _696, _698);
            float _710 = fma(_384, _700, _704);
            float _712 = fma(_384, _702, _706);
            _390 = _582;
            _392 = _588;
            _292 = _594;
            _294 = _628;
            _296 = _688;
            _298 = _690;
            _300 = _704;
            _302 = _654;
            _326 = _598;
            _394 = _604;
            _304 = _610;
            _358 = _682;
            _534 = _710;
            _536 = _708;
            _538 = _712;
            _306 = _700;
        }
    }
    _540 = false;
    float _714 = _390;
    float _716 = _392;
    float _718 = _292;
    float _720 = _294;
    float _722 = _296;
    float _724 = _298;
    float _726 = _300;
    float _728 = _302;
    float _730 = _326;
    float _732 = _394;
    float _734 = _304;
    float _736 = _358;
    float _738 = _534;
    float _740 = _536;
    float _742 = _538;
    float _744 = _306;
    uint _746 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_746)] = as_type<uint>(_274);
    float _748 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _750 = as_type<int>(_748) & 512;
    bool _752 = _750 != 0;
    int _754 = as_type<int>(_748) & 1024;
    bool _756 = _754 != 0;
    float _758 = _714;
    float _760 = _716;
    float _762 = _718;
    float _764 = _720;
    float _766 = _744;
    if (_752)
    {
        float _768 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _758 = _768;
        _760 = _770;
        _762 = _772;
        _764 = _774;
    }
    float _776 = _758;
    float _778 = _760;
    float _780 = _762;
    float _782 = _764;
    float _784 = _722;
    float _786 = _724;
    float _788 = _726;
    float _790 = _728;
    if (_752)
    {
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _784 = _792;
        _786 = _794;
        _788 = _796;
        _790 = _798;
    }
    float _800 = _784;
    float _802 = _786;
    float _804 = _788;
    float _806 = _790;
    float _808 = _730;
    float _810 = _732;
    float _812 = _734;
    float _814 = _736;
    if (_752)
    {
        float _816 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _808 = _816;
        _810 = _818;
        _812 = _820;
        _814 = _822;
    }
    float _824 = _808;
    float _826 = _810;
    float _828 = _812;
    float _830 = _814;
    float _832 = _376 + _738;
    float _834 = _374 + _740;
    float _836 = _378 + _742;
    if (!_752)
    {
        _766 = 0.0;
    }
    float _838 = _766;
    float _840 = _838;
    if (!_752)
    {
        _396 = 0.0;
    }
    float _842 = _396;
    float _844 = 0.0;
    float _846 = _842;
    if (!_752)
    {
        _844 = 0.0;
    }
    float _848 = _844;
    int _850 = as_type<int>(_748) & 2048;
    bool _852 = _850 != 0;
    float _854 = _848;
    if (_752)
    {
        float _856 = _832 * _778;
        _398 = _856;
    }
    float _858 = _398;
    float _860 = _802;
    float _862 = _858;
    float _864 = _804;
    if (_752)
    {
        float _866 = _832 * _802;
        _860 = _866;
    }
    float _868 = _860;
    float _870 = _868;
    if (_752)
    {
        float _872 = fma(_834, _776, _858);
        _862 = _872;
    }
    float _874 = _862;
    float _876 = _826;
    float _878 = _874;
    float _880 = _824;
    if (_752)
    {
        float _882 = _832 * _826;
        _876 = _882;
    }
    float _884 = _876;
    if (_752)
    {
        float _886 = fma(_834, _800, _868);
        _870 = _886;
    }
    float _888 = _870;
    if (_752)
    {
        float _890 = fma(_836, _780, _874);
        _878 = _890;
    }
    float _892 = _878;
    if (_752)
    {
        float _894 = fma(_834, _824, _884);
        _880 = _894;
    }
    float _896 = _880;
    float _898 = _896;
    if (_752)
    {
        float _900 = fma(_836, _804, _888);
        _864 = _900;
    }
    float _902 = _864;
    if (_752)
    {
        float _904 = _782 + _892;
        _840 = _904;
    }
    float _906 = _840;
    float _908 = _906;
    if (_752)
    {
        float _910 = fma(_836, _828, _896);
        _898 = _910;
    }
    float _912 = _898;
    if (_752)
    {
        float _914 = _806 + _902;
        _846 = _914;
    }
    float _916 = _846;
    float _918 = _916;
    if (_752)
    {
        float _920 = _830 + _912;
        _854 = _920;
    }
    float _922 = _854;
    bool _924 = !_756;
    float _926 = _922;
    if (!_924)
    {
        float _928 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _930 = uint(int(uint(_168) >> uint(2)));
        float _932 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_930)]);
        int _934 = _168 + 4;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        float _938 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_936)]);
        int _940 = _168 + 8;
        uint _942 = uint(int(uint(_940) >> uint(2)));
        float _944 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_942)]);
        uint _946 = uint(int(uint(_168) >> uint(2)));
        float _948 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_946)]);
        int _950 = _168 + 4;
        uint _952 = uint(int(uint(_950) >> uint(2)));
        float _954 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_952)]);
        int _956 = _168 + 8;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        float _960 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_958)]);
        uint _962 = uint(int(uint(_168) >> uint(2)));
        float _964 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_962)]);
        int _966 = _168 + 4;
        uint _968 = uint(int(uint(_966) >> uint(2)));
        float _970 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_968)]);
        int _972 = _168 + 8;
        uint _974 = uint(int(uint(_972) >> uint(2)));
        float _976 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_974)]);
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _980 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _982 = _832 * _938;
        float _984 = _832 * _954;
        float _986 = _832 * _970;
        float _988 = fma(_834, _932, _982);
        float _990 = fma(_834, _948, _984);
        float _992 = fma(_834, _964, _986);
        float _994 = fma(_836, _944, _988);
        float _996 = fma(_836, _960, _990);
        float _998 = fma(_836, _976, _992);
        float _1000 = _928 + _994;
        float _1002 = _978 + _996;
        float _1004 = _980 + _998;
        _918 = _1002;
        _908 = _1000;
        _926 = _1004;
    }
    float _1006 = _918;
    float _1008 = _908;
    float _1010 = _926;
    bool _1012 = !_852;
    float _1014 = _1006;
    float _1016 = _1008;
    float _1018 = _1010;
    if (!_1012)
    {
        uint _1020 = uint(int(uint(_168) >> uint(2)));
        float _1022 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1020)]);
        int _1024 = _168 + 4;
        uint _1026 = uint(int(uint(_1024) >> uint(2)));
        float _1028 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1026)]);
        int _1030 = _168 + 8;
        uint _1032 = uint(int(uint(_1030) >> uint(2)));
        float _1034 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1032)]);
        int _1036 = _168 + 12;
        uint _1038 = uint(int(uint(_1036) >> uint(2)));
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1038)]);
        uint _1042 = uint(int(uint(_168) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1042)]);
        int _1046 = _168 + 4;
        uint _1048 = uint(int(uint(_1046) >> uint(2)));
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1048)]);
        int _1052 = _168 + 8;
        uint _1054 = uint(int(uint(_1052) >> uint(2)));
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1054)]);
        int _1058 = _168 + 12;
        uint _1060 = uint(int(uint(_1058) >> uint(2)));
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1060)]);
        uint _1064 = uint(int(uint(_168) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1064)]);
        int _1068 = _168 + 4;
        uint _1070 = uint(int(uint(_1068) >> uint(2)));
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1070)]);
        int _1074 = _168 + 8;
        uint _1076 = uint(int(uint(_1074) >> uint(2)));
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1076)]);
        int _1080 = _168 + 12;
        uint _1082 = uint(int(uint(_1080) >> uint(2)));
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1082)]);
        float _1086 = _832 * _1028;
        float _1088 = _832 * _1050;
        float _1090 = _832 * _1072;
        float _1092 = fma(_834, _1022, _1086);
        float _1094 = fma(_834, _1044, _1088);
        float _1096 = fma(_834, _1066, _1090);
        float _1098 = fma(_836, _1034, _1092);
        float _1100 = fma(_836, _1056, _1094);
        float _1102 = fma(_836, _1078, _1096);
        float _1104 = _1098 + _1040;
        float _1106 = _1100 + _1062;
        float _1108 = _1102 + _1084;
        _1014 = _1106;
        _1016 = _1104;
        _1018 = _1108;
    }
    float _1110 = _1014;
    float _1112 = _1016;
    float _1114 = _1018;
    float _1116 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1118 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1120 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1122 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1126 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1128 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1142 = _1116 + 1.0;
    float _1144 = _1142 + _1110;
    float _1146 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1148 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1150 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1152 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1154 = _1144 * _1128;
    float _1156 = fma(_1126, _1112, _1154);
    float _1158 = fma(_1130, _1114, _1156);
    float _1160 = _1132 + _1158;
    float _1162 = trunc(_1160);
    int _1164 = int(_1162);
    int _1166 = ~as_type<int>(_1134);
    int _1168 = _1164 + _1166;
    int _1170 = _1168 + 1;
    bool _1172 = _1170 >= 0;
    int _1174 = 0;
    if (_1172)
    {
        float _1176 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1174 = as_type<int>(_1176);
    }
    int _1178 = _1174;
    float _1180 = fma(_1112, 6.2500002968590706586837768554688e-05, 0.5);
    float _1182 = fma(_1114, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3611 = float2(_1180, _1182);
    float2 _1186 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_3611, float2(0.0), isnan(_3611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_3611, float2(0.0), isnan(_3611)), level(0.0)).xy;
    float _1188 = _1186.x;
    float _1190 = _1186.y;
    float _1192 = _1120 * _1110;
    float _1194 = fma(_1118, _1112, _1192);
    float _1196 = fma(_1122, _1114, _1194);
    float _1198 = _1124 + _1196;
    float _1200 = -_1198;
    bool _1202 = _1136 >= _1200;
    bool _1204 = isnan(_1136);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(_1200);
    bool _1210 = _1206 || _1208;
    float _1212 = -_1198;
    bool _1214 = _1138 >= _1212;
    bool _1216 = isnan(_1138);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(_1212);
    bool _1222 = _1218 || _1220;
    int _1224 = _1210 ? 0 : 1;
    int _1226 = 2;
    if (_1210)
    {
        _1226 = 1;
    }
    int _1228 = _1226;
    int _1230 = _1228;
    if (_1222)
    {
        _1230 = _1224;
    }
    int _1232 = _1230;
    int _1234 = _1232 << 6;
    int _1236 = _1234 + 96;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1238)]);
    int _1242 = _1236 + 4;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1244)]);
    int _1248 = _1236 + 8;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    float _1252 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1250)]);
    int _1254 = _1236 + 12;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    float _1258 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1256)]);
    int _1260 = _1234 + 48;
    int _1262 = _1234 + 64;
    uint _1264 = uint(int(uint(_1260) >> uint(2)));
    float _1266 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1264)]);
    int _1268 = _1260 + 4;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    float _1272 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1270)]);
    int _1274 = _1260 + 8;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    float _1278 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1276)]);
    int _1280 = _1260 + 12;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    float _1284 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1282)]);
    uint _1286 = uint(int(uint(_1262) >> uint(2)));
    float _1288 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1286)]);
    int _1290 = _1262 + 4;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    float _1294 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1292)]);
    int _1296 = _1262 + 8;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    float _1300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1298)]);
    int _1302 = _1262 + 12;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    float _1306 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1304)]);
    float _1308 = _1144 * _1148;
    float _1310 = fma(_1146, _1112, _1308);
    float _1312 = fma(_1150, _1114, _1310);
    float _1314 = _1152 + _1312;
    float _1316 = trunc(_1314);
    int _1318 = int(_1316);
    bool _1320 = _1178 <= _1170;
    bool _1322 = !_1172;
    bool _1324 = _1320 || _1322;
    int _1326 = ~as_type<int>(_1140);
    int _1328 = _1318 + _1326;
    int _1330 = _1328 + 1;
    bool _1332 = _1330 < 0;
    bool _1334 = _1332 || _1324;
    int _1336 = _1234 + 80;
    uint _1338 = uint(int(uint(_1336) >> uint(2)));
    float _1340 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1338)]);
    int _1342 = _1336 + 4;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    float _1346 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1344)]);
    int _1348 = _1336 + 8;
    uint _1350 = uint(int(uint(_1348) >> uint(2)));
    float _1352 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1350)]);
    int _1354 = _1336 + 12;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    float _1358 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1356)]);
    int _1360 = as_type<int>(_1140);
    float _1362 = as_type<float>(_1234);
    if (!_1334)
    {
        float _1364 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1360 = as_type<int>(_1364);
    }
    int _1366 = _1360;
    float _1368 = _1144 * _1246;
    float _1370 = fma(_1240, _1112, _1368);
    float _1372 = fma(_1252, _1114, _1370);
    float _1374 = _1258 + _1372;
    float _1376 = _1144 * _1272;
    float _1378 = 1.0 / _1374;
    float _1380 = fma(_1266, _1112, _1376);
    float _1382 = _1144 * _1294;
    float _1384 = fma(_1278, _1114, _1380);
    float _1386 = fma(_1288, _1112, _1382);
    float _1388 = _1284 + _1384;
    float _1390 = fma(_1300, _1114, _1386);
    float _1392 = _1388 * _1378;
    float _1394 = _1306 + _1390;
    bool _1396 = _1392 >= 0.0;
    float _1398 = _1394 * _1378;
    bool _1400 = _1392 <= 1.0;
    bool _1402 = _1400 && _1396;
    bool _1404 = _1398 >= 0.0;
    bool _1406 = _1404 && _1402;
    bool _1408 = _1398 <= 1.0;
    bool _1410 = _1408 && _1406;
    float _1412 = _1288;
    if (_1410)
    {
        float _1414 = float(_1232);
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = _1144 * _1346;
    bool _1420 = _1366 <= _1330;
    bool _1422 = _1420 || _1334;
    float _1424 = fma(_1340, _1112, _1418);
    float _1426 = fma(_1352, _1114, _1424);
    float _1428 = _1358 + _1426;
    float _1430 = _1340;
    float _1432 = _1424;
    if (_1422)
    {
        _1430 = 1.0;
    }
    float _1434 = _1430;
    float _1436 = _1434;
    if (!_1422)
    {
        float _1438 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1440 = _1330 * as_type<int>(_1438);
        int _1442 = _1440 + _1170;
        int _1444 = _1442 << 2;
        uint _1446 = uint(int(uint(_1442) >> uint(2)));
        int _1448 = 12 & _1444;
        int _1450 = int(_1446) << 4;
        int _1452 = _1450 + _1448;
        int _1454 = _1452 + 400;
        uint _1456 = uint(int(uint(_1454) >> uint(2)));
        float _1458 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1456)]);
        float _1460 = floor(_1160);
        float _1462 = floor(_1314);
        float _1464 = -_1460;
        float _1466 = _1160 + _1464;
        float _1468 = -_1462;
        float _1470 = _1314 + _1468;
        float _1472 = rint(_1458);
        float _1474 = precise::max(_1472, 0.0);
        uint _1476 = uint(_1474);
        uint _1478 = clamp(_1476, 0u, 65535u);
        float3 _4067 = float3(_1466, _1470, float(int(_1478)));
        float3 _4071 = select(_4067, float3(0.0), isnan(_4067));
        float _1480 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4071.xy, uint(rint(_4071.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4071.xy, uint(rint(_4071.z)), level(0.0)).x;
        int _1482 = _1442 << 4;
        int _1484 = _1482 + 2048;
        uint _1486 = uint(int(uint(_1484) >> uint(2)));
        float _1488 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1486)]);
        int _1490 = _1484 + 4;
        uint _1492 = uint(int(uint(_1490) >> uint(2)));
        float _1494 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1492)]);
        int _1496 = _1484 + 8;
        uint _1498 = uint(int(uint(_1496) >> uint(2)));
        float _1500 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1498)]);
        int _1502 = _1484 + 12;
        uint _1504 = uint(int(uint(_1502) >> uint(2)));
        float _1506 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1504)]);
        float _1508 = _1144 * _1494;
        float _1510 = fma(_1488, _1112, _1508);
        float _1512 = fma(_1500, _1114, _1510);
        float _1514 = _1506 + _1512;
        float _1516 = precise::clamp(_1514, 0.0, 1.0);
        float _1518 = -_1516;
        float _1520 = _1518 + _1480;
        float _1522 = fma(_1520, 500.0, 1.5);
        float _1524 = exp2(_1522);
        float _1526 = 0.0 + _1524;
        float _1528 = precise::clamp(_1526, 0.0, 1.0);
        _1362 = _1470;
        _1432 = _1458;
        _1436 = _1528;
    }
    float _1530 = _1362;
    float _1532 = _1432;
    float _1534 = _1436;
    float _1536 = _1416;
    float _1538 = _1532;
    float _1540 = _1530;
    if (_1410)
    {
        float _1542 = rint(_1416);
        float _1544 = precise::max(_1542, 0.0);
        uint _1546 = uint(_1544);
        uint _1548 = clamp(_1546, 0u, 65535u);
        _1536 = as_type<float>(_1548);
    }
    float _1550 = _1536;
    float _1552 = _1428 * _1378;
    bool _1554 = _1188 != 0.0;
    bool _1556 = isnan(_1188);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.0);
    bool _1562 = _1558 || _1560;
    uint _1564 = uint(int(uint(_168) >> uint(2)));
    float _1566 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1564)]);
    if (!_1410)
    {
        _1538 = 1.0;
    }
    float _1568 = _1538;
    float _1570 = _1398;
    float _1572 = _1568;
    if (_1410)
    {
        float3 _4208 = float3(_1392, _1398, float(as_type<int>(_1550)));
        float3 _4210 = select(_4208, float3(0.0), isnan(_4208));
        float _1574 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4210.xy, uint(rint(_4210.z)), _1552, level(0.0));
        _1570 = _1574;
    }
    float _1576 = _1570;
    if (!_1562)
    {
        _1540 = 4.0;
    }
    float _1578 = _1540;
    float _1580 = _1190;
    if (!_1562)
    {
        float2 _4229 = float2(_1180, _1182);
        float _1582 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4229, float2(0.0), isnan(_4229)), level(_1578)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4229, float2(0.0), isnan(_4229)), level(_1578)).y;
        _1580 = _1582;
    }
    float _1584 = _1580;
    bool _1586 = _316 > 0.001000000047497451305389404296875;
    bool _1588 = isnan(_316);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan(0.001000000047497451305389404296875);
    bool _1594 = _1590 || _1592;
    if (_1410)
    {
        bool _1596 = _1576 >= _1552;
        bool _1598 = isnan(_1576);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan(_1552);
        bool _1604 = _1600 || _1602;
        float _1606 = float(_1604);
        _1572 = _1606;
    }
    float _1608 = _1572;
    float _1610 = -_1608;
    float _1612 = fma(_1610, _1534, 1.0);
    float _1614 = -_1566;
    float _1616 = _1612 + _1614;
    float _1618 = _1612;
    if (_1594)
    {
        float _1620 = fma(_1616, 0.0500000007450580596923828125, _1566);
        _1618 = _1620;
    }
    float _1622 = _1618;
    float _1624 = precise::max(0.0, _1622);
    float _1626 = precise::min(_1624, 0.999000012874603271484375);
    uint _1628 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1628)] = as_type<uint>(_1626);
    int _1630 = as_type<int>(_1624);
    if (!_1594)
    {
        float _1632 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
        _1630 = as_type<int>(_1632);
    }
    int _1634 = _1630;
    int _1636 = _168 + 4;
    float _1638 = -_222;
    float _1640 = _1638 + _834;
    int _1642 = _168 + 8;
    float _1644 = -_228;
    float _1646 = _1644 + _832;
    float _1648 = -_234;
    float _1650 = _1648 + _836;
    float _1652 = _1646 * _1646;
    float _1654 = fma(_1640, _1640, _1652);
    float _1656 = fma(_1650, _1650, _1654);
    int _1658 = _1634;
    if (!_1594)
    {
        float _1660 = fma(_1584, 2000.0, as_type<float>(_1634));
        _1658 = as_type<int>(_1660);
    }
    int _1662 = _1658;
    if (!_1594)
    {
        uint _1664 = uint(int(uint(_1636) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1664)] = uint(_1662);
    }
    uint _1666 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1666)] = as_type<uint>(_274);
    uint _1668 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1668)] = as_type<uint>(_834);
    uint _1670 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1670)] = as_type<uint>(_832);
    uint _1672 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1672)] = as_type<uint>(_836);
    uint _1674 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1674)] = as_type<uint>(_364);
    uint _1676 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1676)] = as_type<uint>(_366);
    uint _1678 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1678)] = as_type<uint>(_368);
    uint _1680 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1680)] = as_type<uint>(_1640);
    uint _1682 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1682)] = as_type<uint>(_1646);
    uint _1684 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1684)] = as_type<uint>(_1650);
    float _1686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1688 = sqrt(_1656);
    float _1690 = _366 * _366;
    float _1692 = fma(_364, _364, _1690);
    float _1694 = fma(_368, _368, _1692);
    float _1696 = sqrt(_1694);
    bool _1698 = _1688 >= 9.9999999747524270787835121154785e-07;
    bool _1700 = isnan(_1688);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(9.9999999747524270787835121154785e-07);
    bool _1706 = _1702 || _1704;
    float _1708 = _1694;
    if (!_1706)
    {
        bool _1710 = _178 != _182;
        bool _1712 = isnan(_178);
        bool _1714 = _1710 || _1712;
        bool _1716 = isnan(_182);
        bool _1718 = _1714 || _1716;
        _1720 = _1718;
        if (!_1720)
        {
            float _1722 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1724 = _1722 > 0.0;
            bool _1726 = !_1724;
            if (!_1726)
            {
                float _1728 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1730 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1732 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1734 = _1730 * _1730;
                float _1736 = fma(_1728, _1728, _1734);
                float _1738 = fma(_1732, _1732, _1736);
                float _1740 = rsqrt(_1738);
                float _1742 = _1740 * 9.9999999747524270787835121154785e-07;
                float _1744 = _1728 * _1742;
                float _1746 = _1730 * _1742;
                float _1748 = _1732 * _1742;
                _408 = as_type<int>(_1744);
                _410 = as_type<int>(_1746);
                _412 = as_type<int>(_1748);
                _1720 = true;
            }
            else
            {
                bool _1750 = _1696 >= 9.9999999747524270787835121154785e-07;
                bool _1752 = isnan(_1696);
                bool _1754 = _1750 || _1752;
                bool _1756 = isnan(9.9999999747524270787835121154785e-07);
                bool _1758 = _1754 || _1756;
                if (!_1758)
                {
                    float _1760 = _832 * _832;
                    float _1762 = fma(_834, _834, _1760);
                    float _1764 = fma(_836, _836, _1762);
                    float _1766 = sqrt(_1764);
                    bool _1768 = _1766 >= 9.9999999747524270787835121154785e-07;
                    bool _1770 = isnan(_1766);
                    bool _1772 = _1768 || _1770;
                    bool _1774 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1776 = _1772 || _1774;
                    int _1778 = as_type<int>(_264);
                    int _1780 = as_type<int>(_1766);
                    if (_1776)
                    {
                        float _1782 = rsqrt(_1764);
                        _1778 = as_type<int>(_1782);
                    }
                    int _1784 = _1778;
                    if (!_1776)
                    {
                        _1780 = 0;
                    }
                    int _1786 = _1780;
                    int _1788 = _1786;
                    if (!_1776)
                    {
                        _400 = 897988541;
                    }
                    int _1790 = _400;
                    int _1792 = _1784;
                    int _1794 = _1790;
                    if (_1776)
                    {
                        float _1796 = as_type<float>(_1784) * 9.9999999747524270787835121154785e-07;
                        _1708 = _1796;
                    }
                    float _1798 = _1708;
                    if (!_1776)
                    {
                        _1792 = 0;
                    }
                    int _1800 = _1792;
                    int _1802 = _1800;
                    if (_1776)
                    {
                        float _1804 = _834 * _1798;
                        _1788 = as_type<int>(_1804);
                    }
                    int _1806 = _1788;
                    _408 = _1806;
                    if (_1776)
                    {
                        float _1808 = _832 * _1798;
                        _1794 = as_type<int>(_1808);
                    }
                    int _1810 = _1794;
                    _410 = _1810;
                    if (_1776)
                    {
                        float _1812 = _836 * _1798;
                        _1802 = as_type<int>(_1812);
                    }
                    int _1814 = _1802;
                    _412 = _1814;
                    _1720 = true;
                }
                else
                {
                    float _1816 = rsqrt(_1694);
                    float _1818 = _1816 * 9.9999999747524270787835121154785e-07;
                    float _1820 = _364 * _1818;
                    float _1822 = _366 * _1818;
                    float _1824 = _368 * _1818;
                    _408 = as_type<int>(_1820);
                    _410 = as_type<int>(_1822);
                    _412 = as_type<int>(_1824);
                    _1720 = true;
                }
            }
        }
    }
    else
    {
        float _1826 = _1696 * _1686;
        bool _1828 = _1826 >= 0.001000000047497451305389404296875;
        bool _1830 = isnan(_1826);
        bool _1832 = _1828 || _1830;
        bool _1834 = isnan(0.001000000047497451305389404296875);
        bool _1836 = _1832 || _1834;
        bool _1838 = _1826 > 0.0;
        bool _1840 = !_1836;
        bool _1842 = _1838 && _1840;
        bool _1844 = _1688 < 0.001000000047497451305389404296875;
        bool _1846 = _1844 && _1842;
        if (!_1846)
        {
            _402 = as_type<int>(_1640);
        }
        int _1848 = _402;
        int _1850 = _1848;
        if (_1846)
        {
            float _1852 = _364 * _1686;
            _1850 = as_type<int>(_1852);
        }
        int _1854 = _1850;
        _408 = _1854;
        if (!_1846)
        {
            _404 = as_type<int>(_1646);
        }
        int _1856 = _404;
        int _1858 = _1856;
        if (_1846)
        {
            float _1860 = _366 * _1686;
            _1858 = as_type<int>(_1860);
        }
        int _1862 = _1858;
        _410 = _1862;
        if (!_1846)
        {
            _406 = as_type<int>(_1650);
        }
        int _1864 = _406;
        _412 = _1864;
        if (_1846)
        {
            float _1866 = _368 * _1686;
            _412 = as_type<int>(_1866);
        }
    }
    _1720 = false;
    int _1868 = _408;
    int _1870 = _410;
    int _1872 = _412;
    uint _1874 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1874)] = uint(_1868);
    uint _1876 = uint(int(uint(_1636) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1876)] = uint(_1870);
    uint _1878 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1878)] = uint(_1872);
}

