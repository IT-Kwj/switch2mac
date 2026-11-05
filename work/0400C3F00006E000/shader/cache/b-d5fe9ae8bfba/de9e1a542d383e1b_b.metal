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
    device _21* cp_s14 [[id(14)]];
    texture2d_array<float> cp_t_tcb_16 [[id(15)]];
    sampler cp_t_tcb_16Smplr [[id(16)]];
    texture2d_array<float> cp_t_tcb_14 [[id(17)]];
    sampler cp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> cp_t_tcb_2A [[id(19)]];
    sampler cp_t_tcb_2ASmplr [[id(20)]];
    texture2d<float> cp_t_tcb_2C [[id(21)]];
    sampler cp_t_tcb_2CSmplr [[id(22)]];
    sampler cp_t_tcb_14Smplr_w [[id(23)]];
    sampler cp_t_tcb_2ASmplr_w [[id(24)]];
    sampler cp_t_tcb_2CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _4822 = false;
    bool _2850 = false;
    bool _3556 = false;
    bool _2664 = false;
    bool _836 = false;
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _84 = as_type<float>(gl_LocalInvocationID.x);
    float _86 = as_type<float>(gl_WorkGroupID.x);
    int _89 = as_type<int>(_86) << 5;
    int _91 = _89 + as_type<int>(_84);
    float _93 = trunc(_82);
    int _95 = int(_93);
    bool _99 = _91 >= _95;
    int _101 = _95;
    float _103 = _82;
    float _105 = _86;
    if (_99)
    {
        _101 = 0;
    }
    int _107 = _101;
    int _109 = _107;
    int _111 = _107;
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
        _105 = as_type<float>(_124);
        if (!_126)
        {
            _109 = 0;
        }
        int _130 = _109;
        bool _132 = !_126;
        _111 = _130;
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
            _105 = _140;
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
            _111 = _162;
            if (!_146)
            {
                int _164 = ~_160;
                int _166 = (_164 != 0) ? 0 : 1;
                _111 = _166;
            }
        }
    }
    int _168 = _111;
    float _170 = _103;
    float _172 = _105;
    int _174 = _168 & 1;
    bool _176 = _174 != 0;
    if (!_176)
    {
        return;
    }
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[85]);
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[84]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[86]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    int _200 = as_type<int>(_180) & 512;
    bool _202 = _200 != 0;
    float _204 = 0.0;
    float _206 = 0.0;
    float _208 = 0.0;
    float _210 = 0.0;
    float _212 = _180;
    if (_202)
    {
        float _214 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        float _220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[35]);
        _204 = _214;
        _206 = _216;
        _208 = _218;
        _210 = _220;
    }
    float _222 = _204;
    float _224 = _206;
    float _226 = _208;
    float _228 = _210;
    float _230 = 0.0;
    float _232 = 0.0;
    float _234 = 0.0;
    if (_202)
    {
        float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _238 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _240 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _230 = _236;
        _232 = _238;
        _234 = _240;
    }
    float _242 = _230;
    float _244 = _232;
    float _246 = _234;
    float _248 = as_type<float>(_168);
    float _250 = _170;
    float _252 = _172;
    if (_202)
    {
        float _254 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _256 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _258 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _248 = _254;
        _250 = _256;
        _252 = _258;
    }
    float _260 = _248;
    float _262 = _250;
    float _264 = _252;
    int _266 = _91 << 4;
    int _268 = _266 + 12;
    uint _270 = uint(int(uint(_266) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_270)]);
    int _274 = _266 + 4;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_276)]);
    int _280 = _266 + 8;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_282)]);
    uint _286 = uint(int(uint(_266) >> uint(2)));
    float _288 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_286)]);
    int _290 = _266 + 4;
    uint _292 = uint(int(uint(_290) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_292)]);
    int _296 = _266 + 8;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_298)]);
    uint _302 = uint(int(uint(_268) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_302)]);
    uint _306 = uint(int(uint(_266) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_306)]);
    uint _310 = uint(int(uint(_266) >> uint(2)));
    float _312 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_310)]);
    int _314 = _266 + 4;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    float _318 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_316)]);
    int _320 = _266 + 8;
    uint _322 = uint(int(uint(_320) >> uint(2)));
    float _324 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_322)]);
    uint _326 = uint(int(uint(_268) >> uint(2)));
    float _328 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_326)]);
    float _330 = _228;
    float _332 = _222;
    float _334 = _242;
    float _336 = _224;
    float _338 = _244;
    float _340 = _226;
    float _342 = _246;
    float _344 = _260;
    float _346 = _262;
    float _348 = _264;
    float _350 = _186;
    float _352 = _178;
    float _354 = _308;
    int _356 = as_type<int>(_288);
    int _358 = as_type<int>(_294);
    int _360 = as_type<int>(_300);
    int _362 = as_type<int>(_288);
    int _364 = as_type<int>(_294);
    int _366 = as_type<int>(_300);
    int _368 = as_type<int>(_288);
    int _370 = as_type<int>(_294);
    int _372 = as_type<int>(_300);
    if (!_202)
    {
        int _374 = _266 + 4;
        uint _376 = uint(int(uint(_266) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_376)]);
        int _380 = _266 + 8;
        uint _382 = uint(int(uint(_266) >> uint(2)));
        float _384 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_382)]);
        uint _386 = uint(int(uint(_374) >> uint(2)));
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_386)]);
        uint _390 = uint(int(uint(_374) >> uint(2)));
        float _392 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_390)]);
        uint _394 = uint(int(uint(_380) >> uint(2)));
        float _396 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_394)]);
        uint _398 = uint(int(uint(_266) >> uint(2)));
        float _400 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_398)]);
        uint _402 = uint(int(uint(_380) >> uint(2)));
        float _404 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_402)]);
        uint _406 = uint(int(uint(_374) >> uint(2)));
        float _408 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_406)]);
        uint _410 = uint(int(uint(_380) >> uint(2)));
        float _412 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_410)]);
        float _414 = _378 * _378;
        float _416 = fma(_384, _384, _414);
        float _418 = _388 * _388;
        float _420 = fma(_392, _392, _418);
        float _422 = _396 * _396;
        float _424 = fma(_400, _400, _416);
        float _426 = fma(_404, _404, _422);
        float _428 = sqrt(_424);
        float _430 = fma(_408, _408, _420);
        float _432 = fma(_412, _412, _426);
        float _434 = sqrt(_430);
        float _436 = sqrt(_432);
        bool _438 = _428 > 0.0;
        bool _440 = _434 > 0.0;
        bool _442 = _436 > 0.0;
        float _444 = _434;
        float _446 = _436;
        float _448 = _426;
        float _450 = _378;
        float _452 = _428;
        float _454 = _384;
        float _456 = _420;
        float _458 = _388;
        float _460 = _408;
        float _462 = _400;
        _330 = _404;
        if (_438)
        {
            float _464 = rsqrt(_424);
            _444 = _464;
        }
        float _466 = _444;
        float _468 = 0.0;
        if (_440)
        {
            float _470 = rsqrt(_430);
            _468 = _470;
        }
        float _472 = _468;
        float _474 = 0.0;
        if (_442)
        {
            float _476 = rsqrt(_432);
            _474 = _476;
        }
        float _478 = _474;
        if (!_438)
        {
            _446 = 0.0;
        }
        float _480 = _446;
        float _482 = _480;
        if (_438)
        {
            float _484 = _378 * _466;
            _482 = _484;
        }
        float _486 = _482;
        _334 = _486;
        if (!_438)
        {
            _448 = 0.0;
        }
        float _488 = _448;
        float _490 = _488;
        if (_438)
        {
            float _492 = _384 * _466;
            _490 = _492;
        }
        float _494 = _490;
        _332 = _494;
        if (!_438)
        {
            _450 = 0.0;
        }
        float _496 = _450;
        float _498 = _496;
        if (_438)
        {
            float _500 = _400 * _466;
            _498 = _500;
        }
        float _502 = _498;
        _344 = _502;
        if (!_440)
        {
            _452 = 0.0;
        }
        float _504 = _452;
        float _506 = _504;
        if (_440)
        {
            float _508 = _388 * _472;
            _506 = _508;
        }
        float _510 = _506;
        _338 = _510;
        if (!_440)
        {
            _454 = 0.0;
        }
        float _512 = _454;
        float _514 = _512;
        if (_440)
        {
            float _516 = _408 * _472;
            _514 = _516;
        }
        float _518 = _514;
        _346 = _518;
        if (!_440)
        {
            _456 = 0.0;
        }
        float _520 = _456;
        float _522 = _520;
        if (_440)
        {
            float _524 = _392 * _472;
            _522 = _524;
        }
        float _526 = _522;
        _336 = _526;
        if (!_442)
        {
            _458 = 0.0;
        }
        float _528 = _458;
        float _530 = _528;
        if (!_442)
        {
            _460 = 0.0;
        }
        float _532 = _460;
        float _534 = _532;
        if (_442)
        {
            float _536 = _396 * _478;
            _530 = _536;
        }
        float _538 = _530;
        _342 = _538;
        if (!_442)
        {
            _462 = 0.0;
        }
        float _540 = _462;
        _348 = _540;
        if (_442)
        {
            float _542 = _404 * _478;
            _534 = _542;
        }
        float _544 = _534;
        _340 = _544;
        if (_442)
        {
            float _546 = _412 * _478;
            _348 = _546;
        }
    }
    float _548 = _330;
    float _550 = _332;
    float _552 = _334;
    float _554 = _336;
    float _556 = _338;
    float _558 = _340;
    float _560 = _342;
    float _562 = _344;
    float _564 = _346;
    float _566 = _348;
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _570 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _572 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    bool _576 = _194 > 0.0;
    float _578 = abs(_196);
    float _580 = log2(_578);
    bool _582 = _184 > 0.0;
    float _584 = _194;
    float _586 = _548;
    bool _588 = _582;
    float _590 = _550;
    float _592 = _560;
    float _594 = _566;
    float _596 = _564;
    float _598 = _550;
    float _600 = _552;
    float _602 = _560;
    float _604 = _556;
    if (_576)
    {
        float _606 = 1.0 / _194;
        _584 = _606;
    }
    float _608 = _584;
    float _610 = -_304;
    float _612 = _182 + _610;
    float _614 = _178 * _580;
    float _616 = _186 * _184;
    float _618 = _178 * _198;
    float _620 = _328 * _178;
    float _622 = exp2(_614);
    float _624 = _620;
    if (_582)
    {
        float _626 = -_616;
        float _628 = fma(_308, _626, _186);
        _350 = _628;
    }
    float _630 = _350;
    uint _632 = uint(int(uint(_268) >> uint(2)));
    float _634 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_632)]);
    float _636 = _188 * _618;
    float _638 = _190 * _618;
    float _640 = _192 * _618;
    float _642 = _630;
    float _644 = _608;
    float _646 = _638;
    float _648 = _640;
    if (_576)
    {
        float _650 = _612 * _608;
        _586 = _650;
    }
    float _652 = _586;
    float _654 = fma(_312, _620, _272);
    float _656 = _652;
    if (_576)
    {
        float _658 = precise::min(_652, 1.0);
        _656 = _658;
    }
    float _660 = _656;
    float _662 = fma(_312, _622, _636);
    float _664 = fma(_318, _622, _638);
    float _666 = _622;
    float _668 = _664;
    float _670 = _662;
    if (_576)
    {
        float _672 = _660 * _630;
        _642 = _672;
    }
    float _674 = _642;
    float _676 = fma(_324, _620, _284);
    float _678 = fma(_324, _622, _640);
    float _680 = fma(_318, _620, _278);
    float _682 = _178 * _674;
    float _684 = _568 * _682;
    float _686 = _570 * _682;
    float _688 = _572 * _682;
    bool _690 = !_202;
    float _692 = _682;
    float _694 = _674;
    float _696 = _568;
    float _698 = _570;
    float _700 = _572;
    float _702 = _574;
    float _704 = _684;
    float _706 = _686;
    float _708 = _680;
    float _710 = _678;
    float _832;
    float _834;
    if (!_690)
    {
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _718 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _728 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _730 = _716 * _718;
        float _732 = _716 * _720;
        float _734 = _714 * _718;
        float _736 = -_730;
        float _738 = fma(_712, _722, _736);
        float _740 = -_732;
        float _742 = fma(_714, _722, _740);
        float _744 = -_734;
        float _746 = fma(_712, _720, _744);
        float _748 = _726 * _712;
        float _750 = _726 * _738;
        float _752 = _728 * _714;
        float _754 = _724 * _720;
        float _756 = -_748;
        float _758 = fma(_724, _714, _756);
        float _760 = -_750;
        float _762 = fma(_724, _742, _760);
        float _764 = _726 * _722;
        float _766 = _728 * _718;
        float _768 = _724 * _716;
        float _770 = fma(_728, _746, _762);
        float _772 = -_764;
        float _774 = fma(_728, _720, _772);
        float _776 = -_766;
        float _778 = fma(_724, _722, _776);
        float _780 = -_754;
        float _782 = fma(_726, _718, _780);
        float _784 = -_768;
        float _786 = fma(_728, _712, _784);
        float _788 = -_712;
        float _790 = fma(_788, _722, _730);
        float _792 = 1.0 / _770;
        float _794 = -_752;
        float _796 = fma(_726, _716, _794);
        float _798 = _774 * _792;
        float _800 = _778 * _792;
        float _802 = _782 * _792;
        float _804 = _684 * _792;
        float _806 = _686 * _798;
        float _808 = _686 * _800;
        float _810 = _686 * _802;
        float _812 = _790 * _792;
        float _814 = _796 * _792;
        float _816 = _786 * _792;
        float _818 = _758 * _792;
        float _820 = fma(_742, _804, _806);
        float _822 = fma(_684, _812, _808);
        float _824 = fma(_746, _804, _810);
        float _826 = fma(_688, _814, _820);
        float _828 = fma(_688, _816, _822);
        float _830 = fma(_688, _818, _824);
        _646 = _790;
        _692 = _814;
        _648 = _806;
        _666 = _820;
        _694 = _724;
        _624 = _726;
        _352 = _728;
        _354 = _792;
        _696 = _824;
        _698 = _812;
        _700 = _804;
        _702 = _818;
        _832 = _828;
        _704 = _826;
        _834 = _830;
        _836 = true;
    }
    else
    {
        int _838 = as_type<int>(_180) & 1024;
        bool _840 = _838 != 0;
        if (_840)
        {
            _588 = true;
        }
        bool _842 = _588;
        bool _844 = _842;
        if (!_840)
        {
            int _846 = as_type<int>(_180) & 2048;
            bool _848 = _846 != 0;
            _844 = _848;
        }
        bool _850 = _844;
        if (!_850)
        {
            _212 = _686;
        }
        float _852 = _212;
        _832 = _852;
        if (!_850)
        {
            _644 = _688;
        }
        float _854 = _644;
        bool _856 = !_850;
        _834 = _854;
        if (!_856)
        {
            uint _858 = uint(int(uint(_266) >> uint(2)));
            float _860 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_858)]);
            int _862 = _266 + 4;
            uint _864 = uint(int(uint(_862) >> uint(2)));
            float _866 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_864)]);
            int _868 = _266 + 8;
            uint _870 = uint(int(uint(_868) >> uint(2)));
            float _872 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_870)]);
            uint _874 = uint(int(uint(_266) >> uint(2)));
            float _876 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_874)]);
            int _878 = _266 + 4;
            uint _880 = uint(int(uint(_878) >> uint(2)));
            float _882 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_880)]);
            int _884 = _266 + 8;
            uint _886 = uint(int(uint(_884) >> uint(2)));
            float _888 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_886)]);
            uint _890 = uint(int(uint(_266) >> uint(2)));
            float _892 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_890)]);
            int _894 = _266 + 4;
            uint _896 = uint(int(uint(_894) >> uint(2)));
            float _898 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_896)]);
            int _900 = _266 + 8;
            uint _902 = uint(int(uint(_900) >> uint(2)));
            float _904 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_902)]);
            float _906 = _872 * _876;
            float _908 = _872 * _882;
            float _910 = _866 * _876;
            float _912 = -_906;
            float _914 = fma(_860, _888, _912);
            float _916 = -_908;
            float _918 = fma(_866, _888, _916);
            float _920 = -_910;
            float _922 = fma(_860, _882, _920);
            float _924 = _898 * _860;
            float _926 = _898 * _914;
            float _928 = _904 * _866;
            float _930 = _892 * _882;
            float _932 = -_924;
            float _934 = fma(_892, _866, _932);
            float _936 = -_926;
            float _938 = fma(_892, _918, _936);
            float _940 = _898 * _888;
            float _942 = _904 * _876;
            float _944 = _892 * _872;
            float _946 = fma(_904, _922, _938);
            float _948 = -_940;
            float _950 = fma(_904, _882, _948);
            float _952 = -_942;
            float _954 = fma(_892, _888, _952);
            float _956 = -_930;
            float _958 = fma(_898, _876, _956);
            float _960 = -_944;
            float _962 = fma(_904, _860, _960);
            float _964 = -_860;
            float _966 = fma(_964, _888, _906);
            float _968 = 1.0 / _946;
            float _970 = -_928;
            float _972 = fma(_898, _872, _970);
            float _974 = _950 * _968;
            float _976 = _954 * _968;
            float _978 = _958 * _968;
            float _980 = _684 * _968;
            float _982 = _686 * _974;
            float _984 = _686 * _976;
            float _986 = _686 * _978;
            float _988 = _966 * _968;
            float _990 = _972 * _968;
            float _992 = _962 * _968;
            float _994 = _934 * _968;
            float _996 = fma(_918, _980, _982);
            float _998 = fma(_684, _988, _984);
            float _1000 = fma(_922, _980, _986);
            float _1002 = fma(_688, _990, _996);
            float _1004 = fma(_688, _992, _998);
            float _1006 = fma(_688, _994, _1000);
            _646 = _966;
            _692 = _990;
            _648 = _982;
            _666 = _996;
            _694 = _892;
            _624 = _898;
            _352 = _904;
            _354 = _968;
            _696 = _1000;
            _698 = _988;
            _700 = _980;
            _702 = _994;
            _832 = _1004;
            _704 = _1002;
            _834 = _1006;
        }
    }
    _836 = false;
    float _1008 = _646;
    float _1010 = _692;
    float _1012 = _648;
    float _1014 = _666;
    float _1016 = _694;
    float _1018 = _624;
    float _1020 = _352;
    float _1022 = _354;
    float _1024 = _696;
    float _1026 = _698;
    float _1028 = _700;
    float _1030 = _702;
    float _1032 = _832;
    float _1034 = _704;
    float _1036 = _834;
    uint _1038 = uint(int(uint(_268) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1038)] = as_type<uint>(_634);
    float _1040 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1042 = as_type<int>(_1040) & 512;
    bool _1044 = _1042 != 0;
    int _1046 = as_type<int>(_1040) & 1024;
    bool _1048 = _1046 != 0;
    float _1050 = _1008;
    float _1052 = _1010;
    float _1054 = _1012;
    float _1056 = _1014;
    float _1058 = _1034;
    bool _1060 = false;
    if (_1044)
    {
        float _1062 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1066 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1068 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1050 = _1062;
        _1052 = _1064;
        _1054 = _1066;
        _1056 = _1068;
    }
    float _1070 = _1050;
    float _1072 = _1052;
    float _1074 = _1054;
    float _1076 = _1056;
    float _1078 = _1016;
    float _1080 = _1018;
    float _1082 = _1020;
    float _1084 = _1022;
    if (_1044)
    {
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1088 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1090 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1092 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1078 = _1086;
        _1080 = _1088;
        _1082 = _1090;
        _1084 = _1092;
    }
    float _1094 = _1078;
    float _1096 = _1080;
    float _1098 = _1082;
    float _1100 = _1084;
    float _1102 = _1024;
    float _1104 = _1026;
    float _1106 = _1028;
    float _1108 = _1030;
    if (_1044)
    {
        float _1110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1114 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1102 = _1110;
        _1104 = _1112;
        _1106 = _1114;
        _1108 = _1116;
    }
    float _1118 = _1102;
    float _1120 = _1104;
    float _1122 = _1106;
    float _1124 = _1108;
    float _1126 = _680 + _1032;
    float _1128 = _654 + _1034;
    float _1130 = _676 + _1036;
    float _1132 = 0.0;
    if (!_1044)
    {
        _706 = 0.0;
        _1132 = 0.0;
    }
    float _1134 = _706;
    float _1136 = _1132;
    float _1138 = _1134;
    float _1140 = _1136;
    if (!_1044)
    {
        _708 = 0.0;
    }
    float _1142 = _708;
    int _1144 = as_type<int>(_1040) & 2048;
    bool _1146 = _1144 != 0;
    float _1148 = _1070;
    float _1150 = _1142;
    if (_1044)
    {
        float _1152 = _1126 * _1072;
        _1058 = _1152;
    }
    float _1154 = _1058;
    float _1156 = _1096;
    float _1158 = _1120;
    float _1160 = _1118;
    float _1162 = _1098;
    if (_1044)
    {
        float _1164 = _1126 * _1096;
        _1156 = _1164;
    }
    float _1166 = _1156;
    float _1168 = _1166;
    if (_1044)
    {
        float _1170 = fma(_1128, _1070, _1154);
        _1148 = _1170;
    }
    float _1172 = _1148;
    float _1174 = _1172;
    if (_1044)
    {
        float _1176 = _1126 * _1120;
        _1158 = _1176;
    }
    float _1178 = _1158;
    if (_1044)
    {
        float _1180 = fma(_1128, _1094, _1166);
        _1168 = _1180;
    }
    float _1182 = _1168;
    if (_1044)
    {
        float _1184 = fma(_1130, _1074, _1172);
        _1174 = _1184;
    }
    float _1186 = _1174;
    if (_1044)
    {
        float _1188 = fma(_1128, _1118, _1178);
        _1160 = _1188;
    }
    float _1190 = _1160;
    float _1192 = _1190;
    if (_1044)
    {
        float _1194 = fma(_1130, _1098, _1182);
        _1162 = _1194;
    }
    float _1196 = _1162;
    if (_1044)
    {
        float _1198 = _1076 + _1186;
        _1150 = _1198;
    }
    float _1200 = _1150;
    float _1202 = _1200;
    if (_1044)
    {
        float _1204 = fma(_1130, _1122, _1190);
        _1192 = _1204;
    }
    float _1206 = _1192;
    if (_1044)
    {
        float _1208 = _1100 + _1196;
        _1138 = _1208;
    }
    float _1210 = _1138;
    float _1212 = _1210;
    if (_1044)
    {
        float _1214 = _1124 + _1206;
        _1140 = _1214;
    }
    float _1216 = _1140;
    bool _1218 = !_1048;
    float _1220 = _1216;
    if (!_1218)
    {
        float _1222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1224 = uint(int(uint(_266) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1224)]);
        int _1228 = _266 + 4;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1230)]);
        int _1234 = _266 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        float _1238 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1236)]);
        uint _1240 = uint(int(uint(_266) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1240)]);
        int _1244 = _266 + 4;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1246)]);
        int _1250 = _266 + 8;
        uint _1252 = uint(int(uint(_1250) >> uint(2)));
        float _1254 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1252)]);
        uint _1256 = uint(int(uint(_266) >> uint(2)));
        float _1258 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1256)]);
        int _1260 = _266 + 4;
        uint _1262 = uint(int(uint(_1260) >> uint(2)));
        float _1264 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1262)]);
        int _1266 = _266 + 8;
        uint _1268 = uint(int(uint(_1266) >> uint(2)));
        float _1270 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1268)]);
        float _1272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1274 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1276 = _1126 * _1232;
        float _1278 = _1126 * _1248;
        float _1280 = _1126 * _1264;
        float _1282 = fma(_1128, _1226, _1276);
        float _1284 = fma(_1128, _1242, _1278);
        float _1286 = fma(_1128, _1258, _1280);
        float _1288 = fma(_1130, _1238, _1282);
        float _1290 = fma(_1130, _1254, _1284);
        float _1292 = fma(_1130, _1270, _1286);
        float _1294 = _1222 + _1288;
        float _1296 = _1272 + _1290;
        float _1298 = _1274 + _1292;
        _1212 = _1296;
        _1202 = _1294;
        _1220 = _1298;
    }
    float _1300 = _1212;
    float _1302 = _1202;
    float _1304 = _1220;
    bool _1306 = !_1146;
    float _1308 = _1300;
    float _1310 = _1302;
    float _1312 = _1304;
    if (!_1306)
    {
        uint _1314 = uint(int(uint(_266) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1314)]);
        int _1318 = _266 + 4;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1320)]);
        int _1324 = _266 + 8;
        uint _1326 = uint(int(uint(_1324) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1326)]);
        int _1330 = _266 + 12;
        uint _1332 = uint(int(uint(_1330) >> uint(2)));
        float _1334 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1332)]);
        uint _1336 = uint(int(uint(_266) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1336)]);
        int _1340 = _266 + 4;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1342)]);
        int _1346 = _266 + 8;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1348)]);
        int _1352 = _266 + 12;
        uint _1354 = uint(int(uint(_1352) >> uint(2)));
        float _1356 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1354)]);
        uint _1358 = uint(int(uint(_266) >> uint(2)));
        float _1360 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1358)]);
        int _1362 = _266 + 4;
        uint _1364 = uint(int(uint(_1362) >> uint(2)));
        float _1366 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1364)]);
        int _1368 = _266 + 8;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        float _1372 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1370)]);
        int _1374 = _266 + 12;
        uint _1376 = uint(int(uint(_1374) >> uint(2)));
        float _1378 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1376)]);
        float _1380 = _1126 * _1322;
        float _1382 = _1126 * _1344;
        float _1384 = _1126 * _1366;
        float _1386 = fma(_1128, _1316, _1380);
        float _1388 = fma(_1128, _1338, _1382);
        float _1390 = fma(_1128, _1360, _1384);
        float _1392 = fma(_1130, _1328, _1386);
        float _1394 = fma(_1130, _1350, _1388);
        float _1396 = fma(_1130, _1372, _1390);
        float _1398 = _1392 + _1334;
        float _1400 = _1394 + _1356;
        float _1402 = _1396 + _1378;
        _1308 = _1400;
        _1310 = _1398;
        _1312 = _1402;
    }
    float _1404 = _1308;
    float _1406 = _1310;
    float _1408 = _1312;
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[70]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1426 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1428 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1430 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1432 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1434 = _1412 * _1404;
    float _1436 = fma(_1410, _1406, _1434);
    float _1438 = fma(_1414, _1408, _1436);
    float _1440 = _1416 + _1438;
    float _1442 = -_1440;
    bool _1444 = _1418 >= _1442;
    bool _1446 = isnan(_1418);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(_1442);
    bool _1452 = _1448 || _1450;
    float _1454 = -_1440;
    bool _1456 = _1420 >= _1454;
    bool _1458 = isnan(_1420);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(_1454);
    bool _1464 = _1460 || _1462;
    int _1466 = _1452 ? 0 : 1;
    int _1468 = 2;
    float _1470 = _1406;
    if (_1452)
    {
        _1468 = 1;
    }
    int _1472 = _1468;
    int _1474 = _1472;
    if (_1464)
    {
        _1474 = _1466;
    }
    int _1476 = _1474;
    int _1478 = _1476 << 6;
    int _1480 = _1478 + 96;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    float _1484 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1482)]);
    int _1486 = _1480 + 4;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    float _1490 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1488)]);
    int _1492 = _1480 + 8;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    float _1496 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1494)]);
    int _1498 = _1480 + 12;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    float _1502 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1500)]);
    int _1504 = _1478 + 48;
    int _1506 = _1478 + 64;
    uint _1508 = uint(int(uint(_1504) >> uint(2)));
    float _1510 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1508)]);
    int _1512 = _1504 + 4;
    uint _1514 = uint(int(uint(_1512) >> uint(2)));
    float _1516 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1514)]);
    int _1518 = _1504 + 8;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    float _1522 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1520)]);
    int _1524 = _1504 + 12;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    float _1528 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1526)]);
    uint _1530 = uint(int(uint(_1506) >> uint(2)));
    float _1532 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1530)]);
    int _1534 = _1506 + 4;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    float _1538 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1536)]);
    int _1540 = _1506 + 8;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    float _1544 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1542)]);
    int _1546 = _1506 + 12;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    float _1550 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1548)]);
    int _1552 = _1478 + 80;
    float _1554 = _1422 + 1.0;
    float _1556 = _1554 + _1404;
    uint _1558 = uint(int(uint(_1552) >> uint(2)));
    float _1560 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1558)]);
    int _1562 = _1552 + 4;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    float _1566 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1564)]);
    int _1568 = _1552 + 8;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1570)]);
    int _1574 = _1552 + 12;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    float _1580 = _1556 * _1426;
    float _1582 = fma(_1424, _1406, _1580);
    float _1584 = fma(_1428, _1408, _1582);
    float _1586 = _1430 + _1584;
    float _1588 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1592 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1594 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1596 = trunc(_1586);
    int _1598 = int(_1596);
    int _1600 = ~as_type<int>(_1432);
    int _1602 = _1598 + _1600;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    bool _1608 = _1604 >= 0;
    int _1610 = _1598;
    float _1612 = as_type<float>(_1476);
    if (_1608)
    {
        float _1614 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1610 = as_type<int>(_1614);
    }
    int _1616 = _1610;
    float _1618 = _1556 * _1490;
    float _1620 = fma(_1484, _1406, _1618);
    float _1622 = fma(_1496, _1408, _1620);
    float _1624 = _1502 + _1622;
    float _1626 = _1556 * _1516;
    float _1628 = 1.0 / _1624;
    float _1630 = fma(_1510, _1406, _1626);
    float _1632 = _1556 * _1538;
    float _1634 = fma(_1522, _1408, _1630);
    float _1636 = fma(_1532, _1406, _1632);
    float _1638 = _1528 + _1634;
    float _1640 = fma(_1544, _1408, _1636);
    float _1642 = _1638 * _1628;
    float _1644 = _1550 + _1640;
    bool _1646 = _1642 >= 0.0;
    float _1648 = _1644 * _1628;
    bool _1650 = _1642 <= 1.0;
    bool _1652 = _1650 && _1646;
    bool _1654 = _1648 >= 0.0;
    bool _1656 = _1654 && _1652;
    bool _1658 = _1648 <= 1.0;
    bool _1660 = _1658 && _1656;
    float _1662 = _1556 * _1566;
    float _1664 = fma(_1560, _1406, _1662);
    float _1666 = _1638;
    float _1668 = _1528;
    float _1670 = _1594;
    float _1672 = _1532;
    float _1674 = _1636;
    float _1676 = _1640;
    float _1678 = _1550;
    float _1680 = _1664;
    float _1682 = _1578;
    if (_1660)
    {
        float _1684 = float(_1476);
        _1612 = _1684;
    }
    float _1686 = _1612;
    float _1688 = fma(_1572, _1408, _1664);
    float _1690 = _1686;
    float _1692 = _1688;
    if (_1660)
    {
        float _1694 = rint(_1686);
        float _1696 = precise::max(_1694, 0.0);
        uint _1698 = uint(_1696);
        uint _1700 = clamp(_1698, 0u, 65535u);
        _1690 = as_type<float>(_1700);
    }
    float _1702 = _1690;
    float _1704 = _1578 + _1688;
    float _1706 = _1704 * _1628;
    float _1708 = _1648;
    float _1710 = _1706;
    if (_1660)
    {
        float3 _7432 = float3(_1642, _1648, float(as_type<int>(_1702)));
        float3 _7436 = select(_7432, float3(0.0), isnan(_7432));
        float _1712 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _7436.xy, uint(rint(_7436.z)), _1706, level(0.0));
        _1708 = _1712;
    }
    float _1714 = _1708;
    float _1716 = _1556 * _1590;
    float _1718 = fma(_1588, _1406, _1716);
    float _1720 = fma(_1592, _1408, _1718);
    float _1722 = _1594 + _1720;
    float _1724 = trunc(_1722);
    int _1726 = int(_1724);
    bool _1728 = _1616 <= _1604;
    bool _1730 = !_1608;
    bool _1732 = _1728 || _1730;
    int _1734 = ~as_type<int>(_1606);
    int _1736 = _1726 + _1734;
    int _1738 = _1736 + 1;
    bool _1740 = _1738 < 0;
    bool _1742 = _1740 || _1732;
    float _1744 = _1718;
    float _1746 = as_type<float>(_1726);
    float _1748 = _1722;
    float _1750 = _1722;
    if (!_1742)
    {
        float _1752 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1744 = _1752;
    }
    float _1754 = _1744;
    bool _1756 = as_type<int>(_1754) <= _1738;
    bool _1758 = _1756 || _1742;
    float _1760 = _1754;
    if (_1758)
    {
        _1746 = 1.0;
    }
    float _1762 = _1746;
    float _1764 = _1762;
    float _1766 = _1714;
    if (!_1758)
    {
        float _1768 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1770 = _1738 * as_type<int>(_1768);
        int _1772 = _1770 + _1604;
        int _1774 = _1772 << 2;
        uint _1776 = uint(int(uint(_1772) >> uint(2)));
        int _1778 = 12 & _1774;
        int _1780 = int(_1776) << 4;
        int _1782 = _1780 + _1778;
        int _1784 = _1782 + 400;
        uint _1786 = uint(int(uint(_1784) >> uint(2)));
        float _1788 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1786)]);
        float _1790 = floor(_1722);
        float _1792 = floor(_1586);
        float _1794 = -_1790;
        float _1796 = _1722 + _1794;
        float _1798 = -_1792;
        float _1800 = _1586 + _1798;
        float _1802 = rint(_1788);
        float _1804 = precise::max(_1802, 0.0);
        uint _1806 = uint(_1804);
        uint _1808 = clamp(_1806, 0u, 65535u);
        float3 _7574 = float3(_1800, _1796, float(int(_1808)));
        float3 _7576 = select(_7574, float3(0.0), isnan(_7574));
        float _1810 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _7576.xy, uint(rint(_7576.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _7576.xy, uint(rint(_7576.z)), level(0.0)).x;
        int _1812 = _1772 << 4;
        int _1814 = _1812 + 2048;
        uint _1816 = uint(int(uint(_1814) >> uint(2)));
        float _1818 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1816)]);
        int _1820 = _1814 + 4;
        uint _1822 = uint(int(uint(_1820) >> uint(2)));
        float _1824 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1822)]);
        int _1826 = _1814 + 8;
        uint _1828 = uint(int(uint(_1826) >> uint(2)));
        float _1830 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1828)]);
        int _1832 = _1814 + 12;
        uint _1834 = uint(int(uint(_1832) >> uint(2)));
        float _1836 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1834)]);
        float _1838 = _1556 * _1824;
        float _1840 = fma(_1818, _1406, _1838);
        float _1842 = fma(_1830, _1408, _1840);
        float _1844 = _1836 + _1842;
        float _1846 = precise::clamp(_1844, 0.0, 1.0);
        float _1848 = -_1846;
        float _1850 = _1848 + _1810;
        float _1852 = fma(_1850, 500.0, 1.5);
        float _1854 = exp2(_1852);
        float _1856 = 0.0 + _1854;
        float _1858 = precise::clamp(_1856, 0.0, 1.0);
        _1470 = 500.0;
        _1764 = _1858;
        _1666 = as_type<float>(_1808);
        _1668 = _1800;
        _1760 = _1788;
        _1670 = _1810;
        _1672 = _1818;
        _1674 = _1840;
        _1676 = _1854;
        _1678 = _1836;
    }
    float _1860 = _1470;
    float _1862 = _1764;
    float _1864 = _1666;
    float _1866 = _1668;
    float _1868 = _1760;
    float _1870 = _1670;
    float _1872 = _1672;
    float _1874 = _1674;
    float _1876 = _1676;
    float _1878 = _1678;
    uint _1880 = uint(int(uint(_266) >> uint(2)));
    float _1882 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1880)]);
    float _1884 = _1860;
    float _1886 = _1872;
    float _1888 = _1874;
    float _1890 = _1864;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1870;
    if (!_1660)
    {
        _1884 = 1.0;
    }
    float _1898 = _1884;
    bool _1900 = _612 > 0.001000000047497451305389404296875;
    bool _1902 = isnan(_612);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan(0.001000000047497451305389404296875);
    bool _1908 = _1904 || _1906;
    float _1910 = _1898;
    bool _1912 = _1908;
    if (_1660)
    {
        bool _1914 = _1714 >= _1706;
        bool _1916 = isnan(_1714);
        bool _1918 = _1914 || _1916;
        bool _1920 = isnan(_1706);
        bool _1922 = _1918 || _1920;
        float _1924 = float(_1922);
        _1910 = _1924;
    }
    float _1926 = _1910;
    bool _1928 = _664 >= 0.0;
    bool _1930 = isnan(_664);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -_1926;
    float _1940 = fma(_1938, _1862, 1.0);
    float _1942 = _1940;
    if (_1936)
    {
        _1886 = _1126;
    }
    float _1944 = _1886;
    float _1946 = _1944;
    if (_1936)
    {
        _1888 = _678;
    }
    float _1948 = _1888;
    float _1950 = -_1882;
    float _1952 = _1940 + _1950;
    float _1954 = _1952;
    float _1956 = _1882;
    float _1958 = _1948;
    if (_1908)
    {
        float _1960 = fma(_1952, 0.0500000007450580596923828125, _1882);
        _1942 = _1960;
    }
    float _1962 = _1942;
    float _1964 = precise::max(0.0, _1962);
    float _1966 = precise::min(_1964, 0.999000012874603271484375);
    uint _1968 = uint(int(uint(_266) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1968)] = as_type<uint>(_1966);
    float _1970 = _1964;
    float _1972 = _1966;
    if (!_1936)
    {
        float _1974 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _1976 = as_type<int>(_1974) & 512;
        bool _1978 = _1976 != 0;
        float _1980 = _1714;
        float _1982 = _1706;
        float _1984 = _1864;
        float _1986 = _1866;
        if (_1978)
        {
            float _1988 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _1990 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _1992 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _1994 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _1980 = _1988;
            _1982 = _1990;
            _1984 = _1992;
            _1986 = _1994;
        }
        float _1996 = _1980;
        float _1998 = _1982;
        float _2000 = _1984;
        float _2002 = _1986;
        float _2004 = _1966;
        float _2006 = _1868;
        float _2008 = _1882;
        float _2010 = _1870;
        if (_1978)
        {
            float _2012 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2014 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2016 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2018 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _2004 = _2012;
            _2006 = _2014;
            _2008 = _2016;
            _2010 = _2018;
        }
        float _2020 = _2004;
        float _2022 = _2006;
        float _2024 = _2008;
        float _2026 = _2010;
        float _2028 = _1944;
        float _2030 = _1948;
        float _2032 = _1876;
        float _2034 = _1878;
        if (_1978)
        {
            float _2036 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2038 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2042 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2028 = _2036;
            _2030 = _2038;
            _2032 = _2040;
            _2034 = _2042;
        }
        float _2044 = _2028;
        float _2046 = _2030;
        float _2048 = _2032;
        float _2050 = _2034;
        int _2052 = as_type<int>(_1974) & 1024;
        bool _2054 = _2052 != 0;
        int _2056 = as_type<int>(_1974) & 2048;
        bool _2058 = _2056 != 0;
        float _2060 = _1998;
        float _2062 = _1996;
        float _2064 = _2000;
        float _2066 = _2002;
        _1682 = 6.2500002968590706586837768554688e-05;
        if (_1978)
        {
            float _2068 = _1126 * _1998;
            _2060 = _2068;
        }
        float _2070 = _2060;
        float _2072 = _2070;
        if (_1978)
        {
            float _2074 = fma(_1128, _1996, _2070);
            _2072 = _2074;
        }
        float _2076 = _2072;
        float _2078 = _2020;
        float _2080 = _2024;
        float _2082 = _2022;
        float _2084 = _2076;
        if (_1978)
        {
            float _2086 = _1126 * _2022;
            _1748 = _2086;
        }
        float _2088 = _1748;
        float _2090 = _2088;
        float _2092 = _2044;
        float _2094 = _2046;
        if (_1978)
        {
            float _2096 = _1126 * _2046;
            _2062 = _2096;
        }
        float _2098 = _2062;
        float _2100 = _2098;
        if (_1978)
        {
            float _2102 = fma(_1128, _2020, _2088);
            _2078 = _2102;
        }
        float _2104 = _2078;
        float _2106 = _2104;
        if (_1978)
        {
            float _2108 = fma(_1128, _2044, _2098);
            _2100 = _2108;
        }
        float _2110 = _2100;
        float _2112 = _2110;
        if (_1978)
        {
            float _2114 = fma(_1130, _2024, _2104);
            _2080 = _2114;
        }
        float _2116 = _2080;
        float _2118 = _2116;
        if (_1978)
        {
            float _2120 = fma(_1130, _2000, _2076);
            _2064 = _2120;
        }
        float _2122 = _2064;
        float _2124 = _2122;
        if (_1978)
        {
            float _2126 = fma(_1130, _2048, _2110);
            _2112 = _2126;
        }
        float _2128 = _2112;
        float _2130 = _2128;
        if (!_1978)
        {
            _2106 = 0.0;
            _2082 = 0.0;
        }
        float _2132 = _2106;
        float _2134 = _2082;
        float _2136 = _2134;
        float _2138 = _2132;
        if (!_1978)
        {
            _2090 = 0.0;
        }
        float _2140 = _2090;
        float _2142 = _2140;
        if (_1978)
        {
            float _2144 = _2026 + _2116;
            _2136 = _2144;
        }
        float _2146 = _2136;
        float _2148 = _2146;
        if (_1978)
        {
            float _2150 = _2002 + _2122;
            _2142 = _2150;
        }
        float _2152 = _2142;
        float _2154 = _2152;
        if (_1978)
        {
            float _2156 = _2050 + _2128;
            _2138 = _2156;
        }
        float _2158 = _2138;
        bool _2160 = !_2054;
        float _2162 = _2158;
        if (!_2160)
        {
            float _2164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _2166 = uint(int(uint(_266) >> uint(2)));
            float _2168 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2166)]);
            int _2170 = _266 + 4;
            uint _2172 = uint(int(uint(_2170) >> uint(2)));
            float _2174 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2172)]);
            int _2176 = _266 + 8;
            uint _2178 = uint(int(uint(_2176) >> uint(2)));
            float _2180 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2178)]);
            uint _2182 = uint(int(uint(_266) >> uint(2)));
            float _2184 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2182)]);
            int _2186 = _266 + 4;
            uint _2188 = uint(int(uint(_2186) >> uint(2)));
            float _2190 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2188)]);
            int _2192 = _266 + 8;
            uint _2194 = uint(int(uint(_2192) >> uint(2)));
            float _2196 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2194)]);
            int _2198 = _266 + 12;
            uint _2200 = uint(int(uint(_2198) >> uint(2)));
            float _2202 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2200)]);
            uint _2204 = uint(int(uint(_266) >> uint(2)));
            float _2206 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2204)]);
            int _2208 = _266 + 4;
            uint _2210 = uint(int(uint(_2208) >> uint(2)));
            float _2212 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2210)]);
            int _2214 = _266 + 8;
            uint _2216 = uint(int(uint(_2214) >> uint(2)));
            float _2218 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2216)]);
            float _2220 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _2222 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _2224 = _1126 * _2174;
            float _2226 = _1126 * _2190;
            float _2228 = fma(_1128, _2168, _2224);
            float _2230 = _1126 * _2212;
            float _2232 = fma(_1128, _2184, _2226);
            float _2234 = fma(_1128, _2206, _2230);
            float _2236 = fma(_1130, _2180, _2228);
            float _2238 = fma(_1130, _2196, _2232);
            float _2240 = fma(_1130, _2218, _2234);
            float _2242 = _2164 + _2236;
            float _2244 = _2220 + _2238;
            float _2246 = _2222 + _2240;
            _2162 = _2246;
            _2148 = _2242;
            _2118 = _2180;
            _2092 = _2206;
            _2094 = _2234;
            _2154 = _2244;
            _2084 = _2238;
            _2124 = _2196;
            _2066 = _2202;
            _2130 = _2184;
        }
        float _2248 = _2162;
        float _2250 = _2148;
        float _2252 = _2118;
        float _2254 = _2092;
        float _2256 = _2094;
        float _2258 = _2154;
        float _2260 = _2084;
        float _2262 = _2124;
        float _2264 = _2066;
        float _2266 = _2130;
        bool _2268 = !_2058;
        float _2270 = _2250;
        float _2272 = _2248;
        float _2274 = _2258;
        float _2276 = _2254;
        float _2278 = _2256;
        float _2280 = _2266;
        float _2282 = _2252;
        _1710 = _2260;
        _1890 = _2262;
        _1892 = _2264;
        if (!_2268)
        {
            uint _2284 = uint(int(uint(_266) >> uint(2)));
            float _2286 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2284)]);
            int _2288 = _266 + 4;
            uint _2290 = uint(int(uint(_2288) >> uint(2)));
            float _2292 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2290)]);
            int _2294 = _266 + 8;
            uint _2296 = uint(int(uint(_2294) >> uint(2)));
            float _2298 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2296)]);
            int _2300 = _266 + 12;
            uint _2302 = uint(int(uint(_2300) >> uint(2)));
            float _2304 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2302)]);
            uint _2306 = uint(int(uint(_266) >> uint(2)));
            float _2308 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2306)]);
            int _2310 = _266 + 4;
            uint _2312 = uint(int(uint(_2310) >> uint(2)));
            float _2314 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2312)]);
            int _2316 = _266 + 8;
            uint _2318 = uint(int(uint(_2316) >> uint(2)));
            float _2320 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2318)]);
            int _2322 = _266 + 12;
            uint _2324 = uint(int(uint(_2322) >> uint(2)));
            float _2326 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_2324)]);
            uint _2328 = uint(int(uint(_266) >> uint(2)));
            float _2330 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2328)]);
            int _2332 = _266 + 4;
            uint _2334 = uint(int(uint(_2332) >> uint(2)));
            float _2336 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2334)]);
            int _2338 = _266 + 8;
            uint _2340 = uint(int(uint(_2338) >> uint(2)));
            float _2342 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2340)]);
            int _2344 = _266 + 12;
            uint _2346 = uint(int(uint(_2344) >> uint(2)));
            float _2348 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2346)]);
            float _2350 = _1126 * _2292;
            float _2352 = _1126 * _2314;
            float _2354 = fma(_1128, _2286, _2350);
            float _2356 = _1126 * _2336;
            float _2358 = fma(_1128, _2308, _2352);
            float _2360 = fma(_1128, _2330, _2356);
            float _2362 = fma(_1130, _2298, _2354);
            float _2364 = fma(_1130, _2320, _2358);
            float _2366 = fma(_1130, _2342, _2360);
            float _2368 = _2362 + _2304;
            float _2370 = _2364 + _2326;
            float _2372 = _2366 + _2348;
            _2270 = _2368;
            _2272 = _2372;
            _2274 = _2370;
            _2276 = _2308;
            _2278 = _2358;
            _2280 = _2350;
            _2282 = _2298;
        }
        float _2374 = _2270;
        float _2376 = _2272;
        float _2378 = _2274;
        float _2380 = _2276;
        float _2382 = _2278;
        float _2384 = _2280;
        float _2386 = _2282;
        float _2388 = fma(_2374, 6.2500002968590706586837768554688e-05, 0.5);
        float _2390 = fma(_2376, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _8393 = float2(_2388, _2390);
        float _2392 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8393, float2(0.0), isnan(_8393)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8393, float2(0.0), isnan(_8393)), level(0.0)).x;
        float _2394 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[71]);
        float _2396 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
        float _2398 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[69]);
        float _2400 = _2392 * 2000.0;
        float _2402 = -_2394;
        float _2404 = _2402 + _2378;
        float _2406 = _2400 + (-0.300000011920928955078125);
        bool _2408 = _2404 > _2406;
        bool _2410 = _2404 < _2400;
        bool _2412 = _2410 && _2408;
        float _2414 = _2380;
        float _2416 = _2382;
        float _2418 = _2388;
        _1766 = _2384;
        _1972 = _2376;
        _1894 = _2374;
        _1956 = _2386;
        _1896 = _2406;
        _1750 = _2404;
        _1680 = _2400;
        _1692 = _2388;
        if (!_2412)
        {
            _2414 = _1126;
        }
        float _2420 = _2414;
        _1946 = _2420;
        if (!_2412)
        {
            _2416 = _678;
        }
        float _2422 = _2416;
        bool _2424 = !_2412;
        _1970 = _2398;
        _1954 = _2396;
        _1958 = _2422;
        if (!_2424)
        {
            float _2426 = fma(_2374, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2428 = fma(_2374, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _2430 = fma(_2376, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _2432 = fma(_2376, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _8476 = float2(_2426, _2390);
            float _2434 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8476, float2(0.0), isnan(_8476)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8476, float2(0.0), isnan(_8476)), level(0.0)).x;
            float2 _8484 = float2(_2428, _2390);
            float _2436 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8484, float2(0.0), isnan(_8484)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8484, float2(0.0), isnan(_8484)), level(0.0)).x;
            float2 _8492 = float2(_2388, _2430);
            float _2438 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8492, float2(0.0), isnan(_8492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8492, float2(0.0), isnan(_8492)), level(0.0)).x;
            float2 _8500 = float2(_2388, _2432);
            float _2440 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8500, float2(0.0), isnan(_8500)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8500, float2(0.0), isnan(_8500)), level(0.0)).x;
            float2 _8508 = float2(_2426, _2430);
            float _2442 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8508, float2(0.0), isnan(_8508)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8508, float2(0.0), isnan(_8508)), level(0.0)).x;
            float2 _8516 = float2(_2426, _2432);
            float _2444 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8516, float2(0.0), isnan(_8516)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8516, float2(0.0), isnan(_8516)), level(0.0)).x;
            float2 _8524 = float2(_2428, _2430);
            float _2446 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8524, float2(0.0), isnan(_8524)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8524, float2(0.0), isnan(_8524)), level(0.0)).x;
            float2 _8532 = float2(_2428, _2432);
            float _2448 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_8532, float2(0.0), isnan(_8532)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_8532, float2(0.0), isnan(_8532)), level(0.0)).x;
            float _2450 = -_2434;
            float _2452 = _2392 + _2450;
            float _2454 = -_2436;
            float _2456 = _2392 + _2454;
            float _2458 = -_2438;
            float _2460 = _2392 + _2458;
            float _2462 = -_2440;
            float _2464 = _2392 + _2462;
            float _2466 = -_2442;
            float _2468 = _2392 + _2466;
            float _2470 = -_2444;
            float _2472 = _2392 + _2470;
            float _2474 = -_2446;
            float _2476 = _2392 + _2474;
            float _2478 = -_2448;
            float _2480 = _2392 + _2478;
            float _2482 = abs(_2452);
            float _2484 = abs(_2456);
            float _2486 = precise::max(_2482, _2484);
            float _2488 = abs(_2460);
            float _2490 = abs(_2464);
            float _2492 = precise::max(_2488, _2490);
            float _2494 = abs(_2468);
            float _2496 = abs(_2472);
            float _2498 = precise::max(_2494, _2496);
            float _2500 = precise::max(_2486, _2492);
            float _2502 = abs(_2476);
            float _2504 = abs(_2480);
            float _2506 = precise::max(_2502, _2504);
            bool _2508 = _2500 > 0.00150000001303851604461669921875;
            float _2510 = precise::max(_2498, _2506);
            bool _2512 = _2510 <= 0.00150000001303851604461669921875;
            bool _2514 = isnan(_2510);
            bool _2516 = _2512 || _2514;
            bool _2518 = isnan(0.00150000001303851604461669921875);
            bool _2520 = _2516 || _2518;
            bool _2522 = !_2508;
            bool _2524 = _2520 && _2522;
            float _2526 = _2476;
            float _2528 = _2506;
            float _2530 = _2472;
            float _2532 = _2434;
            _1766 = _2432;
            _1710 = _2500;
            _1890 = _2510;
            _1892 = _2472;
            _1972 = _2460;
            _1894 = _2428;
            _1956 = _2426;
            _1896 = _2430;
            _1682 = _2434;
            if (!_2524)
            {
                _2526 = _1126;
            }
            float _2534 = _2526;
            _1946 = _2534;
            if (!_2524)
            {
                _2528 = _678;
            }
            float _2536 = _2528;
            bool _2538 = !_2524;
            _1958 = _2536;
            if (!_2538)
            {
                float _2540 = -_2392;
                float _2542 = _2540 + _2434;
                float _2544 = -_2392;
                float _2546 = _2544 + _2438;
                float _2548 = _2542 * 2000.0;
                float _2550 = _2546 * 2000.0;
                bool _2552 = !_1978;
                float _2658;
                float _2660;
                float _2662;
                if (!_2552)
                {
                    float _2554 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _2556 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _2558 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _2560 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _2562 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _2564 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _2566 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _2568 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _2570 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _2572 = _2558 * _2560;
                    float _2574 = _2558 * _2562;
                    float _2576 = _2556 * _2560;
                    float _2578 = -_2572;
                    float _2580 = fma(_2554, _2564, _2578);
                    float _2582 = -_2574;
                    float _2584 = fma(_2556, _2564, _2582);
                    float _2586 = -_2576;
                    float _2588 = fma(_2554, _2562, _2586);
                    float _2590 = _2570 * _2556;
                    float _2592 = _2580 * _2568;
                    float _2594 = _2566 * _2558;
                    float _2596 = _2568 * _2554;
                    float _2598 = -_2590;
                    float _2600 = fma(_2568, _2558, _2598);
                    float _2602 = -_2592;
                    float _2604 = fma(_2584, _2566, _2602);
                    float _2606 = _2568 * _2564;
                    float _2608 = -_2594;
                    float _2610 = fma(_2570, _2554, _2608);
                    float _2612 = _2570 * _2560;
                    float _2614 = fma(_2588, _2570, _2604);
                    float _2616 = -_2606;
                    float _2618 = fma(_2570, _2562, _2616);
                    float _2620 = _2566 * _2562;
                    float _2622 = -_2554;
                    float _2624 = fma(_2622, _2564, _2572);
                    float _2626 = -_2612;
                    float _2628 = fma(_2566, _2564, _2626);
                    float _2630 = -_2596;
                    float _2632 = fma(_2566, _2556, _2630);
                    float _2634 = 1.0 / _2614;
                    float _2636 = -_2620;
                    float _2638 = fma(_2568, _2560, _2636);
                    float _2640 = fma(_2548, _2584, _2618);
                    float _2642 = fma(_2548, _2624, _2628);
                    float _2644 = fma(_2548, _2588, _2638);
                    float _2646 = fma(_2550, _2600, _2640);
                    float _2648 = fma(_2550, _2610, _2642);
                    float _2650 = fma(_2550, _2632, _2644);
                    float _2652 = _2634 * _2646;
                    float _2654 = _2634 * _2648;
                    float _2656 = _2634 * _2650;
                    _2658 = _2654;
                    _2660 = _2652;
                    _2662 = _2656;
                    _2530 = _2640;
                    _2418 = _2588;
                    _2532 = _2642;
                    _2664 = true;
                }
                else
                {
                    float _2666 = fma(_2548, _550, _552);
                    float _2668 = fma(_2548, _554, _556);
                    float _2670 = fma(_2548, _558, _560);
                    float _2672 = fma(_2550, _562, _2666);
                    float _2674 = fma(_2550, _564, _2668);
                    float _2676 = fma(_2550, _566, _2670);
                    _2658 = _2674;
                    _2660 = _2672;
                    _2662 = _2676;
                }
                _2664 = false;
                float _2678 = _2658;
                float _2680 = _2660;
                float _2682 = _2662;
                float _2684 = _2530;
                float _2686 = _2418;
                float _2688 = _2532;
                float _2690 = _2678 * _2678;
                float _2692 = -_2404;
                float _2694 = _2692 + _2400;
                float _2696 = fma(_2680, _2680, _2690);
                float _2698 = _1126 + _2694;
                float _2700 = fma(_2682, _2682, _2696);
                float _2702 = rsqrt(_2700);
                float _2704 = _2702 * _2678;
                float _2706 = _2702 * _2680;
                float _2708 = _2702 * _2682;
                float _2710 = _664 * _2704;
                float _2712 = fma(_662, _2706, _2710);
                float _2714 = fma(_678, _2708, _2712);
                float _2716 = _2706 * _2714;
                float _2718 = _2704 * _2714;
                float _2720 = _2708 * _2714;
                float _2722 = -_2716;
                float _2724 = _662 + _2722;
                float _2726 = -_2718;
                float _2728 = _664 + _2726;
                float _2730 = _2396 * _2716;
                float _2732 = _2396 * _2718;
                float _2734 = -_2720;
                float _2736 = _678 + _2734;
                float _2738 = _2396 * _2720;
                float _2740 = -_2730;
                float _2742 = fma(_2398, _2724, _2740);
                float _2744 = -_2732;
                float _2746 = fma(_2398, _2728, _2744);
                float _2748 = -_2738;
                float _2750 = fma(_2398, _2736, _2748);
                _668 = _2746;
                _710 = _2736;
                _1954 = _2738;
                _1766 = _2718;
                _1710 = _2714;
                _1890 = _2728;
                _1892 = _2684;
                _1972 = _2724;
                _1894 = _2720;
                _1956 = _2730;
                _1896 = _2702;
                _1946 = _2698;
                _1680 = _2694;
                _1692 = _2686;
                _1682 = _2688;
                _670 = _2742;
                _1958 = _2750;
            }
        }
    }
    float _2752 = _668;
    float _2754 = _710;
    float _2756 = _1970;
    float _2758 = _1954;
    float _2760 = _1766;
    float _2762 = _1710;
    float _2764 = _1890;
    float _2766 = _1892;
    float _2768 = _1972;
    float _2770 = _1894;
    float _2772 = _1956;
    float _2774 = _1896;
    float _2776 = _1946;
    float _2778 = _1750;
    float _2780 = _1680;
    float _2782 = _1692;
    float _2784 = _1682;
    float _2786 = _670;
    float _2788 = _1958;
    bool _2790 = _2752 >= 0.0;
    bool _2792 = isnan(_2752);
    bool _2794 = _2790 || _2792;
    bool _2796 = isnan(0.0);
    bool _2798 = _2794 || _2796;
    bool _2800 = !_2798;
    float _2802 = _2778;
    float _2804 = _2780;
    float _2806 = _2782;
    float _2808 = _2784;
    float _2810 = _2768;
    float _2812 = _2770;
    float _2814 = _2772;
    float _2816 = _2774;
    float _2818 = _2760;
    float _2820 = _2762;
    float _2822 = _2764;
    float _2824 = _2766;
    float _2826 = _2778;
    float _2828 = _2780;
    float _2830 = _2782;
    float _2832 = _2784;
    float _2834 = _2776;
    float _2836 = _2786;
    float _2838 = _2752;
    float _2840 = _2788;
    int _2846;
    int _2848;
    if (!_2800)
    {
        float _2842 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _2844 = as_type<int>(_2842) & 512;
        _2846 = _2844;
        _2848 = as_type<int>(_2842);
        _2850 = true;
    }
    else
    {
        float _2852 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
        int _2854 = as_type<int>(_2852) & 512;
        bool _2856 = _2854 != 0;
        float _2858 = _2754;
        float _2860 = _2756;
        float _2862 = _1126;
        float _2864 = _2758;
        _2846 = _2854;
        _2848 = as_type<int>(_2852);
        if (_2856)
        {
            float _2866 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
            float _2868 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
            float _2870 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
            float _2872 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            _2858 = _2866;
            _2860 = _2868;
            _2862 = _2870;
            _2864 = _2872;
        }
        float _2874 = _2858;
        float _2876 = _2860;
        float _2878 = _2862;
        float _2880 = _2864;
        float _2882 = _2760;
        float _2884 = _2762;
        float _2886 = _2764;
        float _2888 = _2766;
        if (_2856)
        {
            float _2890 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
            float _2892 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
            float _2894 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
            float _2896 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            _2882 = _2890;
            _2884 = _2892;
            _2886 = _2894;
            _2888 = _2896;
        }
        float _2898 = _2882;
        float _2900 = _2884;
        float _2902 = _2886;
        float _2904 = _2888;
        float _2906 = _2768;
        float _2908 = _2770;
        float _2910 = _2772;
        float _2912 = _2774;
        if (_2856)
        {
            float _2914 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
            float _2916 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
            float _2918 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
            float _2920 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            _2906 = _2914;
            _2908 = _2916;
            _2910 = _2918;
            _2912 = _2920;
        }
        float _2922 = _2906;
        float _2924 = _2908;
        float _2926 = _2910;
        float _2928 = _2912;
        int _2930 = as_type<int>(_2852) & 1024;
        bool _2932 = _2930 != 0;
        int _2934 = as_type<int>(_2852) & 2048;
        bool _2936 = _2934 != 0;
        float _2938 = _2874;
        float _2940 = _2878;
        float _2942 = _2876;
        if (_2856)
        {
            float _2944 = _2776 * _2876;
            _2802 = _2944;
        }
        float _2946 = _2802;
        float _2948 = _2900;
        float _2950 = _2924;
        float _2952 = _2898;
        float _2954 = _2922;
        float _2956 = _2926;
        float _2958 = _2902;
        float _2960 = _2904;
        float _2962 = _2946;
        if (_2856)
        {
            float _2964 = _2776 * _2900;
            _2948 = _2964;
        }
        float _2966 = _2948;
        float _2968 = _2966;
        if (_2856)
        {
            float _2970 = fma(_1128, _2874, _2946);
            _2938 = _2970;
        }
        float _2972 = _2938;
        float _2974 = _2972;
        if (_2856)
        {
            float _2976 = _2776 * _2924;
            _2950 = _2976;
        }
        float _2978 = _2950;
        float _2980 = _2978;
        if (_2856)
        {
            float _2982 = fma(_1128, _2898, _2966);
            _2952 = _2982;
        }
        float _2984 = _2952;
        float _2986 = _2984;
        if (_2856)
        {
            float _2988 = fma(_1130, _2878, _2972);
            _2974 = _2988;
        }
        float _2990 = _2974;
        if (!_2856)
        {
            _2940 = 0.0;
        }
        float _2992 = _2940;
        float _2994 = _2992;
        if (_2856)
        {
            float _2996 = fma(_1128, _2922, _2978);
            _2942 = _2996;
        }
        float _2998 = _2942;
        if (_2856)
        {
            float _3000 = fma(_1130, _2902, _2984);
            _2986 = _3000;
        }
        float _3002 = _2986;
        float _3004 = _3002;
        if (!_2856)
        {
            _2954 = 0.0;
            _2980 = 0.0;
        }
        float _3006 = _2954;
        float _3008 = _2980;
        float _3010 = _3008;
        float _3012 = _3006;
        if (_2856)
        {
            float _3014 = fma(_1130, _2926, _2998);
            _2956 = _3014;
        }
        float _3016 = _2956;
        float _3018 = _3016;
        if (_2856)
        {
            float _3020 = _2990 + _2880;
            _3010 = _3020;
        }
        float _3022 = _3010;
        float _3024 = _3022;
        if (_2856)
        {
            float _3026 = _3002 + _2904;
            _2994 = _3026;
        }
        float _3028 = _2994;
        float _3030 = _3028;
        if (_2856)
        {
            float _3032 = _3016 + _2928;
            _3012 = _3032;
        }
        float _3034 = _3012;
        bool _3036 = !_2932;
        float _3038 = _3034;
        if (!_3036)
        {
            float _3040 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
            uint _3042 = uint(int(uint(_266) >> uint(2)));
            float _3044 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3042)]);
            int _3046 = _266 + 4;
            uint _3048 = uint(int(uint(_3046) >> uint(2)));
            float _3050 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3048)]);
            int _3052 = _266 + 8;
            uint _3054 = uint(int(uint(_3052) >> uint(2)));
            float _3056 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3054)]);
            int _3058 = _266 + 12;
            uint _3060 = uint(int(uint(_3058) >> uint(2)));
            float _3062 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3060)]);
            uint _3064 = uint(int(uint(_266) >> uint(2)));
            float _3066 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3064)]);
            int _3068 = _266 + 4;
            uint _3070 = uint(int(uint(_3068) >> uint(2)));
            float _3072 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3070)]);
            int _3074 = _266 + 8;
            uint _3076 = uint(int(uint(_3074) >> uint(2)));
            float _3078 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3076)]);
            uint _3080 = uint(int(uint(_266) >> uint(2)));
            float _3082 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3080)]);
            int _3084 = _266 + 4;
            uint _3086 = uint(int(uint(_3084) >> uint(2)));
            float _3088 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3086)]);
            int _3090 = _266 + 8;
            uint _3092 = uint(int(uint(_3090) >> uint(2)));
            float _3094 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3092)]);
            float _3096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
            float _3098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
            float _3100 = _3050 * _2776;
            float _3102 = _3072 * _2776;
            float _3104 = _3088 * _2776;
            float _3106 = fma(_1128, _3044, _3100);
            float _3108 = fma(_1128, _3066, _3102);
            float _3110 = fma(_1128, _3082, _3104);
            float _3112 = fma(_1130, _3056, _3106);
            float _3114 = fma(_1130, _3078, _3108);
            float _3116 = fma(_1130, _3094, _3110);
            float _3118 = _3040 + _3112;
            float _3120 = _3096 + _3114;
            float _3122 = _3098 + _3116;
            _3004 = _3112;
            _2968 = _3040;
            _2958 = _3098;
            _2960 = _3096;
            _3038 = _3122;
            _3024 = _3118;
            _3018 = _3114;
            _3030 = _3120;
            _2962 = _3044;
            _2804 = _3050;
            _2806 = _3056;
            _2808 = _3062;
        }
        float _3124 = _3004;
        float _3126 = _2968;
        float _3128 = _2958;
        float _3130 = _2960;
        float _3132 = _3038;
        float _3134 = _3024;
        float _3136 = _3018;
        float _3138 = _3030;
        float _3140 = _2962;
        float _3142 = _2804;
        float _3144 = _2806;
        float _3146 = _2808;
        bool _3148 = !_2936;
        float _3150 = _3134;
        float _3152 = _3132;
        float _3154 = _3138;
        float _3156 = _3126;
        float _3158 = _3128;
        float _3160 = _3130;
        float _3162 = _3140;
        float _3164 = _3136;
        float _3166 = _3124;
        _2828 = _3142;
        _2830 = _3144;
        _2832 = _3146;
        if (!_3148)
        {
            uint _3168 = uint(int(uint(_266) >> uint(2)));
            float _3170 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3168)]);
            int _3172 = _266 + 4;
            uint _3174 = uint(int(uint(_3172) >> uint(2)));
            float _3176 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3174)]);
            int _3178 = _266 + 8;
            uint _3180 = uint(int(uint(_3178) >> uint(2)));
            float _3182 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3180)]);
            int _3184 = _266 + 12;
            uint _3186 = uint(int(uint(_3184) >> uint(2)));
            float _3188 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3186)]);
            uint _3190 = uint(int(uint(_266) >> uint(2)));
            float _3192 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3190)]);
            int _3194 = _266 + 4;
            uint _3196 = uint(int(uint(_3194) >> uint(2)));
            float _3198 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3196)]);
            int _3200 = _266 + 8;
            uint _3202 = uint(int(uint(_3200) >> uint(2)));
            float _3204 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3202)]);
            int _3206 = _266 + 12;
            uint _3208 = uint(int(uint(_3206) >> uint(2)));
            float _3210 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3208)]);
            uint _3212 = uint(int(uint(_266) >> uint(2)));
            float _3214 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3212)]);
            int _3216 = _266 + 4;
            uint _3218 = uint(int(uint(_3216) >> uint(2)));
            float _3220 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3218)]);
            int _3222 = _266 + 8;
            uint _3224 = uint(int(uint(_3222) >> uint(2)));
            float _3226 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3224)]);
            int _3228 = _266 + 12;
            uint _3230 = uint(int(uint(_3228) >> uint(2)));
            float _3232 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3230)]);
            float _3234 = _3176 * _2776;
            float _3236 = _3198 * _2776;
            float _3238 = _3220 * _2776;
            float _3240 = fma(_1128, _3170, _3234);
            float _3242 = fma(_1128, _3192, _3236);
            float _3244 = fma(_1128, _3214, _3238);
            float _3246 = fma(_1130, _3182, _3240);
            float _3248 = fma(_1130, _3204, _3242);
            float _3250 = fma(_1130, _3226, _3244);
            float _3252 = _3246 + _3188;
            float _3254 = _3248 + _3210;
            float _3256 = _3250 + _3232;
            _3150 = _3252;
            _3152 = _3256;
            _3154 = _3254;
            _3156 = _3176;
            _3158 = _3182;
            _3160 = _3188;
            _3162 = _3234;
            _3164 = _3248;
            _3166 = _3246;
        }
        float _3258 = _3150;
        float _3260 = _3152;
        float _3262 = _3154;
        float _3264 = _3156;
        float _3266 = _3158;
        float _3268 = _3160;
        float _3270 = _3162;
        float _3272 = _3164;
        float _3274 = _3166;
        float _3276 = fma(_3258, 6.2500002968590706586837768554688e-05, 0.5);
        float _3278 = fma(_3260, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _9673 = float2(_3276, _3278);
        float _3280 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9673, float2(0.0), isnan(_9673)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9673, float2(0.0), isnan(_9673)), level(0.0)).x;
        float _3282 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[71]);
        float _3284 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
        float _3286 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[69]);
        float _3288 = -_3282;
        float _3290 = _3288 + _3262;
        float _3292 = _3280 * 2000.0;
        float _3294 = _3292 + (-0.300000011920928955078125);
        bool _3296 = _3290 > _3294;
        bool _3298 = _3290 < _3292;
        bool _3300 = _3298 && _3296;
        bool _3302 = !_3300;
        _2810 = _3260;
        _2812 = _3258;
        _2814 = _3272;
        _2816 = _3294;
        _2818 = _3274;
        _2820 = _3264;
        _2822 = _3266;
        _2824 = _3268;
        _2826 = _3270;
        if (!_3302)
        {
            float _3304 = fma(_3258, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3306 = fma(_3258, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float _3308 = fma(_3260, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
            float _3310 = fma(_3260, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
            float2 _9730 = float2(_3304, _3278);
            float _3312 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9730, float2(0.0), isnan(_9730)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9730, float2(0.0), isnan(_9730)), level(0.0)).x;
            float2 _9738 = float2(_3306, _3278);
            float _3314 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9738, float2(0.0), isnan(_9738)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9738, float2(0.0), isnan(_9738)), level(0.0)).x;
            float2 _9746 = float2(_3276, _3308);
            float _3316 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9746, float2(0.0), isnan(_9746)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9746, float2(0.0), isnan(_9746)), level(0.0)).x;
            float2 _9754 = float2(_3276, _3310);
            float _3318 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9754, float2(0.0), isnan(_9754)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9754, float2(0.0), isnan(_9754)), level(0.0)).x;
            float2 _9762 = float2(_3304, _3308);
            float _3320 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9762, float2(0.0), isnan(_9762)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9762, float2(0.0), isnan(_9762)), level(0.0)).x;
            float2 _9770 = float2(_3304, _3310);
            float _3322 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9770, float2(0.0), isnan(_9770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9770, float2(0.0), isnan(_9770)), level(0.0)).x;
            float2 _9778 = float2(_3306, _3308);
            float _3324 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9778, float2(0.0), isnan(_9778)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9778, float2(0.0), isnan(_9778)), level(0.0)).x;
            float2 _9786 = float2(_3306, _3310);
            float _3326 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_9786, float2(0.0), isnan(_9786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_9786, float2(0.0), isnan(_9786)), level(0.0)).x;
            float _3328 = -_3312;
            float _3330 = _3280 + _3328;
            float _3332 = -_3314;
            float _3334 = _3280 + _3332;
            float _3336 = -_3316;
            float _3338 = _3280 + _3336;
            float _3340 = -_3318;
            float _3342 = _3280 + _3340;
            float _3344 = -_3320;
            float _3346 = _3280 + _3344;
            float _3348 = -_3322;
            float _3350 = _3280 + _3348;
            float _3352 = -_3324;
            float _3354 = _3280 + _3352;
            float _3356 = -_3326;
            float _3358 = _3280 + _3356;
            float _3360 = abs(_3330);
            float _3362 = abs(_3334);
            float _3364 = precise::max(_3360, _3362);
            float _3366 = abs(_3338);
            float _3368 = abs(_3342);
            float _3370 = precise::max(_3366, _3368);
            float _3372 = abs(_3346);
            float _3374 = abs(_3350);
            float _3376 = precise::max(_3372, _3374);
            float _3378 = precise::max(_3364, _3370);
            float _3380 = abs(_3354);
            float _3382 = abs(_3358);
            float _3384 = precise::max(_3380, _3382);
            bool _3386 = _3378 > 0.00150000001303851604461669921875;
            float _3388 = precise::max(_3376, _3384);
            bool _3390 = _3388 <= 0.00150000001303851604461669921875;
            bool _3392 = isnan(_3388);
            bool _3394 = _3390 || _3392;
            bool _3396 = isnan(0.00150000001303851604461669921875);
            bool _3398 = _3394 || _3396;
            bool _3400 = !_3386;
            bool _3402 = _3398 && _3400;
            bool _3404 = !_3402;
            float _3406 = _3304;
            float _3408 = _3308;
            float _3410 = _3310;
            float _3412 = _3378;
            float _3414 = _3388;
            float _3416 = _3350;
            float _3418 = _3354;
            float _3420 = _3384;
            float _3422 = _3364;
            float _3424 = _3334;
            _2810 = _3338;
            _2812 = _3306;
            _2814 = _3304;
            _2816 = _3308;
            _2818 = _3310;
            _2820 = _3378;
            _2822 = _3388;
            _2824 = _3350;
            _2826 = _3354;
            _2828 = _3384;
            _2830 = _3364;
            _2832 = _3334;
            if (!_3404)
            {
                float _3426 = -_3280;
                float _3428 = _3426 + _3312;
                float _3430 = -_3280;
                float _3432 = _3430 + _3316;
                float _3434 = _3428 * 2000.0;
                float _3436 = _3432 * 2000.0;
                bool _3438 = !_2856;
                float _3440 = _3428;
                float _3548;
                float _3550;
                float _3552;
                float _3554;
                if (!_3438)
                {
                    float _3442 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
                    float _3444 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
                    float _3446 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
                    float _3448 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
                    float _3450 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
                    float _3452 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
                    float _3454 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
                    float _3456 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
                    float _3458 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
                    float _3460 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
                    float _3462 = _3446 * _3448;
                    float _3464 = _3446 * _3450;
                    float _3466 = _3444 * _3448;
                    float _3468 = -_3462;
                    float _3470 = fma(_3442, _3452, _3468);
                    float _3472 = -_3464;
                    float _3474 = fma(_3444, _3452, _3472);
                    float _3476 = _3458 * _3444;
                    float _3478 = _3456 * _3452;
                    float _3480 = _3470 * _3456;
                    float _3482 = -_3466;
                    float _3484 = fma(_3442, _3450, _3482);
                    float _3486 = _3454 * _3446;
                    float _3488 = -_3476;
                    float _3490 = fma(_3456, _3446, _3488);
                    float _3492 = -_3480;
                    float _3494 = fma(_3474, _3454, _3492);
                    float _3496 = _3458 * _3448;
                    float _3498 = -_3486;
                    float _3500 = fma(_3458, _3442, _3498);
                    float _3502 = -_3478;
                    float _3504 = fma(_3458, _3450, _3502);
                    float _3506 = fma(_3484, _3458, _3494);
                    float _3508 = _3454 * _3450;
                    float _3510 = _3456 * _3442;
                    float _3512 = -_3442;
                    float _3514 = fma(_3512, _3452, _3462);
                    float _3516 = -_3496;
                    float _3518 = fma(_3454, _3452, _3516);
                    float _3520 = -_3508;
                    float _3522 = fma(_3456, _3448, _3520);
                    float _3524 = 1.0 / _3506;
                    float _3526 = -_3510;
                    float _3528 = fma(_3454, _3444, _3526);
                    float _3530 = fma(_3474, _3434, _3504);
                    float _3532 = fma(_3514, _3434, _3518);
                    float _3534 = fma(_3484, _3434, _3522);
                    float _3536 = fma(_3490, _3436, _3530);
                    float _3538 = fma(_3500, _3436, _3532);
                    float _3540 = fma(_3528, _3436, _3534);
                    float _3542 = _3524 * _3536;
                    float _3544 = _3524 * _3538;
                    float _3546 = _3524 * _3540;
                    _3548 = _3544;
                    _3550 = _3542;
                    _3552 = _3546;
                    _3440 = _3448;
                    _3554 = _3450;
                    _3406 = _3452;
                    _3408 = _3490;
                    _3410 = _3514;
                    _3412 = _3528;
                    _3414 = _3446;
                    _3416 = _3496;
                    _3418 = _3454;
                    _3420 = _3522;
                    _3422 = _3458;
                    _3424 = _3460;
                    _590 = _3510;
                    _592 = _3500;
                    _3556 = true;
                }
                else
                {
                    float _3558 = fma(_3434, _550, _552);
                    float _3560 = fma(_3434, _554, _556);
                    float _3562 = fma(_3434, _558, _560);
                    float _3564 = fma(_3436, _562, _3558);
                    float _3566 = fma(_3436, _564, _3560);
                    float _3568 = fma(_3436, _566, _3562);
                    _3548 = _3566;
                    _3550 = _3564;
                    _3552 = _3568;
                    _3554 = _3558;
                }
                _3556 = false;
                float _3570 = _3548;
                float _3572 = _3550;
                float _3574 = _3552;
                float _3576 = _3440;
                float _3578 = _3554;
                float _3580 = _3406;
                float _3582 = _3408;
                float _3584 = _3410;
                float _3586 = _3412;
                float _3588 = _3414;
                float _3590 = _3416;
                float _3592 = _3418;
                float _3594 = _3420;
                float _3596 = _3422;
                float _3598 = _3424;
                float _3600 = _590;
                float _3602 = _592;
                float _3604 = _3570 * _3570;
                float _3606 = -_3290;
                float _3608 = _3606 + _3292;
                float _3610 = fma(_3572, _3572, _3604);
                float _3612 = _3608 + _2776;
                float _3614 = fma(_3574, _3574, _3610);
                float _3616 = rsqrt(_3614);
                float _3618 = _3616 * _3570;
                float _3620 = _3616 * _3572;
                float _3622 = _3616 * _3574;
                float _3624 = _3618 * _2752;
                float _3626 = fma(_3620, _2786, _3624);
                float _3628 = fma(_3622, _2788, _3626);
                float _3630 = _3618 * _3628;
                float _3632 = _3622 * _3628;
                float _3634 = _3620 * _3628;
                float _3636 = -_3630;
                float _3638 = _3636 + _2752;
                float _3640 = -_3632;
                float _3642 = _3640 + _2788;
                float _3644 = -_3634;
                float _3646 = _3644 + _2786;
                float _3648 = _3284 * _3634;
                float _3650 = _3284 * _3630;
                float _3652 = _3284 * _3632;
                float _3654 = -_3648;
                float _3656 = fma(_3286, _3646, _3654);
                float _3658 = -_3650;
                float _3660 = fma(_3286, _3638, _3658);
                float _3662 = -_3652;
                float _3664 = fma(_3286, _3642, _3662);
                _2810 = _3576;
                _2812 = _3578;
                _2814 = _3580;
                _2816 = _3582;
                _2818 = _3584;
                _2820 = _3586;
                _2822 = _3588;
                _2824 = _3590;
                _2826 = _3592;
                _2828 = _3594;
                _2830 = _3596;
                _2832 = _3598;
                _2834 = _3612;
                _594 = _3652;
                _596 = _3648;
                _598 = _3600;
                _600 = _3650;
                _602 = _3602;
                _604 = _3616;
                _2836 = _3656;
                _2838 = _3660;
                _2840 = _3664;
            }
        }
    }
    _2850 = false;
    int _3666 = _2846;
    float _3668 = _2810;
    float _3670 = _2812;
    float _3672 = _2814;
    float _3674 = _2816;
    float _3676 = _2818;
    float _3678 = _2820;
    float _3680 = _2822;
    float _3682 = _2824;
    float _3684 = _2826;
    float _3686 = _2828;
    float _3688 = _2830;
    float _3690 = _2832;
    int _3692 = _2848;
    float _3694 = _2834;
    float _3696 = _594;
    float _3698 = _596;
    float _3700 = _598;
    float _3702 = _600;
    float _3704 = _602;
    float _3706 = _604;
    float _3708 = _2836;
    float _3710 = _2838;
    float _3712 = _2840;
    bool _3714 = _3666 != 0;
    float _3716 = _3668;
    float _3718 = _3670;
    float _3720 = _3672;
    float _3722 = _3674;
    float _3724 = _3706;
    float _3726 = _3696;
    float _3728 = _3698;
    float _3730 = _3700;
    float _3732 = _3702;
    float _3734 = _3704;
    if (_3714)
    {
        float _3736 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _3738 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _3740 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _3742 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _3716 = _3736;
        _3718 = _3738;
        _3720 = _3740;
        _3722 = _3742;
    }
    float _3744 = _3716;
    float _3746 = _3718;
    float _3748 = _3720;
    float _3750 = _3722;
    float _3752 = _3676;
    float _3754 = _3678;
    float _3756 = _3680;
    float _3758 = _3682;
    if (_3714)
    {
        float _3760 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _3762 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _3764 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _3766 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _3752 = _3760;
        _3754 = _3762;
        _3756 = _3764;
        _3758 = _3766;
    }
    float _3768 = _3752;
    float _3770 = _3754;
    float _3772 = _3756;
    float _3774 = _3758;
    float _3776 = _3684;
    float _3778 = _3686;
    float _3780 = _3688;
    float _3782 = _3690;
    if (_3714)
    {
        float _3784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _3786 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _3788 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _3790 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _3776 = _3784;
        _3778 = _3786;
        _3780 = _3788;
        _3782 = _3790;
    }
    float _3792 = _3776;
    float _3794 = _3778;
    float _3796 = _3780;
    float _3798 = _3782;
    float _3800 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[16]);
    float _3802 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[17]);
    float _3804 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[18]);
    float _3806 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[13]);
    int _3808 = _3692 & 1024;
    bool _3810 = _3808 != 0;
    if (!_3714)
    {
        _3724 = 0.0;
    }
    float _3812 = _3724;
    int _3814 = _3692 & 2048;
    bool _3816 = _3814 != 0;
    float _3818 = _3812;
    if (_3714)
    {
        float _3820 = _3694 * _3746;
        _3726 = _3820;
    }
    float _3822 = _3726;
    float _3824 = _3822;
    if (_3714)
    {
        float _3826 = _3694 * _3770;
        _3728 = _3826;
    }
    float _3828 = _3728;
    float _3830 = _3828;
    if (_3714)
    {
        float _3832 = fma(_1128, _3744, _3822);
        _3824 = _3832;
    }
    float _3834 = _3824;
    float _3836 = _3834;
    if (_3714)
    {
        float _3838 = _3694 * _3794;
        _3730 = _3838;
    }
    float _3840 = _3730;
    float _3842 = _3840;
    if (_3714)
    {
        float _3844 = fma(_1128, _3768, _3828);
        _3830 = _3844;
    }
    float _3846 = _3830;
    float _3848 = _3846;
    if (_3714)
    {
        float _3850 = fma(_1130, _3748, _3834);
        _3732 = _3850;
    }
    float _3852 = _3732;
    float _3854 = _3852;
    if (!_3714)
    {
        _3836 = 0.0;
    }
    float _3856 = _3836;
    float _3858 = _3856;
    if (_3714)
    {
        float _3860 = fma(_1128, _3792, _3840);
        _3842 = _3860;
    }
    float _3862 = _3842;
    float _3864 = _3862;
    if (_3714)
    {
        float _3866 = fma(_1130, _3772, _3846);
        _3734 = _3866;
    }
    float _3868 = _3734;
    if (!_3714)
    {
        _3848 = 0.0;
    }
    float _3870 = _3848;
    float _3872 = _3870;
    if (_3714)
    {
        float _3874 = _3852 + _3750;
        _3818 = _3874;
    }
    float _3876 = _3818;
    float _3878 = _3876;
    if (_3714)
    {
        float _3880 = fma(_1130, _3796, _3862);
        _3864 = _3880;
    }
    float _3882 = _3864;
    if (_3714)
    {
        float _3884 = _3868 + _3774;
        _3858 = _3884;
    }
    float _3886 = _3858;
    float _3888 = _3886;
    if (_3714)
    {
        float _3890 = _3882 + _3798;
        _3872 = _3890;
    }
    float _3892 = _3872;
    bool _3894 = !_3810;
    float _3896 = _3892;
    if (!_3894)
    {
        float _3898 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _3900 = uint(int(uint(_266) >> uint(2)));
        float _3902 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3900)]);
        int _3904 = _266 + 4;
        uint _3906 = uint(int(uint(_3904) >> uint(2)));
        float _3908 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3906)]);
        int _3910 = _266 + 8;
        uint _3912 = uint(int(uint(_3910) >> uint(2)));
        float _3914 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3912)]);
        uint _3916 = uint(int(uint(_266) >> uint(2)));
        float _3918 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3916)]);
        int _3920 = _266 + 4;
        uint _3922 = uint(int(uint(_3920) >> uint(2)));
        float _3924 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3922)]);
        int _3926 = _266 + 8;
        uint _3928 = uint(int(uint(_3926) >> uint(2)));
        float _3930 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_3928)]);
        uint _3932 = uint(int(uint(_266) >> uint(2)));
        float _3934 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3932)]);
        int _3936 = _266 + 4;
        uint _3938 = uint(int(uint(_3936) >> uint(2)));
        float _3940 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3938)]);
        int _3942 = _266 + 8;
        uint _3944 = uint(int(uint(_3942) >> uint(2)));
        float _3946 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_3944)]);
        float _3948 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _3950 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _3952 = _3908 * _3694;
        float _3954 = _3924 * _3694;
        float _3956 = fma(_1128, _3902, _3952);
        float _3958 = _3940 * _3694;
        float _3960 = fma(_1128, _3918, _3954);
        float _3962 = fma(_1130, _3914, _3956);
        float _3964 = fma(_1128, _3934, _3958);
        float _3966 = fma(_1130, _3930, _3960);
        float _3968 = fma(_1130, _3946, _3964);
        float _3970 = _3898 + _3962;
        float _3972 = _3948 + _3966;
        float _3974 = _3950 + _3968;
        _3888 = _3972;
        _3878 = _3970;
        _3896 = _3974;
        _3854 = _3968;
    }
    float _3976 = _3888;
    float _3978 = _3878;
    float _3980 = _3896;
    float _3982 = _3854;
    bool _3984 = !_3816;
    float _3986 = _3976;
    float _3988 = _3978;
    float _3990 = _3980;
    float _3992 = _3982;
    if (!_3984)
    {
        uint _3994 = uint(int(uint(_266) >> uint(2)));
        float _3996 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_3994)]);
        int _3998 = _266 + 4;
        uint _4000 = uint(int(uint(_3998) >> uint(2)));
        float _4002 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4000)]);
        int _4004 = _266 + 8;
        uint _4006 = uint(int(uint(_4004) >> uint(2)));
        float _4008 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4006)]);
        int _4010 = _266 + 12;
        uint _4012 = uint(int(uint(_4010) >> uint(2)));
        float _4014 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_4012)]);
        uint _4016 = uint(int(uint(_266) >> uint(2)));
        float _4018 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4016)]);
        int _4020 = _266 + 4;
        uint _4022 = uint(int(uint(_4020) >> uint(2)));
        float _4024 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4022)]);
        int _4026 = _266 + 8;
        uint _4028 = uint(int(uint(_4026) >> uint(2)));
        float _4030 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4028)]);
        int _4032 = _266 + 12;
        uint _4034 = uint(int(uint(_4032) >> uint(2)));
        float _4036 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_4034)]);
        uint _4038 = uint(int(uint(_266) >> uint(2)));
        float _4040 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4038)]);
        int _4042 = _266 + 4;
        uint _4044 = uint(int(uint(_4042) >> uint(2)));
        float _4046 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4044)]);
        int _4048 = _266 + 8;
        uint _4050 = uint(int(uint(_4048) >> uint(2)));
        float _4052 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4050)]);
        int _4054 = _266 + 12;
        uint _4056 = uint(int(uint(_4054) >> uint(2)));
        float _4058 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_4056)]);
        float _4060 = _4002 * _3694;
        float _4062 = _4024 * _3694;
        float _4064 = fma(_1128, _3996, _4060);
        float _4066 = _4046 * _3694;
        float _4068 = fma(_1128, _4018, _4062);
        float _4070 = fma(_1128, _4040, _4066);
        float _4072 = fma(_1130, _4008, _4064);
        float _4074 = fma(_1130, _4030, _4068);
        float _4076 = fma(_1130, _4052, _4070);
        float _4078 = _4072 + _4014;
        float _4080 = _4074 + _4036;
        float _4082 = _4076 + _4058;
        _3986 = _4080;
        _3988 = _4078;
        _3990 = _4082;
    }
    float _4084 = _3986;
    float _4086 = _3988;
    float _4088 = _3990;
    float _4090 = -_4084;
    float _4092 = _3802 + _4090;
    float _4094 = -_4086;
    float _4096 = _3800 + _4094;
    float _4098 = -_4088;
    float _4100 = _3804 + _4098;
    float _4102 = _4092 * _4092;
    float _4104 = fma(_4096, _4096, _4102);
    float _4106 = fma(_4100, _4100, _4104);
    float _4108 = sqrt(_4106);
    float _4110 = 0.0;
    float _4112 = 0.0;
    float _4114 = 0.0;
    if (!_1908)
    {
        bool _4116 = _4108 > _3806;
        float _4118 = float(_4116);
        _3992 = _4118;
    }
    float _4120 = _3992;
    bool _4122 = !_1908;
    float _4124 = _4120;
    if (!_4122)
    {
        float _4126 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[20]);
        float _4128 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[21]);
        float _4130 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[22]);
        float _4132 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[24]);
        float _4134 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[25]);
        float _4136 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[26]);
        float _4138 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[28]);
        float _4140 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[29]);
        float _4142 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[30]);
        uint _4144 = uint(int(uint(_268) >> uint(2)));
        float _4146 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_4144)]);
        bool _4148 = _4108 > _3806;
        float _4150 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
        float _4152 = -_4084;
        float _4154 = _4128 + _4152;
        float _4156 = -_4086;
        float _4158 = _4126 + _4156;
        float _4160 = -_4088;
        float _4162 = _4130 + _4160;
        float _4164 = -_4084;
        float _4166 = _4134 + _4164;
        float _4168 = _4154 * _4154;
        float _4170 = -_4086;
        float _4172 = _4132 + _4170;
        float _4174 = -_4088;
        float _4176 = _4136 + _4174;
        float _4178 = -_4084;
        float _4180 = _4140 + _4178;
        float _4182 = _4166 * _4166;
        float _4184 = -_4086;
        float _4186 = _4138 + _4184;
        float _4188 = fma(_4158, _4158, _4168);
        float _4190 = _4180 * _4180;
        float _4192 = fma(_4172, _4172, _4182);
        float _4194 = -_4088;
        float _4196 = _4142 + _4194;
        float _4198 = fma(_4162, _4162, _4188);
        float _4200 = fma(_4186, _4186, _4190);
        float _4202 = fma(_4176, _4176, _4192);
        float _4204 = _4088;
        int _4206 = as_type<int>(_4186);
        int _4208 = as_type<int>(_4176);
        int _4210 = as_type<int>(_4196);
        if (!_4148)
        {
            float _4212 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _4204 = _4212;
        }
        float _4214 = _4204;
        float _4216 = fma(_4196, _4196, _4200);
        float _4218 = sqrt(_4198);
        float _4220 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[14]);
        float _4222 = sqrt(_4202);
        float _4224 = sqrt(_4216);
        bool _4226 = _4218 > _3806;
        bool _4228 = _4222 > _3806;
        float _4230 = _4158;
        if (!_4226)
        {
            float _4232 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _4230 = _4232;
        }
        float _4234 = _4230;
        bool _4236 = _4224 > _3806;
        float _4238 = _4162;
        if (!_4228)
        {
            float _4240 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _4238 = _4240;
        }
        float _4242 = _4238;
        float _4244 = _4172;
        if (!_4236)
        {
            float _4246 = as_type<float>((*spvDescriptorSet0.cp_s14)._m0[12]);
            _4244 = _4246;
        }
        float _4248 = _4244;
        int _4250 = as_type<int>(_4146) << 24;
        int _4252 = _4250 >> 24;
        float _4254 = float(_4252);
        float _4256 = _4254 * 0.0078740157186985015869140625;
        float _4258 = precise::min(_4256, 1.0);
        float _4260 = precise::max(_4258, -1.0);
        int _4262 = as_type<int>(_4146) << 16;
        int _4264 = as_type<int>(_4146) << 8;
        bool _4266 = _4260 > 0.0;
        bool _4268 = _4266 || _4148;
        int _4270 = _4262 >> 24;
        int _4272 = as_type<int>(_4146) >> 24;
        int _4274 = _4264 >> 24;
        int _4276 = _4270;
        if (!_4148)
        {
            bool _4278 = _4260 >= 0.0;
            bool _4280 = isnan(_4260);
            bool _4282 = _4278 || _4280;
            bool _4284 = isnan(0.0);
            bool _4286 = _4282 || _4284;
            _1912 = _4286;
        }
        bool _4288 = _1912;
        float _4290 = float(_4270);
        float _4292 = float(_4274);
        float _4294 = _4290;
        bool _4296 = _4288;
        if (!_4148)
        {
            int _4298 = _4288 ? 0 : 1;
            _4206 = _4298;
        }
        int _4300 = _4206;
        float _4302 = _4290 * 0.0078740157186985015869140625;
        float _4304 = float(_4272);
        float _4306 = _4292 * 0.0078740157186985015869140625;
        if (!_4148)
        {
            int _4308 = ~_4300;
            int _4310 = _4308 + 1;
            int _4312 = _4310 + 1;
            _4276 = _4312;
        }
        int _4314 = _4276;
        int _4316 = _4314;
        if (!_4268)
        {
            int _4318 = ~_4300;
            int _4320 = _4318 + 1;
            _4316 = _4320;
        }
        int _4322 = _4316;
        float _4324 = _4304 * 0.0078740157186985015869140625;
        float _4326 = precise::min(_4302, 1.0);
        int _4328 = _4322;
        int _4330 = as_type<int>(_4326);
        if (!_4148)
        {
            float _4332 = float(_4322);
            _4328 = as_type<int>(_4332);
        }
        int _4334 = _4328;
        float _4336 = precise::min(_4324, 1.0);
        int _4338 = _4334;
        int _4340 = as_type<int>(_4336);
        if (_4148)
        {
            _4294 = 1.0;
        }
        float _4342 = _4294;
        float _4344 = precise::max(_4336, -1.0);
        float _4346 = _4342;
        if (!_4148)
        {
            bool _4348 = _4108 >= _4214;
            bool _4350 = isnan(_4108);
            bool _4352 = _4348 || _4350;
            bool _4354 = isnan(_4214);
            bool _4356 = _4352 || _4354;
            _4296 = _4356;
        }
        bool _4358 = _4296;
        float _4360 = precise::min(_4306, 1.0);
        float _4362 = precise::max(_4326, -1.0);
        bool _4364 = _4358;
        int _4366 = as_type<int>(_4360);
        if (!_4148)
        {
            float _4368 = _4358 ? as_type<float>(_4334) : (-1.0);
            _4346 = _4368;
        }
        float _4370 = _4346;
        float _4372 = precise::max(_4360, -1.0);
        if (!_4226)
        {
            bool _4374 = _4362 >= 0.0;
            bool _4376 = isnan(_4362);
            bool _4378 = _4374 || _4376;
            bool _4380 = isnan(0.0);
            bool _4382 = _4378 || _4380;
            _4364 = _4382;
        }
        bool _4384 = _4364;
        if (!_4228)
        {
            bool _4386 = _4372 >= 0.0;
            bool _4388 = isnan(_4372);
            bool _4390 = _4386 || _4388;
            bool _4392 = isnan(0.0);
            bool _4394 = _4390 || _4392;
            _1060 = _4394;
        }
        bool _4396 = _1060;
        bool _4398 = _4396;
        if (!_4226)
        {
            int _4400 = _4384 ? 0 : 1;
            _4366 = _4400;
        }
        int _4402 = _4366;
        bool _4404 = _4362 > 0.0;
        bool _4406 = _4404 || _4226;
        bool _4408 = _4372 > 0.0;
        bool _4410 = _4408 || _4228;
        bool _4412 = _4344 > 0.0;
        bool _4414 = _4412 || _4236;
        bool _4416 = _4406;
        bool _4418 = _4410;
        bool _4420 = _4414;
        float _4422 = as_type<float>(_4402);
        if (!_4228)
        {
            int _4424 = _4396 ? 0 : 1;
            _4208 = _4424;
        }
        int _4426 = _4208;
        if (!_4236)
        {
            bool _4428 = _4344 >= 0.0;
            bool _4430 = isnan(_4344);
            bool _4432 = _4428 || _4430;
            bool _4434 = isnan(0.0);
            bool _4436 = _4432 || _4434;
            _4398 = _4436;
        }
        bool _4438 = _4398;
        float _4440 = 1.0 / _4220;
        float _4442 = _4220;
        if (!_4236)
        {
            int _4444 = _4438 ? 0 : 1;
            _4338 = _4444;
        }
        int _4446 = _4338;
        float _4448 = as_type<float>(_4446);
        if (!_4226)
        {
            int _4450 = ~_4402;
            int _4452 = _4450 + 1;
            int _4454 = _4452 + 1;
            _4330 = _4454;
        }
        int _4456 = _4330;
        int _4458 = _4456;
        if (!_4228)
        {
            int _4460 = ~_4426;
            int _4462 = _4460 + 1;
            int _4464 = _4462 + 1;
            _4340 = _4464;
        }
        int _4466 = _4340;
        int _4468 = _4466;
        if (!_4236)
        {
            int _4470 = ~_4446;
            int _4472 = _4470 + 1;
            int _4474 = _4472 + 1;
            _4210 = _4474;
        }
        int _4476 = _4210;
        int _4478 = _4476;
        if (!_4406)
        {
            int _4480 = ~_4402;
            int _4482 = _4480 + 1;
            _4458 = _4482;
        }
        int _4484 = _4458;
        int _4486 = _4484;
        if (!_4410)
        {
            int _4488 = ~_4426;
            int _4490 = _4488 + 1;
            _4468 = _4490;
        }
        int _4492 = _4468;
        int _4494 = _4492;
        if (!_4414)
        {
            int _4496 = ~_4446;
            int _4498 = _4496 + 1;
            _4478 = _4498;
        }
        int _4500 = _4478;
        int _4502 = _4500;
        if (!_4226)
        {
            bool _4504 = _4218 >= _4234;
            bool _4506 = isnan(_4218);
            bool _4508 = _4504 || _4506;
            bool _4510 = isnan(_4234);
            bool _4512 = _4508 || _4510;
            _4416 = _4512;
        }
        bool _4514 = _4416;
        if (!_4228)
        {
            bool _4516 = _4222 >= _4242;
            bool _4518 = isnan(_4222);
            bool _4520 = _4516 || _4518;
            bool _4522 = isnan(_4242);
            bool _4524 = _4520 || _4522;
            _4418 = _4524;
        }
        bool _4526 = _4418;
        if (!_4226)
        {
            float _4528 = float(_4484);
            _4486 = as_type<int>(_4528);
        }
        int _4530 = _4486;
        if (!_4236)
        {
            bool _4532 = _4224 >= _4248;
            bool _4534 = isnan(_4224);
            bool _4536 = _4532 || _4534;
            bool _4538 = isnan(_4248);
            bool _4540 = _4536 || _4538;
            _4420 = _4540;
        }
        bool _4542 = _4420;
        if (!_4228)
        {
            float _4544 = float(_4492);
            _4494 = as_type<int>(_4544);
        }
        int _4546 = _4494;
        if (!_4236)
        {
            float _4548 = float(_4500);
            _4502 = as_type<int>(_4548);
        }
        int _4550 = _4502;
        if (_4226)
        {
            _4442 = 1.0;
        }
        float _4552 = _4442;
        float _4554 = _4552;
        if (_4228)
        {
            _4422 = 1.0;
        }
        float _4556 = _4422;
        float _4558 = _4556;
        if (_4236)
        {
            _4448 = 1.0;
        }
        float _4560 = _4448;
        float _4562 = _4150 * _4440;
        float _4564 = _4560;
        if (!_4226)
        {
            float _4566 = _4514 ? as_type<float>(_4530) : (-1.0);
            _4554 = _4566;
        }
        float _4568 = _4554;
        if (!_4228)
        {
            float _4570 = _4526 ? as_type<float>(_4546) : (-1.0);
            _4558 = _4570;
        }
        float _4572 = _4558;
        if (!_4236)
        {
            float _4574 = _4542 ? as_type<float>(_4550) : (-1.0);
            _4564 = _4574;
        }
        float _4576 = _4564;
        float _4578 = abs(_4260);
        float _4580 = fma(_4562, _4370, _4578);
        float _4582 = precise::clamp(_4580, 0.0, 1.0);
        float _4584 = abs(_4362);
        float _4586 = fma(_4562, _4568, _4584);
        float _4588 = precise::clamp(_4586, 0.0, 1.0);
        float _4590 = abs(_4372);
        float _4592 = fma(_4562, _4572, _4590);
        float _4594 = precise::clamp(_4592, 0.0, 1.0);
        float _4596 = abs(_4344);
        float _4598 = fma(_4562, _4576, _4596);
        float _4600 = precise::clamp(_4598, 0.0, 1.0);
        float _4602 = _4582 * _4370;
        float _4604 = _4588 * _4568;
        float _4606 = _4594 * _4572;
        float _4608 = _4600 * _4576;
        _4124 = _4602;
        _4110 = _4604;
        _4112 = _4606;
        _4114 = _4608;
    }
    float _4610 = _4124;
    float _4612 = _4110;
    float _4614 = _4112;
    float _4616 = _4114;
    float _4618 = precise::min(_4610, 1.0);
    int _4620 = _266 + 8;
    float _4622 = precise::max(_4618, -1.0);
    float _4624 = -_278;
    float _4626 = _4624 + _3694;
    float _4628 = precise::min(_4612, 1.0);
    float _4630 = -_272;
    float _4632 = _4630 + _1128;
    float _4634 = -_284;
    float _4636 = _4634 + _1130;
    float _4638 = _4622 * 127.0;
    float _4640 = precise::max(_4628, -1.0);
    float _4642 = precise::min(_4614, 1.0);
    float _4644 = precise::min(_4616, 1.0);
    float _4646 = _4640 * 127.0;
    float _4648 = precise::max(_4642, -1.0);
    float _4650 = rint(_4638);
    int _4652 = int(_4650);
    float _4654 = precise::max(_4644, -1.0);
    int _4656 = _266 + 4;
    float _4658 = _4648 * 127.0;
    float _4660 = _4654 * 127.0;
    float _4662 = rint(_4646);
    int _4664 = int(_4662);
    float _4666 = rint(_4658);
    int _4668 = int(_4666);
    uint _4670 = extract_bits(uint(_4652), 0u, 8u);
    int _4672 = int(_4670) & 255;
    float _4674 = rint(_4660);
    int _4676 = int(_4674);
    uint _4678 = extract_bits(uint(_4672), 0u, 8u);
    int _4680 = int(_4678) & 255;
    uint _4682 = extract_bits(uint(_4664), 0u, 8u);
    int _4684 = int(_4682) & 255;
    int _4686 = _4684 << 8;
    int _4688 = _4680 | _4686;
    uint _4690 = extract_bits(uint(_4672), 16u, 8u);
    int _4692 = int(_4690) & 255;
    int _4694 = _4692 << 16;
    int _4696 = _4688 | _4694;
    uint _4698 = extract_bits(uint(_4672), 24u, 8u);
    int _4700 = int(_4698) & 255;
    int _4702 = _4700 << 24;
    int _4704 = _4696 | _4702;
    uint _4706 = extract_bits(uint(_4704), 0u, 8u);
    int _4708 = int(_4706) & 255;
    uint _4710 = extract_bits(uint(_4704), 8u, 8u);
    int _4712 = int(_4710) & 255;
    int _4714 = _4712 << 8;
    int _4716 = _4708 | _4714;
    uint _4718 = extract_bits(uint(_4668), 0u, 8u);
    int _4720 = int(_4718) & 255;
    int _4722 = _4720 << 16;
    int _4724 = _4716 | _4722;
    uint _4726 = extract_bits(uint(_4704), 24u, 8u);
    int _4728 = int(_4726) & 255;
    int _4730 = _4728 << 24;
    int _4732 = _4724 | _4730;
    uint _4734 = extract_bits(uint(_4732), 0u, 8u);
    int _4736 = int(_4734) & 255;
    uint _4738 = extract_bits(uint(_4732), 8u, 8u);
    int _4740 = int(_4738) & 255;
    int _4742 = _4740 << 8;
    int _4744 = _4736 | _4742;
    uint _4746 = extract_bits(uint(_4732), 16u, 8u);
    int _4748 = int(_4746) & 255;
    int _4750 = _4748 << 16;
    int _4752 = _4744 | _4750;
    uint _4754 = extract_bits(uint(_4676), 0u, 8u);
    int _4756 = int(_4754) & 255;
    int _4758 = _4756 << 24;
    int _4760 = _4752 | _4758;
    uint _4762 = uint(int(uint(_268) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_4762)] = uint(_4760);
    uint _4764 = uint(int(uint(_268) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4764)] = as_type<uint>(_634);
    uint _4766 = uint(int(uint(_266) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4766)] = as_type<uint>(_1128);
    uint _4768 = uint(int(uint(_4656) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4768)] = as_type<uint>(_3694);
    uint _4770 = uint(int(uint(_4620) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_4770)] = as_type<uint>(_1130);
    uint _4772 = uint(int(uint(_266) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4772)] = as_type<uint>(_3708);
    uint _4774 = uint(int(uint(_4656) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4774)] = as_type<uint>(_3710);
    uint _4776 = uint(int(uint(_4620) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_4776)] = as_type<uint>(_3712);
    uint _4778 = uint(int(uint(_266) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4778)] = as_type<uint>(_4632);
    uint _4780 = uint(int(uint(_4656) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4780)] = as_type<uint>(_4626);
    uint _4782 = uint(int(uint(_4620) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4782)] = as_type<uint>(_4636);
    float _4784 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _4786 = _4626 * _4626;
    float _4788 = _3710 * _3710;
    float _4790 = fma(_4632, _4632, _4786);
    float _4792 = fma(_3708, _3708, _4788);
    float _4794 = fma(_4636, _4636, _4790);
    float _4796 = fma(_3712, _3712, _4792);
    float _4798 = sqrt(_4794);
    float _4800 = sqrt(_4796);
    bool _4802 = _4798 >= 9.9999999747524270787835121154785e-07;
    bool _4804 = isnan(_4798);
    bool _4806 = _4802 || _4804;
    bool _4808 = isnan(9.9999999747524270787835121154785e-07);
    bool _4810 = _4806 || _4808;
    if (!_4810)
    {
        bool _4812 = _182 != _304;
        bool _4814 = isnan(_182);
        bool _4816 = _4812 || _4814;
        bool _4818 = isnan(_304);
        bool _4820 = _4816 || _4818;
        _4822 = _4820;
        if (!_4822)
        {
            float _4824 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _4826 = _4824 > 0.0;
            bool _4828 = !_4826;
            if (!_4828)
            {
                float _4830 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _4832 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _4834 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _4836 = _4832 * _4832;
                float _4838 = fma(_4830, _4830, _4836);
                float _4840 = fma(_4834, _4834, _4838);
                float _4842 = rsqrt(_4840);
                float _4844 = _4842 * 9.9999999747524270787835121154785e-07;
                float _4846 = _4830 * _4844;
                float _4848 = _4832 * _4844;
                float _4850 = _4834 * _4844;
                _368 = as_type<int>(_4846);
                _370 = as_type<int>(_4848);
                _372 = as_type<int>(_4850);
                _4822 = true;
            }
            else
            {
                bool _4852 = _4800 >= 9.9999999747524270787835121154785e-07;
                bool _4854 = isnan(_4800);
                bool _4856 = _4852 || _4854;
                bool _4858 = isnan(9.9999999747524270787835121154785e-07);
                bool _4860 = _4856 || _4858;
                if (!_4860)
                {
                    float _4862 = _3694 * _3694;
                    float _4864 = fma(_1128, _1128, _4862);
                    float _4866 = fma(_1130, _1130, _4864);
                    float _4868 = sqrt(_4866);
                    bool _4870 = _4868 >= 9.9999999747524270787835121154785e-07;
                    bool _4872 = isnan(_4868);
                    bool _4874 = _4870 || _4872;
                    bool _4876 = isnan(9.9999999747524270787835121154785e-07);
                    bool _4878 = _4874 || _4876;
                    float _4880 = _4868;
                    if (_4878)
                    {
                        float _4882 = rsqrt(_4866);
                        _4880 = _4882;
                    }
                    float _4884 = _4880;
                    if (!_4878)
                    {
                        _356 = 0;
                    }
                    int _4886 = _356;
                    int _4888 = _4886;
                    if (!_4878)
                    {
                        _358 = 897988541;
                    }
                    int _4890 = _358;
                    int _4892 = _4890;
                    if (!_4878)
                    {
                        _360 = 0;
                    }
                    int _4894 = _360;
                    float _4896 = _4884;
                    int _4898 = _4894;
                    if (_4878)
                    {
                        float _4900 = _4884 * 9.9999999747524270787835121154785e-07;
                        _4896 = _4900;
                    }
                    float _4902 = _4896;
                    if (_4878)
                    {
                        float _4904 = _1128 * _4902;
                        _4888 = as_type<int>(_4904);
                    }
                    int _4906 = _4888;
                    _368 = _4906;
                    if (_4878)
                    {
                        float _4908 = _3694 * _4902;
                        _4892 = as_type<int>(_4908);
                    }
                    int _4910 = _4892;
                    _370 = _4910;
                    if (_4878)
                    {
                        float _4912 = _1130 * _4902;
                        _4898 = as_type<int>(_4912);
                    }
                    int _4914 = _4898;
                    _372 = _4914;
                    _4822 = true;
                }
                else
                {
                    float _4916 = rsqrt(_4796);
                    float _4918 = _4916 * 9.9999999747524270787835121154785e-07;
                    float _4920 = _3708 * _4918;
                    float _4922 = _3710 * _4918;
                    float _4924 = _3712 * _4918;
                    _368 = as_type<int>(_4920);
                    _370 = as_type<int>(_4922);
                    _372 = as_type<int>(_4924);
                    _4822 = true;
                }
            }
        }
    }
    else
    {
        float _4926 = _4800 * _4784;
        bool _4928 = _4926 >= 0.001000000047497451305389404296875;
        bool _4930 = isnan(_4926);
        bool _4932 = _4928 || _4930;
        bool _4934 = isnan(0.001000000047497451305389404296875);
        bool _4936 = _4932 || _4934;
        bool _4938 = _4926 > 0.0;
        bool _4940 = !_4936;
        bool _4942 = _4938 && _4940;
        bool _4944 = _4798 < 0.001000000047497451305389404296875;
        bool _4946 = _4944 && _4942;
        if (!_4946)
        {
            _362 = as_type<int>(_4632);
        }
        int _4948 = _362;
        int _4950 = _4948;
        if (_4946)
        {
            float _4952 = _4784 * _3708;
            _4950 = as_type<int>(_4952);
        }
        int _4954 = _4950;
        _368 = _4954;
        if (!_4946)
        {
            _364 = as_type<int>(_4626);
        }
        int _4956 = _364;
        int _4958 = _4956;
        if (_4946)
        {
            float _4960 = _4784 * _3710;
            _4958 = as_type<int>(_4960);
        }
        int _4962 = _4958;
        _370 = _4962;
        if (!_4946)
        {
            _366 = as_type<int>(_4636);
        }
        int _4964 = _366;
        _372 = _4964;
        if (_4946)
        {
            float _4966 = _4784 * _3712;
            _372 = as_type<int>(_4966);
        }
    }
    _4822 = false;
    int _4968 = _368;
    int _4970 = _370;
    int _4972 = _372;
    uint _4974 = uint(int(uint(_266) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4974)] = uint(_4968);
    uint _4976 = uint(int(uint(_4656) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4976)] = uint(_4970);
    uint _4978 = uint(int(uint(_4620) >> uint(2)));
    (*spvDescriptorSet0.cp_s5)._m0[int(_4978)] = uint(_4972);
}

