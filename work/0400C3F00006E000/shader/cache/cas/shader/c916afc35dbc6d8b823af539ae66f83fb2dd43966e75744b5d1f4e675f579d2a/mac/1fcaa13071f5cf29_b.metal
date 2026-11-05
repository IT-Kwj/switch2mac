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
    bool _2000 = false;
    bool _822 = false;
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
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _168 = _87 << 4;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_170)]);
    int _174 = _168 + 4;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_176)]);
    int _180 = _168 + 8;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = as_type<int>(_166) & 512;
    bool _188 = _186 != 0;
    int _190 = _168 + 12;
    uint _192 = uint(int(uint(_168) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_192)]);
    int _196 = _168 + 4;
    uint _198 = uint(int(uint(_196) >> uint(2)));
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_198)]);
    int _202 = _168 + 8;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _168 + 12;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    uint _214 = uint(int(uint(_168) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_214)]);
    int _218 = _168 + 4;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_220)]);
    int _224 = _168 + 8;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_226)]);
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = 0.0;
    bool _236 = _188;
    float _238 = _166;
    if (_188)
    {
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _230 = _240;
        _232 = _242;
        _234 = _244;
    }
    float _246 = _230;
    float _248 = _232;
    float _250 = _234;
    float _252 = 0.0;
    float _254 = 0.0;
    float _256 = 0.0;
    if (_188)
    {
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _252 = _258;
        _254 = _260;
        _256 = _262;
    }
    float _264 = _252;
    float _266 = _254;
    float _268 = _256;
    float _270 = 0.0;
    float _272 = 0.0;
    float _274 = 0.0;
    if (_188)
    {
        float _276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _270 = _276;
        _272 = _278;
        _274 = _280;
    }
    float _282 = _270;
    float _284 = _272;
    float _286 = _274;
    uint _288 = uint(int(uint(_168) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_288)]);
    uint _292 = uint(int(uint(_190) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_292)]);
    uint _296 = uint(int(uint(_190) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_296)]);
    float _300 = _264;
    float _302 = _266;
    float _304 = _268;
    float _306 = _246;
    float _308 = _248;
    float _310 = _250;
    float _312 = _282;
    float _314 = _284;
    float _316 = _286;
    float _318 = _212;
    int _320 = as_type<int>(_216);
    int _322 = as_type<int>(_222);
    int _324 = as_type<int>(_228);
    int _326 = as_type<int>(_216);
    int _328 = as_type<int>(_222);
    int _330 = as_type<int>(_228);
    int _332 = as_type<int>(_216);
    int _334 = as_type<int>(_222);
    int _336 = as_type<int>(_228);
    if (!_188)
    {
        int _338 = _168 + 4;
        uint _340 = uint(int(uint(_168) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        int _344 = _168 + 8;
        uint _346 = uint(int(uint(_168) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_338) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_344) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_338) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_344) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        uint _366 = uint(int(uint(_168) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        uint _370 = uint(int(uint(_338) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        uint _374 = uint(int(uint(_344) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_374)]);
        float _378 = _342 * _342;
        float _380 = fma(_348, _348, _378);
        float _382 = _352 * _352;
        float _384 = _356 * _356;
        float _386 = fma(_360, _360, _382);
        float _388 = fma(_364, _364, _384);
        float _390 = fma(_368, _368, _380);
        float _392 = fma(_372, _372, _386);
        float _394 = sqrt(_390);
        float _396 = fma(_376, _376, _388);
        float _398 = sqrt(_392);
        float _400 = sqrt(_396);
        bool _402 = _394 > 0.0;
        bool _404 = _398 > 0.0;
        bool _406 = _400 > 0.0;
        float _408 = _388;
        float _410 = _386;
        float _412 = _380;
        float _414 = _394;
        float _416 = _398;
        float _418 = _400;
        float _420 = _390;
        float _422 = _352;
        float _424 = _368;
        float _426 = _392;
        if (_402)
        {
            float _428 = rsqrt(_390);
            _408 = _428;
        }
        float _430 = _408;
        float _432 = 0.0;
        if (_404)
        {
            float _434 = rsqrt(_392);
            _432 = _434;
        }
        float _436 = _432;
        float _438 = 0.0;
        if (_406)
        {
            float _440 = rsqrt(_396);
            _438 = _440;
        }
        float _442 = _438;
        if (!_402)
        {
            _410 = 0.0;
        }
        float _444 = _410;
        float _446 = _444;
        if (_402)
        {
            float _448 = _368 * _430;
            _446 = _448;
        }
        float _450 = _446;
        _312 = _450;
        if (!_404)
        {
            _412 = 0.0;
        }
        float _452 = _412;
        float _454 = _452;
        if (!_402)
        {
            _414 = 0.0;
        }
        float _456 = _414;
        float _458 = _456;
        if (_402)
        {
            float _460 = _342 * _430;
            _458 = _460;
        }
        float _462 = _458;
        _300 = _462;
        if (!_402)
        {
            _416 = 0.0;
        }
        float _464 = _416;
        float _466 = _464;
        if (_404)
        {
            float _468 = _352 * _436;
            _454 = _468;
        }
        float _470 = _454;
        _302 = _470;
        if (!_404)
        {
            _418 = 0.0;
        }
        float _472 = _418;
        float _474 = _472;
        if (_402)
        {
            float _476 = _348 * _430;
            _466 = _476;
        }
        float _478 = _466;
        _306 = _478;
        if (!_404)
        {
            _420 = 0.0;
        }
        float _480 = _420;
        float _482 = _480;
        if (_404)
        {
            float _484 = _360 * _436;
            _474 = _484;
        }
        float _486 = _474;
        _308 = _486;
        if (!_406)
        {
            _422 = 0.0;
        }
        float _488 = _422;
        float _490 = _488;
        if (_404)
        {
            float _492 = _372 * _436;
            _482 = _492;
        }
        float _494 = _482;
        _314 = _494;
        if (!_406)
        {
            _424 = 0.0;
        }
        float _496 = _424;
        float _498 = _496;
        if (_406)
        {
            float _500 = _356 * _442;
            _490 = _500;
        }
        float _502 = _490;
        _304 = _502;
        if (!_406)
        {
            _426 = 0.0;
        }
        float _504 = _426;
        _316 = _504;
        if (_406)
        {
            float _506 = _364 * _442;
            _498 = _506;
        }
        float _508 = _498;
        _310 = _508;
        if (_406)
        {
            float _510 = _376 * _442;
            _316 = _510;
        }
    }
    float _512 = _300;
    float _514 = _302;
    float _516 = _304;
    float _518 = _306;
    float _520 = _308;
    float _522 = _310;
    float _524 = _312;
    float _526 = _314;
    float _528 = _316;
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _560 = uint(int(uint(_190) >> uint(2)));
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_560)]);
    bool _564 = _532 > 0.0;
    float _566 = abs(_530);
    float _568 = log2(_566);
    bool _570 = _534 > 0.0;
    float _572 = 0.0;
    float _574 = _536;
    float _576 = _538;
    float _578 = _552;
    float _580 = _554;
    float _582 = _556;
    float _584 = _558;
    float _586 = _542;
    float _588 = _544;
    float _590 = _548;
    if (_564)
    {
        float _592 = 1.0 / _532;
        _572 = _592;
    }
    float _594 = _572;
    float _596 = _536 * _534;
    float _598 = _540 * _546;
    float _600 = _538 * _546;
    float _602 = _542 * _546;
    float _604 = _548 * _568;
    if (_570)
    {
        float _606 = -_596;
        float _608 = fma(_290, _606, _536);
        _574 = _608;
    }
    float _610 = _574;
    float _612 = -_298;
    float _614 = _550 + _612;
    float _616 = _598 * _512;
    float _618 = exp2(_604);
    float _620 = _598 * _514;
    float _622 = _598 * _516;
    float _624 = _610;
    float _626 = _594;
    if (_564)
    {
        float _628 = _614 * _594;
        _318 = _628;
    }
    float _630 = _318;
    float _632 = fma(_600, _518, _616);
    float _634 = fma(_600, _520, _620);
    float _636 = fma(_600, _522, _622);
    float _638 = _634;
    if (_564)
    {
        float _640 = precise::min(_630, 1.0);
        _576 = _640;
    }
    float _642 = _576;
    float _644 = fma(_602, _524, _632);
    float _646 = fma(_602, _526, _634);
    float _648 = fma(_602, _528, _636);
    float _650 = _642;
    if (_564)
    {
        float _652 = _642 * _610;
        _624 = _652;
    }
    float _654 = _624;
    float _656 = _548 * _644;
    float _658 = _294 * _548;
    float _660 = _548 * _646;
    float _662 = _548 * _648;
    float _664 = _548 * _654;
    float _666 = fma(_194, _618, _656);
    float _668 = fma(_200, _618, _660);
    float _670 = fma(_206, _658, _184);
    float _672 = fma(_194, _658, _172);
    float _674 = fma(_200, _658, _178);
    float _676 = fma(_206, _618, _662);
    float _678 = _552 * _664;
    float _680 = _554 * _664;
    float _682 = _556 * _664;
    bool _684 = !_188;
    float _686 = _660;
    float _688 = _662;
    float _690 = _678;
    float _692 = _664;
    float _694 = _672;
    float _816;
    float _818;
    float _820;
    if (!_684)
    {
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _714 = _700 * _702;
        float _716 = _700 * _704;
        float _718 = _698 * _702;
        float _720 = -_714;
        float _722 = fma(_696, _706, _720);
        float _724 = -_716;
        float _726 = fma(_698, _706, _724);
        float _728 = -_718;
        float _730 = fma(_696, _704, _728);
        float _732 = _710 * _696;
        float _734 = _710 * _722;
        float _736 = _712 * _698;
        float _738 = _708 * _704;
        float _740 = -_732;
        float _742 = fma(_708, _698, _740);
        float _744 = -_734;
        float _746 = fma(_708, _726, _744);
        float _748 = _710 * _706;
        float _750 = _712 * _702;
        float _752 = -_738;
        float _754 = fma(_710, _702, _752);
        float _756 = fma(_712, _730, _746);
        float _758 = -_748;
        float _760 = fma(_712, _704, _758);
        float _762 = -_750;
        float _764 = fma(_708, _706, _762);
        float _766 = _708 * _700;
        float _768 = 1.0 / _756;
        float _770 = -_696;
        float _772 = fma(_770, _706, _714);
        float _774 = -_736;
        float _776 = fma(_710, _700, _774);
        float _778 = -_766;
        float _780 = fma(_712, _696, _778);
        float _782 = _760 * _768;
        float _784 = _764 * _768;
        float _786 = _754 * _768;
        float _788 = _772 * _768;
        float _790 = _680 * _782;
        float _792 = _678 * _768;
        float _794 = _680 * _784;
        float _796 = _680 * _786;
        float _798 = _776 * _768;
        float _800 = fma(_726, _792, _790);
        float _802 = _780 * _768;
        float _804 = _742 * _768;
        float _806 = fma(_678, _788, _794);
        float _808 = fma(_730, _792, _796);
        float _810 = fma(_682, _798, _800);
        float _812 = fma(_682, _802, _806);
        float _814 = fma(_682, _804, _808);
        _578 = _788;
        _580 = _792;
        _582 = _802;
        _584 = _756;
        _650 = _708;
        _688 = _710;
        _586 = _712;
        _588 = _784;
        _590 = _800;
        _238 = _704;
        _638 = _794;
        _816 = _808;
        _818 = _812;
        _690 = _810;
        _820 = _814;
        _692 = _806;
        _822 = true;
    }
    else
    {
        int _824 = as_type<int>(_166) & 1024;
        bool _826 = _824 != 0;
        if (_826)
        {
            _236 = true;
        }
        bool _828 = _236;
        bool _830 = _828;
        if (!_826)
        {
            int _832 = as_type<int>(_166) & 2048;
            bool _834 = _832 != 0;
            _830 = _834;
        }
        bool _836 = _830;
        if (!_836)
        {
            _686 = _680;
        }
        float _838 = _686;
        _818 = _838;
        if (!_836)
        {
            _626 = _682;
        }
        float _840 = _626;
        bool _842 = !_836;
        _816 = 0.0;
        _820 = _840;
        if (!_842)
        {
            uint _844 = uint(int(uint(_168) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_844)]);
            int _848 = _168 + 4;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            int _854 = _168 + 8;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_856)]);
            uint _860 = uint(int(uint(_168) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_860)]);
            int _864 = _168 + 4;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            int _870 = _168 + 8;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_872)]);
            uint _876 = uint(int(uint(_168) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_876)]);
            int _880 = _168 + 4;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_882)]);
            int _886 = _168 + 8;
            uint _888 = uint(int(uint(_886) >> uint(2)));
            float _890 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_888)]);
            float _892 = _858 * _862;
            float _894 = _858 * _868;
            float _896 = _852 * _862;
            float _898 = -_892;
            float _900 = fma(_846, _874, _898);
            float _902 = -_894;
            float _904 = fma(_852, _874, _902);
            float _906 = -_896;
            float _908 = fma(_846, _868, _906);
            float _910 = _884 * _846;
            float _912 = _884 * _900;
            float _914 = _890 * _852;
            float _916 = _878 * _868;
            float _918 = -_910;
            float _920 = fma(_878, _852, _918);
            float _922 = -_912;
            float _924 = fma(_878, _904, _922);
            float _926 = _884 * _874;
            float _928 = _890 * _862;
            float _930 = -_916;
            float _932 = fma(_884, _862, _930);
            float _934 = fma(_890, _908, _924);
            float _936 = -_926;
            float _938 = fma(_890, _868, _936);
            float _940 = -_928;
            float _942 = fma(_878, _874, _940);
            float _944 = _878 * _858;
            float _946 = 1.0 / _934;
            float _948 = -_846;
            float _950 = fma(_948, _874, _892);
            float _952 = -_914;
            float _954 = fma(_884, _858, _952);
            float _956 = -_944;
            float _958 = fma(_890, _846, _956);
            float _960 = _938 * _946;
            float _962 = _942 * _946;
            float _964 = _932 * _946;
            float _966 = _950 * _946;
            float _968 = _680 * _960;
            float _970 = _678 * _946;
            float _972 = _680 * _962;
            float _974 = _680 * _964;
            float _976 = _954 * _946;
            float _978 = fma(_904, _970, _968);
            float _980 = _958 * _946;
            float _982 = _920 * _946;
            float _984 = fma(_678, _966, _972);
            float _986 = fma(_908, _970, _974);
            float _988 = fma(_682, _976, _978);
            float _990 = fma(_682, _980, _984);
            float _992 = fma(_682, _982, _986);
            _578 = _966;
            _580 = _970;
            _582 = _980;
            _584 = _934;
            _650 = _878;
            _688 = _884;
            _586 = _890;
            _588 = _962;
            _590 = _978;
            _238 = _868;
            _638 = _972;
            _816 = _986;
            _818 = _990;
            _690 = _988;
            _820 = _992;
            _692 = _984;
        }
    }
    _822 = false;
    float _994 = _578;
    float _996 = _580;
    float _998 = _582;
    float _1000 = _584;
    float _1002 = _650;
    float _1004 = _688;
    float _1006 = _586;
    float _1008 = _588;
    float _1010 = _590;
    float _1012 = _238;
    float _1014 = _638;
    float _1016 = _816;
    float _1018 = _818;
    float _1020 = _690;
    float _1022 = _820;
    float _1024 = _692;
    uint _1026 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1026)] = as_type<uint>(_562);
    float _1028 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1030 = as_type<int>(_1028) & 512;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>(_1028) & 1024;
    bool _1036 = _1034 != 0;
    float _1038 = _994;
    float _1040 = _996;
    float _1042 = _998;
    float _1044 = _1000;
    float _1046 = _1020;
    float _1048 = _1024;
    if (_1032)
    {
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1056 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1038 = _1050;
        _1040 = _1052;
        _1042 = _1054;
        _1044 = _1056;
    }
    float _1058 = _1038;
    float _1060 = _1040;
    float _1062 = _1042;
    float _1064 = _1044;
    float _1066 = _1002;
    float _1068 = _1004;
    float _1070 = _1006;
    float _1072 = _1008;
    if (_1032)
    {
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1066 = _1074;
        _1068 = _1076;
        _1070 = _1078;
        _1072 = _1080;
    }
    float _1082 = _1066;
    float _1084 = _1068;
    float _1086 = _1070;
    float _1088 = _1072;
    float _1090 = _1010;
    float _1092 = _1012;
    float _1094 = _1014;
    float _1096 = _1016;
    if (_1032)
    {
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1090 = _1098;
        _1092 = _1100;
        _1094 = _1102;
        _1096 = _1104;
    }
    float _1106 = _1090;
    float _1108 = _1092;
    float _1110 = _1094;
    float _1112 = _1096;
    float _1114 = _674 + _1018;
    float _1116 = _672 + _1020;
    float _1118 = _670 + _1022;
    if (!_1032)
    {
        _1046 = 0.0;
    }
    float _1120 = _1046;
    float _1122 = _1120;
    if (!_1032)
    {
        _1048 = 0.0;
    }
    float _1124 = _1048;
    int _1126 = as_type<int>(_1028) & 2048;
    bool _1128 = _1126 != 0;
    float _1130 = _1124;
    if (_1032)
    {
        float _1132 = _1114 * _1060;
        _694 = _1132;
    }
    float _1134 = _694;
    float _1136 = _1084;
    float _1138 = _1134;
    float _1140 = _1108;
    float _1142 = _1082;
    float _1144 = _1106;
    float _1146 = _1086;
    if (_1032)
    {
        float _1148 = _1114 * _1084;
        _1136 = _1148;
    }
    float _1150 = _1136;
    float _1152 = _1150;
    if (_1032)
    {
        float _1154 = fma(_1116, _1058, _1134);
        _1138 = _1154;
    }
    float _1156 = _1138;
    float _1158 = _1156;
    if (_1032)
    {
        float _1160 = _1114 * _1108;
        _1140 = _1160;
    }
    float _1162 = _1140;
    if (_1032)
    {
        float _1164 = fma(_1116, _1082, _1150);
        _1152 = _1164;
    }
    float _1166 = _1152;
    if (_1032)
    {
        float _1168 = fma(_1118, _1062, _1156);
        _1158 = _1168;
    }
    float _1170 = _1158;
    if (!_1032)
    {
        _1142 = 0.0;
    }
    float _1172 = _1142;
    float _1174 = _1172;
    if (_1032)
    {
        float _1176 = fma(_1116, _1106, _1162);
        _1144 = _1176;
    }
    float _1178 = _1144;
    float _1180 = _1178;
    if (_1032)
    {
        float _1182 = fma(_1118, _1086, _1166);
        _1146 = _1182;
    }
    float _1184 = _1146;
    if (_1032)
    {
        float _1186 = _1064 + _1170;
        _1122 = _1186;
    }
    float _1188 = _1122;
    float _1190 = _1188;
    if (_1032)
    {
        float _1192 = fma(_1118, _1110, _1178);
        _1180 = _1192;
    }
    float _1194 = _1180;
    if (_1032)
    {
        float _1196 = _1088 + _1184;
        _1174 = _1196;
    }
    float _1198 = _1174;
    float _1200 = _1198;
    if (_1032)
    {
        float _1202 = _1112 + _1194;
        _1130 = _1202;
    }
    float _1204 = _1130;
    bool _1206 = !_1036;
    float _1208 = _1204;
    if (!_1206)
    {
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1212 = uint(int(uint(_168) >> uint(2)));
        float _1214 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1212)]);
        int _1216 = _168 + 4;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1218)]);
        int _1222 = _168 + 8;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1224)]);
        uint _1228 = uint(int(uint(_168) >> uint(2)));
        float _1230 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1228)]);
        int _1232 = _168 + 4;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1234)]);
        int _1238 = _168 + 8;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1240)]);
        uint _1244 = uint(int(uint(_168) >> uint(2)));
        float _1246 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1244)]);
        int _1248 = _168 + 4;
        uint _1250 = uint(int(uint(_1248) >> uint(2)));
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1250)]);
        int _1254 = _168 + 8;
        uint _1256 = uint(int(uint(_1254) >> uint(2)));
        float _1258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1256)]);
        float _1260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1264 = _1114 * _1220;
        float _1266 = _1114 * _1236;
        float _1268 = _1114 * _1252;
        float _1270 = fma(_1116, _1214, _1264);
        float _1272 = fma(_1116, _1230, _1266);
        float _1274 = fma(_1116, _1246, _1268);
        float _1276 = fma(_1118, _1226, _1270);
        float _1278 = fma(_1118, _1242, _1272);
        float _1280 = fma(_1118, _1258, _1274);
        float _1282 = _1210 + _1276;
        float _1284 = _1260 + _1278;
        float _1286 = _1262 + _1280;
        _1200 = _1284;
        _1190 = _1282;
        _1208 = _1286;
    }
    float _1288 = _1200;
    float _1290 = _1190;
    float _1292 = _1208;
    bool _1294 = !_1128;
    float _1296 = _1288;
    float _1298 = _1290;
    float _1300 = _1292;
    if (!_1294)
    {
        uint _1302 = uint(int(uint(_168) >> uint(2)));
        float _1304 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1302)]);
        int _1306 = _168 + 4;
        uint _1308 = uint(int(uint(_1306) >> uint(2)));
        float _1310 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1308)]);
        int _1312 = _168 + 8;
        uint _1314 = uint(int(uint(_1312) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        int _1318 = _168 + 12;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1320)]);
        uint _1324 = uint(int(uint(_168) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1324)]);
        int _1328 = _168 + 4;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1330)]);
        int _1334 = _168 + 8;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1336)]);
        int _1340 = _168 + 12;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1342)]);
        uint _1346 = uint(int(uint(_168) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1346)]);
        int _1350 = _168 + 4;
        uint _1352 = uint(int(uint(_1350) >> uint(2)));
        float _1354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1352)]);
        int _1356 = _168 + 8;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        float _1360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1358)]);
        int _1362 = _168 + 12;
        uint _1364 = uint(int(uint(_1362) >> uint(2)));
        float _1366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1364)]);
        float _1368 = _1114 * _1310;
        float _1370 = _1114 * _1332;
        float _1372 = _1114 * _1354;
        float _1374 = fma(_1116, _1304, _1368);
        float _1376 = fma(_1116, _1326, _1370);
        float _1378 = fma(_1116, _1348, _1372);
        float _1380 = fma(_1118, _1316, _1374);
        float _1382 = fma(_1118, _1338, _1376);
        float _1384 = fma(_1118, _1360, _1378);
        float _1386 = _1380 + _1322;
        float _1388 = _1382 + _1344;
        float _1390 = _1384 + _1366;
        _1296 = _1388;
        _1298 = _1386;
        _1300 = _1390;
    }
    float _1392 = _1296;
    float _1394 = _1298;
    float _1396 = _1300;
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1424 = _1398 + 1.0;
    float _1426 = _1424 + _1392;
    float _1428 = _1426 * _1410;
    float _1430 = fma(_1408, _1394, _1428);
    float _1432 = fma(_1412, _1396, _1430);
    float _1434 = _1414 + _1432;
    float _1436 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1438 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1440 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1442 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1444 = trunc(_1434);
    int _1446 = int(_1444);
    int _1448 = ~as_type<int>(_1416);
    int _1450 = _1446 + _1448;
    int _1452 = _1450 + 1;
    bool _1454 = _1452 >= 0;
    int _1456 = 0;
    float _1458 = _1394;
    if (_1454)
    {
        float _1460 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1456 = as_type<int>(_1460);
    }
    int _1462 = _1456;
    float _1464 = fma(_1394, 6.2500002968590706586837768554688e-05, 0.5);
    float _1466 = fma(_1396, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4307 = float2(_1464, _1466);
    float2 _1470 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4307, float2(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4307, float2(0.0), isnan(_4307)), level(0.0)).xy;
    float _1472 = _1470.x;
    float _1474 = _1470.y;
    float _1476 = _1402 * _1392;
    float _1478 = fma(_1400, _1394, _1476);
    float _1480 = fma(_1404, _1396, _1478);
    float _1482 = _1406 + _1480;
    float _1484 = -_1482;
    bool _1486 = _1418 >= _1484;
    bool _1488 = isnan(_1418);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(_1484);
    bool _1494 = _1490 || _1492;
    float _1496 = -_1482;
    bool _1498 = _1420 >= _1496;
    bool _1500 = isnan(_1420);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(_1496);
    bool _1506 = _1502 || _1504;
    int _1508 = _1494 ? 0 : 1;
    int _1510 = 2;
    if (_1494)
    {
        _1510 = 1;
    }
    int _1512 = _1510;
    int _1514 = _1512;
    if (_1506)
    {
        _1514 = _1508;
    }
    int _1516 = _1514;
    int _1518 = _1516 << 6;
    int _1520 = _1518 + 96;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    float _1524 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1522)]);
    int _1526 = _1520 + 4;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    float _1530 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1528)]);
    int _1532 = _1520 + 8;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    float _1536 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1534)]);
    int _1538 = _1520 + 12;
    uint _1540 = uint(int(uint(_1538) >> uint(2)));
    float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
    int _1544 = _1518 + 48;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
    int _1550 = _1544 + 4;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    float _1554 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1552)]);
    int _1556 = _1544 + 8;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    float _1560 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1558)]);
    int _1562 = _1544 + 12;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    float _1566 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1564)]);
    float _1568 = _1426 * _1438;
    float _1570 = fma(_1436, _1394, _1568);
    float _1572 = fma(_1440, _1396, _1570);
    float _1574 = _1442 + _1572;
    int _1576 = _1518 + 64;
    float _1578 = trunc(_1574);
    int _1580 = int(_1578);
    uint _1582 = uint(int(uint(_1576) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    int _1586 = _1576 + 4;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1588)]);
    int _1592 = _1576 + 8;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    float _1596 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1594)]);
    int _1598 = _1576 + 12;
    uint _1600 = uint(int(uint(_1598) >> uint(2)));
    float _1602 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1600)]);
    bool _1604 = _1462 <= _1452;
    bool _1606 = !_1454;
    bool _1608 = _1604 || _1606;
    int _1610 = ~as_type<int>(_1422);
    int _1612 = _1580 + _1610;
    int _1614 = _1612 + 1;
    bool _1616 = _1614 < 0;
    bool _1618 = _1616 || _1608;
    int _1620 = _1518 + 80;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    float _1624 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1622)]);
    int _1626 = _1620 + 4;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    float _1630 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1628)]);
    int _1632 = _1620 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1634)]);
    int _1638 = _1620 + 12;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    float _1642 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1640)]);
    int _1644 = as_type<int>(_1422);
    if (!_1618)
    {
        float _1646 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1644 = as_type<int>(_1646);
    }
    int _1648 = _1644;
    float _1650 = _1426 * _1530;
    float _1652 = fma(_1524, _1394, _1650);
    float _1654 = fma(_1536, _1396, _1652);
    float _1656 = _1542 + _1654;
    float _1658 = _1426 * _1554;
    float _1660 = 1.0 / _1656;
    float _1662 = fma(_1548, _1394, _1658);
    float _1664 = fma(_1560, _1396, _1662);
    float _1666 = _1426 * _1590;
    float _1668 = fma(_1584, _1394, _1666);
    float _1670 = _1566 + _1664;
    float _1672 = fma(_1596, _1396, _1668);
    float _1674 = _1670 * _1660;
    float _1676 = _1602 + _1672;
    bool _1678 = _1674 >= 0.0;
    float _1680 = _1676 * _1660;
    bool _1682 = _1674 <= 1.0;
    bool _1684 = _1682 && _1678;
    bool _1686 = _1680 >= 0.0;
    bool _1688 = _1686 && _1684;
    bool _1690 = _1680 <= 1.0;
    bool _1692 = _1690 && _1688;
    float _1694 = _1426 * _1630;
    bool _1696 = _1648 <= _1614;
    bool _1698 = _1696 || _1618;
    float _1700 = fma(_1624, _1394, _1694);
    float _1702 = fma(_1636, _1396, _1700);
    float _1704 = _1584;
    float _1706 = _1668;
    float _1708 = _1624;
    if (_1692)
    {
        float _1710 = float(_1516);
        _1704 = _1710;
    }
    float _1712 = _1704;
    float _1714 = _1642 + _1702;
    if (_1698)
    {
        _1706 = 1.0;
    }
    float _1716 = _1706;
    float _1718 = _1716;
    if (!_1698)
    {
        float _1720 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1722 = _1614 * as_type<int>(_1720);
        int _1724 = _1722 + _1452;
        int _1726 = _1724 << 2;
        uint _1728 = uint(int(uint(_1724) >> uint(2)));
        int _1730 = 12 & _1726;
        int _1732 = int(_1728) << 4;
        int _1734 = _1732 + _1730;
        int _1736 = _1734 + 400;
        uint _1738 = uint(int(uint(_1736) >> uint(2)));
        float _1740 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1738)]);
        float _1742 = floor(_1574);
        float _1744 = floor(_1434);
        float _1746 = -_1742;
        float _1748 = _1574 + _1746;
        float _1750 = -_1744;
        float _1752 = _1434 + _1750;
        float _1754 = rint(_1740);
        float _1756 = precise::max(_1754, 0.0);
        uint _1758 = uint(_1756);
        uint _1760 = clamp(_1758, 0u, 65535u);
        float3 _4761 = float3(_1752, _1748, float(int(_1760)));
        float3 _4765 = select(_4761, float3(0.0), isnan(_4761));
        float _1762 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4765.xy, uint(rint(_4765.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4765.xy, uint(rint(_4765.z)), level(0.0)).x;
        int _1764 = _1724 << 4;
        int _1766 = _1764 + 2048;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        float _1770 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1768)]);
        int _1772 = _1766 + 4;
        uint _1774 = uint(int(uint(_1772) >> uint(2)));
        float _1776 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1774)]);
        int _1778 = _1766 + 8;
        uint _1780 = uint(int(uint(_1778) >> uint(2)));
        float _1782 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1780)]);
        int _1784 = _1766 + 12;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        float _1788 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1786)]);
        float _1790 = _1426 * _1776;
        float _1792 = fma(_1770, _1394, _1790);
        float _1794 = fma(_1782, _1396, _1792);
        float _1796 = _1788 + _1794;
        float _1798 = precise::clamp(_1796, 0.0, 1.0);
        float _1800 = -_1798;
        float _1802 = _1800 + _1762;
        float _1804 = fma(_1802, 500.0, 1.5);
        float _1806 = exp2(_1804);
        float _1808 = 0.0 + _1806;
        float _1810 = precise::clamp(_1808, 0.0, 1.0);
        _1458 = 500.0;
        _1708 = _1770;
        _1718 = _1810;
    }
    float _1812 = _1458;
    float _1814 = _1708;
    float _1816 = _1718;
    float _1818 = _1712;
    float _1820 = _1814;
    float _1822 = _1812;
    if (_1692)
    {
        float _1824 = rint(_1712);
        float _1826 = precise::max(_1824, 0.0);
        uint _1828 = uint(_1826);
        uint _1830 = clamp(_1828, 0u, 65535u);
        _1818 = as_type<float>(_1830);
    }
    float _1832 = _1818;
    float _1834 = _1714 * _1660;
    bool _1836 = _1472 != 0.0;
    bool _1838 = isnan(_1472);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan(0.0);
    bool _1844 = _1840 || _1842;
    uint _1846 = uint(int(uint(_168) >> uint(2)));
    float _1848 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1846)]);
    if (!_1692)
    {
        _1820 = 1.0;
    }
    float _1850 = _1820;
    float _1852 = _1680;
    float _1854 = _1850;
    if (_1692)
    {
        float3 _4901 = float3(_1674, _1680, float(as_type<int>(_1832)));
        float3 _4903 = select(_4901, float3(0.0), isnan(_4901));
        float _1856 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4903.xy, uint(rint(_4903.z)), _1834, level(0.0));
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (!_1844)
    {
        _1822 = 4.0;
    }
    float _1860 = _1822;
    float _1862 = _1474;
    if (!_1844)
    {
        float2 _4922 = float2(_1464, _1466);
        float _1864 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4922, float2(0.0), isnan(_4922)), level(_1860)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4922, float2(0.0), isnan(_4922)), level(_1860)).y;
        _1862 = _1864;
    }
    float _1866 = _1862;
    bool _1868 = _614 > 0.001000000047497451305389404296875;
    bool _1870 = isnan(_614);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan(0.001000000047497451305389404296875);
    bool _1876 = _1872 || _1874;
    if (_1692)
    {
        bool _1878 = _1858 >= _1834;
        bool _1880 = isnan(_1858);
        bool _1882 = _1878 || _1880;
        bool _1884 = isnan(_1834);
        bool _1886 = _1882 || _1884;
        float _1888 = float(_1886);
        _1854 = _1888;
    }
    float _1890 = _1854;
    float _1892 = -_1890;
    float _1894 = fma(_1892, _1816, 1.0);
    float _1896 = -_1848;
    float _1898 = _1894 + _1896;
    float _1900 = _1894;
    if (_1876)
    {
        float _1902 = fma(_1898, 0.0500000007450580596923828125, _1848);
        _1900 = _1902;
    }
    float _1904 = _1900;
    float _1906 = precise::max(0.0, _1904);
    float _1908 = precise::min(_1906, 0.999000012874603271484375);
    uint _1910 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1910)] = as_type<uint>(_1908);
    int _1912 = as_type<int>(_1890);
    if (!_1876)
    {
        float _1914 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1912 = as_type<int>(_1914);
    }
    int _1916 = _1912;
    int _1918 = _168 + 4;
    int _1920 = _168 + 8;
    float _1922 = -_172;
    float _1924 = _1922 + _1116;
    float _1926 = -_178;
    float _1928 = _1926 + _1114;
    float _1930 = -_184;
    float _1932 = _1930 + _1118;
    float _1934 = _1928 * _1928;
    float _1936 = fma(_1924, _1924, _1934);
    float _1938 = fma(_1932, _1932, _1936);
    int _1940 = _1916;
    if (!_1876)
    {
        float _1942 = fma(_1866, 2000.0, as_type<float>(_1916));
        _1940 = as_type<int>(_1942);
    }
    int _1944 = _1940;
    if (!_1876)
    {
        uint _1946 = uint(int(uint(_1918) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1946)] = uint(_1944);
    }
    uint _1948 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1948)] = as_type<uint>(_562);
    uint _1950 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1950)] = as_type<uint>(_1116);
    uint _1952 = uint(int(uint(_1918) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1952)] = as_type<uint>(_1114);
    uint _1954 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1954)] = as_type<uint>(_1118);
    uint _1956 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1956)] = as_type<uint>(_666);
    uint _1958 = uint(int(uint(_1918) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1958)] = as_type<uint>(_668);
    uint _1960 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_1960)] = as_type<uint>(_676);
    uint _1962 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1962)] = as_type<uint>(_1924);
    uint _1964 = uint(int(uint(_1918) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1964)] = as_type<uint>(_1928);
    uint _1966 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1966)] = as_type<uint>(_1932);
    float _1968 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _1970 = sqrt(_1938);
    float _1972 = _668 * _668;
    float _1974 = fma(_666, _666, _1972);
    float _1976 = fma(_676, _676, _1974);
    float _1978 = sqrt(_1976);
    bool _1980 = _1970 >= 9.9999999747524270787835121154785e-07;
    bool _1982 = isnan(_1970);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(9.9999999747524270787835121154785e-07);
    bool _1988 = _1984 || _1986;
    if (!_1988)
    {
        bool _1990 = _550 != _298;
        bool _1992 = isnan(_550);
        bool _1994 = _1990 || _1992;
        bool _1996 = isnan(_298);
        bool _1998 = _1994 || _1996;
        _2000 = _1998;
        if (!_2000)
        {
            float _2002 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2004 = _2002 > 0.0;
            bool _2006 = !_2004;
            if (!_2006)
            {
                float _2008 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2010 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2012 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2014 = _2010 * _514;
                float _2016 = _2010 * _512;
                float _2018 = _2010 * _516;
                float _2020 = fma(_2008, _520, _2014);
                float _2022 = fma(_2008, _518, _2016);
                float _2024 = fma(_2008, _522, _2018);
                float _2026 = fma(_2012, _526, _2020);
                float _2028 = fma(_2012, _524, _2022);
                float _2030 = fma(_2012, _528, _2024);
                float _2032 = _2026 * _2026;
                float _2034 = fma(_2028, _2028, _2032);
                float _2036 = fma(_2030, _2030, _2034);
                float _2038 = rsqrt(_2036);
                float _2040 = _2038 * 9.9999999747524270787835121154785e-07;
                float _2042 = _2028 * _2040;
                float _2044 = _2026 * _2040;
                float _2046 = _2030 * _2040;
                _332 = as_type<int>(_2042);
                _334 = as_type<int>(_2044);
                _336 = as_type<int>(_2046);
                _2000 = true;
            }
            else
            {
                bool _2048 = _1978 >= 9.9999999747524270787835121154785e-07;
                bool _2050 = isnan(_1978);
                bool _2052 = _2048 || _2050;
                bool _2054 = isnan(9.9999999747524270787835121154785e-07);
                bool _2056 = _2052 || _2054;
                if (!_2056)
                {
                    float _2058 = _1114 * _1114;
                    float _2060 = fma(_1116, _1116, _2058);
                    float _2062 = fma(_1118, _1118, _2060);
                    float _2064 = sqrt(_2062);
                    bool _2066 = _2064 >= 9.9999999747524270787835121154785e-07;
                    bool _2068 = isnan(_2064);
                    bool _2070 = _2066 || _2068;
                    bool _2072 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2074 = _2070 || _2072;
                    float _2076 = _2064;
                    if (_2074)
                    {
                        float _2078 = rsqrt(_2062);
                        _2076 = _2078;
                    }
                    float _2080 = _2076;
                    if (!_2074)
                    {
                        _320 = 0;
                    }
                    int _2082 = _320;
                    int _2084 = _2082;
                    if (!_2074)
                    {
                        _322 = 897988541;
                    }
                    int _2086 = _322;
                    int _2088 = _2086;
                    if (!_2074)
                    {
                        _324 = 0;
                    }
                    int _2090 = _324;
                    float _2092 = _2080;
                    int _2094 = _2090;
                    if (_2074)
                    {
                        float _2096 = _2080 * 9.9999999747524270787835121154785e-07;
                        _2092 = _2096;
                    }
                    float _2098 = _2092;
                    if (_2074)
                    {
                        float _2100 = _1116 * _2098;
                        _2084 = as_type<int>(_2100);
                    }
                    int _2102 = _2084;
                    _332 = _2102;
                    if (_2074)
                    {
                        float _2104 = _1114 * _2098;
                        _2088 = as_type<int>(_2104);
                    }
                    int _2106 = _2088;
                    _334 = _2106;
                    if (_2074)
                    {
                        float _2108 = _1118 * _2098;
                        _2094 = as_type<int>(_2108);
                    }
                    int _2110 = _2094;
                    _336 = _2110;
                    _2000 = true;
                }
                else
                {
                    float _2112 = rsqrt(_1976);
                    float _2114 = _2112 * 9.9999999747524270787835121154785e-07;
                    float _2116 = _666 * _2114;
                    float _2118 = _668 * _2114;
                    float _2120 = _676 * _2114;
                    _332 = as_type<int>(_2116);
                    _334 = as_type<int>(_2118);
                    _336 = as_type<int>(_2120);
                    _2000 = true;
                }
            }
        }
    }
    else
    {
        float _2122 = _1978 * _1968;
        bool _2124 = _2122 >= 0.001000000047497451305389404296875;
        bool _2126 = isnan(_2122);
        bool _2128 = _2124 || _2126;
        bool _2130 = isnan(0.001000000047497451305389404296875);
        bool _2132 = _2128 || _2130;
        bool _2134 = _2122 > 0.0;
        bool _2136 = !_2132;
        bool _2138 = _2134 && _2136;
        bool _2140 = _1970 < 0.001000000047497451305389404296875;
        bool _2142 = _2140 && _2138;
        if (!_2142)
        {
            _326 = as_type<int>(_1924);
        }
        int _2144 = _326;
        int _2146 = _2144;
        if (_2142)
        {
            float _2148 = _666 * _1968;
            _2146 = as_type<int>(_2148);
        }
        int _2150 = _2146;
        _332 = _2150;
        if (!_2142)
        {
            _328 = as_type<int>(_1928);
        }
        int _2152 = _328;
        int _2154 = _2152;
        if (_2142)
        {
            float _2156 = _668 * _1968;
            _2154 = as_type<int>(_2156);
        }
        int _2158 = _2154;
        _334 = _2158;
        if (!_2142)
        {
            _330 = as_type<int>(_1932);
        }
        int _2160 = _330;
        _336 = _2160;
        if (_2142)
        {
            float _2162 = _676 * _1968;
            _336 = as_type<int>(_2162);
        }
    }
    _2000 = false;
    int _2164 = _332;
    int _2166 = _334;
    int _2168 = _336;
    uint _2170 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2170)] = uint(_2164);
    uint _2172 = uint(int(uint(_1918) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2172)] = uint(_2166);
    uint _2174 = uint(int(uint(_1920) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2174)] = uint(_2168);
}

