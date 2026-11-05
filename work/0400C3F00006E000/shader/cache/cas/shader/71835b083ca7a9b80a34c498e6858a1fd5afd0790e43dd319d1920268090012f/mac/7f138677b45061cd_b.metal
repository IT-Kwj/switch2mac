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
    texture2d<float> cp_t_tcb_2A [[id(20)]];
    sampler cp_t_tcb_2ASmplr [[id(21)]];
    texture2d<float> cp_t_tcb_22 [[id(22)]];
    sampler cp_t_tcb_22Smplr [[id(23)]];
    sampler cp_t_tcb_2CSmplr_w [[id(24)]];
    sampler cp_t_tcb_14Smplr_w [[id(25)]];
    sampler cp_t_tcb_2ASmplr_w [[id(26)]];
    sampler cp_t_tcb_22Smplr_w [[id(27)]];
    constant dm_border_t* dm_border [[id(28)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2902 = false;
    bool _818 = false;
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _84 = as_type<float>(gl_LocalInvocationID.x);
    float _86 = as_type<float>(gl_WorkGroupID.x);
    int _89 = as_type<int>(_86) << 5;
    int _91 = _89 + as_type<int>(_84);
    float _93 = trunc(_82);
    int _95 = int(_93);
    bool _99 = _91 >= _95;
    int _101 = 0;
    if (_99)
    {
        _101 = 0;
    }
    int _103 = _101;
    int _105 = _103;
    int _107 = _103;
    if (!_99)
    {
        int _109 = _91 << 4;
        int _111 = _109 + 12;
        uint _114 = uint(int(uint(_111) >> uint(2)));
        float _116 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_114)]);
        float _118 = trunc(_116);
        int _120 = int(_118);
        bool _122 = _120 >= 1;
        int _124 = _122 ? (-1) : 0;
        if (!_122)
        {
            _105 = 0;
        }
        int _126 = _105;
        bool _128 = !_122;
        _107 = _126;
        if (!_128)
        {
            float _130 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _132 = uint(int(uint(_111) >> uint(2)));
            float _134 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_132)]);
            float _136 = float(_120);
            float _138 = -_134;
            float _140 = _130 + _138;
            bool _142 = _140 > _136;
            int _144 = as_type<int>(_130);
            if (!_142)
            {
                bool _146 = _130 >= _134;
                bool _148 = isnan(_130);
                bool _150 = _146 || _148;
                bool _152 = isnan(_134);
                bool _154 = _150 || _152;
                _124 = _154 ? (-1) : 0;
            }
            int _156 = _124;
            if (_142)
            {
                _144 = 0;
            }
            int _158 = _144;
            _107 = _158;
            if (!_142)
            {
                int _160 = ~_156;
                int _162 = (_160 != 0) ? 0 : 1;
                _107 = _162;
            }
        }
    }
    int _164 = _107;
    int _166 = _164 & 1;
    bool _168 = _166 != 0;
    if (!_168)
    {
        return;
    }
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _172 = _91 << 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_174)]);
    int _178 = _172 + 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    int _184 = _172 + 8;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_186)]);
    int _190 = as_type<int>(_170) & 512;
    bool _192 = _190 != 0;
    int _194 = _172 + 12;
    uint _196 = uint(int(uint(_172) >> uint(2)));
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_196)]);
    int _200 = _172 + 4;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    int _206 = _172 + 8;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_208)]);
    uint _212 = uint(int(uint(_172) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_212)]);
    int _216 = _172 + 4;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    int _222 = _172 + 8;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_224)]);
    float _228 = 0.0;
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = _170;
    if (_192)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _228 = _236;
        _230 = _238;
        _232 = _240;
    }
    float _242 = _228;
    float _244 = _230;
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    float _252 = 0.0;
    if (_192)
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
    if (_192)
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
    uint _284 = uint(int(uint(_172) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_284)]);
    uint _288 = uint(int(uint(_194) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_288)]);
    uint _292 = uint(int(uint(_194) >> uint(2)));
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
    float _314 = _198;
    float _316 = _204;
    float _318 = _210;
    int _320 = as_type<int>(_214);
    int _322 = as_type<int>(_220);
    int _324 = as_type<int>(_226);
    int _326 = as_type<int>(_214);
    int _328 = as_type<int>(_220);
    int _330 = as_type<int>(_226);
    int _332 = as_type<int>(_214);
    int _334 = as_type<int>(_220);
    int _336 = as_type<int>(_226);
    if (!_192)
    {
        int _338 = _172 + 4;
        uint _340 = uint(int(uint(_172) >> uint(2)));
        float _342 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_340)]);
        int _344 = _172 + 8;
        uint _346 = uint(int(uint(_172) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_346)]);
        uint _350 = uint(int(uint(_338) >> uint(2)));
        float _352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_350)]);
        uint _354 = uint(int(uint(_344) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_354)]);
        uint _358 = uint(int(uint(_338) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_358)]);
        uint _362 = uint(int(uint(_172) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_362)]);
        uint _366 = uint(int(uint(_344) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_366)]);
        uint _370 = uint(int(uint(_338) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        uint _374 = uint(int(uint(_344) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_374)]);
        float _378 = _342 * _342;
        float _380 = fma(_348, _348, _378);
        float _382 = _352 * _352;
        float _384 = _356 * _356;
        float _386 = fma(_360, _360, _382);
        float _388 = fma(_364, _364, _380);
        float _390 = fma(_368, _368, _384);
        float _392 = fma(_372, _372, _386);
        float _394 = sqrt(_388);
        float _396 = fma(_376, _376, _390);
        float _398 = sqrt(_392);
        float _400 = sqrt(_396);
        bool _402 = _394 > 0.0;
        bool _404 = _398 > 0.0;
        bool _406 = _400 > 0.0;
        float _408 = _384;
        float _410 = _386;
        float _412 = _390;
        float _414 = _394;
        float _416 = _398;
        float _418 = _400;
        float _420 = _388;
        float _422 = _352;
        float _424 = _364;
        float _426 = _392;
        if (_402)
        {
            float _428 = rsqrt(_388);
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
            float _448 = _364 * _430;
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
            float _506 = _368 * _442;
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
    uint _558 = uint(int(uint(_194) >> uint(2)));
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_558)]);
    bool _562 = _532 > 0.0;
    float _564 = abs(_530);
    float _566 = log2(_564);
    bool _568 = _534 > 0.0;
    float _570 = 0.0;
    float _572 = _536;
    float _574 = _532;
    float _576 = _540;
    bool _578 = _568;
    float _580 = _548;
    float _582 = _550;
    float _584 = _552;
    float _586 = _554;
    float _588 = _556;
    if (_562)
    {
        float _590 = 1.0 / _532;
        _570 = _590;
    }
    float _592 = _570;
    float _594 = _536 * _534;
    float _596 = -_294;
    float _598 = _538 + _596;
    float _600 = _542 * _546;
    float _602 = _598;
    if (_568)
    {
        float _604 = -_594;
        float _606 = fma(_286, _604, _536);
        _572 = _606;
    }
    float _608 = _572;
    float _610 = _548 * _566;
    float _612 = _540 * _546;
    float _614 = _544 * _546;
    float _616 = _600 * _512;
    float _618 = _600 * _514;
    float _620 = _608;
    float _622 = _614;
    if (_562)
    {
        float _624 = _598 * _592;
        _574 = _624;
    }
    float _626 = _574;
    float _628 = exp2(_610);
    float _630 = _600 * _516;
    float _632 = fma(_612, _518, _616);
    float _634 = fma(_612, _520, _618);
    float _636 = _634;
    if (_562)
    {
        float _638 = precise::min(_626, 1.0);
        _576 = _638;
    }
    float _640 = _576;
    float _642 = fma(_612, _522, _630);
    float _644 = fma(_614, _524, _632);
    float _646 = fma(_614, _526, _634);
    if (_562)
    {
        float _648 = _640 * _608;
        _620 = _648;
    }
    float _650 = _620;
    float _652 = fma(_614, _528, _642);
    float _654 = _548 * _644;
    float _656 = _548 * _646;
    float _658 = _290 * _548;
    float _660 = _548 * _650;
    float _662 = _548 * _652;
    float _664 = fma(_198, _628, _654);
    float _666 = fma(_204, _628, _656);
    float _668 = fma(_198, _658, _176);
    float _670 = fma(_204, _658, _182);
    float _672 = _550 * _660;
    float _674 = _552 * _660;
    float _676 = fma(_210, _658, _188);
    float _678 = fma(_210, _628, _662);
    float _680 = _554 * _660;
    bool _682 = !_192;
    float _684 = _662;
    float _686 = _672;
    float _688 = _680;
    float _690 = _560;
    float _692 = _666;
    float _814;
    float _816;
    if (!_682)
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
        float _786 = _672 * _774;
        float _788 = _674 * _780;
        float _790 = _674 * _782;
        float _792 = _772 * _774;
        float _794 = _674 * _784;
        float _796 = _778 * _774;
        float _798 = _768 * _774;
        float _800 = fma(_724, _786, _788);
        float _802 = fma(_672, _792, _790);
        float _804 = _740 * _774;
        float _806 = fma(_728, _786, _794);
        float _808 = fma(_680, _796, _800);
        float _810 = fma(_680, _798, _802);
        float _812 = fma(_680, _804, _806);
        _314 = _798;
        _316 = _802;
        _318 = _800;
        _622 = _806;
        _580 = _706;
        _234 = _708;
        _636 = _710;
        _814 = _774;
        _582 = _786;
        _584 = _702;
        _586 = _704;
        _588 = _712;
        _816 = _810;
        _686 = _808;
        _688 = _812;
        _818 = true;
    }
    else
    {
        int _820 = as_type<int>(_170) & 1024;
        bool _822 = _820 != 0;
        if (_822)
        {
            _578 = true;
        }
        bool _824 = _578;
        bool _826 = _824;
        if (!_822)
        {
            int _828 = as_type<int>(_170) & 2048;
            bool _830 = _828 != 0;
            _826 = _830;
        }
        bool _832 = _826;
        if (!_832)
        {
            _684 = _674;
        }
        float _834 = _684;
        bool _836 = !_832;
        _814 = 0.0;
        _816 = _834;
        if (!_836)
        {
            uint _838 = uint(int(uint(_172) >> uint(2)));
            float _840 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_838)]);
            int _842 = _172 + 4;
            uint _844 = uint(int(uint(_842) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_844)]);
            int _848 = _172 + 8;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            uint _854 = uint(int(uint(_172) >> uint(2)));
            float _856 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_854)]);
            int _858 = _172 + 4;
            uint _860 = uint(int(uint(_858) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_860)]);
            int _864 = _172 + 8;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            uint _870 = uint(int(uint(_172) >> uint(2)));
            float _872 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_870)]);
            int _874 = _172 + 4;
            uint _876 = uint(int(uint(_874) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_876)]);
            int _880 = _172 + 8;
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
            float _960 = _672 * _948;
            float _962 = _674 * _954;
            float _964 = _674 * _956;
            float _966 = _946 * _948;
            float _968 = _674 * _958;
            float _970 = _952 * _948;
            float _972 = _942 * _948;
            float _974 = fma(_898, _960, _962);
            float _976 = fma(_672, _966, _964);
            float _978 = _914 * _948;
            float _980 = fma(_902, _960, _968);
            float _982 = fma(_680, _970, _974);
            float _984 = fma(_680, _972, _976);
            float _986 = fma(_680, _978, _980);
            _314 = _972;
            _316 = _976;
            _318 = _974;
            _622 = _980;
            _580 = _872;
            _234 = _878;
            _636 = _884;
            _814 = _948;
            _582 = _960;
            _584 = _862;
            _586 = _868;
            _588 = _886;
            _816 = _984;
            _686 = _982;
            _688 = _986;
        }
    }
    _818 = false;
    float _988 = _314;
    float _990 = _316;
    float _992 = _318;
    float _994 = _622;
    float _996 = _580;
    float _998 = _234;
    float _1000 = _636;
    float _1002 = _814;
    float _1004 = _582;
    float _1006 = _584;
    float _1008 = _586;
    float _1010 = _588;
    float _1012 = _816;
    float _1014 = _686;
    float _1016 = _688;
    uint _1018 = uint(int(uint(_194) >> uint(2)));
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
    float _1106 = _670 + _1012;
    float _1108 = _668 + _1014;
    float _1110 = _676 + _1016;
    float _1112 = _1106;
    if (!_1024)
    {
        _1038 = 0.0;
    }
    float _1114 = _1038;
    float _1116 = 0.0;
    float _1118 = _1114;
    if (!_1024)
    {
        _1116 = 0.0;
    }
    float _1120 = _1116;
    int _1122 = as_type<int>(_1020) & 2048;
    bool _1124 = _1122 != 0;
    float _1126 = _1050;
    float _1128 = _1054;
    float _1130 = _1120;
    if (_1024)
    {
        float _1132 = _1106 * _1052;
        _1040 = _1132;
    }
    float _1134 = _1040;
    float _1136 = _1076;
    float _1138 = _1100;
    float _1140 = _1098;
    float _1142 = _1078;
    if (_1024)
    {
        float _1144 = _1106 * _1076;
        _1136 = _1144;
    }
    float _1146 = _1136;
    float _1148 = _1146;
    if (_1024)
    {
        float _1150 = fma(_1108, _1050, _1134);
        _1126 = _1150;
    }
    float _1152 = _1126;
    float _1154 = _1152;
    if (_1024)
    {
        float _1156 = _1106 * _1100;
        _1138 = _1156;
    }
    float _1158 = _1138;
    if (_1024)
    {
        float _1160 = fma(_1108, _1074, _1146);
        _1148 = _1160;
    }
    float _1162 = _1148;
    if (_1024)
    {
        float _1164 = fma(_1110, _1054, _1152);
        _1154 = _1164;
    }
    float _1166 = _1154;
    if (!_1024)
    {
        _1128 = 0.0;
    }
    float _1168 = _1128;
    float _1170 = _1168;
    if (_1024)
    {
        float _1172 = fma(_1108, _1098, _1158);
        _1140 = _1172;
    }
    float _1174 = _1140;
    float _1176 = _1174;
    if (_1024)
    {
        float _1178 = fma(_1110, _1078, _1162);
        _1142 = _1178;
    }
    float _1180 = _1142;
    if (_1024)
    {
        float _1182 = _1056 + _1166;
        _1118 = _1182;
    }
    float _1184 = _1118;
    float _1186 = _1184;
    if (_1024)
    {
        float _1188 = fma(_1110, _1102, _1174);
        _1176 = _1188;
    }
    float _1190 = _1176;
    if (_1024)
    {
        float _1192 = _1080 + _1180;
        _1170 = _1192;
    }
    float _1194 = _1170;
    float _1196 = _1194;
    if (_1024)
    {
        float _1198 = _1104 + _1190;
        _1130 = _1198;
    }
    float _1200 = _1130;
    bool _1202 = !_1028;
    float _1204 = _1200;
    if (!_1202)
    {
        float _1206 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1208 = uint(int(uint(_172) >> uint(2)));
        float _1210 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1208)]);
        int _1212 = _172 + 4;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1214)]);
        int _1218 = _172 + 8;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1220)]);
        uint _1224 = uint(int(uint(_172) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1224)]);
        int _1228 = _172 + 4;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1230)]);
        int _1234 = _172 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        float _1238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1236)]);
        uint _1240 = uint(int(uint(_172) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1240)]);
        int _1244 = _172 + 4;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1246)]);
        int _1250 = _172 + 8;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        float _1254 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1252)]);
        float _1256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1260 = _1106 * _1216;
        float _1262 = _1106 * _1232;
        float _1264 = _1106 * _1248;
        float _1266 = fma(_1108, _1210, _1260);
        float _1268 = fma(_1108, _1226, _1262);
        float _1270 = fma(_1108, _1242, _1264);
        float _1272 = fma(_1110, _1222, _1266);
        float _1274 = fma(_1110, _1238, _1268);
        float _1276 = fma(_1110, _1254, _1270);
        float _1278 = _1206 + _1272;
        float _1280 = _1256 + _1274;
        float _1282 = _1258 + _1276;
        _1196 = _1280;
        _1186 = _1278;
        _1204 = _1282;
    }
    float _1284 = _1196;
    float _1286 = _1186;
    float _1288 = _1204;
    bool _1290 = !_1124;
    float _1292 = _1284;
    float _1294 = _1286;
    float _1296 = _1288;
    if (!_1290)
    {
        uint _1298 = uint(int(uint(_172) >> uint(2)));
        float _1300 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1298)]);
        int _1302 = _172 + 4;
        uint _1304 = uint(int(uint(_1302) >> uint(2)));
        float _1306 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1304)]);
        int _1308 = _172 + 8;
        uint _1310 = uint(int(uint(_1308) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1310)]);
        int _1314 = _172 + 12;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        float _1318 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1316)]);
        uint _1320 = uint(int(uint(_172) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1320)]);
        int _1324 = _172 + 4;
        uint _1326 = uint(int(uint(_1324) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1326)]);
        int _1330 = _172 + 8;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1332)]);
        int _1336 = _172 + 12;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        float _1340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1338)]);
        uint _1342 = uint(int(uint(_172) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1342)]);
        int _1346 = _172 + 4;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1348)]);
        int _1352 = _172 + 8;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        float _1356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1354)]);
        int _1358 = _172 + 12;
        uint _1360 = uint(int(uint(_1358) >> uint(2)));
        float _1362 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1360)]);
        float _1364 = _1106 * _1306;
        float _1366 = _1106 * _1328;
        float _1368 = _1106 * _1350;
        float _1370 = fma(_1108, _1300, _1364);
        float _1372 = fma(_1108, _1322, _1366);
        float _1374 = fma(_1108, _1344, _1368);
        float _1376 = fma(_1110, _1312, _1370);
        float _1378 = fma(_1110, _1334, _1372);
        float _1380 = fma(_1110, _1356, _1374);
        float _1382 = _1376 + _1318;
        float _1384 = _1378 + _1340;
        float _1386 = _1380 + _1362;
        _1292 = _1384;
        _1294 = _1382;
        _1296 = _1386;
    }
    float _1388 = _1292;
    float _1390 = _1294;
    float _1392 = _1296;
    float _1394 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1396 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1398 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1400 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1402 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1420 = _1394 + 1.0;
    float _1422 = _1420 + _1388;
    float _1424 = _1422 * _1406;
    float _1426 = fma(_1404, _1390, _1424);
    float _1428 = fma(_1408, _1392, _1426);
    float _1430 = _1410 + _1428;
    float _1432 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1434 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1436 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1438 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1440 = trunc(_1430);
    int _1442 = int(_1440);
    int _1444 = ~as_type<int>(_1412);
    int _1446 = _1442 + _1444;
    int _1448 = _1446 + 1;
    bool _1450 = _1448 >= 0;
    int _1452 = 0;
    float _1454 = _1392;
    float _1456 = _1422;
    float _1458 = _1390;
    if (_1450)
    {
        float _1460 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1452 = as_type<int>(_1460);
    }
    int _1462 = _1452;
    float _1464 = fma(_1390, 6.2500002968590706586837768554688e-05, 0.5);
    float _1466 = fma(_1392, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5190 = float2(_1464, _1466);
    float _1468 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5190, float2(0.0), isnan(_5190)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5190, float2(0.0), isnan(_5190)), level(0.0)).x;
    float _1470 = _1398 * _1388;
    float _1472 = fma(_1396, _1390, _1470);
    float _1474 = fma(_1400, _1392, _1472);
    float _1476 = _1402 + _1474;
    float _1478 = -_1476;
    bool _1480 = _1414 >= _1478;
    bool _1482 = isnan(_1414);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(_1478);
    bool _1488 = _1484 || _1486;
    float _1490 = -_1476;
    bool _1492 = _1416 >= _1490;
    bool _1494 = isnan(_1416);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(_1490);
    bool _1500 = _1496 || _1498;
    int _1502 = _1488 ? 0 : 1;
    int _1504 = 2;
    if (_1488)
    {
        _1504 = 1;
    }
    int _1506 = _1504;
    int _1508 = _1506;
    if (_1500)
    {
        _1508 = _1502;
    }
    int _1510 = _1508;
    int _1512 = _1510 << 6;
    int _1514 = _1512 + 96;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    float _1518 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1516)]);
    int _1520 = _1514 + 4;
    uint _1522 = uint(int(uint(_1520) >> uint(2)));
    float _1524 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1522)]);
    int _1526 = _1514 + 8;
    uint _1528 = uint(int(uint(_1526) >> uint(2)));
    float _1530 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1528)]);
    int _1532 = _1514 + 12;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    float _1536 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1534)]);
    int _1538 = _1512 + 48;
    int _1540 = _1512 + 64;
    uint _1542 = uint(int(uint(_1538) >> uint(2)));
    float _1544 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1542)]);
    int _1546 = _1538 + 4;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    float _1550 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1548)]);
    int _1552 = _1538 + 8;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    float _1556 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1554)]);
    int _1558 = _1538 + 12;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    float _1562 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1560)]);
    uint _1564 = uint(int(uint(_1540) >> uint(2)));
    float _1566 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1564)]);
    int _1568 = _1540 + 4;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1570)]);
    int _1574 = _1540 + 8;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    int _1580 = _1540 + 12;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    float _1586 = _1422 * _1434;
    float _1588 = fma(_1432, _1390, _1586);
    float _1590 = fma(_1436, _1392, _1588);
    float _1592 = _1438 + _1590;
    float _1594 = trunc(_1592);
    int _1596 = int(_1594);
    bool _1598 = _1462 <= _1448;
    bool _1600 = !_1450;
    bool _1602 = _1598 || _1600;
    int _1604 = ~as_type<int>(_1418);
    int _1606 = _1596 + _1604;
    int _1608 = _1606 + 1;
    bool _1610 = _1608 < 0;
    bool _1612 = _1610 || _1602;
    int _1614 = _1512 + 80;
    uint _1616 = uint(int(uint(_1614) >> uint(2)));
    float _1618 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1616)]);
    int _1620 = _1614 + 4;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    float _1624 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1622)]);
    int _1626 = _1614 + 8;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    float _1630 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1628)]);
    int _1632 = _1614 + 12;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1634)]);
    int _1638 = as_type<int>(_1418);
    if (!_1612)
    {
        float _1640 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1638 = as_type<int>(_1640);
    }
    int _1642 = _1638;
    float _1644 = _1422 * _1524;
    float _1646 = fma(_1518, _1390, _1644);
    float _1648 = fma(_1530, _1392, _1646);
    float _1650 = _1536 + _1648;
    float _1652 = _1422 * _1550;
    float _1654 = 1.0 / _1650;
    float _1656 = fma(_1544, _1390, _1652);
    float _1658 = _1422 * _1572;
    float _1660 = fma(_1556, _1392, _1656);
    float _1662 = fma(_1566, _1390, _1658);
    float _1664 = _1562 + _1660;
    float _1666 = fma(_1578, _1392, _1662);
    float _1668 = _1664 * _1654;
    float _1670 = _1584 + _1666;
    bool _1672 = _1668 >= 0.0;
    float _1674 = _1670 * _1654;
    bool _1676 = _1668 <= 1.0;
    bool _1678 = _1676 && _1672;
    bool _1680 = _1674 >= 0.0;
    bool _1682 = _1680 && _1678;
    bool _1684 = _1674 <= 1.0;
    bool _1686 = _1684 && _1682;
    bool _1688 = _598 > 0.001000000047497451305389404296875;
    bool _1690 = isnan(_598);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan(0.001000000047497451305389404296875);
    bool _1696 = _1692 || _1694;
    float _1698 = _1518;
    float _1700 = _1662;
    float _1702 = _1584;
    float _1704 = _1566;
    float _1706 = _1544;
    if (_1686)
    {
        float _1708 = float(_1510);
        _1698 = _1708;
    }
    float _1710 = _1698;
    float _1712 = _1422 * _1624;
    bool _1714 = _1642 <= _1608;
    bool _1716 = _1714 || _1612;
    float _1718 = fma(_1618, _1390, _1712);
    float _1720 = fma(_1630, _1392, _1718);
    float _1722 = _1636 + _1720;
    float _1724 = _1618;
    float _1726 = _1720;
    float _1728 = _1636;
    if (_1716)
    {
        _602 = 1.0;
    }
    float _1730 = _602;
    float _1732 = _1730;
    if (!_1716)
    {
        float _1734 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1736 = _1608 * as_type<int>(_1734);
        int _1738 = _1736 + _1448;
        int _1740 = _1738 << 2;
        uint _1742 = uint(int(uint(_1738) >> uint(2)));
        int _1744 = 12 & _1740;
        int _1746 = int(_1742) << 4;
        int _1748 = _1746 + _1744;
        int _1750 = _1748 + 400;
        uint _1752 = uint(int(uint(_1750) >> uint(2)));
        float _1754 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1752)]);
        float _1756 = floor(_1592);
        float _1758 = floor(_1430);
        float _1760 = -_1756;
        float _1762 = _1592 + _1760;
        float _1764 = -_1758;
        float _1766 = _1430 + _1764;
        float _1768 = rint(_1754);
        float _1770 = precise::max(_1768, 0.0);
        uint _1772 = uint(_1770);
        uint _1774 = clamp(_1772, 0u, 65535u);
        float3 _5657 = float3(_1766, _1762, float(int(_1774)));
        float3 _5661 = select(_5657, float3(0.0), isnan(_5657));
        float _1776 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5661.xy, uint(rint(_5661.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5661.xy, uint(rint(_5661.z)), level(0.0)).x;
        int _1778 = _1738 << 4;
        int _1780 = _1778 + 2048;
        uint _1782 = uint(int(uint(_1780) >> uint(2)));
        float _1784 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1782)]);
        int _1786 = _1780 + 4;
        uint _1788 = uint(int(uint(_1786) >> uint(2)));
        float _1790 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1788)]);
        int _1792 = _1780 + 8;
        uint _1794 = uint(int(uint(_1792) >> uint(2)));
        float _1796 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1794)]);
        int _1798 = _1780 + 12;
        uint _1800 = uint(int(uint(_1798) >> uint(2)));
        float _1802 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1800)]);
        float _1804 = _1422 * _1790;
        float _1806 = fma(_1784, _1390, _1804);
        float _1808 = fma(_1796, _1392, _1806);
        float _1810 = _1802 + _1808;
        float _1812 = precise::clamp(_1810, 0.0, 1.0);
        float _1814 = -_1812;
        float _1816 = _1814 + _1776;
        float _1818 = fma(_1816, 500.0, 1.5);
        float _1820 = exp2(_1818);
        float _1822 = 0.0 + _1820;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        _1700 = _1776;
        _1702 = _1766;
        _1724 = _1784;
        _1726 = _1820;
        _1728 = _1802;
        _1704 = _1754;
        _1732 = _1824;
    }
    float _1826 = _1700;
    float _1828 = _1702;
    float _1830 = _1724;
    float _1832 = _1726;
    float _1834 = _1728;
    float _1836 = _1704;
    float _1838 = _1732;
    float _1840 = _1710;
    float _1842 = _1830;
    float _1844 = _1826;
    float _1846 = _1836;
    if (_1686)
    {
        float _1848 = rint(_1710);
        float _1850 = precise::max(_1848, 0.0);
        uint _1852 = uint(_1850);
        uint _1854 = clamp(_1852, 0u, 65535u);
        _1840 = as_type<float>(_1854);
    }
    float _1856 = _1840;
    float _1858 = _1722 * _1654;
    bool _1860 = _1468 != 0.0;
    bool _1862 = isnan(_1468);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    uint _1870 = uint(int(uint(_172) >> uint(2)));
    float _1872 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1870)]);
    if (!_1696)
    {
        float _1874 = fma(_1390, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1842 = _1874;
    }
    float _1876 = _1842;
    float _1878 = _1674;
    float _1880 = _1856;
    float _1882 = _1876;
    float _1884 = _1876;
    if (_1686)
    {
        float3 _5813 = float3(_1668, _1674, float(as_type<int>(_1856)));
        float3 _5815 = select(_5813, float3(0.0), isnan(_5813));
        float _1886 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5815.xy, uint(rint(_5815.z)), _1858, level(0.0));
        _1878 = _1886;
    }
    float _1888 = _1878;
    if (!_1868)
    {
        _1844 = 4.0;
    }
    float _1890 = _1844;
    float _1892 = _1890;
    float _1894 = _1890;
    if (!_1686)
    {
        _1846 = 1.0;
    }
    float _1896 = _1846;
    float _1898 = _1468;
    float _1900 = _1896;
    if (!_1868)
    {
        float2 _5842 = float2(_1464, _1466);
        float _1902 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5842, float2(0.0), isnan(_5842)), level(_1890)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5842, float2(0.0), isnan(_5842)), level(_1890)).x;
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1828;
    if (!_1696)
    {
        float2 _5858 = float2(_1876, _1466);
        float _1908 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5858, float2(0.0), isnan(_5858)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5858, float2(0.0), isnan(_5858)), level(0.0)).x;
        _1906 = _1908;
    }
    float _1910 = _1906;
    float _1912 = _1832;
    float _1914 = _1834;
    if (!_1696)
    {
        float2 _5874 = float2(_1464, _1466);
        float2 _1918 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5874, float2(0.0), isnan(_5874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5874, float2(0.0), isnan(_5874)), level(0.0)).xy;
        float _1920 = _1918.x;
        float _1922 = _1918.y;
        _1912 = _1920;
        _1914 = _1922;
    }
    float _1924 = _1912;
    float _1926 = _1914;
    float _1928 = _1910;
    float _1930 = _1924;
    float _1932 = _1926;
    float _1934 = _1872;
    float _1936 = _1910;
    if (_1686)
    {
        bool _1938 = _1888 >= _1858;
        bool _1940 = isnan(_1888);
        bool _1942 = _1938 || _1940;
        bool _1944 = isnan(_1858);
        bool _1946 = _1942 || _1944;
        float _1948 = float(_1946);
        _1900 = _1948;
    }
    float _1950 = _1900;
    float _1952 = -_1950;
    float _1954 = fma(_1952, _1838, 1.0);
    float _1956 = -_1872;
    float _1958 = _1954 + _1956;
    float _1960 = _1954;
    float _1962 = _1950;
    if (_1696)
    {
        float _1964 = fma(_1958, 0.0500000007450580596923828125, _1872);
        _1960 = _1964;
    }
    float _1966 = _1960;
    float _1968 = precise::max(0.0, _1966);
    float _1970 = precise::min(_1968, 0.999000012874603271484375);
    uint _1972 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1972)] = as_type<uint>(_1970);
    float _1974 = _1668;
    float _1976 = _1970;
    if (!_1696)
    {
        float _1978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1974 = _1978;
    }
    float _1980 = _1974;
    int _1982 = _172 + 4;
    if (!_1696)
    {
        float _1984 = fma(_1904, 2000.0, _1980);
        _1880 = _1984;
    }
    float _1986 = _1880;
    float _1988 = _1986;
    if (!_1696)
    {
        uint _1990 = uint(int(uint(_1982) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1990)] = as_type<uint>(_1986);
    }
    float _1992 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _1994 = uint(int(uint(_1982) >> uint(2)));
    float _1996 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1994)]);
    float _1998 = fma(_1904, 2000.0, _1992);
    float _2000 = _1106 + _1996;
    bool _2002 = _2000 >= _1998;
    bool _2004 = isnan(_2000);
    bool _2006 = _2002 || _2004;
    bool _2008 = isnan(_1998);
    bool _2010 = _2006 || _2008;
    float _2012 = _1998;
    float _2014 = _2000;
    float _2016 = _1996;
    if (!_2010)
    {
        float _2018 = -_1996;
        float _2020 = _1998 + _2018;
        _2012 = _2020;
    }
    float _2022 = _2012;
    float _2024 = _2022;
    if (!_2010)
    {
        float _2026 = fma(_2022, 0.00999999977648258209228515625, _1996);
        _2024 = _2026;
    }
    float _2028 = _2024;
    float _2030 = _2028;
    if (!_2010)
    {
        uint _2032 = uint(int(uint(_1982) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_2032)] = as_type<uint>(_2028);
    }
    float _2034 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    if (_1696)
    {
        _1706 = _560;
    }
    float _2036 = _1706;
    float _2038 = _2036;
    int _2040 = as_type<int>(_2036);
    if (!_1696)
    {
        float _2042 = fma(_1390, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _2044 = fma(_1392, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _2046 = fma(_1392, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _6076 = float2(_2042, _1466);
        float _2048 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6076, float2(0.0), isnan(_6076)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6076, float2(0.0), isnan(_6076)), level(0.0)).x;
        float2 _6084 = float2(_1876, _2044);
        float _2050 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6084, float2(0.0), isnan(_6084)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6084, float2(0.0), isnan(_6084)), level(0.0)).x;
        float2 _6092 = float2(_1876, _2046);
        float _2052 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6092, float2(0.0), isnan(_6092)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6092, float2(0.0), isnan(_6092)), level(0.0)).x;
        float2 _6100 = float2(_1464, _2044);
        float _2054 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6100, float2(0.0), isnan(_6100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6100, float2(0.0), isnan(_6100)), level(0.0)).x;
        float2 _6108 = float2(_2042, _2044);
        float _2056 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6108, float2(0.0), isnan(_6108)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6108, float2(0.0), isnan(_6108)), level(0.0)).x;
        float2 _6116 = float2(_2042, _2046);
        float _2058 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6116, float2(0.0), isnan(_6116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6116, float2(0.0), isnan(_6116)), level(0.0)).x;
        float2 _6124 = float2(_1464, _2046);
        float _2060 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6124, float2(0.0), isnan(_6124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6124, float2(0.0), isnan(_6124)), level(0.0)).x;
        bool _2062 = _1910 != 0.0;
        bool _2064 = isnan(_1910);
        bool _2066 = _2062 || _2064;
        bool _2068 = isnan(0.0);
        bool _2070 = _2066 || _2068;
        float _2072 = _2054;
        float _2074 = _2042;
        float _2076 = _2058;
        float _2078 = _1466;
        if (_2070)
        {
            _1892 = _1910;
        }
        float _2080 = _1892;
        if (!_2070)
        {
            _1928 = 4.0;
        }
        float _2082 = _1928;
        bool _2084 = _1924 != 0.0;
        bool _2086 = isnan(_1924);
        bool _2088 = _2084 || _2086;
        bool _2090 = isnan(0.0);
        bool _2092 = _2088 || _2090;
        float _2094 = _2080;
        float _2096 = _2082;
        if (!_2070)
        {
            float2 _6173 = float2(_1876, _1466);
            float _2098 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6173, float2(0.0), isnan(_6173)), level(_2082)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6173, float2(0.0), isnan(_6173)), level(_2082)).x;
            _2094 = _2098;
        }
        float _2100 = _2094;
        bool _2102 = _2048 != 0.0;
        bool _2104 = isnan(_2048);
        bool _2106 = _2102 || _2104;
        bool _2108 = isnan(0.0);
        bool _2110 = _2106 || _2108;
        bool _2112 = _2050 != 0.0;
        bool _2114 = isnan(_2050);
        bool _2116 = _2112 || _2114;
        bool _2118 = isnan(0.0);
        bool _2120 = _2116 || _2118;
        bool _2122 = _2052 != 0.0;
        bool _2124 = isnan(_2052);
        bool _2126 = _2122 || _2124;
        bool _2128 = isnan(0.0);
        bool _2130 = _2126 || _2128;
        if (!_2110)
        {
            _2038 = 4.0;
        }
        float _2132 = _2038;
        float _2134 = _2132;
        if (!_2120)
        {
            _1454 = 4.0;
        }
        float _2136 = _1454;
        if (!_2130)
        {
            _1456 = 4.0;
        }
        float _2138 = _1456;
        float _2140 = _2048;
        if (!_2110)
        {
            float2 _6238 = float2(_2042, _1466);
            float _2142 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6238, float2(0.0), isnan(_6238)), level(_2132)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6238, float2(0.0), isnan(_6238)), level(_2132)).x;
            _2140 = _2142;
        }
        float _2144 = _2140;
        float _2146 = _2050;
        if (!_2120)
        {
            float2 _6254 = float2(_1876, _2044);
            float _2148 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6254, float2(0.0), isnan(_6254)), level(_2136)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6254, float2(0.0), isnan(_6254)), level(_2136)).x;
            _2146 = _2148;
        }
        float _2150 = _2146;
        float _2152 = _2052;
        if (!_2130)
        {
            float2 _6270 = float2(_1876, _2046);
            float _2154 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6270, float2(0.0), isnan(_6270)), level(_2138)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6270, float2(0.0), isnan(_6270)), level(_2138)).x;
            _2152 = _2154;
        }
        float _2156 = _2152;
        bool _2158 = _2054 != 0.0;
        bool _2160 = isnan(_2054);
        bool _2162 = _2158 || _2160;
        bool _2164 = isnan(0.0);
        bool _2166 = _2162 || _2164;
        bool _2168 = _2058 != 0.0;
        bool _2170 = isnan(_2058);
        bool _2172 = _2168 || _2170;
        bool _2174 = isnan(0.0);
        bool _2176 = _2172 || _2174;
        bool _2178 = _2056 != 0.0;
        bool _2180 = isnan(_2056);
        bool _2182 = _2178 || _2180;
        bool _2184 = isnan(0.0);
        bool _2186 = _2182 || _2184;
        bool _2188 = _2060 != 0.0;
        bool _2190 = isnan(_2060);
        bool _2192 = _2188 || _2190;
        bool _2194 = isnan(0.0);
        bool _2196 = _2192 || _2194;
        if (_2166)
        {
            _1882 = _2054;
        }
        float _2198 = _1882;
        if (_2176)
        {
            _2072 = _2058;
        }
        float _2200 = _2072;
        if (!_2186)
        {
            _2134 = 4.0;
        }
        float _2202 = _2134;
        if (!_2176)
        {
            _2074 = 4.0;
        }
        float _2204 = _2074;
        float _2206 = _2056;
        if (!_2186)
        {
            float2 _6350 = float2(_2042, _2044);
            float _2208 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6350, float2(0.0), isnan(_6350)), level(_2202)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6350, float2(0.0), isnan(_6350)), level(_2202)).x;
            _2206 = _2208;
        }
        float _2210 = _2206;
        if (!_2166)
        {
            _2096 = 4.0;
        }
        float _2212 = _2096;
        float _2214 = _2200;
        _1936 = _2212;
        if (!_2176)
        {
            float2 _6372 = float2(_2042, _2046);
            float _2216 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6372, float2(0.0), isnan(_6372)), level(_2204)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6372, float2(0.0), isnan(_6372)), level(_2204)).x;
            _2214 = _2216;
        }
        float _2218 = _2214;
        if (!_2196)
        {
            _2076 = 4.0;
        }
        float _2220 = _2076;
        float _2222 = _2198;
        _1934 = _2220;
        if (!_2166)
        {
            float2 _6394 = float2(_1464, _2044);
            float _2224 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6394, float2(0.0), isnan(_6394)), level(_2212)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6394, float2(0.0), isnan(_6394)), level(_2212)).x;
            _2222 = _2224;
        }
        float _2226 = _2222;
        if (!_2092)
        {
            _2078 = 4.0;
        }
        float _2228 = _2078;
        float _2230 = _2060;
        _1976 = _2228;
        if (!_2196)
        {
            float2 _6416 = float2(_1464, _2046);
            float _2232 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6416, float2(0.0), isnan(_6416)), level(_2220)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6416, float2(0.0), isnan(_6416)), level(_2220)).x;
            _2230 = _2232;
        }
        float _2234 = _2230;
        float _2236 = _1924;
        float _2238 = _1926;
        if (!_2092)
        {
            float2 _6433 = float2(_1464, _1466);
            float2 _2240 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6433, float2(0.0), isnan(_6433)), level(_2228)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6433, float2(0.0), isnan(_6433)), level(_2228)).xy;
            float _2242 = _2240.x;
            float _2244 = _2240.y;
            _2236 = _2242;
            _2238 = _2244;
        }
        float _2246 = _2236;
        float _2248 = _2238;
        float _2250 = -_2100;
        float _2252 = _1904 + _2250;
        float _2254 = -_2144;
        float _2256 = _1904 + _2254;
        float _2258 = -_2150;
        float _2260 = _1904 + _2258;
        float _2262 = -_2156;
        float _2264 = _1904 + _2262;
        float _2266 = abs(_2252);
        float _2268 = abs(_2256);
        float _2270 = precise::max(_2266, _2268);
        float _2272 = abs(_2260);
        float _2274 = abs(_2264);
        float _2276 = precise::max(_2272, _2274);
        float _2278 = -_2210;
        float _2280 = _1904 + _2278;
        float _2282 = -_2218;
        float _2284 = _1904 + _2282;
        float _2286 = -_2226;
        float _2288 = _1904 + _2286;
        float _2290 = abs(_2280);
        float _2292 = abs(_2284);
        float _2294 = precise::max(_2290, _2292);
        float _2296 = -_2234;
        float _2298 = _1904 + _2296;
        float _2300 = precise::max(_2276, _2294);
        float _2302 = abs(_2288);
        float _2304 = abs(_2298);
        float _2306 = precise::max(_2302, _2304);
        bool _2308 = _2300 > 0.00150000001303851604461669921875;
        float _2310 = precise::max(_2270, _2306);
        bool _2312 = _2310 > 0.00150000001303851604461669921875;
        bool _2314 = _2312 || _2308;
        bool _2316 = _2246 < _2248;
        bool _2318 = _2316 || _2314;
        bool _2320 = !_2318;
        int _2322 = _2320 ? as_type<int>(_560) : 0;
        _1988 = _2300;
        _2014 = _2276;
        _2030 = _2260;
        _2016 = _2310;
        _1884 = _2288;
        _1930 = _2246;
        _1932 = _2248;
        _1962 = _2270;
        _1894 = _2252;
        _1458 = _2284;
        _2040 = _2322;
    }
    float _2324 = _1988;
    float _2326 = _2014;
    float _2328 = _2030;
    float _2330 = _2016;
    float _2332 = _1884;
    float _2334 = _1976;
    float _2336 = _1930;
    float _2338 = _1932;
    float _2340 = _1962;
    float _2342 = _1894;
    float _2344 = _1934;
    float _2346 = _1936;
    float _2348 = _1458;
    int _2350 = _2040;
    int _2352 = as_type<int>(_2034) & 512;
    bool _2354 = _2352 != 0;
    int _2356 = as_type<int>(_2034) & 1024;
    bool _2358 = _2356 != 0;
    float _2360 = _2324;
    float _2362 = _2326;
    float _2364 = _2328;
    float _2366 = _2330;
    float _2368 = _2348;
    bool _2370 = _2354;
    int _2372 = _2350;
    if (_2354)
    {
        float _2374 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _2376 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _2378 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _2380 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _2360 = _2374;
        _2362 = _2376;
        _2364 = _2378;
        _2366 = _2380;
    }
    float _2382 = _2360;
    float _2384 = _2362;
    float _2386 = _2364;
    float _2388 = _2366;
    float _2390 = _2332;
    float _2392 = _2334;
    float _2394 = _2336;
    float _2396 = _2338;
    if (_2354)
    {
        float _2398 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _2400 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _2402 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _2404 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _2390 = _2398;
        _2392 = _2400;
        _2394 = _2402;
        _2396 = _2404;
    }
    float _2406 = _2390;
    float _2408 = _2392;
    float _2410 = _2394;
    float _2412 = _2396;
    float _2414 = _2340;
    float _2416 = _2342;
    float _2418 = _2344;
    float _2420 = _2346;
    if (_2354)
    {
        float _2422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2414 = _2422;
        _2416 = _2424;
        _2418 = _2426;
        _2420 = _2428;
    }
    float _2430 = _2414;
    float _2432 = _2416;
    float _2434 = _2418;
    float _2436 = _2420;
    if (!_2010)
    {
        float _2438 = _1106 * 0.9900000095367431640625;
        _1112 = _2438;
    }
    float _2440 = _1112;
    if (!_2354)
    {
        _2368 = 0.0;
    }
    float _2442 = _2368;
    int _2444 = as_type<int>(_2034) & 2048;
    bool _2446 = _2444 != 0;
    float _2448 = _2384;
    float _2450 = _2442;
    float _2452 = _2386;
    float _2454 = _2382;
    if (_2354)
    {
        float _2456 = _2384 * _2440;
        _2448 = _2456;
    }
    float _2458 = _2448;
    float _2460 = _2458;
    float _2462 = _2432;
    float _2464 = _2406;
    float _2466 = _2430;
    float _2468 = _2412;
    if (_2354)
    {
        float _2470 = _2408 * _2440;
        _690 = _2470;
    }
    float _2472 = _690;
    float _2474 = _2472;
    if (_2354)
    {
        float _2476 = fma(_1108, _2382, _2458);
        _2460 = _2476;
    }
    float _2478 = _2460;
    if (_2354)
    {
        float _2480 = _2432 * _2440;
        _2462 = _2480;
    }
    float _2482 = _2462;
    if (_2354)
    {
        float _2484 = fma(_1108, _2406, _2472);
        _2474 = _2484;
    }
    float _2486 = _2474;
    float _2488 = _2486;
    if (_2354)
    {
        float _2490 = fma(_1110, _2386, _2478);
        _2464 = _2490;
    }
    float _2492 = _2464;
    if (_2354)
    {
        float _2494 = fma(_1108, _2430, _2482);
        _2466 = _2494;
    }
    float _2496 = _2466;
    float _2498 = _2496;
    if (_2354)
    {
        float _2500 = fma(_1110, _2410, _2486);
        _2488 = _2500;
    }
    float _2502 = _2488;
    if (_2354)
    {
        float _2504 = _2388 + _2492;
        _2450 = _2504;
    }
    float _2506 = _2450;
    if (_2354)
    {
        float _2508 = fma(_1110, _2434, _2496);
        _2498 = _2508;
    }
    float _2510 = _2498;
    if (!_2354)
    {
        _2452 = 0.0;
    }
    float _2512 = _2452;
    float _2514 = _2512;
    if (_2354)
    {
        float _2516 = _2412 + _2502;
        _2514 = _2516;
    }
    float _2518 = _2514;
    float _2520 = _2518;
    if (!_2354)
    {
        _2454 = 0.0;
    }
    float _2522 = _2454;
    float _2524 = _2522;
    if (_2354)
    {
        float _2526 = _2436 + _2510;
        _2524 = _2526;
    }
    float _2528 = _2524;
    int _2530 = _172 + 8;
    float _2532 = _2528;
    if (!_2358)
    {
        _2468 = _2506;
    }
    float _2534 = _2468;
    bool _2536 = !_2358;
    float _2538 = _2534;
    if (!_2536)
    {
        float _2540 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        uint _2542 = uint(int(uint(_172) >> uint(2)));
        float _2544 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2542)]);
        int _2546 = _172 + 4;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        float _2550 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2548)]);
        int _2552 = _172 + 8;
        uint _2554 = uint(int(uint(_2552) >> uint(2)));
        float _2556 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2554)]);
        uint _2558 = uint(int(uint(_172) >> uint(2)));
        float _2560 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2558)]);
        int _2562 = _172 + 4;
        uint _2564 = uint(int(uint(_2562) >> uint(2)));
        float _2566 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2564)]);
        int _2568 = _172 + 8;
        uint _2570 = uint(int(uint(_2568) >> uint(2)));
        float _2572 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2570)]);
        uint _2574 = uint(int(uint(_172) >> uint(2)));
        float _2576 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2574)]);
        int _2578 = _172 + 4;
        uint _2580 = uint(int(uint(_2578) >> uint(2)));
        float _2582 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2580)]);
        int _2584 = _172 + 8;
        uint _2586 = uint(int(uint(_2584) >> uint(2)));
        float _2588 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2586)]);
        float _2590 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        float _2592 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2594 = _2550 * _2440;
        float _2596 = _2566 * _2440;
        float _2598 = fma(_1108, _2544, _2594);
        float _2600 = _2582 * _2440;
        float _2602 = fma(_1108, _2560, _2596);
        float _2604 = fma(_1108, _2576, _2600);
        float _2606 = fma(_1110, _2556, _2598);
        float _2608 = fma(_1110, _2572, _2602);
        float _2610 = fma(_1110, _2588, _2604);
        float _2612 = _2540 + _2606;
        float _2614 = _2590 + _2608;
        float _2616 = _2592 + _2610;
        _2538 = _2612;
        _2532 = _2616;
        _2520 = _2614;
    }
    float _2618 = _2538;
    float _2620 = _2532;
    float _2622 = _2520;
    bool _2624 = !_2446;
    float _2626 = _2622;
    float _2628 = _2620;
    float _2630 = _2618;
    if (!_2624)
    {
        uint _2632 = uint(int(uint(_172) >> uint(2)));
        float _2634 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2632)]);
        int _2636 = _172 + 4;
        uint _2638 = uint(int(uint(_2636) >> uint(2)));
        float _2640 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2638)]);
        int _2642 = _172 + 8;
        uint _2644 = uint(int(uint(_2642) >> uint(2)));
        float _2646 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2644)]);
        int _2648 = _172 + 12;
        uint _2650 = uint(int(uint(_2648) >> uint(2)));
        float _2652 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2650)]);
        uint _2654 = uint(int(uint(_172) >> uint(2)));
        float _2656 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2654)]);
        int _2658 = _172 + 4;
        uint _2660 = uint(int(uint(_2658) >> uint(2)));
        float _2662 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2660)]);
        int _2664 = _172 + 8;
        uint _2666 = uint(int(uint(_2664) >> uint(2)));
        float _2668 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2666)]);
        int _2670 = _172 + 12;
        uint _2672 = uint(int(uint(_2670) >> uint(2)));
        float _2674 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2672)]);
        uint _2676 = uint(int(uint(_172) >> uint(2)));
        float _2678 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2676)]);
        int _2680 = _172 + 4;
        uint _2682 = uint(int(uint(_2680) >> uint(2)));
        float _2684 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2682)]);
        int _2686 = _172 + 8;
        uint _2688 = uint(int(uint(_2686) >> uint(2)));
        float _2690 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2688)]);
        int _2692 = _172 + 12;
        uint _2694 = uint(int(uint(_2692) >> uint(2)));
        float _2696 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2694)]);
        float _2698 = _2640 * _2440;
        float _2700 = _2662 * _2440;
        float _2702 = _2684 * _2440;
        float _2704 = fma(_1108, _2634, _2698);
        float _2706 = fma(_1108, _2656, _2700);
        float _2708 = fma(_1108, _2678, _2702);
        float _2710 = fma(_1110, _2646, _2704);
        float _2712 = fma(_1110, _2668, _2706);
        float _2714 = fma(_1110, _2690, _2708);
        float _2716 = _2710 + _2652;
        float _2718 = _2712 + _2674;
        float _2720 = _2714 + _2696;
        _2626 = _2716;
        _2628 = _2720;
        _2630 = _2718;
    }
    float _2722 = _2626;
    float _2724 = _2628;
    float _2726 = _2630;
    uint _2728 = uint(int(uint(_2530) >> uint(2)));
    float _2730 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2728)]);
    float _2732 = fma(_2722, 6.2500002968590706586837768554688e-05, 0.5);
    float _2734 = fma(_2724, 6.2500002968590706586837768554688e-05, 0.5);
    float _2736 = _1696 ? _2730 : 1.0;
    bool _2738 = _2736 > 0.00999999977648258209228515625;
    float _2740 = _2724;
    float _2742 = _2726;
    bool _2744 = _2738;
    if (_2738)
    {
        float2 _7161 = float2(_2732, _2734);
        float _2746 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7161, float2(0.0), isnan(_7161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7161, float2(0.0), isnan(_7161)), level(0.0)).x;
        _2740 = _2746;
    }
    float _2748 = _2740;
    float2 _7172 = float2(_2732, _2734);
    float _2750 = dm_bs(spvDescriptorSet0.cp_t_tcb_22.sample(spvDescriptorSet0.cp_t_tcb_22Smplr, select(_7172, float2(0.0), isnan(_7172)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_22, spvDescriptorSet0.cp_t_tcb_22Smplr_w, select(_7172, float2(0.0), isnan(_7172)), level(0.0)).x;
    float _2752 = _1464;
    if (!_1696)
    {
        float2 _7184 = float2(_1464, _1466);
        float _2754 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7184, float2(0.0), isnan(_7184)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7184, float2(0.0), isnan(_7184)), level(0.0)).x;
        _2752 = _2754;
    }
    float _2756 = _2752;
    if (_2738)
    {
        float _2758 = _2726 + 1.0;
        _2742 = _2758;
    }
    float _2760 = _2742;
    if (!_2010)
    {
        _692 = 0.0;
    }
    float _2762 = _692;
    float _2764 = _2748;
    float _2766 = _2750;
    if (_2738)
    {
        float _2768 = _2748 * 2000.0;
        _2764 = _2768;
    }
    float _2770 = _2764;
    float _2772 = abs(_2750);
    bool _2774 = _2772 == 0.0;
    float _2776 = float(_2774);
    float _2778 = _2776;
    if (_2738)
    {
        bool _2780 = _2760 >= _2770;
        bool _2782 = isnan(_2760);
        bool _2784 = _2780 || _2782;
        bool _2786 = isnan(_2770);
        bool _2788 = _2784 || _2786;
        _2370 = _2788;
    }
    bool _2790 = _2370;
    if (_2738)
    {
        float _2792 = _2790 ? _2776 : 1.0;
        _2778 = _2792;
    }
    float _2794 = _2778;
    float _2796 = _2794;
    if (!_1696)
    {
        float _2798 = _2756 * 2000.0;
        _2766 = _2798;
    }
    float _2800 = _2766;
    float _2802 = -_2736;
    float _2804 = _2802 + _2794;
    if (!_1696)
    {
        bool _2806 = _1388 >= _2800;
        bool _2808 = isnan(_1388);
        bool _2810 = _2806 || _2808;
        bool _2812 = isnan(_2800);
        bool _2814 = _2810 || _2812;
        _2744 = _2814;
    }
    bool _2816 = _2744;
    float _2818 = -_176;
    float _2820 = _2818 + _1108;
    float _2822 = -_182;
    float _2824 = _2822 + _2440;
    if (_1696)
    {
        float _2826 = fma(_2804, 0.0500000007450580596923828125, _2736);
        _2796 = _2826;
    }
    float _2828 = _2796;
    if (!_1696)
    {
        int _2830 = _2816 ? _2350 : 0;
        _2372 = _2830;
    }
    int _2832 = _2372;
    float _2834 = -_188;
    float _2836 = _2834 + _1110;
    float _2838 = 0.0 + _2828;
    float _2840 = precise::clamp(_2838, 0.0, 1.0);
    uint _2842 = uint(int(uint(_2530) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2842)] = as_type<uint>(_2840);
    uint _2844 = uint(int(uint(_194) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2844)] = uint(_2832);
    uint _2846 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2846)] = as_type<uint>(_1108);
    uint _2848 = uint(int(uint(_1982) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2848)] = as_type<uint>(_2440);
    uint _2850 = uint(int(uint(_2530) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2850)] = as_type<uint>(_1110);
    uint _2852 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2852)] = as_type<uint>(_664);
    uint _2854 = uint(int(uint(_1982) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2854)] = as_type<uint>(_2762);
    uint _2856 = uint(int(uint(_2530) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2856)] = as_type<uint>(_678);
    uint _2858 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2858)] = as_type<uint>(_2820);
    uint _2860 = uint(int(uint(_1982) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2860)] = as_type<uint>(_2824);
    uint _2862 = uint(int(uint(_2530) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2862)] = as_type<uint>(_2836);
    float _2864 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2866 = _2824 * _2824;
    float _2868 = _2762 * _2762;
    float _2870 = fma(_2820, _2820, _2866);
    float _2872 = fma(_664, _664, _2868);
    float _2874 = fma(_2836, _2836, _2870);
    float _2876 = fma(_678, _678, _2872);
    float _2878 = sqrt(_2874);
    float _2880 = sqrt(_2876);
    bool _2882 = _2878 >= 9.9999999747524270787835121154785e-07;
    bool _2884 = isnan(_2878);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(9.9999999747524270787835121154785e-07);
    bool _2890 = _2886 || _2888;
    if (!_2890)
    {
        bool _2892 = _538 != _294;
        bool _2894 = isnan(_538);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan(_294);
        bool _2900 = _2896 || _2898;
        _2902 = _2900;
        if (!_2902)
        {
            float _2904 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2906 = _2904 > 0.0;
            bool _2908 = !_2906;
            if (!_2908)
            {
                float _2910 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2912 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2914 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2916 = _2912 * _514;
                float _2918 = _2912 * _512;
                float _2920 = _2912 * _516;
                float _2922 = fma(_2910, _520, _2916);
                float _2924 = fma(_2910, _518, _2918);
                float _2926 = fma(_2910, _522, _2920);
                float _2928 = fma(_2914, _526, _2922);
                float _2930 = fma(_2914, _524, _2924);
                float _2932 = fma(_2914, _528, _2926);
                float _2934 = _2928 * _2928;
                float _2936 = fma(_2930, _2930, _2934);
                float _2938 = fma(_2932, _2932, _2936);
                float _2940 = rsqrt(_2938);
                float _2942 = _2940 * 9.9999999747524270787835121154785e-07;
                float _2944 = _2930 * _2942;
                float _2946 = _2928 * _2942;
                float _2948 = _2932 * _2942;
                _332 = as_type<int>(_2944);
                _334 = as_type<int>(_2946);
                _336 = as_type<int>(_2948);
                _2902 = true;
            }
            else
            {
                bool _2950 = _2880 >= 9.9999999747524270787835121154785e-07;
                bool _2952 = isnan(_2880);
                bool _2954 = _2950 || _2952;
                bool _2956 = isnan(9.9999999747524270787835121154785e-07);
                bool _2958 = _2954 || _2956;
                if (!_2958)
                {
                    float _2960 = _2440 * _2440;
                    float _2962 = fma(_1108, _1108, _2960);
                    float _2964 = fma(_1110, _1110, _2962);
                    float _2966 = sqrt(_2964);
                    bool _2968 = _2966 >= 9.9999999747524270787835121154785e-07;
                    bool _2970 = isnan(_2966);
                    bool _2972 = _2968 || _2970;
                    bool _2974 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2976 = _2972 || _2974;
                    float _2978 = _2966;
                    if (_2976)
                    {
                        float _2980 = rsqrt(_2964);
                        _2978 = _2980;
                    }
                    float _2982 = _2978;
                    if (!_2976)
                    {
                        _320 = 0;
                    }
                    int _2984 = _320;
                    int _2986 = _2984;
                    if (!_2976)
                    {
                        _322 = 897988541;
                    }
                    int _2988 = _322;
                    int _2990 = _2988;
                    if (!_2976)
                    {
                        _324 = 0;
                    }
                    int _2992 = _324;
                    float _2994 = _2982;
                    int _2996 = _2992;
                    if (_2976)
                    {
                        float _2998 = _2982 * 9.9999999747524270787835121154785e-07;
                        _2994 = _2998;
                    }
                    float _3000 = _2994;
                    if (_2976)
                    {
                        float _3002 = _1108 * _3000;
                        _2986 = as_type<int>(_3002);
                    }
                    int _3004 = _2986;
                    _332 = _3004;
                    if (_2976)
                    {
                        float _3006 = _2440 * _3000;
                        _2990 = as_type<int>(_3006);
                    }
                    int _3008 = _2990;
                    _334 = _3008;
                    if (_2976)
                    {
                        float _3010 = _1110 * _3000;
                        _2996 = as_type<int>(_3010);
                    }
                    int _3012 = _2996;
                    _336 = _3012;
                    _2902 = true;
                }
                else
                {
                    float _3014 = rsqrt(_2876);
                    float _3016 = _3014 * 9.9999999747524270787835121154785e-07;
                    float _3018 = _664 * _3016;
                    float _3020 = _2762 * _3016;
                    float _3022 = _678 * _3016;
                    _332 = as_type<int>(_3018);
                    _334 = as_type<int>(_3020);
                    _336 = as_type<int>(_3022);
                    _2902 = true;
                }
            }
        }
    }
    else
    {
        float _3024 = _2880 * _2864;
        bool _3026 = _3024 >= 0.001000000047497451305389404296875;
        bool _3028 = isnan(_3024);
        bool _3030 = _3026 || _3028;
        bool _3032 = isnan(0.001000000047497451305389404296875);
        bool _3034 = _3030 || _3032;
        bool _3036 = _3024 > 0.0;
        bool _3038 = !_3034;
        bool _3040 = _3036 && _3038;
        bool _3042 = _2878 < 0.001000000047497451305389404296875;
        bool _3044 = _3042 && _3040;
        if (!_3044)
        {
            _326 = as_type<int>(_2820);
        }
        int _3046 = _326;
        int _3048 = _3046;
        if (_3044)
        {
            float _3050 = _664 * _2864;
            _3048 = as_type<int>(_3050);
        }
        int _3052 = _3048;
        _332 = _3052;
        if (!_3044)
        {
            _328 = as_type<int>(_2824);
        }
        int _3054 = _328;
        int _3056 = _3054;
        if (_3044)
        {
            float _3058 = _2864 * _2762;
            _3056 = as_type<int>(_3058);
        }
        int _3060 = _3056;
        _334 = _3060;
        if (!_3044)
        {
            _330 = as_type<int>(_2836);
        }
        int _3062 = _330;
        _336 = _3062;
        if (_3044)
        {
            float _3064 = _678 * _2864;
            _336 = as_type<int>(_3064);
        }
    }
    _2902 = false;
    int _3066 = _332;
    int _3068 = _334;
    int _3070 = _336;
    uint _3072 = uint(int(uint(_172) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3072)] = uint(_3066);
    uint _3074 = uint(int(uint(_1982) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3074)] = uint(_3068);
    uint _3076 = uint(int(uint(_2530) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3076)] = uint(_3070);
}

