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
    texture2d<float> cp_t_tcb_2C [[id(16)]];
    sampler cp_t_tcb_2CSmplr [[id(17)]];
    texture2d_array<float> cp_t_tcb_14 [[id(18)]];
    sampler cp_t_tcb_14Smplr [[id(19)]];
    texture2d<float> cp_t_tcb_2A [[id(20)]];
    sampler cp_t_tcb_2ASmplr [[id(21)]];
    sampler cp_t_tcb_2CSmplr_w [[id(22)]];
    sampler cp_t_tcb_14Smplr_w [[id(23)]];
    sampler cp_t_tcb_2ASmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _5128 = false;
    bool _3544 = false;
    bool _2854 = false;
    bool _2092 = false;
    bool _1186 = false;
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
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _174 = as_type<int>(_170) & 512;
    bool _176 = _174 != 0;
    float _178 = 0.0;
    float _180 = 0.0;
    float _182 = 0.0;
    if (_176)
    {
        float _184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _188 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _178 = _184;
        _180 = _186;
        _182 = _188;
    }
    float _190 = _178;
    float _192 = _180;
    float _194 = _182;
    float _196 = 0.0;
    float _198 = 0.0;
    float _200 = 0.0;
    if (_176)
    {
        float _202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _196 = _202;
        _198 = _204;
        _200 = _206;
    }
    float _208 = _196;
    float _210 = _198;
    float _212 = _200;
    float _214 = 0.0;
    float _216 = 0.0;
    float _218 = 0.0;
    if (_176)
    {
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _214 = _220;
        _216 = _222;
        _218 = _224;
    }
    float _226 = _214;
    float _228 = _216;
    float _230 = _218;
    int _232 = _89 << 4;
    int _234 = _232 + 12;
    uint _236 = uint(int(uint(_232) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_236)]);
    int _240 = _232 + 4;
    uint _242 = uint(int(uint(_240) >> uint(2)));
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_242)]);
    int _246 = _232 + 8;
    uint _248 = uint(int(uint(_246) >> uint(2)));
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_248)]);
    uint _252 = uint(int(uint(_232) >> uint(2)));
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_252)]);
    int _256 = _232 + 4;
    uint _258 = uint(int(uint(_256) >> uint(2)));
    float _260 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_258)]);
    int _262 = _232 + 8;
    uint _264 = uint(int(uint(_262) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_264)]);
    uint _268 = uint(int(uint(_232) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_268)]);
    int _272 = _232 + 4;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_274)]);
    int _278 = _232 + 8;
    uint _280 = uint(int(uint(_278) >> uint(2)));
    float _282 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_280)]);
    uint _284 = uint(int(uint(_232) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_284)]);
    int _288 = _232 + 4;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_290)]);
    int _294 = _232 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_296)]);
    uint _300 = uint(int(uint(_234) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_300)]);
    uint _304 = uint(int(uint(_234) >> uint(2)));
    float _306 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_304)]);
    float _308 = _228;
    float _310 = _208;
    float _312 = _210;
    float _314 = _212;
    float _316 = _190;
    float _318 = _192;
    float _320 = _194;
    float _322 = _226;
    float _324 = _228;
    float _326 = _230;
    float _328 = _276;
    float _330 = _168;
    int _332 = as_type<int>(_254);
    int _334 = as_type<int>(_260);
    int _336 = as_type<int>(_266);
    int _338 = as_type<int>(_254);
    int _340 = as_type<int>(_260);
    int _342 = as_type<int>(_266);
    int _344 = as_type<int>(_254);
    int _346 = as_type<int>(_260);
    int _348 = as_type<int>(_266);
    if (!_176)
    {
        int _350 = _232 + 4;
        int _352 = _232 + 8;
        uint _354 = uint(int(uint(_232) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_350) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_352) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_362)]);
        uint _366 = uint(int(uint(_350) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_366)]);
        uint _370 = uint(int(uint(_232) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_370)]);
        uint _374 = uint(int(uint(_352) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_374)]);
        uint _378 = uint(int(uint(_350) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_378)]);
        uint _382 = uint(int(uint(_232) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_382)]);
        uint _386 = uint(int(uint(_352) >> uint(2)));
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_386)]);
        float _390 = _356 * _356;
        float _392 = _360 * _360;
        float _394 = _364 * _364;
        float _396 = fma(_368, _368, _392);
        float _398 = fma(_372, _372, _390);
        float _400 = fma(_376, _376, _394);
        float _402 = fma(_380, _380, _396);
        float _404 = fma(_384, _384, _398);
        float _406 = sqrt(_402);
        float _408 = fma(_388, _388, _400);
        float _410 = sqrt(_404);
        float _412 = sqrt(_408);
        bool _414 = _406 > 0.0;
        bool _416 = _410 > 0.0;
        bool _418 = _412 > 0.0;
        float _420 = 0.0;
        float _422 = _412;
        float _424 = _410;
        float _426 = _406;
        float _428 = _396;
        float _430 = _392;
        float _432 = _404;
        float _434 = _368;
        float _436 = _402;
        if (_414)
        {
            float _438 = rsqrt(_402);
            _420 = _438;
        }
        float _440 = _420;
        float _442 = _400;
        if (_416)
        {
            float _444 = rsqrt(_404);
            _442 = _444;
        }
        float _446 = _442;
        float _448 = 0.0;
        if (_418)
        {
            float _450 = rsqrt(_408);
            _448 = _450;
        }
        float _452 = _448;
        if (!_414)
        {
            _422 = 0.0;
        }
        float _454 = _422;
        float _456 = _454;
        if (_414)
        {
            float _458 = _368 * _440;
            _456 = _458;
        }
        float _460 = _456;
        _318 = _460;
        if (!_416)
        {
            _424 = 0.0;
        }
        float _462 = _424;
        float _464 = _462;
        if (!_416)
        {
            _426 = 0.0;
        }
        float _466 = _426;
        float _468 = _466;
        if (!_416)
        {
            _428 = 0.0;
        }
        float _470 = _428;
        float _472 = _470;
        if (_416)
        {
            float _474 = _356 * _446;
            _464 = _474;
        }
        float _476 = _464;
        _310 = _476;
        if (!_414)
        {
            _430 = 0.0;
        }
        float _478 = _430;
        float _480 = _478;
        if (_416)
        {
            float _482 = _372 * _446;
            _468 = _482;
        }
        float _484 = _468;
        _316 = _484;
        if (!_414)
        {
            _308 = 0.0;
        }
        float _486 = _308;
        float _488 = _486;
        if (_416)
        {
            float _490 = _384 * _446;
            _472 = _490;
        }
        float _492 = _472;
        _322 = _492;
        if (!_418)
        {
            _432 = 0.0;
        }
        float _494 = _432;
        float _496 = _494;
        if (_414)
        {
            float _498 = _360 * _440;
            _480 = _498;
        }
        float _500 = _480;
        _312 = _500;
        if (!_418)
        {
            _434 = 0.0;
        }
        float _502 = _434;
        float _504 = _502;
        if (_414)
        {
            float _506 = _380 * _440;
            _488 = _506;
        }
        float _508 = _488;
        _324 = _508;
        if (!_418)
        {
            _436 = 0.0;
        }
        float _510 = _436;
        _326 = _510;
        if (_418)
        {
            float _512 = _364 * _452;
            _496 = _512;
        }
        float _514 = _496;
        _314 = _514;
        if (_418)
        {
            float _516 = _376 * _452;
            _504 = _516;
        }
        float _518 = _504;
        _320 = _518;
        if (_418)
        {
            float _520 = _388 * _452;
            _326 = _520;
        }
    }
    float _522 = _310;
    float _524 = _312;
    float _526 = _314;
    float _528 = _316;
    float _530 = _318;
    float _532 = _320;
    float _534 = _322;
    float _536 = _324;
    float _538 = _326;
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[15]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[12]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[16]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[17]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _560 = -_168;
    float _562 = _560 + 1.0;
    float _564 = -_172;
    float _566 = _564 + 1.0;
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _572 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _576 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _578 = fma(_562, _566, _172);
    bool _580 = _578 != 1.0;
    bool _582 = isnan(_578);
    bool _584 = _580 || _582;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    float _590 = abs(_172);
    float _592 = log2(_590);
    bool _594 = _542 != 1.0;
    bool _596 = isnan(_542);
    bool _598 = _594 || _596;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    bool _604 = !_588;
    bool _606 = _602 || _604;
    float _608 = -_306;
    float _610 = _540 + _608;
    float _612 = 0.0;
    float _614 = _592;
    float _616 = _548;
    float _618 = _556;
    if (!_606)
    {
        float _620 = abs(_578);
        float _622 = log2(_620);
        _612 = _622;
    }
    float _624 = _612;
    float _626 = 0.0;
    if (!_606)
    {
        float _628 = -_578;
        float _630 = _628 + 1.0;
        _626 = _630;
    }
    float _632 = _626;
    float _634 = _546 * _550;
    float _636 = _544 * _550;
    bool _638 = _552 != 1.0;
    bool _640 = isnan(_552);
    bool _642 = _638 || _640;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    float _648 = 0.0;
    float _650 = _632;
    if (!_606)
    {
        float _652 = _610 * _624;
        _648 = _652;
    }
    float _654 = _648;
    float _656 = _548 * _550;
    float _658 = _168 * _592;
    float _660 = _654;
    if (!_606)
    {
        float _662 = exp2(_654);
        _660 = _662;
    }
    float _664 = _660;
    float _666 = _634 * _522;
    float _668 = _634 * _524;
    float _670 = _634 * _526;
    float _672 = 0.0;
    if (!_606)
    {
        float _674 = 1.0 / _632;
        _672 = _674;
    }
    float _676 = _672;
    float _678 = fma(_636, _528, _666);
    float _680 = fma(_636, _530, _668);
    float _682 = fma(_636, _532, _670);
    float _684 = _554 * 0.00999999977648258209228515625;
    float _686 = exp2(_658);
    float _688 = fma(_656, _534, _678);
    float _690 = fma(_656, _536, _680);
    float _692 = fma(_656, _538, _682);
    float _694 = _646 ? _286 : 0.0;
    float _696 = _664;
    if (!_606)
    {
        float _698 = -_664;
        float _700 = _698 + 1.0;
        _696 = _700;
    }
    float _702 = _696;
    float _704 = _646 ? _292 : 0.3141500055789947509765625;
    float _706 = _558 * _684;
    float _708 = _646 ? _298 : 0.92653000354766845703125;
    float _710 = _558 * _694;
    float _712 = _710;
    if (_606)
    {
        _614 = _610;
    }
    float _714 = _614;
    float _716 = _714;
    if (!_606)
    {
        float _718 = _702 * _676;
        _716 = _718;
    }
    float _720 = _716;
    if (_646)
    {
        _616 = 0.0;
    }
    float _722 = _616;
    float _724 = _302 * _168;
    float _726 = _558 * _704;
    float _728 = _558 * _708;
    float _730 = _168 * _688;
    float _732 = _722;
    float _734 = _726;
    float _736 = _728;
    float _738 = _724;
    float _740 = _724;
    if (!_646)
    {
        float _742 = _168 * _706;
        _732 = _742;
    }
    float _744 = _732;
    float _746 = _574;
    float _748 = _574;
    float _750 = _568;
    float _752 = _570;
    float _754 = _572;
    if (!_646)
    {
        float _756 = _556 * 0.00999999977648258209228515625;
        float _758 = _540 * _706;
        float _760 = fma(_292, 2.0, -1.0);
        float _762 = _558 * _756;
        float _764 = fma(_286, 2.0, -1.0);
        float _766 = fma(_298, 2.0, -1.0);
        float _768 = fma(_762, _760, _758);
        float _770 = fma(_762, _764, _758);
        float _772 = fma(_762, _766, _758);
        float _774 = _726 + _768;
        float _776 = _710 + _770;
        float _778 = _728 + _772;
        _712 = _776;
        _618 = _762;
        _734 = _774;
        _736 = _778;
    }
    float _780 = _712;
    float _782 = _618;
    float _784 = _734;
    float _786 = _736;
    bool _788 = _744 != 0.0;
    bool _790 = isnan(_744);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = _720 + _780;
    float _800 = _168 * _690;
    float _802 = _168 * _692;
    float _804 = fma(_270, _686, _730);
    float _806 = _168 + _798;
    float _808 = fma(_276, _686, _800);
    bool _810 = _576 != 1.0;
    bool _812 = isnan(_576);
    bool _814 = _810 || _812;
    bool _816 = isnan(1.0);
    bool _818 = _814 || _816;
    float _820 = fma(_270, _724, _238);
    float _822 = fma(_276, _724, _244);
    float _824 = fma(_282, _724, _250);
    float _826 = fma(_282, _686, _802);
    float _828 = _806 + _744;
    float _830 = _780;
    float _832 = _782;
    float _834 = _806;
    float _836 = _782;
    float _838 = _806;
    float _840 = _798;
    float _842 = _784;
    float _844 = _786;
    float _846 = _808;
    float _922;
    float _930;
    float _932;
    float _934;
    float _1014;
    float _1032;
    float _1148;
    float _1156;
    float _1158;
    float _1162;
    float _1166;
    float _1170;
    float _1174;
    float _1178;
    float _1180;
    float _1182;
    float _1184;
    if (!_796)
    {
        if (_818)
        {
            _746 = 0.60000002384185791015625;
        }
        float _848 = _746;
        float _850 = _676;
        if (!_818)
        {
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _850 = _852;
        }
        float _854 = _850;
        if (_818)
        {
            _830 = 0.4199999868869781494140625;
        }
        float _856 = _830;
        if (_818)
        {
            _832 = 0.23000000417232513427734375;
        }
        float _858 = _832;
        float _860 = 0.0;
        if (!_818)
        {
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _860 = _862;
        }
        float _864 = _860;
        float _866 = _848;
        if (!_818)
        {
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _866 = _868;
        }
        float _870 = _866;
        float _872 = _856;
        if (!_818)
        {
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _872 = _874;
        }
        float _876 = _872;
        if (_818)
        {
            _738 = 0.1500000059604644775390625;
        }
        float _878 = _738;
        float _880 = _858;
        if (!_818)
        {
            float _882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _880 = _882;
        }
        float _884 = _880;
        float _886 = _878;
        if (!_818)
        {
            float _888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _886 = _888;
        }
        float _890 = _886;
        float _892 = 0.0;
        if (!_818)
        {
            float _894 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _892 = _894;
        }
        float _896 = _892;
        float _898 = 0.0;
        if (!_818)
        {
            float _900 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _898 = _900;
        }
        float _902 = _898;
        if (_818)
        {
            _834 = 0.60000002384185791015625;
        }
        float _904 = _834;
        float _906 = _828 * 6.283184051513671875;
        float _908 = _558 * _870;
        float _910 = _904;
        float _912 = _870;
        if (!_818)
        {
            _910 = _870;
        }
        float _914 = _910;
        float _916 = _558 * _876;
        float _918 = 1.0 / _908;
        float _920 = _914;
        _922 = _854;
        if (_818)
        {
            _912 = 0.4199999868869781494140625;
        }
        float _924 = _912;
        float _926 = _558 * _884;
        float _928 = _924;
        _930 = _864;
        _932 = _896;
        _934 = _902;
        if (!_818)
        {
            _928 = _876;
        }
        float _936 = _928;
        float _938 = _558 * _914;
        float _940 = 1.0 / _916;
        float _942 = _558 * _936;
        float _944 = _558 * _890;
        float _946 = _936;
        if (_818)
        {
            _920 = 0.23000000417232513427734375;
        }
        float _948 = _920;
        float _950 = _948;
        if (!_818)
        {
            _950 = _884;
        }
        float _952 = _950;
        float _954 = 1.0 / _926;
        float _956 = _558 * _952;
        float _958 = _918 * _906;
        float _960 = 1.0 / _942;
        if (_818)
        {
            _946 = 0.1500000059604644775390625;
        }
        float _962 = _946;
        float _964 = _958 * 0.15915493667125701904296875;
        float _966 = _962;
        if (!_818)
        {
            _966 = _890;
        }
        float _968 = _966;
        float _970 = 1.0 / _944;
        float _972 = _940 * _906;
        float _974 = _558 * _968;
        float _976 = 1.0 / _938;
        float _978 = _972 * 0.15915493667125701904296875;
        float _980 = _954 * _906;
        float _982 = _798 * _960;
        float _984 = 1.0 / _956;
        float _986 = _980 * 0.15915493667125701904296875;
        float _988 = _970 * _906;
        float _990 = _982 * 6.283184051513671875;
        float _992 = 1.0 / _974;
        float _994 = _988 * 0.15915493667125701904296875;
        float _996 = _798 * _976;
        float _998 = _990 * 0.15915493667125701904296875;
        float _1000 = _978 * 6.283185482025146484375;
        float _1002 = sin(_1000);
        float _1004 = _996 * 6.283184051513671875;
        float _1006 = _798 * _984;
        float _1008 = _990;
        float _1010 = _1006;
        float _1012 = _984;
        _1014 = _976;
        if (_818)
        {
            _1008 = 3.0;
        }
        float _1016 = _1008;
        float _1018 = _1004 * 0.15915493667125701904296875;
        float _1020 = _1006 * 6.283184051513671875;
        float _1022 = _998 * 6.283185482025146484375;
        float _1024 = sin(_1022);
        float _1026 = _798 * _992;
        float _1028 = _1016;
        float _1030 = _1020;
        _1032 = _992;
        if (!_818)
        {
            _1028 = _854;
        }
        float _1034 = _1028;
        float _1036 = _1020 * 0.15915493667125701904296875;
        float _1038 = _1026 * 6.283184051513671875;
        float _1040 = _964 * 6.283185482025146484375;
        float _1042 = sin(_1040);
        float _1044 = _1002 * _1034;
        float _1046 = _1038 * 0.15915493667125701904296875;
        float _1048 = _1038;
        float _1050 = _1044;
        if (_818)
        {
            _1010 = 3.0;
        }
        float _1052 = _1010;
        float _1054 = _1018 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1052;
        if (!_818)
        {
            _1058 = _854;
        }
        float _1060 = _1058;
        float _1062 = _1060;
        if (_818)
        {
            _1030 = 4.0;
        }
        float _1064 = _1030;
        float _1066 = _986 * 6.283185482025146484375;
        float _1068 = sin(_1066);
        float _1070 = _1064;
        if (!_818)
        {
            _1070 = _864;
        }
        float _1072 = _1070;
        float _1074 = _1024 * _1060;
        float _1076 = _1036 * 6.283185482025146484375;
        float _1078 = sin(_1076);
        float _1080 = _1072;
        if (_818)
        {
            _1062 = 4.0;
        }
        float _1082 = _1062;
        float _1084 = _1082;
        if (!_818)
        {
            _1084 = _864;
        }
        float _1086 = _1084;
        float _1088 = _994 * 6.283185482025146484375;
        float _1090 = sin(_1088);
        float _1092 = fma(_1042, _1072, _1044);
        float _1094 = _1042;
        float _1096 = _1092;
        if (_818)
        {
            _1012 = 2.0;
        }
        float _1098 = _1012;
        float _1100 = _1046 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098;
        if (_818)
        {
            _1080 = 2.0;
        }
        float _1106 = _1080;
        float _1108 = fma(_1056, _1086, _1074);
        float _1110 = _1106;
        if (!_818)
        {
            _1104 = _896;
        }
        float _1112 = _1104;
        float _1114 = _1112;
        if (!_818)
        {
            _1110 = _896;
        }
        float _1116 = _1110;
        float _1118 = _1116;
        if (_818)
        {
            _1048 = 1.5;
        }
        float _1120 = _1048;
        float _1122 = _1120;
        if (_818)
        {
            _1050 = 1.5;
        }
        float _1124 = _1050;
        float _1126 = fma(_1068, _1112, _1092);
        float _1128 = _1124;
        if (!_818)
        {
            _1122 = _902;
        }
        float _1130 = _1122;
        float _1132 = fma(_1078, _1116, _1108);
        float _1134 = _1130;
        if (!_818)
        {
            _1128 = _902;
        }
        float _1136 = _1128;
        float _1138 = fma(_1090, _1130, _1126);
        float _1140 = fma(_1102, _1136, _1132);
        float _1142 = _1136;
        float _1144 = _1090;
        if (_818)
        {
            _1114 = 1.5;
        }
        float _1146 = _1114;
        _1148 = _1146;
        if (_818)
        {
            _1134 = 2.0;
        }
        float _1150 = _1134;
        float _1152 = -_1140;
        float _1154 = _1138 + _1152;
        _1156 = _1150;
        _1158 = _1154;
        if (_818)
        {
            _1142 = 3.0;
        }
        float _1160 = _1142;
        _1162 = _1160;
        if (_818)
        {
            _1118 = 4.0;
        }
        float _1164 = _1118;
        _1166 = _1164;
        if (_818)
        {
            _1144 = 0.1500000059604644775390625;
        }
        float _1168 = _1144;
        _1170 = _1168;
        if (_818)
        {
            _1094 = 0.23000000417232513427734375;
        }
        float _1172 = _1094;
        _1174 = _1172;
        if (_818)
        {
            _1096 = 0.4199999868869781494140625;
        }
        float _1176 = _1096;
        _1178 = _1176;
        _1180 = 0.0;
        _1182 = 0.0;
        _1184 = 0.0;
        _1186 = true;
    }
    else
    {
        if (_818)
        {
            _836 = 0.4199999868869781494140625;
        }
        float _1188 = _836;
        float _1190 = _676;
        if (!_818)
        {
            float _1192 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1190 = _1192;
        }
        float _1194 = _1190;
        if (_818)
        {
            _650 = 0.23000000417232513427734375;
        }
        float _1196 = _650;
        if (_818)
        {
            _740 = 0.60000002384185791015625;
        }
        float _1198 = _740;
        float _1200 = 0.0;
        if (!_818)
        {
            float _1202 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1200 = _1202;
        }
        float _1204 = _1200;
        float _1206 = _1188;
        if (!_818)
        {
            float _1208 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1206 = _1208;
        }
        float _1210 = _1206;
        float _1212 = _1196;
        if (!_818)
        {
            float _1214 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1212 = _1214;
        }
        float _1216 = _1212;
        float _1218 = _1198;
        if (!_818)
        {
            float _1220 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1218 = _1220;
        }
        float _1222 = _1218;
        if (_818)
        {
            _328 = 0.1500000059604644775390625;
        }
        float _1224 = _328;
        float _1226 = 0.0;
        if (!_818)
        {
            float _1228 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1226 = _1228;
        }
        float _1230 = _1226;
        float _1232 = _1224;
        if (!_818)
        {
            float _1234 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1232 = _1234;
        }
        float _1236 = _1232;
        float _1238 = 0.0;
        if (!_818)
        {
            float _1240 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1238 = _1240;
        }
        float _1242 = _1238;
        if (_818)
        {
            _838 = 0.4199999868869781494140625;
        }
        float _1244 = _838;
        float _1246 = _1244;
        if (_818)
        {
            _748 = 0.4199999868869781494140625;
        }
        float _1248 = _748;
        float _1250 = _828 * 6.283184051513671875;
        float _1252 = _780 * 6.283184051513671875;
        float _1254 = _1248;
        float _1256 = _1210;
        if (!_818)
        {
            _1246 = _1210;
        }
        float _1258 = _1246;
        float _1260 = _1258;
        if (!_818)
        {
            _1254 = _1210;
        }
        float _1262 = _1254;
        float _1264 = _558 * _1258;
        float _1266 = _1262;
        if (_818)
        {
            _1260 = 0.4199999868869781494140625;
        }
        float _1268 = _1260;
        float _1270 = _558 * _1262;
        float _1272 = _558 * _1216;
        float _1274 = _1268;
        _922 = _1194;
        if (!_818)
        {
            _1274 = _1210;
        }
        float _1276 = _1274;
        float _1278 = _558 * _1210;
        float _1280 = _1276;
        if (_818)
        {
            _1266 = 0.60000002384185791015625;
        }
        float _1282 = _1266;
        float _1284 = _1282;
        if (!_818)
        {
            _1284 = _1222;
        }
        float _1286 = _1284;
        float _1288 = 1.0 / _1272;
        float _1290 = _1286;
        if (_818)
        {
            _1256 = 0.60000002384185791015625;
        }
        float _1292 = _1256;
        float _1294 = _558 * _1222;
        float _1296 = 1.0 / _1278;
        float _1298 = _558 * _1276;
        float _1300 = _1292;
        if (_818)
        {
            _1280 = 0.60000002384185791015625;
        }
        float _1302 = _1280;
        float _1304 = _1302;
        if (!_818)
        {
            _1304 = _1222;
        }
        float _1306 = _1304;
        float _1308 = _558 * _1286;
        if (_818)
        {
            _1290 = 0.23000000417232513427734375;
        }
        float _1310 = _1290;
        float _1312 = _1310;
        if (!_818)
        {
            _1312 = _1216;
        }
        float _1314 = _1312;
        float _1316 = _1314;
        if (!_818)
        {
            _1300 = _1222;
        }
        float _1318 = _1300;
        float _1320 = _558 * _1306;
        float _1322 = _558 * _1314;
        float _1324 = _1318;
        float _1326 = _1320;
        if (_818)
        {
            _1316 = 0.23000000417232513427734375;
        }
        float _1328 = _1316;
        float _1330 = 1.0 / _1294;
        float _1332 = _1328;
        if (!_818)
        {
            _1332 = _1216;
        }
        float _1334 = _1332;
        float _1336 = _558 * _1236;
        float _1338 = _558 * _1318;
        float _1340 = _1334;
        _930 = _1204;
        _932 = _1230;
        _934 = _1242;
        if (_818)
        {
            _1324 = 0.23000000417232513427734375;
        }
        float _1342 = _1324;
        float _1344 = _1342;
        if (!_818)
        {
            _1344 = _1216;
        }
        float _1346 = _1344;
        float _1348 = _558 * _1334;
        float _1350 = _1346;
        if (_818)
        {
            _1340 = 0.1500000059604644775390625;
        }
        float _1352 = _1340;
        float _1354 = _1352;
        if (!_818)
        {
            _1354 = _1236;
        }
        float _1356 = _1354;
        float _1358 = 1.0 / _1298;
        float _1360 = 1.0 / _1264;
        float _1362 = 1.0 / _1320;
        float _1364 = 1.0 / _1338;
        _1184 = _1364;
        if (_818)
        {
            _1326 = 0.1500000059604644775390625;
        }
        float _1366 = _1326;
        float _1368 = _1366;
        if (!_818)
        {
            _1368 = _1236;
        }
        float _1370 = _1368;
        float _1372 = 1.0 / _1308;
        float _1374 = _558 * _1346;
        float _1376 = _558 * _1370;
        float _1378 = 1.0 / _1336;
        float _1380 = _558 * _1356;
        float _1382 = _1296 * _1250;
        float _1384 = 1.0 / _1270;
        float _1386 = 1.0 / _1374;
        if (_818)
        {
            _1350 = 0.1500000059604644775390625;
        }
        float _1388 = _1350;
        float _1390 = _1382 * 0.15915493667125701904296875;
        float _1392 = _1330 * _1250;
        float _1394 = 1.0 / _1348;
        float _1396 = _1388;
        if (!_818)
        {
            _1396 = _1236;
        }
        float _1398 = _1396;
        float _1400 = 1.0 / _1376;
        float _1402 = _1392 * 0.15915493667125701904296875;
        float _1404 = _1288 * _1250;
        float _1406 = _780 + _744;
        float _1408 = _1358 * _1252;
        float _1410 = _1404 * 0.15915493667125701904296875;
        float _1412 = _1406 * 6.283184051513671875;
        float _1414 = _1378 * _1250;
        float _1416 = _1408 * 0.15915493667125701904296875;
        float _1418 = _1390 * 6.283185482025146484375;
        float _1420 = sin(_1418);
        float _1422 = _1372 * _1412;
        float _1424 = _1384 * _1412;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1362 * _1252;
        float _1430 = 1.0 / _1380;
        float _1432 = _1428 * 0.15915493667125701904296875;
        float _1434 = _1428;
        if (_818)
        {
            _1434 = 3.0;
        }
        float _1436 = _1434;
        float _1438 = _1416 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = _1424 * 0.15915493667125701904296875;
        float _1444 = _798 * _1360;
        float _1446 = _1436;
        if (!_818)
        {
            _1446 = _1194;
        }
        float _1448 = _1446;
        float _1450 = _558 * _1398;
        float _1452 = _1444 * 6.283184051513671875;
        float _1454 = _1442 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = _1452 * 0.15915493667125701904296875;
        float _1460 = _1386 * _1412;
        float _1462 = 1.0 / _1322;
        float _1464 = _1420 * _1448;
        float _1466 = _1448;
        float _1468 = _1460;
        float _1470 = _1420;
        if (_818)
        {
            _1466 = 3.0;
        }
        float _1472 = _1466;
        float _1474 = _1472;
        if (!_818)
        {
            _1474 = _1194;
        }
        float _1476 = _1474;
        float _1478 = _1460 * 0.15915493667125701904296875;
        float _1480 = _1426 * 6.283185482025146484375;
        float _1482 = sin(_1480);
        if (_818)
        {
            _1468 = 3.0;
        }
        float _1484 = _1468;
        float _1486 = _1394 * _1252;
        float _1488 = _1484;
        if (!_818)
        {
            _1488 = _1194;
        }
        float _1490 = _1488;
        float _1492 = _1440 * _1476;
        float _1494 = 1.0 / _1450;
        float _1496 = _798 * _1364;
        float _1498 = _1486 * 0.15915493667125701904296875;
        float _1500 = _1456 * _1490;
        float _1502 = _1490;
        float _1504 = _1496;
        if (_818)
        {
            _1502 = 4.0;
        }
        float _1506 = _1502;
        float _1508 = _1496 * 6.283184051513671875;
        float _1510 = _1506;
        if (!_818)
        {
            _1510 = _1204;
        }
        float _1512 = _1510;
        float _1514 = _798 * _1462;
        float _1516 = _1458 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        float _1520 = _1508 * 0.15915493667125701904296875;
        float _1522 = fma(_1482, _1512, _1500);
        float _1524 = _1514 * 6.283184051513671875;
        float _1526 = _1432 * 6.283185482025146484375;
        float _1528 = sin(_1526);
        float _1530 = _798 * _1494;
        float _1532 = _1400 * _1412;
        float _1534 = _1524 * 0.15915493667125701904296875;
        float _1536 = _1530 * 6.283184051513671875;
        float _1538 = _1532 * 0.15915493667125701904296875;
        float _1540 = _1402 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1494;
        float _1546 = _1524;
        if (_818)
        {
            _1470 = 3.0;
        }
        float _1548 = _1470;
        float _1550 = _1430 * _1252;
        float _1552 = _1548;
        if (!_818)
        {
            _1552 = _1194;
        }
        float _1554 = _1552;
        float _1556 = _1520 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        float _1560 = _1554;
        if (_818)
        {
            _1504 = 4.0;
        }
        float _1562 = _1504;
        float _1564 = _1414 * 0.15915493667125701904296875;
        float _1566 = _1562;
        if (!_818)
        {
            _1566 = _1204;
        }
        float _1568 = _1566;
        float _1570 = _1536 * 0.15915493667125701904296875;
        float _1572 = _1550 * 0.15915493667125701904296875;
        float _1574 = _1410 * 6.283185482025146484375;
        float _1576 = sin(_1574);
        float _1578 = _1518 * _1554;
        float _1580 = _1568;
        _1180 = _1572;
        if (_818)
        {
            _1560 = 4.0;
        }
        float _1582 = _1560;
        float _1584 = _1478 * 6.283185482025146484375;
        float _1586 = sin(_1584);
        float _1588 = fma(_1528, _1568, _1492);
        float _1590 = _1582;
        if (_818)
        {
            _1544 = 4.0;
        }
        float _1592 = _1544;
        float _1594 = _1498 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = _1592;
        if (!_818)
        {
            _1590 = _1204;
        }
        float _1600 = _1590;
        if (!_818)
        {
            _1598 = _1204;
        }
        float _1602 = _1598;
        float _1604 = _1534 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1602;
        if (_818)
        {
            _840 = 2.0;
        }
        float _1610 = _840;
        float _1612 = _1610;
        if (_818)
        {
            _1580 = 2.0;
        }
        float _1614 = _1580;
        float _1616 = _1614;
        if (_818)
        {
            _1546 = 2.0;
        }
        float _1618 = _1546;
        float _1620 = _1564 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618;
        if (!_818)
        {
            _1612 = _1230;
        }
        float _1626 = _1612;
        float _1628 = fma(_1542, _1600, _1464);
        float _1630 = _1628;
        float _1632 = _1626;
        _1178 = _1542;
        if (!_818)
        {
            _1616 = _1230;
        }
        float _1634 = _1616;
        float _1636 = _1538 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634;
        if (!_818)
        {
            _1624 = _1230;
        }
        float _1642 = _1624;
        float _1644 = fma(_1558, _1602, _1578);
        float _1646 = _1572 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1642;
        _1014 = _1644;
        if (_818)
        {
            _1608 = 2.0;
        }
        float _1652 = _1608;
        float _1654 = _1570 * 6.283185482025146484375;
        float _1656 = sin(_1654);
        float _1658 = _1652;
        if (!_818)
        {
            _1658 = _1230;
        }
        float _1660 = _1658;
        float _1662 = fma(_1576, _1626, _1628);
        float _1664 = fma(_1586, _1634, _1522);
        float _1666 = fma(_1596, _1642, _1588);
        float _1668 = _1660;
        _1032 = _1664;
        _1182 = _1666;
        if (_818)
        {
            _1630 = 1.5;
        }
        float _1670 = _1630;
        float _1672 = _1670;
        if (_818)
        {
            _1632 = 1.5;
        }
        float _1674 = _1632;
        float _1676 = _1674;
        if (_818)
        {
            _1640 = 1.5;
        }
        float _1678 = _1640;
        float _1680 = _1678;
        if (_818)
        {
            _1650 = 1.5;
        }
        float _1682 = _1650;
        float _1684 = fma(_1606, _1660, _1644);
        float _1686 = _1682;
        if (!_818)
        {
            _1672 = _1242;
        }
        float _1688 = _1672;
        if (!_818)
        {
            _1680 = _1242;
        }
        float _1690 = _1680;
        float _1692 = _1690;
        if (!_818)
        {
            _1686 = _1242;
        }
        float _1694 = _1686;
        if (!_818)
        {
            _1676 = _1242;
        }
        float _1696 = _1676;
        float _1698 = fma(_1622, _1688, _1662);
        float _1700 = fma(_1638, _1690, _1664);
        float _1702 = fma(_1648, _1694, _1666);
        float _1704 = fma(_1656, _1696, _1684);
        float _1706 = -_1700;
        float _1708 = _1706 + _1702;
        float _1710 = -_1704;
        float _1712 = _1698 + _1710;
        float _1714 = _1704;
        float _1716 = _1698;
        float _1718 = _1656;
        float _1720 = _1712;
        if (_818)
        {
            _1668 = 1.5;
        }
        float _1722 = _1668;
        _1148 = _1722;
        if (_818)
        {
            _1714 = 2.0;
        }
        float _1724 = _1714;
        float _1726 = _1712 + _1708;
        _1156 = _1724;
        _1158 = _1726;
        if (_818)
        {
            _1692 = 3.0;
        }
        float _1728 = _1692;
        _1162 = _1728;
        if (_818)
        {
            _1716 = 4.0;
        }
        float _1730 = _1716;
        _1166 = _1730;
        if (_818)
        {
            _1718 = 0.1500000059604644775390625;
        }
        float _1732 = _1718;
        _1170 = _1732;
        if (_818)
        {
            _1720 = 0.23000000417232513427734375;
        }
        float _1734 = _1720;
        _1174 = _1734;
        if (_818)
        {
            _1178 = 0.4199999868869781494140625;
        }
    }
    _1186 = false;
    float _1736 = _1178;
    float _1738 = _1174;
    float _1740 = _1170;
    float _1742 = _1014;
    float _1744 = _1032;
    float _1746 = _1180;
    float _1748 = _1162;
    float _1750 = _922;
    float _1752 = _1166;
    float _1754 = _930;
    float _1756 = _1156;
    float _1758 = _932;
    float _1760 = _1148;
    float _1762 = _934;
    float _1764 = _1182;
    float _1766 = _1184;
    float _1768 = _1158;
    float _1770 = _720 + _784;
    float _1772 = _168 + _1770;
    float _1774 = _1772 + _744;
    float _1776 = _1742;
    float _1778 = _1744;
    float _1780 = _1746;
    float _1782 = _1772;
    float _1784 = _1770;
    float _1786 = _1744;
    float _1788 = _1746;
    float _1790 = _1764;
    float _1792 = _1766;
    float _1794 = _1772;
    float _1796 = _1742;
    float _1798 = _1770;
    float _1800 = _1736;
    float _1802 = _1738;
    float _1804 = _1740;
    float _1806 = _1756;
    float _1808 = _1748;
    float _1810 = _1752;
    float _1812 = _1760;
    float _1814 = _1736;
    float _1816 = _1738;
    float _1818 = _1740;
    float _1820 = _1756;
    float _1822 = _1760;
    float _1824 = _1748;
    float _1826 = _1750;
    float _1828 = _1752;
    float _1996;
    float _2018;
    float _2066;
    float _2086;
    float _2088;
    float _2090;
    if (!_796)
    {
        if (_818)
        {
            _842 = _1736;
        }
        float _1830 = _842;
        if (_818)
        {
            _1776 = 0.60000002384185791015625;
        }
        float _1832 = _1776;
        if (_818)
        {
            _1778 = _1738;
        }
        float _1834 = _1778;
        float _1836 = _1830;
        if (!_818)
        {
            float _1838 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1836 = _1838;
        }
        float _1840 = _1836;
        if (_818)
        {
            _1780 = _1740;
        }
        float _1842 = _1780;
        float _1844 = _1832;
        if (!_818)
        {
            float _1846 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1844 = _1846;
        }
        float _1848 = _1844;
        float _1850 = _1834;
        if (!_818)
        {
            float _1852 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1850 = _1852;
        }
        float _1854 = _1850;
        float _1856 = _1842;
        if (!_818)
        {
            float _1858 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1856 = _1858;
        }
        float _1860 = _1856;
        if (_818)
        {
            _1782 = _1736;
        }
        float _1862 = _1782;
        float _1864 = _1774 * 6.283184051513671875;
        float _1866 = _558 * _1840;
        float _1868 = _1862;
        float _1870 = _1840;
        if (!_818)
        {
            _1868 = _1840;
        }
        float _1872 = _1868;
        float _1874 = _1872;
        if (_818)
        {
            _1870 = 0.60000002384185791015625;
        }
        float _1876 = _1870;
        float _1878 = 1.0 / _1866;
        float _1880 = _558 * _1848;
        float _1882 = _1876;
        if (!_818)
        {
            _1882 = _1848;
        }
        float _1884 = _1882;
        float _1886 = _558 * _1872;
        float _1888 = _558 * _1854;
        float _1890 = _1884;
        if (_818)
        {
            _1874 = _1738;
        }
        float _1892 = _1874;
        float _1894 = _1892;
        if (!_818)
        {
            _1894 = _1854;
        }
        float _1896 = _1894;
        float _1898 = 1.0 / _1880;
        float _1900 = _558 * _1860;
        float _1902 = _558 * _1896;
        float _1904 = 1.0 / _1888;
        float _1906 = _558 * _1884;
        if (_818)
        {
            _1890 = _1740;
        }
        float _1908 = _1890;
        float _1910 = _1908;
        if (!_818)
        {
            _1910 = _1860;
        }
        float _1912 = _1910;
        float _1914 = 1.0 / _1886;
        float _1916 = _558 * _1912;
        float _1918 = _1878 * _1864;
        float _1920 = _1918 * 0.15915493667125701904296875;
        float _1922 = _1898 * _1864;
        float _1924 = 1.0 / _1900;
        float _1926 = _1922 * 0.15915493667125701904296875;
        float _1928 = _1904 * _1864;
        float _1930 = 1.0 / _1906;
        float _1932 = _1928 * 0.15915493667125701904296875;
        float _1934 = 1.0 / _1902;
        float _1936 = _1924 * _1864;
        float _1938 = _1936 * 0.15915493667125701904296875;
        float _1940 = 1.0 / _1916;
        float _1942 = _1770 * _1914;
        float _1944 = _1770 * _1930;
        float _1946 = _1942 * 6.283184051513671875;
        float _1948 = _1920 * 6.283185482025146484375;
        float _1950 = sin(_1948);
        float _1952 = _1946 * 0.15915493667125701904296875;
        float _1954 = _1944 * 6.283184051513671875;
        float _1956 = _1770 * _1934;
        float _1958 = _1956 * 6.283184051513671875;
        float _1960 = _1952 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1954 * 0.15915493667125701904296875;
        float _1966 = _1770 * _1940;
        float _1968 = _1958 * 0.15915493667125701904296875;
        float _1970 = _1956;
        float _1972 = _1954;
        float _1974 = _1950;
        if (_818)
        {
            _1970 = _1748;
        }
        float _1976 = _1970;
        float _1978 = _1966 * 6.283184051513671875;
        float _1980 = _1976;
        if (!_818)
        {
            _1980 = _1750;
        }
        float _1982 = _1980;
        float _1984 = _1926 * 6.283185482025146484375;
        float _1986 = sin(_1984);
        float _1988 = _1982;
        if (_818)
        {
            _1972 = _1748;
        }
        float _1990 = _1972;
        float _1992 = _1978 * 0.15915493667125701904296875;
        float _1994 = _1990;
        _1996 = _1992;
        if (!_818)
        {
            _1994 = _1750;
        }
        float _1998 = _1994;
        float _2000 = _1998;
        if (_818)
        {
            _1784 = _1752;
        }
        float _2002 = _1784;
        float _2004 = _2002;
        if (!_818)
        {
            _2004 = _1754;
        }
        float _2006 = _2004;
        float _2008 = _1964 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = _1962 * _1982;
        float _2014 = _1950 * _1998;
        float _2016 = _2006;
        _2018 = _2012;
        if (_818)
        {
            _1988 = _1752;
        }
        float _2020 = _1988;
        float _2022 = _2020;
        if (!_818)
        {
            _2022 = _1754;
        }
        float _2024 = _2022;
        if (_818)
        {
            _1974 = _1756;
        }
        float _2026 = _1974;
        float _2028 = _1932 * 6.283185482025146484375;
        float _2030 = sin(_2028);
        float _2032 = fma(_1986, _2006, _2014);
        float _2034 = _2026;
        float _2036 = _1986;
        if (_818)
        {
            _2016 = _1756;
        }
        float _2038 = _2016;
        float _2040 = _2038;
        if (!_818)
        {
            _2034 = _1758;
        }
        float _2042 = _2034;
        if (!_818)
        {
            _2040 = _1758;
        }
        float _2044 = _2040;
        float _2046 = _1968 * 6.283185482025146484375;
        float _2048 = sin(_2046);
        float _2050 = fma(_2010, _2024, _2012);
        if (_818)
        {
            _2036 = _1760;
        }
        float _2052 = _2036;
        float _2054 = _2052;
        if (_818)
        {
            _2000 = _1760;
        }
        float _2056 = _2000;
        float _2058 = _2056;
        if (!_818)
        {
            _2054 = _1762;
        }
        float _2060 = _2054;
        float _2062 = _1938 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        _2066 = _2060;
        if (!_818)
        {
            _2058 = _1762;
        }
        float _2068 = _2058;
        float _2070 = fma(_2030, _2042, _2032);
        float _2072 = _1992 * 6.283185482025146484375;
        float _2074 = sin(_2072);
        float _2076 = fma(_2048, _2044, _2050);
        float _2078 = fma(_2064, _2060, _2070);
        float _2080 = fma(_2074, _2068, _2076);
        float _2082 = -_2080;
        float _2084 = _2078 + _2082;
        _2086 = _2070;
        _2088 = _2080;
        _2090 = _2084;
        _2092 = true;
    }
    else
    {
        if (_818)
        {
            _1786 = _1736;
        }
        float _2094 = _1786;
        if (_818)
        {
            _1788 = 0.60000002384185791015625;
        }
        float _2096 = _1788;
        float _2098 = _2094;
        if (!_818)
        {
            float _2100 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2098 = _2100;
        }
        float _2102 = _2098;
        if (_818)
        {
            _1790 = _1738;
        }
        float _2104 = _1790;
        float _2106 = _2096;
        if (!_818)
        {
            float _2108 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2106 = _2108;
        }
        float _2110 = _2106;
        float _2112 = _2104;
        if (!_818)
        {
            float _2114 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2112 = _2114;
        }
        float _2116 = _2112;
        if (_818)
        {
            _1792 = _1740;
        }
        float _2118 = _1792;
        float _2120 = _2118;
        if (!_818)
        {
            float _2122 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2120 = _2122;
        }
        float _2124 = _2120;
        if (_818)
        {
            _1794 = _1736;
        }
        float _2126 = _1794;
        float _2128 = _1774 * 6.283184051513671875;
        float _2130 = _2126;
        if (_818)
        {
            _1796 = _1736;
        }
        float _2132 = _1796;
        float _2134 = _2132;
        float _2136 = _2102;
        if (!_818)
        {
            _2130 = _2102;
        }
        float _2138 = _2130;
        float _2140 = _558 * _2102;
        float _2142 = _2138;
        if (!_818)
        {
            _2134 = _2102;
        }
        float _2144 = _2134;
        float _2146 = _558 * _2110;
        float _2148 = 1.0 / _2140;
        float _2150 = _558 * _2138;
        float _2152 = _2144;
        float _2154 = _2110;
        if (_818)
        {
            _2142 = _1736;
        }
        float _2156 = _2142;
        float _2158 = _558 * _2116;
        float _2160 = _2156;
        float _2162 = _2116;
        if (!_818)
        {
            _2160 = _2102;
        }
        float _2164 = _2160;
        float _2166 = _2164;
        if (_818)
        {
            _2136 = 0.60000002384185791015625;
        }
        float _2168 = _2136;
        float _2170 = 1.0 / _2146;
        float _2172 = _558 * _2144;
        float _2174 = _2168;
        if (_818)
        {
            _2152 = 0.60000002384185791015625;
        }
        float _2176 = _2152;
        float _2178 = _558 * _2164;
        float _2180 = _2176;
        if (!_818)
        {
            _2180 = _2110;
        }
        float _2182 = _2180;
        float _2184 = _558 * _2124;
        float _2186 = _2182;
        if (_818)
        {
            _2166 = 0.60000002384185791015625;
        }
        float _2188 = _2166;
        float _2190 = _2188;
        if (!_818)
        {
            _2190 = _2110;
        }
        float _2192 = _2190;
        float _2194 = _558 * _2182;
        if (_818)
        {
            _2186 = _1738;
        }
        float _2196 = _2186;
        float _2198 = 1.0 / _2158;
        float _2200 = _2196;
        if (!_818)
        {
            _2200 = _2116;
        }
        float _2202 = _2200;
        float _2204 = _2202;
        if (!_818)
        {
            _2174 = _2110;
        }
        float _2206 = _2174;
        if (_818)
        {
            _2154 = _1738;
        }
        float _2208 = _2154;
        float _2210 = _2208;
        if (!_818)
        {
            _2210 = _2116;
        }
        float _2212 = _2210;
        float _2214 = 1.0 / _2172;
        float _2216 = _558 * _2192;
        float _2218 = _558 * _2202;
        float _2220 = _2212;
        if (_818)
        {
            _2204 = _1738;
        }
        float _2222 = _2204;
        float _2224 = _558 * _2206;
        float _2226 = _2222;
        if (!_818)
        {
            _2226 = _2116;
        }
        float _2228 = _2226;
        if (_818)
        {
            _2162 = _1740;
        }
        float _2230 = _2162;
        float _2232 = 1.0 / _2150;
        float _2234 = _558 * _2212;
        float _2236 = _2230;
        if (_818)
        {
            _2220 = _1740;
        }
        float _2238 = _2220;
        float _2240 = _2238;
        if (!_818)
        {
            _2240 = _2124;
        }
        float _2242 = _2240;
        float _2244 = _2242;
        if (!_818)
        {
            _2236 = _2124;
        }
        float _2246 = _2236;
        float _2248 = 1.0 / _2194;
        float _2250 = 1.0 / _2184;
        float _2252 = _558 * _2228;
        float _2254 = _558 * _2242;
        if (_818)
        {
            _2244 = _1740;
        }
        float _2256 = _2244;
        float _2258 = _2256;
        if (!_818)
        {
            _2258 = _2124;
        }
        float _2260 = _2258;
        float _2262 = 1.0 / _2252;
        float _2264 = _558 * _2246;
        float _2266 = _558 * _2260;
        float _2268 = _784 + _744;
        float _2270 = 1.0 / _2216;
        float _2272 = _2148 * _2128;
        float _2274 = _2268 * 6.283184051513671875;
        float _2276 = _2214 * _2274;
        float _2278 = 1.0 / _2178;
        float _2280 = _2272 * 0.15915493667125701904296875;
        float _2282 = _2170 * _2128;
        float _2284 = _2282 * 0.15915493667125701904296875;
        float _2286 = _2198 * _2128;
        float _2288 = 1.0 / _2234;
        float _2290 = 1.0 / _2266;
        float _2292 = _2286 * 0.15915493667125701904296875;
        float _2294 = _2250 * _2128;
        float _2296 = _784 * 6.283184051513671875;
        float _2298 = _2294 * 0.15915493667125701904296875;
        float _2300 = _2278 * _2296;
        float _2302 = _2280 * 6.283185482025146484375;
        float _2304 = sin(_2302);
        float _2306 = _2276 * 0.15915493667125701904296875;
        float _2308 = _1770 * _2232;
        float _2310 = _2300 * 0.15915493667125701904296875;
        float _2312 = _2248 * _2274;
        float _2314 = _2308 * 6.283184051513671875;
        float _2316 = _2312 * 0.15915493667125701904296875;
        float _2318 = 1.0 / _2224;
        float _2320 = _2314 * 0.15915493667125701904296875;
        float _2322 = _2270 * _2296;
        float _2324 = _2288 * _2274;
        float _2326 = _2322 * 0.15915493667125701904296875;
        float _2328 = _2322;
        float _2330 = _2324;
        if (_818)
        {
            _2328 = _1748;
        }
        float _2332 = _2328;
        float _2334 = _2306 * 6.283185482025146484375;
        float _2336 = sin(_2334);
        float _2338 = _2332;
        if (!_818)
        {
            _2338 = _1750;
        }
        float _2340 = _2338;
        float _2342 = _2324 * 0.15915493667125701904296875;
        float _2344 = _2340;
        if (_818)
        {
            _2330 = _1748;
        }
        float _2346 = _2330;
        float _2348 = _2346;
        if (!_818)
        {
            _2348 = _1750;
        }
        float _2350 = _2348;
        float _2352 = _2304 * _2340;
        float _2354 = _2304;
        if (_818)
        {
            _2354 = _1748;
        }
        float _2356 = _2354;
        float _2358 = _2310 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        float _2362 = _2356;
        if (_818)
        {
            _2344 = _1748;
        }
        float _2364 = _2344;
        float _2366 = _1770 * _2318;
        float _2368 = _2364;
        float _2370 = _2366;
        if (!_818)
        {
            _2362 = _1750;
        }
        float _2372 = _2362;
        float _2374 = _2372;
        if (!_818)
        {
            _2368 = _1750;
        }
        float _2376 = _2368;
        float _2378 = _2320 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = 1.0 / _2218;
        float _2384 = _2360 * _2376;
        float _2386 = _2376;
        if (_818)
        {
            _2386 = _1752;
        }
        float _2388 = _2386;
        float _2390 = _2388;
        if (!_818)
        {
            _2390 = _1754;
        }
        float _2392 = _2390;
        float _2394 = _2326 * 6.283185482025146484375;
        float _2396 = sin(_2394);
        float _2398 = 1.0 / _2264;
        float _2400 = _1770 * _2382;
        float _2402 = _2316 * 6.283185482025146484375;
        float _2404 = sin(_2402);
        float _2406 = _2262 * _2296;
        float _2408 = fma(_2396, _2392, _2384);
        float _2410 = _2400 * 6.283184051513671875;
        float _2412 = _2400;
        float _2414 = _2410;
        if (_818)
        {
            _2412 = _1752;
        }
        float _2416 = _2412;
        float _2418 = _2406 * 0.15915493667125701904296875;
        float _2420 = _2336 * _2372;
        float _2422 = _2380 * _2350;
        float _2424 = 1.0 / _2254;
        float _2426 = _2366 * 6.283184051513671875;
        float _2428 = _2416;
        if (_818)
        {
            _2370 = _1752;
        }
        float _2430 = _2370;
        float _2432 = _2398 * _2274;
        float _2434 = _2430;
        if (!_818)
        {
            _2434 = _1754;
        }
        float _2436 = _2434;
        float _2438 = _2426 * 0.15915493667125701904296875;
        if (_818)
        {
            _2374 = _1752;
        }
        float _2440 = _2374;
        float _2442 = _2290 * _2296;
        float _2444 = _2284 * 6.283185482025146484375;
        float _2446 = sin(_2444);
        float _2448 = _2440;
        if (!_818)
        {
            _2448 = _1754;
        }
        float _2450 = _2448;
        float _2452 = fma(_2404, _2436, _2420);
        float _2454 = _2442 * 0.15915493667125701904296875;
        float _2456 = _2432 * 0.15915493667125701904296875;
        if (!_818)
        {
            _2428 = _1754;
        }
        float _2458 = _2428;
        float _2460 = _2292 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        float _2464 = _1770 * _2424;
        float _2466 = _2424;
        float _2468 = _2458;
        if (_818)
        {
            _2466 = _1756;
        }
        float _2470 = _2466;
        float _2472 = _2470;
        if (!_818)
        {
            _2472 = _1758;
        }
        float _2474 = _2472;
        float _2476 = _2464 * 6.283184051513671875;
        float _2478 = _2474;
        float _2480 = _2476;
        if (_818)
        {
            _1798 = _1756;
        }
        float _2482 = _1798;
        float _2484 = _2438 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        float _2488 = fma(_2446, _2450, _2352);
        float _2490 = _2410 * 0.15915493667125701904296875;
        float _2492 = _2482;
        if (_818)
        {
            _2414 = _1756;
        }
        float _2494 = _2414;
        float _2496 = _2494;
        if (!_818)
        {
            _2492 = _1758;
        }
        float _2498 = _2492;
        float _2500 = _2498;
        if (!_818)
        {
            _2496 = _1758;
        }
        float _2502 = _2496;
        float _2504 = _2342 * 6.283185482025146484375;
        float _2506 = sin(_2504);
        float _2508 = fma(_2462, _2474, _2488);
        float _2510 = _2502;
        if (_818)
        {
            _2478 = _1760;
        }
        float _2512 = _2478;
        float _2514 = _2512;
        if (!_818)
        {
            _2514 = _1762;
        }
        float _2516 = _2514;
        float _2518 = _2418 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        float _2522 = fma(_2486, _2458, _2422);
        _2066 = _2516;
        if (_818)
        {
            _2468 = _1756;
        }
        float _2524 = _2468;
        float _2526 = _2524;
        if (!_818)
        {
            _2526 = _1758;
        }
        float _2528 = _2526;
        float _2530 = _2454 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = fma(_2506, _2498, _2452);
        if (_818)
        {
            _2500 = _1760;
        }
        float _2536 = _2500;
        float _2538 = _2536;
        if (!_818)
        {
            _2538 = _1762;
        }
        float _2540 = _2538;
        float _2542 = _2490 * 6.283185482025146484375;
        float _2544 = sin(_2542);
        float _2546 = _2476 * 0.15915493667125701904296875;
        float _2548 = fma(_2520, _2502, _2408);
        _2018 = _2546;
        if (_818)
        {
            _2480 = _1760;
        }
        float _2550 = _2480;
        float _2552 = _2550;
        if (_818)
        {
            _2510 = _1760;
        }
        float _2554 = _2510;
        float _2556 = _2554;
        if (!_818)
        {
            _2552 = _1762;
        }
        float _2558 = _2552;
        float _2560 = _2298 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        _2086 = _2558;
        if (!_818)
        {
            _2556 = _1762;
        }
        float _2564 = _2556;
        float _2566 = fma(_2532, _2564, _2548);
        float _2568 = _2456 * 6.283185482025146484375;
        float _2570 = sin(_2568);
        float _2572 = fma(_2544, _2528, _2522);
        float _2574 = _2546 * 6.283185482025146484375;
        float _2576 = sin(_2574);
        float _2578 = fma(_2562, _2558, _2508);
        float _2580 = fma(_2570, _2540, _2534);
        float _2582 = -_2580;
        float _2584 = _2582 + _2566;
        float _2586 = fma(_2576, _2516, _2572);
        float _2588 = -_2586;
        float _2590 = _2578 + _2588;
        float _2592 = _2590 + _2584;
        _2088 = _2590;
        _1996 = _2572;
        _2090 = _2592;
    }
    _2092 = false;
    float _2594 = _2066;
    float _2596 = _2086;
    float _2598 = _2018;
    float _2600 = _2088;
    float _2602 = _1996;
    float _2604 = _2090;
    float _2606 = _720 + _786;
    float _2608 = _168 + _2606;
    float _2610 = _2608 + _744;
    float _2612 = _2608;
    float _2614 = _2594;
    float _2616 = _2596;
    float _2618 = _2596;
    float _2620 = _2598;
    float _2622 = _2600;
    float _2624 = _2602;
    float _2626 = _2608;
    float _2628 = _2594;
    float _2630 = _2606;
    float _2632 = _2604;
    float _2796;
    float _2848;
    float _2850;
    float _2852;
    if (!_796)
    {
        if (_818)
        {
            _844 = _1736;
        }
        float _2634 = _844;
        if (_818)
        {
            _2612 = 0.60000002384185791015625;
        }
        float _2636 = _2612;
        if (_818)
        {
            _2614 = _1738;
        }
        float _2638 = _2614;
        float _2640 = _2634;
        if (!_818)
        {
            float _2642 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2640 = _2642;
        }
        float _2644 = _2640;
        if (_818)
        {
            _2616 = _1740;
        }
        float _2646 = _2616;
        float _2648 = _2636;
        if (!_818)
        {
            float _2650 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2648 = _2650;
        }
        float _2652 = _2648;
        float _2654 = _2638;
        if (!_818)
        {
            float _2656 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2654 = _2656;
        }
        float _2658 = _2654;
        float _2660 = _2646;
        if (!_818)
        {
            float _2662 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2660 = _2662;
        }
        float _2664 = _2660;
        float _2666 = _2610 * 6.283184051513671875;
        float _2668 = _558 * _2644;
        float _2670 = _2644;
        if (!_818)
        {
            _1800 = _2644;
        }
        float _2672 = _1800;
        if (_818)
        {
            _2670 = 0.60000002384185791015625;
        }
        float _2674 = _2670;
        float _2676 = 1.0 / _2668;
        float _2678 = _558 * _2652;
        float _2680 = _2674;
        if (!_818)
        {
            _2680 = _2652;
        }
        float _2682 = _2680;
        float _2684 = _558 * _2672;
        float _2686 = _558 * _2658;
        if (!_818)
        {
            _1802 = _2658;
        }
        float _2688 = _1802;
        float _2690 = _558 * _2682;
        float _2692 = 1.0 / _2678;
        float _2694 = _558 * _2664;
        if (!_818)
        {
            _1804 = _2664;
        }
        float _2696 = _1804;
        float _2698 = _558 * _2696;
        float _2700 = 1.0 / _2686;
        float _2702 = _558 * _2688;
        float _2704 = _2676 * _2666;
        float _2706 = _2704 * 0.15915493667125701904296875;
        float _2708 = 1.0 / _2694;
        float _2710 = _2692 * _2666;
        float _2712 = _2710 * 0.15915493667125701904296875;
        float _2714 = 1.0 / _2684;
        float _2716 = _2700 * _2666;
        float _2718 = 1.0 / _2690;
        float _2720 = _2716 * 0.15915493667125701904296875;
        float _2722 = _2708 * _2666;
        float _2724 = 1.0 / _2702;
        float _2726 = _2606 * _2714;
        float _2728 = _2726 * 6.283184051513671875;
        float _2730 = 1.0 / _2698;
        float _2732 = _2728 * 0.15915493667125701904296875;
        float _2734 = _2702;
        if (_818)
        {
            _2734 = _1756;
        }
        float _2736 = _2734;
        float _2738 = _2736;
        if (!_818)
        {
            _2738 = _1758;
        }
        float _2740 = _2738;
        if (!_818)
        {
            _1806 = _1758;
        }
        float _2742 = _1806;
        float _2744 = _2706 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2722 * 0.15915493667125701904296875;
        float _2750 = _2606 * _2718;
        float _2752 = _2750 * 6.283184051513671875;
        float _2754 = _2606 * _2724;
        float _2756 = _2606 * _2730;
        float _2758 = _2732 * 6.283185482025146484375;
        float _2760 = sin(_2758);
        float _2762 = _2752 * 0.15915493667125701904296875;
        float _2764 = _2754 * 6.283184051513671875;
        float _2766 = _2756 * 6.283184051513671875;
        float _2768 = _2752;
        float _2770 = _2764;
        if (_818)
        {
            _2768 = _1748;
        }
        float _2772 = _2768;
        float _2774 = _2764 * 0.15915493667125701904296875;
        float _2776 = _2766 * 0.15915493667125701904296875;
        float _2778 = _2712 * 6.283185482025146484375;
        float _2780 = sin(_2778);
        float _2782 = _2772;
        if (!_818)
        {
            _2782 = _1750;
        }
        float _2784 = _2782;
        if (!_818)
        {
            _1808 = _1750;
        }
        float _2786 = _1808;
        float _2788 = _2786;
        if (_818)
        {
            _2770 = _1752;
        }
        float _2790 = _2770;
        float _2792 = _2746 * _2784;
        float _2794 = _2790;
        _2796 = _2792;
        if (!_818)
        {
            _2794 = _1754;
        }
        float _2798 = _2794;
        float _2800 = _2762 * 6.283185482025146484375;
        float _2802 = sin(_2800);
        if (!_818)
        {
            _1810 = _1754;
        }
        float _2804 = _1810;
        float _2806 = _2760 * _2786;
        if (_818)
        {
            _2788 = _1760;
        }
        float _2808 = _2788;
        float _2810 = _2808;
        if (!_818)
        {
            _2810 = _1762;
        }
        float _2812 = _2810;
        if (!_818)
        {
            _1812 = _1762;
        }
        float _2814 = _1812;
        float _2816 = _2720 * 6.283185482025146484375;
        float _2818 = sin(_2816);
        float _2820 = fma(_2780, _2798, _2792);
        float _2822 = _2774 * 6.283185482025146484375;
        float _2824 = sin(_2822);
        float _2826 = fma(_2802, _2804, _2806);
        float _2828 = _2748 * 6.283185482025146484375;
        float _2830 = sin(_2828);
        float _2832 = fma(_2818, _2740, _2820);
        float _2834 = _2776 * 6.283185482025146484375;
        float _2836 = sin(_2834);
        float _2838 = fma(_2824, _2742, _2826);
        float _2840 = fma(_2830, _2812, _2832);
        float _2842 = fma(_2836, _2814, _2838);
        float _2844 = -_2842;
        float _2846 = _2840 + _2844;
        _2848 = _2846;
        _2850 = _2832;
        _2852 = _2840;
        _2854 = true;
    }
    else
    {
        if (_818)
        {
            _2618 = _1736;
        }
        float _2856 = _2618;
        if (_818)
        {
            _2620 = 0.60000002384185791015625;
        }
        float _2858 = _2620;
        if (_818)
        {
            _2622 = _1738;
        }
        float _2860 = _2622;
        float _2862 = _2856;
        if (!_818)
        {
            float _2864 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2862 = _2864;
        }
        float _2866 = _2862;
        float _2868 = _2858;
        if (!_818)
        {
            float _2870 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2868 = _2870;
        }
        float _2872 = _2868;
        if (_818)
        {
            _2624 = _1740;
        }
        float _2874 = _2624;
        float _2876 = _2860;
        if (!_818)
        {
            float _2878 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2876 = _2878;
        }
        float _2880 = _2876;
        float _2882 = _2874;
        if (!_818)
        {
            float _2884 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2882 = _2884;
        }
        float _2886 = _2882;
        if (_818)
        {
            _2626 = _1736;
        }
        float _2888 = _2626;
        float _2890 = _2610 * 6.283184051513671875;
        float _2892 = _2888;
        if (_818)
        {
            _2628 = _1736;
        }
        float _2894 = _2628;
        float _2896 = _786 * 6.283184051513671875;
        float _2898 = _558 * _2866;
        float _2900 = _2894;
        float _2902 = _2866;
        if (!_818)
        {
            _2892 = _2866;
        }
        float _2904 = _2892;
        if (!_818)
        {
            _2900 = _2866;
        }
        float _2906 = _2900;
        float _2908 = _558 * _2872;
        float _2910 = _2906;
        float _2912 = _2872;
        if (!_818)
        {
            _1814 = _2866;
        }
        float _2914 = _1814;
        float _2916 = 1.0 / _2898;
        float _2918 = _2914;
        if (_818)
        {
            _2902 = 0.60000002384185791015625;
        }
        float _2920 = _2902;
        float _2922 = _558 * _2880;
        float _2924 = _2920;
        if (!_818)
        {
            _2924 = _2872;
        }
        float _2926 = _2924;
        float _2928 = _558 * _2914;
        float _2930 = _2926;
        if (_818)
        {
            _2918 = 0.60000002384185791015625;
        }
        float _2932 = _2918;
        float _2934 = _558 * _2886;
        float _2936 = _2932;
        if (!_818)
        {
            _2936 = _2872;
        }
        float _2938 = _2936;
        float _2940 = 1.0 / _2908;
        float _2942 = _558 * _2906;
        if (_818)
        {
            _2910 = 0.60000002384185791015625;
        }
        float _2944 = _2910;
        float _2946 = _558 * _2904;
        float _2948 = _2944;
        if (!_818)
        {
            _2948 = _2872;
        }
        float _2950 = _2948;
        if (_818)
        {
            _2912 = _1738;
        }
        float _2952 = _2912;
        float _2954 = _2952;
        if (!_818)
        {
            _2954 = _2880;
        }
        float _2956 = _2954;
        float _2958 = _558 * _2926;
        float _2960 = _2956;
        if (_818)
        {
            _2930 = _1738;
        }
        float _2962 = _2930;
        float _2964 = 1.0 / _2922;
        float _2966 = _2962;
        if (!_818)
        {
            _2966 = _2880;
        }
        float _2968 = _2966;
        float _2970 = _558 * _2950;
        float _2972 = _2968;
        if (!_818)
        {
            _1816 = _2880;
        }
        float _2974 = _1816;
        float _2976 = 1.0 / _2942;
        float _2978 = _558 * _2938;
        float _2980 = _558 * _2956;
        if (_818)
        {
            _2960 = _1740;
        }
        float _2982 = _2960;
        float _2984 = _558 * _2974;
        float _2986 = _2982;
        if (!_818)
        {
            _2986 = _2886;
        }
        float _2988 = _2986;
        float _2990 = 1.0 / _2934;
        float _2992 = _558 * _2968;
        if (_818)
        {
            _2972 = _1740;
        }
        float _2994 = _2972;
        float _2996 = _558 * _2988;
        float _2998 = _2994;
        if (!_818)
        {
            _2998 = _2886;
        }
        float _3000 = _2998;
        if (!_818)
        {
            _1818 = _2886;
        }
        float _3002 = _1818;
        float _3004 = 1.0 / _2992;
        float _3006 = _558 * _3000;
        float _3008 = 1.0 / _2928;
        float _3010 = _558 * _3002;
        float _3012 = _2916 * _2890;
        float _3014 = 1.0 / _2984;
        float _3016 = 1.0 / _2958;
        float _3018 = _3012 * 0.15915493667125701904296875;
        float _3020 = _2940 * _2890;
        float _3022 = _3020 * 0.15915493667125701904296875;
        float _3024 = _2964 * _2890;
        float _3026 = 1.0 / _2978;
        float _3028 = _786 + _744;
        float _3030 = _3008 * _2896;
        float _3032 = _3024 * 0.15915493667125701904296875;
        float _3034 = _2990 * _2890;
        float _3036 = _3028 * 6.283184051513671875;
        float _3038 = 1.0 / _2996;
        float _3040 = _2976 * _3036;
        float _3042 = _3030 * 0.15915493667125701904296875;
        float _3044 = _3016 * _3036;
        float _3046 = _3034 * 0.15915493667125701904296875;
        float _3048 = _3040 * 0.15915493667125701904296875;
        float _3050 = _3044 * 0.15915493667125701904296875;
        float _3052 = 1.0 / _2946;
        float _3054 = _3026 * _2896;
        float _3056 = _3026;
        float _3058 = _3004;
        float _3060 = _3036;
        float _3062 = _3032;
        if (_818)
        {
            _3056 = _1760;
        }
        float _3064 = _3056;
        float _3066 = _3064;
        if (!_818)
        {
            _3066 = _1762;
        }
        float _3068 = _3066;
        float _3070 = _3054 * 0.15915493667125701904296875;
        float _3072 = _3004 * _3036;
        if (_818)
        {
            _3058 = _1756;
        }
        float _3074 = _3058;
        float _3076 = 1.0 / _3010;
        float _3078 = _3074;
        if (!_818)
        {
            _3078 = _1758;
        }
        float _3080 = _3078;
        float _3082 = _3072 * 0.15915493667125701904296875;
        float _3084 = _3038 * _3036;
        float _3086 = _3038;
        if (_818)
        {
            _3060 = _1756;
        }
        float _3088 = _3060;
        float _3090 = _3088;
        if (!_818)
        {
            _3090 = _1758;
        }
        float _3092 = _3090;
        float _3094 = _3084 * 0.15915493667125701904296875;
        float _3096 = 1.0 / _2970;
        float _3098 = _2606 * _3052;
        float _3100 = _3096;
        if (_818)
        {
            _3086 = _1760;
        }
        float _3102 = _3086;
        float _3104 = _3102;
        if (!_818)
        {
            _3104 = _1762;
        }
        float _3106 = _3104;
        float _3108 = _3098 * 6.283184051513671875;
        float _3110 = 1.0 / _2980;
        float _3112 = _3076 * _2896;
        float _3114 = _3076;
        float _3116 = _3108;
        if (_818)
        {
            _3114 = _1756;
        }
        float _3118 = _3114;
        float _3120 = _3118;
        if (!_818)
        {
            _3120 = _1758;
        }
        float _3122 = _3120;
        if (!_818)
        {
            _1820 = _1758;
        }
        float _3124 = _1820;
        float _3126 = _3108 * 0.15915493667125701904296875;
        float _3128 = 1.0 / _3006;
        if (_818)
        {
            _3116 = _1748;
        }
        float _3130 = _3116;
        float _3132 = _3130;
        if (!_818)
        {
            _3132 = _1750;
        }
        float _3134 = _3132;
        float _3136 = _3048 * 6.283185482025146484375;
        float _3138 = sin(_3136);
        float _3140 = _2606 * _3110;
        float _3142 = _3018 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        float _3146 = _3014 * _2896;
        float _3148 = _3112 * 0.15915493667125701904296875;
        float _3150 = _2606 * _3096;
        float _3152 = _2606 * _3128;
        float _3154 = _3146 * 0.15915493667125701904296875;
        float _3156 = _3154;
        if (_818)
        {
            _3100 = _1748;
        }
        float _3158 = _3100;
        float _3160 = _3150 * 6.283184051513671875;
        float _3162 = _3042 * 6.283185482025146484375;
        float _3164 = sin(_3162);
        float _3166 = _3158;
        if (!_818)
        {
            _3166 = _1750;
        }
        float _3168 = _3166;
        float _3170 = _3160 * 0.15915493667125701904296875;
        float _3172 = _3140 * 6.283184051513671875;
        float _3174 = _3172;
        if (_818)
        {
            _2630 = _1752;
        }
        float _3176 = _2630;
        float _3178 = _3176;
        if (!_818)
        {
            _3178 = _1754;
        }
        float _3180 = _3178;
        float _3182 = _3126 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        float _3186 = _3172 * 0.15915493667125701904296875;
        if (_818)
        {
            _3174 = _1752;
        }
        float _3188 = _3174;
        float _3190 = _3144 * _3168;
        float _3192 = _3188;
        _2796 = _3190;
        if (!_818)
        {
            _3192 = _1754;
        }
        float _3194 = _3192;
        float _3196 = _3032 * 6.283185482025146484375;
        float _3198 = sin(_3196);
        float _3200 = _3022 * 6.283185482025146484375;
        float _3202 = sin(_3200);
        if (_818)
        {
            _3062 = _1760;
        }
        float _3204 = _3062;
        float _3206 = _3184 * _3134;
        float _3208 = _3204;
        if (!_818)
        {
            _3208 = _1762;
        }
        float _3210 = _3208;
        if (!_818)
        {
            _1822 = _1762;
        }
        float _3212 = _1822;
        float _3214 = _3152 * 6.283184051513671875;
        float _3216 = _3050 * 6.283185482025146484375;
        float _3218 = sin(_3216);
        float _3220 = _3214 * 0.15915493667125701904296875;
        float _3222 = _3070 * 6.283185482025146484375;
        float _3224 = sin(_3222);
        float _3226 = _3170 * 6.283185482025146484375;
        float _3228 = sin(_3226);
        float _3230 = _3154 * 6.283185482025146484375;
        float _3232 = sin(_3230);
        float _3234 = _3082 * 6.283185482025146484375;
        float _3236 = sin(_3234);
        if (_818)
        {
            _3156 = _1748;
        }
        float _3238 = _3156;
        float _3240 = fma(_3228, _3180, _3206);
        float _3242 = _3238;
        _2850 = _3228;
        if (!_818)
        {
            _3242 = _1750;
        }
        float _3244 = _3242;
        _2852 = _3244;
        if (!_818)
        {
            _1824 = _1750;
        }
        float _3246 = _1824;
        if (_818)
        {
            _1826 = _1752;
        }
        float _3248 = _1826;
        float _3250 = _3186 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = _3248;
        if (!_818)
        {
            _3254 = _1754;
        }
        float _3256 = _3254;
        float _3258 = _3138 * _3244;
        if (!_818)
        {
            _1828 = _1754;
        }
        float _3260 = _1828;
        float _3262 = _3164 * _3246;
        float _3264 = fma(_3202, _3256, _3190);
        float _3266 = fma(_3218, _3194, _3258);
        float _3268 = _3046 * 6.283185482025146484375;
        float _3270 = sin(_3268);
        float _3272 = fma(_3224, _3260, _3262);
        float _3274 = fma(_3198, _3080, _3264);
        float _3276 = fma(_3236, _3122, _3266);
        float _3278 = fma(_3232, _3124, _3272);
        float _3280 = _3094 * 6.283185482025146484375;
        float _3282 = sin(_3280);
        float _3284 = fma(_3252, _3092, _3240);
        float _3286 = _3148 * 6.283185482025146484375;
        float _3288 = sin(_3286);
        float _3290 = fma(_3270, _3210, _3274);
        float _3292 = _3220 * 6.283185482025146484375;
        float _3294 = sin(_3292);
        float _3296 = fma(_3282, _3068, _3276);
        float _3298 = fma(_3288, _3212, _3278);
        float _3300 = -_3296;
        float _3302 = _3300 + _3298;
        float _3304 = fma(_3294, _3106, _3284);
        float _3306 = -_3304;
        float _3308 = _3290 + _3306;
        float _3310 = _3308 + _3302;
        _2848 = _3310;
    }
    _2854 = false;
    float _3312 = _2848;
    float _3314 = _2796;
    float _3316 = _2850;
    float _3318 = _2852;
    float _3320 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3322 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3324 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3326 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3328 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3330 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _3332 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _3334 = uint(int(uint(_234) >> uint(2)));
    float _3336 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3334)]);
    float _3338 = fma(_568, _1768, _820);
    float _3340 = fma(_570, _2604, _822);
    float _3342 = fma(_572, _3312, _824);
    bool _3344 = _3320 > 0.0;
    bool _3346 = _3322 > 0.0;
    float _3348 = _3324 * _3322;
    float _3350 = _168 * _3326;
    float _3352 = _3314;
    float _3354 = _3324;
    bool _3356 = _3346;
    float _3358 = _3348;
    float _3360 = _3316;
    float _3362 = _3350;
    float _3364 = _3328;
    float _3366 = _3332;
    float _3368 = _3318;
    if (_3344)
    {
        float _3370 = 1.0 / _3320;
        _3352 = _3370;
    }
    float _3372 = _3352;
    float _3374 = _168 * _3330;
    float _3376 = _3374;
    if (_3346)
    {
        float _3378 = -_3348;
        float _3380 = fma(_286, _3378, _3324);
        _3354 = _3380;
    }
    float _3382 = _3354;
    float _3384 = _168 * _3328;
    float _3386 = _3372;
    float _3388 = _3382;
    if (_3344)
    {
        float _3390 = _610 * _3372;
        _3386 = _3390;
    }
    float _3392 = _3386;
    float _3394 = _3392;
    if (_3344)
    {
        float _3396 = precise::min(_3392, 1.0);
        _3394 = _3396;
    }
    float _3398 = _3394;
    float _3400 = _3398;
    if (_3344)
    {
        float _3402 = _3398 * _3382;
        _3388 = _3402;
    }
    float _3404 = _3388;
    float _3406 = _3384 * _3404;
    float _3408 = _3350 * _3404;
    float _3410 = _3374 * _3404;
    bool _3412 = !_176;
    float _3414 = _3404;
    float _3416 = _3408;
    float _3418 = _3410;
    int _3420 = as_type<int>(_3336);
    float _3542;
    if (!_3412)
    {
        float _3422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3438 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3440 = _3426 * _3428;
        float _3442 = _3426 * _3430;
        float _3444 = _3424 * _3428;
        float _3446 = -_3440;
        float _3448 = fma(_3422, _3432, _3446);
        float _3450 = -_3442;
        float _3452 = fma(_3424, _3432, _3450);
        float _3454 = -_3444;
        float _3456 = fma(_3422, _3430, _3454);
        float _3458 = _3436 * _3422;
        float _3460 = _3436 * _3448;
        float _3462 = _3438 * _3424;
        float _3464 = _3434 * _3430;
        float _3466 = -_3458;
        float _3468 = fma(_3434, _3424, _3466);
        float _3470 = -_3460;
        float _3472 = fma(_3434, _3452, _3470);
        float _3474 = _3436 * _3432;
        float _3476 = _3438 * _3428;
        float _3478 = _3434 * _3426;
        float _3480 = fma(_3438, _3456, _3472);
        float _3482 = -_3474;
        float _3484 = fma(_3438, _3430, _3482);
        float _3486 = -_3476;
        float _3488 = fma(_3434, _3432, _3486);
        float _3490 = -_3464;
        float _3492 = fma(_3436, _3428, _3490);
        float _3494 = 1.0 / _3480;
        float _3496 = -_3478;
        float _3498 = fma(_3438, _3422, _3496);
        float _3500 = -_3422;
        float _3502 = fma(_3500, _3432, _3440);
        float _3504 = -_3462;
        float _3506 = fma(_3436, _3426, _3504);
        float _3508 = _3484 * _3494;
        float _3510 = _3488 * _3494;
        float _3512 = _3492 * _3494;
        float _3514 = _3408 * _3494;
        float _3516 = _3406 * _3508;
        float _3518 = _3406 * _3510;
        float _3520 = _3502 * _3494;
        float _3522 = _3406 * _3512;
        float _3524 = _3506 * _3494;
        float _3526 = _3498 * _3494;
        float _3528 = fma(_3452, _3514, _3516);
        float _3530 = fma(_3408, _3520, _3518);
        float _3532 = _3468 * _3494;
        float _3534 = fma(_3456, _3514, _3522);
        float _3536 = fma(_3410, _3524, _3528);
        float _3538 = fma(_3410, _3526, _3530);
        float _3540 = fma(_3410, _3532, _3534);
        _750 = _3530;
        _752 = _3524;
        _754 = _3516;
        _3414 = _3528;
        _3358 = _3434;
        _2632 = _3436;
        _3400 = _3438;
        _3360 = _3526;
        _3362 = _3518;
        _3364 = _3430;
        _3376 = _3432;
        _3366 = _3510;
        _3542 = _3538;
        _3416 = _3536;
        _3418 = _3540;
        _3368 = _3506;
        _3544 = true;
    }
    else
    {
        int _3546 = as_type<int>(_170) & 1024;
        bool _3548 = _3546 != 0;
        if (_3548)
        {
            _3356 = true;
        }
        bool _3550 = _3356;
        bool _3552 = _3550;
        if (!_3548)
        {
            int _3554 = as_type<int>(_170) & 2048;
            bool _3556 = _3554 != 0;
            _3552 = _3556;
        }
        bool _3558 = _3552;
        if (!_3558)
        {
            _330 = _3406;
        }
        float _3560 = _330;
        bool _3562 = !_3558;
        _3542 = _3560;
        if (!_3562)
        {
            uint _3564 = uint(int(uint(_232) >> uint(2)));
            float _3566 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3564)]);
            int _3568 = _232 + 4;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3570)]);
            int _3574 = _232 + 8;
            uint _3576 = uint(int(uint(_3574) >> uint(2)));
            float _3578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3576)]);
            uint _3580 = uint(int(uint(_232) >> uint(2)));
            float _3582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3580)]);
            int _3584 = _232 + 4;
            uint _3586 = uint(int(uint(_3584) >> uint(2)));
            float _3588 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3586)]);
            int _3590 = _232 + 8;
            uint _3592 = uint(int(uint(_3590) >> uint(2)));
            float _3594 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3592)]);
            uint _3596 = uint(int(uint(_232) >> uint(2)));
            float _3598 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3596)]);
            int _3600 = _232 + 4;
            uint _3602 = uint(int(uint(_3600) >> uint(2)));
            float _3604 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3602)]);
            int _3606 = _232 + 8;
            uint _3608 = uint(int(uint(_3606) >> uint(2)));
            float _3610 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3608)]);
            float _3612 = _3578 * _3582;
            float _3614 = _3578 * _3588;
            float _3616 = _3572 * _3582;
            float _3618 = -_3612;
            float _3620 = fma(_3566, _3594, _3618);
            float _3622 = -_3614;
            float _3624 = fma(_3572, _3594, _3622);
            float _3626 = -_3616;
            float _3628 = fma(_3566, _3588, _3626);
            float _3630 = _3604 * _3566;
            float _3632 = _3604 * _3620;
            float _3634 = _3610 * _3572;
            float _3636 = _3598 * _3588;
            float _3638 = -_3630;
            float _3640 = fma(_3598, _3572, _3638);
            float _3642 = -_3632;
            float _3644 = fma(_3598, _3624, _3642);
            float _3646 = _3604 * _3594;
            float _3648 = _3610 * _3582;
            float _3650 = _3598 * _3578;
            float _3652 = fma(_3610, _3628, _3644);
            float _3654 = -_3646;
            float _3656 = fma(_3610, _3588, _3654);
            float _3658 = -_3648;
            float _3660 = fma(_3598, _3594, _3658);
            float _3662 = -_3636;
            float _3664 = fma(_3604, _3582, _3662);
            float _3666 = 1.0 / _3652;
            float _3668 = -_3650;
            float _3670 = fma(_3610, _3566, _3668);
            float _3672 = -_3566;
            float _3674 = fma(_3672, _3594, _3612);
            float _3676 = -_3634;
            float _3678 = fma(_3604, _3578, _3676);
            float _3680 = _3656 * _3666;
            float _3682 = _3660 * _3666;
            float _3684 = _3664 * _3666;
            float _3686 = _3408 * _3666;
            float _3688 = _3406 * _3680;
            float _3690 = _3406 * _3682;
            float _3692 = _3674 * _3666;
            float _3694 = _3406 * _3684;
            float _3696 = _3678 * _3666;
            float _3698 = _3670 * _3666;
            float _3700 = fma(_3624, _3686, _3688);
            float _3702 = fma(_3408, _3692, _3690);
            float _3704 = _3640 * _3666;
            float _3706 = fma(_3628, _3686, _3694);
            float _3708 = fma(_3410, _3696, _3700);
            float _3710 = fma(_3410, _3698, _3702);
            float _3712 = fma(_3410, _3704, _3706);
            _750 = _3702;
            _752 = _3696;
            _754 = _3688;
            _3414 = _3700;
            _3358 = _3598;
            _2632 = _3604;
            _3400 = _3610;
            _3360 = _3698;
            _3362 = _3690;
            _3364 = _3588;
            _3376 = _3594;
            _3366 = _3682;
            _3542 = _3710;
            _3416 = _3708;
            _3418 = _3712;
            _3368 = _3678;
        }
    }
    _3544 = false;
    float _3714 = _750;
    float _3716 = _752;
    float _3718 = _754;
    float _3720 = _3414;
    float _3722 = _3358;
    float _3724 = _2632;
    float _3726 = _3400;
    float _3728 = _3360;
    float _3730 = _3362;
    float _3732 = _3364;
    float _3734 = _3376;
    float _3736 = _3366;
    float _3738 = _3542;
    float _3740 = _3416;
    float _3742 = _3418;
    float _3744 = _3368;
    uint _3746 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3746)] = as_type<uint>(_3336);
    float _3748 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _3750 = as_type<int>(_3748) & 512;
    bool _3752 = _3750 != 0;
    int _3754 = as_type<int>(_3748) & 1024;
    bool _3756 = _3754 != 0;
    float _3758 = _3714;
    float _3760 = _3716;
    float _3762 = _3718;
    float _3764 = _3720;
    float _3766 = _3738;
    float _3768 = _3742;
    float _3770 = _3740;
    float _3772 = _3744;
    if (_3752)
    {
        float _3774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3780 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3758 = _3774;
        _3760 = _3776;
        _3762 = _3778;
        _3764 = _3780;
    }
    float _3782 = _3758;
    float _3784 = _3760;
    float _3786 = _3762;
    float _3788 = _3764;
    float _3790 = _3722;
    float _3792 = _3724;
    float _3794 = _3726;
    float _3796 = _3728;
    if (_3752)
    {
        float _3798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3804 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3790 = _3798;
        _3792 = _3800;
        _3794 = _3802;
        _3796 = _3804;
    }
    float _3806 = _3790;
    float _3808 = _3792;
    float _3810 = _3794;
    float _3812 = _3796;
    float _3814 = _3730;
    float _3816 = _3732;
    float _3818 = _3734;
    float _3820 = _3736;
    if (_3752)
    {
        float _3822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3828 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3814 = _3822;
        _3816 = _3824;
        _3818 = _3826;
        _3820 = _3828;
    }
    float _3830 = _3814;
    float _3832 = _3816;
    float _3834 = _3818;
    float _3836 = _3820;
    float _3838 = _3340 + _3738;
    float _3840 = _3338 + _3740;
    float _3842 = _3342 + _3742;
    float _3844 = _3838;
    if (!_3752)
    {
        _3766 = 0.0;
    }
    float _3846 = _3766;
    float _3848 = _3846;
    if (!_3752)
    {
        _3768 = 0.0;
    }
    float _3850 = _3768;
    float _3852 = _3850;
    if (!_3752)
    {
        _3770 = 0.0;
    }
    float _3854 = _3770;
    int _3856 = as_type<int>(_3748) & 2048;
    bool _3858 = _3856 != 0;
    float _3860 = _3782;
    float _3862 = _3854;
    if (_3752)
    {
        float _3864 = _3838 * _3784;
        _3772 = _3864;
    }
    float _3866 = _3772;
    float _3868 = _3808;
    float _3870 = _3832;
    float _3872 = _3830;
    float _3874 = _3810;
    if (_3752)
    {
        float _3876 = _3838 * _3808;
        _3868 = _3876;
    }
    float _3878 = _3868;
    float _3880 = _3878;
    if (_3752)
    {
        float _3882 = fma(_3840, _3782, _3866);
        _3860 = _3882;
    }
    float _3884 = _3860;
    float _3886 = _3884;
    if (_3752)
    {
        float _3888 = _3838 * _3832;
        _3870 = _3888;
    }
    float _3890 = _3870;
    if (_3752)
    {
        float _3892 = fma(_3840, _3806, _3878);
        _3880 = _3892;
    }
    float _3894 = _3880;
    if (_3752)
    {
        float _3896 = fma(_3842, _3786, _3884);
        _3886 = _3896;
    }
    float _3898 = _3886;
    if (_3752)
    {
        float _3900 = fma(_3840, _3830, _3890);
        _3872 = _3900;
    }
    float _3902 = _3872;
    float _3904 = _3902;
    if (_3752)
    {
        float _3906 = fma(_3842, _3810, _3894);
        _3874 = _3906;
    }
    float _3908 = _3874;
    if (_3752)
    {
        float _3910 = _3788 + _3898;
        _3848 = _3910;
    }
    float _3912 = _3848;
    float _3914 = _3912;
    if (_3752)
    {
        float _3916 = fma(_3842, _3834, _3902);
        _3904 = _3916;
    }
    float _3918 = _3904;
    if (_3752)
    {
        float _3920 = _3812 + _3908;
        _3852 = _3920;
    }
    float _3922 = _3852;
    float _3924 = _3922;
    if (_3752)
    {
        float _3926 = _3836 + _3918;
        _3862 = _3926;
    }
    float _3928 = _3862;
    bool _3930 = !_3756;
    float _3932 = _3928;
    if (!_3930)
    {
        float _3934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _3936 = uint(int(uint(_232) >> uint(2)));
        float _3938 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3936)]);
        int _3940 = _232 + 4;
        uint _3942 = uint(int(uint(_3940) >> uint(2)));
        float _3944 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3942)]);
        int _3946 = _232 + 8;
        uint _3948 = uint(int(uint(_3946) >> uint(2)));
        float _3950 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3948)]);
        uint _3952 = uint(int(uint(_232) >> uint(2)));
        float _3954 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3952)]);
        int _3956 = _232 + 4;
        uint _3958 = uint(int(uint(_3956) >> uint(2)));
        float _3960 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3958)]);
        int _3962 = _232 + 8;
        uint _3964 = uint(int(uint(_3962) >> uint(2)));
        float _3966 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3964)]);
        uint _3968 = uint(int(uint(_232) >> uint(2)));
        float _3970 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3968)]);
        int _3972 = _232 + 4;
        uint _3974 = uint(int(uint(_3972) >> uint(2)));
        float _3976 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3974)]);
        int _3978 = _232 + 8;
        uint _3980 = uint(int(uint(_3978) >> uint(2)));
        float _3982 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3980)]);
        float _3984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _3986 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _3988 = _3838 * _3944;
        float _3990 = _3838 * _3960;
        float _3992 = _3838 * _3976;
        float _3994 = fma(_3840, _3938, _3988);
        float _3996 = fma(_3840, _3954, _3990);
        float _3998 = fma(_3840, _3970, _3992);
        float _4000 = fma(_3842, _3950, _3994);
        float _4002 = fma(_3842, _3966, _3996);
        float _4004 = fma(_3842, _3982, _3998);
        float _4006 = _3934 + _4000;
        float _4008 = _3984 + _4002;
        float _4010 = _3986 + _4004;
        _3924 = _4008;
        _3914 = _4006;
        _3932 = _4010;
    }
    float _4012 = _3924;
    float _4014 = _3914;
    float _4016 = _3932;
    bool _4018 = !_3858;
    float _4020 = _4012;
    float _4022 = _4014;
    float _4024 = _4016;
    if (!_4018)
    {
        uint _4026 = uint(int(uint(_232) >> uint(2)));
        float _4028 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4026)]);
        int _4030 = _232 + 4;
        uint _4032 = uint(int(uint(_4030) >> uint(2)));
        float _4034 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4032)]);
        int _4036 = _232 + 8;
        uint _4038 = uint(int(uint(_4036) >> uint(2)));
        float _4040 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4038)]);
        int _4042 = _232 + 12;
        uint _4044 = uint(int(uint(_4042) >> uint(2)));
        float _4046 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4044)]);
        uint _4048 = uint(int(uint(_232) >> uint(2)));
        float _4050 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4048)]);
        int _4052 = _232 + 4;
        uint _4054 = uint(int(uint(_4052) >> uint(2)));
        float _4056 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4054)]);
        int _4058 = _232 + 8;
        uint _4060 = uint(int(uint(_4058) >> uint(2)));
        float _4062 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4060)]);
        int _4064 = _232 + 12;
        uint _4066 = uint(int(uint(_4064) >> uint(2)));
        float _4068 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4066)]);
        uint _4070 = uint(int(uint(_232) >> uint(2)));
        float _4072 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4070)]);
        int _4074 = _232 + 4;
        uint _4076 = uint(int(uint(_4074) >> uint(2)));
        float _4078 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4076)]);
        int _4080 = _232 + 8;
        uint _4082 = uint(int(uint(_4080) >> uint(2)));
        float _4084 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4082)]);
        int _4086 = _232 + 12;
        uint _4088 = uint(int(uint(_4086) >> uint(2)));
        float _4090 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4088)]);
        float _4092 = _3838 * _4034;
        float _4094 = _3838 * _4056;
        float _4096 = fma(_3840, _4028, _4092);
        float _4098 = _3838 * _4078;
        float _4100 = fma(_3840, _4050, _4094);
        float _4102 = fma(_3840, _4072, _4098);
        float _4104 = fma(_3842, _4040, _4096);
        float _4106 = fma(_3842, _4062, _4100);
        float _4108 = fma(_3842, _4084, _4102);
        float _4110 = _4104 + _4046;
        float _4112 = _4106 + _4068;
        float _4114 = _4108 + _4090;
        _4020 = _4112;
        _4022 = _4110;
        _4024 = _4114;
    }
    float _4116 = _4020;
    float _4118 = _4022;
    float _4120 = _4024;
    float _4122 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _4124 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _4126 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _4128 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _4130 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _4132 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _4134 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _4136 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _4138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _4140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _4142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _4144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _4146 = _4124 * _4116;
    float _4148 = fma(_4122, _4118, _4146);
    float _4150 = fma(_4126, _4120, _4148);
    float _4152 = _4128 + _4150;
    float _4154 = -_4152;
    bool _4156 = _4130 >= _4154;
    bool _4158 = isnan(_4130);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(_4154);
    bool _4164 = _4160 || _4162;
    float _4166 = -_4152;
    bool _4168 = _4132 >= _4166;
    bool _4170 = isnan(_4132);
    bool _4172 = _4168 || _4170;
    bool _4174 = isnan(_4166);
    bool _4176 = _4172 || _4174;
    int _4178 = _4164 ? 0 : 1;
    int _4180 = 2;
    float _4182 = _4120;
    if (_4164)
    {
        _4180 = 1;
    }
    int _4184 = _4180;
    int _4186 = _4184;
    if (_4176)
    {
        _4186 = _4178;
    }
    int _4188 = _4186;
    int _4190 = _4188 << 6;
    int _4192 = _4190 + 96;
    uint _4194 = uint(int(uint(_4192) >> uint(2)));
    float _4196 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4194)]);
    int _4198 = _4192 + 4;
    uint _4200 = uint(int(uint(_4198) >> uint(2)));
    float _4202 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4200)]);
    int _4204 = _4192 + 8;
    uint _4206 = uint(int(uint(_4204) >> uint(2)));
    float _4208 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4206)]);
    int _4210 = _4192 + 12;
    uint _4212 = uint(int(uint(_4210) >> uint(2)));
    float _4214 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4212)]);
    int _4216 = _4190 + 48;
    int _4218 = _4190 + 64;
    uint _4220 = uint(int(uint(_4216) >> uint(2)));
    float _4222 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4220)]);
    int _4224 = _4216 + 4;
    uint _4226 = uint(int(uint(_4224) >> uint(2)));
    float _4228 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4226)]);
    int _4230 = _4216 + 8;
    uint _4232 = uint(int(uint(_4230) >> uint(2)));
    float _4234 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4232)]);
    int _4236 = _4216 + 12;
    uint _4238 = uint(int(uint(_4236) >> uint(2)));
    float _4240 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4238)]);
    uint _4242 = uint(int(uint(_4218) >> uint(2)));
    float _4244 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4242)]);
    int _4246 = _4218 + 4;
    uint _4248 = uint(int(uint(_4246) >> uint(2)));
    float _4250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4248)]);
    int _4252 = _4218 + 8;
    uint _4254 = uint(int(uint(_4252) >> uint(2)));
    float _4256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4254)]);
    int _4258 = _4218 + 12;
    uint _4260 = uint(int(uint(_4258) >> uint(2)));
    float _4262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4260)]);
    int _4264 = _4190 + 80;
    float _4266 = _4134 + 1.0;
    float _4268 = _4266 + _4116;
    uint _4270 = uint(int(uint(_4264) >> uint(2)));
    float _4272 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4270)]);
    int _4274 = _4264 + 4;
    uint _4276 = uint(int(uint(_4274) >> uint(2)));
    float _4278 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4276)]);
    int _4280 = _4264 + 8;
    uint _4282 = uint(int(uint(_4280) >> uint(2)));
    float _4284 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4282)]);
    int _4286 = _4264 + 12;
    uint _4288 = uint(int(uint(_4286) >> uint(2)));
    float _4290 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4288)]);
    float _4292 = _4268 * _4138;
    float _4294 = fma(_4136, _4118, _4292);
    float _4296 = fma(_4140, _4120, _4294);
    float _4298 = _4142 + _4296;
    float _4300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _4302 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _4304 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _4306 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _4308 = trunc(_4298);
    int _4310 = int(_4308);
    int _4312 = ~as_type<int>(_4144);
    int _4314 = _4310 + _4312;
    int _4316 = _4314 + 1;
    float _4318 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _4320 = _4316 >= 0;
    int _4322 = as_type<int>(_4144);
    float _4324 = as_type<float>(_4188);
    if (_4320)
    {
        float _4326 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4322 = as_type<int>(_4326);
    }
    int _4328 = _4322;
    float _4330 = _4268 * _4202;
    float _4332 = fma(_4196, _4118, _4330);
    float _4334 = fma(_4208, _4120, _4332);
    float _4336 = _4214 + _4334;
    float _4338 = _4268 * _4228;
    float _4340 = 1.0 / _4336;
    float _4342 = fma(_4222, _4118, _4338);
    float _4344 = _4268 * _4250;
    float _4346 = fma(_4234, _4120, _4342);
    float _4348 = fma(_4244, _4118, _4344);
    float _4350 = _4240 + _4346;
    float _4352 = fma(_4256, _4120, _4348);
    float _4354 = _4350 * _4340;
    float _4356 = _4262 + _4352;
    bool _4358 = _4354 >= 0.0;
    float _4360 = _4356 * _4340;
    bool _4362 = _4354 <= 1.0;
    bool _4364 = _4362 && _4358;
    bool _4366 = _4360 >= 0.0;
    bool _4368 = _4366 && _4364;
    bool _4370 = _4360 <= 1.0;
    bool _4372 = _4370 && _4368;
    float _4374 = _4268 * _4278;
    float _4376 = fma(_4272, _4118, _4374);
    float _4378 = _4352;
    float _4380 = _4262;
    float _4382 = _4360;
    if (_4372)
    {
        float _4384 = float(_4188);
        _4324 = _4384;
    }
    float _4386 = _4324;
    float _4388 = _4244;
    if (_4372)
    {
        float _4390 = rint(_4386);
        float _4392 = precise::max(_4390, 0.0);
        uint _4394 = uint(_4392);
        uint _4396 = clamp(_4394, 0u, 65535u);
        _4388 = as_type<float>(_4396);
    }
    float _4398 = _4388;
    float _4400 = fma(_4284, _4120, _4376);
    float _4402 = _4290 + _4400;
    float _4404 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.5);
    float _4406 = fma(_4120, 6.2500002968590706586837768554688e-05, 0.5);
    float _4408 = _4402 * _4340;
    float _4410 = _4398;
    if (_4372)
    {
        float3 _11561 = float3(_4354, _4360, float(as_type<int>(_4398)));
        float3 _11565 = select(_11561, float3(0.0), isnan(_11561));
        float _4412 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _11565.xy, uint(rint(_11565.z)), _4408, level(0.0));
        _4410 = _4412;
    }
    float _4414 = _4410;
    float2 _11574 = float2(_4404, _4406);
    float _4416 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11574, float2(0.0), isnan(_11574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11574, float2(0.0), isnan(_11574)), level(0.0)).x;
    float _4418 = _4268 * _4302;
    float _4420 = fma(_4300, _4118, _4418);
    float _4422 = fma(_4304, _4120, _4420);
    float _4424 = _4306 + _4422;
    float _4426 = trunc(_4424);
    int _4428 = int(_4426);
    bool _4430 = _4328 <= _4316;
    bool _4432 = !_4320;
    bool _4434 = _4430 || _4432;
    int _4436 = ~as_type<int>(_4318);
    int _4438 = _4428 + _4436;
    int _4440 = _4438 + 1;
    bool _4442 = _4440 < 0;
    bool _4444 = _4442 || _4434;
    float _4446 = _4420;
    float _4448 = as_type<float>(_4428);
    if (!_4444)
    {
        float _4450 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4446 = _4450;
    }
    float _4452 = _4446;
    bool _4454 = as_type<int>(_4452) <= _4440;
    bool _4456 = _4454 || _4444;
    float _4458 = _4452;
    if (_4456)
    {
        _4448 = 1.0;
    }
    float _4460 = _4448;
    float _4462 = _4460;
    if (!_4456)
    {
        float _4464 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _4466 = _4440 * as_type<int>(_4464);
        int _4468 = _4466 + _4316;
        int _4470 = _4468 << 2;
        uint _4472 = uint(int(uint(_4468) >> uint(2)));
        int _4474 = 12 & _4470;
        int _4476 = int(_4472) << 4;
        int _4478 = _4476 + _4474;
        int _4480 = _4478 + 400;
        uint _4482 = uint(int(uint(_4480) >> uint(2)));
        float _4484 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4482)]);
        float _4486 = floor(_4424);
        float _4488 = floor(_4298);
        float _4490 = -_4486;
        float _4492 = _4424 + _4490;
        float _4494 = -_4488;
        float _4496 = _4298 + _4494;
        float _4498 = rint(_4484);
        float _4500 = precise::max(_4498, 0.0);
        uint _4502 = uint(_4500);
        uint _4504 = clamp(_4502, 0u, 65535u);
        float3 _11710 = float3(_4496, _4492, float(int(_4504)));
        float3 _11712 = select(_11710, float3(0.0), isnan(_11710));
        float _4506 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _11712.xy, uint(rint(_11712.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _11712.xy, uint(rint(_11712.z)), level(0.0)).x;
        int _4508 = _4468 << 4;
        int _4510 = _4508 + 2048;
        uint _4512 = uint(int(uint(_4510) >> uint(2)));
        float _4514 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4512)]);
        int _4516 = _4510 + 4;
        uint _4518 = uint(int(uint(_4516) >> uint(2)));
        float _4520 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4518)]);
        int _4522 = _4510 + 8;
        uint _4524 = uint(int(uint(_4522) >> uint(2)));
        float _4526 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4524)]);
        int _4528 = _4510 + 12;
        uint _4530 = uint(int(uint(_4528) >> uint(2)));
        float _4532 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4530)]);
        float _4534 = _4268 * _4520;
        float _4536 = fma(_4514, _4118, _4534);
        float _4538 = fma(_4526, _4120, _4536);
        float _4540 = _4532 + _4538;
        float _4542 = precise::clamp(_4540, 0.0, 1.0);
        float _4544 = -_4542;
        float _4546 = _4544 + _4506;
        float _4548 = fma(_4546, 500.0, 1.5);
        float _4550 = exp2(_4548);
        float _4552 = 0.0 + _4550;
        float _4554 = precise::clamp(_4552, 0.0, 1.0);
        _4458 = _4484;
        _4462 = _4554;
        _4378 = as_type<float>(_4504);
        _4380 = _4496;
    }
    float _4556 = _4458;
    float _4558 = _4462;
    float _4560 = _4378;
    float _4562 = _4380;
    uint _4564 = uint(int(uint(_232) >> uint(2)));
    float _4566 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_4564)]);
    float _4568 = _4556;
    float _4570 = _4560;
    float _4572 = _4562;
    if (!_4372)
    {
        _4568 = 1.0;
    }
    float _4574 = _4568;
    float _4576 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    bool _4578 = _610 > 0.001000000047497451305389404296875;
    bool _4580 = isnan(_610);
    bool _4582 = _4578 || _4580;
    bool _4584 = isnan(0.001000000047497451305389404296875);
    bool _4586 = _4582 || _4584;
    float _4588 = _4574;
    float _4590 = _4576;
    if (_4372)
    {
        bool _4592 = _4414 >= _4408;
        bool _4594 = isnan(_4414);
        bool _4596 = _4592 || _4594;
        bool _4598 = isnan(_4408);
        bool _4600 = _4596 || _4598;
        float _4602 = float(_4600);
        _4588 = _4602;
    }
    float _4604 = _4588;
    float _4606 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    bool _4608 = _4416 != 0.0;
    bool _4610 = isnan(_4416);
    bool _4612 = _4608 || _4610;
    bool _4614 = isnan(0.0);
    bool _4616 = _4612 || _4614;
    float _4618 = -_4604;
    float _4620 = fma(_4618, _4558, 1.0);
    float _4622 = fma(_4120, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _4624 = _4620;
    float _4626 = _4606;
    bool _4628 = _4616;
    if (_4616)
    {
        _4570 = _4416;
    }
    float _4630 = _4570;
    if (!_4616)
    {
        _4382 = 4.0;
    }
    float _4632 = _4382;
    float _4634 = _4630;
    if (!_4616)
    {
        float2 _11891 = float2(_4404, _4406);
        float _4636 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11891, float2(0.0), isnan(_11891)), level(_4632)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11891, float2(0.0), isnan(_11891)), level(_4632)).x;
        _4634 = _4636;
    }
    float _4638 = _4634;
    float _4640 = _4386;
    if (!_4586)
    {
        float2 _11907 = float2(_4404, _4406);
        float _4642 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11907, float2(0.0), isnan(_11907)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11907, float2(0.0), isnan(_11907)), level(0.0)).x;
        _4640 = _4642;
    }
    float _4644 = _4640;
    float2 _11918 = float2(_4606, _4406);
    float _4646 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11918, float2(0.0), isnan(_11918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11918, float2(0.0), isnan(_11918)), level(0.0)).x;
    float2 _11926 = float2(_4576, _4406);
    float _4648 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11926, float2(0.0), isnan(_11926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11926, float2(0.0), isnan(_11926)), level(0.0)).x;
    float2 _11934 = float2(_4404, _4622);
    float _4650 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11934, float2(0.0), isnan(_11934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11934, float2(0.0), isnan(_11934)), level(0.0)).x;
    float _4652 = -_4566;
    float _4654 = _4620 + _4652;
    if (_4586)
    {
        float _4656 = fma(_4654, 0.0500000007450580596923828125, _4566);
        _4624 = _4656;
    }
    float _4658 = _4624;
    float _4660 = precise::max(0.0, _4658);
    float _4662 = precise::min(_4660, 0.999000012874603271484375);
    uint _4664 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_4664)] = as_type<uint>(_4662);
    float _4666 = _4118;
    int _4668 = as_type<int>(_4660);
    if (!_4586)
    {
        float _4670 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _4666 = _4670;
    }
    float _4672 = _4666;
    float2 _11982 = float2(_4404, _4406);
    float2 _4676 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_11982, float2(0.0), isnan(_11982)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_11982, float2(0.0), isnan(_11982)), level(0.0)).xy;
    float _4678 = _4676.x;
    float _4680 = _4676.y;
    int _4682 = _232 + 4;
    float _4684 = _4646;
    float _4686 = _4644;
    float _4688 = _4650;
    float _4690 = _4678;
    float _4692 = _4680;
    if (!_4586)
    {
        float _4694 = fma(_4638, 2000.0, _4672);
        _4668 = as_type<int>(_4694);
    }
    int _4696 = _4668;
    if (!_4586)
    {
        uint _4698 = uint(int(uint(_4682) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_4698)] = uint(_4696);
    }
    float _4700 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _4702 = uint(int(uint(_4682) >> uint(2)));
    float _4704 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_4702)]);
    if (!_4586)
    {
        float _4706 = _4644 * 2000.0;
        _4572 = _4706;
    }
    float _4708 = _4572;
    float _4710 = fma(_4638, 2000.0, _4700);
    float _4712 = _3838 + _4704;
    bool _4714 = _4712 >= _4710;
    bool _4716 = isnan(_4712);
    bool _4718 = _4714 || _4716;
    bool _4720 = isnan(_4710);
    bool _4722 = _4718 || _4720;
    float _4724 = _4710;
    if (!_4722)
    {
        float _4726 = -_4704;
        float _4728 = _4710 + _4726;
        _4724 = _4728;
    }
    float _4730 = _4724;
    float _4732 = _4730;
    if (!_4722)
    {
        float _4734 = fma(_4730, 0.00999999977648258209228515625, _4704);
        _4732 = _4734;
    }
    float _4736 = _4732;
    float _4738 = _4736;
    if (!_4722)
    {
        uint _4740 = uint(int(uint(_4682) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_4740)] = as_type<uint>(_4736);
    }
    if (!_4586)
    {
        bool _4742 = _4646 != 0.0;
        bool _4744 = isnan(_4646);
        bool _4746 = _4742 || _4744;
        bool _4748 = isnan(0.0);
        bool _4750 = _4746 || _4748;
        float _4752 = fma(_4120, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _12113 = float2(_4606, _4622);
        float _4754 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12113, float2(0.0), isnan(_12113)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12113, float2(0.0), isnan(_12113)), level(0.0)).x;
        float2 _12121 = float2(_4606, _4752);
        float _4756 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12121, float2(0.0), isnan(_12121)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12121, float2(0.0), isnan(_12121)), level(0.0)).x;
        float _4758 = _4406;
        if (!_4750)
        {
            _4182 = 4.0;
        }
        float _4760 = _4182;
        float _4762 = _4756;
        if (!_4750)
        {
            float2 _12139 = float2(_4606, _4406);
            float _4764 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12139, float2(0.0), isnan(_12139)), level(_4760)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12139, float2(0.0), isnan(_12139)), level(_4760)).x;
            _4684 = _4764;
        }
        float _4766 = _4684;
        bool _4768 = _4648 != 0.0;
        bool _4770 = isnan(_4648);
        bool _4772 = _4768 || _4770;
        bool _4774 = isnan(0.0);
        bool _4776 = _4772 || _4774;
        bool _4778 = _4678 != 0.0;
        bool _4780 = isnan(_4678);
        bool _4782 = _4778 || _4780;
        bool _4784 = isnan(0.0);
        bool _4786 = _4782 || _4784;
        float _4788 = _4406;
        if (_4776)
        {
            _4738 = _4648;
        }
        float _4790 = _4738;
        float2 _12179 = float2(_4576, _4622);
        float _4792 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12179, float2(0.0), isnan(_12179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12179, float2(0.0), isnan(_12179)), level(0.0)).x;
        float2 _12187 = float2(_4404, _4752);
        float _4794 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12187, float2(0.0), isnan(_12187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12187, float2(0.0), isnan(_12187)), level(0.0)).x;
        float2 _12195 = float2(_4576, _4752);
        float _4796 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12195, float2(0.0), isnan(_12195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12195, float2(0.0), isnan(_12195)), level(0.0)).x;
        if (!_4776)
        {
            _4686 = 4.0;
        }
        float _4798 = _4686;
        bool _4800 = _4650 != 0.0;
        bool _4802 = isnan(_4650);
        bool _4804 = _4800 || _4802;
        bool _4806 = isnan(0.0);
        bool _4808 = _4804 || _4806;
        float _4810 = _4790;
        float _4812 = _4798;
        if (!_4776)
        {
            float2 _12224 = float2(_4576, _4406);
            float _4814 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12224, float2(0.0), isnan(_12224)), level(_4798)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12224, float2(0.0), isnan(_12224)), level(_4798)).x;
            _4810 = _4814;
        }
        float _4816 = _4810;
        bool _4818 = _4754 != 0.0;
        bool _4820 = isnan(_4754);
        bool _4822 = _4818 || _4820;
        bool _4824 = isnan(0.0);
        bool _4826 = _4822 || _4824;
        bool _4828 = _4756 != 0.0;
        bool _4830 = isnan(_4756);
        bool _4832 = _4828 || _4830;
        bool _4834 = isnan(0.0);
        bool _4836 = _4832 || _4834;
        float _4838 = _4794;
        float _4840 = _4796;
        float _4842 = _4792;
        if (!_4826)
        {
            _4626 = 4.0;
        }
        float _4844 = _4626;
        float _4846 = _4844;
        if (!_4836)
        {
            _4758 = 4.0;
        }
        float _4848 = _4758;
        float _4850 = _4754;
        float _4852 = _4848;
        if (!_4826)
        {
            float2 _12277 = float2(_4606, _4622);
            float _4854 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12277, float2(0.0), isnan(_12277)), level(_4844)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12277, float2(0.0), isnan(_12277)), level(_4844)).x;
            _4850 = _4854;
        }
        float _4856 = _4850;
        if (!_4836)
        {
            float2 _12292 = float2(_4606, _4752);
            float _4858 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12292, float2(0.0), isnan(_12292)), level(_4848)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12292, float2(0.0), isnan(_12292)), level(_4848)).x;
            _4762 = _4858;
        }
        float _4860 = _4762;
        bool _4862 = _4792 != 0.0;
        bool _4864 = isnan(_4792);
        bool _4866 = _4862 || _4864;
        bool _4868 = isnan(0.0);
        bool _4870 = _4866 || _4868;
        bool _4872 = _4794 != 0.0;
        bool _4874 = isnan(_4794);
        bool _4876 = _4872 || _4874;
        bool _4878 = isnan(0.0);
        bool _4880 = _4876 || _4878;
        bool _4882 = _4796 != 0.0;
        bool _4884 = isnan(_4796);
        bool _4886 = _4882 || _4884;
        bool _4888 = isnan(0.0);
        bool _4890 = _4886 || _4888;
        if (_4786)
        {
            _4846 = _4678;
        }
        float _4892 = _4846;
        if (_4786)
        {
            _4852 = _4680;
        }
        float _4894 = _4852;
        if (_4808)
        {
            _4812 = _4650;
        }
        float _4896 = _4812;
        if (!_4808)
        {
            _4688 = 4.0;
        }
        float _4898 = _4688;
        if (_4870)
        {
            _4690 = _4792;
        }
        float _4900 = _4690;
        if (_4880)
        {
            _4692 = _4794;
        }
        float _4902 = _4692;
        if (_4890)
        {
            _4838 = _4796;
        }
        float _4904 = _4838;
        if (!_4870)
        {
            _4590 = 4.0;
        }
        float _4906 = _4590;
        if (!_4890)
        {
            _4840 = 4.0;
        }
        float _4908 = _4840;
        float _4910 = _4900;
        if (!_4870)
        {
            float2 _12386 = float2(_4576, _4622);
            float _4912 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12386, float2(0.0), isnan(_12386)), level(_4906)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12386, float2(0.0), isnan(_12386)), level(_4906)).x;
            _4910 = _4912;
        }
        float _4914 = _4910;
        if (!_4880)
        {
            _4842 = 4.0;
        }
        float _4916 = _4842;
        float _4918 = _4904;
        if (!_4890)
        {
            float2 _12407 = float2(_4576, _4752);
            float _4920 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12407, float2(0.0), isnan(_12407)), level(_4908)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12407, float2(0.0), isnan(_12407)), level(_4908)).x;
            _4918 = _4920;
        }
        float _4922 = _4918;
        float _4924 = _4896;
        if (!_4808)
        {
            float2 _12423 = float2(_4404, _4622);
            float _4926 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12423, float2(0.0), isnan(_12423)), level(_4898)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12423, float2(0.0), isnan(_12423)), level(_4898)).x;
            _4924 = _4926;
        }
        float _4928 = _4924;
        if (!_4786)
        {
            _4788 = 4.0;
        }
        float _4930 = _4788;
        float _4932 = _4902;
        if (!_4880)
        {
            float2 _12444 = float2(_4404, _4752);
            float _4934 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12444, float2(0.0), isnan(_12444)), level(_4916)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12444, float2(0.0), isnan(_12444)), level(_4916)).x;
            _4932 = _4934;
        }
        float _4936 = _4932;
        float _4938 = _4892;
        float _4940 = _4894;
        if (!_4786)
        {
            float2 _12461 = float2(_4404, _4406);
            float2 _4942 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_12461, float2(0.0), isnan(_12461)), level(_4930)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_12461, float2(0.0), isnan(_12461)), level(_4930)).xy;
            float _4944 = _4942.x;
            float _4946 = _4942.y;
            _4938 = _4944;
            _4940 = _4946;
        }
        float _4948 = _4938;
        float _4950 = _4940;
        float _4952 = -_4766;
        float _4954 = _4638 + _4952;
        float _4956 = -_4816;
        float _4958 = _4638 + _4956;
        float _4960 = abs(_4954);
        float _4962 = abs(_4958);
        float _4964 = precise::max(_4960, _4962);
        float _4966 = -_4856;
        float _4968 = _4638 + _4966;
        float _4970 = -_4914;
        float _4972 = _4638 + _4970;
        float _4974 = -_4860;
        float _4976 = _4638 + _4974;
        float _4978 = -_4922;
        float _4980 = _4638 + _4978;
        float _4982 = -_4928;
        float _4984 = _4638 + _4982;
        float _4986 = -_4936;
        float _4988 = _4638 + _4986;
        float _4990 = abs(_4968);
        float _4992 = abs(_4976);
        float _4994 = precise::max(_4990, _4992);
        float _4996 = abs(_4972);
        float _4998 = abs(_4980);
        float _5000 = precise::max(_4996, _4998);
        float _5002 = abs(_4984);
        float _5004 = abs(_4988);
        float _5006 = precise::max(_5002, _5004);
        float _5008 = precise::max(_4994, _5000);
        float _5010 = precise::max(_4964, _5006);
        bool _5012 = _5008 > 0.00150000001303851604461669921875;
        bool _5014 = _5010 > 0.00150000001303851604461669921875;
        bool _5016 = _5014 || _5012;
        bool _5018 = _4948 < _4950;
        bool _5020 = _5018 || _5016;
        bool _5022 = !_5020;
        int _5024 = _5022 ? as_type<int>(_3336) : 0;
        _3420 = _5024;
        _4628 = _5020;
    }
    int _5026 = _3420;
    bool _5028 = _4628;
    bool _5030 = _5028;
    if (!_4586)
    {
        bool _5032 = _4116 >= _4708;
        bool _5034 = isnan(_4116);
        bool _5036 = _5032 || _5034;
        bool _5038 = isnan(_4708);
        bool _5040 = _5036 || _5038;
        _5030 = _5040;
    }
    bool _5042 = _5030;
    if (!_4722)
    {
        float _5044 = _3838 * 0.9900000095367431640625;
        _3844 = _5044;
    }
    float _5046 = _3844;
    int _5048 = _232 + 8;
    float _5050 = -_238;
    float _5052 = _5050 + _3840;
    int _5054 = _5026;
    if (!_4586)
    {
        int _5056 = _5042 ? _5026 : 0;
        _5054 = _5056;
    }
    int _5058 = _5054;
    if (!_4722)
    {
        _846 = 0.0;
    }
    float _5060 = _846;
    float _5062 = -_244;
    float _5064 = _5062 + _5046;
    float _5066 = -_250;
    float _5068 = _5066 + _3842;
    uint _5070 = uint(int(uint(_234) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5070)] = uint(_5058);
    uint _5072 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5072)] = as_type<uint>(_3840);
    uint _5074 = uint(int(uint(_4682) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5074)] = as_type<uint>(_5046);
    uint _5076 = uint(int(uint(_5048) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_5076)] = as_type<uint>(_3842);
    uint _5078 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5078)] = as_type<uint>(_804);
    uint _5080 = uint(int(uint(_4682) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5080)] = as_type<uint>(_5060);
    uint _5082 = uint(int(uint(_5048) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_5082)] = as_type<uint>(_826);
    uint _5084 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5084)] = as_type<uint>(_5052);
    uint _5086 = uint(int(uint(_4682) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5086)] = as_type<uint>(_5064);
    uint _5088 = uint(int(uint(_5048) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5088)] = as_type<uint>(_5068);
    float _5090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _5092 = _5064 * _5064;
    float _5094 = _5060 * _5060;
    float _5096 = fma(_5052, _5052, _5092);
    float _5098 = fma(_804, _804, _5094);
    float _5100 = fma(_5068, _5068, _5096);
    float _5102 = fma(_826, _826, _5098);
    float _5104 = sqrt(_5100);
    float _5106 = sqrt(_5102);
    bool _5108 = _5104 >= 9.9999999747524270787835121154785e-07;
    bool _5110 = isnan(_5104);
    bool _5112 = _5108 || _5110;
    bool _5114 = isnan(9.9999999747524270787835121154785e-07);
    bool _5116 = _5112 || _5114;
    if (!_5116)
    {
        bool _5118 = _540 != _306;
        bool _5120 = isnan(_540);
        bool _5122 = _5118 || _5120;
        bool _5124 = isnan(_306);
        bool _5126 = _5122 || _5124;
        _5128 = _5126;
        if (!_5128)
        {
            float _5130 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _5132 = _5130 > 0.0;
            bool _5134 = !_5132;
            if (!_5134)
            {
                float _5136 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _5138 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _5140 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _5142 = _5138 * _524;
                float _5144 = _5138 * _522;
                float _5146 = _5138 * _526;
                float _5148 = fma(_5136, _530, _5142);
                float _5150 = fma(_5136, _528, _5144);
                float _5152 = fma(_5136, _532, _5146);
                float _5154 = fma(_5140, _536, _5148);
                float _5156 = fma(_5140, _534, _5150);
                float _5158 = fma(_5140, _538, _5152);
                float _5160 = _5154 * _5154;
                float _5162 = fma(_5156, _5156, _5160);
                float _5164 = fma(_5158, _5158, _5162);
                float _5166 = rsqrt(_5164);
                float _5168 = _5166 * 9.9999999747524270787835121154785e-07;
                float _5170 = _5156 * _5168;
                float _5172 = _5154 * _5168;
                float _5174 = _5158 * _5168;
                _344 = as_type<int>(_5170);
                _346 = as_type<int>(_5172);
                _348 = as_type<int>(_5174);
                _5128 = true;
            }
            else
            {
                bool _5176 = _5106 >= 9.9999999747524270787835121154785e-07;
                bool _5178 = isnan(_5106);
                bool _5180 = _5176 || _5178;
                bool _5182 = isnan(9.9999999747524270787835121154785e-07);
                bool _5184 = _5180 || _5182;
                if (!_5184)
                {
                    float _5186 = _5046 * _5046;
                    float _5188 = fma(_3840, _3840, _5186);
                    float _5190 = fma(_3842, _3842, _5188);
                    float _5192 = sqrt(_5190);
                    bool _5194 = _5192 >= 9.9999999747524270787835121154785e-07;
                    bool _5196 = isnan(_5192);
                    bool _5198 = _5194 || _5196;
                    bool _5200 = isnan(9.9999999747524270787835121154785e-07);
                    bool _5202 = _5198 || _5200;
                    float _5204 = _5192;
                    if (_5202)
                    {
                        float _5206 = rsqrt(_5190);
                        _5204 = _5206;
                    }
                    float _5208 = _5204;
                    if (!_5202)
                    {
                        _332 = 0;
                    }
                    int _5210 = _332;
                    int _5212 = _5210;
                    if (!_5202)
                    {
                        _334 = 897988541;
                    }
                    int _5214 = _334;
                    int _5216 = _5214;
                    if (!_5202)
                    {
                        _336 = 0;
                    }
                    int _5218 = _336;
                    float _5220 = _5208;
                    int _5222 = _5218;
                    if (_5202)
                    {
                        float _5224 = _5208 * 9.9999999747524270787835121154785e-07;
                        _5220 = _5224;
                    }
                    float _5226 = _5220;
                    if (_5202)
                    {
                        float _5228 = _3840 * _5226;
                        _5212 = as_type<int>(_5228);
                    }
                    int _5230 = _5212;
                    _344 = _5230;
                    if (_5202)
                    {
                        float _5232 = _5046 * _5226;
                        _5216 = as_type<int>(_5232);
                    }
                    int _5234 = _5216;
                    _346 = _5234;
                    if (_5202)
                    {
                        float _5236 = _3842 * _5226;
                        _5222 = as_type<int>(_5236);
                    }
                    int _5238 = _5222;
                    _348 = _5238;
                    _5128 = true;
                }
                else
                {
                    float _5240 = rsqrt(_5102);
                    float _5242 = _5240 * 9.9999999747524270787835121154785e-07;
                    float _5244 = _804 * _5242;
                    float _5246 = _5060 * _5242;
                    float _5248 = _826 * _5242;
                    _344 = as_type<int>(_5244);
                    _346 = as_type<int>(_5246);
                    _348 = as_type<int>(_5248);
                    _5128 = true;
                }
            }
        }
    }
    else
    {
        float _5250 = _5106 * _5090;
        bool _5252 = _5250 >= 0.001000000047497451305389404296875;
        bool _5254 = isnan(_5250);
        bool _5256 = _5252 || _5254;
        bool _5258 = isnan(0.001000000047497451305389404296875);
        bool _5260 = _5256 || _5258;
        bool _5262 = _5250 > 0.0;
        bool _5264 = !_5260;
        bool _5266 = _5262 && _5264;
        bool _5268 = _5104 < 0.001000000047497451305389404296875;
        bool _5270 = _5268 && _5266;
        if (!_5270)
        {
            _338 = as_type<int>(_5052);
        }
        int _5272 = _338;
        int _5274 = _5272;
        if (_5270)
        {
            float _5276 = _804 * _5090;
            _5274 = as_type<int>(_5276);
        }
        int _5278 = _5274;
        _344 = _5278;
        if (!_5270)
        {
            _340 = as_type<int>(_5064);
        }
        int _5280 = _340;
        int _5282 = _5280;
        if (_5270)
        {
            float _5284 = _5090 * _5060;
            _5282 = as_type<int>(_5284);
        }
        int _5286 = _5282;
        _346 = _5286;
        if (!_5270)
        {
            _342 = as_type<int>(_5068);
        }
        int _5288 = _342;
        _348 = _5288;
        if (_5270)
        {
            float _5290 = _826 * _5090;
            _348 = as_type<int>(_5290);
        }
    }
    _5128 = false;
    int _5292 = _344;
    int _5294 = _346;
    int _5296 = _348;
    uint _5298 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5298)] = uint(_5292);
    uint _5300 = uint(int(uint(_4682) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5300)] = uint(_5294);
    uint _5302 = uint(int(uint(_5048) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5302)] = uint(_5296);
}

