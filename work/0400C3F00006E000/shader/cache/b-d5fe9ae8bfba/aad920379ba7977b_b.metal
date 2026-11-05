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
    bool _2886 = false;
    bool _826 = false;
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _84 = as_type<float>(gl_LocalInvocationID.x);
    float _86 = as_type<float>(gl_WorkGroupID.x);
    int _89 = as_type<int>(_86) << 5;
    int _91 = _89 + as_type<int>(_84);
    float _93 = trunc(_82);
    int _95 = int(_93);
    bool _99 = _91 >= _95;
    int _101 = 0;
    float _103 = as_type<float>(_95);
    if (_99)
    {
        _101 = 0;
    }
    int _105 = _101;
    int _107 = _105;
    int _109 = _105;
    float _111 = 0.0;
    if (!_99)
    {
        int _113 = _91 << 4;
        int _115 = _113 + 12;
        uint _118 = uint(int(uint(_115) >> uint(2)));
        float _120 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_118)]);
        float _122 = trunc(_120);
        int _124 = int(_122);
        bool _126 = _124 >= 1;
        int _128 = _126 ? (-1) : 0;
        _103 = as_type<float>(_115);
        _111 = as_type<float>(_124);
        if (!_126)
        {
            _107 = 0;
        }
        int _130 = _107;
        bool _132 = !_126;
        _109 = _130;
        if (!_132)
        {
            float _134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _136 = uint(int(uint(_115) >> uint(2)));
            float _138 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_136)]);
            float _140 = float(_124);
            float _142 = -_138;
            float _144 = _134 + _142;
            bool _146 = _144 > _140;
            int _148 = as_type<int>(_134);
            _103 = _138;
            _111 = _140;
            if (!_146)
            {
                bool _150 = _134 >= _138;
                bool _152 = isnan(_134);
                bool _154 = _150 || _152;
                bool _156 = isnan(_138);
                bool _158 = _154 || _156;
                _128 = _158 ? (-1) : 0;
            }
            int _160 = _128;
            if (_146)
            {
                _148 = 0;
            }
            int _162 = _148;
            _109 = _162;
            if (!_146)
            {
                int _164 = ~_160;
                int _166 = (_164 != 0) ? 0 : 1;
                _109 = _166;
            }
        }
    }
    int _168 = _109;
    float _170 = _103;
    float _172 = _111;
    int _174 = _168 & 1;
    bool _176 = _174 != 0;
    if (!_176)
    {
        return;
    }
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _180 = _91 << 4;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = _180 + 4;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_188)]);
    int _192 = _180 + 8;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_194)]);
    int _198 = as_type<int>(_178) & 512;
    bool _200 = _198 != 0;
    int _202 = _180 + 12;
    uint _204 = uint(int(uint(_180) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _180 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _180 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    uint _220 = uint(int(uint(_180) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_220)]);
    int _224 = _180 + 4;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_226)]);
    int _230 = _180 + 8;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_232)]);
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = 0.0;
    float _242 = _178;
    if (_200)
    {
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _248 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _236 = _244;
        _238 = _246;
        _240 = _248;
    }
    float _250 = _236;
    float _252 = _238;
    float _254 = _240;
    float _256 = 0.0;
    float _258 = 0.0;
    float _260 = 0.0;
    if (_200)
    {
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _256 = _262;
        _258 = _264;
        _260 = _266;
    }
    float _268 = _256;
    float _270 = _258;
    float _272 = _260;
    float _274 = as_type<float>(_168);
    float _276 = _170;
    float _278 = _172;
    if (_200)
    {
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _284 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _274 = _280;
        _276 = _282;
        _278 = _284;
    }
    float _286 = _274;
    float _288 = _276;
    float _290 = _278;
    uint _292 = uint(int(uint(_180) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_292)]);
    uint _296 = uint(int(uint(_202) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_296)]);
    uint _300 = uint(int(uint(_202) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_300)]);
    float _304 = _268;
    float _306 = _270;
    float _308 = _272;
    float _310 = _250;
    float _312 = _252;
    float _314 = _254;
    float _316 = _286;
    float _318 = _288;
    float _320 = _290;
    float _322 = _206;
    float _324 = _212;
    float _326 = _218;
    int _328 = as_type<int>(_222);
    int _330 = as_type<int>(_228);
    int _332 = as_type<int>(_234);
    int _334 = as_type<int>(_222);
    int _336 = as_type<int>(_228);
    int _338 = as_type<int>(_234);
    int _340 = as_type<int>(_222);
    int _342 = as_type<int>(_228);
    int _344 = as_type<int>(_234);
    if (!_200)
    {
        int _346 = _180 + 4;
        uint _348 = uint(int(uint(_180) >> uint(2)));
        float _350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_348)]);
        int _352 = _180 + 8;
        uint _354 = uint(int(uint(_180) >> uint(2)));
        float _356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_354)]);
        uint _358 = uint(int(uint(_346) >> uint(2)));
        float _360 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_358)]);
        uint _362 = uint(int(uint(_346) >> uint(2)));
        float _364 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_362)]);
        uint _366 = uint(int(uint(_352) >> uint(2)));
        float _368 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_366)]);
        uint _370 = uint(int(uint(_180) >> uint(2)));
        float _372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_370)]);
        uint _374 = uint(int(uint(_352) >> uint(2)));
        float _376 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_374)]);
        uint _378 = uint(int(uint(_346) >> uint(2)));
        float _380 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_378)]);
        uint _382 = uint(int(uint(_352) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_382)]);
        float _386 = _350 * _350;
        float _388 = fma(_356, _356, _386);
        float _390 = _360 * _360;
        float _392 = fma(_364, _364, _390);
        float _394 = _368 * _368;
        float _396 = fma(_372, _372, _388);
        float _398 = fma(_376, _376, _394);
        float _400 = sqrt(_396);
        float _402 = fma(_380, _380, _392);
        float _404 = fma(_384, _384, _398);
        float _406 = sqrt(_402);
        float _408 = sqrt(_404);
        bool _410 = _400 > 0.0;
        bool _412 = _406 > 0.0;
        bool _414 = _408 > 0.0;
        float _416 = _406;
        float _418 = _408;
        float _420 = _398;
        float _422 = _350;
        float _424 = _400;
        float _426 = _356;
        float _428 = _392;
        float _430 = _360;
        float _432 = _380;
        float _434 = _372;
        if (_410)
        {
            float _436 = rsqrt(_396);
            _416 = _436;
        }
        float _438 = _416;
        float _440 = 0.0;
        if (_412)
        {
            float _442 = rsqrt(_402);
            _440 = _442;
        }
        float _444 = _440;
        float _446 = 0.0;
        if (_414)
        {
            float _448 = rsqrt(_404);
            _446 = _448;
        }
        float _450 = _446;
        if (!_410)
        {
            _418 = 0.0;
        }
        float _452 = _418;
        float _454 = _452;
        if (_410)
        {
            float _456 = _350 * _438;
            _454 = _456;
        }
        float _458 = _454;
        _304 = _458;
        if (!_410)
        {
            _420 = 0.0;
        }
        float _460 = _420;
        float _462 = _460;
        if (_410)
        {
            float _464 = _356 * _438;
            _462 = _464;
        }
        float _466 = _462;
        _310 = _466;
        if (!_410)
        {
            _422 = 0.0;
        }
        float _468 = _422;
        float _470 = _468;
        if (_410)
        {
            float _472 = _372 * _438;
            _470 = _472;
        }
        float _474 = _470;
        _316 = _474;
        if (!_412)
        {
            _424 = 0.0;
        }
        float _476 = _424;
        float _478 = _476;
        if (_412)
        {
            float _480 = _360 * _444;
            _478 = _480;
        }
        float _482 = _478;
        _306 = _482;
        if (!_412)
        {
            _426 = 0.0;
        }
        float _484 = _426;
        float _486 = _484;
        if (_412)
        {
            float _488 = _380 * _444;
            _486 = _488;
        }
        float _490 = _486;
        _318 = _490;
        if (!_412)
        {
            _428 = 0.0;
        }
        float _492 = _428;
        float _494 = _492;
        if (_412)
        {
            float _496 = _364 * _444;
            _494 = _496;
        }
        float _498 = _494;
        _312 = _498;
        if (!_414)
        {
            _430 = 0.0;
        }
        float _500 = _430;
        float _502 = _500;
        if (!_414)
        {
            _432 = 0.0;
        }
        float _504 = _432;
        float _506 = _504;
        if (_414)
        {
            float _508 = _368 * _450;
            _502 = _508;
        }
        float _510 = _502;
        _308 = _510;
        if (!_414)
        {
            _434 = 0.0;
        }
        float _512 = _434;
        _320 = _512;
        if (_414)
        {
            float _514 = _376 * _450;
            _506 = _514;
        }
        float _516 = _506;
        _314 = _516;
        if (_414)
        {
            float _518 = _384 * _450;
            _320 = _518;
        }
    }
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = _310;
    float _528 = _312;
    float _530 = _314;
    float _532 = _316;
    float _534 = _318;
    float _536 = _320;
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _564 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _566 = uint(int(uint(_202) >> uint(2)));
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_566)]);
    bool _570 = _540 > 0.0;
    float _572 = abs(_538);
    float _574 = log2(_572);
    bool _576 = _542 > 0.0;
    float _578 = 0.0;
    float _580 = _544;
    float _582 = _540;
    float _584 = _548;
    bool _586 = _576;
    float _588 = _556;
    float _590 = _558;
    float _592 = _560;
    float _594 = _562;
    float _596 = _564;
    if (_570)
    {
        float _598 = 1.0 / _540;
        _578 = _598;
    }
    float _600 = _578;
    float _602 = _544 * _542;
    float _604 = -_302;
    float _606 = _546 + _604;
    float _608 = _550 * _554;
    float _610 = _606;
    if (_576)
    {
        float _612 = -_602;
        float _614 = fma(_294, _612, _544);
        _580 = _614;
    }
    float _616 = _580;
    float _618 = _556 * _574;
    float _620 = _548 * _554;
    float _622 = _552 * _554;
    float _624 = _608 * _520;
    float _626 = _608 * _522;
    float _628 = _616;
    if (_570)
    {
        float _630 = _606 * _600;
        _582 = _630;
    }
    float _632 = _582;
    float _634 = exp2(_618);
    float _636 = _608 * _524;
    float _638 = fma(_620, _526, _624);
    float _640 = fma(_620, _528, _626);
    float _642 = _640;
    if (_570)
    {
        float _644 = precise::min(_632, 1.0);
        _584 = _644;
    }
    float _646 = _584;
    float _648 = fma(_620, _530, _636);
    float _650 = fma(_622, _532, _638);
    float _652 = fma(_622, _534, _640);
    float _654 = _652;
    if (_570)
    {
        float _656 = _646 * _616;
        _628 = _656;
    }
    float _658 = _628;
    float _660 = fma(_622, _536, _648);
    float _662 = _556 * _650;
    float _664 = _556 * _652;
    float _666 = _298 * _556;
    float _668 = _556 * _658;
    float _670 = _556 * _660;
    float _672 = fma(_206, _634, _662);
    float _674 = fma(_212, _634, _664);
    float _676 = fma(_206, _666, _184);
    float _678 = fma(_212, _666, _190);
    float _680 = _558 * _668;
    float _682 = _560 * _668;
    float _684 = fma(_218, _666, _196);
    float _686 = fma(_218, _634, _670);
    float _688 = _562 * _668;
    bool _690 = !_200;
    float _692 = _670;
    float _694 = _680;
    float _696 = _688;
    float _698 = _568;
    float _700 = _674;
    float _822;
    float _824;
    if (!_690)
    {
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _720 = _706 * _708;
        float _722 = _706 * _710;
        float _724 = _704 * _708;
        float _726 = -_720;
        float _728 = fma(_702, _712, _726);
        float _730 = -_722;
        float _732 = fma(_704, _712, _730);
        float _734 = -_724;
        float _736 = fma(_702, _710, _734);
        float _738 = _716 * _702;
        float _740 = _716 * _728;
        float _742 = _718 * _704;
        float _744 = _714 * _710;
        float _746 = -_738;
        float _748 = fma(_714, _704, _746);
        float _750 = -_740;
        float _752 = fma(_714, _732, _750);
        float _754 = _716 * _712;
        float _756 = _718 * _708;
        float _758 = _714 * _706;
        float _760 = fma(_718, _736, _752);
        float _762 = -_754;
        float _764 = fma(_718, _710, _762);
        float _766 = -_756;
        float _768 = fma(_714, _712, _766);
        float _770 = -_744;
        float _772 = fma(_716, _708, _770);
        float _774 = -_758;
        float _776 = fma(_718, _702, _774);
        float _778 = -_702;
        float _780 = fma(_778, _712, _720);
        float _782 = 1.0 / _760;
        float _784 = -_742;
        float _786 = fma(_716, _706, _784);
        float _788 = _764 * _782;
        float _790 = _768 * _782;
        float _792 = _772 * _782;
        float _794 = _680 * _782;
        float _796 = _682 * _788;
        float _798 = _682 * _790;
        float _800 = _780 * _782;
        float _802 = _682 * _792;
        float _804 = _786 * _782;
        float _806 = _776 * _782;
        float _808 = fma(_732, _794, _796);
        float _810 = fma(_680, _800, _798);
        float _812 = _748 * _782;
        float _814 = fma(_736, _794, _802);
        float _816 = fma(_688, _804, _808);
        float _818 = fma(_688, _806, _810);
        float _820 = fma(_688, _812, _814);
        _322 = _806;
        _324 = _810;
        _326 = _808;
        _654 = _814;
        _588 = _714;
        _242 = _716;
        _642 = _718;
        _822 = _782;
        _590 = _794;
        _592 = _710;
        _594 = _712;
        _596 = _720;
        _824 = _818;
        _694 = _816;
        _696 = _820;
        _826 = true;
    }
    else
    {
        int _828 = as_type<int>(_178) & 1024;
        bool _830 = _828 != 0;
        if (_830)
        {
            _586 = true;
        }
        bool _832 = _586;
        bool _834 = _832;
        if (!_830)
        {
            int _836 = as_type<int>(_178) & 2048;
            bool _838 = _836 != 0;
            _834 = _838;
        }
        bool _840 = _834;
        if (!_840)
        {
            _692 = _682;
        }
        float _842 = _692;
        bool _844 = !_840;
        _822 = 0.0;
        _824 = _842;
        if (!_844)
        {
            uint _846 = uint(int(uint(_180) >> uint(2)));
            float _848 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_846)]);
            int _850 = _180 + 4;
            uint _852 = uint(int(uint(_850) >> uint(2)));
            float _854 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_852)]);
            int _856 = _180 + 8;
            uint _858 = uint(int(uint(_856) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_858)]);
            uint _862 = uint(int(uint(_180) >> uint(2)));
            float _864 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_862)]);
            int _866 = _180 + 4;
            uint _868 = uint(int(uint(_866) >> uint(2)));
            float _870 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_868)]);
            int _872 = _180 + 8;
            uint _874 = uint(int(uint(_872) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_874)]);
            uint _878 = uint(int(uint(_180) >> uint(2)));
            float _880 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_878)]);
            int _882 = _180 + 4;
            uint _884 = uint(int(uint(_882) >> uint(2)));
            float _886 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_884)]);
            int _888 = _180 + 8;
            uint _890 = uint(int(uint(_888) >> uint(2)));
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_890)]);
            float _894 = _860 * _864;
            float _896 = _860 * _870;
            float _898 = _854 * _864;
            float _900 = -_894;
            float _902 = fma(_848, _876, _900);
            float _904 = -_896;
            float _906 = fma(_854, _876, _904);
            float _908 = -_898;
            float _910 = fma(_848, _870, _908);
            float _912 = _886 * _848;
            float _914 = _886 * _902;
            float _916 = _892 * _854;
            float _918 = _880 * _870;
            float _920 = -_912;
            float _922 = fma(_880, _854, _920);
            float _924 = -_914;
            float _926 = fma(_880, _906, _924);
            float _928 = _886 * _876;
            float _930 = _892 * _864;
            float _932 = _880 * _860;
            float _934 = fma(_892, _910, _926);
            float _936 = -_928;
            float _938 = fma(_892, _870, _936);
            float _940 = -_930;
            float _942 = fma(_880, _876, _940);
            float _944 = -_918;
            float _946 = fma(_886, _864, _944);
            float _948 = -_932;
            float _950 = fma(_892, _848, _948);
            float _952 = -_848;
            float _954 = fma(_952, _876, _894);
            float _956 = 1.0 / _934;
            float _958 = -_916;
            float _960 = fma(_886, _860, _958);
            float _962 = _938 * _956;
            float _964 = _942 * _956;
            float _966 = _946 * _956;
            float _968 = _680 * _956;
            float _970 = _682 * _962;
            float _972 = _682 * _964;
            float _974 = _954 * _956;
            float _976 = _682 * _966;
            float _978 = _960 * _956;
            float _980 = _950 * _956;
            float _982 = fma(_906, _968, _970);
            float _984 = fma(_680, _974, _972);
            float _986 = _922 * _956;
            float _988 = fma(_910, _968, _976);
            float _990 = fma(_688, _978, _982);
            float _992 = fma(_688, _980, _984);
            float _994 = fma(_688, _986, _988);
            _322 = _980;
            _324 = _984;
            _326 = _982;
            _654 = _988;
            _588 = _880;
            _242 = _886;
            _642 = _892;
            _822 = _956;
            _590 = _968;
            _592 = _870;
            _594 = _876;
            _596 = _894;
            _824 = _992;
            _694 = _990;
            _696 = _994;
        }
    }
    _826 = false;
    float _996 = _322;
    float _998 = _324;
    float _1000 = _326;
    float _1002 = _654;
    float _1004 = _588;
    float _1006 = _242;
    float _1008 = _642;
    float _1010 = _822;
    float _1012 = _590;
    float _1014 = _592;
    float _1016 = _594;
    float _1018 = _596;
    float _1020 = _824;
    float _1022 = _694;
    float _1024 = _696;
    uint _1026 = uint(int(uint(_202) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1026)] = as_type<uint>(_568);
    float _1028 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1030 = as_type<int>(_1028) & 512;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>(_1028) & 1024;
    bool _1036 = _1034 != 0;
    float _1038 = _996;
    float _1040 = _998;
    float _1042 = _1000;
    float _1044 = _1002;
    float _1046 = _1024;
    float _1048 = _1022;
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
    float _1066 = _1004;
    float _1068 = _1006;
    float _1070 = _1008;
    float _1072 = _1010;
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
    float _1090 = _1012;
    float _1092 = _1014;
    float _1094 = _1016;
    float _1096 = _1018;
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
    float _1114 = _678 + _1020;
    float _1116 = _676 + _1022;
    float _1118 = _684 + _1024;
    float _1120 = _1114;
    if (!_1032)
    {
        _1046 = 0.0;
    }
    float _1122 = _1046;
    float _1124 = 0.0;
    float _1126 = _1122;
    if (!_1032)
    {
        _1124 = 0.0;
    }
    float _1128 = _1124;
    int _1130 = as_type<int>(_1028) & 2048;
    bool _1132 = _1130 != 0;
    float _1134 = _1058;
    float _1136 = _1064;
    float _1138 = _1128;
    if (_1032)
    {
        float _1140 = _1114 * _1060;
        _1048 = _1140;
    }
    float _1142 = _1048;
    float _1144 = _1142;
    if (_1032)
    {
        float _1146 = fma(_1116, _1058, _1142);
        _1134 = _1146;
    }
    float _1148 = _1134;
    float _1150 = _1084;
    float _1152 = _1108;
    float _1154 = _1148;
    float _1156 = _1106;
    float _1158 = _1086;
    if (_1032)
    {
        float _1160 = _1114 * _1084;
        _1150 = _1160;
    }
    float _1162 = _1150;
    float _1164 = _1162;
    if (!_1032)
    {
        _1144 = 0.0;
    }
    float _1166 = _1144;
    float _1168 = _1166;
    if (_1032)
    {
        float _1170 = _1114 * _1108;
        _1152 = _1170;
    }
    float _1172 = _1152;
    if (_1032)
    {
        float _1174 = fma(_1118, _1062, _1148);
        _1154 = _1174;
    }
    float _1176 = _1154;
    if (_1032)
    {
        float _1178 = fma(_1116, _1082, _1162);
        _1164 = _1178;
    }
    float _1180 = _1164;
    if (_1032)
    {
        float _1182 = fma(_1116, _1106, _1172);
        _1156 = _1182;
    }
    float _1184 = _1156;
    float _1186 = _1184;
    if (_1032)
    {
        float _1188 = _1064 + _1176;
        _1126 = _1188;
    }
    float _1190 = _1126;
    if (_1032)
    {
        float _1192 = fma(_1118, _1086, _1180);
        _1158 = _1192;
    }
    float _1194 = _1158;
    if (_1032)
    {
        float _1196 = fma(_1118, _1110, _1184);
        _1186 = _1196;
    }
    float _1198 = _1186;
    if (_1032)
    {
        float _1200 = _1088 + _1194;
        _1168 = _1200;
    }
    float _1202 = _1168;
    float _1204 = _1202;
    if (!_1036)
    {
        _1136 = _1190;
    }
    float _1206 = _1136;
    float _1208 = _1206;
    if (_1032)
    {
        float _1210 = _1112 + _1198;
        _1138 = _1210;
    }
    float _1212 = _1138;
    bool _1214 = !_1036;
    float _1216 = _1212;
    if (!_1214)
    {
        float _1218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1220 = uint(int(uint(_180) >> uint(2)));
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1220)]);
        int _1224 = _180 + 4;
        uint _1226 = uint(int(uint(_1224) >> uint(2)));
        float _1228 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1226)]);
        int _1230 = _180 + 8;
        uint _1232 = uint(int(uint(_1230) >> uint(2)));
        float _1234 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1232)]);
        uint _1236 = uint(int(uint(_180) >> uint(2)));
        float _1238 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1236)]);
        int _1240 = _180 + 4;
        uint _1242 = uint(int(uint(_1240) >> uint(2)));
        float _1244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1242)]);
        int _1246 = _180 + 8;
        uint _1248 = uint(int(uint(_1246) >> uint(2)));
        float _1250 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1248)]);
        uint _1252 = uint(int(uint(_180) >> uint(2)));
        float _1254 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1252)]);
        int _1256 = _180 + 4;
        uint _1258 = uint(int(uint(_1256) >> uint(2)));
        float _1260 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1258)]);
        int _1262 = _180 + 8;
        uint _1264 = uint(int(uint(_1262) >> uint(2)));
        float _1266 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1264)]);
        float _1268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1270 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1272 = _1114 * _1228;
        float _1274 = _1114 * _1244;
        float _1276 = _1114 * _1260;
        float _1278 = fma(_1116, _1222, _1272);
        float _1280 = fma(_1116, _1238, _1274);
        float _1282 = fma(_1116, _1254, _1276);
        float _1284 = fma(_1118, _1234, _1278);
        float _1286 = fma(_1118, _1250, _1280);
        float _1288 = fma(_1118, _1266, _1282);
        float _1290 = _1218 + _1284;
        float _1292 = _1268 + _1286;
        float _1294 = _1270 + _1288;
        _1208 = _1290;
        _1204 = _1292;
        _1216 = _1294;
    }
    float _1296 = _1208;
    float _1298 = _1204;
    float _1300 = _1216;
    bool _1302 = !_1132;
    float _1304 = _1298;
    float _1306 = _1296;
    float _1308 = _1300;
    if (!_1302)
    {
        uint _1310 = uint(int(uint(_180) >> uint(2)));
        float _1312 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1310)]);
        int _1314 = _180 + 4;
        uint _1316 = uint(int(uint(_1314) >> uint(2)));
        float _1318 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1316)]);
        int _1320 = _180 + 8;
        uint _1322 = uint(int(uint(_1320) >> uint(2)));
        float _1324 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1322)]);
        int _1326 = _180 + 12;
        uint _1328 = uint(int(uint(_1326) >> uint(2)));
        float _1330 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1328)]);
        uint _1332 = uint(int(uint(_180) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1332)]);
        int _1336 = _180 + 4;
        uint _1338 = uint(int(uint(_1336) >> uint(2)));
        float _1340 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1338)]);
        int _1342 = _180 + 8;
        uint _1344 = uint(int(uint(_1342) >> uint(2)));
        float _1346 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1344)]);
        int _1348 = _180 + 12;
        uint _1350 = uint(int(uint(_1348) >> uint(2)));
        float _1352 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1350)]);
        uint _1354 = uint(int(uint(_180) >> uint(2)));
        float _1356 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1354)]);
        int _1358 = _180 + 4;
        uint _1360 = uint(int(uint(_1358) >> uint(2)));
        float _1362 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1360)]);
        int _1364 = _180 + 8;
        uint _1366 = uint(int(uint(_1364) >> uint(2)));
        float _1368 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1366)]);
        int _1370 = _180 + 12;
        uint _1372 = uint(int(uint(_1370) >> uint(2)));
        float _1374 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1372)]);
        float _1376 = _1114 * _1318;
        float _1378 = _1114 * _1340;
        float _1380 = _1114 * _1362;
        float _1382 = fma(_1116, _1312, _1376);
        float _1384 = fma(_1116, _1334, _1378);
        float _1386 = fma(_1116, _1356, _1380);
        float _1388 = fma(_1118, _1324, _1382);
        float _1390 = fma(_1118, _1346, _1384);
        float _1392 = fma(_1118, _1368, _1386);
        float _1394 = _1388 + _1330;
        float _1396 = _1390 + _1352;
        float _1398 = _1392 + _1374;
        _1304 = _1396;
        _1306 = _1394;
        _1308 = _1398;
    }
    float _1400 = _1304;
    float _1402 = _1306;
    float _1404 = _1308;
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1426 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1428 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1430 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1432 = _1406 + 1.0;
    float _1434 = _1432 + _1400;
    float _1436 = _1434 * _1418;
    float _1438 = fma(_1416, _1402, _1436);
    float _1440 = fma(_1420, _1404, _1438);
    float _1442 = _1422 + _1440;
    float _1444 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1446 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1448 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1450 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1452 = trunc(_1442);
    int _1454 = int(_1452);
    int _1456 = ~as_type<int>(_1424);
    int _1458 = _1454 + _1456;
    int _1460 = _1458 + 1;
    bool _1462 = _1460 >= 0;
    int _1464 = 0;
    float _1466 = _1402;
    float _1468 = _1402;
    if (_1462)
    {
        float _1470 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1464 = as_type<int>(_1470);
    }
    int _1472 = _1464;
    float _1474 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.5);
    float _1476 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5194 = float2(_1474, _1476);
    float _1478 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5194, float2(0.0), isnan(_5194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5194, float2(0.0), isnan(_5194)), level(0.0)).x;
    float _1480 = _1410 * _1400;
    float _1482 = fma(_1408, _1402, _1480);
    float _1484 = fma(_1412, _1404, _1482);
    float _1486 = _1414 + _1484;
    float _1488 = -_1486;
    bool _1490 = _1426 >= _1488;
    bool _1492 = isnan(_1426);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(_1488);
    bool _1498 = _1494 || _1496;
    float _1500 = -_1486;
    bool _1502 = _1428 >= _1500;
    bool _1504 = isnan(_1428);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(_1500);
    bool _1510 = _1506 || _1508;
    int _1512 = _1498 ? 0 : 1;
    int _1514 = 2;
    if (_1498)
    {
        _1514 = 1;
    }
    int _1516 = _1514;
    int _1518 = _1516;
    if (_1510)
    {
        _1518 = _1512;
    }
    int _1520 = _1518;
    int _1522 = _1520 << 6;
    int _1524 = _1522 + 96;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
    int _1530 = _1524 + 4;
    uint _1532 = uint(int(uint(_1530) >> uint(2)));
    float _1534 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1532)]);
    int _1536 = _1524 + 8;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    float _1540 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1538)]);
    int _1542 = _1524 + 12;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    float _1546 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1544)]);
    int _1548 = _1522 + 48;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    float _1552 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1550)]);
    int _1554 = _1548 + 4;
    uint _1556 = uint(int(uint(_1554) >> uint(2)));
    float _1558 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1556)]);
    int _1560 = _1548 + 8;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    float _1564 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1562)]);
    int _1566 = _1548 + 12;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    float _1570 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1568)]);
    float _1572 = _1434 * _1446;
    float _1574 = fma(_1444, _1402, _1572);
    float _1576 = fma(_1448, _1404, _1574);
    float _1578 = _1450 + _1576;
    int _1580 = _1522 + 64;
    float _1582 = trunc(_1578);
    int _1584 = int(_1582);
    uint _1586 = uint(int(uint(_1580) >> uint(2)));
    float _1588 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1586)]);
    int _1590 = _1580 + 4;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    float _1594 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1592)]);
    int _1596 = _1580 + 8;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    float _1600 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1598)]);
    int _1602 = _1580 + 12;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    float _1606 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1604)]);
    int _1608 = _1522 + 80;
    bool _1610 = _1472 <= _1460;
    bool _1612 = !_1462;
    bool _1614 = _1610 || _1612;
    int _1616 = ~as_type<int>(_1430);
    int _1618 = _1584 + _1616;
    int _1620 = _1618 + 1;
    uint _1622 = uint(int(uint(_1608) >> uint(2)));
    float _1624 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1622)]);
    int _1626 = _1608 + 4;
    uint _1628 = uint(int(uint(_1626) >> uint(2)));
    float _1630 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1628)]);
    int _1632 = _1608 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    float _1636 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1634)]);
    int _1638 = _1608 + 12;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    float _1642 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1640)]);
    bool _1644 = _1620 < 0;
    bool _1646 = _1644 || _1614;
    int _1648 = as_type<int>(_1430);
    float _1650 = _1570;
    float _1652 = _1546;
    if (!_1646)
    {
        float _1654 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1648 = as_type<int>(_1654);
    }
    int _1656 = _1648;
    float _1658 = _1434 * _1534;
    float _1660 = fma(_1528, _1402, _1658);
    float _1662 = fma(_1540, _1404, _1660);
    float _1664 = _1546 + _1662;
    float _1666 = _1434 * _1558;
    float _1668 = 1.0 / _1664;
    float _1670 = fma(_1552, _1402, _1666);
    float _1672 = fma(_1564, _1404, _1670);
    bool _1674 = _606 > 0.001000000047497451305389404296875;
    bool _1676 = isnan(_606);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(0.001000000047497451305389404296875);
    bool _1682 = _1678 || _1680;
    float _1684 = _1434 * _1594;
    float _1686 = fma(_1588, _1402, _1684);
    float _1688 = _1570 + _1672;
    float _1690 = fma(_1600, _1404, _1686);
    float _1692 = _1688 * _1668;
    float _1694 = _1606 + _1690;
    bool _1696 = _1692 >= 0.0;
    float _1698 = _1694 * _1668;
    bool _1700 = _1692 <= 1.0;
    bool _1702 = _1700 && _1696;
    bool _1704 = _1698 >= 0.0;
    bool _1706 = _1704 && _1702;
    bool _1708 = _1698 <= 1.0;
    bool _1710 = _1708 && _1706;
    float _1712 = _1434 * _1630;
    bool _1714 = _1656 <= _1620;
    bool _1716 = _1714 || _1646;
    float _1718 = fma(_1624, _1402, _1712);
    float _1720 = fma(_1636, _1404, _1718);
    float _1722 = _1588;
    float _1724 = _1686;
    float _1726 = _1642;
    float _1728 = _1624;
    float _1730 = _1720;
    float _1732 = _1692;
    if (_1710)
    {
        float _1734 = float(_1520);
        _1722 = _1734;
    }
    float _1736 = _1722;
    float _1738 = _1642 + _1720;
    if (_1716)
    {
        _610 = 1.0;
    }
    float _1740 = _610;
    float _1742 = _1740;
    if (!_1716)
    {
        float _1744 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1746 = _1620 * as_type<int>(_1744);
        int _1748 = _1746 + _1460;
        int _1750 = _1748 << 2;
        uint _1752 = uint(int(uint(_1748) >> uint(2)));
        int _1754 = 12 & _1750;
        int _1756 = int(_1752) << 4;
        int _1758 = _1756 + _1754;
        int _1760 = _1758 + 400;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1762)]);
        float _1766 = floor(_1578);
        float _1768 = floor(_1442);
        float _1770 = -_1766;
        float _1772 = _1578 + _1770;
        float _1774 = -_1768;
        float _1776 = _1442 + _1774;
        float _1778 = rint(_1764);
        float _1780 = precise::max(_1778, 0.0);
        uint _1782 = uint(_1780);
        uint _1784 = clamp(_1782, 0u, 65535u);
        float3 _5661 = float3(_1776, _1772, float(int(_1784)));
        float3 _5665 = select(_5661, float3(0.0), isnan(_5661));
        float _1786 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5665.xy, uint(rint(_5665.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5665.xy, uint(rint(_5665.z)), level(0.0)).x;
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
        float _1814 = _1434 * _1800;
        float _1816 = fma(_1794, _1402, _1814);
        float _1818 = fma(_1806, _1404, _1816);
        float _1820 = _1812 + _1818;
        float _1822 = precise::clamp(_1820, 0.0, 1.0);
        float _1824 = -_1822;
        float _1826 = _1824 + _1786;
        float _1828 = fma(_1826, 500.0, 1.5);
        float _1830 = exp2(_1828);
        float _1832 = 0.0 + _1830;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        _1724 = _1786;
        _1726 = _1812;
        _1650 = _1776;
        _1728 = _1794;
        _1730 = _1830;
        _1742 = _1834;
    }
    float _1836 = _1724;
    float _1838 = _1726;
    float _1840 = _1650;
    float _1842 = _1728;
    float _1844 = _1730;
    float _1846 = _1742;
    float _1848 = _1736;
    float _1850 = _1842;
    float _1852 = _1836;
    float _1854 = _1838;
    float _1856 = _1844;
    if (_1710)
    {
        float _1858 = rint(_1736);
        float _1860 = precise::max(_1858, 0.0);
        uint _1862 = uint(_1860);
        uint _1864 = clamp(_1862, 0u, 65535u);
        _1848 = as_type<float>(_1864);
    }
    float _1866 = _1848;
    float _1868 = _1738 * _1668;
    bool _1870 = _1478 != 0.0;
    bool _1872 = isnan(_1478);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(0.0);
    bool _1878 = _1874 || _1876;
    uint _1880 = uint(int(uint(_180) >> uint(2)));
    float _1882 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1880)]);
    float _1884 = _1868;
    float _1886 = _1868;
    if (!_1682)
    {
        float _1888 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1850 = _1888;
    }
    float _1890 = _1850;
    float _1892 = _1698;
    float _1894 = _1890;
    if (_1710)
    {
        float3 _5816 = float3(_1692, _1698, float(as_type<int>(_1866)));
        float3 _5818 = select(_5816, float3(0.0), isnan(_5816));
        float _1896 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5818.xy, uint(rint(_5818.z)), _1868, level(0.0));
        _1892 = _1896;
    }
    float _1898 = _1892;
    if (_1878)
    {
        _1852 = _1478;
    }
    float _1900 = _1852;
    if (!_1878)
    {
        _1854 = 4.0;
    }
    float _1902 = _1854;
    if (!_1710)
    {
        _1856 = 1.0;
    }
    float _1904 = _1856;
    float _1906 = _1900;
    float _1908 = _1904;
    if (!_1878)
    {
        float2 _5848 = float2(_1474, _1476);
        float _1910 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5848, float2(0.0), isnan(_5848)), level(_1902)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5848, float2(0.0), isnan(_5848)), level(_1902)).x;
        _1906 = _1910;
    }
    float _1912 = _1906;
    float _1914 = _1840;
    if (!_1682)
    {
        float2 _5864 = float2(_1890, _1476);
        float _1916 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5864, float2(0.0), isnan(_5864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5864, float2(0.0), isnan(_5864)), level(0.0)).x;
        _1914 = _1916;
    }
    float _1918 = _1914;
    float _1920 = _1528;
    float _1922 = _1660;
    if (!_1682)
    {
        float2 _5880 = float2(_1474, _1476);
        float2 _1926 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5880, float2(0.0), isnan(_5880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5880, float2(0.0), isnan(_5880)), level(0.0)).xy;
        float _1928 = _1926.x;
        float _1930 = _1926.y;
        _1920 = _1928;
        _1922 = _1930;
    }
    float _1932 = _1920;
    float _1934 = _1922;
    int _1936 = as_type<int>(_1882);
    float _1938 = _1918;
    float _1940 = _1934;
    float _1942 = _1932;
    float _1944 = _1898;
    if (_1710)
    {
        bool _1946 = _1898 >= _1868;
        bool _1948 = isnan(_1898);
        bool _1950 = _1946 || _1948;
        bool _1952 = isnan(_1868);
        bool _1954 = _1950 || _1952;
        float _1956 = float(_1954);
        _1908 = _1956;
    }
    float _1958 = _1908;
    float _1960 = -_1958;
    float _1962 = fma(_1960, _1846, 1.0);
    float _1964 = -_1882;
    float _1966 = _1962 + _1964;
    float _1968 = _1962;
    if (_1682)
    {
        float _1970 = fma(_1966, 0.0500000007450580596923828125, _1882);
        _1968 = _1970;
    }
    float _1972 = _1968;
    float _1974 = precise::max(0.0, _1972);
    float _1976 = precise::min(_1974, 0.999000012874603271484375);
    uint _1978 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1978)] = as_type<uint>(_1976);
    float _1980 = _1478;
    float _1982 = _1976;
    if (!_1682)
    {
        float _1984 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1980 = _1984;
    }
    float _1986 = _1980;
    int _1988 = _180 + 4;
    float _1990 = _1986;
    if (!_1682)
    {
        float _1992 = fma(_1912, 2000.0, _1986);
        _1990 = _1992;
    }
    float _1994 = _1990;
    float _1996 = _1994;
    float _1998 = _1994;
    if (!_1682)
    {
        uint _2000 = uint(int(uint(_1988) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_2000)] = as_type<uint>(_1994);
    }
    float _2002 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _2004 = uint(int(uint(_1988) >> uint(2)));
    float _2006 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2004)]);
    float _2008 = fma(_1912, 2000.0, _2002);
    float _2010 = _1114 + _2006;
    bool _2012 = _2010 >= _2008;
    bool _2014 = isnan(_2010);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(_2008);
    bool _2020 = _2016 || _2018;
    float _2022 = _2010;
    float _2024 = _2008;
    float _2026 = _2006;
    if (!_2020)
    {
        float _2028 = -_2006;
        float _2030 = _2008 + _2028;
        _2022 = _2030;
    }
    float _2032 = _2022;
    float _2034 = _2032;
    if (!_2020)
    {
        float _2036 = fma(_2032, 0.00999999977648258209228515625, _2006);
        _2034 = _2036;
    }
    float _2038 = _2034;
    float _2040 = _2038;
    if (!_2020)
    {
        uint _2042 = uint(int(uint(_1988) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_2042)] = as_type<uint>(_2038);
    }
    float _2044 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    if (_1682)
    {
        _1936 = as_type<int>(_568);
    }
    int _2046 = _1936;
    int _2048 = _2046;
    if (!_1682)
    {
        float _2050 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _6079 = float2(_2050, _1476);
        float _2052 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6079, float2(0.0), isnan(_6079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6079, float2(0.0), isnan(_6079)), level(0.0)).x;
        float _2054 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float _2056 = fma(_1404, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        bool _2058 = _1918 != 0.0;
        bool _2060 = isnan(_1918);
        bool _2062 = _2058 || _2060;
        bool _2064 = isnan(0.0);
        bool _2066 = _2062 || _2064;
        float2 _6102 = float2(_1890, _2054);
        float _2068 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6102, float2(0.0), isnan(_6102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6102, float2(0.0), isnan(_6102)), level(0.0)).x;
        float2 _6110 = float2(_1890, _2056);
        float _2070 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6110, float2(0.0), isnan(_6110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6110, float2(0.0), isnan(_6110)), level(0.0)).x;
        float2 _6118 = float2(_1474, _2054);
        float _2072 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6118, float2(0.0), isnan(_6118)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6118, float2(0.0), isnan(_6118)), level(0.0)).x;
        float2 _6126 = float2(_2050, _2054);
        float _2074 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6126, float2(0.0), isnan(_6126)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6126, float2(0.0), isnan(_6126)), level(0.0)).x;
        bool _2076 = _1932 != 0.0;
        bool _2078 = isnan(_1932);
        bool _2080 = _2076 || _2078;
        bool _2082 = isnan(0.0);
        bool _2084 = _2080 || _2082;
        float _2086 = _2052;
        float _2088 = _1476;
        float _2090 = _1476;
        float _2092 = _2072;
        float _2094 = _2074;
        float _2096 = _2050;
        if (_2066)
        {
            _1884 = _1918;
        }
        float _2098 = _1884;
        float _2100 = _2098;
        if (!_2066)
        {
            _1938 = 4.0;
        }
        float _2102 = _1938;
        if (!_2066)
        {
            float2 _6165 = float2(_1890, _1476);
            float _2104 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6165, float2(0.0), isnan(_6165)), level(_2102)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6165, float2(0.0), isnan(_6165)), level(_2102)).x;
            _2100 = _2104;
        }
        float _2106 = _2100;
        bool _2108 = _2052 != 0.0;
        bool _2110 = isnan(_2052);
        bool _2112 = _2108 || _2110;
        bool _2114 = isnan(0.0);
        bool _2116 = _2112 || _2114;
        if (!_2116)
        {
            _1652 = 4.0;
        }
        float _2118 = _1652;
        if (!_2116)
        {
            float2 _6196 = float2(_2050, _1476);
            float _2120 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6196, float2(0.0), isnan(_6196)), level(_2118)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6196, float2(0.0), isnan(_6196)), level(_2118)).x;
            _2086 = _2120;
        }
        float _2122 = _2086;
        float2 _6208 = float2(_2050, _2056);
        float _2124 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6208, float2(0.0), isnan(_6208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6208, float2(0.0), isnan(_6208)), level(0.0)).x;
        float2 _6216 = float2(_1474, _2056);
        float _2126 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6216, float2(0.0), isnan(_6216)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6216, float2(0.0), isnan(_6216)), level(0.0)).x;
        bool _2128 = _2068 != 0.0;
        bool _2130 = isnan(_2068);
        bool _2132 = _2128 || _2130;
        bool _2134 = isnan(0.0);
        bool _2136 = _2132 || _2134;
        bool _2138 = _2070 != 0.0;
        bool _2140 = isnan(_2070);
        bool _2142 = _2138 || _2140;
        bool _2144 = isnan(0.0);
        bool _2146 = _2142 || _2144;
        float _2148 = _2126;
        if (_2084)
        {
            _1466 = _1934;
        }
        float _2150 = _1466;
        bool _2152 = _2074 != 0.0;
        bool _2154 = isnan(_2074);
        bool _2156 = _2152 || _2154;
        bool _2158 = isnan(0.0);
        bool _2160 = _2156 || _2158;
        bool _2162 = _2072 != 0.0;
        bool _2164 = isnan(_2072);
        bool _2166 = _2162 || _2164;
        bool _2168 = isnan(0.0);
        bool _2170 = _2166 || _2168;
        if (!_2136)
        {
            _2088 = 4.0;
        }
        float _2172 = _2088;
        float _2174 = _2172;
        if (!_2146)
        {
            _1940 = 4.0;
        }
        float _2176 = _1940;
        float _2178 = _2068;
        float _2180 = _2176;
        if (!_2136)
        {
            float2 _6290 = float2(_1890, _2054);
            float _2182 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6290, float2(0.0), isnan(_6290)), level(_2172)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6290, float2(0.0), isnan(_6290)), level(_2172)).x;
            _2178 = _2182;
        }
        float _2184 = _2178;
        if (_2084)
        {
            _1996 = _1932;
        }
        float _2186 = _1996;
        float _2188 = _2070;
        if (!_2146)
        {
            float2 _6311 = float2(_1890, _2056);
            float _2190 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6311, float2(0.0), isnan(_6311)), level(_2176)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6311, float2(0.0), isnan(_6311)), level(_2176)).x;
            _2188 = _2190;
        }
        float _2192 = _2188;
        if (_2170)
        {
            _2090 = _2072;
        }
        float _2194 = _2090;
        if (_2160)
        {
            _2174 = _2074;
        }
        float _2196 = _2174;
        if (!_2160)
        {
            _2180 = 4.0;
        }
        float _2198 = _2180;
        if (!_2170)
        {
            _2092 = 4.0;
        }
        float _2200 = _2092;
        float _2202 = _2196;
        if (!_2160)
        {
            float2 _6347 = float2(_2050, _2054);
            float _2204 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6347, float2(0.0), isnan(_6347)), level(_2198)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6347, float2(0.0), isnan(_6347)), level(_2198)).x;
            _2202 = _2204;
        }
        float _2206 = _2202;
        if (!_2084)
        {
            _1942 = 4.0;
        }
        float _2208 = _1942;
        bool _2210 = _2124 != 0.0;
        bool _2212 = isnan(_2124);
        bool _2214 = _2210 || _2212;
        bool _2216 = isnan(0.0);
        bool _2218 = _2214 || _2216;
        bool _2220 = _2126 != 0.0;
        bool _2222 = isnan(_2126);
        bool _2224 = _2220 || _2222;
        bool _2226 = isnan(0.0);
        bool _2228 = _2224 || _2226;
        if (!_2218)
        {
            _2094 = 4.0;
        }
        float _2230 = _2094;
        if (_2228)
        {
            _2096 = _2126;
        }
        float _2232 = _2096;
        if (!_2228)
        {
            _2148 = 4.0;
        }
        float _2234 = _2148;
        float _2236 = _2124;
        if (!_2218)
        {
            float2 _6405 = float2(_2050, _2056);
            float _2238 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6405, float2(0.0), isnan(_6405)), level(_2230)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6405, float2(0.0), isnan(_6405)), level(_2230)).x;
            _2236 = _2238;
        }
        float _2240 = _2236;
        float _2242 = _2194;
        if (!_2170)
        {
            float2 _6421 = float2(_1474, _2054);
            float _2244 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6421, float2(0.0), isnan(_6421)), level(_2200)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6421, float2(0.0), isnan(_6421)), level(_2200)).x;
            _2242 = _2244;
        }
        float _2246 = _2242;
        float _2248 = _2232;
        if (!_2228)
        {
            float2 _6437 = float2(_1474, _2056);
            float _2250 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6437, float2(0.0), isnan(_6437)), level(_2234)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6437, float2(0.0), isnan(_6437)), level(_2234)).x;
            _2248 = _2250;
        }
        float _2252 = _2248;
        float _2254 = _2186;
        float _2256 = _2150;
        if (!_2084)
        {
            float2 _6454 = float2(_1474, _1476);
            float2 _2258 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_6454, float2(0.0), isnan(_6454)), level(_2208)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_6454, float2(0.0), isnan(_6454)), level(_2208)).xy;
            float _2260 = _2258.x;
            float _2262 = _2258.y;
            _2254 = _2260;
            _2256 = _2262;
        }
        float _2264 = _2254;
        float _2266 = _2256;
        float _2268 = -_2184;
        float _2270 = _1912 + _2268;
        float _2272 = -_2192;
        float _2274 = _1912 + _2272;
        float _2276 = -_2106;
        float _2278 = _1912 + _2276;
        float _2280 = -_2122;
        float _2282 = _1912 + _2280;
        float _2284 = abs(_2270);
        float _2286 = abs(_2274);
        float _2288 = precise::max(_2284, _2286);
        float _2290 = abs(_2278);
        float _2292 = abs(_2282);
        float _2294 = precise::max(_2290, _2292);
        float _2296 = -_2206;
        float _2298 = _1912 + _2296;
        float _2300 = -_2240;
        float _2302 = _1912 + _2300;
        float _2304 = -_2246;
        float _2306 = _1912 + _2304;
        float _2308 = -_2252;
        float _2310 = _1912 + _2308;
        float _2312 = abs(_2298);
        float _2314 = abs(_2302);
        float _2316 = precise::max(_2312, _2314);
        float _2318 = abs(_2306);
        float _2320 = abs(_2310);
        float _2322 = precise::max(_2318, _2320);
        float _2324 = precise::max(_2288, _2316);
        float _2326 = precise::max(_2294, _2322);
        bool _2328 = _2324 > 0.00150000001303851604461669921875;
        bool _2330 = _2326 > 0.00150000001303851604461669921875;
        bool _2332 = _2330 || _2328;
        bool _2334 = _2264 < _2266;
        bool _2336 = _2334 || _2332;
        bool _2338 = !_2336;
        int _2340 = _2338 ? as_type<int>(_568) : 0;
        _2024 = _2310;
        _1732 = _2326;
        _1944 = _2294;
        _1886 = _2278;
        _1894 = _2302;
        _1982 = _2324;
        _2040 = _2288;
        _2026 = _2270;
        _1998 = _2264;
        _1468 = _2266;
        _2048 = _2340;
    }
    float _2342 = _2024;
    float _2344 = _1732;
    float _2346 = _1944;
    float _2348 = _1886;
    float _2350 = _1894;
    float _2352 = _1982;
    float _2354 = _2040;
    float _2356 = _2026;
    float _2358 = _1998;
    float _2360 = _1468;
    int _2362 = _2048;
    int _2364 = as_type<int>(_2044) & 512;
    bool _2366 = _2364 != 0;
    int _2368 = as_type<int>(_2044) & 1024;
    bool _2370 = _2368 != 0;
    float _2372 = _2342;
    float _2374 = _2344;
    float _2376 = _2346;
    float _2378 = _2348;
    bool _2380 = _2366;
    if (_2366)
    {
        float _2382 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _2384 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _2386 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _2388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _2372 = _2382;
        _2374 = _2384;
        _2376 = _2386;
        _2378 = _2388;
    }
    float _2390 = _2372;
    float _2392 = _2374;
    float _2394 = _2376;
    float _2396 = _2378;
    float _2398 = _2350;
    float _2400 = _2352;
    float _2402 = _2354;
    float _2404 = _2356;
    if (_2366)
    {
        float _2406 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _2408 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _2410 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _2412 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _2398 = _2406;
        _2400 = _2408;
        _2402 = _2410;
        _2404 = _2412;
    }
    float _2414 = _2398;
    float _2416 = _2400;
    float _2418 = _2402;
    float _2420 = _2404;
    float _2422 = _1474;
    float _2424 = _1476;
    float _2426 = _2358;
    float _2428 = _2360;
    if (_2366)
    {
        float _2430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _2432 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _2434 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _2436 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _2422 = _2430;
        _2424 = _2432;
        _2426 = _2434;
        _2428 = _2436;
    }
    float _2438 = _2422;
    float _2440 = _2424;
    float _2442 = _2426;
    float _2444 = _2428;
    if (!_2020)
    {
        float _2446 = _1114 * 0.9900000095367431640625;
        _1120 = _2446;
    }
    float _2448 = _1120;
    int _2450 = as_type<int>(_2044) & 2048;
    bool _2452 = _2450 != 0;
    float _2454 = _2390;
    if (_2366)
    {
        float _2456 = _2392 * _2448;
        _698 = _2456;
    }
    float _2458 = _698;
    float _2460 = _2416;
    float _2462 = _2458;
    float _2464 = _2440;
    float _2466 = _2414;
    float _2468 = _2418;
    float _2470 = _2438;
    float _2472 = _2442;
    float _2474 = _2420;
    if (_2366)
    {
        float _2476 = _2416 * _2448;
        _2460 = _2476;
    }
    float _2478 = _2460;
    float _2480 = _2478;
    if (_2366)
    {
        float _2482 = fma(_1116, _2390, _2458);
        _2462 = _2482;
    }
    float _2484 = _2462;
    float _2486 = _2484;
    if (_2366)
    {
        float _2488 = _2440 * _2448;
        _2464 = _2488;
    }
    float _2490 = _2464;
    float _2492 = _2490;
    if (_2366)
    {
        float _2494 = fma(_1116, _2414, _2478);
        _2480 = _2494;
    }
    float _2496 = _2480;
    if (_2366)
    {
        float _2498 = fma(_1118, _2394, _2484);
        _2486 = _2498;
    }
    float _2500 = _2486;
    if (!_2366)
    {
        _2466 = 0.0;
    }
    float _2502 = _2466;
    float _2504 = _2502;
    if (_2366)
    {
        float _2506 = fma(_1116, _2438, _2490);
        _2454 = _2506;
    }
    float _2508 = _2454;
    if (_2366)
    {
        float _2510 = fma(_1118, _2418, _2496);
        _2468 = _2510;
    }
    float _2512 = _2468;
    if (!_2366)
    {
        _2492 = 0.0;
        _2470 = 0.0;
    }
    float _2514 = _2492;
    float _2516 = _2470;
    float _2518 = _2514;
    float _2520 = _2516;
    if (_2366)
    {
        float _2522 = _2396 + _2500;
        _2504 = _2522;
    }
    float _2524 = _2504;
    if (_2366)
    {
        float _2526 = fma(_1118, _2442, _2508);
        _2472 = _2526;
    }
    float _2528 = _2472;
    float _2530 = _2528;
    if (_2366)
    {
        float _2532 = _2420 + _2512;
        _2518 = _2532;
    }
    float _2534 = _2518;
    int _2536 = _180 + 8;
    if (_2366)
    {
        float _2538 = _2444 + _2528;
        _2520 = _2538;
    }
    float _2540 = _2520;
    float _2542 = _2540;
    if (!_2370)
    {
        _2530 = _2524;
    }
    float _2544 = _2530;
    float _2546 = _2544;
    if (!_2370)
    {
        _2474 = _2534;
    }
    float _2548 = _2474;
    bool _2550 = !_2370;
    float _2552 = _2548;
    if (!_2550)
    {
        float _2554 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _2556 = uint(int(uint(_180) >> uint(2)));
        float _2558 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2556)]);
        int _2560 = _180 + 4;
        uint _2562 = uint(int(uint(_2560) >> uint(2)));
        float _2564 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2562)]);
        int _2566 = _180 + 8;
        uint _2568 = uint(int(uint(_2566) >> uint(2)));
        float _2570 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2568)]);
        uint _2572 = uint(int(uint(_180) >> uint(2)));
        float _2574 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2572)]);
        int _2576 = _180 + 4;
        uint _2578 = uint(int(uint(_2576) >> uint(2)));
        float _2580 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2578)]);
        int _2582 = _180 + 8;
        uint _2584 = uint(int(uint(_2582) >> uint(2)));
        float _2586 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2584)]);
        uint _2588 = uint(int(uint(_180) >> uint(2)));
        float _2590 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2588)]);
        int _2592 = _180 + 4;
        uint _2594 = uint(int(uint(_2592) >> uint(2)));
        float _2596 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2594)]);
        int _2598 = _180 + 8;
        uint _2600 = uint(int(uint(_2598) >> uint(2)));
        float _2602 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2600)]);
        float _2604 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _2606 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _2608 = _2564 * _2448;
        float _2610 = _2580 * _2448;
        float _2612 = _2596 * _2448;
        float _2614 = fma(_1116, _2558, _2608);
        float _2616 = fma(_1116, _2574, _2610);
        float _2618 = fma(_1116, _2590, _2612);
        float _2620 = fma(_1118, _2570, _2614);
        float _2622 = fma(_1118, _2586, _2616);
        float _2624 = fma(_1118, _2602, _2618);
        float _2626 = _2554 + _2620;
        float _2628 = _2604 + _2622;
        float _2630 = _2606 + _2624;
        _2552 = _2628;
        _2542 = _2630;
        _2546 = _2626;
    }
    float _2632 = _2552;
    float _2634 = _2542;
    float _2636 = _2546;
    bool _2638 = !_2452;
    float _2640 = _2636;
    float _2642 = _2634;
    float _2644 = _2632;
    if (!_2638)
    {
        uint _2646 = uint(int(uint(_180) >> uint(2)));
        float _2648 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2646)]);
        int _2650 = _180 + 4;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        float _2654 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2652)]);
        int _2656 = _180 + 8;
        uint _2658 = uint(int(uint(_2656) >> uint(2)));
        float _2660 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2658)]);
        int _2662 = _180 + 12;
        uint _2664 = uint(int(uint(_2662) >> uint(2)));
        float _2666 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2664)]);
        uint _2668 = uint(int(uint(_180) >> uint(2)));
        float _2670 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2668)]);
        int _2672 = _180 + 4;
        uint _2674 = uint(int(uint(_2672) >> uint(2)));
        float _2676 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2674)]);
        int _2678 = _180 + 8;
        uint _2680 = uint(int(uint(_2678) >> uint(2)));
        float _2682 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2680)]);
        int _2684 = _180 + 12;
        uint _2686 = uint(int(uint(_2684) >> uint(2)));
        float _2688 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_2686)]);
        uint _2690 = uint(int(uint(_180) >> uint(2)));
        float _2692 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2690)]);
        int _2694 = _180 + 4;
        uint _2696 = uint(int(uint(_2694) >> uint(2)));
        float _2698 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2696)]);
        int _2700 = _180 + 8;
        uint _2702 = uint(int(uint(_2700) >> uint(2)));
        float _2704 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2702)]);
        int _2706 = _180 + 12;
        uint _2708 = uint(int(uint(_2706) >> uint(2)));
        float _2710 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2708)]);
        float _2712 = _2654 * _2448;
        float _2714 = _2676 * _2448;
        float _2716 = _2698 * _2448;
        float _2718 = fma(_1116, _2648, _2712);
        float _2720 = fma(_1116, _2670, _2714);
        float _2722 = fma(_1116, _2692, _2716);
        float _2724 = fma(_1118, _2660, _2718);
        float _2726 = fma(_1118, _2682, _2720);
        float _2728 = fma(_1118, _2704, _2722);
        float _2730 = _2724 + _2666;
        float _2732 = _2726 + _2688;
        float _2734 = _2728 + _2710;
        _2640 = _2730;
        _2642 = _2734;
        _2644 = _2732;
    }
    float _2736 = _2640;
    float _2738 = _2642;
    float _2740 = _2644;
    uint _2742 = uint(int(uint(_2536) >> uint(2)));
    float _2744 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_2742)]);
    float _2746 = fma(_2736, 6.2500002968590706586837768554688e-05, 0.5);
    float _2748 = fma(_2738, 6.2500002968590706586837768554688e-05, 0.5);
    float _2750 = _1682 ? _2744 : 1.0;
    bool _2752 = _2750 > 0.00999999977648258209228515625;
    float _2754 = _2738;
    float _2756 = _2740;
    if (_2752)
    {
        float2 _7180 = float2(_2746, _2748);
        float _2758 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_7180, float2(0.0), isnan(_7180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_7180, float2(0.0), isnan(_7180)), level(0.0)).x;
        _2754 = _2758;
    }
    float _2760 = _2754;
    float2 _7191 = float2(_2746, _2748);
    float _2762 = dm_bs(spvDescriptorSet0.cp_t_tcb_22.sample(spvDescriptorSet0.cp_t_tcb_22Smplr, select(_7191, float2(0.0), isnan(_7191)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_22, spvDescriptorSet0.cp_t_tcb_22Smplr_w, select(_7191, float2(0.0), isnan(_7191)), level(0.0)).x;
    if (_2752)
    {
        float _2764 = _2740 + 1.0;
        _2756 = _2764;
    }
    float _2766 = _2756;
    if (!_2020)
    {
        _700 = 0.0;
    }
    float _2768 = _700;
    float _2770 = -_196;
    float _2772 = _2770 + _1118;
    float _2774 = _2760;
    if (_2752)
    {
        float _2776 = _2760 * 2000.0;
        _2774 = _2776;
    }
    float _2778 = _2774;
    float _2780 = abs(_2762);
    bool _2782 = _2780 == 0.0;
    float _2784 = float(_2782);
    float _2786 = _2784;
    if (_2752)
    {
        bool _2788 = _2766 >= _2778;
        bool _2790 = isnan(_2766);
        bool _2792 = _2788 || _2790;
        bool _2794 = isnan(_2778);
        bool _2796 = _2792 || _2794;
        _2380 = _2796;
    }
    bool _2798 = _2380;
    if (_2752)
    {
        float _2800 = _2798 ? _2784 : 1.0;
        _2786 = _2800;
    }
    float _2802 = _2786;
    float _2804 = -_2750;
    float _2806 = _2804 + _2802;
    float _2808 = _2802;
    if (_1682)
    {
        float _2810 = fma(_2806, 0.0500000007450580596923828125, _2750);
        _2808 = _2810;
    }
    float _2812 = _2808;
    float _2814 = -_184;
    float _2816 = _2814 + _1116;
    float _2818 = 0.0 + _2812;
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = -_190;
    float _2824 = _2822 + _2448;
    uint _2826 = uint(int(uint(_2536) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2826)] = as_type<uint>(_2820);
    uint _2828 = uint(int(uint(_202) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2828)] = uint(_2362);
    uint _2830 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2830)] = as_type<uint>(_1116);
    uint _2832 = uint(int(uint(_1988) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2832)] = as_type<uint>(_2448);
    uint _2834 = uint(int(uint(_2536) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2834)] = as_type<uint>(_1118);
    uint _2836 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2836)] = as_type<uint>(_672);
    uint _2838 = uint(int(uint(_1988) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2838)] = as_type<uint>(_2768);
    uint _2840 = uint(int(uint(_2536) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2840)] = as_type<uint>(_686);
    uint _2842 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2842)] = as_type<uint>(_2816);
    uint _2844 = uint(int(uint(_1988) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2844)] = as_type<uint>(_2824);
    uint _2846 = uint(int(uint(_2536) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2846)] = as_type<uint>(_2772);
    float _2848 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2850 = _2824 * _2824;
    float _2852 = _2768 * _2768;
    float _2854 = fma(_2816, _2816, _2850);
    float _2856 = fma(_672, _672, _2852);
    float _2858 = fma(_2772, _2772, _2854);
    float _2860 = fma(_686, _686, _2856);
    float _2862 = sqrt(_2860);
    float _2864 = sqrt(_2858);
    bool _2866 = _2864 >= 9.9999999747524270787835121154785e-07;
    bool _2868 = isnan(_2864);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan(9.9999999747524270787835121154785e-07);
    bool _2874 = _2870 || _2872;
    if (!_2874)
    {
        bool _2876 = _546 != _302;
        bool _2878 = isnan(_546);
        bool _2880 = _2876 || _2878;
        bool _2882 = isnan(_302);
        bool _2884 = _2880 || _2882;
        _2886 = _2884;
        if (!_2886)
        {
            float _2888 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2890 = _2888 > 0.0;
            bool _2892 = !_2890;
            if (!_2892)
            {
                float _2894 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2896 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2898 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2900 = _2896 * _522;
                float _2902 = _2896 * _520;
                float _2904 = _2896 * _524;
                float _2906 = fma(_2894, _528, _2900);
                float _2908 = fma(_2894, _526, _2902);
                float _2910 = fma(_2894, _530, _2904);
                float _2912 = fma(_2898, _534, _2906);
                float _2914 = fma(_2898, _532, _2908);
                float _2916 = fma(_2898, _536, _2910);
                float _2918 = _2912 * _2912;
                float _2920 = fma(_2914, _2914, _2918);
                float _2922 = fma(_2916, _2916, _2920);
                float _2924 = rsqrt(_2922);
                float _2926 = _2924 * 9.9999999747524270787835121154785e-07;
                float _2928 = _2914 * _2926;
                float _2930 = _2912 * _2926;
                float _2932 = _2916 * _2926;
                _340 = as_type<int>(_2928);
                _342 = as_type<int>(_2930);
                _344 = as_type<int>(_2932);
                _2886 = true;
            }
            else
            {
                bool _2934 = _2862 >= 9.9999999747524270787835121154785e-07;
                bool _2936 = isnan(_2862);
                bool _2938 = _2934 || _2936;
                bool _2940 = isnan(9.9999999747524270787835121154785e-07);
                bool _2942 = _2938 || _2940;
                if (!_2942)
                {
                    float _2944 = _2448 * _2448;
                    float _2946 = fma(_1116, _1116, _2944);
                    float _2948 = fma(_1118, _1118, _2946);
                    float _2950 = sqrt(_2948);
                    bool _2952 = _2950 >= 9.9999999747524270787835121154785e-07;
                    bool _2954 = isnan(_2950);
                    bool _2956 = _2952 || _2954;
                    bool _2958 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2960 = _2956 || _2958;
                    float _2962 = _2950;
                    if (_2960)
                    {
                        float _2964 = rsqrt(_2948);
                        _2962 = _2964;
                    }
                    float _2966 = _2962;
                    if (!_2960)
                    {
                        _328 = 0;
                    }
                    int _2968 = _328;
                    int _2970 = _2968;
                    if (!_2960)
                    {
                        _330 = 897988541;
                    }
                    int _2972 = _330;
                    int _2974 = _2972;
                    if (!_2960)
                    {
                        _332 = 0;
                    }
                    int _2976 = _332;
                    float _2978 = _2966;
                    int _2980 = _2976;
                    if (_2960)
                    {
                        float _2982 = _2966 * 9.9999999747524270787835121154785e-07;
                        _2978 = _2982;
                    }
                    float _2984 = _2978;
                    if (_2960)
                    {
                        float _2986 = _1116 * _2984;
                        _2970 = as_type<int>(_2986);
                    }
                    int _2988 = _2970;
                    _340 = _2988;
                    if (_2960)
                    {
                        float _2990 = _2448 * _2984;
                        _2974 = as_type<int>(_2990);
                    }
                    int _2992 = _2974;
                    _342 = _2992;
                    if (_2960)
                    {
                        float _2994 = _1118 * _2984;
                        _2980 = as_type<int>(_2994);
                    }
                    int _2996 = _2980;
                    _344 = _2996;
                    _2886 = true;
                }
                else
                {
                    float _2998 = rsqrt(_2860);
                    float _3000 = _2998 * 9.9999999747524270787835121154785e-07;
                    float _3002 = _672 * _3000;
                    float _3004 = _2768 * _3000;
                    float _3006 = _686 * _3000;
                    _340 = as_type<int>(_3002);
                    _342 = as_type<int>(_3004);
                    _344 = as_type<int>(_3006);
                    _2886 = true;
                }
            }
        }
    }
    else
    {
        float _3008 = _2862 * _2848;
        bool _3010 = _3008 >= 0.001000000047497451305389404296875;
        bool _3012 = isnan(_3008);
        bool _3014 = _3010 || _3012;
        bool _3016 = isnan(0.001000000047497451305389404296875);
        bool _3018 = _3014 || _3016;
        bool _3020 = _3008 > 0.0;
        bool _3022 = !_3018;
        bool _3024 = _3020 && _3022;
        bool _3026 = _2864 < 0.001000000047497451305389404296875;
        bool _3028 = _3026 && _3024;
        if (!_3028)
        {
            _334 = as_type<int>(_2816);
        }
        int _3030 = _334;
        int _3032 = _3030;
        if (_3028)
        {
            float _3034 = _672 * _2848;
            _3032 = as_type<int>(_3034);
        }
        int _3036 = _3032;
        _340 = _3036;
        if (!_3028)
        {
            _336 = as_type<int>(_2824);
        }
        int _3038 = _336;
        int _3040 = _3038;
        if (_3028)
        {
            float _3042 = _2848 * _2768;
            _3040 = as_type<int>(_3042);
        }
        int _3044 = _3040;
        _342 = _3044;
        if (!_3028)
        {
            _338 = as_type<int>(_2772);
        }
        int _3046 = _338;
        _344 = _3046;
        if (_3028)
        {
            float _3048 = _686 * _2848;
            _344 = as_type<int>(_3048);
        }
    }
    _2886 = false;
    int _3050 = _340;
    int _3052 = _342;
    int _3054 = _344;
    uint _3056 = uint(int(uint(_180) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3056)] = uint(_3050);
    uint _3058 = uint(int(uint(_1988) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3058)] = uint(_3052);
    uint _3060 = uint(int(uint(_2536) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_3060)] = uint(_3054);
}

