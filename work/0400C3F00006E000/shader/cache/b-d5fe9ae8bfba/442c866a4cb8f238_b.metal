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
    texture2d<float> cp_t_tcb_2A [[id(14)]];
    sampler cp_t_tcb_2ASmplr [[id(15)]];
    texture2d_array<float> cp_t_tcb_16 [[id(16)]];
    sampler cp_t_tcb_16Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_14 [[id(18)]];
    sampler cp_t_tcb_14Smplr [[id(19)]];
    sampler cp_t_tcb_2ASmplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _1706 = false;
    bool _544 = false;
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
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _170 = _87 << 4;
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _174 = _170 + 12;
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _180 = uint(int(uint(_174) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_180)]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _186 = uint(int(uint(_170) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_186)]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _200 = uint(int(uint(_170) >> uint(2)));
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_200)]);
    int _204 = _170 + 4;
    uint _206 = uint(int(uint(_204) >> uint(2)));
    float _208 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_206)]);
    int _210 = _170 + 8;
    uint _212 = uint(int(uint(_210) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_212)]);
    uint _216 = uint(int(uint(_174) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_216)]);
    uint _220 = uint(int(uint(_170) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_220)]);
    int _224 = _170 + 4;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_226)]);
    int _230 = _170 + 8;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _170 + 12;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _250 = uint(int(uint(_170) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_250)]);
    int _254 = _170 + 4;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_256)]);
    int _260 = _170 + 8;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    int _266 = _170 + 12;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_268)]);
    uint _272 = uint(int(uint(_174) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_272)]);
    bool _276 = _166 > 0.0;
    float _278 = abs(_168);
    float _280 = log2(_278);
    bool _282 = _172 > 0.0;
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
    float _308 = _178;
    if (_276)
    {
        float _310 = 1.0 / _166;
        _284 = _310;
    }
    float _312 = _284;
    float _314 = _176 * _280;
    float _316 = -_182;
    float _318 = _178 + _316;
    float _320 = exp2(_314);
    float _322 = _184 * _172;
    float _324 = _312;
    float _326 = _322;
    float _328 = _314;
    if (_276)
    {
        float _330 = _318 * _312;
        _324 = _330;
    }
    float _332 = _324;
    if (_282)
    {
        float _334 = -_322;
        float _336 = fma(_188, _334, _184);
        _286 = _336;
    }
    float _338 = _286;
    int _340 = as_type<int>(_190) & 512;
    bool _342 = _340 != 0;
    float _344 = _338;
    bool _346 = _342;
    if (_276)
    {
        float _348 = precise::min(_332, 1.0);
        _326 = _348;
    }
    float _350 = _326;
    float _352 = _176 * _192;
    float _354 = _194 * _352;
    float _356 = _196 * _352;
    float _358 = _198 * _352;
    float _360 = _358;
    if (_276)
    {
        float _362 = _350 * _338;
        _344 = _362;
    }
    float _364 = _344;
    float _366 = fma(_202, _320, _354);
    float _368 = fma(_208, _320, _356);
    float _370 = fma(_214, _320, _358);
    float _372 = _176 * _364;
    float _374 = _218 * _176;
    float _376 = fma(_202, _374, _222);
    float _378 = fma(_208, _374, _228);
    float _380 = fma(_214, _374, _234);
    float _382 = _242 * _372;
    float _384 = _244 * _372;
    float _386 = _246 * _372;
    bool _388 = !_342;
    float _390 = _270;
    float _392 = _364;
    float _394 = _374;
    float _396 = _372;
    float _398 = _376;
    float _400 = _378;
    int _402 = as_type<int>(_274);
    int _404 = as_type<int>(_258);
    int _406 = as_type<int>(_252);
    int _408 = as_type<int>(_258);
    int _410 = as_type<int>(_264);
    int _412 = as_type<int>(_252);
    int _414 = as_type<int>(_258);
    int _416 = as_type<int>(_264);
    float _538;
    float _540;
    float _542;
    if (!_388)
    {
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _436 = _422 * _424;
        float _438 = _422 * _426;
        float _440 = _420 * _424;
        float _442 = -_436;
        float _444 = fma(_418, _428, _442);
        float _446 = -_438;
        float _448 = fma(_420, _428, _446);
        float _450 = -_440;
        float _452 = fma(_418, _426, _450);
        float _454 = _432 * _418;
        float _456 = _432 * _444;
        float _458 = _434 * _420;
        float _460 = _430 * _426;
        float _462 = -_454;
        float _464 = fma(_430, _420, _462);
        float _466 = -_456;
        float _468 = fma(_430, _448, _466);
        float _470 = _432 * _428;
        float _472 = _434 * _424;
        float _474 = -_460;
        float _476 = fma(_432, _424, _474);
        float _478 = fma(_434, _452, _468);
        float _480 = -_470;
        float _482 = fma(_434, _426, _480);
        float _484 = -_472;
        float _486 = fma(_430, _428, _484);
        float _488 = _430 * _422;
        float _490 = 1.0 / _478;
        float _492 = -_418;
        float _494 = fma(_492, _428, _436);
        float _496 = -_458;
        float _498 = fma(_432, _422, _496);
        float _500 = -_488;
        float _502 = fma(_434, _418, _500);
        float _504 = _482 * _490;
        float _506 = _486 * _490;
        float _508 = _476 * _490;
        float _510 = _494 * _490;
        float _512 = _384 * _504;
        float _514 = _382 * _490;
        float _516 = _384 * _506;
        float _518 = _384 * _508;
        float _520 = _498 * _490;
        float _522 = fma(_448, _514, _512);
        float _524 = _502 * _490;
        float _526 = _464 * _490;
        float _528 = fma(_382, _510, _516);
        float _530 = fma(_452, _514, _518);
        float _532 = fma(_386, _520, _522);
        float _534 = fma(_386, _524, _528);
        float _536 = fma(_386, _526, _530);
        _392 = _424;
        _394 = _426;
        _292 = _428;
        _294 = _452;
        _296 = _512;
        _298 = _514;
        _300 = _528;
        _302 = _478;
        _328 = _430;
        _396 = _432;
        _304 = _434;
        _360 = _506;
        _538 = _534;
        _540 = _532;
        _542 = _536;
        _306 = _524;
        _544 = true;
    }
    else
    {
        int _546 = as_type<int>(_190) & 1024;
        bool _548 = _546 != 0;
        if (_548)
        {
            _346 = true;
        }
        bool _550 = _346;
        bool _552 = _550;
        if (!_548)
        {
            int _554 = as_type<int>(_190) & 2048;
            bool _556 = _554 != 0;
            _552 = _556;
        }
        bool _558 = _552;
        if (!_558)
        {
            _390 = _382;
        }
        float _560 = _390;
        _540 = _560;
        if (!_558)
        {
            _288 = _384;
        }
        float _562 = _288;
        _538 = _562;
        if (!_558)
        {
            _290 = _386;
        }
        float _564 = _290;
        bool _566 = !_558;
        _542 = _564;
        if (!_566)
        {
            uint _568 = uint(int(uint(_170) >> uint(2)));
            float _570 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_568)]);
            int _572 = _170 + 4;
            uint _574 = uint(int(uint(_572) >> uint(2)));
            float _576 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_574)]);
            int _578 = _170 + 8;
            uint _580 = uint(int(uint(_578) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_580)]);
            uint _584 = uint(int(uint(_170) >> uint(2)));
            float _586 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_584)]);
            int _588 = _170 + 4;
            uint _590 = uint(int(uint(_588) >> uint(2)));
            float _592 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_590)]);
            int _594 = _170 + 8;
            uint _596 = uint(int(uint(_594) >> uint(2)));
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_596)]);
            uint _600 = uint(int(uint(_170) >> uint(2)));
            float _602 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_600)]);
            int _604 = _170 + 4;
            uint _606 = uint(int(uint(_604) >> uint(2)));
            float _608 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_606)]);
            int _610 = _170 + 8;
            uint _612 = uint(int(uint(_610) >> uint(2)));
            float _614 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_612)]);
            float _616 = _582 * _586;
            float _618 = _582 * _592;
            float _620 = _576 * _586;
            float _622 = -_616;
            float _624 = fma(_570, _598, _622);
            float _626 = -_618;
            float _628 = fma(_576, _598, _626);
            float _630 = -_620;
            float _632 = fma(_570, _592, _630);
            float _634 = _608 * _570;
            float _636 = _608 * _624;
            float _638 = _614 * _576;
            float _640 = _602 * _592;
            float _642 = -_634;
            float _644 = fma(_602, _576, _642);
            float _646 = -_636;
            float _648 = fma(_602, _628, _646);
            float _650 = _608 * _598;
            float _652 = _614 * _586;
            float _654 = -_640;
            float _656 = fma(_608, _586, _654);
            float _658 = fma(_614, _632, _648);
            float _660 = -_650;
            float _662 = fma(_614, _592, _660);
            float _664 = -_652;
            float _666 = fma(_602, _598, _664);
            float _668 = _602 * _582;
            float _670 = 1.0 / _658;
            float _672 = -_570;
            float _674 = fma(_672, _598, _616);
            float _676 = -_638;
            float _678 = fma(_608, _582, _676);
            float _680 = -_668;
            float _682 = fma(_614, _570, _680);
            float _684 = _662 * _670;
            float _686 = _666 * _670;
            float _688 = _656 * _670;
            float _690 = _674 * _670;
            float _692 = _384 * _684;
            float _694 = _382 * _670;
            float _696 = _384 * _686;
            float _698 = _384 * _688;
            float _700 = _678 * _670;
            float _702 = fma(_628, _694, _692);
            float _704 = _682 * _670;
            float _706 = _644 * _670;
            float _708 = fma(_382, _690, _696);
            float _710 = fma(_632, _694, _698);
            float _712 = fma(_386, _700, _702);
            float _714 = fma(_386, _704, _708);
            float _716 = fma(_386, _706, _710);
            _392 = _586;
            _394 = _592;
            _292 = _598;
            _294 = _632;
            _296 = _692;
            _298 = _694;
            _300 = _708;
            _302 = _658;
            _328 = _602;
            _396 = _608;
            _304 = _614;
            _360 = _686;
            _538 = _714;
            _540 = _712;
            _542 = _716;
            _306 = _704;
        }
    }
    _544 = false;
    float _718 = _392;
    float _720 = _394;
    float _722 = _292;
    float _724 = _294;
    float _726 = _296;
    float _728 = _298;
    float _730 = _300;
    float _732 = _302;
    float _734 = _328;
    float _736 = _396;
    float _738 = _304;
    float _740 = _360;
    float _742 = _538;
    float _744 = _540;
    float _746 = _542;
    float _748 = _306;
    uint _750 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_750)] = as_type<uint>(_274);
    float _752 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _754 = as_type<int>(_752) & 512;
    bool _756 = _754 != 0;
    int _758 = as_type<int>(_752) & 1024;
    bool _760 = _758 != 0;
    float _762 = _718;
    float _764 = _720;
    float _766 = _722;
    float _768 = _724;
    float _770 = _748;
    if (_756)
    {
        float _772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _762 = _772;
        _764 = _774;
        _766 = _776;
        _768 = _778;
    }
    float _780 = _762;
    float _782 = _764;
    float _784 = _766;
    float _786 = _768;
    float _788 = _726;
    float _790 = _728;
    float _792 = _730;
    float _794 = _732;
    if (_756)
    {
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _788 = _796;
        _790 = _798;
        _792 = _800;
        _794 = _802;
    }
    float _804 = _788;
    float _806 = _790;
    float _808 = _792;
    float _810 = _794;
    float _812 = _734;
    float _814 = _736;
    float _816 = _738;
    float _818 = _740;
    if (_756)
    {
        float _820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _812 = _820;
        _814 = _822;
        _816 = _824;
        _818 = _826;
    }
    float _828 = _812;
    float _830 = _814;
    float _832 = _816;
    float _834 = _818;
    float _836 = _378 + _742;
    float _838 = _376 + _744;
    float _840 = _380 + _746;
    if (!_756)
    {
        _770 = 0.0;
    }
    float _842 = _770;
    int _844 = as_type<int>(_752) & 2048;
    bool _846 = _844 != 0;
    float _848 = _784;
    float _850 = _842;
    if (_756)
    {
        float _852 = _836 * _782;
        _398 = _852;
    }
    float _854 = _398;
    float _856 = _806;
    float _858 = _854;
    float _860 = _808;
    if (_756)
    {
        float _862 = _836 * _806;
        _856 = _862;
    }
    float _864 = _856;
    float _866 = _864;
    if (_756)
    {
        float _868 = fma(_838, _780, _854);
        _858 = _868;
    }
    float _870 = _858;
    float _872 = _830;
    float _874 = _828;
    float _876 = _870;
    if (_756)
    {
        float _878 = _836 * _830;
        _872 = _878;
    }
    float _880 = _872;
    if (_756)
    {
        float _882 = fma(_838, _804, _864);
        _866 = _882;
    }
    float _884 = _866;
    if (_756)
    {
        float _886 = fma(_840, _784, _870);
        _848 = _886;
    }
    float _888 = _848;
    if (_756)
    {
        float _890 = fma(_838, _828, _880);
        _874 = _890;
    }
    float _892 = _874;
    float _894 = _892;
    if (_756)
    {
        float _896 = fma(_840, _808, _884);
        _860 = _896;
    }
    float _898 = _860;
    if (!_756)
    {
        _400 = 0.0;
        _876 = 0.0;
    }
    float _900 = _400;
    float _902 = _876;
    float _904 = _900;
    float _906 = _902;
    if (_756)
    {
        float _908 = fma(_840, _832, _892);
        _894 = _908;
    }
    float _910 = _894;
    if (_756)
    {
        float _912 = _786 + _888;
        _904 = _912;
    }
    float _914 = _904;
    float _916 = _914;
    if (_756)
    {
        float _918 = _810 + _898;
        _906 = _918;
    }
    float _920 = _906;
    float _922 = _920;
    if (_756)
    {
        float _924 = _834 + _910;
        _850 = _924;
    }
    float _926 = _850;
    bool _928 = !_760;
    float _930 = _926;
    if (!_928)
    {
        float _932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _934 = uint(int(uint(_170) >> uint(2)));
        float _936 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_934)]);
        int _938 = _170 + 4;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        float _942 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_940)]);
        int _944 = _170 + 8;
        uint _946 = uint(int(uint(_944) >> uint(2)));
        float _948 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_946)]);
        uint _950 = uint(int(uint(_170) >> uint(2)));
        float _952 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_950)]);
        int _954 = _170 + 4;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        float _958 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_956)]);
        int _960 = _170 + 8;
        uint _962 = uint(int(uint(_960) >> uint(2)));
        float _964 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_962)]);
        uint _966 = uint(int(uint(_170) >> uint(2)));
        float _968 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_966)]);
        int _970 = _170 + 4;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        float _974 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_972)]);
        int _976 = _170 + 8;
        uint _978 = uint(int(uint(_976) >> uint(2)));
        float _980 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_978)]);
        float _982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _986 = _836 * _942;
        float _988 = _836 * _958;
        float _990 = _836 * _974;
        float _992 = fma(_838, _936, _986);
        float _994 = fma(_838, _952, _988);
        float _996 = fma(_838, _968, _990);
        float _998 = fma(_840, _948, _992);
        float _1000 = fma(_840, _964, _994);
        float _1002 = fma(_840, _980, _996);
        float _1004 = _932 + _998;
        float _1006 = _982 + _1000;
        float _1008 = _984 + _1002;
        _922 = _1006;
        _916 = _1004;
        _930 = _1008;
    }
    float _1010 = _922;
    float _1012 = _916;
    float _1014 = _930;
    bool _1016 = !_846;
    float _1018 = _1010;
    float _1020 = _1012;
    float _1022 = _1014;
    if (!_1016)
    {
        uint _1024 = uint(int(uint(_170) >> uint(2)));
        float _1026 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1024)]);
        int _1028 = _170 + 4;
        uint _1030 = uint(int(uint(_1028) >> uint(2)));
        float _1032 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1030)]);
        int _1034 = _170 + 8;
        uint _1036 = uint(int(uint(_1034) >> uint(2)));
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1036)]);
        int _1040 = _170 + 12;
        uint _1042 = uint(int(uint(_1040) >> uint(2)));
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1042)]);
        uint _1046 = uint(int(uint(_170) >> uint(2)));
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1046)]);
        int _1050 = _170 + 4;
        uint _1052 = uint(int(uint(_1050) >> uint(2)));
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1052)]);
        int _1056 = _170 + 8;
        uint _1058 = uint(int(uint(_1056) >> uint(2)));
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1058)]);
        int _1062 = _170 + 12;
        uint _1064 = uint(int(uint(_1062) >> uint(2)));
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1064)]);
        uint _1068 = uint(int(uint(_170) >> uint(2)));
        float _1070 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1068)]);
        int _1072 = _170 + 4;
        uint _1074 = uint(int(uint(_1072) >> uint(2)));
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1074)]);
        int _1078 = _170 + 8;
        uint _1080 = uint(int(uint(_1078) >> uint(2)));
        float _1082 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1080)]);
        int _1084 = _170 + 12;
        uint _1086 = uint(int(uint(_1084) >> uint(2)));
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1086)]);
        float _1090 = _836 * _1032;
        float _1092 = _836 * _1054;
        float _1094 = _836 * _1076;
        float _1096 = fma(_838, _1026, _1090);
        float _1098 = fma(_838, _1048, _1092);
        float _1100 = fma(_838, _1070, _1094);
        float _1102 = fma(_840, _1038, _1096);
        float _1104 = fma(_840, _1060, _1098);
        float _1106 = fma(_840, _1082, _1100);
        float _1108 = _1102 + _1044;
        float _1110 = _1104 + _1066;
        float _1112 = _1106 + _1088;
        _1018 = _1110;
        _1020 = _1108;
        _1022 = _1112;
    }
    float _1114 = _1018;
    float _1116 = _1020;
    float _1118 = _1022;
    float _1120 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1122 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1126 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1128 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1144 = _1122 * _1114;
    float _1146 = fma(_1120, _1116, _1144);
    float _1148 = fma(_1124, _1118, _1146);
    float _1150 = _1126 + _1148;
    float _1152 = -_1150;
    bool _1154 = _1128 >= _1152;
    bool _1156 = isnan(_1128);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(_1152);
    bool _1162 = _1158 || _1160;
    float _1164 = -_1150;
    bool _1166 = _1130 >= _1164;
    bool _1168 = isnan(_1130);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(_1164);
    bool _1174 = _1170 || _1172;
    int _1176 = _1162 ? 0 : 1;
    int _1178 = 2;
    if (_1162)
    {
        _1178 = 1;
    }
    int _1180 = _1178;
    int _1182 = _1180;
    if (_1174)
    {
        _1182 = _1176;
    }
    int _1184 = _1182;
    int _1186 = _1184 << 6;
    int _1188 = _1186 + 96;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    float _1192 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1190)]);
    int _1194 = _1188 + 4;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    float _1198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1196)]);
    int _1200 = _1188 + 8;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    float _1204 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1202)]);
    int _1206 = _1188 + 12;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    float _1210 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1208)]);
    int _1212 = _1186 + 48;
    int _1214 = _1186 + 64;
    uint _1216 = uint(int(uint(_1212) >> uint(2)));
    float _1218 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1216)]);
    int _1220 = _1212 + 4;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    float _1224 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1222)]);
    int _1226 = _1212 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    float _1230 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1228)]);
    int _1232 = _1212 + 12;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    float _1236 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1234)]);
    uint _1238 = uint(int(uint(_1214) >> uint(2)));
    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1238)]);
    int _1242 = _1214 + 4;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1244)]);
    int _1248 = _1214 + 8;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    float _1252 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1250)]);
    int _1254 = _1214 + 12;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    float _1258 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1256)]);
    int _1260 = _1186 + 80;
    float _1262 = _1132 + 1.0;
    float _1264 = _1262 + _1114;
    uint _1266 = uint(int(uint(_1260) >> uint(2)));
    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1266)]);
    int _1270 = _1260 + 4;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    float _1274 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1272)]);
    int _1276 = _1260 + 8;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1278)]);
    int _1282 = _1260 + 12;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    float _1286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1284)]);
    float _1288 = _1264 * _1136;
    float _1290 = fma(_1134, _1116, _1288);
    float _1292 = fma(_1138, _1118, _1290);
    float _1294 = _1140 + _1292;
    float _1296 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1302 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1304 = trunc(_1294);
    int _1306 = int(_1304);
    int _1308 = ~as_type<int>(_1142);
    int _1310 = _1306 + _1308;
    int _1312 = _1310 + 1;
    float _1314 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1316 = _1312 >= 0;
    int _1318 = _1306;
    float _1320 = as_type<float>(_1184);
    if (_1316)
    {
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1318 = as_type<int>(_1322);
    }
    int _1324 = _1318;
    bool _1326 = _318 > 0.001000000047497451305389404296875;
    bool _1328 = isnan(_318);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.001000000047497451305389404296875);
    bool _1334 = _1330 || _1332;
    float _1336 = _1264 * _1198;
    float _1338 = fma(_1192, _1116, _1336);
    float _1340 = fma(_1204, _1118, _1338);
    float _1342 = _1210 + _1340;
    float _1344 = _1264 * _1224;
    float _1346 = 1.0 / _1342;
    float _1348 = fma(_1218, _1116, _1344);
    float _1350 = _1264 * _1246;
    float _1352 = fma(_1230, _1118, _1348);
    float _1354 = fma(_1240, _1116, _1350);
    float _1356 = _1236 + _1352;
    float _1358 = fma(_1252, _1118, _1354);
    float _1360 = _1356 * _1346;
    float _1362 = _1258 + _1358;
    bool _1364 = _1360 >= 0.0;
    float _1366 = _1362 * _1346;
    bool _1368 = _1360 <= 1.0;
    bool _1370 = _1368 && _1364;
    bool _1372 = _1366 >= 0.0;
    bool _1374 = _1372 && _1370;
    bool _1376 = _1366 <= 1.0;
    bool _1378 = _1376 && _1374;
    float _1380 = _1264 * _1274;
    float _1382 = fma(_1268, _1116, _1380);
    bool _1384 = _1378;
    if (_1378)
    {
        float _1386 = float(_1184);
        _1320 = _1386;
    }
    float _1388 = _1320;
    float _1390 = fma(_1280, _1118, _1382);
    float _1392 = _1388;
    if (_1378)
    {
        float _1394 = rint(_1388);
        float _1396 = precise::max(_1394, 0.0);
        uint _1398 = uint(_1396);
        uint _1400 = clamp(_1398, 0u, 65535u);
        _1392 = as_type<float>(_1400);
    }
    float _1402 = _1392;
    float _1404 = _1286 + _1390;
    float _1406 = fma(_1116, 6.2500002968590706586837768554688e-05, 0.5);
    float _1408 = fma(_1118, 6.2500002968590706586837768554688e-05, 0.5);
    float _1410 = _1404 * _1346;
    float _1412 = _1406;
    if (!_1334)
    {
        float2 _3948 = float2(_1406, _1408);
        float _1414 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3948, float2(0.0), isnan(_3948)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3948, float2(0.0), isnan(_3948)), level(0.0)).x;
        _1412 = _1414;
    }
    float _1416 = _1412;
    float _1418 = _1366;
    if (_1378)
    {
        float3 _3968 = float3(_1360, _1366, float(as_type<int>(_1402)));
        float3 _3972 = select(_3968, float3(0.0), isnan(_3968));
        float _1420 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _3972.xy, uint(rint(_3972.z)), _1410, level(0.0));
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = _1264 * _1298;
    float _1426 = fma(_1296, _1116, _1424);
    float _1428 = fma(_1300, _1118, _1426);
    float _1430 = _1302 + _1428;
    float _1432 = trunc(_1430);
    int _1434 = int(_1432);
    bool _1436 = _1324 <= _1312;
    bool _1438 = !_1316;
    bool _1440 = _1436 || _1438;
    int _1442 = ~as_type<int>(_1314);
    int _1444 = _1434 + _1442;
    int _1446 = _1444 + 1;
    bool _1448 = _1446 < 0;
    bool _1450 = _1448 || _1440;
    float _1452 = _1426;
    float _1454 = as_type<float>(_1434);
    if (!_1450)
    {
        float _1456 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1452 = _1456;
    }
    float _1458 = _1452;
    bool _1460 = as_type<int>(_1458) <= _1446;
    bool _1462 = _1460 || _1450;
    float _1464 = _1458;
    if (_1462)
    {
        _1454 = 1.0;
    }
    float _1466 = _1454;
    float _1468 = _1466;
    float _1470 = _1416;
    if (!_1462)
    {
        float _1472 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1474 = _1446 * as_type<int>(_1472);
        int _1476 = _1474 + _1312;
        int _1478 = _1476 << 2;
        uint _1480 = uint(int(uint(_1476) >> uint(2)));
        int _1482 = 12 & _1478;
        int _1484 = int(_1480) << 4;
        int _1486 = _1484 + _1482;
        int _1488 = _1486 + 400;
        uint _1490 = uint(int(uint(_1488) >> uint(2)));
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1490)]);
        float _1494 = floor(_1430);
        float _1496 = floor(_1294);
        float _1498 = -_1494;
        float _1500 = _1430 + _1498;
        float _1502 = -_1496;
        float _1504 = _1294 + _1502;
        float _1506 = rint(_1492);
        float _1508 = precise::max(_1506, 0.0);
        uint _1510 = uint(_1508);
        uint _1512 = clamp(_1510, 0u, 65535u);
        float3 _4108 = float3(_1504, _1500, float(int(_1512)));
        float3 _4110 = select(_4108, float3(0.0), isnan(_4108));
        float _1514 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4110.xy, uint(rint(_4110.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4110.xy, uint(rint(_4110.z)), level(0.0)).x;
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
        float _1542 = _1264 * _1528;
        float _1544 = fma(_1522, _1116, _1542);
        float _1546 = fma(_1534, _1118, _1544);
        float _1548 = _1540 + _1546;
        float _1550 = precise::clamp(_1548, 0.0, 1.0);
        float _1552 = -_1550;
        float _1554 = _1552 + _1514;
        float _1556 = fma(_1554, 500.0, 1.5);
        float _1558 = exp2(_1556);
        float _1560 = 0.0 + _1558;
        float _1562 = precise::clamp(_1560, 0.0, 1.0);
        _1464 = _1492;
        _1468 = _1562;
    }
    float _1564 = _1464;
    float _1566 = _1468;
    uint _1568 = uint(int(uint(_170) >> uint(2)));
    float _1570 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1568)]);
    float _1572 = _1564;
    if (!_1378)
    {
        _1572 = 1.0;
    }
    float _1574 = _1572;
    float _1576 = _1574;
    if (!_1334)
    {
        float _1578 = _1416 * 2000.0;
        _1470 = _1578;
    }
    float _1580 = _1470;
    if (_1378)
    {
        bool _1582 = _1422 >= _1410;
        bool _1584 = isnan(_1422);
        bool _1586 = _1582 || _1584;
        bool _1588 = isnan(_1410);
        bool _1590 = _1586 || _1588;
        float _1592 = float(_1590);
        _1576 = _1592;
    }
    float _1594 = _1576;
    float _1596 = -_234;
    float _1598 = _1596 + _840;
    if (!_1334)
    {
        bool _1600 = _1114 >= _1580;
        bool _1602 = isnan(_1114);
        bool _1604 = _1600 || _1602;
        bool _1606 = isnan(_1580);
        bool _1608 = _1604 || _1606;
        _1384 = _1608;
    }
    bool _1610 = _1384;
    float _1612 = -_1594;
    float _1614 = fma(_1612, _1566, 1.0);
    float _1616 = -_228;
    float _1618 = _1616 + _836;
    int _1620 = _170 + 4;
    float _1622 = _1614;
    if (!_1334)
    {
        int _1624 = _1610 ? as_type<int>(_274) : 0;
        _402 = _1624;
    }
    int _1626 = _402;
    float _1628 = _1618 * _1618;
    float _1630 = -_1570;
    float _1632 = _1614 + _1630;
    if (_1334)
    {
        float _1634 = fma(_1632, 0.0500000007450580596923828125, _1570);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = -_222;
    float _1640 = _1638 + _838;
    int _1642 = _170 + 8;
    float _1644 = precise::max(0.0, _1636);
    float _1646 = precise::min(_1644, 0.999000012874603271484375);
    uint _1648 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1648)] = as_type<uint>(_1646);
    uint _1650 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1650)] = uint(_1626);
    uint _1652 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1652)] = as_type<uint>(_838);
    uint _1654 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1654)] = as_type<uint>(_836);
    uint _1656 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1656)] = as_type<uint>(_840);
    uint _1658 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1658)] = as_type<uint>(_366);
    uint _1660 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1660)] = as_type<uint>(_368);
    uint _1662 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1662)] = as_type<uint>(_370);
    uint _1664 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1664)] = as_type<uint>(_1640);
    uint _1666 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1666)] = as_type<uint>(_1618);
    uint _1668 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1668)] = as_type<uint>(_1598);
    float _1670 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1672 = fma(_1640, _1640, _1628);
    float _1674 = _368 * _368;
    float _1676 = fma(_1598, _1598, _1672);
    float _1678 = fma(_366, _366, _1674);
    float _1680 = fma(_370, _370, _1678);
    float _1682 = sqrt(_1676);
    float _1684 = sqrt(_1680);
    bool _1686 = _1682 >= 9.9999999747524270787835121154785e-07;
    bool _1688 = isnan(_1682);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan(9.9999999747524270787835121154785e-07);
    bool _1694 = _1690 || _1692;
    if (!_1694)
    {
        bool _1696 = _178 != _182;
        bool _1698 = isnan(_178);
        bool _1700 = _1696 || _1698;
        bool _1702 = isnan(_182);
        bool _1704 = _1700 || _1702;
        _1706 = _1704;
        if (!_1706)
        {
            float _1708 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _1710 = _1708 > 0.0;
            bool _1712 = !_1710;
            if (!_1712)
            {
                float _1714 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _1716 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _1718 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _1720 = _1716 * _1716;
                float _1722 = fma(_1714, _1714, _1720);
                float _1724 = fma(_1718, _1718, _1722);
                float _1726 = rsqrt(_1724);
                float _1728 = _1726 * 9.9999999747524270787835121154785e-07;
                float _1730 = _1714 * _1728;
                float _1732 = _1716 * _1728;
                float _1734 = _1718 * _1728;
                _412 = as_type<int>(_1730);
                _414 = as_type<int>(_1732);
                _416 = as_type<int>(_1734);
                _1706 = true;
            }
            else
            {
                bool _1736 = _1684 >= 9.9999999747524270787835121154785e-07;
                bool _1738 = isnan(_1684);
                bool _1740 = _1736 || _1738;
                bool _1742 = isnan(9.9999999747524270787835121154785e-07);
                bool _1744 = _1740 || _1742;
                if (!_1744)
                {
                    float _1746 = _836 * _836;
                    float _1748 = fma(_838, _838, _1746);
                    float _1750 = fma(_840, _840, _1748);
                    float _1752 = sqrt(_1750);
                    bool _1754 = _1752 >= 9.9999999747524270787835121154785e-07;
                    bool _1756 = isnan(_1752);
                    bool _1758 = _1754 || _1756;
                    bool _1760 = isnan(9.9999999747524270787835121154785e-07);
                    bool _1762 = _1758 || _1760;
                    int _1764 = as_type<int>(_264);
                    int _1766 = as_type<int>(_1752);
                    if (_1762)
                    {
                        float _1768 = rsqrt(_1750);
                        _1764 = as_type<int>(_1768);
                    }
                    int _1770 = _1764;
                    if (!_1762)
                    {
                        _1766 = 0;
                    }
                    int _1772 = _1766;
                    int _1774 = _1772;
                    if (!_1762)
                    {
                        _404 = 897988541;
                    }
                    int _1776 = _404;
                    int _1778 = _1770;
                    int _1780 = _1776;
                    if (_1762)
                    {
                        float _1782 = as_type<float>(_1770) * 9.9999999747524270787835121154785e-07;
                        _308 = _1782;
                    }
                    float _1784 = _308;
                    if (!_1762)
                    {
                        _1778 = 0;
                    }
                    int _1786 = _1778;
                    int _1788 = _1786;
                    if (_1762)
                    {
                        float _1790 = _838 * _1784;
                        _1774 = as_type<int>(_1790);
                    }
                    int _1792 = _1774;
                    _412 = _1792;
                    if (_1762)
                    {
                        float _1794 = _836 * _1784;
                        _1780 = as_type<int>(_1794);
                    }
                    int _1796 = _1780;
                    _414 = _1796;
                    if (_1762)
                    {
                        float _1798 = _840 * _1784;
                        _1788 = as_type<int>(_1798);
                    }
                    int _1800 = _1788;
                    _416 = _1800;
                    _1706 = true;
                }
                else
                {
                    float _1802 = rsqrt(_1680);
                    float _1804 = _1802 * 9.9999999747524270787835121154785e-07;
                    float _1806 = _366 * _1804;
                    float _1808 = _368 * _1804;
                    float _1810 = _370 * _1804;
                    _412 = as_type<int>(_1806);
                    _414 = as_type<int>(_1808);
                    _416 = as_type<int>(_1810);
                    _1706 = true;
                }
            }
        }
    }
    else
    {
        float _1812 = _1684 * _1670;
        bool _1814 = _1812 >= 0.001000000047497451305389404296875;
        bool _1816 = isnan(_1812);
        bool _1818 = _1814 || _1816;
        bool _1820 = isnan(0.001000000047497451305389404296875);
        bool _1822 = _1818 || _1820;
        bool _1824 = _1812 > 0.0;
        bool _1826 = !_1822;
        bool _1828 = _1824 && _1826;
        bool _1830 = _1682 < 0.001000000047497451305389404296875;
        bool _1832 = _1830 && _1828;
        if (!_1832)
        {
            _406 = as_type<int>(_1640);
        }
        int _1834 = _406;
        int _1836 = _1834;
        if (_1832)
        {
            float _1838 = _366 * _1670;
            _1836 = as_type<int>(_1838);
        }
        int _1840 = _1836;
        _412 = _1840;
        if (!_1832)
        {
            _408 = as_type<int>(_1618);
        }
        int _1842 = _408;
        int _1844 = _1842;
        if (_1832)
        {
            float _1846 = _368 * _1670;
            _1844 = as_type<int>(_1846);
        }
        int _1848 = _1844;
        _414 = _1848;
        if (!_1832)
        {
            _410 = as_type<int>(_1598);
        }
        int _1850 = _410;
        _416 = _1850;
        if (_1832)
        {
            float _1852 = _370 * _1670;
            _416 = as_type<int>(_1852);
        }
    }
    _1706 = false;
    int _1854 = _412;
    int _1856 = _414;
    int _1858 = _416;
    uint _1860 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1860)] = uint(_1854);
    uint _1862 = uint(int(uint(_1620) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1862)] = uint(_1856);
    uint _1864 = uint(int(uint(_1642) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1864)] = uint(_1858);
}

