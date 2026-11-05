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
    texture2d_array<float> cp_t_tcb_14 [[id(16)]];
    sampler cp_t_tcb_14Smplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_16 [[id(18)]];
    sampler cp_t_tcb_16Smplr [[id(19)]];
    sampler cp_t_tcb_2ASmplr_w [[id(20)]];
    sampler cp_t_tcb_14Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2022 = false;
    bool _536 = false;
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
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _244 = uint(int(uint(_168) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_244)]);
    int _248 = _168 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_250)]);
    int _254 = _168 + 8;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_256)]);
    int _260 = _168 + 12;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_262)]);
    uint _266 = uint(int(uint(_172) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_266)]);
    bool _270 = _166 > 0.0;
    float _272 = abs(_170);
    float _274 = log2(_272);
    bool _276 = _174 > 0.0;
    float _278 = 0.0;
    float _280 = _184;
    float _282 = _192;
    float _284 = _198;
    float _286 = _194;
    float _288 = _236;
    float _290 = _238;
    float _292 = _240;
    float _294 = _242;
    float _296 = _202;
    float _298 = _208;
    float _300 = _214;
    float _302 = _190;
    int _304 = as_type<int>(_222);
    if (_270)
    {
        float _306 = 1.0 / _166;
        _278 = _306;
    }
    float _308 = _278;
    float _310 = _176 * _274;
    float _312 = -_182;
    float _314 = _178 + _312;
    float _316 = _184 * _174;
    float _318 = exp2(_310);
    float _320 = _308;
    if (_270)
    {
        float _322 = _314 * _308;
        _320 = _322;
    }
    float _324 = _320;
    if (_276)
    {
        float _326 = -_316;
        float _328 = fma(_188, _326, _184);
        _280 = _328;
    }
    float _330 = _280;
    int _332 = as_type<int>(_190) & 512;
    bool _334 = _332 != 0;
    float _336 = _176 * _192;
    float _338 = _330;
    bool _340 = _334;
    if (_270)
    {
        float _342 = precise::min(_324, 1.0);
        _282 = _342;
    }
    float _344 = _282;
    float _346 = _194 * _336;
    float _348 = _344;
    if (_270)
    {
        float _350 = _344 * _330;
        _338 = _350;
    }
    float _352 = _338;
    float _354 = _196 * _336;
    float _356 = _198 * _336;
    float _358 = fma(_202, _318, _346);
    float _360 = _218 * _176;
    float _362 = _176 * _352;
    float _364 = fma(_208, _318, _354);
    float _366 = fma(_214, _318, _356);
    float _368 = fma(_202, _360, _222);
    float _370 = fma(_208, _360, _228);
    float _372 = fma(_214, _360, _234);
    float _374 = _236 * _362;
    float _376 = _238 * _362;
    float _378 = _240 * _362;
    bool _380 = !_334;
    float _382 = _264;
    float _384 = _360;
    float _386 = _318;
    float _388 = _356;
    float _390 = _362;
    int _392 = as_type<int>(_246);
    int _394 = as_type<int>(_252);
    int _396 = as_type<int>(_258);
    int _398 = as_type<int>(_246);
    int _400 = as_type<int>(_252);
    int _402 = as_type<int>(_258);
    int _404 = as_type<int>(_246);
    int _406 = as_type<int>(_252);
    int _408 = as_type<int>(_258);
    float _530;
    float _532;
    float _534;
    if (!_380)
    {
        float _410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _428 = _414 * _416;
        float _430 = _414 * _418;
        float _432 = _412 * _416;
        float _434 = -_428;
        float _436 = fma(_410, _420, _434);
        float _438 = -_430;
        float _440 = fma(_412, _420, _438);
        float _442 = -_432;
        float _444 = fma(_410, _418, _442);
        float _446 = _424 * _410;
        float _448 = _424 * _436;
        float _450 = _426 * _412;
        float _452 = _422 * _418;
        float _454 = -_446;
        float _456 = fma(_422, _412, _454);
        float _458 = -_448;
        float _460 = fma(_422, _440, _458);
        float _462 = _424 * _420;
        float _464 = _426 * _416;
        float _466 = _422 * _414;
        float _468 = fma(_426, _444, _460);
        float _470 = -_462;
        float _472 = fma(_426, _418, _470);
        float _474 = -_464;
        float _476 = fma(_422, _420, _474);
        float _478 = -_452;
        float _480 = fma(_424, _416, _478);
        float _482 = 1.0 / _468;
        float _484 = -_466;
        float _486 = fma(_426, _410, _484);
        float _488 = -_410;
        float _490 = fma(_488, _420, _428);
        float _492 = -_450;
        float _494 = fma(_424, _414, _492);
        float _496 = _472 * _482;
        float _498 = _476 * _482;
        float _500 = _480 * _482;
        float _502 = _490 * _482;
        float _504 = _376 * _496;
        float _506 = _374 * _482;
        float _508 = _376 * _498;
        float _510 = _376 * _500;
        float _512 = _494 * _482;
        float _514 = fma(_440, _506, _504);
        float _516 = _486 * _482;
        float _518 = _456 * _482;
        float _520 = fma(_374, _502, _508);
        float _522 = fma(_444, _506, _510);
        float _524 = fma(_378, _512, _514);
        float _526 = fma(_378, _516, _520);
        float _528 = fma(_378, _518, _522);
        _288 = _520;
        _290 = _506;
        _292 = _522;
        _294 = _428;
        _296 = _416;
        _298 = _418;
        _300 = _420;
        _384 = _468;
        _302 = _422;
        _386 = _424;
        _348 = _426;
        _388 = _508;
        _530 = _526;
        _532 = _524;
        _534 = _528;
        _390 = _444;
        _536 = true;
    }
    else
    {
        int _538 = as_type<int>(_190) & 1024;
        bool _540 = _538 != 0;
        if (_540)
        {
            _340 = true;
        }
        bool _542 = _340;
        bool _544 = _542;
        if (!_540)
        {
            int _546 = as_type<int>(_190) & 2048;
            bool _548 = _546 != 0;
            _544 = _548;
        }
        bool _550 = _544;
        if (!_550)
        {
            _284 = _374;
        }
        float _552 = _284;
        _532 = _552;
        if (!_550)
        {
            _382 = _376;
        }
        float _554 = _382;
        _530 = _554;
        if (!_550)
        {
            _286 = _378;
        }
        float _556 = _286;
        bool _558 = !_550;
        _534 = _556;
        if (!_558)
        {
            uint _560 = uint(int(uint(_168) >> uint(2)));
            float _562 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_560)]);
            int _564 = _168 + 4;
            uint _566 = uint(int(uint(_564) >> uint(2)));
            float _568 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_566)]);
            int _570 = _168 + 8;
            uint _572 = uint(int(uint(_570) >> uint(2)));
            float _574 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_572)]);
            uint _576 = uint(int(uint(_168) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_576)]);
            int _580 = _168 + 4;
            uint _582 = uint(int(uint(_580) >> uint(2)));
            float _584 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_582)]);
            int _586 = _168 + 8;
            uint _588 = uint(int(uint(_586) >> uint(2)));
            float _590 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_588)]);
            uint _592 = uint(int(uint(_168) >> uint(2)));
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_592)]);
            int _596 = _168 + 4;
            uint _598 = uint(int(uint(_596) >> uint(2)));
            float _600 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_598)]);
            int _602 = _168 + 8;
            uint _604 = uint(int(uint(_602) >> uint(2)));
            float _606 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_604)]);
            float _608 = _574 * _578;
            float _610 = _574 * _584;
            float _612 = _568 * _578;
            float _614 = -_608;
            float _616 = fma(_562, _590, _614);
            float _618 = -_610;
            float _620 = fma(_568, _590, _618);
            float _622 = -_612;
            float _624 = fma(_562, _584, _622);
            float _626 = _600 * _562;
            float _628 = _600 * _616;
            float _630 = _606 * _568;
            float _632 = _594 * _584;
            float _634 = -_626;
            float _636 = fma(_594, _568, _634);
            float _638 = -_628;
            float _640 = fma(_594, _620, _638);
            float _642 = _600 * _590;
            float _644 = _606 * _578;
            float _646 = _594 * _574;
            float _648 = fma(_606, _624, _640);
            float _650 = -_642;
            float _652 = fma(_606, _584, _650);
            float _654 = -_644;
            float _656 = fma(_594, _590, _654);
            float _658 = -_632;
            float _660 = fma(_600, _578, _658);
            float _662 = 1.0 / _648;
            float _664 = -_646;
            float _666 = fma(_606, _562, _664);
            float _668 = -_562;
            float _670 = fma(_668, _590, _608);
            float _672 = -_630;
            float _674 = fma(_600, _574, _672);
            float _676 = _652 * _662;
            float _678 = _656 * _662;
            float _680 = _660 * _662;
            float _682 = _670 * _662;
            float _684 = _376 * _676;
            float _686 = _374 * _662;
            float _688 = _376 * _678;
            float _690 = _376 * _680;
            float _692 = _674 * _662;
            float _694 = fma(_620, _686, _684);
            float _696 = _666 * _662;
            float _698 = _636 * _662;
            float _700 = fma(_374, _682, _688);
            float _702 = fma(_624, _686, _690);
            float _704 = fma(_378, _692, _694);
            float _706 = fma(_378, _696, _700);
            float _708 = fma(_378, _698, _702);
            _288 = _700;
            _290 = _686;
            _292 = _702;
            _294 = _608;
            _296 = _578;
            _298 = _584;
            _300 = _590;
            _384 = _648;
            _302 = _594;
            _386 = _600;
            _348 = _606;
            _388 = _688;
            _530 = _706;
            _532 = _704;
            _534 = _708;
            _390 = _624;
        }
    }
    _536 = false;
    float _710 = _288;
    float _712 = _290;
    float _714 = _292;
    float _716 = _294;
    float _718 = _296;
    float _720 = _298;
    float _722 = _300;
    float _724 = _384;
    float _726 = _302;
    float _728 = _386;
    float _730 = _348;
    float _732 = _388;
    float _734 = _530;
    float _736 = _532;
    float _738 = _534;
    float _740 = _390;
    uint _742 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_742)] = as_type<uint>(_268);
    float _744 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _746 = as_type<int>(_744) & 512;
    bool _748 = _746 != 0;
    int _750 = as_type<int>(_744) & 1024;
    bool _752 = _750 != 0;
    float _754 = _710;
    float _756 = _712;
    float _758 = _714;
    float _760 = _716;
    float _762 = _740;
    float _764 = _734;
    float _766 = _736;
    if (_748)
    {
        float _768 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _754 = _768;
        _756 = _770;
        _758 = _772;
        _760 = _774;
    }
    float _776 = _754;
    float _778 = _756;
    float _780 = _758;
    float _782 = _760;
    float _784 = _718;
    float _786 = _720;
    float _788 = _722;
    float _790 = _724;
    if (_748)
    {
        float _792 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _784 = _792;
        _786 = _794;
        _788 = _796;
        _790 = _798;
    }
    float _800 = _784;
    float _802 = _786;
    float _804 = _788;
    float _806 = _790;
    float _808 = _726;
    float _810 = _728;
    float _812 = _730;
    float _814 = _732;
    if (_748)
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
    float _832 = _370 + _734;
    float _834 = _368 + _736;
    float _836 = _372 + _738;
    if (!_748)
    {
        _762 = 0.0;
    }
    float _838 = _762;
    float _840 = _838;
    if (!_748)
    {
        _764 = 0.0;
    }
    float _842 = _764;
    int _844 = as_type<int>(_744) & 2048;
    bool _846 = _844 != 0;
    float _848 = _778;
    float _850 = _776;
    float _852 = _780;
    float _854 = _842;
    if (_748)
    {
        float _856 = _832 * _778;
        _848 = _856;
    }
    float _858 = _848;
    float _860 = _858;
    float _862 = _800;
    if (_748)
    {
        float _864 = _832 * _802;
        _766 = _864;
    }
    float _866 = _766;
    if (_748)
    {
        float _868 = fma(_834, _776, _858);
        _860 = _868;
    }
    float _870 = _860;
    float _872 = _826;
    float _874 = _824;
    if (_748)
    {
        float _876 = _832 * _826;
        _872 = _876;
    }
    float _878 = _872;
    if (_748)
    {
        float _880 = fma(_834, _800, _866);
        _862 = _880;
    }
    float _882 = _862;
    float _884 = _882;
    if (_748)
    {
        float _886 = fma(_834, _824, _878);
        _850 = _886;
    }
    float _888 = _850;
    float _890 = _888;
    if (_748)
    {
        float _892 = fma(_836, _804, _882);
        _884 = _892;
    }
    float _894 = _884;
    if (_748)
    {
        float _896 = fma(_836, _780, _870);
        _852 = _896;
    }
    float _898 = _852;
    if (_748)
    {
        float _900 = fma(_836, _828, _888);
        _890 = _900;
    }
    float _902 = _890;
    if (!_748)
    {
        _874 = 0.0;
    }
    float _904 = _874;
    float _906 = _904;
    if (_748)
    {
        float _908 = _806 + _894;
        _840 = _908;
    }
    float _910 = _840;
    float _912 = _910;
    if (_748)
    {
        float _914 = _782 + _898;
        _906 = _914;
    }
    float _916 = _906;
    float _918 = _916;
    if (_748)
    {
        float _920 = _830 + _902;
        _854 = _920;
    }
    float _922 = _854;
    bool _924 = !_752;
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
        _912 = _1000;
        _926 = _1004;
    }
    float _1006 = _918;
    float _1008 = _912;
    float _1010 = _926;
    bool _1012 = !_846;
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
    int _1174 = as_type<int>(_378);
    float _1176 = _1112;
    if (_1172)
    {
        float _1178 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1174 = as_type<int>(_1178);
    }
    int _1180 = _1174;
    float _1182 = fma(_1112, 6.2500002968590706586837768554688e-05, 0.5);
    float _1184 = fma(_1114, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3912 = float2(_1182, _1184);
    float _1186 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_3912, float2(0.0), isnan(_3912)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_3912, float2(0.0), isnan(_3912)), level(0.0)).x;
    float _1188 = _1120 * _1110;
    float _1190 = fma(_1118, _1112, _1188);
    float _1192 = fma(_1122, _1114, _1190);
    float _1194 = _1124 + _1192;
    float _1196 = -_1194;
    bool _1198 = _1136 >= _1196;
    bool _1200 = isnan(_1136);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan(_1196);
    bool _1206 = _1202 || _1204;
    float _1208 = -_1194;
    bool _1210 = _1138 >= _1208;
    bool _1212 = isnan(_1138);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1208);
    bool _1218 = _1214 || _1216;
    int _1220 = _1206 ? 0 : 1;
    int _1222 = 2;
    float _1224 = _1184;
    float _1226 = _1182;
    if (_1206)
    {
        _1222 = 1;
    }
    int _1228 = _1222;
    int _1230 = _1228;
    if (_1218)
    {
        _1230 = _1220;
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
    bool _1320 = _1180 <= _1170;
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
    int _1360 = _1234;
    if (!_1334)
    {
        float _1362 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1360 = as_type<int>(_1362);
    }
    int _1364 = _1360;
    float _1366 = _1144 * _1246;
    float _1368 = fma(_1240, _1112, _1366);
    float _1370 = fma(_1252, _1114, _1368);
    float _1372 = _1258 + _1370;
    float _1374 = _1144 * _1272;
    float _1376 = 1.0 / _1372;
    float _1378 = fma(_1266, _1112, _1374);
    float _1380 = _1144 * _1294;
    float _1382 = fma(_1278, _1114, _1378);
    float _1384 = fma(_1288, _1112, _1380);
    float _1386 = _1284 + _1382;
    float _1388 = fma(_1300, _1114, _1384);
    float _1390 = _1386 * _1376;
    float _1392 = _1306 + _1388;
    bool _1394 = _1390 >= 0.0;
    float _1396 = _1392 * _1376;
    bool _1398 = _1390 <= 1.0;
    bool _1400 = _1398 && _1394;
    bool _1402 = _1396 >= 0.0;
    bool _1404 = _1402 && _1400;
    bool _1406 = _1396 <= 1.0;
    bool _1408 = _1406 && _1404;
    float _1410 = _1288;
    float _1412 = _1382;
    float _1414 = _1266;
    float _1416 = _1284;
    if (_1408)
    {
        float _1418 = float(_1232);
        _1410 = _1418;
    }
    float _1420 = _1410;
    float _1422 = _1144 * _1346;
    bool _1424 = _1364 <= _1330;
    bool _1426 = _1424 || _1334;
    float _1428 = fma(_1340, _1112, _1422);
    float _1430 = fma(_1352, _1114, _1428);
    bool _1432 = _314 > 0.001000000047497451305389404296875;
    bool _1434 = isnan(_314);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.001000000047497451305389404296875);
    bool _1440 = _1436 || _1438;
    float _1442 = _1358 + _1430;
    float _1444 = _1428;
    float _1446 = _1340;
    float _1448 = _1442;
    if (_1426)
    {
        _1444 = 1.0;
    }
    float _1450 = _1444;
    float _1452 = _1450;
    if (!_1426)
    {
        float _1454 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1456 = _1330 * as_type<int>(_1454);
        int _1458 = _1456 + _1170;
        int _1460 = _1458 << 2;
        uint _1462 = uint(int(uint(_1458) >> uint(2)));
        int _1464 = 12 & _1460;
        int _1466 = int(_1462) << 4;
        int _1468 = _1466 + _1464;
        int _1470 = _1468 + 400;
        uint _1472 = uint(int(uint(_1470) >> uint(2)));
        float _1474 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1472)]);
        float _1476 = floor(_1314);
        float _1478 = floor(_1160);
        float _1480 = -_1476;
        float _1482 = _1314 + _1480;
        float _1484 = -_1478;
        float _1486 = _1160 + _1484;
        float _1488 = rint(_1474);
        float _1490 = precise::max(_1488, 0.0);
        uint _1492 = uint(_1490);
        uint _1494 = clamp(_1492, 0u, 65535u);
        float3 _4379 = float3(_1486, _1482, float(int(_1494)));
        float3 _4383 = select(_4379, float3(0.0), isnan(_4379));
        float _1496 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4383.xy, uint(rint(_4383.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4383.xy, uint(rint(_4383.z)), level(0.0)).x;
        int _1498 = _1458 << 4;
        int _1500 = _1498 + 2048;
        uint _1502 = uint(int(uint(_1500) >> uint(2)));
        float _1504 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1502)]);
        int _1506 = _1500 + 4;
        uint _1508 = uint(int(uint(_1506) >> uint(2)));
        float _1510 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1508)]);
        int _1512 = _1500 + 8;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1514)]);
        int _1518 = _1500 + 12;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
        float _1524 = _1144 * _1510;
        float _1526 = fma(_1504, _1112, _1524);
        float _1528 = fma(_1516, _1114, _1526);
        float _1530 = _1522 + _1528;
        float _1532 = precise::clamp(_1530, 0.0, 1.0);
        float _1534 = -_1532;
        float _1536 = _1534 + _1496;
        float _1538 = fma(_1536, 500.0, 1.5);
        float _1540 = exp2(_1538);
        float _1542 = 0.0 + _1540;
        float _1544 = precise::clamp(_1542, 0.0, 1.0);
        _1412 = _1540;
        _1414 = _1504;
        _1416 = _1522;
        _1446 = as_type<float>(_1500);
        _1452 = _1544;
    }
    float _1546 = _1412;
    float _1548 = _1414;
    float _1550 = _1416;
    float _1552 = _1446;
    float _1554 = _1452;
    float _1556 = _1420;
    float _1558 = _1548;
    float _1560 = _1552;
    if (_1408)
    {
        float _1562 = rint(_1420);
        float _1564 = precise::max(_1562, 0.0);
        uint _1566 = uint(_1564);
        uint _1568 = clamp(_1566, 0u, 65535u);
        _1556 = as_type<float>(_1568);
    }
    float _1570 = _1556;
    float _1572 = _1442 * _1376;
    bool _1574 = _1186 != 0.0;
    bool _1576 = isnan(_1186);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan(0.0);
    bool _1582 = _1578 || _1580;
    uint _1584 = uint(int(uint(_168) >> uint(2)));
    float _1586 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1584)]);
    if (!_1440)
    {
        float _1588 = fma(_1112, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1558 = _1588;
    }
    float _1590 = _1558;
    float _1592 = _1590;
    if (!_1440)
    {
        float _1594 = fma(_1112, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        _1560 = _1594;
    }
    float _1596 = _1560;
    float _1598 = _1396;
    float _1600 = _1570;
    if (_1408)
    {
        float3 _4539 = float3(_1390, _1396, float(as_type<int>(_1570)));
        float3 _4541 = select(_4539, float3(0.0), isnan(_4539));
        float _1602 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4541.xy, uint(rint(_4541.z)), _1572, level(0.0));
        _1598 = _1602;
    }
    float _1604 = _1598;
    if (!_1582)
    {
        _1176 = 4.0;
    }
    float _1606 = _1176;
    if (!_1408)
    {
        _1448 = 1.0;
    }
    float _1608 = _1448;
    float _1610 = _1186;
    float _1612 = _1608;
    if (!_1582)
    {
        float2 _4566 = float2(_1182, _1184);
        float _1614 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4566, float2(0.0), isnan(_4566)), level(_1606)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4566, float2(0.0), isnan(_4566)), level(_1606)).x;
        _1610 = _1614;
    }
    float _1616 = _1610;
    float _1618 = _1546;
    if (!_1440)
    {
        float2 _4582 = float2(_1590, _1184);
        float _1620 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4582, float2(0.0), isnan(_4582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4582, float2(0.0), isnan(_4582)), level(0.0)).x;
        _1618 = _1620;
    }
    float _1622 = _1618;
    float _1624 = _1550;
    if (!_1440)
    {
        float2 _4597 = float2(_1596, _1184);
        float _1626 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4597, float2(0.0), isnan(_4597)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4597, float2(0.0), isnan(_4597)), level(0.0)).x;
        _1624 = _1626;
    }
    float _1628 = _1624;
    float _1630 = _1586;
    float _1632 = _1622;
    float _1634 = _1628;
    if (_1408)
    {
        bool _1636 = _1604 >= _1572;
        bool _1638 = isnan(_1604);
        bool _1640 = _1636 || _1638;
        bool _1642 = isnan(_1572);
        bool _1644 = _1640 || _1642;
        float _1646 = float(_1644);
        _1612 = _1646;
    }
    float _1648 = _1612;
    float _1650 = -_1648;
    float _1652 = fma(_1650, _1554, 1.0);
    float _1654 = -_1586;
    float _1656 = _1652 + _1654;
    float _1658 = _1652;
    if (_1440)
    {
        float _1660 = fma(_1656, 0.0500000007450580596923828125, _1586);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = precise::max(0.0, _1662);
    float _1666 = precise::min(_1664, 0.999000012874603271484375);
    uint _1668 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1668)] = as_type<uint>(_1666);
    int _1670 = as_type<int>(_1648);
    if (!_1440)
    {
        float _1672 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[76]);
        _1670 = as_type<int>(_1672);
    }
    int _1674 = _1670;
    float _1676 = _1616 * 2000.0;
    bool _1678 = _1676 == 0.0;
    bool _1680 = !_1440;
    bool _1682 = _1678 && _1680;
    bool _1684 = !_1682;
    int _1686 = _1684 ? as_type<int>(_268) : 0;
    float _1688 = -_222;
    float _1690 = _1688 + _834;
    float _1692 = -_228;
    float _1694 = _1692 + _832;
    float _1696 = -_234;
    float _1698 = _1696 + _836;
    float _1700 = _1676;
    if (_1440)
    {
        _304 = _1686;
    }
    int _1702 = _304;
    int _1704 = _1674;
    int _1706 = _1702;
    if (!_1440)
    {
        float _1708 = _1676 + as_type<float>(_1674);
        _1704 = as_type<int>(_1708);
    }
    int _1710 = _1704;
    if (!_1440)
    {
        int _1712 = _168 + 4;
        _1700 = as_type<float>(_1712);
    }
    float _1714 = _1700;
    float _1716 = _1714;
    if (!_1440)
    {
        uint _1718 = uint(int(uint(as_type<int>(_1714)) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1718)] = uint(_1710);
    }
    if (!_1440)
    {
        float _1720 = fma(_1114, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _1722 = fma(_1114, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _1724 = _1622 != 0.0;
        bool _1726 = isnan(_1622);
        bool _1728 = _1724 || _1726;
        bool _1730 = isnan(0.0);
        bool _1732 = _1728 || _1730;
        float2 _4768 = float2(_1182, _1720);
        float _1734 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
        float2 _4776 = float2(_1182, _1722);
        float _1736 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4776, float2(0.0), isnan(_4776)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4776, float2(0.0), isnan(_4776)), level(0.0)).x;
        float2 _4784 = float2(_1590, _1720);
        float _1738 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4784, float2(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4784, float2(0.0), isnan(_4784)), level(0.0)).x;
        float2 _4792 = float2(_1590, _1722);
        float _1740 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4792, float2(0.0), isnan(_4792)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4792, float2(0.0), isnan(_4792)), level(0.0)).x;
        float2 _4800 = float2(_1596, _1720);
        float _1742 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4800, float2(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4800, float2(0.0), isnan(_4800)), level(0.0)).x;
        float2 _4808 = float2(_1596, _1722);
        float _1744 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4808, float2(0.0), isnan(_4808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4808, float2(0.0), isnan(_4808)), level(0.0)).x;
        float _1746 = _1184;
        if (_1732)
        {
            _1600 = _1622;
        }
        float _1748 = _1600;
        if (!_1732)
        {
            _1716 = 4.0;
        }
        float _1750 = _1716;
        float _1752 = _1748;
        float _1754 = _1750;
        if (!_1732)
        {
            float2 _4832 = float2(_1590, _1184);
            float _1756 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4832, float2(0.0), isnan(_4832)), level(_1750)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4832, float2(0.0), isnan(_4832)), level(_1750)).x;
            _1752 = _1756;
        }
        float _1758 = _1752;
        bool _1760 = _1628 != 0.0;
        bool _1762 = isnan(_1628);
        bool _1764 = _1760 || _1762;
        bool _1766 = isnan(0.0);
        bool _1768 = _1764 || _1766;
        if (_1768)
        {
            _1754 = _1628;
        }
        float _1770 = _1754;
        if (!_1768)
        {
            _1630 = 4.0;
        }
        float _1772 = _1630;
        float _1774 = _1770;
        if (!_1768)
        {
            float2 _4869 = float2(_1596, _1184);
            float _1776 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4869, float2(0.0), isnan(_4869)), level(_1772)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4869, float2(0.0), isnan(_4869)), level(_1772)).x;
            _1774 = _1776;
        }
        float _1778 = _1774;
        bool _1780 = _1734 != 0.0;
        bool _1782 = isnan(_1734);
        bool _1784 = _1780 || _1782;
        bool _1786 = isnan(0.0);
        bool _1788 = _1784 || _1786;
        bool _1790 = _1738 != 0.0;
        bool _1792 = isnan(_1738);
        bool _1794 = _1790 || _1792;
        bool _1796 = isnan(0.0);
        bool _1798 = _1794 || _1796;
        bool _1800 = _1740 != 0.0;
        bool _1802 = isnan(_1740);
        bool _1804 = _1800 || _1802;
        bool _1806 = isnan(0.0);
        bool _1808 = _1804 || _1806;
        bool _1810 = _1744 != 0.0;
        bool _1812 = isnan(_1744);
        bool _1814 = _1810 || _1812;
        bool _1816 = isnan(0.0);
        bool _1818 = _1814 || _1816;
        bool _1820 = _1742 != 0.0;
        bool _1822 = isnan(_1742);
        bool _1824 = _1820 || _1822;
        bool _1826 = isnan(0.0);
        bool _1828 = _1824 || _1826;
        bool _1830 = _1736 != 0.0;
        bool _1832 = isnan(_1736);
        bool _1834 = _1830 || _1832;
        bool _1836 = isnan(0.0);
        bool _1838 = _1834 || _1836;
        if (!_1788)
        {
            _1592 = 4.0;
        }
        float _1840 = _1592;
        if (!_1798)
        {
            _1632 = 4.0;
        }
        float _1842 = _1632;
        if (!_1808)
        {
            _1634 = 4.0;
        }
        float _1844 = _1634;
        if (!_1818)
        {
            _1224 = 4.0;
        }
        float _1846 = _1224;
        if (!_1828)
        {
            _1226 = 4.0;
        }
        float _1848 = _1226;
        float _1850 = _1740;
        if (!_1808)
        {
            float2 _4976 = float2(_1590, _1722);
            float _1852 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4976, float2(0.0), isnan(_4976)), level(_1844)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4976, float2(0.0), isnan(_4976)), level(_1844)).x;
            _1850 = _1852;
        }
        float _1854 = _1850;
        float _1856 = _1744;
        if (!_1818)
        {
            float2 _4992 = float2(_1596, _1722);
            float _1858 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_4992, float2(0.0), isnan(_4992)), level(_1846)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_4992, float2(0.0), isnan(_4992)), level(_1846)).x;
            _1856 = _1858;
        }
        float _1860 = _1856;
        float _1862 = _1738;
        if (!_1798)
        {
            float2 _5008 = float2(_1590, _1720);
            float _1864 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5008, float2(0.0), isnan(_5008)), level(_1842)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5008, float2(0.0), isnan(_5008)), level(_1842)).x;
            _1862 = _1864;
        }
        float _1866 = _1862;
        float _1868 = _1742;
        if (!_1828)
        {
            float2 _5024 = float2(_1596, _1720);
            float _1870 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5024, float2(0.0), isnan(_5024)), level(_1848)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5024, float2(0.0), isnan(_5024)), level(_1848)).x;
            _1868 = _1870;
        }
        float _1872 = _1868;
        if (!_1838)
        {
            _1746 = 4.0;
        }
        float _1874 = _1746;
        float _1876 = _1736;
        if (!_1838)
        {
            float2 _5045 = float2(_1182, _1722);
            float _1878 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5045, float2(0.0), isnan(_5045)), level(_1874)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5045, float2(0.0), isnan(_5045)), level(_1874)).x;
            _1876 = _1878;
        }
        float _1880 = _1876;
        float _1882 = _1734;
        if (!_1788)
        {
            float2 _5061 = float2(_1182, _1720);
            float _1884 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5061, float2(0.0), isnan(_5061)), level(_1840)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5061, float2(0.0), isnan(_5061)), level(_1840)).x;
            _1882 = _1884;
        }
        float _1886 = _1882;
        float _1888 = -_1758;
        float _1890 = _1616 + _1888;
        float _1892 = -_1778;
        float _1894 = _1616 + _1892;
        float _1896 = abs(_1890);
        float _1898 = abs(_1894);
        float _1900 = precise::max(_1896, _1898);
        float _1902 = -_1854;
        float _1904 = _1616 + _1902;
        float _1906 = -_1860;
        float _1908 = _1616 + _1906;
        float _1910 = -_1866;
        float _1912 = _1616 + _1910;
        float _1914 = -_1872;
        float _1916 = _1616 + _1914;
        float _1918 = abs(_1912);
        float _1920 = abs(_1904);
        float _1922 = precise::max(_1918, _1920);
        float _1924 = -_1880;
        float _1926 = _1616 + _1924;
        float _1928 = -_1886;
        float _1930 = _1616 + _1928;
        float _1932 = abs(_1916);
        float _1934 = abs(_1908);
        float _1936 = precise::max(_1932, _1934);
        float _1938 = abs(_1930);
        float _1940 = abs(_1926);
        float _1942 = precise::max(_1938, _1940);
        float _1944 = precise::max(_1922, _1936);
        float _1946 = precise::max(_1900, _1942);
        bool _1948 = _1944 > 0.00150000001303851604461669921875;
        bool _1950 = _1946 > 0.00150000001303851604461669921875;
        bool _1952 = _1950 || _1948;
        bool _1954 = !_1952;
        int _1956 = _1954 ? _1686 : 0;
        _1706 = _1956;
    }
    int _1958 = _1706;
    int _1960 = _168 + 4;
    int _1962 = _168 + 8;
    uint _1964 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1964)] = uint(_1958);
    uint _1966 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1966)] = as_type<uint>(_834);
    uint _1968 = uint(int(uint(_1960) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1968)] = as_type<uint>(_832);
    uint _1970 = uint(int(uint(_1962) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1970)] = as_type<uint>(_836);
    uint _1972 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1972)] = as_type<uint>(_358);
    uint _1974 = uint(int(uint(_1960) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1974)] = as_type<uint>(_364);
    uint _1976 = uint(int(uint(_1962) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1976)] = as_type<uint>(_366);
    uint _1978 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1978)] = as_type<uint>(_1690);
    uint _1980 = uint(int(uint(_1960) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1980)] = as_type<uint>(_1694);
    uint _1982 = uint(int(uint(_1962) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_1982)] = as_type<uint>(_1698);
    float _1984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1986 = _1694 * _1694;
    float _1988 = _364 * _364;
    float _1990 = fma(_1690, _1690, _1986);
    float _1992 = fma(_358, _358, _1988);
    float _1994 = fma(_1698, _1698, _1990);
    float _1996 = fma(_366, _366, _1992);
    float _1998 = sqrt(_1996);
    float _2000 = sqrt(_1994);
    bool _2002 = _2000 >= 9.9999999747524270787835121154785e-07;
    bool _2004 = isnan(_2000);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(9.9999999747524270787835121154785e-07);
    bool _2010 = _2006 || _2008;
    if (!_2010)
    {
        bool _2012 = _178 != _182;
        bool _2014 = isnan(_178);
        bool _2016 = _2012 || _2014;
        bool _2018 = isnan(_182);
        bool _2020 = _2016 || _2018;
        _2022 = _2020;
        if (!_2022)
        {
            float _2024 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _2026 = _2024 > 0.0;
            bool _2028 = !_2026;
            if (!_2028)
            {
                float _2030 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _2032 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _2034 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _2036 = _2032 * _2032;
                float _2038 = fma(_2030, _2030, _2036);
                float _2040 = fma(_2034, _2034, _2038);
                float _2042 = rsqrt(_2040);
                float _2044 = _2042 * 9.9999999747524270787835121154785e-07;
                float _2046 = _2030 * _2044;
                float _2048 = _2032 * _2044;
                float _2050 = _2034 * _2044;
                _404 = as_type<int>(_2046);
                _406 = as_type<int>(_2048);
                _408 = as_type<int>(_2050);
                _2022 = true;
            }
            else
            {
                bool _2052 = _1998 >= 9.9999999747524270787835121154785e-07;
                bool _2054 = isnan(_1998);
                bool _2056 = _2052 || _2054;
                bool _2058 = isnan(9.9999999747524270787835121154785e-07);
                bool _2060 = _2056 || _2058;
                if (!_2060)
                {
                    float _2062 = _832 * _832;
                    float _2064 = fma(_834, _834, _2062);
                    float _2066 = fma(_836, _836, _2064);
                    float _2068 = sqrt(_2066);
                    bool _2070 = _2068 >= 9.9999999747524270787835121154785e-07;
                    bool _2072 = isnan(_2068);
                    bool _2074 = _2070 || _2072;
                    bool _2076 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2078 = _2074 || _2076;
                    float _2080 = _2068;
                    if (_2078)
                    {
                        float _2082 = rsqrt(_2066);
                        _2080 = _2082;
                    }
                    float _2084 = _2080;
                    if (!_2078)
                    {
                        _392 = 0;
                    }
                    int _2086 = _392;
                    int _2088 = _2086;
                    if (!_2078)
                    {
                        _394 = 897988541;
                    }
                    int _2090 = _394;
                    int _2092 = _2090;
                    if (!_2078)
                    {
                        _396 = 0;
                    }
                    int _2094 = _396;
                    float _2096 = _2084;
                    int _2098 = _2094;
                    if (_2078)
                    {
                        float _2100 = _2084 * 9.9999999747524270787835121154785e-07;
                        _2096 = _2100;
                    }
                    float _2102 = _2096;
                    if (_2078)
                    {
                        float _2104 = _834 * _2102;
                        _2088 = as_type<int>(_2104);
                    }
                    int _2106 = _2088;
                    _404 = _2106;
                    if (_2078)
                    {
                        float _2108 = _832 * _2102;
                        _2092 = as_type<int>(_2108);
                    }
                    int _2110 = _2092;
                    _406 = _2110;
                    if (_2078)
                    {
                        float _2112 = _836 * _2102;
                        _2098 = as_type<int>(_2112);
                    }
                    int _2114 = _2098;
                    _408 = _2114;
                    _2022 = true;
                }
                else
                {
                    float _2116 = rsqrt(_1996);
                    float _2118 = _2116 * 9.9999999747524270787835121154785e-07;
                    float _2120 = _358 * _2118;
                    float _2122 = _364 * _2118;
                    float _2124 = _366 * _2118;
                    _404 = as_type<int>(_2120);
                    _406 = as_type<int>(_2122);
                    _408 = as_type<int>(_2124);
                    _2022 = true;
                }
            }
        }
    }
    else
    {
        float _2126 = _1998 * _1984;
        bool _2128 = _2126 >= 0.001000000047497451305389404296875;
        bool _2130 = isnan(_2126);
        bool _2132 = _2128 || _2130;
        bool _2134 = isnan(0.001000000047497451305389404296875);
        bool _2136 = _2132 || _2134;
        bool _2138 = _2126 > 0.0;
        bool _2140 = !_2136;
        bool _2142 = _2138 && _2140;
        bool _2144 = _2000 < 0.001000000047497451305389404296875;
        bool _2146 = _2144 && _2142;
        if (!_2146)
        {
            _398 = as_type<int>(_1690);
        }
        int _2148 = _398;
        int _2150 = _2148;
        if (_2146)
        {
            float _2152 = _358 * _1984;
            _2150 = as_type<int>(_2152);
        }
        int _2154 = _2150;
        _404 = _2154;
        if (!_2146)
        {
            _400 = as_type<int>(_1694);
        }
        int _2156 = _400;
        int _2158 = _2156;
        if (_2146)
        {
            float _2160 = _364 * _1984;
            _2158 = as_type<int>(_2160);
        }
        int _2162 = _2158;
        _406 = _2162;
        if (!_2146)
        {
            _402 = as_type<int>(_1698);
        }
        int _2164 = _402;
        _408 = _2164;
        if (_2146)
        {
            float _2166 = _366 * _1984;
            _408 = as_type<int>(_2166);
        }
    }
    _2022 = false;
    int _2168 = _404;
    int _2170 = _406;
    int _2172 = _408;
    uint _2174 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2174)] = uint(_2168);
    uint _2176 = uint(int(uint(_1960) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2176)] = uint(_2170);
    uint _2178 = uint(int(uint(_1962) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2178)] = uint(_2172);
}

