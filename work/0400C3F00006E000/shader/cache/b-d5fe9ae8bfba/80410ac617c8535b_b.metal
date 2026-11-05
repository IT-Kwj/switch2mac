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
    bool _2266 = false;
    bool _810 = false;
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
    uint _208 = uint(int(uint(_168) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_208)]);
    int _212 = _168 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_214)]);
    int _218 = _168 + 8;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_220)]);
    float _224 = 0.0;
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = _166;
    if (_188)
    {
        float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _234 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _224 = _232;
        _226 = _234;
        _228 = _236;
    }
    float _238 = _224;
    float _240 = _226;
    float _242 = _228;
    float _244 = 0.0;
    float _246 = 0.0;
    float _248 = 0.0;
    if (_188)
    {
        float _250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _244 = _250;
        _246 = _252;
        _248 = _254;
    }
    float _256 = _244;
    float _258 = _246;
    float _260 = _248;
    float _262 = 0.0;
    float _264 = 0.0;
    float _266 = 0.0;
    if (_188)
    {
        float _268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _262 = _268;
        _264 = _270;
        _266 = _272;
    }
    float _274 = _262;
    float _276 = _264;
    float _278 = _266;
    uint _280 = uint(int(uint(_168) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_280)]);
    uint _284 = uint(int(uint(_190) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_284)]);
    uint _288 = uint(int(uint(_190) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_288)]);
    float _292 = _256;
    float _294 = _258;
    float _296 = _260;
    float _298 = _238;
    float _300 = _240;
    float _302 = _242;
    float _304 = _274;
    float _306 = _276;
    float _308 = _278;
    float _310 = _194;
    float _312 = _200;
    float _314 = _206;
    int _316 = as_type<int>(_210);
    int _318 = as_type<int>(_216);
    int _320 = as_type<int>(_222);
    int _322 = as_type<int>(_210);
    int _324 = as_type<int>(_216);
    int _326 = as_type<int>(_222);
    int _328 = as_type<int>(_210);
    int _330 = as_type<int>(_216);
    int _332 = as_type<int>(_222);
    if (!_188)
    {
        int _334 = _168 + 4;
        uint _336 = uint(int(uint(_168) >> uint(2)));
        float _338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_336)]);
        int _340 = _168 + 8;
        uint _342 = uint(int(uint(_168) >> uint(2)));
        float _344 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_342)]);
        uint _346 = uint(int(uint(_334) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        uint _350 = uint(int(uint(_340) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_334) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_340) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_168) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_334) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_366)]);
        uint _370 = uint(int(uint(_340) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        float _374 = _338 * _338;
        float _376 = fma(_344, _344, _374);
        float _378 = _348 * _348;
        float _380 = _352 * _352;
        float _382 = fma(_356, _356, _378);
        float _384 = fma(_360, _360, _380);
        float _386 = fma(_364, _364, _376);
        float _388 = fma(_368, _368, _382);
        float _390 = sqrt(_386);
        float _392 = fma(_372, _372, _384);
        float _394 = sqrt(_388);
        float _396 = sqrt(_392);
        bool _398 = _390 > 0.0;
        bool _400 = _394 > 0.0;
        bool _402 = _396 > 0.0;
        float _404 = _384;
        float _406 = _382;
        float _408 = _376;
        float _410 = _390;
        float _412 = _394;
        float _414 = _396;
        float _416 = _386;
        float _418 = _348;
        float _420 = _364;
        float _422 = _388;
        if (_398)
        {
            float _424 = rsqrt(_386);
            _404 = _424;
        }
        float _426 = _404;
        float _428 = 0.0;
        if (_400)
        {
            float _430 = rsqrt(_388);
            _428 = _430;
        }
        float _432 = _428;
        float _434 = 0.0;
        if (_402)
        {
            float _436 = rsqrt(_392);
            _434 = _436;
        }
        float _438 = _434;
        if (!_398)
        {
            _406 = 0.0;
        }
        float _440 = _406;
        float _442 = _440;
        if (_398)
        {
            float _444 = _364 * _426;
            _442 = _444;
        }
        float _446 = _442;
        _304 = _446;
        if (!_400)
        {
            _408 = 0.0;
        }
        float _448 = _408;
        float _450 = _448;
        if (!_398)
        {
            _410 = 0.0;
        }
        float _452 = _410;
        float _454 = _452;
        if (_398)
        {
            float _456 = _338 * _426;
            _454 = _456;
        }
        float _458 = _454;
        _292 = _458;
        if (!_398)
        {
            _412 = 0.0;
        }
        float _460 = _412;
        float _462 = _460;
        if (_400)
        {
            float _464 = _348 * _432;
            _450 = _464;
        }
        float _466 = _450;
        _294 = _466;
        if (!_400)
        {
            _414 = 0.0;
        }
        float _468 = _414;
        float _470 = _468;
        if (_398)
        {
            float _472 = _344 * _426;
            _462 = _472;
        }
        float _474 = _462;
        _298 = _474;
        if (!_400)
        {
            _416 = 0.0;
        }
        float _476 = _416;
        float _478 = _476;
        if (_400)
        {
            float _480 = _356 * _432;
            _470 = _480;
        }
        float _482 = _470;
        _300 = _482;
        if (!_402)
        {
            _418 = 0.0;
        }
        float _484 = _418;
        float _486 = _484;
        if (_400)
        {
            float _488 = _368 * _432;
            _478 = _488;
        }
        float _490 = _478;
        _306 = _490;
        if (!_402)
        {
            _420 = 0.0;
        }
        float _492 = _420;
        float _494 = _492;
        if (_402)
        {
            float _496 = _352 * _438;
            _486 = _496;
        }
        float _498 = _486;
        _296 = _498;
        if (!_402)
        {
            _422 = 0.0;
        }
        float _500 = _422;
        _308 = _500;
        if (_402)
        {
            float _502 = _360 * _438;
            _494 = _502;
        }
        float _504 = _494;
        _302 = _504;
        if (_402)
        {
            float _506 = _372 * _438;
            _308 = _506;
        }
    }
    float _508 = _292;
    float _510 = _294;
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _554 = uint(int(uint(_190) >> uint(2)));
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_554)]);
    bool _558 = _528 > 0.0;
    float _560 = abs(_526);
    float _562 = log2(_560);
    bool _564 = _530 > 0.0;
    float _566 = 0.0;
    float _568 = _532;
    float _570 = _528;
    float _572 = _534;
    bool _574 = _564;
    float _576 = _546;
    float _578 = _548;
    float _580 = _550;
    float _582 = _552;
    float _584 = _544;
    if (_558)
    {
        float _586 = 1.0 / _528;
        _566 = _586;
    }
    float _588 = _566;
    float _590 = _532 * _530;
    float _592 = _536 * _540;
    float _594 = _534 * _540;
    float _596 = -_290;
    float _598 = _542 + _596;
    if (_564)
    {
        float _600 = -_590;
        float _602 = fma(_282, _600, _532);
        _568 = _602;
    }
    float _604 = _568;
    float _606 = _544 * _562;
    float _608 = _538 * _540;
    float _610 = _592 * _508;
    float _612 = _592 * _510;
    float _614 = exp2(_606);
    float _616 = _604;
    if (_558)
    {
        float _618 = _598 * _588;
        _570 = _618;
    }
    float _620 = _570;
    float _622 = _592 * _512;
    float _624 = fma(_594, _514, _610);
    float _626 = fma(_594, _516, _612);
    float _628 = _626;
    if (_558)
    {
        float _630 = precise::min(_620, 1.0);
        _572 = _630;
    }
    float _632 = _572;
    float _634 = fma(_594, _518, _622);
    float _636 = fma(_608, _520, _624);
    float _638 = fma(_608, _522, _626);
    float _640 = fma(_608, _524, _634);
    if (_558)
    {
        float _642 = _632 * _604;
        _616 = _642;
    }
    float _644 = _616;
    float _646 = _544 * _636;
    float _648 = _544 * _638;
    float _650 = _286 * _544;
    float _652 = _544 * _640;
    float _654 = _544 * _644;
    float _656 = fma(_194, _614, _646);
    float _658 = fma(_200, _614, _648);
    float _660 = fma(_194, _650, _172);
    float _662 = fma(_200, _650, _178);
    float _664 = fma(_206, _650, _184);
    float _666 = fma(_206, _614, _652);
    float _668 = _546 * _654;
    float _670 = _548 * _654;
    float _672 = _550 * _654;
    bool _674 = !_188;
    float _676 = _652;
    float _678 = _654;
    float _680 = _668;
    float _682 = _672;
    int _684 = as_type<int>(_556);
    float _806;
    float _808;
    if (!_674)
    {
        float _686 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _688 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _690 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _692 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _704 = _690 * _692;
        float _706 = _690 * _694;
        float _708 = _688 * _692;
        float _710 = -_704;
        float _712 = fma(_686, _696, _710);
        float _714 = -_706;
        float _716 = fma(_688, _696, _714);
        float _718 = -_708;
        float _720 = fma(_686, _694, _718);
        float _722 = _700 * _686;
        float _724 = _700 * _712;
        float _726 = _702 * _688;
        float _728 = _698 * _694;
        float _730 = -_722;
        float _732 = fma(_698, _688, _730);
        float _734 = -_724;
        float _736 = fma(_698, _716, _734);
        float _738 = _700 * _696;
        float _740 = _702 * _692;
        float _742 = _698 * _690;
        float _744 = fma(_702, _720, _736);
        float _746 = -_738;
        float _748 = fma(_702, _694, _746);
        float _750 = -_740;
        float _752 = fma(_698, _696, _750);
        float _754 = -_728;
        float _756 = fma(_700, _692, _754);
        float _758 = -_742;
        float _760 = fma(_702, _686, _758);
        float _762 = -_686;
        float _764 = fma(_762, _696, _704);
        float _766 = 1.0 / _744;
        float _768 = -_726;
        float _770 = fma(_700, _690, _768);
        float _772 = _748 * _766;
        float _774 = _752 * _766;
        float _776 = _756 * _766;
        float _778 = _668 * _766;
        float _780 = _670 * _772;
        float _782 = _670 * _774;
        float _784 = _764 * _766;
        float _786 = _670 * _776;
        float _788 = _770 * _766;
        float _790 = _760 * _766;
        float _792 = fma(_716, _778, _780);
        float _794 = fma(_668, _784, _782);
        float _796 = _732 * _766;
        float _798 = fma(_720, _778, _786);
        float _800 = fma(_672, _788, _792);
        float _802 = fma(_672, _790, _794);
        float _804 = fma(_672, _796, _798);
        _576 = _778;
        _578 = _694;
        _580 = _696;
        _582 = _704;
        _310 = _790;
        _312 = _794;
        _314 = _792;
        _678 = _798;
        _584 = _698;
        _230 = _700;
        _628 = _702;
        _806 = _766;
        _808 = _802;
        _680 = _800;
        _682 = _804;
        _810 = true;
    }
    else
    {
        int _812 = as_type<int>(_166) & 1024;
        bool _814 = _812 != 0;
        if (_814)
        {
            _574 = true;
        }
        bool _816 = _574;
        bool _818 = _816;
        if (!_814)
        {
            int _820 = as_type<int>(_166) & 2048;
            bool _822 = _820 != 0;
            _818 = _822;
        }
        bool _824 = _818;
        if (!_824)
        {
            _676 = _670;
        }
        float _826 = _676;
        bool _828 = !_824;
        _806 = 0.0;
        _808 = _826;
        if (!_828)
        {
            uint _830 = uint(int(uint(_168) >> uint(2)));
            float _832 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_830)]);
            int _834 = _168 + 4;
            uint _836 = uint(int(uint(_834) >> uint(2)));
            float _838 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_836)]);
            int _840 = _168 + 8;
            uint _842 = uint(int(uint(_840) >> uint(2)));
            float _844 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_842)]);
            uint _846 = uint(int(uint(_168) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_846)]);
            int _850 = _168 + 4;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_852)]);
            int _856 = _168 + 8;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_858)]);
            uint _862 = uint(int(uint(_168) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_862)]);
            int _866 = _168 + 4;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_868)]);
            int _872 = _168 + 8;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_874)]);
            float _878 = _844 * _848;
            float _880 = _844 * _854;
            float _882 = _838 * _848;
            float _884 = -_878;
            float _886 = fma(_832, _860, _884);
            float _888 = -_880;
            float _890 = fma(_838, _860, _888);
            float _892 = -_882;
            float _894 = fma(_832, _854, _892);
            float _896 = _870 * _832;
            float _898 = _870 * _886;
            float _900 = _876 * _838;
            float _902 = _864 * _854;
            float _904 = -_896;
            float _906 = fma(_864, _838, _904);
            float _908 = -_898;
            float _910 = fma(_864, _890, _908);
            float _912 = _870 * _860;
            float _914 = _876 * _848;
            float _916 = _864 * _844;
            float _918 = fma(_876, _894, _910);
            float _920 = -_912;
            float _922 = fma(_876, _854, _920);
            float _924 = -_914;
            float _926 = fma(_864, _860, _924);
            float _928 = -_902;
            float _930 = fma(_870, _848, _928);
            float _932 = -_916;
            float _934 = fma(_876, _832, _932);
            float _936 = -_832;
            float _938 = fma(_936, _860, _878);
            float _940 = 1.0 / _918;
            float _942 = -_900;
            float _944 = fma(_870, _844, _942);
            float _946 = _922 * _940;
            float _948 = _926 * _940;
            float _950 = _930 * _940;
            float _952 = _668 * _940;
            float _954 = _670 * _946;
            float _956 = _670 * _948;
            float _958 = _938 * _940;
            float _960 = _670 * _950;
            float _962 = _944 * _940;
            float _964 = _934 * _940;
            float _966 = fma(_890, _952, _954);
            float _968 = fma(_668, _958, _956);
            float _970 = _906 * _940;
            float _972 = fma(_894, _952, _960);
            float _974 = fma(_672, _962, _966);
            float _976 = fma(_672, _964, _968);
            float _978 = fma(_672, _970, _972);
            _576 = _952;
            _578 = _854;
            _580 = _860;
            _582 = _878;
            _310 = _964;
            _312 = _968;
            _314 = _966;
            _678 = _972;
            _584 = _864;
            _230 = _870;
            _628 = _876;
            _806 = _940;
            _808 = _976;
            _680 = _974;
            _682 = _978;
        }
    }
    _810 = false;
    float _980 = _576;
    float _982 = _578;
    float _984 = _580;
    float _986 = _582;
    float _988 = _310;
    float _990 = _312;
    float _992 = _314;
    float _994 = _678;
    float _996 = _584;
    float _998 = _230;
    float _1000 = _628;
    float _1002 = _806;
    float _1004 = _808;
    float _1006 = _680;
    float _1008 = _682;
    uint _1010 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1010)] = as_type<uint>(_556);
    float _1012 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1014 = as_type<int>(_1012) & 512;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>(_1012) & 1024;
    bool _1020 = _1018 != 0;
    float _1022 = _980;
    float _1024 = _982;
    float _1026 = _984;
    float _1028 = _986;
    float _1030 = _1008;
    float _1032 = _1006;
    if (_1016)
    {
        float _1034 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1022 = _1034;
        _1024 = _1036;
        _1026 = _1038;
        _1028 = _1040;
    }
    float _1042 = _1022;
    float _1044 = _1024;
    float _1046 = _1026;
    float _1048 = _1028;
    float _1050 = _988;
    float _1052 = _990;
    float _1054 = _992;
    float _1056 = _994;
    if (_1016)
    {
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1060 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1050 = _1058;
        _1052 = _1060;
        _1054 = _1062;
        _1056 = _1064;
    }
    float _1066 = _1050;
    float _1068 = _1052;
    float _1070 = _1054;
    float _1072 = _1056;
    float _1074 = _996;
    float _1076 = _998;
    float _1078 = _1000;
    float _1080 = _1002;
    if (_1016)
    {
        float _1082 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1084 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1074 = _1082;
        _1076 = _1084;
        _1078 = _1086;
        _1080 = _1088;
    }
    float _1090 = _1074;
    float _1092 = _1076;
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _662 + _1004;
    float _1100 = _660 + _1006;
    float _1102 = _664 + _1008;
    if (!_1016)
    {
        _1030 = 0.0;
    }
    float _1104 = _1030;
    int _1106 = as_type<int>(_1012) & 2048;
    bool _1108 = _1106 != 0;
    float _1110 = _1044;
    float _1112 = _1042;
    float _1114 = _1104;
    if (_1016)
    {
        float _1116 = _1098 * _1044;
        _1110 = _1116;
    }
    float _1118 = _1110;
    float _1120 = _1092;
    float _1122 = _1066;
    float _1124 = _1070;
    float _1126 = _1094;
    float _1128 = _1096;
    if (_1016)
    {
        float _1130 = _1098 * _1068;
        _1032 = _1130;
    }
    float _1132 = _1032;
    float _1134 = _1132;
    if (_1016)
    {
        float _1136 = fma(_1100, _1042, _1118);
        _1112 = _1136;
    }
    float _1138 = _1112;
    float _1140 = _1138;
    if (_1016)
    {
        float _1142 = _1098 * _1092;
        _1120 = _1142;
    }
    float _1144 = _1120;
    float _1146 = _1144;
    if (_1016)
    {
        float _1148 = fma(_1100, _1066, _1132);
        _1122 = _1148;
    }
    float _1150 = _1122;
    float _1152 = _1150;
    if (_1016)
    {
        float _1154 = fma(_1102, _1046, _1138);
        _1140 = _1154;
    }
    float _1156 = _1140;
    if (_1016)
    {
        float _1158 = fma(_1100, _1090, _1144);
        _1146 = _1158;
    }
    float _1160 = _1146;
    if (_1016)
    {
        float _1162 = fma(_1102, _1070, _1150);
        _1124 = _1162;
    }
    float _1164 = _1124;
    if (!_1016)
    {
        _1152 = 0.0;
    }
    float _1166 = _1152;
    float _1168 = _1166;
    if (_1016)
    {
        float _1170 = _1048 + _1156;
        _1168 = _1170;
    }
    float _1172 = _1168;
    if (_1016)
    {
        float _1174 = fma(_1102, _1094, _1160);
        _1126 = _1174;
    }
    float _1176 = _1126;
    if (!_1016)
    {
        _1134 = 0.0;
    }
    float _1178 = _1134;
    float _1180 = _1178;
    if (_1016)
    {
        float _1182 = _1072 + _1164;
        _1114 = _1182;
    }
    float _1184 = _1114;
    float _1186 = _1184;
    if (_1016)
    {
        float _1188 = _1096 + _1176;
        _1180 = _1188;
    }
    float _1190 = _1180;
    float _1192 = _1190;
    if (!_1020)
    {
        _1128 = _1172;
    }
    float _1194 = _1128;
    bool _1196 = !_1020;
    float _1198 = _1194;
    if (!_1196)
    {
        float _1200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1202 = uint(int(uint(_168) >> uint(2)));
        float _1204 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1202)]);
        int _1206 = _168 + 4;
        uint _1208 = uint(int(uint(_1206) >> uint(2)));
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1208)]);
        int _1212 = _168 + 8;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1214)]);
        uint _1218 = uint(int(uint(_168) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1218)]);
        int _1222 = _168 + 4;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1224)]);
        int _1228 = _168 + 8;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1230)]);
        uint _1234 = uint(int(uint(_168) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1234)]);
        int _1238 = _168 + 4;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1240)]);
        int _1244 = _168 + 8;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1246)]);
        float _1250 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1254 = _1098 * _1210;
        float _1256 = _1098 * _1226;
        float _1258 = _1098 * _1242;
        float _1260 = fma(_1100, _1204, _1254);
        float _1262 = fma(_1100, _1220, _1256);
        float _1264 = fma(_1100, _1236, _1258);
        float _1266 = fma(_1102, _1216, _1260);
        float _1268 = fma(_1102, _1232, _1262);
        float _1270 = fma(_1102, _1248, _1264);
        float _1272 = _1200 + _1266;
        float _1274 = _1250 + _1268;
        float _1276 = _1252 + _1270;
        _1198 = _1276;
        _1192 = _1274;
        _1186 = _1272;
    }
    float _1278 = _1198;
    float _1280 = _1192;
    float _1282 = _1186;
    bool _1284 = !_1108;
    float _1286 = _1280;
    float _1288 = _1282;
    float _1290 = _1278;
    if (!_1284)
    {
        uint _1292 = uint(int(uint(_168) >> uint(2)));
        float _1294 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1292)]);
        int _1296 = _168 + 4;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        float _1300 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1298)]);
        int _1302 = _168 + 8;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        float _1306 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1304)]);
        int _1308 = _168 + 12;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1310)]);
        uint _1314 = uint(int(uint(_168) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        int _1318 = _168 + 4;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1320)]);
        int _1324 = _168 + 8;
        uint _1326 = uint(int(uint(_1324) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1326)]);
        int _1330 = _168 + 12;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1332)]);
        uint _1336 = uint(int(uint(_168) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1336)]);
        int _1340 = _168 + 4;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1342)]);
        int _1346 = _168 + 8;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1348)]);
        int _1352 = _168 + 12;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        float _1356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1354)]);
        float _1358 = _1098 * _1300;
        float _1360 = _1098 * _1322;
        float _1362 = fma(_1100, _1294, _1358);
        float _1364 = _1098 * _1344;
        float _1366 = fma(_1100, _1316, _1360);
        float _1368 = fma(_1100, _1338, _1364);
        float _1370 = fma(_1102, _1306, _1362);
        float _1372 = fma(_1102, _1328, _1366);
        float _1374 = fma(_1102, _1350, _1368);
        float _1376 = _1370 + _1312;
        float _1378 = _1372 + _1334;
        float _1380 = _1374 + _1356;
        _1286 = _1376;
        _1288 = _1378;
        _1290 = _1380;
    }
    float _1382 = _1286;
    float _1384 = _1288;
    float _1386 = _1290;
    float _1388 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1390 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1414 = _1388 + 1.0;
    float _1416 = _1414 + _1382;
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1426 = _1416 * _1400;
    float _1428 = fma(_1398, _1384, _1426);
    float _1430 = fma(_1402, _1386, _1428);
    float _1432 = _1404 + _1430;
    float _1434 = trunc(_1432);
    int _1436 = int(_1434);
    int _1438 = ~as_type<int>(_1406);
    int _1440 = _1436 + _1438;
    int _1442 = _1440 + 1;
    bool _1444 = _1442 >= 0;
    int _1446 = 0;
    float _1448 = _1384;
    if (_1444)
    {
        float _1450 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1446 = as_type<int>(_1450);
    }
    int _1452 = _1446;
    float _1454 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.5);
    float _1456 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4559 = float2(_1454, _1456);
    float _1458 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4559, float2(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4559, float2(0.0), isnan(_4559)), level(0.0)).x;
    float _1460 = _1392 * _1382;
    float _1462 = fma(_1390, _1384, _1460);
    float _1464 = fma(_1394, _1386, _1462);
    float _1466 = _1396 + _1464;
    float _1468 = -_1466;
    bool _1470 = _1408 >= _1468;
    bool _1472 = isnan(_1408);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan(_1468);
    bool _1478 = _1474 || _1476;
    float _1480 = -_1466;
    bool _1482 = _1410 >= _1480;
    bool _1484 = isnan(_1410);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan(_1480);
    bool _1490 = _1486 || _1488;
    int _1492 = _1478 ? 0 : 1;
    int _1494 = 2;
    float _1496 = _1454;
    float _1498 = _1456;
    if (_1478)
    {
        _1494 = 1;
    }
    int _1500 = _1494;
    int _1502 = _1500;
    if (_1490)
    {
        _1502 = _1492;
    }
    int _1504 = _1502;
    int _1506 = _1504 << 6;
    int _1508 = _1506 + 96;
    uint _1510 = uint(int(uint(_1508) >> uint(2)));
    float _1512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1510)]);
    int _1514 = _1508 + 4;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1516)]);
    int _1520 = _1508 + 8;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    float _1524 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1522)]);
    int _1526 = _1508 + 12;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    float _1530 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1528)]);
    int _1532 = _1506 + 48;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    float _1536 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1534)]);
    int _1538 = _1532 + 4;
    uint _1540 = uint(int(uint(_1538) >> uint(2)));
    float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
    int _1544 = _1532 + 8;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
    int _1550 = _1532 + 12;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    float _1554 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1552)]);
    float _1556 = _1416 * _1420;
    float _1558 = fma(_1418, _1384, _1556);
    float _1560 = fma(_1422, _1386, _1558);
    float _1562 = _1424 + _1560;
    int _1564 = _1506 + 64;
    float _1566 = trunc(_1562);
    int _1568 = int(_1566);
    uint _1570 = uint(int(uint(_1564) >> uint(2)));
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1570)]);
    int _1574 = _1564 + 4;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    int _1580 = _1564 + 8;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    int _1586 = _1564 + 12;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1588)]);
    int _1592 = _1506 + 80;
    bool _1594 = _1452 <= _1442;
    bool _1596 = !_1444;
    bool _1598 = _1594 || _1596;
    int _1600 = ~as_type<int>(_1412);
    int _1602 = _1568 + _1600;
    int _1604 = _1602 + 1;
    uint _1606 = uint(int(uint(_1592) >> uint(2)));
    float _1608 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1606)]);
    int _1610 = _1592 + 4;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    float _1614 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1612)]);
    int _1616 = _1592 + 8;
    uint _1618 = uint(int(uint(_1616) >> uint(2)));
    float _1620 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1618)]);
    int _1622 = _1592 + 12;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    float _1626 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1624)]);
    bool _1628 = _1604 < 0;
    bool _1630 = _1628 || _1598;
    int _1632 = as_type<int>(_1412);
    float _1634 = _1536;
    if (!_1630)
    {
        float _1636 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1632 = as_type<int>(_1636);
    }
    int _1638 = _1632;
    float _1640 = _1416 * _1518;
    float _1642 = fma(_1512, _1384, _1640);
    float _1644 = fma(_1524, _1386, _1642);
    float _1646 = _1530 + _1644;
    float _1648 = _1416 * _1542;
    float _1650 = 1.0 / _1646;
    float _1652 = fma(_1536, _1384, _1648);
    float _1654 = fma(_1548, _1386, _1652);
    float _1656 = _1416 * _1578;
    float _1658 = fma(_1572, _1384, _1656);
    float _1660 = _1554 + _1654;
    float _1662 = fma(_1584, _1386, _1658);
    float _1664 = _1660 * _1650;
    float _1666 = _1590 + _1662;
    bool _1668 = _1664 >= 0.0;
    float _1670 = _1666 * _1650;
    bool _1672 = _1664 <= 1.0;
    bool _1674 = _1672 && _1668;
    bool _1676 = _1670 >= 0.0;
    bool _1678 = _1676 && _1674;
    bool _1680 = _1670 <= 1.0;
    bool _1682 = _1680 && _1678;
    float _1684 = _1416 * _1614;
    float _1686 = fma(_1608, _1384, _1684);
    bool _1688 = _1638 <= _1604;
    bool _1690 = _1688 || _1630;
    float _1692 = fma(_1620, _1386, _1686);
    float _1694 = _1572;
    float _1696 = _1686;
    float _1698 = _1692;
    float _1700 = _1670;
    float _1702 = _1664;
    if (_1682)
    {
        float _1704 = float(_1504);
        _1694 = _1704;
    }
    float _1706 = _1694;
    float _1708 = _1626 + _1692;
    if (_1690)
    {
        _1696 = 1.0;
    }
    float _1710 = _1696;
    float _1712 = _1710;
    if (!_1690)
    {
        float _1714 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1716 = _1604 * as_type<int>(_1714);
        int _1718 = _1716 + _1442;
        int _1720 = _1718 << 2;
        uint _1722 = uint(int(uint(_1718) >> uint(2)));
        int _1724 = 12 & _1720;
        int _1726 = int(_1722) << 4;
        int _1728 = _1726 + _1724;
        int _1730 = _1728 + 400;
        uint _1732 = uint(int(uint(_1730) >> uint(2)));
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1732)]);
        float _1736 = floor(_1562);
        float _1738 = floor(_1432);
        float _1740 = -_1736;
        float _1742 = _1562 + _1740;
        float _1744 = -_1738;
        float _1746 = _1432 + _1744;
        float _1748 = rint(_1734);
        float _1750 = precise::max(_1748, 0.0);
        uint _1752 = uint(_1750);
        uint _1754 = clamp(_1752, 0u, 65535u);
        float3 _5014 = float3(_1746, _1742, float(int(_1754)));
        float3 _5018 = select(_5014, float3(0.0), isnan(_5014));
        float _1756 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5018.xy, uint(rint(_5018.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5018.xy, uint(rint(_5018.z)), level(0.0)).x;
        int _1758 = _1718 << 4;
        int _1760 = _1758 + 2048;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1762)]);
        int _1766 = _1760 + 4;
        uint _1768 = uint(int(uint(_1766) >> uint(2)));
        float _1770 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1768)]);
        int _1772 = _1760 + 8;
        uint _1774 = uint(int(uint(_1772) >> uint(2)));
        float _1776 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1774)]);
        int _1778 = _1760 + 12;
        uint _1780 = uint(int(uint(_1778) >> uint(2)));
        float _1782 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1780)]);
        float _1784 = _1416 * _1770;
        float _1786 = fma(_1764, _1384, _1784);
        float _1788 = fma(_1776, _1386, _1786);
        float _1790 = _1782 + _1788;
        float _1792 = precise::clamp(_1790, 0.0, 1.0);
        float _1794 = -_1792;
        float _1796 = _1794 + _1756;
        float _1798 = fma(_1796, 500.0, 1.5);
        float _1800 = exp2(_1798);
        float _1802 = 0.0 + _1800;
        float _1804 = precise::clamp(_1802, 0.0, 1.0);
        _1634 = _1734;
        _1698 = _1800;
        _1712 = _1804;
    }
    float _1806 = _1634;
    float _1808 = _1698;
    float _1810 = _1712;
    float _1812 = _1706;
    float _1814 = _1806;
    float _1816 = _1808;
    if (_1682)
    {
        float _1818 = rint(_1706);
        float _1820 = precise::max(_1818, 0.0);
        uint _1822 = uint(_1820);
        uint _1824 = clamp(_1822, 0u, 65535u);
        _1812 = as_type<float>(_1824);
    }
    float _1826 = _1812;
    float _1828 = _1708 * _1650;
    bool _1830 = _1458 != 0.0;
    bool _1832 = isnan(_1458);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(0.0);
    bool _1838 = _1834 || _1836;
    uint _1840 = uint(int(uint(_168) >> uint(2)));
    float _1842 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1840)]);
    float _1844 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _1846 = fma(_1384, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _1848 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _1850 = fma(_1386, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _1852 = _1826;
    float _1854 = _1844;
    if (_1682)
    {
        float3 _5160 = float3(_1664, _1670, float(as_type<int>(_1826)));
        float3 _5162 = select(_5160, float3(0.0), isnan(_5160));
        float _1856 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5162.xy, uint(rint(_5162.z)), _1828, level(0.0));
        _1852 = _1856;
    }
    float _1858 = _1852;
    if (_1838)
    {
        _1814 = _1458;
    }
    float _1860 = _1814;
    if (!_1838)
    {
        _1448 = 4.0;
    }
    float _1862 = _1448;
    float _1864 = _1860;
    float _1866 = _1862;
    if (!_1838)
    {
        float2 _5187 = float2(_1454, _1456);
        float _1868 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5187, float2(0.0), isnan(_5187)), level(_1862)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5187, float2(0.0), isnan(_5187)), level(_1862)).x;
        _1864 = _1868;
    }
    float _1870 = _1864;
    float2 _5199 = float2(_1844, _1456);
    float _1872 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5199, float2(0.0), isnan(_5199)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5199, float2(0.0), isnan(_5199)), level(0.0)).x;
    float2 _5207 = float2(_1454, _1848);
    float _1874 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5207, float2(0.0), isnan(_5207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5207, float2(0.0), isnan(_5207)), level(0.0)).x;
    float2 _5215 = float2(_1846, _1456);
    float _1876 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5215, float2(0.0), isnan(_5215)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5215, float2(0.0), isnan(_5215)), level(0.0)).x;
    float2 _5223 = float2(_1454, _1850);
    float _1878 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5223, float2(0.0), isnan(_5223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5223, float2(0.0), isnan(_5223)), level(0.0)).x;
    if (!_1682)
    {
        _1816 = 1.0;
    }
    float _1880 = _1816;
    bool _1882 = _598 > 0.001000000047497451305389404296875;
    bool _1884 = isnan(_598);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.001000000047497451305389404296875);
    bool _1890 = _1886 || _1888;
    float _1892 = _1880;
    float _1894 = _1858;
    float _1896 = _1876;
    float _1898 = _1874;
    float _1900 = _1878;
    if (_1682)
    {
        bool _1902 = _1858 >= _1828;
        bool _1904 = isnan(_1858);
        bool _1906 = _1902 || _1904;
        bool _1908 = isnan(_1828);
        bool _1910 = _1906 || _1908;
        float _1912 = float(_1910);
        _1892 = _1912;
    }
    float _1914 = _1892;
    float _1916 = -_1914;
    float _1918 = fma(_1916, _1810, 1.0);
    float _1920 = -_1842;
    float _1922 = _1918 + _1920;
    float _1924 = _1918;
    uint _1926 = as_type<uint>(_1914);
    if (_1890)
    {
        float _1928 = fma(_1922, 0.0500000007450580596923828125, _1842);
        _1924 = _1928;
    }
    float _1930 = _1924;
    float _1932 = precise::max(0.0, _1930);
    float _1934 = precise::min(_1932, 0.999000012874603271484375);
    uint _1936 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1936)] = as_type<uint>(_1934);
    int _1938 = as_type<int>(_1922);
    if (!_1890)
    {
        float _1940 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1938 = as_type<int>(_1940);
    }
    int _1942 = _1938;
    if (!_1890)
    {
        int _1944 = _168 + 4;
        _1926 = uint(_1944);
    }
    uint _1946 = _1926;
    float _1948 = -_172;
    float _1950 = _1948 + _1100;
    float _1952 = -_178;
    float _1954 = _1952 + _1098;
    float _1956 = -_184;
    float _1958 = _1956 + _1102;
    int _1960 = _1942;
    if (!_1890)
    {
        float _1962 = fma(_1870, 2000.0, as_type<float>(_1942));
        _1960 = as_type<int>(_1962);
    }
    int _1964 = _1960;
    if (!_1890)
    {
        uint _1966 = uint(int(uint(int(_1946)) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1966)] = uint(_1964);
    }
    if (!_1890)
    {
        float2 _5374 = float2(_1844, _1848);
        float _1968 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5374, float2(0.0), isnan(_5374)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5374, float2(0.0), isnan(_5374)), level(0.0)).x;
        float2 _5382 = float2(_1844, _1850);
        float _1970 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5382, float2(0.0), isnan(_5382)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5382, float2(0.0), isnan(_5382)), level(0.0)).x;
        float2 _5390 = float2(_1846, _1848);
        float _1972 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).x;
        float2 _5398 = float2(_1846, _1850);
        float _1974 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5398, float2(0.0), isnan(_5398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5398, float2(0.0), isnan(_5398)), level(0.0)).x;
        bool _1976 = _1872 != 0.0;
        bool _1978 = isnan(_1872);
        bool _1980 = _1976 || _1978;
        bool _1982 = isnan(0.0);
        bool _1984 = _1980 || _1982;
        float _1986 = _1456;
        if (_1984)
        {
            _1700 = _1872;
        }
        float _1988 = _1700;
        if (!_1984)
        {
            _1866 = 4.0;
        }
        float _1990 = _1866;
        float _1992 = _1988;
        float _1994 = _1990;
        if (!_1984)
        {
            float2 _5433 = float2(_1844, _1456);
            float _1996 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5433, float2(0.0), isnan(_5433)), level(_1990)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5433, float2(0.0), isnan(_5433)), level(_1990)).x;
            _1992 = _1996;
        }
        float _1998 = _1992;
        bool _2000 = _1876 != 0.0;
        bool _2002 = isnan(_1876);
        bool _2004 = _2000 || _2002;
        bool _2006 = isnan(0.0);
        bool _2008 = _2004 || _2006;
        bool _2010 = _1874 != 0.0;
        bool _2012 = isnan(_1874);
        bool _2014 = _2010 || _2012;
        bool _2016 = isnan(0.0);
        bool _2018 = _2014 || _2016;
        bool _2020 = _1878 != 0.0;
        bool _2022 = isnan(_1878);
        bool _2024 = _2020 || _2022;
        bool _2026 = isnan(0.0);
        bool _2028 = _2024 || _2026;
        if (_2008)
        {
            _1702 = _1876;
        }
        float _2030 = _1702;
        if (_2018)
        {
            _1894 = _1874;
        }
        float _2032 = _1894;
        if (!_2008)
        {
            _1496 = 4.0;
        }
        float _2034 = _1496;
        float _2036 = _2030;
        if (!_2008)
        {
            float2 _5497 = float2(_1846, _1456);
            float _2038 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5497, float2(0.0), isnan(_5497)), level(_2034)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5497, float2(0.0), isnan(_5497)), level(_2034)).x;
            _2036 = _2038;
        }
        float _2040 = _2036;
        if (_2028)
        {
            _1994 = _1878;
        }
        float _2042 = _1994;
        if (!_2018)
        {
            _1498 = 4.0;
        }
        float _2044 = _1498;
        if (!_2028)
        {
            _1896 = 4.0;
        }
        float _2046 = _1896;
        bool _2048 = _1968 != 0.0;
        bool _2050 = isnan(_1968);
        bool _2052 = _2048 || _2050;
        bool _2054 = isnan(0.0);
        bool _2056 = _2052 || _2054;
        bool _2058 = _1970 != 0.0;
        bool _2060 = isnan(_1970);
        bool _2062 = _2058 || _2060;
        bool _2064 = isnan(0.0);
        bool _2066 = _2062 || _2064;
        bool _2068 = _1972 != 0.0;
        bool _2070 = isnan(_1972);
        bool _2072 = _2068 || _2070;
        bool _2074 = isnan(0.0);
        bool _2076 = _2072 || _2074;
        bool _2078 = _1974 != 0.0;
        bool _2080 = isnan(_1974);
        bool _2082 = _2078 || _2080;
        bool _2084 = isnan(0.0);
        bool _2086 = _2082 || _2084;
        if (!_2056)
        {
            _1898 = 4.0;
        }
        float _2088 = _1898;
        if (!_2066)
        {
            _1854 = 4.0;
        }
        float _2090 = _1854;
        if (!_2076)
        {
            _1986 = 4.0;
        }
        float _2092 = _1986;
        float _2094 = _1968;
        if (!_2056)
        {
            float2 _5587 = float2(_1844, _1848);
            float _2096 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5587, float2(0.0), isnan(_5587)), level(_2088)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5587, float2(0.0), isnan(_5587)), level(_2088)).x;
            _2094 = _2096;
        }
        float _2098 = _2094;
        float _2100 = _1970;
        if (!_2066)
        {
            float2 _5603 = float2(_1844, _1850);
            float _2102 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5603, float2(0.0), isnan(_5603)), level(_2090)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5603, float2(0.0), isnan(_5603)), level(_2090)).x;
            _2100 = _2102;
        }
        float _2104 = _2100;
        if (!_2086)
        {
            _1900 = 4.0;
        }
        float _2106 = _1900;
        float _2108 = _1972;
        if (!_2076)
        {
            float2 _5624 = float2(_1846, _1848);
            float _2110 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5624, float2(0.0), isnan(_5624)), level(_2092)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5624, float2(0.0), isnan(_5624)), level(_2092)).x;
            _2108 = _2110;
        }
        float _2112 = _2108;
        float _2114 = _1974;
        if (!_2086)
        {
            float2 _5640 = float2(_1846, _1850);
            float _2116 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5640, float2(0.0), isnan(_5640)), level(_2106)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5640, float2(0.0), isnan(_5640)), level(_2106)).x;
            _2114 = _2116;
        }
        float _2118 = _2114;
        float _2120 = _2032;
        if (!_2018)
        {
            float2 _5656 = float2(_1454, _1848);
            float _2122 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5656, float2(0.0), isnan(_5656)), level(_2044)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5656, float2(0.0), isnan(_5656)), level(_2044)).x;
            _2120 = _2122;
        }
        float _2124 = _2120;
        float _2126 = _2042;
        if (!_2028)
        {
            float2 _5672 = float2(_1454, _1850);
            float _2128 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(_2046)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(_2046)).x;
            _2126 = _2128;
        }
        float _2130 = _2126;
        float _2132 = -_1998;
        float _2134 = _1870 + _2132;
        float _2136 = -_2040;
        float _2138 = _1870 + _2136;
        float _2140 = abs(_2134);
        float _2142 = abs(_2138);
        float _2144 = precise::max(_2140, _2142);
        float _2146 = -_2098;
        float _2148 = _1870 + _2146;
        float _2150 = -_2104;
        float _2152 = _1870 + _2150;
        float _2154 = -_2112;
        float _2156 = _1870 + _2154;
        float _2158 = -_2118;
        float _2160 = _1870 + _2158;
        float _2162 = -_2124;
        float _2164 = _1870 + _2162;
        float _2166 = -_2130;
        float _2168 = _1870 + _2166;
        float _2170 = abs(_2148);
        float _2172 = abs(_2152);
        float _2174 = precise::max(_2170, _2172);
        float _2176 = abs(_2156);
        float _2178 = abs(_2160);
        float _2180 = precise::max(_2176, _2178);
        float _2182 = abs(_2164);
        float _2184 = abs(_2168);
        float _2186 = precise::max(_2182, _2184);
        float _2188 = precise::max(_2174, _2180);
        float _2190 = precise::max(_2144, _2186);
        bool _2192 = _2188 > 0.00150000001303851604461669921875;
        bool _2194 = _2190 > 0.00150000001303851604461669921875;
        bool _2196 = _2194 || _2192;
        bool _2198 = !_2196;
        int _2200 = _2198 ? as_type<int>(_556) : 0;
        _684 = _2200;
    }
    int _2202 = _684;
    int _2204 = _168 + 4;
    int _2206 = _168 + 8;
    uint _2208 = uint(int(uint(_190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2208)] = uint(_2202);
    uint _2210 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2210)] = as_type<uint>(_1100);
    uint _2212 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2212)] = as_type<uint>(_1098);
    uint _2214 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2214)] = as_type<uint>(_1102);
    uint _2216 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2216)] = as_type<uint>(_656);
    uint _2218 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2218)] = as_type<uint>(_658);
    uint _2220 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2220)] = as_type<uint>(_666);
    uint _2222 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2222)] = as_type<uint>(_1950);
    uint _2224 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2224)] = as_type<uint>(_1954);
    uint _2226 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2226)] = as_type<uint>(_1958);
    float _2228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2230 = _1954 * _1954;
    float _2232 = _658 * _658;
    float _2234 = fma(_1950, _1950, _2230);
    float _2236 = fma(_656, _656, _2232);
    float _2238 = fma(_1958, _1958, _2234);
    float _2240 = fma(_666, _666, _2236);
    float _2242 = sqrt(_2238);
    float _2244 = sqrt(_2240);
    bool _2246 = _2242 >= 9.9999999747524270787835121154785e-07;
    bool _2248 = isnan(_2242);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan(9.9999999747524270787835121154785e-07);
    bool _2254 = _2250 || _2252;
    if (!_2254)
    {
        bool _2256 = _542 != _290;
        bool _2258 = isnan(_542);
        bool _2260 = _2256 || _2258;
        bool _2262 = isnan(_290);
        bool _2264 = _2260 || _2262;
        _2266 = _2264;
        if (!_2266)
        {
            float _2268 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2270 = _2268 > 0.0;
            bool _2272 = !_2270;
            if (!_2272)
            {
                float _2274 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2276 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2278 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2280 = _2276 * _510;
                float _2282 = _2276 * _508;
                float _2284 = _2276 * _512;
                float _2286 = fma(_2274, _516, _2280);
                float _2288 = fma(_2274, _514, _2282);
                float _2290 = fma(_2274, _518, _2284);
                float _2292 = fma(_2278, _522, _2286);
                float _2294 = fma(_2278, _520, _2288);
                float _2296 = fma(_2278, _524, _2290);
                float _2298 = _2292 * _2292;
                float _2300 = fma(_2294, _2294, _2298);
                float _2302 = fma(_2296, _2296, _2300);
                float _2304 = rsqrt(_2302);
                float _2306 = _2304 * 9.9999999747524270787835121154785e-07;
                float _2308 = _2294 * _2306;
                float _2310 = _2292 * _2306;
                float _2312 = _2296 * _2306;
                _328 = as_type<int>(_2308);
                _330 = as_type<int>(_2310);
                _332 = as_type<int>(_2312);
                _2266 = true;
            }
            else
            {
                bool _2314 = _2244 >= 9.9999999747524270787835121154785e-07;
                bool _2316 = isnan(_2244);
                bool _2318 = _2314 || _2316;
                bool _2320 = isnan(9.9999999747524270787835121154785e-07);
                bool _2322 = _2318 || _2320;
                if (!_2322)
                {
                    float _2324 = _1098 * _1098;
                    float _2326 = fma(_1100, _1100, _2324);
                    float _2328 = fma(_1102, _1102, _2326);
                    float _2330 = sqrt(_2328);
                    bool _2332 = _2330 >= 9.9999999747524270787835121154785e-07;
                    bool _2334 = isnan(_2330);
                    bool _2336 = _2332 || _2334;
                    bool _2338 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2340 = _2336 || _2338;
                    float _2342 = _2330;
                    if (_2340)
                    {
                        float _2344 = rsqrt(_2328);
                        _2342 = _2344;
                    }
                    float _2346 = _2342;
                    if (!_2340)
                    {
                        _316 = 0;
                    }
                    int _2348 = _316;
                    int _2350 = _2348;
                    if (!_2340)
                    {
                        _318 = 897988541;
                    }
                    int _2352 = _318;
                    int _2354 = _2352;
                    if (!_2340)
                    {
                        _320 = 0;
                    }
                    int _2356 = _320;
                    float _2358 = _2346;
                    int _2360 = _2356;
                    if (_2340)
                    {
                        float _2362 = _2346 * 9.9999999747524270787835121154785e-07;
                        _2358 = _2362;
                    }
                    float _2364 = _2358;
                    if (_2340)
                    {
                        float _2366 = _1100 * _2364;
                        _2350 = as_type<int>(_2366);
                    }
                    int _2368 = _2350;
                    _328 = _2368;
                    if (_2340)
                    {
                        float _2370 = _1098 * _2364;
                        _2354 = as_type<int>(_2370);
                    }
                    int _2372 = _2354;
                    _330 = _2372;
                    if (_2340)
                    {
                        float _2374 = _1102 * _2364;
                        _2360 = as_type<int>(_2374);
                    }
                    int _2376 = _2360;
                    _332 = _2376;
                    _2266 = true;
                }
                else
                {
                    float _2378 = rsqrt(_2240);
                    float _2380 = _2378 * 9.9999999747524270787835121154785e-07;
                    float _2382 = _656 * _2380;
                    float _2384 = _658 * _2380;
                    float _2386 = _666 * _2380;
                    _328 = as_type<int>(_2382);
                    _330 = as_type<int>(_2384);
                    _332 = as_type<int>(_2386);
                    _2266 = true;
                }
            }
        }
    }
    else
    {
        float _2388 = _2244 * _2228;
        bool _2390 = _2388 >= 0.001000000047497451305389404296875;
        bool _2392 = isnan(_2388);
        bool _2394 = _2390 || _2392;
        bool _2396 = isnan(0.001000000047497451305389404296875);
        bool _2398 = _2394 || _2396;
        bool _2400 = _2388 > 0.0;
        bool _2402 = !_2398;
        bool _2404 = _2400 && _2402;
        bool _2406 = _2242 < 0.001000000047497451305389404296875;
        bool _2408 = _2406 && _2404;
        if (!_2408)
        {
            _322 = as_type<int>(_1950);
        }
        int _2410 = _322;
        int _2412 = _2410;
        if (_2408)
        {
            float _2414 = _656 * _2228;
            _2412 = as_type<int>(_2414);
        }
        int _2416 = _2412;
        _328 = _2416;
        if (!_2408)
        {
            _324 = as_type<int>(_1954);
        }
        int _2418 = _324;
        int _2420 = _2418;
        if (_2408)
        {
            float _2422 = _658 * _2228;
            _2420 = as_type<int>(_2422);
        }
        int _2424 = _2420;
        _330 = _2424;
        if (!_2408)
        {
            _326 = as_type<int>(_1958);
        }
        int _2426 = _326;
        _332 = _2426;
        if (_2408)
        {
            float _2428 = _666 * _2228;
            _332 = as_type<int>(_2428);
        }
    }
    _2266 = false;
    int _2430 = _328;
    int _2432 = _330;
    int _2434 = _332;
    uint _2436 = uint(int(uint(_168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2436)] = uint(_2430);
    uint _2438 = uint(int(uint(_2204) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2438)] = uint(_2432);
    uint _2440 = uint(int(uint(_2206) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2440)] = uint(_2434);
}

