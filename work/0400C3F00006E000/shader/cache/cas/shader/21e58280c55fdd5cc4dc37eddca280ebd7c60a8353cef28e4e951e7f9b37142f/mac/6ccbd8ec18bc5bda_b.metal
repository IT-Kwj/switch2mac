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
    bool _4998 = false;
    bool _3544 = false;
    bool _2854 = false;
    bool _2090 = false;
    bool _1184 = false;
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
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    int _172 = as_type<int>(_168) & 512;
    bool _174 = _172 != 0;
    float _176 = 0.0;
    float _178 = 0.0;
    float _180 = 0.0;
    if (_174)
    {
        float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _184 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _186 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _176 = _182;
        _178 = _184;
        _180 = _186;
    }
    float _188 = _176;
    float _190 = _178;
    float _192 = _180;
    float _194 = 0.0;
    float _196 = 0.0;
    float _198 = 0.0;
    if (_174)
    {
        float _200 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _202 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _194 = _200;
        _196 = _202;
        _198 = _204;
    }
    float _206 = _194;
    float _208 = _196;
    float _210 = _198;
    float _212 = 0.0;
    float _214 = 0.0;
    float _216 = 0.0;
    if (_174)
    {
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _212 = _218;
        _214 = _220;
        _216 = _222;
    }
    float _224 = _212;
    float _226 = _214;
    float _228 = _216;
    int _230 = _87 << 4;
    int _232 = _230 + 12;
    uint _234 = uint(int(uint(_230) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_234)]);
    int _238 = _230 + 4;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_240)]);
    int _244 = _230 + 8;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_246)]);
    uint _250 = uint(int(uint(_230) >> uint(2)));
    float _252 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_250)]);
    int _254 = _230 + 4;
    uint _256 = uint(int(uint(_254) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_256)]);
    int _260 = _230 + 8;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_262)]);
    uint _266 = uint(int(uint(_230) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_266)]);
    int _270 = _230 + 4;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_272)]);
    int _276 = _230 + 8;
    uint _278 = uint(int(uint(_276) >> uint(2)));
    float _280 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_278)]);
    uint _282 = uint(int(uint(_230) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_282)]);
    int _286 = _230 + 4;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_288)]);
    int _292 = _230 + 8;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_294)]);
    uint _298 = uint(int(uint(_232) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_298)]);
    uint _302 = uint(int(uint(_232) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_302)]);
    float _306 = _226;
    float _308 = _206;
    float _310 = _208;
    float _312 = _210;
    float _314 = _188;
    float _316 = _190;
    float _318 = _192;
    float _320 = _224;
    float _322 = _226;
    float _324 = _228;
    float _326 = _274;
    float _328 = _166;
    int _330 = as_type<int>(_236);
    int _332 = as_type<int>(_252);
    int _334 = as_type<int>(_258);
    int _336 = as_type<int>(_264);
    int _338 = as_type<int>(_252);
    int _340 = as_type<int>(_258);
    int _342 = as_type<int>(_264);
    int _344 = as_type<int>(_252);
    int _346 = as_type<int>(_258);
    int _348 = as_type<int>(_264);
    if (!_174)
    {
        int _350 = _230 + 4;
        int _352 = _230 + 8;
        uint _354 = uint(int(uint(_230) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_350) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_352) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_362)]);
        uint _366 = uint(int(uint(_350) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_366)]);
        uint _370 = uint(int(uint(_230) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_370)]);
        uint _374 = uint(int(uint(_352) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_374)]);
        uint _378 = uint(int(uint(_350) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_378)]);
        uint _382 = uint(int(uint(_230) >> uint(2)));
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
        _316 = _460;
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
        _308 = _476;
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
        _314 = _484;
        if (!_414)
        {
            _306 = 0.0;
        }
        float _486 = _306;
        float _488 = _486;
        if (_416)
        {
            float _490 = _384 * _446;
            _472 = _490;
        }
        float _492 = _472;
        _320 = _492;
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
        _310 = _500;
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
        _322 = _508;
        if (!_418)
        {
            _436 = 0.0;
        }
        float _510 = _436;
        _324 = _510;
        if (_418)
        {
            float _512 = _364 * _452;
            _496 = _512;
        }
        float _514 = _496;
        _312 = _514;
        if (_418)
        {
            float _516 = _376 * _452;
            _504 = _516;
        }
        float _518 = _504;
        _318 = _518;
        if (_418)
        {
            float _520 = _388 * _452;
            _324 = _520;
        }
    }
    float _522 = _308;
    float _524 = _310;
    float _526 = _312;
    float _528 = _314;
    float _530 = _316;
    float _532 = _318;
    float _534 = _320;
    float _536 = _322;
    float _538 = _324;
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
    float _560 = -_166;
    float _562 = _560 + 1.0;
    float _564 = -_170;
    float _566 = _564 + 1.0;
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[0]);
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[1]);
    float _572 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[2]);
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[3]);
    float _576 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[13]);
    float _578 = fma(_562, _566, _170);
    bool _580 = _578 != 1.0;
    bool _582 = isnan(_578);
    bool _584 = _580 || _582;
    bool _586 = isnan(1.0);
    bool _588 = _584 || _586;
    float _590 = abs(_170);
    float _592 = log2(_590);
    bool _594 = _542 != 1.0;
    bool _596 = isnan(_542);
    bool _598 = _594 || _596;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    bool _604 = !_588;
    bool _606 = _602 || _604;
    float _608 = -_304;
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
    float _658 = _166 * _592;
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
    float _694 = _646 ? _284 : 0.0;
    float _696 = _664;
    if (!_606)
    {
        float _698 = -_664;
        float _700 = _698 + 1.0;
        _696 = _700;
    }
    float _702 = _696;
    float _704 = _646 ? _290 : 0.3141500055789947509765625;
    float _706 = _558 * _684;
    float _708 = _646 ? _296 : 0.92653000354766845703125;
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
    float _724 = _300 * _166;
    float _726 = _558 * _704;
    float _728 = _558 * _708;
    float _730 = _166 * _688;
    float _732 = _722;
    float _734 = _726;
    float _736 = _728;
    float _738 = _724;
    float _740 = _724;
    if (!_646)
    {
        float _742 = _166 * _706;
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
        float _760 = fma(_290, 2.0, -1.0);
        float _762 = _558 * _756;
        float _764 = fma(_284, 2.0, -1.0);
        float _766 = fma(_296, 2.0, -1.0);
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
    float _800 = _166 * _690;
    float _802 = _166 * _692;
    float _804 = fma(_268, _686, _730);
    float _806 = _166 + _798;
    float _808 = fma(_274, _686, _800);
    bool _810 = _576 != 1.0;
    bool _812 = isnan(_576);
    bool _814 = _810 || _812;
    bool _816 = isnan(1.0);
    bool _818 = _814 || _816;
    float _820 = fma(_268, _724, _236);
    float _822 = fma(_274, _724, _242);
    float _824 = fma(_280, _724, _248);
    float _826 = fma(_280, _686, _802);
    float _828 = _806 + _744;
    float _830 = _780;
    float _832 = _782;
    float _834 = _806;
    float _836 = _782;
    float _838 = _806;
    float _840 = _798;
    float _842 = _784;
    float _844 = _786;
    float _920;
    float _928;
    float _930;
    float _932;
    float _1012;
    float _1030;
    float _1146;
    float _1154;
    float _1156;
    float _1160;
    float _1164;
    float _1168;
    float _1172;
    float _1176;
    float _1178;
    float _1180;
    float _1182;
    if (!_796)
    {
        if (_818)
        {
            _746 = 0.60000002384185791015625;
        }
        float _846 = _746;
        float _848 = _676;
        if (!_818)
        {
            float _850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _848 = _850;
        }
        float _852 = _848;
        if (_818)
        {
            _830 = 0.4199999868869781494140625;
        }
        float _854 = _830;
        if (_818)
        {
            _832 = 0.23000000417232513427734375;
        }
        float _856 = _832;
        float _858 = 0.0;
        if (!_818)
        {
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _858 = _860;
        }
        float _862 = _858;
        float _864 = _846;
        if (!_818)
        {
            float _866 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _864 = _866;
        }
        float _868 = _864;
        float _870 = _854;
        if (!_818)
        {
            float _872 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _870 = _872;
        }
        float _874 = _870;
        if (_818)
        {
            _738 = 0.1500000059604644775390625;
        }
        float _876 = _738;
        float _878 = _856;
        if (!_818)
        {
            float _880 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _878 = _880;
        }
        float _882 = _878;
        float _884 = _876;
        if (!_818)
        {
            float _886 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _884 = _886;
        }
        float _888 = _884;
        float _890 = 0.0;
        if (!_818)
        {
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _890 = _892;
        }
        float _894 = _890;
        float _896 = 0.0;
        if (!_818)
        {
            float _898 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _896 = _898;
        }
        float _900 = _896;
        if (_818)
        {
            _834 = 0.60000002384185791015625;
        }
        float _902 = _834;
        float _904 = _828 * 6.283184051513671875;
        float _906 = _558 * _868;
        float _908 = _902;
        float _910 = _868;
        if (!_818)
        {
            _908 = _868;
        }
        float _912 = _908;
        float _914 = _558 * _874;
        float _916 = 1.0 / _906;
        float _918 = _912;
        _920 = _852;
        if (_818)
        {
            _910 = 0.4199999868869781494140625;
        }
        float _922 = _910;
        float _924 = _558 * _882;
        float _926 = _922;
        _928 = _862;
        _930 = _894;
        _932 = _900;
        if (!_818)
        {
            _926 = _874;
        }
        float _934 = _926;
        float _936 = _558 * _912;
        float _938 = 1.0 / _914;
        float _940 = _558 * _934;
        float _942 = _558 * _888;
        float _944 = _934;
        if (_818)
        {
            _918 = 0.23000000417232513427734375;
        }
        float _946 = _918;
        float _948 = _946;
        if (!_818)
        {
            _948 = _882;
        }
        float _950 = _948;
        float _952 = 1.0 / _924;
        float _954 = _558 * _950;
        float _956 = _916 * _904;
        float _958 = 1.0 / _940;
        if (_818)
        {
            _944 = 0.1500000059604644775390625;
        }
        float _960 = _944;
        float _962 = _956 * 0.15915493667125701904296875;
        float _964 = _960;
        if (!_818)
        {
            _964 = _888;
        }
        float _966 = _964;
        float _968 = 1.0 / _942;
        float _970 = _938 * _904;
        float _972 = _558 * _966;
        float _974 = 1.0 / _936;
        float _976 = _970 * 0.15915493667125701904296875;
        float _978 = _952 * _904;
        float _980 = _798 * _958;
        float _982 = 1.0 / _954;
        float _984 = _978 * 0.15915493667125701904296875;
        float _986 = _968 * _904;
        float _988 = _980 * 6.283184051513671875;
        float _990 = 1.0 / _972;
        float _992 = _986 * 0.15915493667125701904296875;
        float _994 = _798 * _974;
        float _996 = _988 * 0.15915493667125701904296875;
        float _998 = _976 * 6.283185482025146484375;
        float _1000 = sin(_998);
        float _1002 = _994 * 6.283184051513671875;
        float _1004 = _798 * _982;
        float _1006 = _988;
        float _1008 = _1004;
        float _1010 = _982;
        _1012 = _974;
        if (_818)
        {
            _1006 = 3.0;
        }
        float _1014 = _1006;
        float _1016 = _1002 * 0.15915493667125701904296875;
        float _1018 = _1004 * 6.283184051513671875;
        float _1020 = _996 * 6.283185482025146484375;
        float _1022 = sin(_1020);
        float _1024 = _798 * _990;
        float _1026 = _1014;
        float _1028 = _1018;
        _1030 = _990;
        if (!_818)
        {
            _1026 = _852;
        }
        float _1032 = _1026;
        float _1034 = _1018 * 0.15915493667125701904296875;
        float _1036 = _1024 * 6.283184051513671875;
        float _1038 = _962 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1000 * _1032;
        float _1044 = _1036 * 0.15915493667125701904296875;
        float _1046 = _1036;
        float _1048 = _1042;
        if (_818)
        {
            _1008 = 3.0;
        }
        float _1050 = _1008;
        float _1052 = _1016 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        float _1056 = _1050;
        if (!_818)
        {
            _1056 = _852;
        }
        float _1058 = _1056;
        float _1060 = _1058;
        if (_818)
        {
            _1028 = 4.0;
        }
        float _1062 = _1028;
        float _1064 = _984 * 6.283185482025146484375;
        float _1066 = sin(_1064);
        float _1068 = _1062;
        if (!_818)
        {
            _1068 = _862;
        }
        float _1070 = _1068;
        float _1072 = _1022 * _1058;
        float _1074 = _1034 * 6.283185482025146484375;
        float _1076 = sin(_1074);
        float _1078 = _1070;
        if (_818)
        {
            _1060 = 4.0;
        }
        float _1080 = _1060;
        float _1082 = _1080;
        if (!_818)
        {
            _1082 = _862;
        }
        float _1084 = _1082;
        float _1086 = _992 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        float _1090 = fma(_1040, _1070, _1042);
        float _1092 = _1040;
        float _1094 = _1090;
        if (_818)
        {
            _1010 = 2.0;
        }
        float _1096 = _1010;
        float _1098 = _1044 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        float _1102 = _1096;
        if (_818)
        {
            _1078 = 2.0;
        }
        float _1104 = _1078;
        float _1106 = fma(_1054, _1084, _1072);
        float _1108 = _1104;
        if (!_818)
        {
            _1102 = _894;
        }
        float _1110 = _1102;
        float _1112 = _1110;
        if (!_818)
        {
            _1108 = _894;
        }
        float _1114 = _1108;
        float _1116 = _1114;
        if (_818)
        {
            _1046 = 1.5;
        }
        float _1118 = _1046;
        float _1120 = _1118;
        if (_818)
        {
            _1048 = 1.5;
        }
        float _1122 = _1048;
        float _1124 = fma(_1066, _1110, _1090);
        float _1126 = _1122;
        if (!_818)
        {
            _1120 = _900;
        }
        float _1128 = _1120;
        float _1130 = fma(_1076, _1114, _1106);
        float _1132 = _1128;
        if (!_818)
        {
            _1126 = _900;
        }
        float _1134 = _1126;
        float _1136 = fma(_1088, _1128, _1124);
        float _1138 = fma(_1100, _1134, _1130);
        float _1140 = _1134;
        float _1142 = _1088;
        if (_818)
        {
            _1112 = 1.5;
        }
        float _1144 = _1112;
        _1146 = _1144;
        if (_818)
        {
            _1132 = 2.0;
        }
        float _1148 = _1132;
        float _1150 = -_1138;
        float _1152 = _1136 + _1150;
        _1154 = _1148;
        _1156 = _1152;
        if (_818)
        {
            _1140 = 3.0;
        }
        float _1158 = _1140;
        _1160 = _1158;
        if (_818)
        {
            _1116 = 4.0;
        }
        float _1162 = _1116;
        _1164 = _1162;
        if (_818)
        {
            _1142 = 0.1500000059604644775390625;
        }
        float _1166 = _1142;
        _1168 = _1166;
        if (_818)
        {
            _1092 = 0.23000000417232513427734375;
        }
        float _1170 = _1092;
        _1172 = _1170;
        if (_818)
        {
            _1094 = 0.4199999868869781494140625;
        }
        float _1174 = _1094;
        _1176 = _1174;
        _1178 = 0.0;
        _1180 = 0.0;
        _1182 = 0.0;
        _1184 = true;
    }
    else
    {
        if (_818)
        {
            _836 = 0.4199999868869781494140625;
        }
        float _1186 = _836;
        float _1188 = _676;
        if (!_818)
        {
            float _1190 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[9]);
            _1188 = _1190;
        }
        float _1192 = _1188;
        if (_818)
        {
            _650 = 0.23000000417232513427734375;
        }
        float _1194 = _650;
        if (_818)
        {
            _740 = 0.60000002384185791015625;
        }
        float _1196 = _740;
        float _1198 = 0.0;
        if (!_818)
        {
            float _1200 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[8]);
            _1198 = _1200;
        }
        float _1202 = _1198;
        float _1204 = _1186;
        if (!_818)
        {
            float _1206 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1204 = _1206;
        }
        float _1208 = _1204;
        float _1210 = _1194;
        if (!_818)
        {
            float _1212 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1210 = _1212;
        }
        float _1214 = _1210;
        float _1216 = _1196;
        if (!_818)
        {
            float _1218 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1216 = _1218;
        }
        float _1220 = _1216;
        if (_818)
        {
            _326 = 0.1500000059604644775390625;
        }
        float _1222 = _326;
        float _1224 = 0.0;
        if (!_818)
        {
            float _1226 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[10]);
            _1224 = _1226;
        }
        float _1228 = _1224;
        float _1230 = _1222;
        if (!_818)
        {
            float _1232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1230 = _1232;
        }
        float _1234 = _1230;
        float _1236 = 0.0;
        if (!_818)
        {
            float _1238 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[11]);
            _1236 = _1238;
        }
        float _1240 = _1236;
        if (_818)
        {
            _838 = 0.4199999868869781494140625;
        }
        float _1242 = _838;
        float _1244 = _1242;
        if (_818)
        {
            _748 = 0.4199999868869781494140625;
        }
        float _1246 = _748;
        float _1248 = _828 * 6.283184051513671875;
        float _1250 = _780 * 6.283184051513671875;
        float _1252 = _1246;
        float _1254 = _1208;
        if (!_818)
        {
            _1244 = _1208;
        }
        float _1256 = _1244;
        float _1258 = _1256;
        if (!_818)
        {
            _1252 = _1208;
        }
        float _1260 = _1252;
        float _1262 = _558 * _1256;
        float _1264 = _1260;
        if (_818)
        {
            _1258 = 0.4199999868869781494140625;
        }
        float _1266 = _1258;
        float _1268 = _558 * _1260;
        float _1270 = _558 * _1214;
        float _1272 = _1266;
        _920 = _1192;
        if (!_818)
        {
            _1272 = _1208;
        }
        float _1274 = _1272;
        float _1276 = _558 * _1208;
        float _1278 = _1274;
        if (_818)
        {
            _1264 = 0.60000002384185791015625;
        }
        float _1280 = _1264;
        float _1282 = _1280;
        if (!_818)
        {
            _1282 = _1220;
        }
        float _1284 = _1282;
        float _1286 = 1.0 / _1270;
        float _1288 = _1284;
        if (_818)
        {
            _1254 = 0.60000002384185791015625;
        }
        float _1290 = _1254;
        float _1292 = _558 * _1220;
        float _1294 = 1.0 / _1276;
        float _1296 = _558 * _1274;
        float _1298 = _1290;
        if (_818)
        {
            _1278 = 0.60000002384185791015625;
        }
        float _1300 = _1278;
        float _1302 = _1300;
        if (!_818)
        {
            _1302 = _1220;
        }
        float _1304 = _1302;
        float _1306 = _558 * _1284;
        if (_818)
        {
            _1288 = 0.23000000417232513427734375;
        }
        float _1308 = _1288;
        float _1310 = _1308;
        if (!_818)
        {
            _1310 = _1214;
        }
        float _1312 = _1310;
        float _1314 = _1312;
        if (!_818)
        {
            _1298 = _1220;
        }
        float _1316 = _1298;
        float _1318 = _558 * _1304;
        float _1320 = _558 * _1312;
        float _1322 = _1316;
        float _1324 = _1318;
        if (_818)
        {
            _1314 = 0.23000000417232513427734375;
        }
        float _1326 = _1314;
        float _1328 = 1.0 / _1292;
        float _1330 = _1326;
        if (!_818)
        {
            _1330 = _1214;
        }
        float _1332 = _1330;
        float _1334 = _558 * _1234;
        float _1336 = _558 * _1316;
        float _1338 = _1332;
        _928 = _1202;
        _930 = _1228;
        _932 = _1240;
        if (_818)
        {
            _1322 = 0.23000000417232513427734375;
        }
        float _1340 = _1322;
        float _1342 = _1340;
        if (!_818)
        {
            _1342 = _1214;
        }
        float _1344 = _1342;
        float _1346 = _558 * _1332;
        float _1348 = _1344;
        if (_818)
        {
            _1338 = 0.1500000059604644775390625;
        }
        float _1350 = _1338;
        float _1352 = _1350;
        if (!_818)
        {
            _1352 = _1234;
        }
        float _1354 = _1352;
        float _1356 = 1.0 / _1296;
        float _1358 = 1.0 / _1262;
        float _1360 = 1.0 / _1318;
        float _1362 = 1.0 / _1336;
        _1182 = _1362;
        if (_818)
        {
            _1324 = 0.1500000059604644775390625;
        }
        float _1364 = _1324;
        float _1366 = _1364;
        if (!_818)
        {
            _1366 = _1234;
        }
        float _1368 = _1366;
        float _1370 = 1.0 / _1306;
        float _1372 = _558 * _1344;
        float _1374 = _558 * _1368;
        float _1376 = 1.0 / _1334;
        float _1378 = _558 * _1354;
        float _1380 = _1294 * _1248;
        float _1382 = 1.0 / _1268;
        float _1384 = 1.0 / _1372;
        if (_818)
        {
            _1348 = 0.1500000059604644775390625;
        }
        float _1386 = _1348;
        float _1388 = _1380 * 0.15915493667125701904296875;
        float _1390 = _1328 * _1248;
        float _1392 = 1.0 / _1346;
        float _1394 = _1386;
        if (!_818)
        {
            _1394 = _1234;
        }
        float _1396 = _1394;
        float _1398 = 1.0 / _1374;
        float _1400 = _1390 * 0.15915493667125701904296875;
        float _1402 = _1286 * _1248;
        float _1404 = _780 + _744;
        float _1406 = _1356 * _1250;
        float _1408 = _1402 * 0.15915493667125701904296875;
        float _1410 = _1404 * 6.283184051513671875;
        float _1412 = _1376 * _1248;
        float _1414 = _1406 * 0.15915493667125701904296875;
        float _1416 = _1388 * 6.283185482025146484375;
        float _1418 = sin(_1416);
        float _1420 = _1370 * _1410;
        float _1422 = _1382 * _1410;
        float _1424 = _1420 * 0.15915493667125701904296875;
        float _1426 = _1360 * _1250;
        float _1428 = 1.0 / _1378;
        float _1430 = _1426 * 0.15915493667125701904296875;
        float _1432 = _1426;
        if (_818)
        {
            _1432 = 3.0;
        }
        float _1434 = _1432;
        float _1436 = _1414 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1422 * 0.15915493667125701904296875;
        float _1442 = _798 * _1358;
        float _1444 = _1434;
        if (!_818)
        {
            _1444 = _1192;
        }
        float _1446 = _1444;
        float _1448 = _558 * _1396;
        float _1450 = _1442 * 6.283184051513671875;
        float _1452 = _1440 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 * 0.15915493667125701904296875;
        float _1458 = _1384 * _1410;
        float _1460 = 1.0 / _1320;
        float _1462 = _1418 * _1446;
        float _1464 = _1446;
        float _1466 = _1458;
        float _1468 = _1418;
        if (_818)
        {
            _1464 = 3.0;
        }
        float _1470 = _1464;
        float _1472 = _1470;
        if (!_818)
        {
            _1472 = _1192;
        }
        float _1474 = _1472;
        float _1476 = _1458 * 0.15915493667125701904296875;
        float _1478 = _1424 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        if (_818)
        {
            _1466 = 3.0;
        }
        float _1482 = _1466;
        float _1484 = _1392 * _1250;
        float _1486 = _1482;
        if (!_818)
        {
            _1486 = _1192;
        }
        float _1488 = _1486;
        float _1490 = _1438 * _1474;
        float _1492 = 1.0 / _1448;
        float _1494 = _798 * _1362;
        float _1496 = _1484 * 0.15915493667125701904296875;
        float _1498 = _1454 * _1488;
        float _1500 = _1488;
        float _1502 = _1494;
        if (_818)
        {
            _1500 = 4.0;
        }
        float _1504 = _1500;
        float _1506 = _1494 * 6.283184051513671875;
        float _1508 = _1504;
        if (!_818)
        {
            _1508 = _1202;
        }
        float _1510 = _1508;
        float _1512 = _798 * _1460;
        float _1514 = _1456 * 6.283185482025146484375;
        float _1516 = sin(_1514);
        float _1518 = _1506 * 0.15915493667125701904296875;
        float _1520 = fma(_1480, _1510, _1498);
        float _1522 = _1512 * 6.283184051513671875;
        float _1524 = _1430 * 6.283185482025146484375;
        float _1526 = sin(_1524);
        float _1528 = _798 * _1492;
        float _1530 = _1398 * _1410;
        float _1532 = _1522 * 0.15915493667125701904296875;
        float _1534 = _1528 * 6.283184051513671875;
        float _1536 = _1530 * 0.15915493667125701904296875;
        float _1538 = _1400 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        float _1542 = _1492;
        float _1544 = _1522;
        if (_818)
        {
            _1468 = 3.0;
        }
        float _1546 = _1468;
        float _1548 = _1428 * _1250;
        float _1550 = _1546;
        if (!_818)
        {
            _1550 = _1192;
        }
        float _1552 = _1550;
        float _1554 = _1518 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        float _1558 = _1552;
        if (_818)
        {
            _1502 = 4.0;
        }
        float _1560 = _1502;
        float _1562 = _1412 * 0.15915493667125701904296875;
        float _1564 = _1560;
        if (!_818)
        {
            _1564 = _1202;
        }
        float _1566 = _1564;
        float _1568 = _1534 * 0.15915493667125701904296875;
        float _1570 = _1548 * 0.15915493667125701904296875;
        float _1572 = _1408 * 6.283185482025146484375;
        float _1574 = sin(_1572);
        float _1576 = _1516 * _1552;
        float _1578 = _1566;
        _1178 = _1570;
        if (_818)
        {
            _1558 = 4.0;
        }
        float _1580 = _1558;
        float _1582 = _1476 * 6.283185482025146484375;
        float _1584 = sin(_1582);
        float _1586 = fma(_1526, _1566, _1490);
        float _1588 = _1580;
        if (_818)
        {
            _1542 = 4.0;
        }
        float _1590 = _1542;
        float _1592 = _1496 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        float _1596 = _1590;
        if (!_818)
        {
            _1588 = _1202;
        }
        float _1598 = _1588;
        if (!_818)
        {
            _1596 = _1202;
        }
        float _1600 = _1596;
        float _1602 = _1532 * 6.283185482025146484375;
        float _1604 = sin(_1602);
        float _1606 = _1600;
        if (_818)
        {
            _840 = 2.0;
        }
        float _1608 = _840;
        float _1610 = _1608;
        if (_818)
        {
            _1578 = 2.0;
        }
        float _1612 = _1578;
        float _1614 = _1612;
        if (_818)
        {
            _1544 = 2.0;
        }
        float _1616 = _1544;
        float _1618 = _1562 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        float _1622 = _1616;
        if (!_818)
        {
            _1610 = _1228;
        }
        float _1624 = _1610;
        float _1626 = fma(_1540, _1598, _1462);
        float _1628 = _1626;
        float _1630 = _1624;
        _1176 = _1540;
        if (!_818)
        {
            _1614 = _1228;
        }
        float _1632 = _1614;
        float _1634 = _1536 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        float _1638 = _1632;
        if (!_818)
        {
            _1622 = _1228;
        }
        float _1640 = _1622;
        float _1642 = fma(_1556, _1600, _1576);
        float _1644 = _1570 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1640;
        _1012 = _1642;
        if (_818)
        {
            _1606 = 2.0;
        }
        float _1650 = _1606;
        float _1652 = _1568 * 6.283185482025146484375;
        float _1654 = sin(_1652);
        float _1656 = _1650;
        if (!_818)
        {
            _1656 = _1228;
        }
        float _1658 = _1656;
        float _1660 = fma(_1574, _1624, _1626);
        float _1662 = fma(_1584, _1632, _1520);
        float _1664 = fma(_1594, _1640, _1586);
        float _1666 = _1658;
        _1030 = _1662;
        _1180 = _1664;
        if (_818)
        {
            _1628 = 1.5;
        }
        float _1668 = _1628;
        float _1670 = _1668;
        if (_818)
        {
            _1630 = 1.5;
        }
        float _1672 = _1630;
        float _1674 = _1672;
        if (_818)
        {
            _1638 = 1.5;
        }
        float _1676 = _1638;
        float _1678 = _1676;
        if (_818)
        {
            _1648 = 1.5;
        }
        float _1680 = _1648;
        float _1682 = fma(_1604, _1658, _1642);
        float _1684 = _1680;
        if (!_818)
        {
            _1670 = _1240;
        }
        float _1686 = _1670;
        if (!_818)
        {
            _1678 = _1240;
        }
        float _1688 = _1678;
        float _1690 = _1688;
        if (!_818)
        {
            _1684 = _1240;
        }
        float _1692 = _1684;
        if (!_818)
        {
            _1674 = _1240;
        }
        float _1694 = _1674;
        float _1696 = fma(_1620, _1686, _1660);
        float _1698 = fma(_1636, _1688, _1662);
        float _1700 = fma(_1646, _1692, _1664);
        float _1702 = fma(_1654, _1694, _1682);
        float _1704 = -_1698;
        float _1706 = _1704 + _1700;
        float _1708 = -_1702;
        float _1710 = _1696 + _1708;
        float _1712 = _1702;
        float _1714 = _1696;
        float _1716 = _1654;
        float _1718 = _1710;
        if (_818)
        {
            _1666 = 1.5;
        }
        float _1720 = _1666;
        _1146 = _1720;
        if (_818)
        {
            _1712 = 2.0;
        }
        float _1722 = _1712;
        float _1724 = _1710 + _1706;
        _1154 = _1722;
        _1156 = _1724;
        if (_818)
        {
            _1690 = 3.0;
        }
        float _1726 = _1690;
        _1160 = _1726;
        if (_818)
        {
            _1714 = 4.0;
        }
        float _1728 = _1714;
        _1164 = _1728;
        if (_818)
        {
            _1716 = 0.1500000059604644775390625;
        }
        float _1730 = _1716;
        _1168 = _1730;
        if (_818)
        {
            _1718 = 0.23000000417232513427734375;
        }
        float _1732 = _1718;
        _1172 = _1732;
        if (_818)
        {
            _1176 = 0.4199999868869781494140625;
        }
    }
    _1184 = false;
    float _1734 = _1176;
    float _1736 = _1172;
    float _1738 = _1168;
    float _1740 = _1012;
    float _1742 = _1030;
    float _1744 = _1178;
    float _1746 = _1160;
    float _1748 = _920;
    float _1750 = _1164;
    float _1752 = _928;
    float _1754 = _1154;
    float _1756 = _930;
    float _1758 = _1146;
    float _1760 = _932;
    float _1762 = _1180;
    float _1764 = _1182;
    float _1766 = _1156;
    float _1768 = _720 + _784;
    float _1770 = _166 + _1768;
    float _1772 = _1770 + _744;
    float _1774 = _1740;
    float _1776 = _1742;
    float _1778 = _1744;
    float _1780 = _1770;
    float _1782 = _1768;
    float _1784 = _1742;
    float _1786 = _1744;
    float _1788 = _1762;
    float _1790 = _1764;
    float _1792 = _1770;
    float _1794 = _1740;
    float _1796 = _1768;
    float _1798 = _1734;
    float _1800 = _1736;
    float _1802 = _1738;
    float _1804 = _1754;
    float _1806 = _1746;
    float _1808 = _1750;
    float _1810 = _1758;
    float _1812 = _1734;
    float _1814 = _1736;
    float _1816 = _1738;
    float _1818 = _1754;
    float _1820 = _1758;
    float _1822 = _1746;
    float _1824 = _1748;
    float _1826 = _1750;
    float _1994;
    float _2016;
    float _2064;
    float _2084;
    float _2086;
    float _2088;
    if (!_796)
    {
        if (_818)
        {
            _842 = _1734;
        }
        float _1828 = _842;
        if (_818)
        {
            _1774 = 0.60000002384185791015625;
        }
        float _1830 = _1774;
        if (_818)
        {
            _1776 = _1736;
        }
        float _1832 = _1776;
        float _1834 = _1828;
        if (!_818)
        {
            float _1836 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _1834 = _1836;
        }
        float _1838 = _1834;
        if (_818)
        {
            _1778 = _1738;
        }
        float _1840 = _1778;
        float _1842 = _1830;
        if (!_818)
        {
            float _1844 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _1842 = _1844;
        }
        float _1846 = _1842;
        float _1848 = _1832;
        if (!_818)
        {
            float _1850 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _1848 = _1850;
        }
        float _1852 = _1848;
        float _1854 = _1840;
        if (!_818)
        {
            float _1856 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _1854 = _1856;
        }
        float _1858 = _1854;
        if (_818)
        {
            _1780 = _1734;
        }
        float _1860 = _1780;
        float _1862 = _1772 * 6.283184051513671875;
        float _1864 = _558 * _1838;
        float _1866 = _1860;
        float _1868 = _1838;
        if (!_818)
        {
            _1866 = _1838;
        }
        float _1870 = _1866;
        float _1872 = _1870;
        if (_818)
        {
            _1868 = 0.60000002384185791015625;
        }
        float _1874 = _1868;
        float _1876 = 1.0 / _1864;
        float _1878 = _558 * _1846;
        float _1880 = _1874;
        if (!_818)
        {
            _1880 = _1846;
        }
        float _1882 = _1880;
        float _1884 = _558 * _1870;
        float _1886 = _558 * _1852;
        float _1888 = _1882;
        if (_818)
        {
            _1872 = _1736;
        }
        float _1890 = _1872;
        float _1892 = _1890;
        if (!_818)
        {
            _1892 = _1852;
        }
        float _1894 = _1892;
        float _1896 = 1.0 / _1878;
        float _1898 = _558 * _1858;
        float _1900 = _558 * _1894;
        float _1902 = 1.0 / _1886;
        float _1904 = _558 * _1882;
        if (_818)
        {
            _1888 = _1738;
        }
        float _1906 = _1888;
        float _1908 = _1906;
        if (!_818)
        {
            _1908 = _1858;
        }
        float _1910 = _1908;
        float _1912 = 1.0 / _1884;
        float _1914 = _558 * _1910;
        float _1916 = _1876 * _1862;
        float _1918 = _1916 * 0.15915493667125701904296875;
        float _1920 = _1896 * _1862;
        float _1922 = 1.0 / _1898;
        float _1924 = _1920 * 0.15915493667125701904296875;
        float _1926 = _1902 * _1862;
        float _1928 = 1.0 / _1904;
        float _1930 = _1926 * 0.15915493667125701904296875;
        float _1932 = 1.0 / _1900;
        float _1934 = _1922 * _1862;
        float _1936 = _1934 * 0.15915493667125701904296875;
        float _1938 = 1.0 / _1914;
        float _1940 = _1768 * _1912;
        float _1942 = _1768 * _1928;
        float _1944 = _1940 * 6.283184051513671875;
        float _1946 = _1918 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = _1944 * 0.15915493667125701904296875;
        float _1952 = _1942 * 6.283184051513671875;
        float _1954 = _1768 * _1932;
        float _1956 = _1954 * 6.283184051513671875;
        float _1958 = _1950 * 6.283185482025146484375;
        float _1960 = sin(_1958);
        float _1962 = _1952 * 0.15915493667125701904296875;
        float _1964 = _1768 * _1938;
        float _1966 = _1956 * 0.15915493667125701904296875;
        float _1968 = _1954;
        float _1970 = _1952;
        float _1972 = _1948;
        if (_818)
        {
            _1968 = _1746;
        }
        float _1974 = _1968;
        float _1976 = _1964 * 6.283184051513671875;
        float _1978 = _1974;
        if (!_818)
        {
            _1978 = _1748;
        }
        float _1980 = _1978;
        float _1982 = _1924 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = _1980;
        if (_818)
        {
            _1970 = _1746;
        }
        float _1988 = _1970;
        float _1990 = _1976 * 0.15915493667125701904296875;
        float _1992 = _1988;
        _1994 = _1990;
        if (!_818)
        {
            _1992 = _1748;
        }
        float _1996 = _1992;
        float _1998 = _1996;
        if (_818)
        {
            _1782 = _1750;
        }
        float _2000 = _1782;
        float _2002 = _2000;
        if (!_818)
        {
            _2002 = _1752;
        }
        float _2004 = _2002;
        float _2006 = _1962 * 6.283185482025146484375;
        float _2008 = sin(_2006);
        float _2010 = _1960 * _1980;
        float _2012 = _1948 * _1996;
        float _2014 = _2004;
        _2016 = _2010;
        if (_818)
        {
            _1986 = _1750;
        }
        float _2018 = _1986;
        float _2020 = _2018;
        if (!_818)
        {
            _2020 = _1752;
        }
        float _2022 = _2020;
        if (_818)
        {
            _1972 = _1754;
        }
        float _2024 = _1972;
        float _2026 = _1930 * 6.283185482025146484375;
        float _2028 = sin(_2026);
        float _2030 = fma(_1984, _2004, _2012);
        float _2032 = _2024;
        float _2034 = _1984;
        if (_818)
        {
            _2014 = _1754;
        }
        float _2036 = _2014;
        float _2038 = _2036;
        if (!_818)
        {
            _2032 = _1756;
        }
        float _2040 = _2032;
        if (!_818)
        {
            _2038 = _1756;
        }
        float _2042 = _2038;
        float _2044 = _1966 * 6.283185482025146484375;
        float _2046 = sin(_2044);
        float _2048 = fma(_2008, _2022, _2010);
        if (_818)
        {
            _2034 = _1758;
        }
        float _2050 = _2034;
        float _2052 = _2050;
        if (_818)
        {
            _1998 = _1758;
        }
        float _2054 = _1998;
        float _2056 = _2054;
        if (!_818)
        {
            _2052 = _1760;
        }
        float _2058 = _2052;
        float _2060 = _1936 * 6.283185482025146484375;
        float _2062 = sin(_2060);
        _2064 = _2058;
        if (!_818)
        {
            _2056 = _1760;
        }
        float _2066 = _2056;
        float _2068 = fma(_2028, _2040, _2030);
        float _2070 = _1990 * 6.283185482025146484375;
        float _2072 = sin(_2070);
        float _2074 = fma(_2046, _2042, _2048);
        float _2076 = fma(_2062, _2058, _2068);
        float _2078 = fma(_2072, _2066, _2074);
        float _2080 = -_2078;
        float _2082 = _2076 + _2080;
        _2084 = _2068;
        _2086 = _2078;
        _2088 = _2082;
        _2090 = true;
    }
    else
    {
        if (_818)
        {
            _1784 = _1734;
        }
        float _2092 = _1784;
        if (_818)
        {
            _1786 = 0.60000002384185791015625;
        }
        float _2094 = _1786;
        float _2096 = _2092;
        if (!_818)
        {
            float _2098 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2096 = _2098;
        }
        float _2100 = _2096;
        if (_818)
        {
            _1788 = _1736;
        }
        float _2102 = _1788;
        float _2104 = _2094;
        if (!_818)
        {
            float _2106 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2104 = _2106;
        }
        float _2108 = _2104;
        float _2110 = _2102;
        if (!_818)
        {
            float _2112 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2110 = _2112;
        }
        float _2114 = _2110;
        if (_818)
        {
            _1790 = _1738;
        }
        float _2116 = _1790;
        float _2118 = _2116;
        if (!_818)
        {
            float _2120 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2118 = _2120;
        }
        float _2122 = _2118;
        if (_818)
        {
            _1792 = _1734;
        }
        float _2124 = _1792;
        float _2126 = _1772 * 6.283184051513671875;
        float _2128 = _2124;
        if (_818)
        {
            _1794 = _1734;
        }
        float _2130 = _1794;
        float _2132 = _2130;
        float _2134 = _2100;
        if (!_818)
        {
            _2128 = _2100;
        }
        float _2136 = _2128;
        float _2138 = _558 * _2100;
        float _2140 = _2136;
        if (!_818)
        {
            _2132 = _2100;
        }
        float _2142 = _2132;
        float _2144 = _558 * _2108;
        float _2146 = 1.0 / _2138;
        float _2148 = _558 * _2136;
        float _2150 = _2142;
        float _2152 = _2108;
        if (_818)
        {
            _2140 = _1734;
        }
        float _2154 = _2140;
        float _2156 = _558 * _2114;
        float _2158 = _2154;
        float _2160 = _2114;
        if (!_818)
        {
            _2158 = _2100;
        }
        float _2162 = _2158;
        float _2164 = _2162;
        if (_818)
        {
            _2134 = 0.60000002384185791015625;
        }
        float _2166 = _2134;
        float _2168 = 1.0 / _2144;
        float _2170 = _558 * _2142;
        float _2172 = _2166;
        if (_818)
        {
            _2150 = 0.60000002384185791015625;
        }
        float _2174 = _2150;
        float _2176 = _558 * _2162;
        float _2178 = _2174;
        if (!_818)
        {
            _2178 = _2108;
        }
        float _2180 = _2178;
        float _2182 = _558 * _2122;
        float _2184 = _2180;
        if (_818)
        {
            _2164 = 0.60000002384185791015625;
        }
        float _2186 = _2164;
        float _2188 = _2186;
        if (!_818)
        {
            _2188 = _2108;
        }
        float _2190 = _2188;
        float _2192 = _558 * _2180;
        if (_818)
        {
            _2184 = _1736;
        }
        float _2194 = _2184;
        float _2196 = 1.0 / _2156;
        float _2198 = _2194;
        if (!_818)
        {
            _2198 = _2114;
        }
        float _2200 = _2198;
        float _2202 = _2200;
        if (!_818)
        {
            _2172 = _2108;
        }
        float _2204 = _2172;
        if (_818)
        {
            _2152 = _1736;
        }
        float _2206 = _2152;
        float _2208 = _2206;
        if (!_818)
        {
            _2208 = _2114;
        }
        float _2210 = _2208;
        float _2212 = 1.0 / _2170;
        float _2214 = _558 * _2190;
        float _2216 = _558 * _2200;
        float _2218 = _2210;
        if (_818)
        {
            _2202 = _1736;
        }
        float _2220 = _2202;
        float _2222 = _558 * _2204;
        float _2224 = _2220;
        if (!_818)
        {
            _2224 = _2114;
        }
        float _2226 = _2224;
        if (_818)
        {
            _2160 = _1738;
        }
        float _2228 = _2160;
        float _2230 = 1.0 / _2148;
        float _2232 = _558 * _2210;
        float _2234 = _2228;
        if (_818)
        {
            _2218 = _1738;
        }
        float _2236 = _2218;
        float _2238 = _2236;
        if (!_818)
        {
            _2238 = _2122;
        }
        float _2240 = _2238;
        float _2242 = _2240;
        if (!_818)
        {
            _2234 = _2122;
        }
        float _2244 = _2234;
        float _2246 = 1.0 / _2192;
        float _2248 = 1.0 / _2182;
        float _2250 = _558 * _2226;
        float _2252 = _558 * _2240;
        if (_818)
        {
            _2242 = _1738;
        }
        float _2254 = _2242;
        float _2256 = _2254;
        if (!_818)
        {
            _2256 = _2122;
        }
        float _2258 = _2256;
        float _2260 = 1.0 / _2250;
        float _2262 = _558 * _2244;
        float _2264 = _558 * _2258;
        float _2266 = _784 + _744;
        float _2268 = 1.0 / _2214;
        float _2270 = _2146 * _2126;
        float _2272 = _2266 * 6.283184051513671875;
        float _2274 = _2212 * _2272;
        float _2276 = 1.0 / _2176;
        float _2278 = _2270 * 0.15915493667125701904296875;
        float _2280 = _2168 * _2126;
        float _2282 = _2280 * 0.15915493667125701904296875;
        float _2284 = _2196 * _2126;
        float _2286 = 1.0 / _2232;
        float _2288 = 1.0 / _2264;
        float _2290 = _2284 * 0.15915493667125701904296875;
        float _2292 = _2248 * _2126;
        float _2294 = _784 * 6.283184051513671875;
        float _2296 = _2292 * 0.15915493667125701904296875;
        float _2298 = _2276 * _2294;
        float _2300 = _2278 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        float _2304 = _2274 * 0.15915493667125701904296875;
        float _2306 = _1768 * _2230;
        float _2308 = _2298 * 0.15915493667125701904296875;
        float _2310 = _2246 * _2272;
        float _2312 = _2306 * 6.283184051513671875;
        float _2314 = _2310 * 0.15915493667125701904296875;
        float _2316 = 1.0 / _2222;
        float _2318 = _2312 * 0.15915493667125701904296875;
        float _2320 = _2268 * _2294;
        float _2322 = _2286 * _2272;
        float _2324 = _2320 * 0.15915493667125701904296875;
        float _2326 = _2320;
        float _2328 = _2322;
        if (_818)
        {
            _2326 = _1746;
        }
        float _2330 = _2326;
        float _2332 = _2304 * 6.283185482025146484375;
        float _2334 = sin(_2332);
        float _2336 = _2330;
        if (!_818)
        {
            _2336 = _1748;
        }
        float _2338 = _2336;
        float _2340 = _2322 * 0.15915493667125701904296875;
        float _2342 = _2338;
        if (_818)
        {
            _2328 = _1746;
        }
        float _2344 = _2328;
        float _2346 = _2344;
        if (!_818)
        {
            _2346 = _1748;
        }
        float _2348 = _2346;
        float _2350 = _2302 * _2338;
        float _2352 = _2302;
        if (_818)
        {
            _2352 = _1746;
        }
        float _2354 = _2352;
        float _2356 = _2308 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354;
        if (_818)
        {
            _2342 = _1746;
        }
        float _2362 = _2342;
        float _2364 = _1768 * _2316;
        float _2366 = _2362;
        float _2368 = _2364;
        if (!_818)
        {
            _2360 = _1748;
        }
        float _2370 = _2360;
        float _2372 = _2370;
        if (!_818)
        {
            _2366 = _1748;
        }
        float _2374 = _2366;
        float _2376 = _2318 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        float _2380 = 1.0 / _2216;
        float _2382 = _2358 * _2374;
        float _2384 = _2374;
        if (_818)
        {
            _2384 = _1750;
        }
        float _2386 = _2384;
        float _2388 = _2386;
        if (!_818)
        {
            _2388 = _1752;
        }
        float _2390 = _2388;
        float _2392 = _2324 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = 1.0 / _2262;
        float _2398 = _1768 * _2380;
        float _2400 = _2314 * 6.283185482025146484375;
        float _2402 = sin(_2400);
        float _2404 = _2260 * _2294;
        float _2406 = fma(_2394, _2390, _2382);
        float _2408 = _2398 * 6.283184051513671875;
        float _2410 = _2398;
        float _2412 = _2408;
        if (_818)
        {
            _2410 = _1750;
        }
        float _2414 = _2410;
        float _2416 = _2404 * 0.15915493667125701904296875;
        float _2418 = _2334 * _2370;
        float _2420 = _2378 * _2348;
        float _2422 = 1.0 / _2252;
        float _2424 = _2364 * 6.283184051513671875;
        float _2426 = _2414;
        if (_818)
        {
            _2368 = _1750;
        }
        float _2428 = _2368;
        float _2430 = _2396 * _2272;
        float _2432 = _2428;
        if (!_818)
        {
            _2432 = _1752;
        }
        float _2434 = _2432;
        float _2436 = _2424 * 0.15915493667125701904296875;
        if (_818)
        {
            _2372 = _1750;
        }
        float _2438 = _2372;
        float _2440 = _2288 * _2294;
        float _2442 = _2282 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = _2438;
        if (!_818)
        {
            _2446 = _1752;
        }
        float _2448 = _2446;
        float _2450 = fma(_2402, _2434, _2418);
        float _2452 = _2440 * 0.15915493667125701904296875;
        float _2454 = _2430 * 0.15915493667125701904296875;
        if (!_818)
        {
            _2426 = _1752;
        }
        float _2456 = _2426;
        float _2458 = _2290 * 6.283185482025146484375;
        float _2460 = sin(_2458);
        float _2462 = _1768 * _2422;
        float _2464 = _2422;
        float _2466 = _2456;
        if (_818)
        {
            _2464 = _1754;
        }
        float _2468 = _2464;
        float _2470 = _2468;
        if (!_818)
        {
            _2470 = _1756;
        }
        float _2472 = _2470;
        float _2474 = _2462 * 6.283184051513671875;
        float _2476 = _2472;
        float _2478 = _2474;
        if (_818)
        {
            _1796 = _1754;
        }
        float _2480 = _1796;
        float _2482 = _2436 * 6.283185482025146484375;
        float _2484 = sin(_2482);
        float _2486 = fma(_2444, _2448, _2350);
        float _2488 = _2408 * 0.15915493667125701904296875;
        float _2490 = _2480;
        if (_818)
        {
            _2412 = _1754;
        }
        float _2492 = _2412;
        float _2494 = _2492;
        if (!_818)
        {
            _2490 = _1756;
        }
        float _2496 = _2490;
        float _2498 = _2496;
        if (!_818)
        {
            _2494 = _1756;
        }
        float _2500 = _2494;
        float _2502 = _2340 * 6.283185482025146484375;
        float _2504 = sin(_2502);
        float _2506 = fma(_2460, _2472, _2486);
        float _2508 = _2500;
        if (_818)
        {
            _2476 = _1758;
        }
        float _2510 = _2476;
        float _2512 = _2510;
        if (!_818)
        {
            _2512 = _1760;
        }
        float _2514 = _2512;
        float _2516 = _2416 * 6.283185482025146484375;
        float _2518 = sin(_2516);
        float _2520 = fma(_2484, _2456, _2420);
        _2064 = _2514;
        if (_818)
        {
            _2466 = _1754;
        }
        float _2522 = _2466;
        float _2524 = _2522;
        if (!_818)
        {
            _2524 = _1756;
        }
        float _2526 = _2524;
        float _2528 = _2452 * 6.283185482025146484375;
        float _2530 = sin(_2528);
        float _2532 = fma(_2504, _2496, _2450);
        if (_818)
        {
            _2498 = _1758;
        }
        float _2534 = _2498;
        float _2536 = _2534;
        if (!_818)
        {
            _2536 = _1760;
        }
        float _2538 = _2536;
        float _2540 = _2488 * 6.283185482025146484375;
        float _2542 = sin(_2540);
        float _2544 = _2474 * 0.15915493667125701904296875;
        float _2546 = fma(_2518, _2500, _2406);
        _2016 = _2544;
        if (_818)
        {
            _2478 = _1758;
        }
        float _2548 = _2478;
        float _2550 = _2548;
        if (_818)
        {
            _2508 = _1758;
        }
        float _2552 = _2508;
        float _2554 = _2552;
        if (!_818)
        {
            _2550 = _1760;
        }
        float _2556 = _2550;
        float _2558 = _2296 * 6.283185482025146484375;
        float _2560 = sin(_2558);
        _2084 = _2556;
        if (!_818)
        {
            _2554 = _1760;
        }
        float _2562 = _2554;
        float _2564 = fma(_2530, _2562, _2546);
        float _2566 = _2454 * 6.283185482025146484375;
        float _2568 = sin(_2566);
        float _2570 = fma(_2542, _2526, _2520);
        float _2572 = _2544 * 6.283185482025146484375;
        float _2574 = sin(_2572);
        float _2576 = fma(_2560, _2556, _2506);
        float _2578 = fma(_2568, _2538, _2532);
        float _2580 = -_2578;
        float _2582 = _2580 + _2564;
        float _2584 = fma(_2574, _2514, _2570);
        float _2586 = -_2584;
        float _2588 = _2576 + _2586;
        float _2590 = _2588 + _2582;
        _2086 = _2588;
        _1994 = _2570;
        _2088 = _2590;
    }
    _2090 = false;
    float _2592 = _2064;
    float _2594 = _2084;
    float _2596 = _2016;
    float _2598 = _2086;
    float _2600 = _1994;
    float _2602 = _2088;
    float _2604 = _720 + _786;
    float _2606 = _166 + _2604;
    float _2608 = _2606 + _744;
    float _2610 = _2606;
    float _2612 = _2592;
    float _2614 = _2594;
    float _2616 = _2594;
    float _2618 = _2596;
    float _2620 = _2598;
    float _2622 = _2600;
    float _2624 = _2606;
    float _2626 = _2592;
    float _2628 = _2604;
    float _2630 = _2602;
    int _2734;
    float _2796;
    float _2848;
    float _2850;
    float _2852;
    if (!_796)
    {
        if (_818)
        {
            _844 = _1734;
        }
        float _2632 = _844;
        if (_818)
        {
            _2610 = 0.60000002384185791015625;
        }
        float _2634 = _2610;
        if (_818)
        {
            _2612 = _1736;
        }
        float _2636 = _2612;
        float _2638 = _2632;
        if (!_818)
        {
            float _2640 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[5]);
            _2638 = _2640;
        }
        float _2642 = _2638;
        if (_818)
        {
            _2614 = _1738;
        }
        float _2644 = _2614;
        float _2646 = _2634;
        if (!_818)
        {
            float _2648 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[4]);
            _2646 = _2648;
        }
        float _2650 = _2646;
        float _2652 = _2636;
        if (!_818)
        {
            float _2654 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[6]);
            _2652 = _2654;
        }
        float _2656 = _2652;
        float _2658 = _2644;
        if (!_818)
        {
            float _2660 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[7]);
            _2658 = _2660;
        }
        float _2662 = _2658;
        float _2664 = _2608 * 6.283184051513671875;
        float _2666 = _558 * _2642;
        float _2668 = _2642;
        if (!_818)
        {
            _1798 = _2642;
        }
        float _2670 = _1798;
        if (_818)
        {
            _2668 = 0.60000002384185791015625;
        }
        float _2672 = _2668;
        float _2674 = 1.0 / _2666;
        float _2676 = _558 * _2650;
        float _2678 = _2672;
        if (!_818)
        {
            _2678 = _2650;
        }
        float _2680 = _2678;
        float _2682 = _558 * _2670;
        float _2684 = _558 * _2656;
        if (!_818)
        {
            _1800 = _2656;
        }
        float _2686 = _1800;
        float _2688 = _558 * _2680;
        float _2690 = 1.0 / _2676;
        float _2692 = _558 * _2662;
        if (!_818)
        {
            _1802 = _2662;
        }
        float _2694 = _1802;
        float _2696 = _558 * _2694;
        float _2698 = 1.0 / _2684;
        float _2700 = _558 * _2686;
        float _2702 = _2674 * _2664;
        float _2704 = _2702 * 0.15915493667125701904296875;
        float _2706 = 1.0 / _2692;
        float _2708 = _2690 * _2664;
        float _2710 = _2708 * 0.15915493667125701904296875;
        float _2712 = 1.0 / _2682;
        float _2714 = _2698 * _2664;
        float _2716 = 1.0 / _2688;
        float _2718 = _2714 * 0.15915493667125701904296875;
        float _2720 = _2706 * _2664;
        float _2722 = 1.0 / _2700;
        float _2724 = _2604 * _2712;
        float _2726 = _2724 * 6.283184051513671875;
        float _2728 = 1.0 / _2696;
        float _2730 = _2726 * 0.15915493667125701904296875;
        float _2732 = _2700;
        _2734 = as_type<int>(_2712);
        if (_818)
        {
            _2732 = _1754;
        }
        float _2736 = _2732;
        float _2738 = _2736;
        if (!_818)
        {
            _2738 = _1756;
        }
        float _2740 = _2738;
        if (!_818)
        {
            _1804 = _1756;
        }
        float _2742 = _1804;
        float _2744 = _2704 * 6.283185482025146484375;
        float _2746 = sin(_2744);
        float _2748 = _2720 * 0.15915493667125701904296875;
        float _2750 = _2604 * _2716;
        float _2752 = _2750 * 6.283184051513671875;
        float _2754 = _2604 * _2722;
        float _2756 = _2604 * _2728;
        float _2758 = _2730 * 6.283185482025146484375;
        float _2760 = sin(_2758);
        float _2762 = _2752 * 0.15915493667125701904296875;
        float _2764 = _2754 * 6.283184051513671875;
        float _2766 = _2756 * 6.283184051513671875;
        float _2768 = _2752;
        float _2770 = _2764;
        if (_818)
        {
            _2768 = _1746;
        }
        float _2772 = _2768;
        float _2774 = _2764 * 0.15915493667125701904296875;
        float _2776 = _2766 * 0.15915493667125701904296875;
        float _2778 = _2710 * 6.283185482025146484375;
        float _2780 = sin(_2778);
        float _2782 = _2772;
        if (!_818)
        {
            _2782 = _1748;
        }
        float _2784 = _2782;
        if (!_818)
        {
            _1806 = _1748;
        }
        float _2786 = _1806;
        float _2788 = _2786;
        if (_818)
        {
            _2770 = _1750;
        }
        float _2790 = _2770;
        float _2792 = _2746 * _2784;
        float _2794 = _2790;
        _2796 = _2792;
        if (!_818)
        {
            _2794 = _1752;
        }
        float _2798 = _2794;
        float _2800 = _2762 * 6.283185482025146484375;
        float _2802 = sin(_2800);
        if (!_818)
        {
            _1808 = _1752;
        }
        float _2804 = _1808;
        float _2806 = _2760 * _2786;
        if (_818)
        {
            _2788 = _1758;
        }
        float _2808 = _2788;
        float _2810 = _2808;
        if (!_818)
        {
            _2810 = _1760;
        }
        float _2812 = _2810;
        if (!_818)
        {
            _1810 = _1760;
        }
        float _2814 = _1810;
        float _2816 = _2718 * 6.283185482025146484375;
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
            _2616 = _1734;
        }
        float _2856 = _2616;
        if (_818)
        {
            _2618 = 0.60000002384185791015625;
        }
        float _2858 = _2618;
        if (_818)
        {
            _2620 = _1736;
        }
        float _2860 = _2620;
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
            _2622 = _1738;
        }
        float _2874 = _2622;
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
            _2624 = _1734;
        }
        float _2888 = _2624;
        float _2890 = _2608 * 6.283184051513671875;
        float _2892 = _2888;
        if (_818)
        {
            _2626 = _1734;
        }
        float _2894 = _2626;
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
            _1812 = _2866;
        }
        float _2914 = _1812;
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
            _2912 = _1736;
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
            _2930 = _1736;
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
            _1814 = _2880;
        }
        float _2974 = _1814;
        float _2976 = 1.0 / _2942;
        float _2978 = _558 * _2938;
        float _2980 = _558 * _2956;
        if (_818)
        {
            _2960 = _1738;
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
            _2972 = _1738;
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
            _1816 = _2886;
        }
        float _3002 = _1816;
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
            _3056 = _1758;
        }
        float _3064 = _3056;
        float _3066 = _3064;
        if (!_818)
        {
            _3066 = _1760;
        }
        float _3068 = _3066;
        float _3070 = _3054 * 0.15915493667125701904296875;
        float _3072 = _3004 * _3036;
        if (_818)
        {
            _3058 = _1754;
        }
        float _3074 = _3058;
        float _3076 = 1.0 / _3010;
        float _3078 = _3074;
        if (!_818)
        {
            _3078 = _1756;
        }
        float _3080 = _3078;
        float _3082 = _3072 * 0.15915493667125701904296875;
        float _3084 = _3038 * _3036;
        float _3086 = _3038;
        _2734 = as_type<int>(_3080);
        if (_818)
        {
            _3060 = _1754;
        }
        float _3088 = _3060;
        float _3090 = _3088;
        if (!_818)
        {
            _3090 = _1756;
        }
        float _3092 = _3090;
        float _3094 = _3084 * 0.15915493667125701904296875;
        float _3096 = 1.0 / _2970;
        float _3098 = _2604 * _3052;
        float _3100 = _3096;
        if (_818)
        {
            _3086 = _1758;
        }
        float _3102 = _3086;
        float _3104 = _3102;
        if (!_818)
        {
            _3104 = _1760;
        }
        float _3106 = _3104;
        float _3108 = _3098 * 6.283184051513671875;
        float _3110 = 1.0 / _2980;
        float _3112 = _3076 * _2896;
        float _3114 = _3076;
        float _3116 = _3108;
        if (_818)
        {
            _3114 = _1754;
        }
        float _3118 = _3114;
        float _3120 = _3118;
        if (!_818)
        {
            _3120 = _1756;
        }
        float _3122 = _3120;
        if (!_818)
        {
            _1818 = _1756;
        }
        float _3124 = _1818;
        float _3126 = _3108 * 0.15915493667125701904296875;
        float _3128 = 1.0 / _3006;
        if (_818)
        {
            _3116 = _1746;
        }
        float _3130 = _3116;
        float _3132 = _3130;
        if (!_818)
        {
            _3132 = _1748;
        }
        float _3134 = _3132;
        float _3136 = _3048 * 6.283185482025146484375;
        float _3138 = sin(_3136);
        float _3140 = _2604 * _3110;
        float _3142 = _3018 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        float _3146 = _3014 * _2896;
        float _3148 = _3112 * 0.15915493667125701904296875;
        float _3150 = _2604 * _3096;
        float _3152 = _2604 * _3128;
        float _3154 = _3146 * 0.15915493667125701904296875;
        float _3156 = _3154;
        if (_818)
        {
            _3100 = _1746;
        }
        float _3158 = _3100;
        float _3160 = _3150 * 6.283184051513671875;
        float _3162 = _3042 * 6.283185482025146484375;
        float _3164 = sin(_3162);
        float _3166 = _3158;
        if (!_818)
        {
            _3166 = _1748;
        }
        float _3168 = _3166;
        float _3170 = _3160 * 0.15915493667125701904296875;
        float _3172 = _3140 * 6.283184051513671875;
        float _3174 = _3172;
        if (_818)
        {
            _2628 = _1750;
        }
        float _3176 = _2628;
        float _3178 = _3176;
        if (!_818)
        {
            _3178 = _1752;
        }
        float _3180 = _3178;
        float _3182 = _3126 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        float _3186 = _3172 * 0.15915493667125701904296875;
        if (_818)
        {
            _3174 = _1750;
        }
        float _3188 = _3174;
        float _3190 = _3144 * _3168;
        float _3192 = _3188;
        _2796 = _3190;
        if (!_818)
        {
            _3192 = _1752;
        }
        float _3194 = _3192;
        float _3196 = _3032 * 6.283185482025146484375;
        float _3198 = sin(_3196);
        float _3200 = _3022 * 6.283185482025146484375;
        float _3202 = sin(_3200);
        if (_818)
        {
            _3062 = _1758;
        }
        float _3204 = _3062;
        float _3206 = _3184 * _3134;
        float _3208 = _3204;
        if (!_818)
        {
            _3208 = _1760;
        }
        float _3210 = _3208;
        if (!_818)
        {
            _1820 = _1760;
        }
        float _3212 = _1820;
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
            _3156 = _1746;
        }
        float _3238 = _3156;
        float _3240 = fma(_3228, _3180, _3206);
        float _3242 = _3238;
        _2850 = _3228;
        if (!_818)
        {
            _3242 = _1748;
        }
        float _3244 = _3242;
        _2852 = _3244;
        if (!_818)
        {
            _1822 = _1748;
        }
        float _3246 = _1822;
        if (_818)
        {
            _1824 = _1750;
        }
        float _3248 = _1824;
        float _3250 = _3186 * 6.283185482025146484375;
        float _3252 = sin(_3250);
        float _3254 = _3248;
        if (!_818)
        {
            _3254 = _1752;
        }
        float _3256 = _3254;
        float _3258 = _3138 * _3244;
        if (!_818)
        {
            _1826 = _1752;
        }
        float _3260 = _1826;
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
    int _3320 = _2734;
    float _3322 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _3324 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _3326 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _3328 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _3330 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _3332 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _3334 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _3336 = uint(int(uint(_232) >> uint(2)));
    float _3338 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_3336)]);
    float _3340 = fma(_568, _1766, _820);
    float _3342 = fma(_570, _2602, _822);
    float _3344 = fma(_572, _3312, _824);
    bool _3346 = _3322 > 0.0;
    bool _3348 = _3324 > 0.0;
    float _3350 = _3326 * _3324;
    float _3352 = _166 * _3328;
    float _3354 = _3314;
    float _3356 = _3326;
    bool _3358 = _3348;
    float _3360 = _3350;
    float _3362 = _3316;
    float _3364 = _3352;
    float _3366 = _3330;
    float _3368 = _3334;
    float _3370 = _3318;
    if (_3346)
    {
        float _3372 = 1.0 / _3322;
        _3354 = _3372;
    }
    float _3374 = _3354;
    float _3376 = _166 * _3332;
    float _3378 = _3376;
    if (_3348)
    {
        float _3380 = -_3350;
        float _3382 = fma(_284, _3380, _3326);
        _3356 = _3382;
    }
    float _3384 = _3356;
    float _3386 = _166 * _3330;
    float _3388 = _3374;
    float _3390 = _3384;
    if (_3346)
    {
        float _3392 = _610 * _3374;
        _3388 = _3392;
    }
    float _3394 = _3388;
    float _3396 = _3394;
    if (_3346)
    {
        float _3398 = precise::min(_3394, 1.0);
        _3396 = _3398;
    }
    float _3400 = _3396;
    float _3402 = _3400;
    if (_3346)
    {
        float _3404 = _3400 * _3384;
        _3390 = _3404;
    }
    float _3406 = _3390;
    float _3408 = _3386 * _3406;
    float _3410 = _3352 * _3406;
    float _3412 = _3376 * _3406;
    bool _3414 = !_174;
    float _3416 = _3406;
    float _3418 = _3410;
    float _3420 = _3412;
    float _3542;
    if (!_3414)
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
        float _3514 = _3410 * _3494;
        float _3516 = _3408 * _3508;
        float _3518 = _3408 * _3510;
        float _3520 = _3502 * _3494;
        float _3522 = _3408 * _3512;
        float _3524 = _3506 * _3494;
        float _3526 = _3498 * _3494;
        float _3528 = fma(_3452, _3514, _3516);
        float _3530 = fma(_3410, _3520, _3518);
        float _3532 = _3468 * _3494;
        float _3534 = fma(_3456, _3514, _3522);
        float _3536 = fma(_3412, _3524, _3528);
        float _3538 = fma(_3412, _3526, _3530);
        float _3540 = fma(_3412, _3532, _3534);
        _750 = _3530;
        _752 = _3524;
        _754 = _3516;
        _3416 = _3528;
        _3360 = _3434;
        _2630 = _3436;
        _3402 = _3438;
        _3362 = _3526;
        _3364 = _3518;
        _3366 = _3430;
        _3378 = _3432;
        _3368 = _3510;
        _3542 = _3538;
        _3418 = _3536;
        _3420 = _3540;
        _3370 = _3506;
        _3544 = true;
    }
    else
    {
        int _3546 = as_type<int>(_168) & 1024;
        bool _3548 = _3546 != 0;
        if (_3548)
        {
            _3358 = true;
        }
        bool _3550 = _3358;
        bool _3552 = _3550;
        if (!_3548)
        {
            int _3554 = as_type<int>(_168) & 2048;
            bool _3556 = _3554 != 0;
            _3552 = _3556;
        }
        bool _3558 = _3552;
        if (!_3558)
        {
            _328 = _3408;
        }
        float _3560 = _328;
        bool _3562 = !_3558;
        _3542 = _3560;
        if (!_3562)
        {
            uint _3564 = uint(int(uint(_230) >> uint(2)));
            float _3566 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3564)]);
            int _3568 = _230 + 4;
            uint _3570 = uint(int(uint(_3568) >> uint(2)));
            float _3572 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3570)]);
            int _3574 = _230 + 8;
            uint _3576 = uint(int(uint(_3574) >> uint(2)));
            float _3578 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3576)]);
            uint _3580 = uint(int(uint(_230) >> uint(2)));
            float _3582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3580)]);
            int _3584 = _230 + 4;
            uint _3586 = uint(int(uint(_3584) >> uint(2)));
            float _3588 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3586)]);
            int _3590 = _230 + 8;
            uint _3592 = uint(int(uint(_3590) >> uint(2)));
            float _3594 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3592)]);
            uint _3596 = uint(int(uint(_230) >> uint(2)));
            float _3598 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3596)]);
            int _3600 = _230 + 4;
            uint _3602 = uint(int(uint(_3600) >> uint(2)));
            float _3604 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3602)]);
            int _3606 = _230 + 8;
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
            float _3686 = _3410 * _3666;
            float _3688 = _3408 * _3680;
            float _3690 = _3408 * _3682;
            float _3692 = _3674 * _3666;
            float _3694 = _3408 * _3684;
            float _3696 = _3678 * _3666;
            float _3698 = _3670 * _3666;
            float _3700 = fma(_3624, _3686, _3688);
            float _3702 = fma(_3410, _3692, _3690);
            float _3704 = _3640 * _3666;
            float _3706 = fma(_3628, _3686, _3694);
            float _3708 = fma(_3412, _3696, _3700);
            float _3710 = fma(_3412, _3698, _3702);
            float _3712 = fma(_3412, _3704, _3706);
            _750 = _3702;
            _752 = _3696;
            _754 = _3688;
            _3416 = _3700;
            _3360 = _3598;
            _2630 = _3604;
            _3402 = _3610;
            _3362 = _3698;
            _3364 = _3690;
            _3366 = _3588;
            _3378 = _3594;
            _3368 = _3682;
            _3542 = _3710;
            _3418 = _3708;
            _3420 = _3712;
            _3370 = _3678;
        }
    }
    _3544 = false;
    float _3714 = _750;
    float _3716 = _752;
    float _3718 = _754;
    float _3720 = _3416;
    float _3722 = _3360;
    float _3724 = _2630;
    float _3726 = _3402;
    float _3728 = _3362;
    float _3730 = _3364;
    float _3732 = _3366;
    float _3734 = _3378;
    float _3736 = _3368;
    float _3738 = _3542;
    float _3740 = _3418;
    float _3742 = _3420;
    float _3744 = _3370;
    uint _3746 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3746)] = as_type<uint>(_3338);
    float _3748 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _3750 = as_type<int>(_3748) & 512;
    bool _3752 = _3750 != 0;
    int _3754 = as_type<int>(_3748) & 1024;
    bool _3756 = _3754 != 0;
    float _3758 = _3714;
    float _3760 = _3716;
    float _3762 = _3718;
    float _3764 = _3720;
    float _3766 = _3740;
    float _3768 = _3738;
    float _3770 = _3744;
    if (_3752)
    {
        float _3772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3778 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3758 = _3772;
        _3760 = _3774;
        _3762 = _3776;
        _3764 = _3778;
    }
    float _3780 = _3758;
    float _3782 = _3760;
    float _3784 = _3762;
    float _3786 = _3764;
    float _3788 = _3722;
    float _3790 = _3724;
    float _3792 = _3726;
    float _3794 = _3728;
    if (_3752)
    {
        float _3796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3788 = _3796;
        _3790 = _3798;
        _3792 = _3800;
        _3794 = _3802;
    }
    float _3804 = _3788;
    float _3806 = _3790;
    float _3808 = _3792;
    float _3810 = _3794;
    float _3812 = _3730;
    float _3814 = _3732;
    float _3816 = _3734;
    float _3818 = _3736;
    if (_3752)
    {
        float _3820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3812 = _3820;
        _3814 = _3822;
        _3816 = _3824;
        _3818 = _3826;
    }
    float _3828 = _3812;
    float _3830 = _3814;
    float _3832 = _3816;
    float _3834 = _3818;
    float _3836 = _3342 + _3738;
    float _3838 = _3340 + _3740;
    float _3840 = _3344 + _3742;
    if (!_3752)
    {
        _3766 = 0.0;
    }
    float _3842 = _3766;
    float _3844 = _3842;
    if (!_3752)
    {
        _3768 = 0.0;
    }
    float _3846 = _3768;
    int _3848 = as_type<int>(_3748) & 2048;
    bool _3850 = _3848 != 0;
    float _3852 = _3780;
    float _3854 = _3846;
    if (_3752)
    {
        float _3856 = _3836 * _3782;
        _3770 = _3856;
    }
    float _3858 = _3770;
    float _3860 = _3806;
    float _3862 = _3858;
    float _3864 = _3830;
    float _3866 = _3828;
    float _3868 = _3808;
    if (_3752)
    {
        float _3870 = _3836 * _3806;
        _3860 = _3870;
    }
    float _3872 = _3860;
    float _3874 = _3872;
    if (_3752)
    {
        float _3876 = fma(_3838, _3780, _3858);
        _3852 = _3876;
    }
    float _3878 = _3852;
    float _3880 = _3878;
    if (!_3752)
    {
        _3862 = 0.0;
    }
    float _3882 = _3862;
    float _3884 = _3882;
    if (_3752)
    {
        float _3886 = _3836 * _3830;
        _3864 = _3886;
    }
    float _3888 = _3864;
    if (_3752)
    {
        float _3890 = fma(_3838, _3804, _3872);
        _3874 = _3890;
    }
    float _3892 = _3874;
    if (_3752)
    {
        float _3894 = fma(_3840, _3784, _3878);
        _3880 = _3894;
    }
    float _3896 = _3880;
    if (_3752)
    {
        float _3898 = fma(_3838, _3828, _3888);
        _3866 = _3898;
    }
    float _3900 = _3866;
    float _3902 = _3900;
    if (_3752)
    {
        float _3904 = fma(_3840, _3808, _3892);
        _3868 = _3904;
    }
    float _3906 = _3868;
    if (_3752)
    {
        float _3908 = _3786 + _3896;
        _3844 = _3908;
    }
    float _3910 = _3844;
    float _3912 = _3910;
    if (_3752)
    {
        float _3914 = fma(_3840, _3832, _3900);
        _3902 = _3914;
    }
    float _3916 = _3902;
    if (_3752)
    {
        float _3918 = _3810 + _3906;
        _3884 = _3918;
    }
    float _3920 = _3884;
    float _3922 = _3920;
    if (_3752)
    {
        float _3924 = _3834 + _3916;
        _3854 = _3924;
    }
    float _3926 = _3854;
    bool _3928 = !_3756;
    float _3930 = _3926;
    if (!_3928)
    {
        float _3932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _3934 = uint(int(uint(_230) >> uint(2)));
        float _3936 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3934)]);
        int _3938 = _230 + 4;
        uint _3940 = uint(int(uint(_3938) >> uint(2)));
        float _3942 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3940)]);
        int _3944 = _230 + 8;
        uint _3946 = uint(int(uint(_3944) >> uint(2)));
        float _3948 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3946)]);
        uint _3950 = uint(int(uint(_230) >> uint(2)));
        float _3952 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3950)]);
        int _3954 = _230 + 4;
        uint _3956 = uint(int(uint(_3954) >> uint(2)));
        float _3958 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3956)]);
        int _3960 = _230 + 8;
        uint _3962 = uint(int(uint(_3960) >> uint(2)));
        float _3964 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3962)]);
        uint _3966 = uint(int(uint(_230) >> uint(2)));
        float _3968 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3966)]);
        int _3970 = _230 + 4;
        uint _3972 = uint(int(uint(_3970) >> uint(2)));
        float _3974 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3972)]);
        int _3976 = _230 + 8;
        uint _3978 = uint(int(uint(_3976) >> uint(2)));
        float _3980 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3978)]);
        float _3982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _3984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _3986 = _3836 * _3942;
        float _3988 = _3836 * _3958;
        float _3990 = _3836 * _3974;
        float _3992 = fma(_3838, _3936, _3986);
        float _3994 = fma(_3838, _3952, _3988);
        float _3996 = fma(_3838, _3968, _3990);
        float _3998 = fma(_3840, _3948, _3992);
        float _4000 = fma(_3840, _3964, _3994);
        float _4002 = fma(_3840, _3980, _3996);
        float _4004 = _3932 + _3998;
        float _4006 = _3982 + _4000;
        float _4008 = _3984 + _4002;
        _3922 = _4006;
        _3912 = _4004;
        _3930 = _4008;
    }
    float _4010 = _3922;
    float _4012 = _3912;
    float _4014 = _3930;
    bool _4016 = !_3850;
    float _4018 = _4010;
    float _4020 = _4012;
    float _4022 = _4014;
    if (!_4016)
    {
        uint _4024 = uint(int(uint(_230) >> uint(2)));
        float _4026 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4024)]);
        int _4028 = _230 + 4;
        uint _4030 = uint(int(uint(_4028) >> uint(2)));
        float _4032 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4030)]);
        int _4034 = _230 + 8;
        uint _4036 = uint(int(uint(_4034) >> uint(2)));
        float _4038 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4036)]);
        int _4040 = _230 + 12;
        uint _4042 = uint(int(uint(_4040) >> uint(2)));
        float _4044 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4042)]);
        uint _4046 = uint(int(uint(_230) >> uint(2)));
        float _4048 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4046)]);
        int _4050 = _230 + 4;
        uint _4052 = uint(int(uint(_4050) >> uint(2)));
        float _4054 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4052)]);
        int _4056 = _230 + 8;
        uint _4058 = uint(int(uint(_4056) >> uint(2)));
        float _4060 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4058)]);
        int _4062 = _230 + 12;
        uint _4064 = uint(int(uint(_4062) >> uint(2)));
        float _4066 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_4064)]);
        uint _4068 = uint(int(uint(_230) >> uint(2)));
        float _4070 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4068)]);
        int _4072 = _230 + 4;
        uint _4074 = uint(int(uint(_4072) >> uint(2)));
        float _4076 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4074)]);
        int _4078 = _230 + 8;
        uint _4080 = uint(int(uint(_4078) >> uint(2)));
        float _4082 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4080)]);
        int _4084 = _230 + 12;
        uint _4086 = uint(int(uint(_4084) >> uint(2)));
        float _4088 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4086)]);
        float _4090 = _3836 * _4032;
        float _4092 = _3836 * _4054;
        float _4094 = _3836 * _4076;
        float _4096 = fma(_3838, _4026, _4090);
        float _4098 = fma(_3838, _4048, _4092);
        float _4100 = fma(_3838, _4070, _4094);
        float _4102 = fma(_3840, _4038, _4096);
        float _4104 = fma(_3840, _4060, _4098);
        float _4106 = fma(_3840, _4082, _4100);
        float _4108 = _4102 + _4044;
        float _4110 = _4104 + _4066;
        float _4112 = _4106 + _4088;
        _4018 = _4110;
        _4020 = _4108;
        _4022 = _4112;
    }
    float _4114 = _4018;
    float _4116 = _4020;
    float _4118 = _4022;
    float _4120 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _4122 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _4124 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _4126 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _4128 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _4130 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _4132 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _4134 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _4136 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _4138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _4140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _4142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _4144 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _4146 = _4120 + 1.0;
    float _4148 = _4146 + _4114;
    float _4150 = _4148 * _4132;
    float _4152 = fma(_4130, _4116, _4150);
    float _4154 = fma(_4134, _4118, _4152);
    float _4156 = _4136 + _4154;
    float _4158 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _4160 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _4162 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _4164 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _4166 = trunc(_4156);
    int _4168 = int(_4166);
    int _4170 = ~as_type<int>(_4138);
    int _4172 = _4168 + _4170;
    int _4174 = _4172 + 1;
    bool _4176 = _4174 >= 0;
    int _4178 = _3320;
    float _4180 = 6.2500002968590706586837768554688e-05;
    if (_4176)
    {
        float _4182 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4178 = as_type<int>(_4182);
    }
    int _4184 = _4178;
    float _4186 = fma(_4116, 6.2500002968590706586837768554688e-05, 0.5);
    float _4188 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11092 = float2(_4186, _4188);
    float _4190 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11092, float2(0.0), isnan(_11092)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11092, float2(0.0), isnan(_11092)), level(0.0)).x;
    float _4192 = _4124 * _4114;
    float _4194 = fma(_4122, _4116, _4192);
    float _4196 = fma(_4126, _4118, _4194);
    float _4198 = _4128 + _4196;
    float _4200 = -_4198;
    bool _4202 = _4140 >= _4200;
    bool _4204 = isnan(_4140);
    bool _4206 = _4202 || _4204;
    bool _4208 = isnan(_4200);
    bool _4210 = _4206 || _4208;
    float _4212 = -_4198;
    bool _4214 = _4142 >= _4212;
    bool _4216 = isnan(_4142);
    bool _4218 = _4214 || _4216;
    bool _4220 = isnan(_4212);
    bool _4222 = _4218 || _4220;
    int _4224 = _4210 ? 0 : 1;
    int _4226 = 2;
    float _4228 = _4186;
    float _4230 = _4188;
    if (_4210)
    {
        _4226 = 1;
    }
    int _4232 = _4226;
    int _4234 = _4232;
    if (_4222)
    {
        _4234 = _4224;
    }
    int _4236 = _4234;
    int _4238 = _4236 << 6;
    int _4240 = _4238 + 96;
    uint _4242 = uint(int(uint(_4240) >> uint(2)));
    float _4244 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4242)]);
    int _4246 = _4240 + 4;
    uint _4248 = uint(int(uint(_4246) >> uint(2)));
    float _4250 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4248)]);
    int _4252 = _4240 + 8;
    uint _4254 = uint(int(uint(_4252) >> uint(2)));
    float _4256 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4254)]);
    int _4258 = _4240 + 12;
    uint _4260 = uint(int(uint(_4258) >> uint(2)));
    float _4262 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4260)]);
    int _4264 = _4238 + 48;
    uint _4266 = uint(int(uint(_4264) >> uint(2)));
    float _4268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4266)]);
    int _4270 = _4264 + 4;
    uint _4272 = uint(int(uint(_4270) >> uint(2)));
    float _4274 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4272)]);
    int _4276 = _4264 + 8;
    uint _4278 = uint(int(uint(_4276) >> uint(2)));
    float _4280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4278)]);
    int _4282 = _4264 + 12;
    uint _4284 = uint(int(uint(_4282) >> uint(2)));
    float _4286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4284)]);
    float _4288 = _4148 * _4160;
    float _4290 = fma(_4158, _4116, _4288);
    float _4292 = fma(_4162, _4118, _4290);
    float _4294 = _4164 + _4292;
    int _4296 = _4238 + 64;
    float _4298 = trunc(_4294);
    int _4300 = int(_4298);
    uint _4302 = uint(int(uint(_4296) >> uint(2)));
    float _4304 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4302)]);
    int _4306 = _4296 + 4;
    uint _4308 = uint(int(uint(_4306) >> uint(2)));
    float _4310 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4308)]);
    int _4312 = _4296 + 8;
    uint _4314 = uint(int(uint(_4312) >> uint(2)));
    float _4316 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4314)]);
    int _4318 = _4296 + 12;
    uint _4320 = uint(int(uint(_4318) >> uint(2)));
    float _4322 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4320)]);
    int _4324 = _4238 + 80;
    bool _4326 = _4184 <= _4174;
    bool _4328 = !_4176;
    bool _4330 = _4326 || _4328;
    int _4332 = ~as_type<int>(_4144);
    int _4334 = _4300 + _4332;
    int _4336 = _4334 + 1;
    uint _4338 = uint(int(uint(_4324) >> uint(2)));
    float _4340 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4338)]);
    int _4342 = _4324 + 4;
    uint _4344 = uint(int(uint(_4342) >> uint(2)));
    float _4346 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4344)]);
    int _4348 = _4324 + 8;
    uint _4350 = uint(int(uint(_4348) >> uint(2)));
    float _4352 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4350)]);
    int _4354 = _4324 + 12;
    uint _4356 = uint(int(uint(_4354) >> uint(2)));
    float _4358 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4356)]);
    bool _4360 = _4336 < 0;
    bool _4362 = _4360 || _4330;
    int _4364 = as_type<int>(_4144);
    if (!_4362)
    {
        float _4366 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _4364 = as_type<int>(_4366);
    }
    int _4368 = _4364;
    float _4370 = _4148 * _4250;
    float _4372 = fma(_4244, _4116, _4370);
    float _4374 = fma(_4256, _4118, _4372);
    float _4376 = _4262 + _4374;
    float _4378 = _4148 * _4274;
    float _4380 = 1.0 / _4376;
    float _4382 = fma(_4268, _4116, _4378);
    float _4384 = fma(_4280, _4118, _4382);
    float _4386 = _4148 * _4310;
    float _4388 = fma(_4304, _4116, _4386);
    float _4390 = _4286 + _4384;
    float _4392 = fma(_4316, _4118, _4388);
    float _4394 = _4390 * _4380;
    float _4396 = _4322 + _4392;
    bool _4398 = _4394 >= 0.0;
    float _4400 = _4396 * _4380;
    bool _4402 = _4394 <= 1.0;
    bool _4404 = _4402 && _4398;
    bool _4406 = _4400 >= 0.0;
    bool _4408 = _4406 && _4404;
    bool _4410 = _4400 <= 1.0;
    bool _4412 = _4410 && _4408;
    float _4414 = _4148 * _4346;
    bool _4416 = _4368 <= _4336;
    bool _4418 = _4416 || _4362;
    float _4420 = fma(_4340, _4116, _4414);
    float _4422 = fma(_4352, _4118, _4420);
    float _4424 = _4304;
    float _4426 = _4420;
    float _4428 = _4422;
    float _4430 = _4244;
    if (_4412)
    {
        float _4432 = float(_4236);
        _4424 = _4432;
    }
    float _4434 = _4424;
    float _4436 = _4358 + _4422;
    if (_4418)
    {
        _4426 = 1.0;
    }
    float _4438 = _4426;
    float _4440 = _4438;
    float _4442 = _4190;
    if (!_4418)
    {
        float _4444 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _4446 = _4336 * as_type<int>(_4444);
        int _4448 = _4446 + _4174;
        int _4450 = _4448 << 2;
        uint _4452 = uint(int(uint(_4448) >> uint(2)));
        int _4454 = 12 & _4450;
        int _4456 = int(_4452) << 4;
        int _4458 = _4456 + _4454;
        int _4460 = _4458 + 400;
        uint _4462 = uint(int(uint(_4460) >> uint(2)));
        float _4464 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4462)]);
        float _4466 = floor(_4294);
        float _4468 = floor(_4156);
        float _4470 = -_4466;
        float _4472 = _4294 + _4470;
        float _4474 = -_4468;
        float _4476 = _4156 + _4474;
        float _4478 = rint(_4464);
        float _4480 = precise::max(_4478, 0.0);
        uint _4482 = uint(_4480);
        uint _4484 = clamp(_4482, 0u, 65535u);
        float3 _11545 = float3(_4476, _4472, float(int(_4484)));
        float3 _11549 = select(_11545, float3(0.0), isnan(_11545));
        float _4486 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _11549.xy, uint(rint(_11549.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _11549.xy, uint(rint(_11549.z)), level(0.0)).x;
        int _4488 = _4448 << 4;
        int _4490 = _4488 + 2048;
        uint _4492 = uint(int(uint(_4490) >> uint(2)));
        float _4494 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4492)]);
        int _4496 = _4490 + 4;
        uint _4498 = uint(int(uint(_4496) >> uint(2)));
        float _4500 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4498)]);
        int _4502 = _4490 + 8;
        uint _4504 = uint(int(uint(_4502) >> uint(2)));
        float _4506 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4504)]);
        int _4508 = _4490 + 12;
        uint _4510 = uint(int(uint(_4508) >> uint(2)));
        float _4512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_4510)]);
        float _4514 = _4148 * _4500;
        float _4516 = fma(_4494, _4116, _4514);
        float _4518 = fma(_4506, _4118, _4516);
        float _4520 = _4512 + _4518;
        float _4522 = precise::clamp(_4520, 0.0, 1.0);
        float _4524 = -_4522;
        float _4526 = _4524 + _4486;
        float _4528 = fma(_4526, 500.0, 1.5);
        float _4530 = exp2(_4528);
        float _4532 = 0.0 + _4530;
        float _4534 = precise::clamp(_4532, 0.0, 1.0);
        _4428 = _4530;
        _4440 = _4534;
    }
    float _4536 = _4428;
    float _4538 = _4440;
    float _4540 = _4434;
    float _4542 = _4536;
    if (_4412)
    {
        float _4544 = rint(_4434);
        float _4546 = precise::max(_4544, 0.0);
        uint _4548 = uint(_4546);
        uint _4550 = clamp(_4548, 0u, 65535u);
        _4540 = as_type<float>(_4550);
    }
    float _4552 = _4540;
    float _4554 = _4436 * _4380;
    bool _4556 = _4190 != 0.0;
    bool _4558 = isnan(_4190);
    bool _4560 = _4556 || _4558;
    bool _4562 = isnan(0.0);
    bool _4564 = _4560 || _4562;
    uint _4566 = uint(int(uint(_230) >> uint(2)));
    float _4568 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_4566)]);
    float _4570 = fma(_4116, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _4572 = fma(_4116, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _4574 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
    float _4576 = fma(_4118, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
    float _4578 = _4552;
    float _4580 = _4570;
    if (_4412)
    {
        float3 _11687 = float3(_4394, _4400, float(as_type<int>(_4552)));
        float3 _11689 = select(_11687, float3(0.0), isnan(_11687));
        float _4582 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _11689.xy, uint(rint(_11689.z)), _4554, level(0.0));
        _4578 = _4582;
    }
    float _4584 = _4578;
    if (_4564)
    {
        _4180 = _4190;
    }
    float _4586 = _4180;
    if (!_4564)
    {
        _4442 = 4.0;
    }
    float _4588 = _4442;
    float _4590 = _4586;
    if (!_4564)
    {
        float2 _11712 = float2(_4186, _4188);
        float _4592 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11712, float2(0.0), isnan(_11712)), level(_4588)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11712, float2(0.0), isnan(_11712)), level(_4588)).x;
        _4590 = _4592;
    }
    float _4594 = _4590;
    float2 _11724 = float2(_4570, _4188);
    float _4596 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11724, float2(0.0), isnan(_11724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11724, float2(0.0), isnan(_11724)), level(0.0)).x;
    float2 _11732 = float2(_4186, _4574);
    float _4598 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11732, float2(0.0), isnan(_11732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11732, float2(0.0), isnan(_11732)), level(0.0)).x;
    float2 _11740 = float2(_4572, _4188);
    float _4600 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11740, float2(0.0), isnan(_11740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11740, float2(0.0), isnan(_11740)), level(0.0)).x;
    float2 _11748 = float2(_4186, _4576);
    float _4602 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11748, float2(0.0), isnan(_11748)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11748, float2(0.0), isnan(_11748)), level(0.0)).x;
    if (!_4412)
    {
        _4542 = 1.0;
    }
    float _4604 = _4542;
    bool _4606 = _610 > 0.001000000047497451305389404296875;
    bool _4608 = isnan(_610);
    bool _4610 = _4606 || _4608;
    bool _4612 = isnan(0.001000000047497451305389404296875);
    bool _4614 = _4610 || _4612;
    float _4616 = _4604;
    float _4618 = _4602;
    float _4620 = _4568;
    if (_4412)
    {
        bool _4622 = _4584 >= _4554;
        bool _4624 = isnan(_4584);
        bool _4626 = _4622 || _4624;
        bool _4628 = isnan(_4554);
        bool _4630 = _4626 || _4628;
        float _4632 = float(_4630);
        _4616 = _4632;
    }
    float _4634 = _4616;
    float _4636 = -_4634;
    float _4638 = fma(_4636, _4538, 1.0);
    float _4640 = -_4568;
    float _4642 = _4638 + _4640;
    float _4644 = _4638;
    if (_4614)
    {
        float _4646 = fma(_4642, 0.0500000007450580596923828125, _4568);
        _4644 = _4646;
    }
    float _4648 = _4644;
    float _4650 = precise::max(0.0, _4648);
    float _4652 = precise::min(_4650, 0.999000012874603271484375);
    uint _4654 = uint(int(uint(_230) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_4654)] = as_type<uint>(_4652);
    int _4656 = as_type<int>(_4642);
    if (!_4614)
    {
        float _4658 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _4656 = as_type<int>(_4658);
    }
    int _4660 = _4656;
    float _4662 = _4594 * 2000.0;
    bool _4664 = _4662 == 0.0;
    bool _4666 = !_4614;
    bool _4668 = _4664 && _4666;
    bool _4670 = !_4668;
    int _4672 = _4670 ? as_type<int>(_3338) : 0;
    float _4674 = -_236;
    float _4676 = _4674 + _3838;
    float _4678 = -_242;
    float _4680 = _4678 + _3836;
    float _4682 = -_248;
    float _4684 = _4682 + _3840;
    float _4686 = _4662;
    if (_4614)
    {
        _330 = _4672;
    }
    int _4688 = _330;
    int _4690 = _4660;
    int _4692 = _4688;
    if (!_4614)
    {
        float _4694 = _4662 + as_type<float>(_4660);
        _4690 = as_type<int>(_4694);
    }
    int _4696 = _4690;
    if (!_4614)
    {
        int _4698 = _230 + 4;
        _4686 = as_type<float>(_4698);
    }
    float _4700 = _4686;
    float _4702 = _4700;
    if (!_4614)
    {
        uint _4704 = uint(int(uint(as_type<int>(_4700)) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_4704)] = uint(_4696);
    }
    if (!_4614)
    {
        float2 _11918 = float2(_4570, _4574);
        float _4706 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11918, float2(0.0), isnan(_11918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11918, float2(0.0), isnan(_11918)), level(0.0)).x;
        float2 _11926 = float2(_4570, _4576);
        float _4708 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11926, float2(0.0), isnan(_11926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11926, float2(0.0), isnan(_11926)), level(0.0)).x;
        float2 _11934 = float2(_4572, _4574);
        float _4710 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11934, float2(0.0), isnan(_11934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11934, float2(0.0), isnan(_11934)), level(0.0)).x;
        float2 _11942 = float2(_4572, _4576);
        float _4712 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11942, float2(0.0), isnan(_11942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11942, float2(0.0), isnan(_11942)), level(0.0)).x;
        bool _4714 = _4596 != 0.0;
        bool _4716 = isnan(_4596);
        bool _4718 = _4714 || _4716;
        bool _4720 = isnan(0.0);
        bool _4722 = _4718 || _4720;
        float _4724 = _4188;
        if (!_4722)
        {
            _4702 = 4.0;
        }
        float _4726 = _4702;
        float _4728 = _4596;
        float _4730 = _4726;
        if (!_4722)
        {
            float2 _11972 = float2(_4570, _4188);
            float _4732 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_11972, float2(0.0), isnan(_11972)), level(_4726)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_11972, float2(0.0), isnan(_11972)), level(_4726)).x;
            _4728 = _4732;
        }
        float _4734 = _4728;
        bool _4736 = _4600 != 0.0;
        bool _4738 = isnan(_4600);
        bool _4740 = _4736 || _4738;
        bool _4742 = isnan(0.0);
        bool _4744 = _4740 || _4742;
        bool _4746 = _4602 != 0.0;
        bool _4748 = isnan(_4602);
        bool _4750 = _4746 || _4748;
        bool _4752 = isnan(0.0);
        bool _4754 = _4750 || _4752;
        bool _4756 = _4598 != 0.0;
        bool _4758 = isnan(_4598);
        bool _4760 = _4756 || _4758;
        bool _4762 = isnan(0.0);
        bool _4764 = _4760 || _4762;
        if (!_4744)
        {
            _4228 = 4.0;
        }
        float _4766 = _4228;
        float _4768 = _4600;
        if (!_4744)
        {
            float2 _12026 = float2(_4572, _4188);
            float _4770 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12026, float2(0.0), isnan(_12026)), level(_4766)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12026, float2(0.0), isnan(_12026)), level(_4766)).x;
            _4768 = _4770;
        }
        float _4772 = _4768;
        if (_4754)
        {
            _4730 = _4602;
        }
        float _4774 = _4730;
        if (!_4764)
        {
            _4230 = 4.0;
        }
        float _4776 = _4230;
        if (!_4754)
        {
            _4618 = 4.0;
        }
        float _4778 = _4618;
        bool _4780 = _4706 != 0.0;
        bool _4782 = isnan(_4706);
        bool _4784 = _4780 || _4782;
        bool _4786 = isnan(0.0);
        bool _4788 = _4784 || _4786;
        bool _4790 = _4708 != 0.0;
        bool _4792 = isnan(_4708);
        bool _4794 = _4790 || _4792;
        bool _4796 = isnan(0.0);
        bool _4798 = _4794 || _4796;
        bool _4800 = _4710 != 0.0;
        bool _4802 = isnan(_4710);
        bool _4804 = _4800 || _4802;
        bool _4806 = isnan(0.0);
        bool _4808 = _4804 || _4806;
        bool _4810 = _4712 != 0.0;
        bool _4812 = isnan(_4712);
        bool _4814 = _4810 || _4812;
        bool _4816 = isnan(0.0);
        bool _4818 = _4814 || _4816;
        if (!_4788)
        {
            _4620 = 4.0;
        }
        float _4820 = _4620;
        if (!_4798)
        {
            _4580 = 4.0;
        }
        float _4822 = _4580;
        if (!_4808)
        {
            _4724 = 4.0;
        }
        float _4824 = _4724;
        float _4826 = _4706;
        if (!_4788)
        {
            float2 _12116 = float2(_4570, _4574);
            float _4828 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12116, float2(0.0), isnan(_12116)), level(_4820)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12116, float2(0.0), isnan(_12116)), level(_4820)).x;
            _4826 = _4828;
        }
        float _4830 = _4826;
        float _4832 = _4708;
        if (!_4798)
        {
            float2 _12132 = float2(_4570, _4576);
            float _4834 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12132, float2(0.0), isnan(_12132)), level(_4822)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12132, float2(0.0), isnan(_12132)), level(_4822)).x;
            _4832 = _4834;
        }
        float _4836 = _4832;
        if (!_4818)
        {
            _4430 = 4.0;
        }
        float _4838 = _4430;
        float _4840 = _4710;
        if (!_4808)
        {
            float2 _12153 = float2(_4572, _4574);
            float _4842 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12153, float2(0.0), isnan(_12153)), level(_4824)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12153, float2(0.0), isnan(_12153)), level(_4824)).x;
            _4840 = _4842;
        }
        float _4844 = _4840;
        float _4846 = _4712;
        if (!_4818)
        {
            float2 _12169 = float2(_4572, _4576);
            float _4848 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12169, float2(0.0), isnan(_12169)), level(_4838)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12169, float2(0.0), isnan(_12169)), level(_4838)).x;
            _4846 = _4848;
        }
        float _4850 = _4846;
        float _4852 = _4598;
        if (!_4764)
        {
            float2 _12185 = float2(_4186, _4574);
            float _4854 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12185, float2(0.0), isnan(_12185)), level(_4776)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12185, float2(0.0), isnan(_12185)), level(_4776)).x;
            _4852 = _4854;
        }
        float _4856 = _4852;
        float _4858 = _4774;
        if (!_4754)
        {
            float2 _12201 = float2(_4186, _4576);
            float _4860 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_12201, float2(0.0), isnan(_12201)), level(_4778)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_12201, float2(0.0), isnan(_12201)), level(_4778)).x;
            _4858 = _4860;
        }
        float _4862 = _4858;
        float _4864 = -_4734;
        float _4866 = _4594 + _4864;
        float _4868 = -_4772;
        float _4870 = _4594 + _4868;
        float _4872 = abs(_4866);
        float _4874 = abs(_4870);
        float _4876 = precise::max(_4872, _4874);
        float _4878 = -_4830;
        float _4880 = _4594 + _4878;
        float _4882 = -_4836;
        float _4884 = _4594 + _4882;
        float _4886 = -_4844;
        float _4888 = _4594 + _4886;
        float _4890 = -_4850;
        float _4892 = _4594 + _4890;
        float _4894 = -_4856;
        float _4896 = _4594 + _4894;
        float _4898 = -_4862;
        float _4900 = _4594 + _4898;
        float _4902 = abs(_4880);
        float _4904 = abs(_4884);
        float _4906 = precise::max(_4902, _4904);
        float _4908 = abs(_4888);
        float _4910 = abs(_4892);
        float _4912 = precise::max(_4908, _4910);
        float _4914 = abs(_4896);
        float _4916 = abs(_4900);
        float _4918 = precise::max(_4914, _4916);
        float _4920 = precise::max(_4906, _4912);
        float _4922 = precise::max(_4876, _4918);
        bool _4924 = _4920 > 0.00150000001303851604461669921875;
        bool _4926 = _4922 > 0.00150000001303851604461669921875;
        bool _4928 = _4926 || _4924;
        bool _4930 = !_4928;
        int _4932 = _4930 ? _4672 : 0;
        _4692 = _4932;
    }
    int _4934 = _4692;
    int _4936 = _230 + 4;
    int _4938 = _230 + 8;
    uint _4940 = uint(int(uint(_232) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4940)] = uint(_4934);
    uint _4942 = uint(int(uint(_230) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4942)] = as_type<uint>(_3838);
    uint _4944 = uint(int(uint(_4936) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4944)] = as_type<uint>(_3836);
    uint _4946 = uint(int(uint(_4938) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4946)] = as_type<uint>(_3840);
    uint _4948 = uint(int(uint(_230) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4948)] = as_type<uint>(_804);
    uint _4950 = uint(int(uint(_4936) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4950)] = as_type<uint>(_808);
    uint _4952 = uint(int(uint(_4938) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4952)] = as_type<uint>(_826);
    uint _4954 = uint(int(uint(_230) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4954)] = as_type<uint>(_4676);
    uint _4956 = uint(int(uint(_4936) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4956)] = as_type<uint>(_4680);
    uint _4958 = uint(int(uint(_4938) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_4958)] = as_type<uint>(_4684);
    float _4960 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4962 = _4680 * _4680;
    float _4964 = _808 * _808;
    float _4966 = fma(_4676, _4676, _4962);
    float _4968 = fma(_804, _804, _4964);
    float _4970 = fma(_4684, _4684, _4966);
    float _4972 = fma(_826, _826, _4968);
    float _4974 = sqrt(_4970);
    float _4976 = sqrt(_4972);
    bool _4978 = _4974 >= 9.9999999747524270787835121154785e-07;
    bool _4980 = isnan(_4974);
    bool _4982 = _4978 || _4980;
    bool _4984 = isnan(9.9999999747524270787835121154785e-07);
    bool _4986 = _4982 || _4984;
    if (!_4986)
    {
        bool _4988 = _540 != _304;
        bool _4990 = isnan(_540);
        bool _4992 = _4988 || _4990;
        bool _4994 = isnan(_304);
        bool _4996 = _4992 || _4994;
        _4998 = _4996;
        if (!_4998)
        {
            float _5000 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _5002 = _5000 > 0.0;
            bool _5004 = !_5002;
            if (!_5004)
            {
                float _5006 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _5008 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _5010 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _5012 = _5008 * _524;
                float _5014 = _5008 * _522;
                float _5016 = _5008 * _526;
                float _5018 = fma(_5006, _530, _5012);
                float _5020 = fma(_5006, _528, _5014);
                float _5022 = fma(_5006, _532, _5016);
                float _5024 = fma(_5010, _536, _5018);
                float _5026 = fma(_5010, _534, _5020);
                float _5028 = fma(_5010, _538, _5022);
                float _5030 = _5024 * _5024;
                float _5032 = fma(_5026, _5026, _5030);
                float _5034 = fma(_5028, _5028, _5032);
                float _5036 = rsqrt(_5034);
                float _5038 = _5036 * 9.9999999747524270787835121154785e-07;
                float _5040 = _5026 * _5038;
                float _5042 = _5024 * _5038;
                float _5044 = _5028 * _5038;
                _344 = as_type<int>(_5040);
                _346 = as_type<int>(_5042);
                _348 = as_type<int>(_5044);
                _4998 = true;
            }
            else
            {
                bool _5046 = _4976 >= 9.9999999747524270787835121154785e-07;
                bool _5048 = isnan(_4976);
                bool _5050 = _5046 || _5048;
                bool _5052 = isnan(9.9999999747524270787835121154785e-07);
                bool _5054 = _5050 || _5052;
                if (!_5054)
                {
                    float _5056 = _3836 * _3836;
                    float _5058 = fma(_3838, _3838, _5056);
                    float _5060 = fma(_3840, _3840, _5058);
                    float _5062 = sqrt(_5060);
                    bool _5064 = _5062 >= 9.9999999747524270787835121154785e-07;
                    bool _5066 = isnan(_5062);
                    bool _5068 = _5064 || _5066;
                    bool _5070 = isnan(9.9999999747524270787835121154785e-07);
                    bool _5072 = _5068 || _5070;
                    float _5074 = _5062;
                    if (_5072)
                    {
                        float _5076 = rsqrt(_5060);
                        _5074 = _5076;
                    }
                    float _5078 = _5074;
                    if (!_5072)
                    {
                        _332 = 0;
                    }
                    int _5080 = _332;
                    int _5082 = _5080;
                    if (!_5072)
                    {
                        _334 = 897988541;
                    }
                    int _5084 = _334;
                    int _5086 = _5084;
                    if (!_5072)
                    {
                        _336 = 0;
                    }
                    int _5088 = _336;
                    float _5090 = _5078;
                    int _5092 = _5088;
                    if (_5072)
                    {
                        float _5094 = _5078 * 9.9999999747524270787835121154785e-07;
                        _5090 = _5094;
                    }
                    float _5096 = _5090;
                    if (_5072)
                    {
                        float _5098 = _3838 * _5096;
                        _5082 = as_type<int>(_5098);
                    }
                    int _5100 = _5082;
                    _344 = _5100;
                    if (_5072)
                    {
                        float _5102 = _3836 * _5096;
                        _5086 = as_type<int>(_5102);
                    }
                    int _5104 = _5086;
                    _346 = _5104;
                    if (_5072)
                    {
                        float _5106 = _3840 * _5096;
                        _5092 = as_type<int>(_5106);
                    }
                    int _5108 = _5092;
                    _348 = _5108;
                    _4998 = true;
                }
                else
                {
                    float _5110 = rsqrt(_4972);
                    float _5112 = _5110 * 9.9999999747524270787835121154785e-07;
                    float _5114 = _804 * _5112;
                    float _5116 = _808 * _5112;
                    float _5118 = _826 * _5112;
                    _344 = as_type<int>(_5114);
                    _346 = as_type<int>(_5116);
                    _348 = as_type<int>(_5118);
                    _4998 = true;
                }
            }
        }
    }
    else
    {
        float _5120 = _4976 * _4960;
        bool _5122 = _5120 >= 0.001000000047497451305389404296875;
        bool _5124 = isnan(_5120);
        bool _5126 = _5122 || _5124;
        bool _5128 = isnan(0.001000000047497451305389404296875);
        bool _5130 = _5126 || _5128;
        bool _5132 = _5120 > 0.0;
        bool _5134 = !_5130;
        bool _5136 = _5132 && _5134;
        bool _5138 = _4974 < 0.001000000047497451305389404296875;
        bool _5140 = _5138 && _5136;
        if (!_5140)
        {
            _338 = as_type<int>(_4676);
        }
        int _5142 = _338;
        int _5144 = _5142;
        if (_5140)
        {
            float _5146 = _804 * _4960;
            _5144 = as_type<int>(_5146);
        }
        int _5148 = _5144;
        _344 = _5148;
        if (!_5140)
        {
            _340 = as_type<int>(_4680);
        }
        int _5150 = _340;
        int _5152 = _5150;
        if (_5140)
        {
            float _5154 = _808 * _4960;
            _5152 = as_type<int>(_5154);
        }
        int _5156 = _5152;
        _346 = _5156;
        if (!_5140)
        {
            _342 = as_type<int>(_4684);
        }
        int _5158 = _342;
        _348 = _5158;
        if (_5140)
        {
            float _5160 = _826 * _4960;
            _348 = as_type<int>(_5160);
        }
    }
    _4998 = false;
    int _5162 = _344;
    int _5164 = _346;
    int _5166 = _348;
    uint _5168 = uint(int(uint(_230) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5168)] = uint(_5162);
    uint _5170 = uint(int(uint(_4936) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5170)] = uint(_5164);
    uint _5172 = uint(int(uint(_4938) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_5172)] = uint(_5166);
}

