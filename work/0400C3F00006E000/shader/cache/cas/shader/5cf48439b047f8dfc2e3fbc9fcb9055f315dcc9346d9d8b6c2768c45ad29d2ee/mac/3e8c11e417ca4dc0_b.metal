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
    sampler cp_t_tcb_2CSmplr_w [[id(22)]];
    sampler cp_t_tcb_14Smplr_w [[id(23)]];
    sampler cp_t_tcb_2ASmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    bool _2420 = false;
    bool _824 = false;
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _82 = as_type<float>(gl_LocalInvocationID.x);
    float _84 = as_type<float>(gl_WorkGroupID.x);
    int _87 = as_type<int>(_84) << 5;
    int _89 = _87 + as_type<int>(_82);
    float _91 = trunc(_80);
    int _93 = int(_91);
    bool _97 = _89 >= _93;
    int _99 = 0;
    float _101 = as_type<float>(_93);
    if (_97)
    {
        _99 = 0;
    }
    int _103 = _99;
    int _105 = _103;
    int _107 = _103;
    float _109 = 0.0;
    if (!_97)
    {
        int _111 = _89 << 4;
        int _113 = _111 + 12;
        uint _116 = uint(int(uint(_113) >> uint(2)));
        float _118 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_116)]);
        float _120 = trunc(_118);
        int _122 = int(_120);
        bool _124 = _122 >= 1;
        int _126 = _124 ? (-1) : 0;
        _101 = as_type<float>(_113);
        _109 = as_type<float>(_122);
        if (!_124)
        {
            _105 = 0;
        }
        int _128 = _105;
        bool _130 = !_124;
        _107 = _128;
        if (!_130)
        {
            float _132 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
            uint _134 = uint(int(uint(_113) >> uint(2)));
            float _136 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_134)]);
            float _138 = float(_122);
            float _140 = -_136;
            float _142 = _132 + _140;
            bool _144 = _142 > _138;
            int _146 = as_type<int>(_132);
            _101 = _136;
            _109 = _138;
            if (!_144)
            {
                bool _148 = _132 >= _136;
                bool _150 = isnan(_132);
                bool _152 = _148 || _150;
                bool _154 = isnan(_136);
                bool _156 = _152 || _154;
                _126 = _156 ? (-1) : 0;
            }
            int _158 = _126;
            if (_144)
            {
                _146 = 0;
            }
            int _160 = _146;
            _107 = _160;
            if (!_144)
            {
                int _162 = ~_158;
                int _164 = (_162 != 0) ? 0 : 1;
                _107 = _164;
            }
        }
    }
    int _166 = _107;
    float _168 = _101;
    float _170 = _109;
    int _172 = _166 & 1;
    bool _174 = _172 != 0;
    if (!_174)
    {
        return;
    }
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _178 = _89 << 4;
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    int _184 = _178 + 4;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_186)]);
    int _190 = _178 + 8;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_192)]);
    int _196 = as_type<int>(_176) & 512;
    bool _198 = _196 != 0;
    int _200 = _178 + 12;
    uint _202 = uint(int(uint(_178) >> uint(2)));
    float _204 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_202)]);
    int _206 = _178 + 4;
    uint _208 = uint(int(uint(_206) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_208)]);
    int _212 = _178 + 8;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_214)]);
    uint _218 = uint(int(uint(_178) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_218)]);
    int _222 = _178 + 4;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_224)]);
    int _228 = _178 + 8;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[int(_230)]);
    float _234 = 0.0;
    float _236 = 0.0;
    float _238 = 0.0;
    float _240 = _176;
    if (_198)
    {
        float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[32]);
        float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[33]);
        float _246 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[34]);
        _234 = _242;
        _236 = _244;
        _238 = _246;
    }
    float _248 = _234;
    float _250 = _236;
    float _252 = _238;
    float _254 = 0.0;
    float _256 = 0.0;
    float _258 = 0.0;
    if (_198)
    {
        float _260 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[36]);
        float _262 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[37]);
        float _264 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[38]);
        _254 = _260;
        _256 = _262;
        _258 = _264;
    }
    float _266 = _254;
    float _268 = _256;
    float _270 = _258;
    float _272 = as_type<float>(_166);
    float _274 = _168;
    float _276 = _170;
    if (_198)
    {
        float _278 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[40]);
        float _280 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[41]);
        float _282 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[42]);
        _272 = _278;
        _274 = _280;
        _276 = _282;
    }
    float _284 = _272;
    float _286 = _274;
    float _288 = _276;
    uint _290 = uint(int(uint(_178) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_290)]);
    uint _294 = uint(int(uint(_200) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_294)]);
    uint _298 = uint(int(uint(_200) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_298)]);
    float _302 = _268;
    float _304 = _266;
    float _306 = _270;
    float _308 = _250;
    float _310 = _248;
    float _312 = _252;
    float _314 = _286;
    float _316 = _284;
    float _318 = _288;
    float _320 = _204;
    float _322 = _210;
    float _324 = _216;
    int _326 = as_type<int>(_220);
    int _328 = as_type<int>(_226);
    int _330 = as_type<int>(_232);
    int _332 = as_type<int>(_220);
    int _334 = as_type<int>(_226);
    int _336 = as_type<int>(_232);
    int _338 = as_type<int>(_220);
    int _340 = as_type<int>(_226);
    int _342 = as_type<int>(_232);
    if (!_198)
    {
        int _344 = _178 + 4;
        uint _346 = uint(int(uint(_178) >> uint(2)));
        float _348 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_346)]);
        int _350 = _178 + 8;
        uint _352 = uint(int(uint(_178) >> uint(2)));
        float _354 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_352)]);
        uint _356 = uint(int(uint(_344) >> uint(2)));
        float _358 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_356)]);
        uint _360 = uint(int(uint(_344) >> uint(2)));
        float _362 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_360)]);
        uint _364 = uint(int(uint(_350) >> uint(2)));
        float _366 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_364)]);
        uint _368 = uint(int(uint(_178) >> uint(2)));
        float _370 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_368)]);
        uint _372 = uint(int(uint(_350) >> uint(2)));
        float _374 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_372)]);
        uint _376 = uint(int(uint(_344) >> uint(2)));
        float _378 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_376)]);
        uint _380 = uint(int(uint(_350) >> uint(2)));
        float _382 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_380)]);
        float _384 = _348 * _348;
        float _386 = fma(_354, _354, _384);
        float _388 = _358 * _358;
        float _390 = fma(_362, _362, _388);
        float _392 = _366 * _366;
        float _394 = fma(_370, _370, _386);
        float _396 = fma(_374, _374, _392);
        float _398 = sqrt(_394);
        float _400 = fma(_378, _378, _390);
        float _402 = fma(_382, _382, _396);
        float _404 = sqrt(_400);
        float _406 = sqrt(_402);
        bool _408 = _398 > 0.0;
        bool _410 = _404 > 0.0;
        bool _412 = _406 > 0.0;
        float _414 = _404;
        float _416 = _406;
        float _418 = _396;
        float _420 = _348;
        float _422 = _398;
        float _424 = _354;
        float _426 = _390;
        float _428 = _358;
        float _430 = _378;
        float _432 = _370;
        if (_408)
        {
            float _434 = rsqrt(_394);
            _414 = _434;
        }
        float _436 = _414;
        float _438 = 0.0;
        if (_410)
        {
            float _440 = rsqrt(_400);
            _438 = _440;
        }
        float _442 = _438;
        float _444 = 0.0;
        if (_412)
        {
            float _446 = rsqrt(_402);
            _444 = _446;
        }
        float _448 = _444;
        if (!_408)
        {
            _416 = 0.0;
        }
        float _450 = _416;
        float _452 = _450;
        if (_408)
        {
            float _454 = _348 * _436;
            _452 = _454;
        }
        float _456 = _452;
        _304 = _456;
        if (!_408)
        {
            _418 = 0.0;
        }
        float _458 = _418;
        float _460 = _458;
        if (_408)
        {
            float _462 = _354 * _436;
            _460 = _462;
        }
        float _464 = _460;
        _310 = _464;
        if (!_408)
        {
            _420 = 0.0;
        }
        float _466 = _420;
        float _468 = _466;
        if (_408)
        {
            float _470 = _370 * _436;
            _468 = _470;
        }
        float _472 = _468;
        _316 = _472;
        if (!_410)
        {
            _422 = 0.0;
        }
        float _474 = _422;
        float _476 = _474;
        if (_410)
        {
            float _478 = _358 * _442;
            _476 = _478;
        }
        float _480 = _476;
        _302 = _480;
        if (!_410)
        {
            _424 = 0.0;
        }
        float _482 = _424;
        float _484 = _482;
        if (_410)
        {
            float _486 = _378 * _442;
            _484 = _486;
        }
        float _488 = _484;
        _314 = _488;
        if (!_410)
        {
            _426 = 0.0;
        }
        float _490 = _426;
        float _492 = _490;
        if (_410)
        {
            float _494 = _362 * _442;
            _492 = _494;
        }
        float _496 = _492;
        _308 = _496;
        if (!_412)
        {
            _428 = 0.0;
        }
        float _498 = _428;
        float _500 = _498;
        if (!_412)
        {
            _430 = 0.0;
        }
        float _502 = _430;
        float _504 = _502;
        if (_412)
        {
            float _506 = _366 * _448;
            _500 = _506;
        }
        float _508 = _500;
        _306 = _508;
        if (!_412)
        {
            _432 = 0.0;
        }
        float _510 = _432;
        _318 = _510;
        if (_412)
        {
            float _512 = _374 * _448;
            _504 = _512;
        }
        float _514 = _504;
        _312 = _514;
        if (_412)
        {
            float _516 = _382 * _448;
            _318 = _516;
        }
    }
    float _518 = _302;
    float _520 = _304;
    float _522 = _306;
    float _524 = _308;
    float _526 = _310;
    float _528 = _312;
    float _530 = _314;
    float _532 = _316;
    float _534 = _318;
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[68]);
    float _538 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[86]);
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[85]);
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[84]);
    float _544 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _546 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
    float _550 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
    float _552 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
    float _554 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
    float _556 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[128]);
    float _558 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[129]);
    float _560 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[130]);
    float _562 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[131]);
    uint _564 = uint(int(uint(_200) >> uint(2)));
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_564)]);
    bool _568 = _538 > 0.0;
    float _570 = abs(_536);
    float _572 = log2(_570);
    bool _574 = _540 > 0.0;
    float _576 = 0.0;
    float _578 = _542;
    float _580 = _538;
    float _582 = _548;
    bool _584 = _574;
    float _586 = _546;
    float _588 = _556;
    float _590 = _558;
    float _592 = _560;
    float _594 = _562;
    if (_568)
    {
        float _596 = 1.0 / _538;
        _576 = _596;
    }
    float _598 = _576;
    float _600 = _542 * _540;
    float _602 = -_300;
    float _604 = _544 + _602;
    float _606 = _546 * _572;
    float _608 = _604;
    if (_574)
    {
        float _610 = -_600;
        float _612 = fma(_292, _610, _542);
        _578 = _612;
    }
    float _614 = _578;
    float _616 = _550 * _554;
    float _618 = _548 * _554;
    float _620 = exp2(_606);
    float _622 = _616 * _518;
    float _624 = _614;
    if (_568)
    {
        float _626 = _604 * _598;
        _580 = _626;
    }
    float _628 = _580;
    float _630 = _616 * _520;
    float _632 = _616 * _522;
    float _634 = _552 * _554;
    float _636 = fma(_618, _524, _622);
    float _638 = _636;
    if (_568)
    {
        float _640 = precise::min(_628, 1.0);
        _582 = _640;
    }
    float _642 = _582;
    float _644 = fma(_618, _526, _630);
    float _646 = fma(_618, _528, _632);
    float _648 = fma(_634, _530, _636);
    float _650 = fma(_634, _532, _644);
    if (_568)
    {
        float _652 = _642 * _614;
        _624 = _652;
    }
    float _654 = _624;
    float _656 = fma(_634, _534, _646);
    float _658 = _546 * _648;
    float _660 = _546 * _650;
    float _662 = _546 * _654;
    float _664 = _296 * _546;
    float _666 = _546 * _656;
    float _668 = fma(_204, _620, _660);
    float _670 = fma(_210, _620, _658);
    float _672 = _556 * _662;
    float _674 = _558 * _662;
    float _676 = fma(_204, _664, _182);
    float _678 = fma(_210, _664, _188);
    float _680 = fma(_216, _664, _194);
    float _682 = fma(_216, _620, _666);
    float _684 = _560 * _662;
    bool _686 = !_198;
    float _688 = _666;
    float _690 = _664;
    float _692 = _672;
    float _694 = _684;
    int _696 = as_type<int>(_566);
    float _698 = _670;
    float _820;
    float _822;
    if (!_686)
    {
        float _700 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _702 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _704 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _706 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _708 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _710 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _712 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _714 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _716 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _718 = _704 * _706;
        float _720 = _704 * _708;
        float _722 = _702 * _706;
        float _724 = -_718;
        float _726 = fma(_700, _710, _724);
        float _728 = -_720;
        float _730 = fma(_702, _710, _728);
        float _732 = -_722;
        float _734 = fma(_700, _708, _732);
        float _736 = _714 * _700;
        float _738 = _714 * _726;
        float _740 = _716 * _702;
        float _742 = _712 * _708;
        float _744 = -_736;
        float _746 = fma(_712, _702, _744);
        float _748 = -_738;
        float _750 = fma(_712, _730, _748);
        float _752 = _714 * _710;
        float _754 = _716 * _706;
        float _756 = _712 * _704;
        float _758 = fma(_716, _734, _750);
        float _760 = -_752;
        float _762 = fma(_716, _708, _760);
        float _764 = -_754;
        float _766 = fma(_712, _710, _764);
        float _768 = -_742;
        float _770 = fma(_714, _706, _768);
        float _772 = -_756;
        float _774 = fma(_716, _700, _772);
        float _776 = -_700;
        float _778 = fma(_776, _710, _718);
        float _780 = 1.0 / _758;
        float _782 = -_740;
        float _784 = fma(_714, _704, _782);
        float _786 = _762 * _780;
        float _788 = _766 * _780;
        float _790 = _770 * _780;
        float _792 = _672 * _780;
        float _794 = _674 * _786;
        float _796 = _674 * _788;
        float _798 = _778 * _780;
        float _800 = _674 * _790;
        float _802 = _784 * _780;
        float _804 = _774 * _780;
        float _806 = fma(_730, _792, _794);
        float _808 = fma(_672, _798, _796);
        float _810 = _746 * _780;
        float _812 = fma(_734, _792, _800);
        float _814 = fma(_684, _802, _806);
        float _816 = fma(_684, _804, _808);
        float _818 = fma(_684, _810, _812);
        _586 = _712;
        _240 = _714;
        _638 = _716;
        _820 = _780;
        _588 = _792;
        _590 = _708;
        _592 = _710;
        _594 = _718;
        _320 = _804;
        _322 = _808;
        _324 = _806;
        _690 = _812;
        _822 = _816;
        _692 = _814;
        _694 = _818;
        _824 = true;
    }
    else
    {
        int _826 = as_type<int>(_176) & 1024;
        bool _828 = _826 != 0;
        if (_828)
        {
            _584 = true;
        }
        bool _830 = _584;
        bool _832 = _830;
        if (!_828)
        {
            int _834 = as_type<int>(_176) & 2048;
            bool _836 = _834 != 0;
            _832 = _836;
        }
        bool _838 = _832;
        if (!_838)
        {
            _688 = _674;
        }
        float _840 = _688;
        bool _842 = !_838;
        _820 = 0.0;
        _822 = _840;
        if (!_842)
        {
            uint _844 = uint(int(uint(_178) >> uint(2)));
            float _846 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_844)]);
            int _848 = _178 + 4;
            uint _850 = uint(int(uint(_848) >> uint(2)));
            float _852 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_850)]);
            int _854 = _178 + 8;
            uint _856 = uint(int(uint(_854) >> uint(2)));
            float _858 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_856)]);
            uint _860 = uint(int(uint(_178) >> uint(2)));
            float _862 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_860)]);
            int _864 = _178 + 4;
            uint _866 = uint(int(uint(_864) >> uint(2)));
            float _868 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_866)]);
            int _870 = _178 + 8;
            uint _872 = uint(int(uint(_870) >> uint(2)));
            float _874 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_872)]);
            uint _876 = uint(int(uint(_178) >> uint(2)));
            float _878 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_876)]);
            int _880 = _178 + 4;
            uint _882 = uint(int(uint(_880) >> uint(2)));
            float _884 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_882)]);
            int _886 = _178 + 8;
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
            float _930 = _878 * _858;
            float _932 = fma(_890, _908, _924);
            float _934 = -_926;
            float _936 = fma(_890, _868, _934);
            float _938 = -_928;
            float _940 = fma(_878, _874, _938);
            float _942 = -_916;
            float _944 = fma(_884, _862, _942);
            float _946 = -_930;
            float _948 = fma(_890, _846, _946);
            float _950 = -_846;
            float _952 = fma(_950, _874, _892);
            float _954 = 1.0 / _932;
            float _956 = -_914;
            float _958 = fma(_884, _858, _956);
            float _960 = _936 * _954;
            float _962 = _940 * _954;
            float _964 = _944 * _954;
            float _966 = _672 * _954;
            float _968 = _674 * _960;
            float _970 = _674 * _962;
            float _972 = _952 * _954;
            float _974 = _674 * _964;
            float _976 = _958 * _954;
            float _978 = _948 * _954;
            float _980 = fma(_904, _966, _968);
            float _982 = fma(_672, _972, _970);
            float _984 = _920 * _954;
            float _986 = fma(_908, _966, _974);
            float _988 = fma(_684, _976, _980);
            float _990 = fma(_684, _978, _982);
            float _992 = fma(_684, _984, _986);
            _586 = _878;
            _240 = _884;
            _638 = _890;
            _820 = _954;
            _588 = _966;
            _590 = _868;
            _592 = _874;
            _594 = _892;
            _320 = _978;
            _322 = _982;
            _324 = _980;
            _690 = _986;
            _822 = _990;
            _692 = _988;
            _694 = _992;
        }
    }
    _824 = false;
    float _994 = _586;
    float _996 = _240;
    float _998 = _638;
    float _1000 = _820;
    float _1002 = _588;
    float _1004 = _590;
    float _1006 = _592;
    float _1008 = _594;
    float _1010 = _320;
    float _1012 = _322;
    float _1014 = _324;
    float _1016 = _690;
    float _1018 = _822;
    float _1020 = _692;
    float _1022 = _694;
    uint _1024 = uint(int(uint(_200) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1024)] = as_type<uint>(_566);
    float _1026 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[30]);
    int _1028 = as_type<int>(_1026) & 512;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>(_1026) & 1024;
    bool _1034 = _1032 != 0;
    float _1036 = _994;
    float _1038 = _996;
    float _1040 = _998;
    float _1042 = _1000;
    float _1044 = _1022;
    float _1046 = _1020;
    if (_1030)
    {
        float _1048 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1050 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1054 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1036 = _1048;
        _1038 = _1050;
        _1040 = _1052;
        _1042 = _1054;
    }
    float _1056 = _1036;
    float _1058 = _1038;
    float _1060 = _1040;
    float _1062 = _1042;
    float _1064 = _1002;
    float _1066 = _1004;
    float _1068 = _1006;
    float _1070 = _1008;
    if (_1030)
    {
        float _1072 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1076 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1078 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1064 = _1072;
        _1066 = _1074;
        _1068 = _1076;
        _1070 = _1078;
    }
    float _1080 = _1064;
    float _1082 = _1066;
    float _1084 = _1068;
    float _1086 = _1070;
    float _1088 = _1010;
    float _1090 = _1012;
    float _1092 = _1014;
    float _1094 = _1016;
    if (_1030)
    {
        float _1096 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1098 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1088 = _1096;
        _1090 = _1098;
        _1092 = _1100;
        _1094 = _1102;
    }
    float _1104 = _1088;
    float _1106 = _1090;
    float _1108 = _1092;
    float _1110 = _1094;
    float _1112 = _678 + _1018;
    float _1114 = _676 + _1020;
    float _1116 = _680 + _1022;
    float _1118 = _1112;
    if (!_1030)
    {
        _1044 = 0.0;
    }
    float _1120 = _1044;
    int _1122 = as_type<int>(_1026) & 2048;
    bool _1124 = _1122 != 0;
    float _1126 = _1058;
    float _1128 = _1056;
    float _1130 = _1060;
    float _1132 = _1120;
    if (_1030)
    {
        float _1134 = _1112 * _1058;
        _1126 = _1134;
    }
    float _1136 = _1126;
    float _1138 = _1082;
    float _1140 = _1136;
    float _1142 = _1104;
    float _1144 = _1084;
    float _1146 = _1080;
    float _1148 = _1108;
    float _1150 = _1110;
    if (_1030)
    {
        float _1152 = _1112 * _1082;
        _1138 = _1152;
    }
    float _1154 = _1138;
    if (_1030)
    {
        float _1156 = fma(_1114, _1056, _1136);
        _1140 = _1156;
    }
    float _1158 = _1140;
    if (_1030)
    {
        float _1160 = _1112 * _1106;
        _1046 = _1160;
    }
    float _1162 = _1046;
    if (_1030)
    {
        float _1164 = fma(_1114, _1080, _1154);
        _1128 = _1164;
    }
    float _1166 = _1128;
    if (_1030)
    {
        float _1168 = fma(_1114, _1104, _1162);
        _1142 = _1168;
    }
    float _1170 = _1142;
    float _1172 = _1170;
    if (_1030)
    {
        float _1174 = fma(_1116, _1084, _1166);
        _1144 = _1174;
    }
    float _1176 = _1144;
    if (_1030)
    {
        float _1178 = fma(_1116, _1108, _1170);
        _1146 = _1178;
    }
    float _1180 = _1146;
    if (!_1030)
    {
        _1172 = 0.0;
    }
    float _1182 = _1172;
    float _1184 = _1182;
    if (_1030)
    {
        float _1186 = _1086 + _1176;
        _1184 = _1186;
    }
    float _1188 = _1184;
    if (_1030)
    {
        float _1190 = fma(_1116, _1060, _1158);
        _1130 = _1190;
    }
    float _1192 = _1130;
    if (!_1030)
    {
        _1148 = 0.0;
    }
    float _1194 = _1148;
    float _1196 = _1194;
    if (_1030)
    {
        float _1198 = _1110 + _1180;
        _1132 = _1198;
    }
    float _1200 = _1132;
    float _1202 = _1200;
    if (_1030)
    {
        float _1204 = _1062 + _1192;
        _1196 = _1204;
    }
    float _1206 = _1196;
    float _1208 = _1206;
    if (!_1034)
    {
        _1150 = _1188;
    }
    float _1210 = _1150;
    bool _1212 = !_1034;
    float _1214 = _1210;
    if (!_1212)
    {
        float _1216 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1218 = uint(int(uint(_178) >> uint(2)));
        float _1220 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1218)]);
        int _1222 = _178 + 4;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        float _1226 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1224)]);
        int _1228 = _178 + 8;
        uint _1230 = uint(int(uint(_1228) >> uint(2)));
        float _1232 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1230)]);
        uint _1234 = uint(int(uint(_178) >> uint(2)));
        float _1236 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1234)]);
        int _1238 = _178 + 4;
        uint _1240 = uint(int(uint(_1238) >> uint(2)));
        float _1242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1240)]);
        int _1244 = _178 + 8;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        float _1248 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1246)]);
        uint _1250 = uint(int(uint(_178) >> uint(2)));
        float _1252 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1250)]);
        int _1254 = _178 + 4;
        uint _1256 = uint(int(uint(_1254) >> uint(2)));
        float _1258 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1256)]);
        int _1260 = _178 + 8;
        uint _1262 = uint(int(uint(_1260) >> uint(2)));
        float _1264 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1262)]);
        float _1266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1268 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1270 = _1112 * _1226;
        float _1272 = _1112 * _1242;
        float _1274 = _1112 * _1258;
        float _1276 = fma(_1114, _1220, _1270);
        float _1278 = fma(_1114, _1236, _1272);
        float _1280 = fma(_1114, _1252, _1274);
        float _1282 = fma(_1116, _1232, _1276);
        float _1284 = fma(_1116, _1248, _1278);
        float _1286 = fma(_1116, _1264, _1280);
        float _1288 = _1216 + _1282;
        float _1290 = _1266 + _1284;
        float _1292 = _1268 + _1286;
        _1208 = _1290;
        _1214 = _1292;
        _1202 = _1288;
    }
    float _1294 = _1208;
    float _1296 = _1214;
    float _1298 = _1202;
    bool _1300 = !_1124;
    float _1302 = _1294;
    float _1304 = _1298;
    float _1306 = _1296;
    if (!_1300)
    {
        uint _1308 = uint(int(uint(_178) >> uint(2)));
        float _1310 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1308)]);
        int _1312 = _178 + 4;
        uint _1314 = uint(int(uint(_1312) >> uint(2)));
        float _1316 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1314)]);
        int _1318 = _178 + 8;
        uint _1320 = uint(int(uint(_1318) >> uint(2)));
        float _1322 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1320)]);
        int _1324 = _178 + 12;
        uint _1326 = uint(int(uint(_1324) >> uint(2)));
        float _1328 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_1326)]);
        uint _1330 = uint(int(uint(_178) >> uint(2)));
        float _1332 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1330)]);
        int _1334 = _178 + 4;
        uint _1336 = uint(int(uint(_1334) >> uint(2)));
        float _1338 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1336)]);
        int _1340 = _178 + 8;
        uint _1342 = uint(int(uint(_1340) >> uint(2)));
        float _1344 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1342)]);
        int _1346 = _178 + 12;
        uint _1348 = uint(int(uint(_1346) >> uint(2)));
        float _1350 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[int(_1348)]);
        uint _1352 = uint(int(uint(_178) >> uint(2)));
        float _1354 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1352)]);
        int _1356 = _178 + 4;
        uint _1358 = uint(int(uint(_1356) >> uint(2)));
        float _1360 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1358)]);
        int _1362 = _178 + 8;
        uint _1364 = uint(int(uint(_1362) >> uint(2)));
        float _1366 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1364)]);
        int _1368 = _178 + 12;
        uint _1370 = uint(int(uint(_1368) >> uint(2)));
        float _1372 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1370)]);
        float _1374 = _1112 * _1316;
        float _1376 = _1112 * _1338;
        float _1378 = fma(_1114, _1310, _1374);
        float _1380 = _1112 * _1360;
        float _1382 = fma(_1114, _1332, _1376);
        float _1384 = fma(_1114, _1354, _1380);
        float _1386 = fma(_1116, _1322, _1378);
        float _1388 = fma(_1116, _1344, _1382);
        float _1390 = fma(_1116, _1366, _1384);
        float _1392 = _1386 + _1328;
        float _1394 = _1388 + _1350;
        float _1396 = _1390 + _1372;
        _1302 = _1394;
        _1304 = _1392;
        _1306 = _1396;
    }
    float _1398 = _1302;
    float _1400 = _1304;
    float _1402 = _1306;
    float _1404 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[70]);
    float _1406 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[8]);
    float _1408 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[9]);
    float _1410 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[10]);
    float _1412 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[11]);
    float _1414 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1416 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1418 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1420 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1422 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1424 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1426 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1428 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1430 = _1404 + 1.0;
    float _1432 = _1430 + _1398;
    float _1434 = _1432 * _1416;
    float _1436 = fma(_1414, _1400, _1434);
    float _1438 = fma(_1418, _1402, _1436);
    float _1440 = _1420 + _1438;
    float _1442 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1444 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1446 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1448 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1450 = trunc(_1440);
    int _1452 = int(_1450);
    int _1454 = ~as_type<int>(_1422);
    int _1456 = _1452 + _1454;
    int _1458 = _1456 + 1;
    bool _1460 = _1458 >= 0;
    int _1462 = 0;
    if (_1460)
    {
        float _1464 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1462 = as_type<int>(_1464);
    }
    int _1466 = _1462;
    float _1468 = fma(_1400, 6.2500002968590706586837768554688e-05, 0.5);
    float _1470 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4728 = float2(_1468, _1470);
    float _1472 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4728, float2(0.0), isnan(_4728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4728, float2(0.0), isnan(_4728)), level(0.0)).x;
    float _1474 = _1408 * _1398;
    float _1476 = fma(_1406, _1400, _1474);
    float _1478 = fma(_1410, _1402, _1476);
    float _1480 = _1412 + _1478;
    float _1482 = -_1480;
    bool _1484 = _1424 >= _1482;
    bool _1486 = isnan(_1424);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(_1482);
    bool _1492 = _1488 || _1490;
    float _1494 = -_1480;
    bool _1496 = _1426 >= _1494;
    bool _1498 = isnan(_1426);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan(_1494);
    bool _1504 = _1500 || _1502;
    int _1506 = _1492 ? 0 : 1;
    int _1508 = 2;
    float _1510 = 6.2500002968590706586837768554688e-05;
    if (_1492)
    {
        _1508 = 1;
    }
    int _1512 = _1508;
    int _1514 = _1512;
    if (_1504)
    {
        _1514 = _1506;
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
    int _1546 = _1518 + 64;
    uint _1548 = uint(int(uint(_1544) >> uint(2)));
    float _1550 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1548)]);
    int _1552 = _1544 + 4;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    float _1556 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1554)]);
    int _1558 = _1544 + 8;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    float _1562 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1560)]);
    int _1564 = _1544 + 12;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    float _1568 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1566)]);
    uint _1570 = uint(int(uint(_1546) >> uint(2)));
    float _1572 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1570)]);
    int _1574 = _1546 + 4;
    uint _1576 = uint(int(uint(_1574) >> uint(2)));
    float _1578 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1576)]);
    int _1580 = _1546 + 8;
    uint _1582 = uint(int(uint(_1580) >> uint(2)));
    float _1584 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1582)]);
    int _1586 = _1546 + 12;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    float _1590 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1588)]);
    float _1592 = _1432 * _1444;
    float _1594 = fma(_1442, _1400, _1592);
    float _1596 = fma(_1446, _1402, _1594);
    float _1598 = _1448 + _1596;
    float _1600 = trunc(_1598);
    int _1602 = int(_1600);
    bool _1604 = _1466 <= _1458;
    bool _1606 = !_1460;
    bool _1608 = _1604 || _1606;
    int _1610 = ~as_type<int>(_1428);
    int _1612 = _1602 + _1610;
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
    int _1644 = as_type<int>(_1428);
    if (!_1618)
    {
        float _1646 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1644 = as_type<int>(_1646);
    }
    int _1648 = _1644;
    float _1650 = _1432 * _1530;
    float _1652 = fma(_1524, _1400, _1650);
    float _1654 = fma(_1536, _1402, _1652);
    float _1656 = _1542 + _1654;
    float _1658 = _1432 * _1556;
    float _1660 = 1.0 / _1656;
    float _1662 = fma(_1550, _1400, _1658);
    float _1664 = _1432 * _1578;
    float _1666 = fma(_1562, _1402, _1662);
    float _1668 = fma(_1572, _1400, _1664);
    float _1670 = _1568 + _1666;
    float _1672 = fma(_1584, _1402, _1668);
    float _1674 = _1670 * _1660;
    float _1676 = _1590 + _1672;
    bool _1678 = _1674 >= 0.0;
    float _1680 = _1676 * _1660;
    bool _1682 = _1674 <= 1.0;
    bool _1684 = _1682 && _1678;
    bool _1686 = _1680 >= 0.0;
    bool _1688 = _1686 && _1684;
    bool _1690 = _1680 <= 1.0;
    bool _1692 = _1690 && _1688;
    float _1694 = _1524;
    float _1696 = _1590;
    float _1698 = _1668;
    float _1700 = _1572;
    float _1702 = _1662;
    float _1704 = _1666;
    float _1706 = _1568;
    if (_1692)
    {
        float _1708 = float(_1516);
        _1694 = _1708;
    }
    float _1710 = _1694;
    float _1712 = _1432 * _1630;
    bool _1714 = _1648 <= _1614;
    bool _1716 = _1714 || _1618;
    float _1718 = fma(_1624, _1400, _1712);
    bool _1720 = _604 > 0.001000000047497451305389404296875;
    bool _1722 = isnan(_604);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(0.001000000047497451305389404296875);
    bool _1728 = _1724 || _1726;
    float _1730 = fma(_1636, _1402, _1718);
    float _1732 = _1642 + _1730;
    float _1734 = _1624;
    float _1736 = _1730;
    float _1738 = _1642;
    if (_1716)
    {
        _608 = 1.0;
    }
    float _1740 = _608;
    float _1742 = _1740;
    if (!_1716)
    {
        float _1744 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1746 = _1614 * as_type<int>(_1744);
        int _1748 = _1746 + _1458;
        int _1750 = _1748 << 2;
        uint _1752 = uint(int(uint(_1748) >> uint(2)));
        int _1754 = 12 & _1750;
        int _1756 = int(_1752) << 4;
        int _1758 = _1756 + _1754;
        int _1760 = _1758 + 400;
        uint _1762 = uint(int(uint(_1760) >> uint(2)));
        float _1764 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1762)]);
        float _1766 = floor(_1598);
        float _1768 = floor(_1440);
        float _1770 = -_1766;
        float _1772 = _1598 + _1770;
        float _1774 = -_1768;
        float _1776 = _1440 + _1774;
        float _1778 = rint(_1764);
        float _1780 = precise::max(_1778, 0.0);
        uint _1782 = uint(_1780);
        uint _1784 = clamp(_1782, 0u, 65535u);
        float3 _5197 = float3(_1776, _1772, float(int(_1784)));
        float3 _5201 = select(_5197, float3(0.0), isnan(_5197));
        float _1786 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _5201.xy, uint(rint(_5201.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _5201.xy, uint(rint(_5201.z)), level(0.0)).x;
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
        float _1814 = _1432 * _1800;
        float _1816 = fma(_1794, _1400, _1814);
        float _1818 = fma(_1806, _1402, _1816);
        float _1820 = _1812 + _1818;
        float _1822 = precise::clamp(_1820, 0.0, 1.0);
        float _1824 = -_1822;
        float _1826 = _1824 + _1786;
        float _1828 = fma(_1826, 500.0, 1.5);
        float _1830 = exp2(_1828);
        float _1832 = 0.0 + _1830;
        float _1834 = precise::clamp(_1832, 0.0, 1.0);
        _1696 = _1776;
        _1698 = _1786;
        _1734 = _1794;
        _1736 = _1830;
        _1738 = _1812;
        _1700 = _1764;
        _1742 = _1834;
    }
    float _1836 = _1696;
    float _1838 = _1698;
    float _1840 = _1734;
    float _1842 = _1736;
    float _1844 = _1738;
    float _1846 = _1700;
    float _1848 = _1742;
    float _1850 = _1710;
    float _1852 = _1840;
    float _1854 = _1836;
    float _1856 = _1846;
    if (_1692)
    {
        float _1858 = rint(_1710);
        float _1860 = precise::max(_1858, 0.0);
        uint _1862 = uint(_1860);
        uint _1864 = clamp(_1862, 0u, 65535u);
        _1850 = as_type<float>(_1864);
    }
    float _1866 = _1850;
    float _1868 = _1732 * _1660;
    bool _1870 = _1472 != 0.0;
    bool _1872 = isnan(_1472);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(0.0);
    bool _1878 = _1874 || _1876;
    uint _1880 = uint(int(uint(_178) >> uint(2)));
    float _1882 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1880)]);
    bool _1884 = _1878;
    if (!_1728)
    {
        float _1886 = fma(_1400, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        _1852 = _1886;
    }
    float _1888 = _1852;
    float _1890 = _1680;
    if (_1692)
    {
        float3 _5351 = float3(_1674, _1680, float(as_type<int>(_1866)));
        float3 _5353 = select(_5351, float3(0.0), isnan(_5351));
        float _1892 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _5353.xy, uint(rint(_5353.z)), _1868, level(0.0));
        _1890 = _1892;
    }
    float _1894 = _1890;
    if (!_1878)
    {
        _1854 = 4.0;
    }
    float _1896 = _1854;
    float _1898 = _1896;
    if (!_1692)
    {
        _1856 = 1.0;
    }
    float _1900 = _1856;
    float _1902 = _1472;
    float _1904 = _1900;
    if (!_1878)
    {
        float2 _5379 = float2(_1468, _1470);
        float _1906 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5379, float2(0.0), isnan(_5379)), level(_1896)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5379, float2(0.0), isnan(_5379)), level(_1896)).x;
        _1902 = _1906;
    }
    float _1908 = _1902;
    float _1910 = _1838;
    if (!_1728)
    {
        float2 _5395 = float2(_1468, _1470);
        float _1912 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5395, float2(0.0), isnan(_5395)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5395, float2(0.0), isnan(_5395)), level(0.0)).x;
        _1910 = _1912;
    }
    float _1914 = _1910;
    float _1916 = _1550;
    if (!_1728)
    {
        float2 _5410 = float2(_1888, _1470);
        float _1918 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5410, float2(0.0), isnan(_5410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5410, float2(0.0), isnan(_5410)), level(0.0)).x;
        _1916 = _1918;
    }
    float _1920 = _1916;
    float _1922 = _1842;
    float _1924 = _1844;
    if (!_1728)
    {
        float2 _5426 = float2(_1468, _1470);
        float2 _1928 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5426, float2(0.0), isnan(_5426)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5426, float2(0.0), isnan(_5426)), level(0.0)).xy;
        float _1930 = _1928.x;
        float _1932 = _1928.y;
        _1922 = _1930;
        _1924 = _1932;
    }
    float _1934 = _1922;
    float _1936 = _1924;
    float _1938 = _1914;
    if (_1692)
    {
        bool _1940 = _1894 >= _1868;
        bool _1942 = isnan(_1894);
        bool _1944 = _1940 || _1942;
        bool _1946 = isnan(_1868);
        bool _1948 = _1944 || _1946;
        float _1950 = float(_1948);
        _1904 = _1950;
    }
    float _1952 = _1904;
    float _1954 = -_1952;
    float _1956 = fma(_1954, _1848, 1.0);
    float _1958 = -_1882;
    float _1960 = _1956 + _1958;
    float _1962 = _1956;
    if (_1728)
    {
        float _1964 = fma(_1960, 0.0500000007450580596923828125, _1882);
        _1962 = _1964;
    }
    float _1966 = _1962;
    float _1968 = precise::max(0.0, _1966);
    float _1970 = precise::min(_1968, 0.999000012874603271484375);
    uint _1972 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1972)] = as_type<uint>(_1970);
    int _1974 = as_type<int>(_1866);
    if (!_1728)
    {
        float _1976 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
        _1974 = as_type<int>(_1976);
    }
    int _1978 = _1974;
    int _1980 = _178 + 4;
    int _1982 = _1978;
    if (!_1728)
    {
        float _1984 = fma(_1908, 2000.0, as_type<float>(_1978));
        _1982 = as_type<int>(_1984);
    }
    int _1986 = _1982;
    if (!_1728)
    {
        uint _1988 = uint(int(uint(_1980) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1988)] = uint(_1986);
    }
    float _1990 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[76]);
    uint _1992 = uint(int(uint(_1980) >> uint(2)));
    float _1994 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1992)]);
    if (!_1728)
    {
        float _1996 = _1914 * 2000.0;
        _1898 = _1996;
    }
    float _1998 = _1898;
    float _2000 = fma(_1908, 2000.0, _1990);
    float _2002 = _1112 + _1994;
    bool _2004 = _2002 >= _2000;
    bool _2006 = isnan(_2002);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(_2000);
    bool _2012 = _2008 || _2010;
    float _2014 = _2002;
    if (!_2012)
    {
        float _2016 = -_1994;
        float _2018 = _2000 + _2016;
        _2014 = _2018;
    }
    float _2020 = _2014;
    int _2022 = as_type<int>(_2020);
    if (!_2012)
    {
        float _2024 = fma(_2020, 0.00999999977648258209228515625, _1994);
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    if (!_2012)
    {
        uint _2028 = uint(int(uint(_1980) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_2028)] = uint(_2026);
    }
    if (!_1728)
    {
        float _2030 = fma(_1400, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float _2032 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.500062525272369384765625);
        float2 _5620 = float2(_2030, _1470);
        float _2034 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5620, float2(0.0), isnan(_5620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5620, float2(0.0), isnan(_5620)), level(0.0)).x;
        float2 _5628 = float2(_1888, _2032);
        float _2036 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5628, float2(0.0), isnan(_5628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5628, float2(0.0), isnan(_5628)), level(0.0)).x;
        float2 _5636 = float2(_2030, _2032);
        float _2038 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5636, float2(0.0), isnan(_5636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5636, float2(0.0), isnan(_5636)), level(0.0)).x;
        bool _2040 = _1920 != 0.0;
        bool _2042 = isnan(_1920);
        bool _2044 = _2040 || _2042;
        bool _2046 = isnan(0.0);
        bool _2048 = _2044 || _2046;
        float _2050 = fma(_1402, 6.2500002968590706586837768554688e-05, 0.4999375045299530029296875);
        float2 _5657 = float2(_1468, _2032);
        float _2052 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5657, float2(0.0), isnan(_5657)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5657, float2(0.0), isnan(_5657)), level(0.0)).x;
        float2 _5665 = float2(_1888, _2050);
        float _2054 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5665, float2(0.0), isnan(_5665)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5665, float2(0.0), isnan(_5665)), level(0.0)).x;
        float _2056 = _2030;
        float _2058 = _1470;
        float _2060 = _1470;
        if (_2048)
        {
            _1938 = _1920;
        }
        float _2062 = _1938;
        float2 _5681 = float2(_2030, _2050);
        float _2064 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5681, float2(0.0), isnan(_5681)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5681, float2(0.0), isnan(_5681)), level(0.0)).x;
        float2 _5689 = float2(_1468, _2050);
        float _2066 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).x;
        if (!_2048)
        {
            _1702 = 4.0;
        }
        float _2068 = _1702;
        bool _2070 = _1934 != 0.0;
        bool _2072 = isnan(_1934);
        bool _2074 = _2070 || _2072;
        bool _2076 = isnan(0.0);
        bool _2078 = _2074 || _2076;
        float _2080 = _2062;
        float _2082 = _2052;
        float _2084 = _2064;
        float _2086 = _2068;
        float _2088 = _2066;
        if (!_2048)
        {
            float2 _5721 = float2(_1888, _1470);
            float _2090 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5721, float2(0.0), isnan(_5721)), level(_2068)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5721, float2(0.0), isnan(_5721)), level(_2068)).x;
            _2080 = _2090;
        }
        float _2092 = _2080;
        bool _2094 = _2034 != 0.0;
        bool _2096 = isnan(_2034);
        bool _2098 = _2094 || _2096;
        bool _2100 = isnan(0.0);
        bool _2102 = _2098 || _2100;
        bool _2104 = _2036 != 0.0;
        bool _2106 = isnan(_2036);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan(0.0);
        bool _2112 = _2108 || _2110;
        bool _2114 = _2038 != 0.0;
        bool _2116 = isnan(_2038);
        bool _2118 = _2114 || _2116;
        bool _2120 = isnan(0.0);
        bool _2122 = _2118 || _2120;
        if (!_2102)
        {
            _1704 = 4.0;
        }
        float _2124 = _1704;
        float _2126 = _2124;
        if (!_2112)
        {
            _1706 = 4.0;
        }
        float _2128 = _1706;
        if (!_2122)
        {
            _1510 = 4.0;
        }
        float _2130 = _1510;
        float _2132 = _2034;
        if (!_2102)
        {
            float2 _5786 = float2(_2030, _1470);
            float _2134 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5786, float2(0.0), isnan(_5786)), level(_2124)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5786, float2(0.0), isnan(_5786)), level(_2124)).x;
            _2132 = _2134;
        }
        float _2136 = _2132;
        float _2138 = _2036;
        if (!_2112)
        {
            float2 _5802 = float2(_1888, _2032);
            float _2140 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5802, float2(0.0), isnan(_5802)), level(_2128)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5802, float2(0.0), isnan(_5802)), level(_2128)).x;
            _2138 = _2140;
        }
        float _2142 = _2138;
        float _2144 = _2038;
        if (!_2122)
        {
            float2 _5818 = float2(_2030, _2032);
            float _2146 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5818, float2(0.0), isnan(_5818)), level(_2130)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5818, float2(0.0), isnan(_5818)), level(_2130)).x;
            _2144 = _2146;
        }
        float _2148 = _2144;
        bool _2150 = _2052 != 0.0;
        bool _2152 = isnan(_2052);
        bool _2154 = _2150 || _2152;
        bool _2156 = isnan(0.0);
        bool _2158 = _2154 || _2156;
        bool _2160 = _2064 != 0.0;
        bool _2162 = isnan(_2064);
        bool _2164 = _2160 || _2162;
        bool _2166 = isnan(0.0);
        bool _2168 = _2164 || _2166;
        bool _2170 = _2054 != 0.0;
        bool _2172 = isnan(_2054);
        bool _2174 = _2170 || _2172;
        bool _2176 = isnan(0.0);
        bool _2178 = _2174 || _2176;
        bool _2180 = _2066 != 0.0;
        bool _2182 = isnan(_2066);
        bool _2184 = _2180 || _2182;
        bool _2186 = isnan(0.0);
        bool _2188 = _2184 || _2186;
        if (_2158)
        {
            _2056 = _2052;
        }
        float _2190 = _2056;
        if (_2168)
        {
            _2082 = _2064;
        }
        float _2192 = _2082;
        if (!_2178)
        {
            _2126 = 4.0;
        }
        float _2194 = _2126;
        if (!_2168)
        {
            _2084 = 4.0;
        }
        float _2196 = _2084;
        float _2198 = _2054;
        if (!_2178)
        {
            float2 _5898 = float2(_1888, _2050);
            float _2200 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5898, float2(0.0), isnan(_5898)), level(_2194)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5898, float2(0.0), isnan(_5898)), level(_2194)).x;
            _2198 = _2200;
        }
        float _2202 = _2198;
        if (_2188)
        {
            _2058 = _2066;
        }
        float _2204 = _2058;
        float _2206 = _2192;
        if (!_2168)
        {
            float2 _5919 = float2(_2030, _2050);
            float _2208 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5919, float2(0.0), isnan(_5919)), level(_2196)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5919, float2(0.0), isnan(_5919)), level(_2196)).x;
            _2206 = _2208;
        }
        float _2210 = _2206;
        if (!_2158)
        {
            _2086 = 4.0;
        }
        float _2212 = _2086;
        if (!_2188)
        {
            _2088 = 4.0;
        }
        float _2214 = _2088;
        float _2216 = _2190;
        if (!_2158)
        {
            float2 _5945 = float2(_1468, _2032);
            float _2218 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5945, float2(0.0), isnan(_5945)), level(_2212)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5945, float2(0.0), isnan(_5945)), level(_2212)).x;
            _2216 = _2218;
        }
        float _2220 = _2216;
        if (!_2078)
        {
            _2060 = 4.0;
        }
        float _2222 = _2060;
        float _2224 = _2204;
        if (!_2188)
        {
            float2 _5966 = float2(_1468, _2050);
            float _2226 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5966, float2(0.0), isnan(_5966)), level(_2214)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5966, float2(0.0), isnan(_5966)), level(_2214)).x;
            _2224 = _2226;
        }
        float _2228 = _2224;
        float _2230 = _1934;
        float _2232 = _1936;
        if (!_2078)
        {
            float2 _5983 = float2(_1468, _1470);
            float2 _2234 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_5983, float2(0.0), isnan(_5983)), level(_2222)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_5983, float2(0.0), isnan(_5983)), level(_2222)).xy;
            float _2236 = _2234.x;
            float _2238 = _2234.y;
            _2230 = _2236;
            _2232 = _2238;
        }
        float _2240 = _2230;
        float _2242 = _2232;
        float _2244 = -_2092;
        float _2246 = _1908 + _2244;
        float _2248 = -_2136;
        float _2250 = _1908 + _2248;
        float _2252 = -_2142;
        float _2254 = _1908 + _2252;
        float _2256 = -_2148;
        float _2258 = _1908 + _2256;
        float _2260 = abs(_2246);
        float _2262 = abs(_2250);
        float _2264 = precise::max(_2260, _2262);
        float _2266 = -_2202;
        float _2268 = _1908 + _2266;
        float _2270 = -_2210;
        float _2272 = _1908 + _2270;
        float _2274 = abs(_2268);
        float _2276 = abs(_2254);
        float _2278 = precise::max(_2274, _2276);
        float _2280 = abs(_2272);
        float _2282 = abs(_2258);
        float _2284 = precise::max(_2280, _2282);
        float _2286 = -_2220;
        float _2288 = _1908 + _2286;
        float _2290 = -_2228;
        float _2292 = _1908 + _2290;
        float _2294 = precise::max(_2278, _2284);
        float _2296 = abs(_2292);
        float _2298 = abs(_2288);
        float _2300 = precise::max(_2296, _2298);
        bool _2302 = _2294 > 0.00150000001303851604461669921875;
        float _2304 = precise::max(_2264, _2300);
        bool _2306 = _2304 > 0.00150000001303851604461669921875;
        bool _2308 = _2306 || _2302;
        bool _2310 = _2240 < _2242;
        bool _2312 = _2310 || _2308;
        bool _2314 = !_2312;
        int _2316 = _2314 ? as_type<int>(_566) : 0;
        _1884 = _2312;
        _696 = _2316;
    }
    bool _2318 = _1884;
    int _2320 = _696;
    bool _2322 = _2318;
    int _2324 = _2320;
    if (!_1728)
    {
        bool _2326 = _1398 >= _1998;
        bool _2328 = isnan(_1398);
        bool _2330 = _2326 || _2328;
        bool _2332 = isnan(_1998);
        bool _2334 = _2330 || _2332;
        _2322 = _2334;
    }
    bool _2336 = _2322;
    if (!_2012)
    {
        float _2338 = _1112 * 0.9900000095367431640625;
        _1118 = _2338;
    }
    float _2340 = _1118;
    int _2342 = _178 + 8;
    float _2344 = -_182;
    float _2346 = _2344 + _1114;
    if (!_1728)
    {
        int _2348 = _2336 ? _2320 : 0;
        _2324 = _2348;
    }
    int _2350 = _2324;
    if (!_2012)
    {
        _698 = 0.0;
    }
    float _2352 = _698;
    float _2354 = -_188;
    float _2356 = _2354 + _2340;
    float _2358 = -_194;
    float _2360 = _2358 + _1116;
    uint _2362 = uint(int(uint(_200) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2362)] = uint(_2350);
    uint _2364 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2364)] = as_type<uint>(_1114);
    uint _2366 = uint(int(uint(_1980) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2366)] = as_type<uint>(_2340);
    uint _2368 = uint(int(uint(_2342) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2368)] = as_type<uint>(_1116);
    uint _2370 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2370)] = as_type<uint>(_668);
    uint _2372 = uint(int(uint(_1980) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2372)] = as_type<uint>(_2352);
    uint _2374 = uint(int(uint(_2342) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2374)] = as_type<uint>(_682);
    uint _2376 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2376)] = as_type<uint>(_2346);
    uint _2378 = uint(int(uint(_1980) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2378)] = as_type<uint>(_2356);
    uint _2380 = uint(int(uint(_2342) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2380)] = as_type<uint>(_2360);
    float _2382 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2384 = _2356 * _2356;
    float _2386 = _2352 * _2352;
    float _2388 = fma(_2346, _2346, _2384);
    float _2390 = fma(_668, _668, _2386);
    float _2392 = fma(_2360, _2360, _2388);
    float _2394 = fma(_682, _682, _2390);
    float _2396 = sqrt(_2394);
    float _2398 = sqrt(_2392);
    bool _2400 = _2398 >= 9.9999999747524270787835121154785e-07;
    bool _2402 = isnan(_2398);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan(9.9999999747524270787835121154785e-07);
    bool _2408 = _2404 || _2406;
    if (!_2408)
    {
        bool _2410 = _544 != _300;
        bool _2412 = isnan(_544);
        bool _2414 = _2410 || _2412;
        bool _2416 = isnan(_300);
        bool _2418 = _2414 || _2416;
        _2420 = _2418;
        if (!_2420)
        {
            float _2422 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[67]);
            bool _2424 = _2422 > 0.0;
            bool _2426 = !_2424;
            if (!_2426)
            {
                float _2428 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[64]);
                float _2430 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[65]);
                float _2432 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[66]);
                float _2434 = _2430 * _518;
                float _2436 = _2430 * _520;
                float _2438 = _2430 * _522;
                float _2440 = fma(_2428, _524, _2434);
                float _2442 = fma(_2428, _526, _2436);
                float _2444 = fma(_2428, _528, _2438);
                float _2446 = fma(_2432, _530, _2440);
                float _2448 = fma(_2432, _532, _2442);
                float _2450 = fma(_2432, _534, _2444);
                float _2452 = _2446 * _2446;
                float _2454 = fma(_2448, _2448, _2452);
                float _2456 = fma(_2450, _2450, _2454);
                float _2458 = rsqrt(_2456);
                float _2460 = _2458 * 9.9999999747524270787835121154785e-07;
                float _2462 = _2448 * _2460;
                float _2464 = _2446 * _2460;
                float _2466 = _2450 * _2460;
                _338 = as_type<int>(_2462);
                _340 = as_type<int>(_2464);
                _342 = as_type<int>(_2466);
                _2420 = true;
            }
            else
            {
                bool _2468 = _2396 >= 9.9999999747524270787835121154785e-07;
                bool _2470 = isnan(_2396);
                bool _2472 = _2468 || _2470;
                bool _2474 = isnan(9.9999999747524270787835121154785e-07);
                bool _2476 = _2472 || _2474;
                if (!_2476)
                {
                    float _2478 = _2340 * _2340;
                    float _2480 = fma(_1114, _1114, _2478);
                    float _2482 = fma(_1116, _1116, _2480);
                    float _2484 = sqrt(_2482);
                    bool _2486 = _2484 >= 9.9999999747524270787835121154785e-07;
                    bool _2488 = isnan(_2484);
                    bool _2490 = _2486 || _2488;
                    bool _2492 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2494 = _2490 || _2492;
                    float _2496 = _2484;
                    if (_2494)
                    {
                        float _2498 = rsqrt(_2482);
                        _2496 = _2498;
                    }
                    float _2500 = _2496;
                    if (!_2494)
                    {
                        _326 = 0;
                    }
                    int _2502 = _326;
                    int _2504 = _2502;
                    if (!_2494)
                    {
                        _328 = 897988541;
                    }
                    int _2506 = _328;
                    int _2508 = _2506;
                    if (!_2494)
                    {
                        _330 = 0;
                    }
                    int _2510 = _330;
                    float _2512 = _2500;
                    int _2514 = _2510;
                    if (_2494)
                    {
                        float _2516 = _2500 * 9.9999999747524270787835121154785e-07;
                        _2512 = _2516;
                    }
                    float _2518 = _2512;
                    if (_2494)
                    {
                        float _2520 = _1114 * _2518;
                        _2504 = as_type<int>(_2520);
                    }
                    int _2522 = _2504;
                    _338 = _2522;
                    if (_2494)
                    {
                        float _2524 = _2340 * _2518;
                        _2508 = as_type<int>(_2524);
                    }
                    int _2526 = _2508;
                    _340 = _2526;
                    if (_2494)
                    {
                        float _2528 = _1116 * _2518;
                        _2514 = as_type<int>(_2528);
                    }
                    int _2530 = _2514;
                    _342 = _2530;
                    _2420 = true;
                }
                else
                {
                    float _2532 = rsqrt(_2394);
                    float _2534 = _2532 * 9.9999999747524270787835121154785e-07;
                    float _2536 = _668 * _2534;
                    float _2538 = _2352 * _2534;
                    float _2540 = _682 * _2534;
                    _338 = as_type<int>(_2536);
                    _340 = as_type<int>(_2538);
                    _342 = as_type<int>(_2540);
                    _2420 = true;
                }
            }
        }
    }
    else
    {
        float _2542 = _2396 * _2382;
        bool _2544 = _2542 >= 0.001000000047497451305389404296875;
        bool _2546 = isnan(_2542);
        bool _2548 = _2544 || _2546;
        bool _2550 = isnan(0.001000000047497451305389404296875);
        bool _2552 = _2548 || _2550;
        bool _2554 = _2542 > 0.0;
        bool _2556 = !_2552;
        bool _2558 = _2554 && _2556;
        bool _2560 = _2398 < 0.001000000047497451305389404296875;
        bool _2562 = _2560 && _2558;
        if (!_2562)
        {
            _332 = as_type<int>(_2346);
        }
        int _2564 = _332;
        int _2566 = _2564;
        if (_2562)
        {
            float _2568 = _668 * _2382;
            _2566 = as_type<int>(_2568);
        }
        int _2570 = _2566;
        _338 = _2570;
        if (!_2562)
        {
            _334 = as_type<int>(_2356);
        }
        int _2572 = _334;
        int _2574 = _2572;
        if (_2562)
        {
            float _2576 = _2382 * _2352;
            _2574 = as_type<int>(_2576);
        }
        int _2578 = _2574;
        _340 = _2578;
        if (!_2562)
        {
            _336 = as_type<int>(_2360);
        }
        int _2580 = _336;
        _342 = _2580;
        if (_2562)
        {
            float _2582 = _682 * _2382;
            _342 = as_type<int>(_2582);
        }
    }
    _2420 = false;
    int _2584 = _338;
    int _2586 = _340;
    int _2588 = _342;
    uint _2590 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2590)] = uint(_2584);
    uint _2592 = uint(int(uint(_1980) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2592)] = uint(_2586);
    uint _2594 = uint(int(uint(_2342) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_2594)] = uint(_2588);
}

