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
    bool _2206 = false;
    bool _540 = false;
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
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[86]);
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[68]);
    int _174 = _91 << 4;
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[85]);
    int _178 = _174 + 12;
    float _180 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    uint _184 = uint(int(uint(_178) >> uint(2)));
    float _186 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_184)]);
    float _188 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[84]);
    uint _190 = uint(int(uint(_174) >> uint(2)));
    float _192 = as_type<float>((*spvDescriptorSet0.cp_s5)._m0[int(_190)]);
    float _194 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    float _196 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
    float _198 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
    float _200 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
    float _202 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
    uint _204 = uint(int(uint(_174) >> uint(2)));
    float _206 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_204)]);
    int _208 = _174 + 4;
    uint _210 = uint(int(uint(_208) >> uint(2)));
    float _212 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_210)]);
    int _214 = _174 + 8;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_216)]);
    uint _220 = uint(int(uint(_178) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s6)._m0[int(_220)]);
    uint _224 = uint(int(uint(_174) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_224)]);
    int _228 = _174 + 4;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_230)]);
    int _234 = _174 + 8;
    uint _236 = uint(int(uint(_234) >> uint(2)));
    float _238 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_236)]);
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[128]);
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[129]);
    float _244 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[130]);
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[131]);
    uint _248 = uint(int(uint(_174) >> uint(2)));
    float _250 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_248)]);
    int _252 = _174 + 4;
    uint _254 = uint(int(uint(_252) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_254)]);
    int _258 = _174 + 8;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_260)]);
    int _264 = _174 + 12;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s8)._m0[int(_266)]);
    uint _270 = uint(int(uint(_178) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_270)]);
    bool _274 = _170 > 0.0;
    float _276 = abs(_172);
    float _278 = log2(_276);
    bool _280 = _176 > 0.0;
    float _282 = 0.0;
    float _284 = _188;
    float _286 = _196;
    float _288 = _202;
    float _290 = _198;
    float _292 = _206;
    float _294 = _212;
    float _296 = _218;
    float _298 = _240;
    float _300 = _242;
    float _302 = _244;
    float _304 = _246;
    float _306 = _194;
    if (_274)
    {
        float _308 = 1.0 / _170;
        _282 = _308;
    }
    float _310 = _282;
    float _312 = _180 * _278;
    float _314 = -_186;
    float _316 = _182 + _314;
    float _318 = _188 * _176;
    float _320 = exp2(_312);
    float _322 = _310;
    if (_274)
    {
        float _324 = _316 * _310;
        _322 = _324;
    }
    float _326 = _322;
    if (_280)
    {
        float _328 = -_318;
        float _330 = fma(_192, _328, _188);
        _284 = _330;
    }
    float _332 = _284;
    int _334 = as_type<int>(_194) & 512;
    bool _336 = _334 != 0;
    float _338 = _180 * _196;
    float _340 = _332;
    bool _342 = _336;
    if (_274)
    {
        float _344 = precise::min(_326, 1.0);
        _286 = _344;
    }
    float _346 = _286;
    float _348 = _198 * _338;
    float _350 = _346;
    if (_274)
    {
        float _352 = _346 * _332;
        _340 = _352;
    }
    float _354 = _340;
    float _356 = _200 * _338;
    float _358 = _202 * _338;
    float _360 = fma(_206, _320, _348);
    float _362 = _222 * _180;
    float _364 = _180 * _354;
    float _366 = fma(_212, _320, _356);
    float _368 = fma(_218, _320, _358);
    float _370 = fma(_206, _362, _226);
    float _372 = fma(_212, _362, _232);
    float _374 = fma(_218, _362, _238);
    float _376 = _240 * _364;
    float _378 = _242 * _364;
    float _380 = _244 * _364;
    bool _382 = !_336;
    float _384 = _268;
    float _386 = _362;
    float _388 = _320;
    float _390 = _358;
    float _392 = _364;
    float _394 = _378;
    int _396 = as_type<int>(_250);
    int _398 = as_type<int>(_256);
    int _400 = as_type<int>(_262);
    int _402 = as_type<int>(_250);
    int _404 = as_type<int>(_256);
    int _406 = as_type<int>(_262);
    int _408 = as_type<int>(_250);
    int _410 = as_type<int>(_256);
    int _412 = as_type<int>(_262);
    float _534;
    float _536;
    float _538;
    if (!_382)
    {
        float _414 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _416 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _418 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _420 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _422 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _424 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _426 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _428 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _430 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _432 = _418 * _420;
        float _434 = _418 * _422;
        float _436 = _416 * _420;
        float _438 = -_432;
        float _440 = fma(_414, _424, _438);
        float _442 = -_434;
        float _444 = fma(_416, _424, _442);
        float _446 = -_436;
        float _448 = fma(_414, _422, _446);
        float _450 = _428 * _414;
        float _452 = _428 * _440;
        float _454 = _430 * _416;
        float _456 = _426 * _422;
        float _458 = -_450;
        float _460 = fma(_426, _416, _458);
        float _462 = -_452;
        float _464 = fma(_426, _444, _462);
        float _466 = _428 * _424;
        float _468 = _430 * _420;
        float _470 = _426 * _418;
        float _472 = fma(_430, _448, _464);
        float _474 = -_466;
        float _476 = fma(_430, _422, _474);
        float _478 = -_468;
        float _480 = fma(_426, _424, _478);
        float _482 = -_456;
        float _484 = fma(_428, _420, _482);
        float _486 = 1.0 / _472;
        float _488 = -_470;
        float _490 = fma(_430, _414, _488);
        float _492 = -_414;
        float _494 = fma(_492, _424, _432);
        float _496 = -_454;
        float _498 = fma(_428, _418, _496);
        float _500 = _476 * _486;
        float _502 = _480 * _486;
        float _504 = _484 * _486;
        float _506 = _494 * _486;
        float _508 = _378 * _500;
        float _510 = _376 * _486;
        float _512 = _378 * _502;
        float _514 = _378 * _504;
        float _516 = _498 * _486;
        float _518 = fma(_444, _510, _508);
        float _520 = _490 * _486;
        float _522 = _460 * _486;
        float _524 = fma(_376, _506, _512);
        float _526 = fma(_448, _510, _514);
        float _528 = fma(_380, _516, _518);
        float _530 = fma(_380, _520, _524);
        float _532 = fma(_380, _522, _526);
        _292 = _420;
        _294 = _422;
        _296 = _424;
        _386 = _472;
        _298 = _524;
        _300 = _510;
        _302 = _526;
        _304 = _432;
        _306 = _426;
        _388 = _428;
        _350 = _430;
        _390 = _512;
        _534 = _530;
        _536 = _528;
        _538 = _532;
        _392 = _448;
        _540 = true;
    }
    else
    {
        int _542 = as_type<int>(_194) & 1024;
        bool _544 = _542 != 0;
        if (_544)
        {
            _342 = true;
        }
        bool _546 = _342;
        bool _548 = _546;
        if (!_544)
        {
            int _550 = as_type<int>(_194) & 2048;
            bool _552 = _550 != 0;
            _548 = _552;
        }
        bool _554 = _548;
        if (!_554)
        {
            _288 = _376;
        }
        float _556 = _288;
        _536 = _556;
        if (!_554)
        {
            _384 = _378;
        }
        float _558 = _384;
        _534 = _558;
        if (!_554)
        {
            _290 = _380;
        }
        float _560 = _290;
        bool _562 = !_554;
        _538 = _560;
        if (!_562)
        {
            uint _564 = uint(int(uint(_174) >> uint(2)));
            float _566 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_564)]);
            int _568 = _174 + 4;
            uint _570 = uint(int(uint(_568) >> uint(2)));
            float _572 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_570)]);
            int _574 = _174 + 8;
            uint _576 = uint(int(uint(_574) >> uint(2)));
            float _578 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_576)]);
            uint _580 = uint(int(uint(_174) >> uint(2)));
            float _582 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_580)]);
            int _584 = _174 + 4;
            uint _586 = uint(int(uint(_584) >> uint(2)));
            float _588 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_586)]);
            int _590 = _174 + 8;
            uint _592 = uint(int(uint(_590) >> uint(2)));
            float _594 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_592)]);
            uint _596 = uint(int(uint(_174) >> uint(2)));
            float _598 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_596)]);
            int _600 = _174 + 4;
            uint _602 = uint(int(uint(_600) >> uint(2)));
            float _604 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_602)]);
            int _606 = _174 + 8;
            uint _608 = uint(int(uint(_606) >> uint(2)));
            float _610 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_608)]);
            float _612 = _578 * _582;
            float _614 = _578 * _588;
            float _616 = _572 * _582;
            float _618 = -_612;
            float _620 = fma(_566, _594, _618);
            float _622 = -_614;
            float _624 = fma(_572, _594, _622);
            float _626 = -_616;
            float _628 = fma(_566, _588, _626);
            float _630 = _604 * _566;
            float _632 = _604 * _620;
            float _634 = _610 * _572;
            float _636 = _598 * _588;
            float _638 = -_630;
            float _640 = fma(_598, _572, _638);
            float _642 = -_632;
            float _644 = fma(_598, _624, _642);
            float _646 = _604 * _594;
            float _648 = _610 * _582;
            float _650 = _598 * _578;
            float _652 = fma(_610, _628, _644);
            float _654 = -_646;
            float _656 = fma(_610, _588, _654);
            float _658 = -_648;
            float _660 = fma(_598, _594, _658);
            float _662 = -_636;
            float _664 = fma(_604, _582, _662);
            float _666 = 1.0 / _652;
            float _668 = -_650;
            float _670 = fma(_610, _566, _668);
            float _672 = -_566;
            float _674 = fma(_672, _594, _612);
            float _676 = -_634;
            float _678 = fma(_604, _578, _676);
            float _680 = _656 * _666;
            float _682 = _660 * _666;
            float _684 = _664 * _666;
            float _686 = _674 * _666;
            float _688 = _378 * _680;
            float _690 = _376 * _666;
            float _692 = _378 * _682;
            float _694 = _378 * _684;
            float _696 = _678 * _666;
            float _698 = fma(_624, _690, _688);
            float _700 = _670 * _666;
            float _702 = _640 * _666;
            float _704 = fma(_376, _686, _692);
            float _706 = fma(_628, _690, _694);
            float _708 = fma(_380, _696, _698);
            float _710 = fma(_380, _700, _704);
            float _712 = fma(_380, _702, _706);
            _292 = _582;
            _294 = _588;
            _296 = _594;
            _386 = _652;
            _298 = _704;
            _300 = _690;
            _302 = _706;
            _304 = _612;
            _306 = _598;
            _388 = _604;
            _350 = _610;
            _390 = _692;
            _534 = _710;
            _536 = _708;
            _538 = _712;
            _392 = _628;
        }
    }
    _540 = false;
    float _714 = _292;
    float _716 = _294;
    float _718 = _296;
    float _720 = _386;
    float _722 = _298;
    float _724 = _300;
    float _726 = _302;
    float _728 = _304;
    float _730 = _306;
    float _732 = _388;
    float _734 = _350;
    float _736 = _390;
    float _738 = _534;
    float _740 = _536;
    float _742 = _538;
    float _744 = _392;
    uint _746 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_746)] = as_type<uint>(_272);
    float _748 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _750 = as_type<int>(_748) & 512;
    bool _752 = _750 != 0;
    int _754 = as_type<int>(_748) & 1024;
    bool _756 = _754 != 0;
    float _758 = _714;
    float _760 = _716;
    float _762 = _718;
    float _764 = _720;
    float _766 = _744;
    float _768 = _740;
    if (_752)
    {
        float _770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _776 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _758 = _770;
        _760 = _772;
        _762 = _774;
        _764 = _776;
    }
    float _778 = _758;
    float _780 = _760;
    float _782 = _762;
    float _784 = _764;
    float _786 = _722;
    float _788 = _724;
    float _790 = _726;
    float _792 = _728;
    if (_752)
    {
        float _794 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _796 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _798 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _800 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _786 = _794;
        _788 = _796;
        _790 = _798;
        _792 = _800;
    }
    float _802 = _786;
    float _804 = _788;
    float _806 = _790;
    float _808 = _792;
    float _810 = _730;
    float _812 = _732;
    float _814 = _734;
    float _816 = _736;
    if (_752)
    {
        float _818 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _820 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _822 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _824 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _810 = _818;
        _812 = _820;
        _814 = _822;
        _816 = _824;
    }
    float _826 = _810;
    float _828 = _812;
    float _830 = _814;
    float _832 = _816;
    float _834 = _372 + _738;
    float _836 = _370 + _740;
    float _838 = _374 + _742;
    float _840 = 0.0;
    if (!_752)
    {
        _394 = 0.0;
        _840 = 0.0;
    }
    float _842 = _394;
    float _844 = _840;
    float _846 = _842;
    float _848 = _844;
    if (!_752)
    {
        _766 = 0.0;
    }
    float _850 = _766;
    int _852 = as_type<int>(_748) & 2048;
    bool _854 = _852 != 0;
    float _856 = _778;
    float _858 = _850;
    if (_752)
    {
        float _860 = _834 * _780;
        _768 = _860;
    }
    float _862 = _768;
    float _864 = _804;
    float _866 = _806;
    if (_752)
    {
        float _868 = _834 * _804;
        _864 = _868;
    }
    float _870 = _864;
    float _872 = _870;
    if (_752)
    {
        float _874 = fma(_836, _778, _862);
        _856 = _874;
    }
    float _876 = _856;
    float _878 = _828;
    float _880 = _876;
    float _882 = _826;
    if (_752)
    {
        float _884 = _834 * _828;
        _878 = _884;
    }
    float _886 = _878;
    if (_752)
    {
        float _888 = fma(_836, _802, _870);
        _872 = _888;
    }
    float _890 = _872;
    if (_752)
    {
        float _892 = fma(_838, _782, _876);
        _880 = _892;
    }
    float _894 = _880;
    if (_752)
    {
        float _896 = fma(_836, _826, _886);
        _882 = _896;
    }
    float _898 = _882;
    float _900 = _898;
    if (_752)
    {
        float _902 = fma(_838, _806, _890);
        _866 = _902;
    }
    float _904 = _866;
    if (_752)
    {
        float _906 = _784 + _894;
        _858 = _906;
    }
    float _908 = _858;
    float _910 = _908;
    if (_752)
    {
        float _912 = fma(_838, _830, _898);
        _900 = _912;
    }
    float _914 = _900;
    if (_752)
    {
        float _916 = _808 + _904;
        _846 = _916;
    }
    float _918 = _846;
    float _920 = _918;
    if (_752)
    {
        float _922 = _832 + _914;
        _848 = _922;
    }
    float _924 = _848;
    bool _926 = !_756;
    float _928 = _924;
    if (!_926)
    {
        float _930 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _932 = uint(int(uint(_174) >> uint(2)));
        float _934 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_932)]);
        int _936 = _174 + 4;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        float _940 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_938)]);
        int _942 = _174 + 8;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        float _946 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_944)]);
        uint _948 = uint(int(uint(_174) >> uint(2)));
        float _950 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_948)]);
        int _952 = _174 + 4;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        float _956 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_954)]);
        int _958 = _174 + 8;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        float _962 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_960)]);
        uint _964 = uint(int(uint(_174) >> uint(2)));
        float _966 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_964)]);
        int _968 = _174 + 4;
        uint _970 = uint(int(uint(_968) >> uint(2)));
        float _972 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_970)]);
        int _974 = _174 + 8;
        uint _976 = uint(int(uint(_974) >> uint(2)));
        float _978 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_976)]);
        float _980 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _982 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _984 = _834 * _940;
        float _986 = _834 * _956;
        float _988 = _834 * _972;
        float _990 = fma(_836, _934, _984);
        float _992 = fma(_836, _950, _986);
        float _994 = fma(_836, _966, _988);
        float _996 = fma(_838, _946, _990);
        float _998 = fma(_838, _962, _992);
        float _1000 = fma(_838, _978, _994);
        float _1002 = _930 + _996;
        float _1004 = _980 + _998;
        float _1006 = _982 + _1000;
        _920 = _1004;
        _910 = _1002;
        _928 = _1006;
    }
    float _1008 = _920;
    float _1010 = _910;
    float _1012 = _928;
    bool _1014 = !_854;
    float _1016 = _1008;
    float _1018 = _1010;
    float _1020 = _1012;
    if (!_1014)
    {
        uint _1022 = uint(int(uint(_174) >> uint(2)));
        float _1024 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1022)]);
        int _1026 = _174 + 4;
        uint _1028 = uint(int(uint(_1026) >> uint(2)));
        float _1030 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1028)]);
        int _1032 = _174 + 8;
        uint _1034 = uint(int(uint(_1032) >> uint(2)));
        float _1036 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1034)]);
        int _1038 = _174 + 12;
        uint _1040 = uint(int(uint(_1038) >> uint(2)));
        float _1042 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1040)]);
        uint _1044 = uint(int(uint(_174) >> uint(2)));
        float _1046 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1044)]);
        int _1048 = _174 + 4;
        uint _1050 = uint(int(uint(_1048) >> uint(2)));
        float _1052 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1050)]);
        int _1054 = _174 + 8;
        uint _1056 = uint(int(uint(_1054) >> uint(2)));
        float _1058 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1056)]);
        int _1060 = _174 + 12;
        uint _1062 = uint(int(uint(_1060) >> uint(2)));
        float _1064 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1062)]);
        uint _1066 = uint(int(uint(_174) >> uint(2)));
        float _1068 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1066)]);
        int _1070 = _174 + 4;
        uint _1072 = uint(int(uint(_1070) >> uint(2)));
        float _1074 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1072)]);
        int _1076 = _174 + 8;
        uint _1078 = uint(int(uint(_1076) >> uint(2)));
        float _1080 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1078)]);
        int _1082 = _174 + 12;
        uint _1084 = uint(int(uint(_1082) >> uint(2)));
        float _1086 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1084)]);
        float _1088 = _834 * _1030;
        float _1090 = _834 * _1052;
        float _1092 = _834 * _1074;
        float _1094 = fma(_836, _1024, _1088);
        float _1096 = fma(_836, _1046, _1090);
        float _1098 = fma(_836, _1068, _1092);
        float _1100 = fma(_838, _1036, _1094);
        float _1102 = fma(_838, _1058, _1096);
        float _1104 = fma(_838, _1080, _1098);
        float _1106 = _1100 + _1042;
        float _1108 = _1102 + _1064;
        float _1110 = _1104 + _1086;
        _1016 = _1108;
        _1018 = _1106;
        _1020 = _1110;
    }
    float _1112 = _1016;
    float _1114 = _1018;
    float _1116 = _1020;
    float _1118 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[8]);
    float _1120 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[9]);
    float _1122 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[10]);
    float _1124 = as_type<float>((*spvDescriptorSet0.cp_s7)._m0[11]);
    float _1126 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[61]);
    float _1128 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[60]);
    float _1130 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[70]);
    float _1132 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[504]);
    float _1134 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[505]);
    float _1136 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[506]);
    float _1138 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[507]);
    float _1140 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[501]);
    float _1142 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[502]);
    float _1144 = _1120 * _1112;
    float _1146 = fma(_1118, _1114, _1144);
    float _1148 = fma(_1122, _1116, _1146);
    float _1150 = _1124 + _1148;
    float _1152 = -_1150;
    bool _1154 = _1126 >= _1152;
    bool _1156 = isnan(_1126);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(_1152);
    bool _1162 = _1158 || _1160;
    float _1164 = -_1150;
    bool _1166 = _1128 >= _1164;
    bool _1168 = isnan(_1128);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(_1164);
    bool _1174 = _1170 || _1172;
    int _1176 = _1162 ? 0 : 1;
    int _1178 = 2;
    if (_1162)
    {
        _1178 = 1;
    }
    int _1180 = _1178;
    int _1182 = _1180;
    if (_1174)
    {
        _1182 = _1176;
    }
    int _1184 = _1182;
    int _1186 = _1184 << 6;
    int _1188 = _1186 + 96;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    float _1192 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1190)]);
    int _1194 = _1188 + 4;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    float _1198 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1196)]);
    int _1200 = _1188 + 8;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    float _1204 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1202)]);
    int _1206 = _1188 + 12;
    uint _1208 = uint(int(uint(_1206) >> uint(2)));
    float _1210 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1208)]);
    int _1212 = _1186 + 48;
    int _1214 = _1186 + 64;
    uint _1216 = uint(int(uint(_1212) >> uint(2)));
    float _1218 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1216)]);
    int _1220 = _1212 + 4;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    float _1224 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1222)]);
    int _1226 = _1212 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    float _1230 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1228)]);
    int _1232 = _1212 + 12;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    float _1236 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1234)]);
    uint _1238 = uint(int(uint(_1214) >> uint(2)));
    float _1240 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1238)]);
    int _1242 = _1214 + 4;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    float _1246 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1244)]);
    int _1248 = _1214 + 8;
    uint _1250 = uint(int(uint(_1248) >> uint(2)));
    float _1252 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1250)]);
    int _1254 = _1214 + 12;
    uint _1256 = uint(int(uint(_1254) >> uint(2)));
    float _1258 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1256)]);
    int _1260 = _1186 + 80;
    float _1262 = _1130 + 1.0;
    float _1264 = _1262 + _1112;
    uint _1266 = uint(int(uint(_1260) >> uint(2)));
    float _1268 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1266)]);
    int _1270 = _1260 + 4;
    uint _1272 = uint(int(uint(_1270) >> uint(2)));
    float _1274 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1272)]);
    int _1276 = _1260 + 8;
    uint _1278 = uint(int(uint(_1276) >> uint(2)));
    float _1280 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1278)]);
    int _1282 = _1260 + 12;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    float _1286 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1284)]);
    float _1288 = _1264 * _1134;
    float _1290 = fma(_1132, _1114, _1288);
    float _1292 = fma(_1136, _1116, _1290);
    float _1294 = _1138 + _1292;
    float _1296 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[508]);
    float _1298 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[509]);
    float _1300 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[510]);
    float _1302 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[511]);
    float _1304 = trunc(_1294);
    int _1306 = int(_1304);
    int _1308 = ~as_type<int>(_1140);
    int _1310 = _1306 + _1308;
    int _1312 = _1310 + 1;
    bool _1314 = _1312 >= 0;
    int _1316 = as_type<int>(_1112);
    float _1318 = as_type<float>(_1184);
    if (_1314)
    {
        float _1320 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1316 = as_type<int>(_1320);
    }
    int _1322 = _1316;
    bool _1324 = _316 > 0.001000000047497451305389404296875;
    bool _1326 = isnan(_316);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.001000000047497451305389404296875);
    bool _1332 = _1328 || _1330;
    float _1334 = _1264 * _1198;
    float _1336 = fma(_1192, _1114, _1334);
    float _1338 = fma(_1204, _1116, _1336);
    float _1340 = _1210 + _1338;
    float _1342 = _1264 * _1224;
    float _1344 = 1.0 / _1340;
    float _1346 = fma(_1218, _1114, _1342);
    float _1348 = _1264 * _1246;
    float _1350 = fma(_1230, _1116, _1346);
    float _1352 = fma(_1240, _1114, _1348);
    float _1354 = _1236 + _1350;
    float _1356 = fma(_1252, _1116, _1352);
    float _1358 = _1354 * _1344;
    float _1360 = _1258 + _1356;
    bool _1362 = _1358 >= 0.0;
    float _1364 = _1360 * _1344;
    bool _1366 = _1358 <= 1.0;
    bool _1368 = _1366 && _1362;
    bool _1370 = _1364 >= 0.0;
    bool _1372 = _1370 && _1368;
    bool _1374 = _1364 <= 1.0;
    bool _1376 = _1374 && _1372;
    float _1378 = _1264 * _1274;
    float _1380 = fma(_1268, _1114, _1378);
    float _1382 = _1354;
    float _1384 = _1236;
    float _1386 = _1268;
    if (_1376)
    {
        float _1388 = float(_1184);
        _1318 = _1388;
    }
    float _1390 = _1318;
    float _1392 = fma(_1280, _1116, _1380);
    float _1394 = _1390;
    if (_1376)
    {
        float _1396 = rint(_1390);
        float _1398 = precise::max(_1396, 0.0);
        uint _1400 = uint(_1398);
        uint _1402 = clamp(_1400, 0u, 65535u);
        _1394 = as_type<float>(_1402);
    }
    float _1404 = _1394;
    float _1406 = _1286 + _1392;
    float _1408 = fma(_1114, 6.2500002968590706586837768554688e-05, 0.5);
    float _1410 = fma(_1116, 6.2500002968590706586837768554688e-05, 0.5);
    float _1412 = _1406 * _1344;
    float _1414 = _1364;
    if (_1376)
    {
        float3 _4441 = float3(_1358, _1364, float(as_type<int>(_1404)));
        float3 _4445 = select(_4441, float3(0.0), isnan(_4441));
        float _1416 = spvDepthCast(spvDescriptorSet0.cp_t_tcb_16).sample_compare(spvDescriptorSet0.cp_t_tcb_16Smplr, _4445.xy, uint(rint(_4445.z)), _1412, level(0.0));
        _1414 = _1416;
    }
    float _1418 = _1414;
    float _1420 = _1218;
    float _1422 = _1346;
    if (!_1332)
    {
        float2 _4459 = float2(_1408, _1410);
        float2 _1426 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4459, float2(0.0), isnan(_4459)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4459, float2(0.0), isnan(_4459)), level(0.0)).xy;
        float _1428 = _1426.x;
        float _1430 = _1426.y;
        _1420 = _1428;
        _1422 = _1430;
    }
    float _1432 = _1420;
    float _1434 = _1422;
    float _1436 = _1264 * _1298;
    float _1438 = fma(_1296, _1114, _1436);
    float _1440 = fma(_1300, _1116, _1438);
    float _1442 = _1302 + _1440;
    float _1444 = trunc(_1442);
    int _1446 = int(_1444);
    bool _1448 = _1322 <= _1312;
    bool _1450 = !_1314;
    bool _1452 = _1448 || _1450;
    int _1454 = ~as_type<int>(_1142);
    int _1456 = _1446 + _1454;
    int _1458 = _1456 + 1;
    bool _1460 = _1458 < 0;
    bool _1462 = _1460 || _1452;
    float _1464 = _1438;
    float _1466 = as_type<float>(_1446);
    int _1468 = as_type<int>(_1442);
    if (!_1462)
    {
        float _1470 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        _1464 = _1470;
    }
    float _1472 = _1464;
    bool _1474 = as_type<int>(_1472) <= _1458;
    bool _1476 = _1474 || _1462;
    float _1478 = _1472;
    if (_1476)
    {
        _1466 = 1.0;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    float _1484 = _1432;
    float _1486 = _1434;
    float _1488 = _1432;
    float _1490 = _1434;
    if (!_1476)
    {
        float _1492 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[500]);
        int _1494 = _1458 * as_type<int>(_1492);
        int _1496 = _1494 + _1312;
        int _1498 = _1496 << 2;
        uint _1500 = uint(int(uint(_1496) >> uint(2)));
        int _1502 = 12 & _1498;
        int _1504 = int(_1500) << 4;
        int _1506 = _1504 + _1502;
        int _1508 = _1506 + 400;
        uint _1510 = uint(int(uint(_1508) >> uint(2)));
        float _1512 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1510)]);
        float _1514 = floor(_1442);
        float _1516 = floor(_1294);
        float _1518 = -_1514;
        float _1520 = _1442 + _1518;
        float _1522 = -_1516;
        float _1524 = _1294 + _1522;
        float _1526 = rint(_1512);
        float _1528 = precise::max(_1526, 0.0);
        uint _1530 = uint(_1528);
        uint _1532 = clamp(_1530, 0u, 65535u);
        float3 _4610 = float3(_1524, _1520, float(int(_1532)));
        float3 _4612 = select(_4610, float3(0.0), isnan(_4610));
        float _1534 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, _4612.xy, uint(rint(_4612.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, _4612.xy, uint(rint(_4612.z)), level(0.0)).x;
        int _1536 = _1496 << 4;
        int _1538 = _1536 + 2048;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        float _1542 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1540)]);
        int _1544 = _1538 + 4;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        float _1548 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1546)]);
        int _1550 = _1538 + 8;
        uint _1552 = uint(int(uint(_1550) >> uint(2)));
        float _1554 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1552)]);
        int _1556 = _1538 + 12;
        uint _1558 = uint(int(uint(_1556) >> uint(2)));
        float _1560 = as_type<float>((*spvDescriptorSet0.cp_s12)._m0[int(_1558)]);
        float _1562 = _1264 * _1548;
        float _1564 = fma(_1542, _1114, _1562);
        float _1566 = fma(_1554, _1116, _1564);
        float _1568 = _1560 + _1566;
        float _1570 = precise::clamp(_1568, 0.0, 1.0);
        float _1572 = -_1570;
        float _1574 = _1572 + _1534;
        float _1576 = fma(_1574, 500.0, 1.5);
        float _1578 = exp2(_1576);
        float _1580 = 0.0 + _1578;
        float _1582 = precise::clamp(_1580, 0.0, 1.0);
        _1478 = _1512;
        _1482 = _1582;
        _1382 = as_type<float>(_1532);
        _1384 = _1524;
        _1386 = _1542;
    }
    float _1584 = _1478;
    float _1586 = _1482;
    float _1588 = _1382;
    float _1590 = _1384;
    float _1592 = _1386;
    uint _1594 = uint(int(uint(_174) >> uint(2)));
    float _1596 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1594)]);
    float _1598 = _1584;
    float _1600 = _1592;
    if (!_1376)
    {
        _1598 = 1.0;
    }
    float _1602 = _1598;
    float _1604 = _1602;
    float _1606 = _1596;
    if (_1376)
    {
        bool _1608 = _1418 >= _1412;
        bool _1610 = isnan(_1418);
        bool _1612 = _1608 || _1610;
        bool _1614 = isnan(_1412);
        bool _1616 = _1612 || _1614;
        float _1618 = float(_1616);
        _1604 = _1618;
    }
    float _1620 = _1604;
    if (_1332)
    {
        _1468 = as_type<int>(_272);
    }
    int _1622 = _1468;
    float _1624 = -_1620;
    float _1626 = fma(_1624, _1586, 1.0);
    float _1628 = -_1596;
    float _1630 = _1626 + _1628;
    float _1632 = _1626;
    float _1634 = _1630;
    int _1636 = _1622;
    if (_1332)
    {
        float _1638 = fma(_1630, 0.0500000007450580596923828125, _1596);
        _1632 = _1638;
    }
    float _1640 = _1632;
    if (!_1332)
    {
        int _1642 = _174 + 4;
        _1634 = as_type<float>(_1642);
    }
    float _1644 = _1634;
    if (!_1332)
    {
        _1606 = as_type<float>(0x7fc00000u /* nan */);
    }
    float _1646 = _1606;
    float _1648 = precise::max(0.0, _1640);
    float _1650 = precise::min(_1648, 0.999000012874603271484375);
    uint _1652 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_1652)] = as_type<uint>(_1650);
    if (!_1332)
    {
        uint _1654 = uint(int(uint(as_type<int>(_1644)) >> uint(2)));
        (*spvDescriptorSet0.cp_s13)._m0[int(_1654)] = as_type<uint>(_1646);
    }
    if (!_1332)
    {
        bool _1656 = _1432 != 0.0;
        bool _1658 = isnan(_1432);
        bool _1660 = _1656 || _1658;
        bool _1662 = isnan(0.0);
        bool _1664 = _1660 || _1662;
        if (!_1664)
        {
            float2 _4826 = float2(_1408, _1410);
            float2 _1666 = dm_bs(spvDescriptorSet0.cp_t_tcb_2C.sample(spvDescriptorSet0.cp_t_tcb_2CSmplr, select(_4826, float2(0.0), isnan(_4826)), level(4.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_2C, spvDescriptorSet0.cp_t_tcb_2CSmplr_w, select(_4826, float2(0.0), isnan(_4826)), level(4.0)).xy;
            float _1668 = _1666.x;
            float _1670 = _1666.y;
            _1484 = _1668;
            _1486 = _1670;
        }
        float _1672 = _1484;
        float _1674 = _1486;
        bool _1676 = _1672 >= _1674;
        bool _1678 = isnan(_1672);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan(_1674);
        bool _1684 = _1680 || _1682;
        int _1686 = _1684 ? as_type<int>(_272) : 0;
        _1488 = _1672;
        _1490 = _1674;
        _1636 = _1686;
    }
    float _1688 = _1488;
    float _1690 = _1490;
    int _1692 = _1636;
    float _1694 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[30]);
    int _1696 = _174 + 8;
    uint _1698 = uint(int(uint(_1696) >> uint(2)));
    float _1700 = as_type<float>((*spvDescriptorSet0.cp_s13)._m0[int(_1698)]);
    int _1702 = as_type<int>(_1694) & 512;
    bool _1704 = _1702 != 0;
    int _1706 = as_type<int>(_1694) & 1024;
    bool _1708 = _1706 != 0;
    float _1710 = _1648;
    float _1712 = _1650;
    float _1714 = _1644;
    float _1716 = _1646;
    bool _1718 = _1704;
    if (_1704)
    {
        float _1720 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[16]);
        float _1722 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[17]);
        float _1724 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[18]);
        float _1726 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        _1710 = _1720;
        _1712 = _1722;
        _1714 = _1724;
        _1716 = _1726;
    }
    float _1728 = _1710;
    float _1730 = _1712;
    float _1732 = _1714;
    float _1734 = _1716;
    float _1736 = _1418;
    float _1738 = _1412;
    float _1740 = _1408;
    float _1742 = _1410;
    if (_1704)
    {
        float _1744 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        float _1746 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[21]);
        float _1748 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[22]);
        float _1750 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        _1736 = _1744;
        _1738 = _1746;
        _1740 = _1748;
        _1742 = _1750;
    }
    float _1752 = _1736;
    float _1754 = _1738;
    float _1756 = _1740;
    float _1758 = _1742;
    float _1760 = _1688;
    float _1762 = _1690;
    float _1764 = _1588;
    float _1766 = _1590;
    if (_1704)
    {
        float _1768 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[24]);
        float _1770 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[25]);
        float _1772 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[26]);
        float _1774 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        _1760 = _1768;
        _1762 = _1770;
        _1764 = _1772;
        _1766 = _1774;
    }
    float _1776 = _1760;
    float _1778 = _1762;
    float _1780 = _1764;
    float _1782 = _1766;
    float _1784 = _1332 ? _1700 : 1.0;
    int _1786 = as_type<int>(_1694) & 2048;
    bool _1788 = _1786 != 0;
    bool _1790 = _1784 > 0.00999999977648258209228515625;
    float _1792 = _1728;
    float _1794 = _1730;
    float _1796 = _1732;
    if (_1704)
    {
        float _1798 = _834 * _1730;
        _1600 = _1798;
    }
    float _1800 = _1600;
    float _1802 = _1800;
    if (_1704)
    {
        float _1804 = fma(_836, _1728, _1800);
        _1792 = _1804;
    }
    float _1806 = _1792;
    float _1808 = _1754;
    float _1810 = _1776;
    float _1812 = _1752;
    float _1814 = _1756;
    float _1816 = _1806;
    if (_1704)
    {
        float _1818 = _834 * _1754;
        _1808 = _1818;
    }
    float _1820 = _1808;
    float _1822 = _1820;
    if (_1704)
    {
        float _1824 = _834 * _1778;
        _1802 = _1824;
    }
    float _1826 = _1802;
    if (_1704)
    {
        float _1828 = fma(_836, _1752, _1820);
        _1822 = _1828;
    }
    float _1830 = _1822;
    if (_1704)
    {
        float _1832 = fma(_836, _1776, _1826);
        _1810 = _1832;
    }
    float _1834 = _1810;
    float _1836 = _1834;
    if (_1704)
    {
        float _1838 = fma(_838, _1732, _1806);
        _1812 = _1838;
    }
    float _1840 = _1812;
    if (_1704)
    {
        float _1842 = fma(_838, _1756, _1830);
        _1814 = _1842;
    }
    float _1844 = _1814;
    if (_1704)
    {
        float _1846 = fma(_838, _1780, _1834);
        _1836 = _1846;
    }
    float _1848 = _1836;
    if (!_1704)
    {
        _1816 = 0.0;
        _1794 = 0.0;
    }
    float _1850 = _1816;
    float _1852 = _1794;
    float _1854 = _1852;
    float _1856 = _1850;
    if (!_1704)
    {
        _1796 = 0.0;
    }
    float _1858 = _1796;
    float _1860 = _1858;
    if (_1704)
    {
        float _1862 = _1734 + _1840;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = _1864;
    if (_1704)
    {
        float _1868 = _1758 + _1844;
        _1854 = _1868;
    }
    float _1870 = _1854;
    float _1872 = _1870;
    if (_1704)
    {
        float _1874 = _1782 + _1848;
        _1856 = _1874;
    }
    float _1876 = _1856;
    bool _1878 = !_1708;
    float _1880 = _1876;
    if (!_1878)
    {
        float _1882 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[19]);
        uint _1884 = uint(int(uint(_174) >> uint(2)));
        float _1886 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1884)]);
        int _1888 = _174 + 4;
        uint _1890 = uint(int(uint(_1888) >> uint(2)));
        float _1892 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1890)]);
        int _1894 = _174 + 8;
        uint _1896 = uint(int(uint(_1894) >> uint(2)));
        float _1898 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1896)]);
        uint _1900 = uint(int(uint(_174) >> uint(2)));
        float _1902 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1900)]);
        int _1904 = _174 + 4;
        uint _1906 = uint(int(uint(_1904) >> uint(2)));
        float _1908 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1906)]);
        int _1910 = _174 + 8;
        uint _1912 = uint(int(uint(_1910) >> uint(2)));
        float _1914 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1912)]);
        uint _1916 = uint(int(uint(_174) >> uint(2)));
        float _1918 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1916)]);
        int _1920 = _174 + 4;
        uint _1922 = uint(int(uint(_1920) >> uint(2)));
        float _1924 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1922)]);
        int _1926 = _174 + 8;
        uint _1928 = uint(int(uint(_1926) >> uint(2)));
        float _1930 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_1928)]);
        float _1932 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[23]);
        float _1934 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[27]);
        float _1936 = _834 * _1892;
        float _1938 = _834 * _1908;
        float _1940 = fma(_836, _1886, _1936);
        float _1942 = _834 * _1924;
        float _1944 = fma(_836, _1902, _1938);
        float _1946 = fma(_836, _1918, _1942);
        float _1948 = fma(_838, _1898, _1940);
        float _1950 = fma(_838, _1914, _1944);
        float _1952 = fma(_838, _1930, _1946);
        float _1954 = _1882 + _1948;
        float _1956 = _1932 + _1950;
        float _1958 = _1934 + _1952;
        _1880 = _1958;
        _1872 = _1956;
        _1866 = _1954;
    }
    float _1960 = _1880;
    float _1962 = _1872;
    float _1964 = _1866;
    bool _1966 = !_1788;
    float _1968 = _1964;
    float _1970 = _1960;
    float _1972 = _1962;
    if (!_1966)
    {
        uint _1974 = uint(int(uint(_174) >> uint(2)));
        float _1976 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1974)]);
        int _1978 = _174 + 4;
        uint _1980 = uint(int(uint(_1978) >> uint(2)));
        float _1982 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1980)]);
        int _1984 = _174 + 8;
        uint _1986 = uint(int(uint(_1984) >> uint(2)));
        float _1988 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1986)]);
        int _1990 = _174 + 12;
        uint _1992 = uint(int(uint(_1990) >> uint(2)));
        float _1994 = as_type<float>((*spvDescriptorSet0.cp_s11)._m0[int(_1992)]);
        uint _1996 = uint(int(uint(_174) >> uint(2)));
        float _1998 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_1996)]);
        int _2000 = _174 + 4;
        uint _2002 = uint(int(uint(_2000) >> uint(2)));
        float _2004 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2002)]);
        int _2006 = _174 + 8;
        uint _2008 = uint(int(uint(_2006) >> uint(2)));
        float _2010 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2008)]);
        int _2012 = _174 + 12;
        uint _2014 = uint(int(uint(_2012) >> uint(2)));
        float _2016 = as_type<float>((*spvDescriptorSet0.cp_s9)._m0[int(_2014)]);
        uint _2018 = uint(int(uint(_174) >> uint(2)));
        float _2020 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2018)]);
        int _2022 = _174 + 4;
        uint _2024 = uint(int(uint(_2022) >> uint(2)));
        float _2026 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2024)]);
        int _2028 = _174 + 8;
        uint _2030 = uint(int(uint(_2028) >> uint(2)));
        float _2032 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2030)]);
        int _2034 = _174 + 12;
        uint _2036 = uint(int(uint(_2034) >> uint(2)));
        float _2038 = as_type<float>((*spvDescriptorSet0.cp_s10)._m0[int(_2036)]);
        float _2040 = _834 * _1982;
        float _2042 = _834 * _2004;
        float _2044 = _834 * _2026;
        float _2046 = fma(_836, _1976, _2040);
        float _2048 = fma(_836, _1998, _2042);
        float _2050 = fma(_836, _2020, _2044);
        float _2052 = fma(_838, _1988, _2046);
        float _2054 = fma(_838, _2010, _2048);
        float _2056 = fma(_838, _2032, _2050);
        float _2058 = _2052 + _1994;
        float _2060 = _2054 + _2016;
        float _2062 = _2056 + _2038;
        _1968 = _2058;
        _1970 = _2062;
        _1972 = _2060;
    }
    float _2064 = _1968;
    float _2066 = _1970;
    float _2068 = _1972;
    float _2070 = fma(_2064, 6.2500002968590706586837768554688e-05, 0.5);
    float _2072 = fma(_2066, 6.2500002968590706586837768554688e-05, 0.5);
    float _2074 = _2066;
    float _2076 = _2068;
    if (_1790)
    {
        float2 _5440 = float2(_2070, _2072);
        float _2078 = dm_bs(spvDescriptorSet0.cp_t_tcb_2A.sample(spvDescriptorSet0.cp_t_tcb_2ASmplr, select(_5440, float2(0.0), isnan(_5440)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_2A, spvDescriptorSet0.cp_t_tcb_2ASmplr_w, select(_5440, float2(0.0), isnan(_5440)), level(0.0)).x;
        _2074 = _2078;
    }
    float _2080 = _2074;
    float2 _5451 = float2(_2070, _2072);
    float _2082 = dm_bs(spvDescriptorSet0.cp_t_tcb_22.sample(spvDescriptorSet0.cp_t_tcb_22Smplr, select(_5451, float2(0.0), isnan(_5451)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_22, spvDescriptorSet0.cp_t_tcb_22Smplr_w, select(_5451, float2(0.0), isnan(_5451)), level(0.0)).x;
    if (_1790)
    {
        float _2084 = _2068 + 1.0;
        _2076 = _2084;
    }
    float _2086 = _2076;
    float _2088 = -_238;
    float _2090 = _2088 + _838;
    float _2092 = _2080;
    if (_1790)
    {
        float _2094 = _2080 * 2000.0;
        _2092 = _2094;
    }
    float _2096 = _2092;
    float _2098 = abs(_2082);
    bool _2100 = _2098 == 0.0;
    float _2102 = float(_2100);
    float _2104 = _2102;
    if (_1790)
    {
        bool _2106 = _2086 >= _2096;
        bool _2108 = isnan(_2086);
        bool _2110 = _2106 || _2108;
        bool _2112 = isnan(_2096);
        bool _2114 = _2110 || _2112;
        _1718 = _2114;
    }
    bool _2116 = _1718;
    float _2118 = -_226;
    float _2120 = _2118 + _836;
    if (_1790)
    {
        float _2122 = _2116 ? _2102 : 1.0;
        _2104 = _2122;
    }
    float _2124 = _2104;
    float _2126 = -_1784;
    float _2128 = _2126 + _2124;
    float _2130 = _2124;
    if (_1332)
    {
        float _2132 = fma(_2128, 0.0500000007450580596923828125, _1784);
        _2130 = _2132;
    }
    float _2134 = _2130;
    float _2136 = -_232;
    float _2138 = _2136 + _834;
    float _2140 = 0.0 + _2134;
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    int _2144 = _174 + 4;
    uint _2146 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s13)._m0[int(_2146)] = as_type<uint>(_2142);
    uint _2148 = uint(int(uint(_178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2148)] = uint(_1692);
    uint _2150 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2150)] = as_type<uint>(_836);
    uint _2152 = uint(int(uint(_2144) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2152)] = as_type<uint>(_834);
    uint _2154 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2154)] = as_type<uint>(_838);
    uint _2156 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2156)] = as_type<uint>(_360);
    uint _2158 = uint(int(uint(_2144) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2158)] = as_type<uint>(_366);
    uint _2160 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_2160)] = as_type<uint>(_368);
    uint _2162 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2162)] = as_type<uint>(_2120);
    uint _2164 = uint(int(uint(_2144) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2164)] = as_type<uint>(_2138);
    uint _2166 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2166)] = as_type<uint>(_2090);
    float _2168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _2170 = _2138 * _2138;
    float _2172 = _366 * _366;
    float _2174 = fma(_2120, _2120, _2170);
    float _2176 = fma(_360, _360, _2172);
    float _2178 = fma(_2090, _2090, _2174);
    float _2180 = fma(_368, _368, _2176);
    float _2182 = sqrt(_2180);
    float _2184 = sqrt(_2178);
    bool _2186 = _2184 >= 9.9999999747524270787835121154785e-07;
    bool _2188 = isnan(_2184);
    bool _2190 = _2186 || _2188;
    bool _2192 = isnan(9.9999999747524270787835121154785e-07);
    bool _2194 = _2190 || _2192;
    if (!_2194)
    {
        bool _2196 = _182 != _186;
        bool _2198 = isnan(_182);
        bool _2200 = _2196 || _2198;
        bool _2202 = isnan(_186);
        bool _2204 = _2200 || _2202;
        _2206 = _2204;
        if (!_2206)
        {
            float _2208 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[67]);
            bool _2210 = _2208 > 0.0;
            bool _2212 = !_2210;
            if (!_2212)
            {
                float _2214 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[64]);
                float _2216 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[65]);
                float _2218 = as_type<float>((*spvDescriptorSet0.cp_s4)._m0[66]);
                float _2220 = _2216 * _2216;
                float _2222 = fma(_2214, _2214, _2220);
                float _2224 = fma(_2218, _2218, _2222);
                float _2226 = rsqrt(_2224);
                float _2228 = _2226 * 9.9999999747524270787835121154785e-07;
                float _2230 = _2214 * _2228;
                float _2232 = _2216 * _2228;
                float _2234 = _2218 * _2228;
                _408 = as_type<int>(_2230);
                _410 = as_type<int>(_2232);
                _412 = as_type<int>(_2234);
                _2206 = true;
            }
            else
            {
                bool _2236 = _2182 >= 9.9999999747524270787835121154785e-07;
                bool _2238 = isnan(_2182);
                bool _2240 = _2236 || _2238;
                bool _2242 = isnan(9.9999999747524270787835121154785e-07);
                bool _2244 = _2240 || _2242;
                if (!_2244)
                {
                    float _2246 = _834 * _834;
                    float _2248 = fma(_836, _836, _2246);
                    float _2250 = fma(_838, _838, _2248);
                    float _2252 = sqrt(_2250);
                    bool _2254 = _2252 >= 9.9999999747524270787835121154785e-07;
                    bool _2256 = isnan(_2252);
                    bool _2258 = _2254 || _2256;
                    bool _2260 = isnan(9.9999999747524270787835121154785e-07);
                    bool _2262 = _2258 || _2260;
                    float _2264 = _2252;
                    if (_2262)
                    {
                        float _2266 = rsqrt(_2250);
                        _2264 = _2266;
                    }
                    float _2268 = _2264;
                    if (!_2262)
                    {
                        _396 = 0;
                    }
                    int _2270 = _396;
                    int _2272 = _2270;
                    if (!_2262)
                    {
                        _398 = 897988541;
                    }
                    int _2274 = _398;
                    int _2276 = _2274;
                    if (!_2262)
                    {
                        _400 = 0;
                    }
                    int _2278 = _400;
                    float _2280 = _2268;
                    int _2282 = _2278;
                    if (_2262)
                    {
                        float _2284 = _2268 * 9.9999999747524270787835121154785e-07;
                        _2280 = _2284;
                    }
                    float _2286 = _2280;
                    if (_2262)
                    {
                        float _2288 = _836 * _2286;
                        _2272 = as_type<int>(_2288);
                    }
                    int _2290 = _2272;
                    _408 = _2290;
                    if (_2262)
                    {
                        float _2292 = _834 * _2286;
                        _2276 = as_type<int>(_2292);
                    }
                    int _2294 = _2276;
                    _410 = _2294;
                    if (_2262)
                    {
                        float _2296 = _838 * _2286;
                        _2282 = as_type<int>(_2296);
                    }
                    int _2298 = _2282;
                    _412 = _2298;
                    _2206 = true;
                }
                else
                {
                    float _2300 = rsqrt(_2180);
                    float _2302 = _2300 * 9.9999999747524270787835121154785e-07;
                    float _2304 = _360 * _2302;
                    float _2306 = _366 * _2302;
                    float _2308 = _368 * _2302;
                    _408 = as_type<int>(_2304);
                    _410 = as_type<int>(_2306);
                    _412 = as_type<int>(_2308);
                    _2206 = true;
                }
            }
        }
    }
    else
    {
        float _2310 = _2182 * _2168;
        bool _2312 = _2310 >= 0.001000000047497451305389404296875;
        bool _2314 = isnan(_2310);
        bool _2316 = _2312 || _2314;
        bool _2318 = isnan(0.001000000047497451305389404296875);
        bool _2320 = _2316 || _2318;
        bool _2322 = _2310 > 0.0;
        bool _2324 = !_2320;
        bool _2326 = _2322 && _2324;
        bool _2328 = _2184 < 0.001000000047497451305389404296875;
        bool _2330 = _2328 && _2326;
        if (!_2330)
        {
            _402 = as_type<int>(_2120);
        }
        int _2332 = _402;
        int _2334 = _2332;
        if (_2330)
        {
            float _2336 = _360 * _2168;
            _2334 = as_type<int>(_2336);
        }
        int _2338 = _2334;
        _408 = _2338;
        if (!_2330)
        {
            _404 = as_type<int>(_2138);
        }
        int _2340 = _404;
        int _2342 = _2340;
        if (_2330)
        {
            float _2344 = _366 * _2168;
            _2342 = as_type<int>(_2344);
        }
        int _2346 = _2342;
        _410 = _2346;
        if (!_2330)
        {
            _406 = as_type<int>(_2090);
        }
        int _2348 = _406;
        _412 = _2348;
        if (_2330)
        {
            float _2350 = _368 * _2168;
            _412 = as_type<int>(_2350);
        }
    }
    _2206 = false;
    int _2352 = _408;
    int _2354 = _410;
    int _2356 = _412;
    uint _2358 = uint(int(uint(_174) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2358)] = uint(_2352);
    uint _2360 = uint(int(uint(_2144) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2360)] = uint(_2354);
    uint _2362 = uint(int(uint(_1696) >> uint(2)));
    (*spvDescriptorSet0.cp_s8)._m0[int(_2362)] = uint(_2356);
}

