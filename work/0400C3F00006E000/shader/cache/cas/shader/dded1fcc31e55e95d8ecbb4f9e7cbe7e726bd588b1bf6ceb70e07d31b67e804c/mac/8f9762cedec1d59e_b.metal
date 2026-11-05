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
    bool _3564 = false;
    bool _3400 = false;
    bool _2638 = false;
    bool _818 = false;
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
    uint _210 = uint(int(uint(_170) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_210)]);
    int _214 = _170 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_216)]);
    int _220 = _170 + 8;
    uint _222 = uint(int(uint(_220) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_222)]);
    float _226 = 0.0;
    float _228 = 0.0;
    float _230 = 0.0;
    bool _232 = _190;
    float _234 = _168;
    if (_190)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _226 = _236;
        _228 = _238;
        _230 = _240;
    }
    float _242 = _226;
    float _244 = _228;
    float _246 = _230;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = 0.0;
    if (_190)
    {
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _248 = _254;
        _250 = _256;
        _252 = _258;
    }
    float _260 = _248;
    float _262 = _250;
    float _264 = _252;
    float _266 = 0.0;
    float _268 = 0.0;
    float _270 = 0.0;
    if (_190)
    {
        float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _276 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _266 = _272;
        _268 = _274;
        _270 = _276;
    }
    float _278 = _266;
    float _280 = _268;
    float _282 = _270;
    uint _284 = uint(int(uint(_170) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_284)]);
    uint _288 = uint(int(uint(_192) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_288)]);
    uint _292 = uint(int(uint(_192) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_292)]);
    float _296 = _260;
    float _298 = _262;
    float _300 = _264;
    float _302 = _242;
    float _304 = _244;
    float _306 = _246;
    float _308 = _278;
    float _310 = _280;
    float _312 = _282;
    float _314 = _196;
    float _316 = _202;
    float _318 = _208;
    int _320 = as_type<int>(_212);
    int _322 = as_type<int>(_218);
    int _324 = as_type<int>(_224);
    int _326 = as_type<int>(_212);
    int _328 = as_type<int>(_218);
    int _330 = as_type<int>(_224);
    int _332 = as_type<int>(_212);
    int _334 = as_type<int>(_218);
    int _336 = as_type<int>(_224);
    if (!_190)
    {
        int _338 = _170 + 4;
        uint _340 = uint(int(uint(_170) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        int _344 = _170 + 8;
        uint _346 = uint(int(uint(_170) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_338) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_344) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_338) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_344) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        uint _366 = uint(int(uint(_170) >> uint(2)));
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
        _308 = _450;
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
        _296 = _462;
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
        _298 = _470;
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
        _302 = _478;
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
        _304 = _486;
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
        _310 = _494;
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
        _300 = _502;
        if (!_406)
        {
            _426 = 0.0;
        }
        float _504 = _426;
        _312 = _504;
        if (_406)
        {
            float _506 = _364 * _442;
            _498 = _506;
        }
        float _508 = _498;
        _306 = _508;
        if (_406)
        {
            float _510 = _376 * _442;
            _312 = _510;
        }
    }
    float _512 = _296;
    float _514 = _298;
    float _516 = _300;
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = _310;
    float _528 = _312;
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _532 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _558 = uint(int(uint(_192) >> uint(2)));
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_558)]);
    bool _562 = _532 > 0.0;
    float _564 = abs(_530);
    float _566 = log2(_564);
    bool _568 = _534 > 0.0;
    float _570 = 0.0;
    float _572 = _536;
    float _574 = _532;
    float _576 = _540;
    float _578 = _548;
    float _580 = _550;
    float _582 = _552;
    float _584 = _554;
    float _586 = _556;
    if (_562)
    {
        float _588 = 1.0 / _532;
        _570 = _588;
    }
    float _590 = _570;
    float _592 = _536 * _534;
    float _594 = -_294;
    float _596 = _538 + _594;
    float _598 = _542 * _546;
    if (_568)
    {
        float _600 = -_592;
        float _602 = fma(_286, _600, _536);
        _572 = _602;
    }
    float _604 = _572;
    float _606 = _548 * _566;
    float _608 = _540 * _546;
    float _610 = _544 * _546;
    float _612 = _598 * _512;
    float _614 = _598 * _514;
    float _616 = _604;
    if (_562)
    {
        float _618 = _596 * _590;
        _574 = _618;
    }
    float _620 = _574;
    float _622 = exp2(_606);
    float _624 = _598 * _516;
    float _626 = fma(_608, _518, _612);
    float _628 = fma(_608, _520, _614);
    float _630 = _628;
    if (_562)
    {
        float _632 = precise::min(_620, 1.0);
        _576 = _632;
    }
    float _634 = _576;
    float _636 = fma(_608, _522, _624);
    float _638 = fma(_610, _524, _626);
    float _640 = fma(_610, _526, _628);
    float _642 = _640;
    if (_562)
    {
        float _644 = _634 * _604;
        _616 = _644;
    }
    float _646 = _616;
    float _648 = fma(_610, _528, _636);
    float _650 = _548 * _638;
    float _652 = _548 * _640;
    float _654 = _290 * _548;
    float _656 = _548 * _646;
    float _658 = _548 * _648;
    float _660 = fma(_196, _622, _650);
    float _662 = fma(_202, _622, _652);
    float _664 = fma(_196, _654, _174);
    float _666 = fma(_202, _654, _180);
    float _668 = _550 * _656;
    float _670 = _552 * _656;
    float _672 = fma(_208, _654, _186);
    float _674 = fma(_208, _622, _658);
    float _676 = _554 * _656;
    bool _678 = !_190;
    float _680 = _658;
    float _682 = _668;
    float _684 = _676;
    float _686 = _670;
    float _688 = _662;
    float _690 = _660;
    float _692 = _674;
    float _814;
    float _816;
    if (!_678)
    {
        float _694 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _696 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _698 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _712 = _698 * _700;
        float _714 = _698 * _702;
        float _716 = _696 * _700;
        float _718 = -_712;
        float _720 = fma(_694, _704, _718);
        float _722 = -_714;
        float _724 = fma(_696, _704, _722);
        float _726 = -_716;
        float _728 = fma(_694, _702, _726);
        float _730 = _708 * _694;
        float _732 = _708 * _720;
        float _734 = _710 * _696;
        float _736 = _706 * _702;
        float _738 = -_730;
        float _740 = fma(_706, _696, _738);
        float _742 = -_732;
        float _744 = fma(_706, _724, _742);
        float _746 = _708 * _704;
        float _748 = _710 * _700;
        float _750 = _706 * _698;
        float _752 = fma(_710, _728, _744);
        float _754 = -_746;
        float _756 = fma(_710, _702, _754);
        float _758 = -_748;
        float _760 = fma(_706, _704, _758);
        float _762 = -_736;
        float _764 = fma(_708, _700, _762);
        float _766 = -_750;
        float _768 = fma(_710, _694, _766);
        float _770 = -_694;
        float _772 = fma(_770, _704, _712);
        float _774 = 1.0 / _752;
        float _776 = -_734;
        float _778 = fma(_708, _698, _776);
        float _780 = _756 * _774;
        float _782 = _760 * _774;
        float _784 = _764 * _774;
        float _786 = _668 * _774;
        float _788 = _670 * _780;
        float _790 = _670 * _782;
        float _792 = _772 * _774;
        float _794 = _670 * _784;
        float _796 = _778 * _774;
        float _798 = _768 * _774;
        float _800 = fma(_724, _786, _788);
        float _802 = fma(_668, _792, _790);
        float _804 = _740 * _774;
        float _806 = fma(_728, _786, _794);
        float _808 = fma(_676, _796, _800);
        float _810 = fma(_676, _798, _802);
        float _812 = fma(_676, _804, _806);
        _314 = _798;
        _316 = _802;
        _318 = _800;
        _642 = _806;
        _578 = _706;
        _234 = _708;
        _630 = _710;
        _814 = _774;
        _580 = _786;
        _582 = _702;
        _584 = _704;
        _586 = _712;
        _816 = _810;
        _682 = _808;
        _684 = _812;
        _818 = true;
    }
    else
    {
        int _820 = as_type<int>(_168) & 1024;
        bool _822 = _820 != 0;
        if (_822)
        {
            _232 = true;
        }
        bool _824 = _232;
        bool _826 = _824;
        if (!_822)
        {
            int _828 = as_type<int>(_168) & 2048;
            bool _830 = _828 != 0;
            _826 = _830;
        }
        bool _832 = _826;
        if (!_832)
        {
            _680 = _670;
        }
        float _834 = _680;
        bool _836 = !_832;
        _814 = 0.0;
        _816 = _834;
        if (!_836)
        {
            uint _838 = uint(int(uint(_170) >> uint(2)));
            float _840 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_838)]);
            int _842 = _170 + 4;
            uint _844 = uint(int(uint(_842) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_844)]);
            int _848 = _170 + 8;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            uint _854 = uint(int(uint(_170) >> uint(2)));
            float _856 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_854)]);
            int _858 = _170 + 4;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_860)]);
            int _864 = _170 + 8;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            uint _870 = uint(int(uint(_170) >> uint(2)));
            float _872 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_870)]);
            int _874 = _170 + 4;
            uint _876 = uint(int(uint(_874) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_876)]);
            int _880 = _170 + 8;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_882)]);
            float _886 = _852 * _856;
            float _888 = _852 * _862;
            float _890 = _846 * _856;
            float _892 = -_886;
            float _894 = fma(_840, _868, _892);
            float _896 = -_888;
            float _898 = fma(_846, _868, _896);
            float _900 = -_890;
            float _902 = fma(_840, _862, _900);
            float _904 = _878 * _840;
            float _906 = _878 * _894;
            float _908 = _884 * _846;
            float _910 = _872 * _862;
            float _912 = -_904;
            float _914 = fma(_872, _846, _912);
            float _916 = -_906;
            float _918 = fma(_872, _898, _916);
            float _920 = _878 * _868;
            float _922 = _884 * _856;
            float _924 = _872 * _852;
            float _926 = fma(_884, _902, _918);
            float _928 = -_920;
            float _930 = fma(_884, _862, _928);
            float _932 = -_922;
            float _934 = fma(_872, _868, _932);
            float _936 = -_910;
            float _938 = fma(_878, _856, _936);
            float _940 = -_924;
            float _942 = fma(_884, _840, _940);
            float _944 = -_840;
            float _946 = fma(_944, _868, _886);
            float _948 = 1.0 / _926;
            float _950 = -_908;
            float _952 = fma(_878, _852, _950);
            float _954 = _930 * _948;
            float _956 = _934 * _948;
            float _958 = _938 * _948;
            float _960 = _668 * _948;
            float _962 = _670 * _954;
            float _964 = _670 * _956;
            float _966 = _946 * _948;
            float _968 = _670 * _958;
            float _970 = _952 * _948;
            float _972 = _942 * _948;
            float _974 = fma(_898, _960, _962);
            float _976 = fma(_668, _966, _964);
            float _978 = _914 * _948;
            float _980 = fma(_902, _960, _968);
            float _982 = fma(_676, _970, _974);
            float _984 = fma(_676, _972, _976);
            float _986 = fma(_676, _978, _980);
            _314 = _972;
            _316 = _976;
            _318 = _974;
            _642 = _980;
            _578 = _872;
            _234 = _878;
            _630 = _884;
            _814 = _948;
            _580 = _960;
            _582 = _862;
            _584 = _868;
            _586 = _886;
            _816 = _984;
            _682 = _982;
            _684 = _986;
        }
    }
    _818 = false;
    float _988 = _314;
    float _990 = _316;
    float _992 = _318;
    float _994 = _642;
    float _996 = _578;
    float _998 = _234;
    float _1000 = _630;
    float _1002 = _814;
    float _1004 = _580;
    float _1006 = _582;
    float _1008 = _584;
    float _1010 = _586;
    float _1012 = _816;
    float _1014 = _682;
    float _1016 = _684;
    uint _1018 = uint(int(uint(_192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1018)] = as_type<uint>(_560);
    float _1020 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1022 = as_type<int>(_1020) & 512;
    bool _1024 = _1022 != 0;
    int _1026 = as_type<int>(_1020) & 1024;
    bool _1028 = _1026 != 0;
    float _1030 = _988;
    float _1032 = _990;
    float _1034 = _992;
    float _1036 = _994;
    float _1038 = _1016;
    float _1040 = _1014;
    if (_1024)
    {
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1044 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1046 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1030 = _1042;
        _1032 = _1044;
        _1034 = _1046;
        _1036 = _1048;
    }
    float _1050 = _1030;
    float _1052 = _1032;
    float _1054 = _1034;
    float _1056 = _1036;
    float _1058 = _996;
    float _1060 = _998;
    float _1062 = _1000;
    float _1064 = _1002;
    if (_1024)
    {
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1068 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1070 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1058 = _1066;
        _1060 = _1068;
        _1062 = _1070;
        _1064 = _1072;
    }
    float _1074 = _1058;
    float _1076 = _1060;
    float _1078 = _1062;
    float _1080 = _1064;
    float _1082 = _1004;
    float _1084 = _1006;
    float _1086 = _1008;
    float _1088 = _1010;
    if (_1024)
    {
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1094 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1082 = _1090;
        _1084 = _1092;
        _1086 = _1094;
        _1088 = _1096;
    }
    float _1098 = _1082;
    float _1100 = _1084;
    float _1102 = _1086;
    float _1104 = _1088;
    float _1106 = _666 + _1012;
    float _1108 = _664 + _1014;
    float _1110 = _672 + _1016;
    float _1112 = 0.0;
    float _1114 = _1106;
    if (!_1024)
    {
        _686 = 0.0;
        _1112 = 0.0;
    }
    float _1116 = _686;
    float _1118 = _1112;
    float _1120 = _1116;
    float _1122 = _1118;
    if (!_1024)
    {
        _1038 = 0.0;
    }
    float _1124 = _1038;
    int _1126 = as_type<int>(_1020) & 2048;
    bool _1128 = _1126 != 0;
    float _1130 = _1050;
    float _1132 = _1124;
    if (_1024)
    {
        float _1134 = _1106 * _1052;
        _1040 = _1134;
    }
    float _1136 = _1040;
    float _1138 = _1076;
    float _1140 = _1100;
    float _1142 = _1098;
    float _1144 = _1078;
    if (_1024)
    {
        float _1146 = _1106 * _1076;
        _1138 = _1146;
    }
    float _1148 = _1138;
    float _1150 = _1148;
    if (_1024)
    {
        float _1152 = fma(_1108, _1050, _1136);
        _1130 = _1152;
    }
    float _1154 = _1130;
    float _1156 = _1154;
    if (_1024)
    {
        float _1158 = _1106 * _1100;
        _1140 = _1158;
    }
    float _1160 = _1140;
    if (_1024)
    {
        float _1162 = fma(_1108, _1074, _1148);
        _1150 = _1162;
    }
    float _1164 = _1150;
    if (_1024)
    {
        float _1166 = fma(_1110, _1054, _1154);
        _1156 = _1166;
    }
    float _1168 = _1156;
    if (_1024)
    {
        float _1170 = fma(_1108, _1098, _1160);
        _1142 = _1170;
    }
    float _1172 = _1142;
    float _1174 = _1172;
    if (_1024)
    {
        float _1176 = fma(_1110, _1078, _1164);
        _1144 = _1176;
    }
    float _1178 = _1144;
    if (_1024)
    {
        float _1180 = _1056 + _1168;
        _1132 = _1180;
    }
    float _1182 = _1132;
    float _1184 = _1182;
    if (_1024)
    {
        float _1186 = fma(_1110, _1102, _1172);
        _1174 = _1186;
    }
    float _1188 = _1174;
    if (_1024)
    {
        float _1190 = _1080 + _1178;
        _1120 = _1190;
    }
    float _1192 = _1120;
    float _1194 = _1192;
    if (_1024)
    {
        float _1196 = _1104 + _1188;
        _1122 = _1196;
    }
    float _1198 = _1122;
    bool _1200 = !_1028;
    float _1202 = _1198;
    if (!_1200)
    {
        float _1204 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1206 = uint(int(uint(_170) >> uint(2)));
        float _1208 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1206)]);
        int _1210 = _170 + 4;
        uint _1212 = uint(int(uint(_1210) >> uint(2)));
        float _1214 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1212)]);
        int _1216 = _170 + 8;
        uint _1218 = uint(int(uint(_1216) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1218)]);
        uint _1222 = uint(int(uint(_170) >> uint(2)));
        float _1224 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1222)]);
        int _1226 = _170 + 4;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        float _1230 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1228)]);
        int _1232 = _170 + 8;
        uint _1234 = uint(int(uint(_1232) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1234)]);
        uint _1238 = uint(int(uint(_170) >> uint(2)));
        float _1240 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1238)]);
        int _1242 = _170 + 4;
        uint _1244 = uint(int(uint(_1242) >> uint(2)));
        float _1246 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1244)]);
        int _1248 = _170 + 8;
        uint _1250 = uint(int(uint(_1248) >> uint(2)));
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1250)]);
        float _1254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1258 = _1106 * _1214;
        float _1260 = _1106 * _1230;
        float _1262 = _1106 * _1246;
        float _1264 = fma(_1108, _1208, _1258);
        float _1266 = fma(_1108, _1224, _1260);
        float _1268 = fma(_1108, _1240, _1262);
        float _1270 = fma(_1110, _1220, _1264);
        float _1272 = fma(_1110, _1236, _1266);
        float _1274 = fma(_1110, _1252, _1268);
        float _1276 = _1204 + _1270;
        float _1278 = _1254 + _1272;
        float _1280 = _1256 + _1274;
        _1194 = _1278;
        _1184 = _1276;
        _1202 = _1280;
    }
    float _1282 = _1194;
    float _1284 = _1184;
    float _1286 = _1202;
    bool _1288 = !_1128;
    float _1290 = _1282;
    float _1292 = _1284;
    float _1294 = _1286;
    if (!_1288)
    {
        uint _1296 = uint(int(uint(_170) >> uint(2)));
        float _1298 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1296)]);
        int _1300 = _170 + 4;
        uint _1302 = uint(int(uint(_1300) >> uint(2)));
        float _1304 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1302)]);
        int _1306 = _170 + 8;
        uint _1308 = uint(int(uint(_1306) >> uint(2)));
        float _1310 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1308)]);
        int _1312 = _170 + 12;
        uint _1314 = uint(int(uint(_1312) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        uint _1318 = uint(int(uint(_170) >> uint(2)));
        float _1320 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1318)]);
        int _1322 = _170 + 4;
        uint _1324 = uint(int(uint(_1322) >> uint(2)));
        float _1326 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1324)]);
        int _1328 = _170 + 8;
        uint _1330 = uint(int(uint(_1328) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1330)]);
        int _1334 = _170 + 12;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1336)]);
        uint _1340 = uint(int(uint(_170) >> uint(2)));
        float _1342 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1340)]);
        int _1344 = _170 + 4;
        uint _1346 = uint(int(uint(_1344) >> uint(2)));
        float _1348 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1346)]);
        int _1350 = _170 + 8;
        uint _1352 = uint(int(uint(_1350) >> uint(2)));
        float _1354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1352)]);
        int _1356 = _170 + 12;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        float _1360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1358)]);
        float _1362 = _1106 * _1304;
        float _1364 = _1106 * _1326;
        float _1366 = _1106 * _1348;
        float _1368 = fma(_1108, _1298, _1362);
        float _1370 = fma(_1108, _1320, _1364);
        float _1372 = fma(_1108, _1342, _1366);
        float _1374 = fma(_1110, _1310, _1368);
        float _1376 = fma(_1110, _1332, _1370);
        float _1378 = fma(_1110, _1354, _1372);
        float _1380 = _1374 + _1316;
        float _1382 = _1376 + _1338;
        float _1384 = _1378 + _1360;
        _1290 = _1382;
        _1292 = _1380;
        _1294 = _1384;
    }
    float _1386 = _1290;
    float _1388 = _1292;
    float _1390 = _1294;
    float _1392 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1416 = _1394 * _1386;
    float _1418 = fma(_1392, _1388, _1416);
    float _1420 = fma(_1396, _1390, _1418);
    float _1422 = _1398 + _1420;
    float _1424 = -_1422;
    bool _1426 = _1400 >= _1424;
    bool _1428 = isnan(_1400);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(_1424);
    bool _1434 = _1430 || _1432;
    float _1436 = -_1422;
    bool _1438 = _1402 >= _1436;
    bool _1440 = isnan(_1402);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(_1436);
    bool _1446 = _1442 || _1444;
    int _1448 = _1434 ? 0 : 1;
    int _1450 = 2;
    float _1452 = _1388;
    if (_1434)
    {
        _1450 = 1;
    }
    int _1454 = _1450;
    int _1456 = _1454;
    if (_1446)
    {
        _1456 = _1448;
    }
    int _1458 = _1456;
    int _1460 = _1458 << 6;
    int _1462 = _1460 + 96;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    float _1466 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1464)]);
    int _1468 = _1462 + 4;
    uint _1470 = uint(int(uint(_1468) >> uint(2)));
    float _1472 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1470)]);
    int _1474 = _1462 + 8;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    float _1478 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1476)]);
    int _1480 = _1462 + 12;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    float _1484 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1482)]);
    int _1486 = _1460 + 48;
    int _1488 = _1460 + 64;
    uint _1490 = uint(int(uint(_1486) >> uint(2)));
    float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1490)]);
    int _1494 = _1486 + 4;
    uint _1496 = uint(int(uint(_1494) >> uint(2)));
    float _1498 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1496)]);
    int _1500 = _1486 + 8;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    float _1504 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1502)]);
    int _1506 = _1486 + 12;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    float _1510 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1508)]);
    uint _1512 = uint(int(uint(_1488) >> uint(2)));
    float _1514 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1512)]);
    int _1516 = _1488 + 4;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    float _1520 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1518)]);
    int _1522 = _1488 + 8;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    float _1526 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1524)]);
    int _1528 = _1488 + 12;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    float _1532 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1530)]);
    int _1534 = _1460 + 80;
    float _1536 = _1404 + 1.0;
    float _1538 = _1536 + _1386;
    uint _1540 = uint(int(uint(_1534) >> uint(2)));
    float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
    int _1544 = _1534 + 4;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
    int _1550 = _1534 + 8;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    float _1554 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1552)]);
    int _1556 = _1534 + 12;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    float _1560 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1558)]);
    float _1562 = _1538 * _1408;
    float _1564 = fma(_1406, _1388, _1562);
    float _1566 = fma(_1410, _1390, _1564);
    float _1568 = _1412 + _1566;
    float _1570 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1574 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1576 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1578 = trunc(_1568);
    int _1580 = int(_1578);
    int _1582 = ~as_type<int>(_1414);
    int _1584 = _1580 + _1582;
    int _1586 = _1584 + 1;
    float _1588 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1590 = _1586 >= 0;
    int _1592 = _1580;
    float _1594 = as_type<float>(_1458);
    if (_1590)
    {
        float _1596 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1592 = as_type<int>(_1596);
    }
    int _1598 = _1592;
    float _1600 = _1538 * _1472;
    float _1602 = fma(_1466, _1388, _1600);
    float _1604 = fma(_1478, _1390, _1602);
    float _1606 = _1484 + _1604;
    float _1608 = _1538 * _1498;
    float _1610 = 1.0 / _1606;
    float _1612 = fma(_1492, _1388, _1608);
    float _1614 = _1538 * _1520;
    float _1616 = fma(_1504, _1390, _1612);
    float _1618 = fma(_1514, _1388, _1614);
    float _1620 = _1510 + _1616;
    float _1622 = fma(_1526, _1390, _1618);
    float _1624 = _1620 * _1610;
    float _1626 = _1532 + _1622;
    bool _1628 = _1624 >= 0.0;
    float _1630 = _1626 * _1610;
    bool _1632 = _1624 <= 1.0;
    bool _1634 = _1632 && _1628;
    bool _1636 = _1630 >= 0.0;
    bool _1638 = _1636 && _1634;
    bool _1640 = _1630 <= 1.0;
    bool _1642 = _1640 && _1638;
    float _1644 = _1538 * _1548;
    float _1646 = fma(_1542, _1388, _1644);
    float _1648 = _1620;
    float _1650 = _1510;
    float _1652 = _1576;
    float _1654 = _1514;
    float _1656 = _1618;
    float _1658 = _1622;
    float _1660 = _1532;
    if (_1642)
    {
        float _1662 = float(_1458);
        _1594 = _1662;
    }
    float _1664 = _1594;
    float _1666 = fma(_1554, _1390, _1646);
    float _1668 = _1664;
    if (_1642)
    {
        float _1670 = rint(_1664);
        float _1672 = precise::max(_1670, 0.0);
        uint _1674 = uint(_1672);
        uint _1676 = clamp(_1674, 0u, 65535u);
        _1668 = as_type<float>(_1676);
    }
    float _1678 = _1668;
    float _1680 = _1560 + _1666;
    float _1682 = _1680 * _1610;
    float _1684 = _1630;
    float _1686 = _1682;
    if (_1642)
    {
        float3 _6188 = float3(_1624, _1630, float(as_type<int>(_1678)));
        float3 _6192 = select(_6188, float3(0.0), isnan(_6188));
        float _1688 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _6192.xy, uint(rint(_6192.z)), _1682, level(0.0));
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = _1538 * _1572;
    float _1694 = fma(_1570, _1388, _1692);
    float _1696 = fma(_1574, _1390, _1694);
    float _1698 = _1576 + _1696;
    float _1700 = trunc(_1698);
    int _1702 = int(_1700);
    bool _1704 = _1598 <= _1586;
    bool _1706 = !_1590;
    bool _1708 = _1704 || _1706;
    int _1710 = ~as_type<int>(_1588);
    int _1712 = _1702 + _1710;
    int _1714 = _1712 + 1;
    bool _1716 = _1714 < 0;
    bool _1718 = _1716 || _1708;
    float _1720 = _1694;
    float _1722 = as_type<float>(_1702);
    float _1724 = _1698;
    float _1726 = _1698;
    if (!_1718)
    {
        float _1728 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1720 = _1728;
    }
    float _1730 = _1720;
    bool _1732 = as_type<int>(_1730) <= _1714;
    bool _1734 = _1732 || _1718;
    float _1736 = _1730;
    if (_1734)
    {
        _1722 = 1.0;
    }
    float _1738 = _1722;
    float _1740 = _1738;
    float _1742 = _1690;
    if (!_1734)
    {
        float _1744 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1746 = _1714 * as_type<int>(_1744);
        int _1748 = _1746 + _1586;
        int _1750 = _1748 << 2;
        uint _1752 = uint(int(uint(_1748) >> uint(2)));
        int _1754 = 12 & _1750;
        int _1756 = int(_1752) << 4;
        int _1758 = _1756 + _1754;
        int _1760 = _1758 + 400;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1762)]);
        float _1766 = floor(_1698);
        float _1768 = floor(_1568);
        float _1770 = -_1766;
        float _1772 = _1698 + _1770;
        float _1774 = -_1768;
        float _1776 = _1568 + _1774;
        float _1778 = rint(_1764);
        float _1780 = precise::max(_1778, 0.0);
        uint _1782 = uint(_1780);
        uint _1784 = clamp(_1782, 0u, 65535u);
        float3 _6330 = float3(_1776, _1772, float(int(_1784)));
        float3 _6332 = select(_6330, float3(0.0), isnan(_6330));
        float _1786 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _6332.xy, uint(rint(_6332.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _6332.xy, uint(rint(_6332.z)), level(0.0)).x;
        int _1788 = _1748 << 4;
        int _1790 = _1788 + 2048;
        uint _1792 = uint(int(uint(_1790) >> uint(2)));
        float _1794 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1792)]);
        int _1796 = _1790 + 4;
        uint _1798 = uint(int(uint(_1796) >> uint(2)));
        float _1800 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1798)]);
        int _1802 = _1790 + 8;
        uint _1804 = uint(int(uint(_1802) >> uint(2)));
        float _1806 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1804)]);
        int _1808 = _1790 + 12;
        uint _1810 = uint(int(uint(_1808) >> uint(2)));
        float _1812 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1810)]);
        float _1814 = _1538 * _1800;
        float _1816 = fma(_1794, _1388, _1814);
        float _1818 = fma(_1806, _1390, _1816);
        float _1820 = _1812 + _1818;
        float _1822 = precise::clamp(_1820, 0.0, 1.0);
        float _1824 = -_1822;
        float _1826 = _1824 + _1786;
        float _1828 = fma(_1826, 500.0, 1.5);
        float _1830 = exp2(_1828);
        float _1832 = 0.0 + _1830;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        _1452 = 500.0;
        _1740 = _1834;
        _1648 = as_type<float>(_1784);
        _1650 = _1776;
        _1736 = _1764;
        _1652 = _1786;
        _1654 = _1794;
        _1656 = _1816;
        _1658 = _1830;
        _1660 = _1812;
    }
    float _1836 = _1452;
    float _1838 = _1740;
    float _1840 = _1648;
    float _1842 = _1650;
    float _1844 = _1736;
    float _1846 = _1652;
    float _1848 = _1654;
    float _1850 = _1656;
    float _1852 = _1658;
    float _1854 = _1660;
    uint _1856 = uint(int(uint(_170) >> uint(2)));
    float _1858 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1856)]);
    float _1860 = _1836;
    float _1862 = _1840;
    float _1864 = _1842;
    float _1866 = _1838;
    float _1868 = _1844;
    float _1870 = _1846;
    float _1872 = _1848;
    float _1874 = _1850;
    float _1876 = _1852;
    float _1878 = _1854;
    if (!_1642)
    {
        _1860 = 1.0;
    }
    float _1880 = _1860;
    bool _1882 = _596 > 0.001000000047497451305389404296875;
    bool _1884 = isnan(_596);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.001000000047497451305389404296875);
    bool _1890 = _1886 || _1888;
    float _1892 = _1880;
    if (_1642)
    {
        bool _1894 = _1690 >= _1682;
        bool _1896 = isnan(_1690);
        bool _1898 = _1894 || _1896;
        bool _1900 = isnan(_1682);
        bool _1902 = _1898 || _1900;
        float _1904 = float(_1902);
        _1892 = _1904;
    }
    float _1906 = _1892;
    float _1908 = -_1906;
    float _1910 = fma(_1908, _1838, 1.0);
    float _1912 = -_1858;
    float _1914 = _1910 + _1912;
    float _1916 = _1910;
    float _1918 = _1858;
    if (_1890)
    {
        float _1920 = fma(_1914, 0.0500000007450580596923828125, _1858);
        _1916 = _1920;
    }
    float _1922 = _1916;
    bool _1924 = _662 >= 0.0;
    bool _1926 = isnan(_662);
    bool _1928 = _1924 || _1926;
    bool _1930 = isnan(0.0);
    bool _1932 = _1928 || _1930;
    float _1934 = precise::max(0.0, _1922);
    float _1936 = precise::min(_1934, 0.999000012874603271484375);
    uint _1938 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1938)] = as_type<uint>(_1936);
    if (!_1932)
    {
        float _1940 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _1942 = as_type<int>(_1940) & 512;
        bool _1944 = _1942 != 0;
        float _1946 = _1690;
        float _1948 = _1682;
        float _1950 = _1840;
        float _1952 = _1842;
        if (_1944)
        {
            float _1954 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1956 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1958 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1960 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1946 = _1954;
            _1948 = _1956;
            _1950 = _1958;
            _1952 = _1960;
        }
        float _1962 = _1946;
        float _1964 = _1948;
        float _1966 = _1950;
        float _1968 = _1952;
        float _1970 = _1838;
        float _1972 = _1844;
        float _1974 = _1858;
        float _1976 = _1846;
        if (_1944)
        {
            float _1978 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _1980 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _1982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _1984 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _1970 = _1978;
            _1972 = _1980;
            _1974 = _1982;
            _1976 = _1984;
        }
        float _1986 = _1970;
        float _1988 = _1972;
        float _1990 = _1974;
        float _1992 = _1976;
        float _1994 = _1848;
        float _1996 = _1850;
        float _1998 = _1852;
        float _2000 = _1854;
        if (_1944)
        {
            float _2002 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2004 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2006 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _1994 = _2002;
            _1996 = _2004;
            _1998 = _2006;
            _2000 = _2008;
        }
        float _2010 = _1994;
        float _2012 = _1996;
        float _2014 = _1998;
        float _2016 = _2000;
        int _2018 = as_type<int>(_1940) & 1024;
        bool _2020 = _2018 != 0;
        int _2022 = as_type<int>(_1940) & 2048;
        bool _2024 = _2022 != 0;
        float _2026 = _1964;
        float _2028 = _1962;
        float _2030 = _1966;
        float _2032 = _1968;
        if (_1944)
        {
            float _2034 = _1106 * _1964;
            _2026 = _2034;
        }
        float _2036 = _2026;
        float _2038 = _2036;
        if (_1944)
        {
            float _2040 = fma(_1108, _1962, _2036);
            _2038 = _2040;
        }
        float _2042 = _2038;
        float _2044 = _1986;
        float _2046 = _1990;
        float _2048 = _1988;
        float _2050 = _2042;
        if (_1944)
        {
            float _2052 = _1106 * _1988;
            _1724 = _2052;
        }
        float _2054 = _1724;
        float _2056 = _2054;
        float _2058 = _2010;
        float _2060 = _2012;
        float _2062 = _2014;
        float _2064 = _2016;
        if (_1944)
        {
            float _2066 = _1106 * _2012;
            _2028 = _2066;
        }
        float _2068 = _2028;
        float _2070 = _2068;
        if (_1944)
        {
            float _2072 = fma(_1108, _1986, _2054);
            _2044 = _2072;
        }
        float _2074 = _2044;
        float _2076 = _2074;
        if (_1944)
        {
            float _2078 = fma(_1108, _2010, _2068);
            _2070 = _2078;
        }
        float _2080 = _2070;
        float _2082 = _2080;
        if (_1944)
        {
            float _2084 = fma(_1110, _1990, _2074);
            _2046 = _2084;
        }
        float _2086 = _2046;
        float _2088 = _2086;
        if (_1944)
        {
            float _2090 = fma(_1110, _1966, _2042);
            _2030 = _2090;
        }
        float _2092 = _2030;
        float _2094 = _2092;
        if (_1944)
        {
            float _2096 = fma(_1110, _2014, _2080);
            _2082 = _2096;
        }
        float _2098 = _2082;
        float _2100 = _2098;
        if (!_1944)
        {
            _2076 = 0.0;
            _2048 = 0.0;
        }
        float _2102 = _2076;
        float _2104 = _2048;
        float _2106 = _2104;
        float _2108 = _2102;
        if (!_1944)
        {
            _2056 = 0.0;
        }
        float _2110 = _2056;
        float _2112 = _2110;
        if (_1944)
        {
            float _2114 = _1992 + _2086;
            _2106 = _2114;
        }
        float _2116 = _2106;
        float _2118 = _2116;
        if (_1944)
        {
            float _2120 = _1968 + _2092;
            _2112 = _2120;
        }
        float _2122 = _2112;
        float _2124 = _2122;
        if (_1944)
        {
            float _2126 = _2016 + _2098;
            _2108 = _2126;
        }
        float _2128 = _2108;
        bool _2130 = !_2020;
        float _2132 = _2128;
        if (!_2130)
        {
            float _2134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2136 = uint(int(uint(_170) >> uint(2)));
            float _2138 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2136)]);
            int _2140 = _170 + 4;
            uint _2142 = uint(int(uint(_2140) >> uint(2)));
            float _2144 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2142)]);
            int _2146 = _170 + 8;
            uint _2148 = uint(int(uint(_2146) >> uint(2)));
            float _2150 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2148)]);
            uint _2152 = uint(int(uint(_170) >> uint(2)));
            float _2154 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2152)]);
            int _2156 = _170 + 4;
            uint _2158 = uint(int(uint(_2156) >> uint(2)));
            float _2160 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2158)]);
            int _2162 = _170 + 8;
            uint _2164 = uint(int(uint(_2162) >> uint(2)));
            float _2166 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2164)]);
            int _2168 = _170 + 12;
            uint _2170 = uint(int(uint(_2168) >> uint(2)));
            float _2172 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2170)]);
            uint _2174 = uint(int(uint(_170) >> uint(2)));
            float _2176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2174)]);
            int _2178 = _170 + 4;
            uint _2180 = uint(int(uint(_2178) >> uint(2)));
            float _2182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2180)]);
            int _2184 = _170 + 8;
            uint _2186 = uint(int(uint(_2184) >> uint(2)));
            float _2188 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2186)]);
            int _2190 = _170 + 12;
            uint _2192 = uint(int(uint(_2190) >> uint(2)));
            float _2194 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2192)]);
            float _2196 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2198 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2200 = _1106 * _2144;
            float _2202 = _1106 * _2160;
            float _2204 = fma(_1108, _2138, _2200);
            float _2206 = _1106 * _2182;
            float _2208 = fma(_1108, _2154, _2202);
            float _2210 = fma(_1108, _2176, _2206);
            float _2212 = fma(_1110, _2150, _2204);
            float _2214 = fma(_1110, _2166, _2208);
            float _2216 = fma(_1110, _2188, _2210);
            float _2218 = _2134 + _2212;
            float _2220 = _2196 + _2214;
            float _2222 = _2198 + _2216;
            _2132 = _2222;
            _2118 = _2218;
            _2088 = _2150;
            _2058 = _2176;
            _2060 = _2210;
            _2062 = _2216;
            _2064 = _2194;
            _2124 = _2220;
            _2050 = _2214;
            _2094 = _2166;
            _2032 = _2172;
            _2100 = _2154;
        }
        float _2224 = _2132;
        float _2226 = _2118;
        float _2228 = _2088;
        float _2230 = _2058;
        float _2232 = _2060;
        float _2234 = _2062;
        float _2236 = _2064;
        float _2238 = _2124;
        float _2240 = _2050;
        float _2242 = _2094;
        float _2244 = _2032;
        float _2246 = _2100;
        bool _2248 = !_2024;
        float _2250 = _2226;
        float _2252 = _2224;
        float _2254 = _2238;
        float _2256 = _2230;
        float _2258 = _2232;
        float _2260 = _2246;
        float _2262 = _2228;
        float _2264 = _2234;
        float _2266 = _2236;
        _1686 = _2240;
        _1862 = _2242;
        _1864 = _2244;
        if (!_2248)
        {
            uint _2268 = uint(int(uint(_170) >> uint(2)));
            float _2270 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2268)]);
            int _2272 = _170 + 4;
            uint _2274 = uint(int(uint(_2272) >> uint(2)));
            float _2276 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2274)]);
            int _2278 = _170 + 8;
            uint _2280 = uint(int(uint(_2278) >> uint(2)));
            float _2282 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2280)]);
            int _2284 = _170 + 12;
            uint _2286 = uint(int(uint(_2284) >> uint(2)));
            float _2288 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2286)]);
            uint _2290 = uint(int(uint(_170) >> uint(2)));
            float _2292 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2290)]);
            int _2294 = _170 + 4;
            uint _2296 = uint(int(uint(_2294) >> uint(2)));
            float _2298 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2296)]);
            int _2300 = _170 + 8;
            uint _2302 = uint(int(uint(_2300) >> uint(2)));
            float _2304 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2302)]);
            int _2306 = _170 + 12;
            uint _2308 = uint(int(uint(_2306) >> uint(2)));
            float _2310 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2308)]);
            uint _2312 = uint(int(uint(_170) >> uint(2)));
            float _2314 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2312)]);
            int _2316 = _170 + 4;
            uint _2318 = uint(int(uint(_2316) >> uint(2)));
            float _2320 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2318)]);
            int _2322 = _170 + 8;
            uint _2324 = uint(int(uint(_2322) >> uint(2)));
            float _2326 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2324)]);
            int _2328 = _170 + 12;
            uint _2330 = uint(int(uint(_2328) >> uint(2)));
            float _2332 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2330)]);
            float _2334 = _1106 * _2276;
            float _2336 = _1106 * _2298;
            float _2338 = fma(_1108, _2270, _2334);
            float _2340 = _1106 * _2320;
            float _2342 = fma(_1108, _2292, _2336);
            float _2344 = fma(_1108, _2314, _2340);
            float _2346 = fma(_1110, _2282, _2338);
            float _2348 = fma(_1110, _2304, _2342);
            float _2350 = fma(_1110, _2326, _2344);
            float _2352 = _2346 + _2288;
            float _2354 = _2348 + _2310;
            float _2356 = _2350 + _2332;
            _2250 = _2352;
            _2252 = _2356;
            _2254 = _2354;
            _2256 = _2292;
            _2258 = _2342;
            _2260 = _2334;
            _2262 = _2282;
            _2264 = _2348;
            _2266 = _2310;
        }
        float _2358 = _2250;
        float _2360 = _2252;
        float _2362 = _2254;
        float _2364 = _2256;
        float _2366 = _2258;
        float _2368 = _2260;
        float _2370 = _2262;
        float _2372 = _2264;
        float _2374 = _2266;
        float _2376 = fma(_2358, 6.2500002968590706586837768554688e-05, 0.5);
        float _2378 = fma(_2360, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _7158 = float2(_2376, _2378);
        float _2380 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7158, float2(0.0), isnan(_7158)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7158, float2(0.0), isnan(_7158)), level(0.0)).x;
        float _2382 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _2384 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _2386 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _2388 = _2380 * 2000.0;
        float _2390 = -_2382;
        float _2392 = _2390 + _2362;
        float _2394 = _2388 + (-0.300000011920928955078125);
        bool _2396 = _2392 > _2394;
        bool _2398 = _2392 < _2388;
        bool _2400 = _2398 && _2396;
        bool _2402 = !_2400;
        _1742 = _2368;
        _1866 = _2360;
        _1868 = _2358;
        _1918 = _2370;
        _1870 = _2394;
        _1872 = _2364;
        _1874 = _2366;
        _1876 = _2372;
        _1878 = _2374;
        _1726 = _2392;
        if (!_2402)
        {
            float _2404 = fma(_2358, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2406 = fma(_2358, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2408 = fma(_2360, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2410 = fma(_2360, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _7224 = float2(_2404, _2378);
            float _2412 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7224, float2(0.0), isnan(_7224)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7224, float2(0.0), isnan(_7224)), level(0.0)).x;
            float2 _7232 = float2(_2406, _2378);
            float _2414 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7232, float2(0.0), isnan(_7232)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7232, float2(0.0), isnan(_7232)), level(0.0)).x;
            float2 _7240 = float2(_2376, _2408);
            float _2416 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7240, float2(0.0), isnan(_7240)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7240, float2(0.0), isnan(_7240)), level(0.0)).x;
            float2 _7248 = float2(_2376, _2410);
            float _2418 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7248, float2(0.0), isnan(_7248)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7248, float2(0.0), isnan(_7248)), level(0.0)).x;
            float2 _7256 = float2(_2404, _2408);
            float _2420 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7256, float2(0.0), isnan(_7256)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7256, float2(0.0), isnan(_7256)), level(0.0)).x;
            float2 _7264 = float2(_2404, _2410);
            float _2422 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7264, float2(0.0), isnan(_7264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7264, float2(0.0), isnan(_7264)), level(0.0)).x;
            float2 _7272 = float2(_2406, _2408);
            float _2424 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7272, float2(0.0), isnan(_7272)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7272, float2(0.0), isnan(_7272)), level(0.0)).x;
            float2 _7280 = float2(_2406, _2410);
            float _2426 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7280, float2(0.0), isnan(_7280)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7280, float2(0.0), isnan(_7280)), level(0.0)).x;
            float _2428 = -_2412;
            float _2430 = _2380 + _2428;
            float _2432 = -_2414;
            float _2434 = _2380 + _2432;
            float _2436 = -_2416;
            float _2438 = _2380 + _2436;
            float _2440 = -_2418;
            float _2442 = _2380 + _2440;
            float _2444 = -_2420;
            float _2446 = _2380 + _2444;
            float _2448 = -_2422;
            float _2450 = _2380 + _2448;
            float _2452 = -_2424;
            float _2454 = _2380 + _2452;
            float _2456 = -_2426;
            float _2458 = _2380 + _2456;
            float _2460 = abs(_2430);
            float _2462 = abs(_2434);
            float _2464 = precise::max(_2460, _2462);
            float _2466 = abs(_2438);
            float _2468 = abs(_2442);
            float _2470 = precise::max(_2466, _2468);
            float _2472 = abs(_2446);
            float _2474 = abs(_2450);
            float _2476 = precise::max(_2472, _2474);
            float _2478 = precise::max(_2464, _2470);
            float _2480 = abs(_2454);
            float _2482 = abs(_2458);
            float _2484 = precise::max(_2480, _2482);
            bool _2486 = _2478 > 0.00150000001303851604461669921875;
            float _2488 = precise::max(_2476, _2484);
            bool _2490 = _2488 <= 0.00150000001303851604461669921875;
            bool _2492 = isnan(_2488);
            bool _2494 = _2490 || _2492;
            bool _2496 = isnan(0.00150000001303851604461669921875);
            bool _2498 = _2494 || _2496;
            bool _2500 = !_2486;
            bool _2502 = _2498 && _2500;
            bool _2504 = !_2502;
            float _2506 = _2478;
            float _2508 = _2450;
            float _2510 = _2484;
            float _2512 = _2434;
            _1742 = _2410;
            _1686 = _2478;
            _1862 = _2488;
            _1864 = _2450;
            _1866 = _2438;
            _1868 = _2406;
            _1918 = _2404;
            _1870 = _2408;
            _1872 = _2454;
            _1874 = _2484;
            _1876 = _2464;
            _1878 = _2434;
            if (!_2504)
            {
                float _2514 = -_2380;
                float _2516 = _2514 + _2412;
                float _2518 = -_2380;
                float _2520 = _2518 + _2416;
                float _2522 = _2516 * 2000.0;
                float _2524 = _2520 * 2000.0;
                bool _2526 = !_1944;
                float _2632;
                float _2634;
                float _2636;
                if (!_2526)
                {
                    float _2528 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2530 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2532 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2534 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2536 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2538 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2542 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2546 = _2532 * _2534;
                    float _2548 = _2532 * _2536;
                    float _2550 = _2530 * _2534;
                    float _2552 = -_2546;
                    float _2554 = fma(_2528, _2538, _2552);
                    float _2556 = -_2548;
                    float _2558 = fma(_2530, _2538, _2556);
                    float _2560 = -_2550;
                    float _2562 = fma(_2528, _2536, _2560);
                    float _2564 = _2544 * _2530;
                    float _2566 = _2554 * _2542;
                    float _2568 = _2540 * _2532;
                    float _2570 = _2542 * _2528;
                    float _2572 = -_2564;
                    float _2574 = fma(_2542, _2532, _2572);
                    float _2576 = -_2566;
                    float _2578 = fma(_2558, _2540, _2576);
                    float _2580 = _2542 * _2538;
                    float _2582 = -_2568;
                    float _2584 = fma(_2544, _2528, _2582);
                    float _2586 = _2544 * _2534;
                    float _2588 = fma(_2562, _2544, _2578);
                    float _2590 = -_2580;
                    float _2592 = fma(_2544, _2536, _2590);
                    float _2594 = _2540 * _2536;
                    float _2596 = -_2528;
                    float _2598 = fma(_2596, _2538, _2546);
                    float _2600 = -_2586;
                    float _2602 = fma(_2540, _2538, _2600);
                    float _2604 = -_2570;
                    float _2606 = fma(_2540, _2530, _2604);
                    float _2608 = 1.0 / _2588;
                    float _2610 = -_2594;
                    float _2612 = fma(_2542, _2534, _2610);
                    float _2614 = fma(_2522, _2558, _2592);
                    float _2616 = fma(_2522, _2598, _2602);
                    float _2618 = fma(_2522, _2562, _2612);
                    float _2620 = fma(_2524, _2574, _2614);
                    float _2622 = fma(_2524, _2584, _2616);
                    float _2624 = fma(_2524, _2606, _2618);
                    float _2626 = _2608 * _2620;
                    float _2628 = _2608 * _2622;
                    float _2630 = _2608 * _2624;
                    _2632 = _2628;
                    _2634 = _2626;
                    _2636 = _2630;
                    _2506 = _2536;
                    _2508 = _2614;
                    _2510 = _2530;
                    _2512 = _2546;
                    _2638 = true;
                }
                else
                {
                    float _2640 = fma(_2522, _518, _512);
                    float _2642 = fma(_2522, _520, _514);
                    float _2644 = fma(_2522, _522, _516);
                    float _2646 = fma(_2524, _524, _2640);
                    float _2648 = fma(_2524, _526, _2642);
                    float _2650 = fma(_2524, _528, _2644);
                    _2632 = _2648;
                    _2634 = _2646;
                    _2636 = _2650;
                }
                _2638 = false;
                float _2652 = _2632;
                float _2654 = _2634;
                float _2656 = _2636;
                float _2658 = _2506;
                float _2660 = _2508;
                float _2662 = _2510;
                float _2664 = _2512;
                float _2666 = _2652 * _2652;
                float _2668 = -_2392;
                float _2670 = _2668 + _2388;
                float _2672 = fma(_2654, _2654, _2666);
                float _2674 = _1106 + _2670;
                float _2676 = fma(_2656, _2656, _2672);
                float _2678 = rsqrt(_2676);
                float _2680 = _2678 * _2652;
                float _2682 = _2678 * _2654;
                float _2684 = _2678 * _2656;
                float _2686 = _662 * _2680;
                float _2688 = fma(_660, _2682, _2686);
                float _2690 = fma(_674, _2684, _2688);
                float _2692 = _2682 * _2690;
                float _2694 = _2680 * _2690;
                float _2696 = _2684 * _2690;
                float _2698 = -_2692;
                float _2700 = _660 + _2698;
                float _2702 = -_2694;
                float _2704 = _662 + _2702;
                float _2706 = -_2696;
                float _2708 = _674 + _2706;
                float _2710 = _2384 * _2692;
                float _2712 = _2384 * _2694;
                float _2714 = _2384 * _2696;
                float _2716 = -_2710;
                float _2718 = fma(_2386, _2700, _2716);
                float _2720 = -_2712;
                float _2722 = fma(_2386, _2704, _2720);
                float _2724 = -_2714;
                float _2726 = fma(_2386, _2708, _2724);
                _688 = _2722;
                _1742 = _2694;
                _1686 = _2658;
                _1862 = _2700;
                _1864 = _2660;
                _1866 = _2696;
                _1868 = _2690;
                _1918 = _2710;
                _1870 = _2678;
                _1872 = _2704;
                _1874 = _2662;
                _1876 = _2708;
                _1878 = _2664;
                _1114 = _2674;
                _690 = _2718;
                _692 = _2726;
            }
        }
    }
    float _2728 = _688;
    float _2730 = _1742;
    float _2732 = _1686;
    float _2734 = _1862;
    float _2736 = _1864;
    float _2738 = _1866;
    float _2740 = _1868;
    float _2742 = _1918;
    float _2744 = _1870;
    float _2746 = _1872;
    float _2748 = _1874;
    float _2750 = _1876;
    float _2752 = _1878;
    float _2754 = _1114;
    float _2756 = _1726;
    float _2758 = _690;
    float _2760 = _692;
    bool _2762 = _2728 >= 0.0;
    bool _2764 = isnan(_2728);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan(0.0);
    bool _2770 = _2766 || _2768;
    float _2772 = _2756;
    float _2774 = _2754;
    float _2776 = _2758;
    float _2778 = _2728;
    float _2780 = _2760;
    if (!_2770)
    {
        float _2782 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _2784 = as_type<int>(_2782) & 512;
        bool _2786 = _2784 != 0;
        float _2788 = _2730;
        float _2790 = _2732;
        float _2792 = _2734;
        float _2794 = _2736;
        if (_2786)
        {
            float _2796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2802 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _2788 = _2796;
            _2790 = _2798;
            _2792 = _2800;
            _2794 = _2802;
        }
        float _2804 = _2788;
        float _2806 = _2790;
        float _2808 = _2792;
        float _2810 = _2794;
        float _2812 = _2738;
        float _2814 = _2740;
        float _2816 = _2742;
        float _2818 = _2744;
        if (_2786)
        {
            float _2820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2826 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _2812 = _2820;
            _2814 = _2822;
            _2816 = _2824;
            _2818 = _2826;
        }
        float _2828 = _2812;
        float _2830 = _2814;
        float _2832 = _2816;
        float _2834 = _2818;
        float _2836 = _2746;
        float _2838 = _2748;
        float _2840 = _2750;
        float _2842 = _2752;
        if (_2786)
        {
            float _2844 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2846 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2848 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2850 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2836 = _2844;
            _2838 = _2846;
            _2840 = _2848;
            _2842 = _2850;
        }
        float _2852 = _2836;
        float _2854 = _2838;
        float _2856 = _2840;
        float _2858 = _2842;
        int _2860 = as_type<int>(_2782) & 1024;
        bool _2862 = _2860 != 0;
        int _2864 = as_type<int>(_2782) & 2048;
        bool _2866 = _2864 != 0;
        float _2868 = _2806;
        float _2870 = _2804;
        float _2872 = _2808;
        if (_2786)
        {
            float _2874 = _2806 * _2754;
            _2868 = _2874;
        }
        float _2876 = _2868;
        float _2878 = _2876;
        if (_2786)
        {
            float _2880 = fma(_1108, _2804, _2876);
            _2878 = _2880;
        }
        float _2882 = _2878;
        float _2884 = _2828;
        float _2886 = _2832;
        float _2888 = _2830;
        if (_2786)
        {
            float _2890 = _2830 * _2754;
            _2772 = _2890;
        }
        float _2892 = _2772;
        float _2894 = _2892;
        if (_2786)
        {
            float _2896 = _2854 * _2754;
            _2870 = _2896;
        }
        float _2898 = _2870;
        float _2900 = _2898;
        if (_2786)
        {
            float _2902 = fma(_1108, _2828, _2892);
            _2884 = _2902;
        }
        float _2904 = _2884;
        float _2906 = _2904;
        if (_2786)
        {
            float _2908 = fma(_1108, _2852, _2898);
            _2900 = _2908;
        }
        float _2910 = _2900;
        float _2912 = _2910;
        if (_2786)
        {
            float _2914 = fma(_1110, _2832, _2904);
            _2886 = _2914;
        }
        float _2916 = _2886;
        if (_2786)
        {
            float _2918 = fma(_1110, _2808, _2882);
            _2872 = _2918;
        }
        float _2920 = _2872;
        if (_2786)
        {
            float _2922 = fma(_1110, _2856, _2910);
            _2912 = _2922;
        }
        float _2924 = _2912;
        if (!_2786)
        {
            _2888 = 0.0;
            _2906 = 0.0;
        }
        float _2926 = _2888;
        float _2928 = _2906;
        float _2930 = _2926;
        float _2932 = _2928;
        if (!_2786)
        {
            _2894 = 0.0;
        }
        float _2934 = _2894;
        float _2936 = _2934;
        if (_2786)
        {
            float _2938 = _2834 + _2916;
            _2930 = _2938;
        }
        float _2940 = _2930;
        float _2942 = _2940;
        if (_2786)
        {
            float _2944 = _2810 + _2920;
            _2936 = _2944;
        }
        float _2946 = _2936;
        float _2948 = _2946;
        if (_2786)
        {
            float _2950 = _2858 + _2924;
            _2932 = _2950;
        }
        float _2952 = _2932;
        bool _2954 = !_2862;
        float _2956 = _2952;
        if (!_2954)
        {
            float _2958 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2960 = uint(int(uint(_170) >> uint(2)));
            float _2962 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2960)]);
            int _2964 = _170 + 4;
            uint _2966 = uint(int(uint(_2964) >> uint(2)));
            float _2968 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2966)]);
            int _2970 = _170 + 8;
            uint _2972 = uint(int(uint(_2970) >> uint(2)));
            float _2974 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2972)]);
            uint _2976 = uint(int(uint(_170) >> uint(2)));
            float _2978 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2976)]);
            int _2980 = _170 + 4;
            uint _2982 = uint(int(uint(_2980) >> uint(2)));
            float _2984 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2982)]);
            int _2986 = _170 + 8;
            uint _2988 = uint(int(uint(_2986) >> uint(2)));
            float _2990 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2988)]);
            uint _2992 = uint(int(uint(_170) >> uint(2)));
            float _2994 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2992)]);
            int _2996 = _170 + 4;
            uint _2998 = uint(int(uint(_2996) >> uint(2)));
            float _3000 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2998)]);
            int _3002 = _170 + 8;
            uint _3004 = uint(int(uint(_3002) >> uint(2)));
            float _3006 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3004)]);
            float _3008 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3010 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3012 = _2968 * _2754;
            float _3014 = _2984 * _2754;
            float _3016 = fma(_1108, _2962, _3012);
            float _3018 = _3000 * _2754;
            float _3020 = fma(_1108, _2978, _3014);
            float _3022 = fma(_1108, _2994, _3018);
            float _3024 = fma(_1110, _2974, _3016);
            float _3026 = fma(_1110, _2990, _3020);
            float _3028 = fma(_1110, _3006, _3022);
            float _3030 = _2958 + _3024;
            float _3032 = _3008 + _3026;
            float _3034 = _3010 + _3028;
            _2956 = _3034;
            _2942 = _3030;
            _2948 = _3032;
        }
        float _3036 = _2956;
        float _3038 = _2942;
        float _3040 = _2948;
        bool _3042 = !_2866;
        float _3044 = _3038;
        float _3046 = _3036;
        float _3048 = _3040;
        if (!_3042)
        {
            uint _3050 = uint(int(uint(_170) >> uint(2)));
            float _3052 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3050)]);
            int _3054 = _170 + 4;
            uint _3056 = uint(int(uint(_3054) >> uint(2)));
            float _3058 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3056)]);
            int _3060 = _170 + 8;
            uint _3062 = uint(int(uint(_3060) >> uint(2)));
            float _3064 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3062)]);
            int _3066 = _170 + 12;
            uint _3068 = uint(int(uint(_3066) >> uint(2)));
            float _3070 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3068)]);
            uint _3072 = uint(int(uint(_170) >> uint(2)));
            float _3074 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3072)]);
            int _3076 = _170 + 4;
            uint _3078 = uint(int(uint(_3076) >> uint(2)));
            float _3080 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3078)]);
            int _3082 = _170 + 8;
            uint _3084 = uint(int(uint(_3082) >> uint(2)));
            float _3086 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3084)]);
            int _3088 = _170 + 12;
            uint _3090 = uint(int(uint(_3088) >> uint(2)));
            float _3092 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_3090)]);
            uint _3094 = uint(int(uint(_170) >> uint(2)));
            float _3096 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3094)]);
            int _3098 = _170 + 4;
            uint _3100 = uint(int(uint(_3098) >> uint(2)));
            float _3102 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3100)]);
            int _3104 = _170 + 8;
            uint _3106 = uint(int(uint(_3104) >> uint(2)));
            float _3108 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3106)]);
            int _3110 = _170 + 12;
            uint _3112 = uint(int(uint(_3110) >> uint(2)));
            float _3114 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3112)]);
            float _3116 = _3058 * _2754;
            float _3118 = _3080 * _2754;
            float _3120 = fma(_1108, _3052, _3116);
            float _3122 = _3102 * _2754;
            float _3124 = fma(_1108, _3074, _3118);
            float _3126 = fma(_1108, _3096, _3122);
            float _3128 = fma(_1110, _3064, _3120);
            float _3130 = fma(_1110, _3086, _3124);
            float _3132 = fma(_1110, _3108, _3126);
            float _3134 = _3128 + _3070;
            float _3136 = _3130 + _3092;
            float _3138 = _3132 + _3114;
            _3044 = _3134;
            _3046 = _3138;
            _3048 = _3136;
        }
        float _3140 = _3044;
        float _3142 = _3046;
        float _3144 = _3048;
        float _3146 = fma(_3140, 6.2500002968590706586837768554688e-05, 0.5);
        float _3148 = fma(_3142, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _8324 = float2(_3146, _3148);
        float _3150 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8324, float2(0.0), isnan(_8324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8324, float2(0.0), isnan(_8324)), level(0.0)).x;
        float _3152 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[71]);
        float _3154 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[68]);
        float _3156 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[69]);
        float _3158 = _3150 * 2000.0;
        float _3160 = -_3152;
        float _3162 = _3160 + _3144;
        float _3164 = _3158 + (-0.300000011920928955078125);
        bool _3166 = _3162 > _3164;
        bool _3168 = _3162 < _3158;
        bool _3170 = _3168 && _3166;
        bool _3172 = !_3170;
        if (!_3172)
        {
            float _3174 = fma(_3140, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3176 = fma(_3140, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _3178 = fma(_3142, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3180 = fma(_3142, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _8372 = float2(_3174, _3148);
            float _3182 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8372, float2(0.0), isnan(_8372)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8372, float2(0.0), isnan(_8372)), level(0.0)).x;
            float2 _8380 = float2(_3176, _3148);
            float _3184 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8380, float2(0.0), isnan(_8380)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8380, float2(0.0), isnan(_8380)), level(0.0)).x;
            float2 _8388 = float2(_3146, _3178);
            float _3186 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8388, float2(0.0), isnan(_8388)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8388, float2(0.0), isnan(_8388)), level(0.0)).x;
            float2 _8396 = float2(_3146, _3180);
            float _3188 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8396, float2(0.0), isnan(_8396)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8396, float2(0.0), isnan(_8396)), level(0.0)).x;
            float2 _8404 = float2(_3174, _3178);
            float _3190 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8404, float2(0.0), isnan(_8404)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8404, float2(0.0), isnan(_8404)), level(0.0)).x;
            float2 _8412 = float2(_3174, _3180);
            float _3192 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8412, float2(0.0), isnan(_8412)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8412, float2(0.0), isnan(_8412)), level(0.0)).x;
            float2 _8420 = float2(_3176, _3178);
            float _3194 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8420, float2(0.0), isnan(_8420)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8420, float2(0.0), isnan(_8420)), level(0.0)).x;
            float2 _8428 = float2(_3176, _3180);
            float _3196 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_8428, float2(0.0), isnan(_8428)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_8428, float2(0.0), isnan(_8428)), level(0.0)).x;
            float _3198 = -_3182;
            float _3200 = _3150 + _3198;
            float _3202 = -_3184;
            float _3204 = _3150 + _3202;
            float _3206 = -_3186;
            float _3208 = _3150 + _3206;
            float _3210 = -_3188;
            float _3212 = _3150 + _3210;
            float _3214 = -_3190;
            float _3216 = _3150 + _3214;
            float _3218 = -_3192;
            float _3220 = _3150 + _3218;
            float _3222 = -_3194;
            float _3224 = _3150 + _3222;
            float _3226 = -_3196;
            float _3228 = _3150 + _3226;
            float _3230 = abs(_3200);
            float _3232 = abs(_3204);
            float _3234 = precise::max(_3230, _3232);
            float _3236 = abs(_3208);
            float _3238 = abs(_3212);
            float _3240 = precise::max(_3236, _3238);
            float _3242 = abs(_3216);
            float _3244 = abs(_3220);
            float _3246 = precise::max(_3242, _3244);
            float _3248 = precise::max(_3234, _3240);
            float _3250 = abs(_3224);
            float _3252 = abs(_3228);
            float _3254 = precise::max(_3250, _3252);
            bool _3256 = _3248 > 0.00150000001303851604461669921875;
            float _3258 = precise::max(_3246, _3254);
            bool _3260 = _3258 <= 0.00150000001303851604461669921875;
            bool _3262 = isnan(_3258);
            bool _3264 = _3260 || _3262;
            bool _3266 = isnan(0.00150000001303851604461669921875);
            bool _3268 = _3264 || _3266;
            bool _3270 = !_3256;
            bool _3272 = _3268 && _3270;
            bool _3274 = !_3272;
            if (!_3274)
            {
                float _3276 = -_3150;
                float _3278 = _3276 + _3182;
                float _3280 = -_3150;
                float _3282 = _3280 + _3186;
                float _3284 = _3278 * 2000.0;
                float _3286 = _3282 * 2000.0;
                bool _3288 = !_2786;
                float _3394;
                float _3396;
                float _3398;
                if (!_3288)
                {
                    float _3290 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _3292 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _3294 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _3296 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _3298 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _3300 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _3302 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _3304 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _3306 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _3308 = _3294 * _3296;
                    float _3310 = _3294 * _3298;
                    float _3312 = _3292 * _3296;
                    float _3314 = -_3308;
                    float _3316 = fma(_3290, _3300, _3314);
                    float _3318 = -_3310;
                    float _3320 = fma(_3292, _3300, _3318);
                    float _3322 = _3306 * _3292;
                    float _3324 = _3302 * _3294;
                    float _3326 = _3316 * _3304;
                    float _3328 = -_3312;
                    float _3330 = fma(_3290, _3298, _3328);
                    float _3332 = _3304 * _3300;
                    float _3334 = -_3322;
                    float _3336 = fma(_3304, _3294, _3334);
                    float _3338 = -_3326;
                    float _3340 = fma(_3320, _3302, _3338);
                    float _3342 = -_3324;
                    float _3344 = fma(_3306, _3290, _3342);
                    float _3346 = -_3332;
                    float _3348 = fma(_3306, _3298, _3346);
                    float _3350 = _3306 * _3296;
                    float _3352 = fma(_3330, _3306, _3340);
                    float _3354 = _3302 * _3298;
                    float _3356 = _3304 * _3290;
                    float _3358 = -_3290;
                    float _3360 = fma(_3358, _3300, _3308);
                    float _3362 = 1.0 / _3352;
                    float _3364 = -_3350;
                    float _3366 = fma(_3302, _3300, _3364);
                    float _3368 = -_3354;
                    float _3370 = fma(_3304, _3296, _3368);
                    float _3372 = fma(_3320, _3284, _3348);
                    float _3374 = -_3356;
                    float _3376 = fma(_3302, _3292, _3374);
                    float _3378 = fma(_3360, _3284, _3366);
                    float _3380 = fma(_3330, _3284, _3370);
                    float _3382 = fma(_3336, _3286, _3372);
                    float _3384 = fma(_3344, _3286, _3378);
                    float _3386 = fma(_3376, _3286, _3380);
                    float _3388 = _3362 * _3382;
                    float _3390 = _3362 * _3384;
                    float _3392 = _3362 * _3386;
                    _3394 = _3390;
                    _3396 = _3388;
                    _3398 = _3392;
                    _3400 = true;
                }
                else
                {
                    float _3402 = fma(_3284, _518, _512);
                    float _3404 = fma(_3284, _520, _514);
                    float _3406 = fma(_3284, _522, _516);
                    float _3408 = fma(_3286, _524, _3402);
                    float _3410 = fma(_3286, _526, _3404);
                    float _3412 = fma(_3286, _528, _3406);
                    _3394 = _3410;
                    _3396 = _3408;
                    _3398 = _3412;
                }
                _3400 = false;
                float _3414 = _3394;
                float _3416 = _3396;
                float _3418 = _3398;
                float _3420 = _3414 * _3414;
                float _3422 = -_3162;
                float _3424 = _3422 + _3158;
                float _3426 = fma(_3416, _3416, _3420);
                float _3428 = _3424 + _2754;
                float _3430 = fma(_3418, _3418, _3426);
                float _3432 = rsqrt(_3430);
                float _3434 = _3432 * _3414;
                float _3436 = _3432 * _3416;
                float _3438 = _3432 * _3418;
                float _3440 = _3434 * _2728;
                float _3442 = fma(_3436, _2758, _3440);
                float _3444 = fma(_3438, _2760, _3442);
                float _3446 = _3436 * _3444;
                float _3448 = _3434 * _3444;
                float _3450 = _3438 * _3444;
                float _3452 = -_3446;
                float _3454 = _3452 + _2758;
                float _3456 = -_3448;
                float _3458 = _3456 + _2728;
                float _3460 = -_3450;
                float _3462 = _3460 + _2760;
                float _3464 = _3154 * _3446;
                float _3466 = _3154 * _3448;
                float _3468 = _3154 * _3450;
                float _3470 = -_3464;
                float _3472 = fma(_3156, _3454, _3470);
                float _3474 = -_3466;
                float _3476 = fma(_3156, _3458, _3474);
                float _3478 = -_3468;
                float _3480 = fma(_3156, _3462, _3478);
                _2774 = _3428;
                _2776 = _3472;
                _2778 = _3476;
                _2780 = _3480;
            }
        }
    }
    float _3482 = _2774;
    float _3484 = _2776;
    float _3486 = _2778;
    float _3488 = _2780;
    int _3490 = _170 + 4;
    int _3492 = _170 + 8;
    uint _3494 = uint(int(uint(_192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3494)] = as_type<uint>(_560);
    float _3496 = -_174;
    float _3498 = _3496 + _1108;
    float _3500 = -_180;
    float _3502 = _3500 + _3482;
    uint _3504 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3504)] = as_type<uint>(_1108);
    float _3506 = -_186;
    float _3508 = _3506 + _1110;
    uint _3510 = uint(int(uint(_3490) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3510)] = as_type<uint>(_3482);
    uint _3512 = uint(int(uint(_3492) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_3512)] = as_type<uint>(_1110);
    uint _3514 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3514)] = as_type<uint>(_3484);
    uint _3516 = uint(int(uint(_3490) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3516)] = as_type<uint>(_3486);
    uint _3518 = uint(int(uint(_3492) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_3518)] = as_type<uint>(_3488);
    uint _3520 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3520)] = as_type<uint>(_3498);
    uint _3522 = uint(int(uint(_3490) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3522)] = as_type<uint>(_3502);
    uint _3524 = uint(int(uint(_3492) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3524)] = as_type<uint>(_3508);
    float _3526 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _3528 = _3502 * _3502;
    float _3530 = _3486 * _3486;
    float _3532 = fma(_3498, _3498, _3528);
    float _3534 = fma(_3484, _3484, _3530);
    float _3536 = fma(_3508, _3508, _3532);
    float _3538 = fma(_3488, _3488, _3534);
    float _3540 = sqrt(_3536);
    float _3542 = sqrt(_3538);
    bool _3544 = _3540 >= 9.9999999747524270787835121154785e-07;
    bool _3546 = isnan(_3540);
    bool _3548 = _3544 || _3546;
    bool _3550 = isnan(9.9999999747524270787835121154785e-07);
    bool _3552 = _3548 || _3550;
    if (!_3552)
    {
        bool _3554 = _538 != _294;
        bool _3556 = isnan(_538);
        bool _3558 = _3554 || _3556;
        bool _3560 = isnan(_294);
        bool _3562 = _3558 || _3560;
        _3564 = _3562;
        if (!_3564)
        {
            float _3566 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _3568 = _3566 > 0.0;
            bool _3570 = !_3568;
            if (!_3570)
            {
                float _3572 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _3574 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _3576 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _3578 = _3574 * _514;
                float _3580 = _3574 * _512;
                float _3582 = _3574 * _516;
                float _3584 = fma(_3572, _520, _3578);
                float _3586 = fma(_3572, _518, _3580);
                float _3588 = fma(_3572, _522, _3582);
                float _3590 = fma(_3576, _526, _3584);
                float _3592 = fma(_3576, _524, _3586);
                float _3594 = fma(_3576, _528, _3588);
                float _3596 = _3590 * _3590;
                float _3598 = fma(_3592, _3592, _3596);
                float _3600 = fma(_3594, _3594, _3598);
                float _3602 = rsqrt(_3600);
                float _3604 = _3602 * 9.9999999747524270787835121154785e-07;
                float _3606 = _3592 * _3604;
                float _3608 = _3590 * _3604;
                float _3610 = _3594 * _3604;
                _332 = as_type<int>(_3606);
                _334 = as_type<int>(_3608);
                _336 = as_type<int>(_3610);
                _3564 = true;
            }
            else
            {
                bool _3612 = _3542 >= 9.9999999747524270787835121154785e-07;
                bool _3614 = isnan(_3542);
                bool _3616 = _3612 || _3614;
                bool _3618 = isnan(9.9999999747524270787835121154785e-07);
                bool _3620 = _3616 || _3618;
                if (!_3620)
                {
                    float _3622 = _3482 * _3482;
                    float _3624 = fma(_1108, _1108, _3622);
                    float _3626 = fma(_1110, _1110, _3624);
                    float _3628 = sqrt(_3626);
                    bool _3630 = _3628 >= 9.9999999747524270787835121154785e-07;
                    bool _3632 = isnan(_3628);
                    bool _3634 = _3630 || _3632;
                    bool _3636 = isnan(9.9999999747524270787835121154785e-07);
                    bool _3638 = _3634 || _3636;
                    float _3640 = _3628;
                    if (_3638)
                    {
                        float _3642 = rsqrt(_3626);
                        _3640 = _3642;
                    }
                    float _3644 = _3640;
                    if (!_3638)
                    {
                        _320 = 0;
                    }
                    int _3646 = _320;
                    int _3648 = _3646;
                    if (!_3638)
                    {
                        _322 = 897988541;
                    }
                    int _3650 = _322;
                    int _3652 = _3650;
                    if (!_3638)
                    {
                        _324 = 0;
                    }
                    int _3654 = _324;
                    float _3656 = _3644;
                    int _3658 = _3654;
                    if (_3638)
                    {
                        float _3660 = _3644 * 9.9999999747524270787835121154785e-07;
                        _3656 = _3660;
                    }
                    float _3662 = _3656;
                    if (_3638)
                    {
                        float _3664 = _1108 * _3662;
                        _3648 = as_type<int>(_3664);
                    }
                    int _3666 = _3648;
                    _332 = _3666;
                    if (_3638)
                    {
                        float _3668 = _3482 * _3662;
                        _3652 = as_type<int>(_3668);
                    }
                    int _3670 = _3652;
                    _334 = _3670;
                    if (_3638)
                    {
                        float _3672 = _1110 * _3662;
                        _3658 = as_type<int>(_3672);
                    }
                    int _3674 = _3658;
                    _336 = _3674;
                    _3564 = true;
                }
                else
                {
                    float _3676 = rsqrt(_3538);
                    float _3678 = _3676 * 9.9999999747524270787835121154785e-07;
                    float _3680 = _3484 * _3678;
                    float _3682 = _3486 * _3678;
                    float _3684 = _3488 * _3678;
                    _332 = as_type<int>(_3680);
                    _334 = as_type<int>(_3682);
                    _336 = as_type<int>(_3684);
                    _3564 = true;
                }
            }
        }
    }
    else
    {
        float _3686 = _3542 * _3526;
        bool _3688 = _3686 >= 0.001000000047497451305389404296875;
        bool _3690 = isnan(_3686);
        bool _3692 = _3688 || _3690;
        bool _3694 = isnan(0.001000000047497451305389404296875);
        bool _3696 = _3692 || _3694;
        bool _3698 = _3686 > 0.0;
        bool _3700 = !_3696;
        bool _3702 = _3698 && _3700;
        bool _3704 = _3540 < 0.001000000047497451305389404296875;
        bool _3706 = _3704 && _3702;
        if (!_3706)
        {
            _326 = as_type<int>(_3498);
        }
        int _3708 = _326;
        int _3710 = _3708;
        if (_3706)
        {
            float _3712 = _3526 * _3484;
            _3710 = as_type<int>(_3712);
        }
        int _3714 = _3710;
        _332 = _3714;
        if (!_3706)
        {
            _328 = as_type<int>(_3502);
        }
        int _3716 = _328;
        int _3718 = _3716;
        if (_3706)
        {
            float _3720 = _3526 * _3486;
            _3718 = as_type<int>(_3720);
        }
        int _3722 = _3718;
        _334 = _3722;
        if (!_3706)
        {
            _330 = as_type<int>(_3508);
        }
        int _3724 = _330;
        _336 = _3724;
        if (_3706)
        {
            float _3726 = _3526 * _3488;
            _336 = as_type<int>(_3726);
        }
    }
    _3564 = false;
    int _3728 = _332;
    int _3730 = _334;
    int _3732 = _336;
    uint _3734 = uint(int(uint(_170) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3734)] = uint(_3728);
    uint _3736 = uint(int(uint(_3490) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3736)] = uint(_3730);
    uint _3738 = uint(int(uint(_3492) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3738)] = uint(_3732);
}

