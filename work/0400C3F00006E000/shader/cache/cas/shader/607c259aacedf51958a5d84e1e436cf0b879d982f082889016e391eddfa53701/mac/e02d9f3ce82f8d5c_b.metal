#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2973, thread const int& _2974, constant _10& support_buffer)
{
    int _2977 = 1 + _2974;
    float _2979 = support_buffer._m5[_2977].x;
    bool _2981 = _2979 == 1.0;
    if (_2981)
    {
        return _2973;
    }
    float _2983 = float(_2973);
    float _2985 = _2983 * _2979;
    int _2987 = int(_2985);
    return _2987;
}

static inline __attribute__((always_inline))
int _56(thread const int& _3008, thread const int& _3009, thread const int& _3010, thread int& _3011, thread uint& gl_SubgroupInvocationID)
{
    int _3014 = _3010 & 31;
    uint _3016 = uint(int(uint(_3010) >> uint(8)));
    int _3018 = int(_3016) & 31;
    float _3020 = as_type<float>(gl_SubgroupInvocationID);
    int _3022 = as_type<int>(_3020) & _3018;
    int _3024 = ~_3018;
    int _3026 = _3014 & _3024;
    int _3028 = _3026 | _3022;
    int _3030 = ~_3018;
    int _3032 = _3009 & _3030;
    int _3034 = _3032 | _3022;
    bool _3036 = uint(_3034) <= uint(_3028);
    _3011 = _3036 ? (-1) : 0;
    float _3038 = spvSubgroupShuffle(as_type<float>(_3008), uint(_3034));
    uint _3040 = uint(_3036 ? as_type<int>(_3038) : _3008);
    return int(_3040);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _760 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    int _115 = 0;
    float _117 = _97;
    float _119 = _109;
    float _121 = as_type<float>(_99);
    if (_113)
    {
        uint _123 = uint(int(uint(_99) >> uint(2)));
        uint _125 = uint(int(uint(int(_123)) >> uint(2)));
        int _127 = int(_123) & 3;
        float _129 = (*spvDescriptorSet0.cp_c5)._m0[int(_125)][_127];
        _115 = as_type<int>(_129);
    }
    int _131 = _115;
    float _133 = 0.0;
    float _135 = 0.0;
    if (!_113)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _137 = _133;
    float _139 = _135;
    float _141 = 0.0;
    if (!_113)
    {
        _141 = 0.0;
    }
    float _143 = _141;
    if (!_113)
    {
        _117 = 0.0;
        _119 = 0.0;
    }
    float _145 = _117;
    float _147 = _119;
    float _149 = 0.0;
    if (_113)
    {
        _149 = 1.4012984643248170709237295832899e-45;
    }
    float _151 = _149;
    float _153 = 0.0;
    float _155 = 0.0;
    if (!_113)
    {
        _153 = 0.0;
        _155 = 0.0;
    }
    float _157 = _153;
    float _159 = _155;
    int _161 = 0;
    if (_113)
    {
        _161 = 2;
    }
    int _163 = _161;
    float _165 = 0.0;
    int _167 = _163;
    if (!_113)
    {
        _165 = 0.0;
        _121 = 0.0;
    }
    float _169 = _165;
    float _171 = _121;
    float _173 = _137;
    float _175 = _139;
    float _177 = _143;
    float _179 = 0.0;
    if (_113)
    {
        int _181 = _66;
        int _183 = 0;
        int _185 = _54(_181, _183, (*spvDescriptorSet0.support_buffer));
        int _187 = _131;
        int _189 = 0;
        int _191 = _54(_187, _189, (*spvDescriptorSet0.support_buffer));
        int3 _1389 = int3(_185, _191, as_type<int>(_151));
        float4 _194 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1389.xy), uint(_1389.z), 0).xyzw;
        float _196 = _194.x;
        float _198 = _194.y;
        float _200 = _194.z;
        float _202 = _194.w;
        _173 = _196;
        _175 = _198;
        _177 = _200;
        _179 = _202;
    }
    float _204 = _173;
    float _206 = _175;
    float _208 = _177;
    float _210 = _179;
    float _212 = _145;
    float _214 = _147;
    float _216 = _169;
    if (_113)
    {
        int _218 = _66;
        int _220 = 0;
        int _222 = _54(_218, _220, (*spvDescriptorSet0.support_buffer));
        int _224 = _131;
        int _226 = 0;
        int _228 = _54(_224, _226, (*spvDescriptorSet0.support_buffer));
        int3 _1422 = int3(_222, _228, 0);
        float3 _232 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1422.xy), uint(_1422.z), 0).xyz;
        float _234 = _232.x;
        float _236 = _232.y;
        float _238 = _232.z;
        _212 = _234;
        _214 = _236;
        _216 = _238;
    }
    float _240 = _212;
    float _242 = _214;
    float _244 = _216;
    float _246 = _157;
    float _248 = _159;
    float _250 = _171;
    if (_113)
    {
        int _252 = _66;
        int _254 = 0;
        int _256 = _54(_252, _254, (*spvDescriptorSet0.support_buffer));
        int _258 = _131;
        int _260 = 0;
        int _262 = _54(_258, _260, (*spvDescriptorSet0.support_buffer));
        int3 _1452 = int3(_256, _262, _163);
        float3 _264 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1452.xy), uint(_1452.z), 0).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        _246 = _266;
        _248 = _268;
        _250 = _270;
    }
    float _272 = _246;
    float _274 = _248;
    float _276 = _250;
    float _278 = 0.0;
    if (!_113)
    {
        _278 = 0.0;
    }
    float _280 = _278;
    bool _282 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _284 = _280;
    if (!_282)
    {
        int _286 = _66 * 48;
        _167 = _286;
    }
    int _288 = _167;
    if (_113)
    {
        float _290 = _210 * 2.0;
        _284 = _290;
    }
    float _292 = _284;
    float _294 = _204 * _204;
    float _296 = _204 * 2.0;
    float _298 = _206 * _206;
    float _300 = _208 * _292;
    float _302 = _204 * _292;
    float _304 = fma(_294, -2.0, 1.0);
    float _306 = _206 * _292;
    float _308 = -_300;
    float _310 = fma(_296, _206, _308);
    float _312 = fma(_296, _206, _300);
    float _314 = _208 * _208;
    float _316 = fma(_298, -2.0, 1.0);
    float _318 = _206 * 2.0;
    float _320 = fma(_296, _208, _306);
    float _322 = -_306;
    float _324 = fma(_296, _208, _322);
    float _326 = fma(_314, -2.0, _316);
    float _328 = -_302;
    float _330 = fma(_318, _208, _328);
    float _332 = fma(_318, _208, _302);
    bool _334 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _336 = fma(_314, -2.0, _304);
    float _338 = fma(_298, -2.0, _304);
    float _340 = _326 * _240;
    float _342 = _310 * _242;
    float _344 = _336 * _242;
    float _346 = _320 * _244;
    int _348 = 0;
    int _350 = as_type<int>(_310);
    int _352 = as_type<int>(_320);
    float _354 = _346;
    if (!_282)
    {
        _348 = as_type<int>(_272);
    }
    int _356 = _348;
    float _358 = _312 * _240;
    float _360 = _330 * _244;
    if (!_282)
    {
        int _362 = _288 + 16;
        _350 = _362;
    }
    int _364 = _350;
    float _366 = _324 * _240;
    float _368 = _332 * _242;
    float _370 = _338 * _244;
    if (!_282)
    {
        int _372 = _288 + 32;
        _352 = _372;
    }
    int _374 = _352;
    if (!_282)
    {
        uint _376 = uint(int(uint(_288) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_376)] = as_type<uint>(_340);
        int _378 = _288 + 4;
        uint _380 = uint(int(uint(_378) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_380)] = as_type<uint>(_342);
        int _382 = _288 + 8;
        uint _384 = uint(int(uint(_382) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_384)] = as_type<uint>(_346);
        int _386 = _288 + 12;
        uint _388 = uint(int(uint(_386) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_388)] = uint(_356);
    }
    int _390 = _66 * 112;
    if (!_282)
    {
        uint _392 = uint(int(uint(_364) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_392)] = as_type<uint>(_358);
        int _394 = _364 + 4;
        uint _396 = uint(int(uint(_394) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_396)] = as_type<uint>(_344);
        int _398 = _364 + 8;
        uint _400 = uint(int(uint(_398) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_400)] = as_type<uint>(_360);
        int _402 = _364 + 12;
        uint _404 = uint(int(uint(_402) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_404)] = as_type<uint>(_274);
    }
    if (!_282)
    {
        uint _406 = uint(int(uint(_374) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_406)] = as_type<uint>(_366);
        int _408 = _374 + 4;
        uint _410 = uint(int(uint(_408) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_410)] = as_type<uint>(_368);
        int _412 = _374 + 8;
        uint _414 = uint(int(uint(_412) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_414)] = as_type<uint>(_370);
        int _416 = _374 + 12;
        uint _418 = uint(int(uint(_416) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_418)] = as_type<uint>(_276);
    }
    bool _420 = !_334;
    float _738;
    float _740;
    float _742;
    float _744;
    float _746;
    float _748;
    float _750;
    float _752;
    float _754;
    float _756;
    float _758;
    if (!_420)
    {
        int _422 = 0;
        float _424 = _340;
        float _426 = _342;
        float _428 = _346;
        float _430 = _272;
        float _432 = _358;
        float _434 = _344;
        float _436 = _360;
        float _438 = _274;
        float _440 = _366;
        float _442 = _368;
        float _444 = _370;
        float _446 = _276;
        bool _448;
        int _496;
        int _506;
        int _516;
        int _526;
        int _536;
        int _546;
        int _556;
        int _566;
        int _576;
        int _586;
        int _596;
        int _606;
        int _714;
        int _718;
        int _720;
        int _724;
        int _726;
        int _728;
        int _732;
        int _734;
        int _736;
        do
        {
            int _450 = _422;
            int _452 = as_type<int>(_424);
            int _454 = as_type<int>(_426);
            int _456 = as_type<int>(_428);
            int _458 = as_type<int>(_430);
            int _460 = as_type<int>(_432);
            int _462 = as_type<int>(_434);
            int _464 = as_type<int>(_436);
            int _466 = as_type<int>(_438);
            int _468 = as_type<int>(_440);
            int _470 = as_type<int>(_442);
            int _472 = as_type<int>(_444);
            int _474 = as_type<int>(_446);
            uint _476 = uint(int(uint(_390) >> uint(2)));
            uint _478 = uint(int(uint(int(_476)) >> uint(2)));
            int _480 = int(_476) & 3;
            float _482 = (*spvDescriptorSet0.cp_c6)._m0[int(_478)][_480];
            bool _484 = _66 != 0;
            int _486 = _450 + 1;
            bool _488 = uint(_486) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _490 = _452;
            int _492 = as_type<int>(_482);
            int _494 = 31;
            int _1831 = _56(_490, _492, _494, _496, gl_SubgroupInvocationID);
            int _498 = _1831;
            int _500 = _454;
            int _502 = as_type<int>(_482);
            int _504 = 31;
            int _1835 = _56(_500, _502, _504, _506, gl_SubgroupInvocationID);
            int _508 = _1835;
            int _510 = _456;
            int _512 = as_type<int>(_482);
            int _514 = 31;
            int _1839 = _56(_510, _512, _514, _516, gl_SubgroupInvocationID);
            int _518 = _1839;
            int _520 = _458;
            int _522 = as_type<int>(_482);
            int _524 = 31;
            int _1843 = _56(_520, _522, _524, _526, gl_SubgroupInvocationID);
            int _528 = _1843;
            int _530 = _460;
            int _532 = as_type<int>(_482);
            int _534 = 31;
            int _1847 = _56(_530, _532, _534, _536, gl_SubgroupInvocationID);
            int _538 = _1847;
            int _540 = _462;
            int _542 = as_type<int>(_482);
            int _544 = 31;
            int _1851 = _56(_540, _542, _544, _546, gl_SubgroupInvocationID);
            int _548 = _1851;
            int _550 = _464;
            int _552 = as_type<int>(_482);
            int _554 = 31;
            int _1855 = _56(_550, _552, _554, _556, gl_SubgroupInvocationID);
            int _558 = _1855;
            int _560 = _466;
            int _562 = as_type<int>(_482);
            int _564 = 31;
            int _1859 = _56(_560, _562, _564, _566, gl_SubgroupInvocationID);
            int _568 = _1859;
            int _570 = _468;
            int _572 = as_type<int>(_482);
            int _574 = 31;
            int _1863 = _56(_570, _572, _574, _576, gl_SubgroupInvocationID);
            int _578 = _1863;
            int _580 = _470;
            int _582 = as_type<int>(_482);
            int _584 = 31;
            int _1867 = _56(_580, _582, _584, _586, gl_SubgroupInvocationID);
            int _588 = _1867;
            int _590 = _472;
            int _592 = as_type<int>(_482);
            int _594 = 31;
            int _1871 = _56(_590, _592, _594, _596, gl_SubgroupInvocationID);
            int _598 = _1871;
            int _600 = _474;
            int _602 = as_type<int>(_482);
            int _604 = 31;
            int _1875 = _56(_600, _602, _604, _606, gl_SubgroupInvocationID);
            int _608 = _1875;
            bool _610 = !_484;
            _422 = _486;
            int _612 = _452;
            int _614 = _454;
            int _616 = _456;
            int _618 = _458;
            int _620 = _460;
            int _622 = _462;
            int _624 = _464;
            int _626 = _466;
            int _628 = _468;
            int _630 = _470;
            int _632 = _472;
            int _634 = _474;
            if (!_610)
            {
                float _636 = _358 * as_type<float>(_548);
                float _638 = _344 * as_type<float>(_508);
                float _640 = _360 * as_type<float>(_508);
                float _642 = _358 * as_type<float>(_508);
                float _644 = as_type<float>(_508) * _274;
                float _646 = _344 * as_type<float>(_548);
                float _648 = _360 * as_type<float>(_548);
                float _650 = as_type<float>(_548) * _274;
                float _652 = as_type<float>(_588) * _274;
                float _654 = fma(_340, as_type<float>(_538), _636);
                float _656 = _344 * as_type<float>(_588);
                float _658 = fma(_342, as_type<float>(_498), _638);
                float _660 = fma(_346, as_type<float>(_498), _640);
                float _662 = _358 * as_type<float>(_588);
                float _664 = fma(_340, as_type<float>(_498), _642);
                float _666 = fma(_342, as_type<float>(_538), _646);
                float _668 = fma(_346, as_type<float>(_538), _648);
                float _670 = fma(as_type<float>(_498), _272, _644);
                float _672 = fma(as_type<float>(_538), _272, _650);
                float _674 = _360 * as_type<float>(_588);
                float _676 = fma(as_type<float>(_578), _272, _652);
                float _678 = fma(_342, as_type<float>(_578), _656);
                float _680 = fma(_340, as_type<float>(_578), _662);
                float _682 = fma(_368, as_type<float>(_518), _658);
                float _684 = fma(_370, as_type<float>(_518), _660);
                float _686 = fma(_366, as_type<float>(_518), _664);
                float _688 = fma(_366, as_type<float>(_558), _654);
                float _690 = fma(_368, as_type<float>(_558), _666);
                float _692 = fma(_370, as_type<float>(_558), _668);
                float _694 = fma(_346, as_type<float>(_578), _674);
                float _696 = fma(as_type<float>(_518), _276, _670);
                float _698 = fma(as_type<float>(_558), _276, _672);
                float _700 = fma(as_type<float>(_598), _276, _676);
                float _702 = fma(_368, as_type<float>(_598), _678);
                float _704 = fma(_366, as_type<float>(_598), _680);
                float _706 = fma(_370, as_type<float>(_598), _694);
                float _708 = as_type<float>(_528) + _696;
                float _710 = as_type<float>(_568) + _698;
                float _712 = as_type<float>(_608) + _700;
                _612 = as_type<int>(_686);
                _614 = as_type<int>(_682);
                _616 = as_type<int>(_684);
                _618 = as_type<int>(_708);
                _620 = as_type<int>(_688);
                _622 = as_type<int>(_690);
                _624 = as_type<int>(_692);
                _626 = as_type<int>(_710);
                _628 = as_type<int>(_704);
                _630 = as_type<int>(_702);
                _632 = as_type<int>(_706);
                _634 = as_type<int>(_712);
            }
            _714 = _612;
            int _716 = _614;
            _718 = _616;
            _720 = _618;
            int _722 = _620;
            _724 = _622;
            _726 = _624;
            _728 = _626;
            int _730 = _628;
            _732 = _630;
            _734 = _632;
            _736 = _634;
            _448 = !_488;
            _424 = as_type<float>(_714);
            _426 = as_type<float>(_716);
            _428 = as_type<float>(_718);
            _430 = as_type<float>(_720);
            _432 = as_type<float>(_722);
            _434 = as_type<float>(_724);
            _436 = as_type<float>(_726);
            _438 = as_type<float>(_728);
            _440 = as_type<float>(_730);
            _442 = as_type<float>(_732);
            _444 = as_type<float>(_734);
            _446 = as_type<float>(_736);
            _738 = as_type<float>(_716);
            _740 = as_type<float>(_722);
            _742 = as_type<float>(_730);
        } while (_448);
        _744 = as_type<float>(_724);
        _746 = as_type<float>(_732);
        _748 = as_type<float>(_714);
        _750 = as_type<float>(_726);
        _354 = as_type<float>(_718);
        _752 = as_type<float>(_734);
        _754 = as_type<float>(_728);
        _756 = as_type<float>(_736);
        _758 = as_type<float>(_720);
        _760 = true;
    }
    else
    {
        _738 = _342;
        _744 = _344;
        _746 = _368;
        _748 = _340;
        _740 = _358;
        _742 = _366;
        _750 = _360;
        _752 = _370;
        _754 = _274;
        _756 = _276;
        _758 = _272;
    }
    _760 = false;
    float _762 = _738;
    float _764 = _744;
    float _766 = _746;
    float _768 = _748;
    float _770 = _740;
    float _772 = _742;
    float _774 = _750;
    float _776 = _354;
    float _778 = _752;
    float _780 = _754;
    float _782 = _756;
    float _784 = _758;
    int _786 = _390 + 80;
    uint _788 = uint(int(uint(_786) >> uint(2)));
    uint _790 = uint(int(uint(int(_788)) >> uint(2)));
    int _792 = int(_788) & 3;
    float _794 = (*spvDescriptorSet0.cp_c6)._m0[int(_790)][_792];
    int _796 = int(_788) + 1;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    int _800 = _796 & 3;
    float _802 = (*spvDescriptorSet0.cp_c6)._m0[int(_798)][_800];
    int _804 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _806 = _804 + _66;
    int _808 = _390 + 64;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.cp_c6)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.cp_c6)._m0[int(_820)][_822];
    int _826 = _390 + 88;
    uint _828 = uint(int(uint(_826) >> uint(2)));
    uint _830 = uint(int(uint(int(_828)) >> uint(2)));
    int _832 = int(_828) & 3;
    float _834 = (*spvDescriptorSet0.cp_c6)._m0[int(_830)][_832];
    int _836 = int(_828) + 1;
    uint _838 = uint(int(uint(_836) >> uint(2)));
    int _840 = _836 & 3;
    float _842 = (*spvDescriptorSet0.cp_c6)._m0[int(_838)][_840];
    int _844 = _390 + 72;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    uint _848 = uint(int(uint(int(_846)) >> uint(2)));
    int _850 = int(_846) & 3;
    float _852 = (*spvDescriptorSet0.cp_c6)._m0[int(_848)][_850];
    int _854 = int(_846) + 1;
    uint _856 = uint(int(uint(_854) >> uint(2)));
    int _858 = _854 & 3;
    float _860 = (*spvDescriptorSet0.cp_c6)._m0[int(_856)][_858];
    int _862 = _390 + 96;
    uint _864 = uint(int(uint(_862) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.cp_c6)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.cp_c6)._m0[int(_874)][_876];
    int _880 = _390 + 104;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    uint _884 = uint(int(uint(int(_882)) >> uint(2)));
    int _886 = int(_882) & 3;
    float _888 = (*spvDescriptorSet0.cp_c6)._m0[int(_884)][_886];
    int _890 = int(_882) + 1;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    int _894 = _890 & 3;
    float _896 = (*spvDescriptorSet0.cp_c6)._m0[int(_892)][_894];
    float _898 = _762 * _794;
    float _900 = _764 * _794;
    float _902 = _766 * _794;
    int _904 = _390 + 16;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    uint _908 = uint(int(uint(int(_906)) >> uint(2)));
    int _910 = int(_906) & 3;
    float _912 = (*spvDescriptorSet0.cp_c6)._m0[int(_908)][_910];
    int _914 = int(_906) + 1;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    int _918 = _914 & 3;
    float _920 = (*spvDescriptorSet0.cp_c6)._m0[int(_916)][_918];
    float _922 = _766 * _802;
    float _924 = fma(_768, _816, _898);
    float _926 = fma(_770, _816, _900);
    float _928 = fma(_772, _816, _902);
    float _930 = _762 * _802;
    int _932 = _390 + 32;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.cp_c6)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.cp_c6)._m0[int(_944)][_946];
    float _950 = _764 * _802;
    float _952 = fma(_772, _824, _922);
    float _954 = fma(_768, _824, _930);
    float _956 = _762 * _834;
    float _958 = _762 * _842;
    float _960 = _764 * _834;
    float _962 = _764 * _842;
    int _964 = _390 + 48;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    uint _968 = uint(int(uint(int(_966)) >> uint(2)));
    int _970 = int(_966) & 3;
    float _972 = (*spvDescriptorSet0.cp_c6)._m0[int(_968)][_970];
    int _974 = int(_966) + 1;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    int _978 = _974 & 3;
    float _980 = (*spvDescriptorSet0.cp_c6)._m0[int(_976)][_978];
    float _982 = _766 * _834;
    float _984 = _766 * _842;
    float _986 = fma(_770, _824, _950);
    float _988 = fma(_768, _852, _956);
    float _990 = fma(_768, _860, _958);
    float _992 = fma(_770, _852, _960);
    float _994 = fma(_770, _860, _962);
    int _996 = _390 + 24;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    uint _1000 = uint(int(uint(int(_998)) >> uint(2)));
    int _1002 = int(_998) & 3;
    float _1004 = (*spvDescriptorSet0.cp_c6)._m0[int(_1000)][_1002];
    int _1006 = int(_998) + 1;
    uint _1008 = uint(int(uint(_1006) >> uint(2)));
    int _1010 = _1006 & 3;
    float _1012 = (*spvDescriptorSet0.cp_c6)._m0[int(_1008)][_1010];
    float _1014 = fma(_772, _852, _982);
    float _1016 = fma(_772, _860, _984);
    float _1018 = fma(_774, _870, _926);
    float _1020 = fma(_776, _870, _924);
    float _1022 = fma(_776, _878, _954);
    float _1024 = fma(_778, _870, _928);
    int _1026 = _390 + 56;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    uint _1030 = uint(int(uint(int(_1028)) >> uint(2)));
    int _1032 = int(_1028) & 3;
    float _1034 = (*spvDescriptorSet0.cp_c6)._m0[int(_1030)][_1032];
    int _1036 = int(_1028) + 1;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    int _1040 = _1036 & 3;
    float _1042 = (*spvDescriptorSet0.cp_c6)._m0[int(_1038)][_1040];
    float _1044 = fma(_774, _878, _986);
    float _1046 = fma(_778, _878, _952);
    float _1048 = fma(_774, _896, _994);
    float _1050 = fma(_776, _888, _988);
    float _1052 = fma(_776, _896, _990);
    float _1054 = fma(_778, _896, _1016);
    int _1056 = _390 + 40;
    uint _1058 = uint(int(uint(_1056) >> uint(2)));
    uint _1060 = uint(int(uint(int(_1058)) >> uint(2)));
    int _1062 = int(_1058) & 3;
    float _1064 = (*spvDescriptorSet0.cp_c6)._m0[int(_1060)][_1062];
    int _1066 = int(_1058) + 1;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    int _1070 = _1066 & 3;
    float _1072 = (*spvDescriptorSet0.cp_c6)._m0[int(_1068)][_1070];
    float _1074 = fma(_774, _888, _992);
    float _1076 = _1048 + _780;
    float _1078 = fma(_778, _888, _1014);
    float _1080 = _1054 + _782;
    float _1082 = _1052 + _784;
    float _1084 = _1018 * _920;
    float _1086 = _1044 * _920;
    float _1088 = _1074 * _920;
    float _1090 = _1076 * _920;
    float _1092 = fma(_1020, _912, _1084);
    float _1094 = fma(_1022, _912, _1086);
    float _1096 = fma(_1050, _912, _1088);
    float _1098 = fma(_1082, _912, _1090);
    float _1100 = _1076 * _948;
    float _1102 = _1018 * _948;
    float _1104 = _1044 * _948;
    float _1106 = _1074 * _948;
    float _1108 = fma(_1082, _940, _1100);
    float _1110 = fma(_1020, _940, _1102);
    float _1112 = fma(_1022, _940, _1104);
    float _1114 = fma(_1050, _940, _1106);
    float _1116 = _1076 * _980;
    float _1118 = _1018 * _980;
    float _1120 = _1044 * _980;
    float _1122 = _1074 * _980;
    float _1124 = fma(_1082, _972, _1116);
    float _1126 = fma(_1020, _972, _1118);
    float _1128 = fma(_1022, _972, _1120);
    float _1130 = fma(_1050, _972, _1122);
    float _1132 = fma(_1046, _1004, _1094);
    int _1134 = _806 * 48;
    float _1136 = fma(_1080, _1004, _1098);
    float _1138 = fma(_1024, _1004, _1092);
    float _1140 = fma(_1078, _1004, _1096);
    float _1142 = _1136 + _1012;
    float _1144 = fma(_1080, _1034, _1124);
    float _1146 = fma(_1046, _1034, _1128);
    float _1148 = fma(_1078, _1034, _1130);
    float _1150 = fma(_1080, _1064, _1108);
    float _1152 = fma(_1024, _1064, _1110);
    float _1154 = fma(_1046, _1064, _1112);
    float _1156 = fma(_1024, _1034, _1126);
    float _1158 = _1144 + _1042;
    int _1160 = _1134 + 16;
    float _1162 = fma(_1078, _1064, _1114);
    float _1164 = _1150 + _1072;
    int _1166 = _1134 + 32;
    int _1168 = _1134 + 48;
    uint _1170 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1138);
    int _1172 = _1160 + 4;
    uint _1174 = uint(int(uint(_1172) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1174)] = as_type<uint>(_1132);
    int _1176 = _1160 + 8;
    uint _1178 = uint(int(uint(_1176) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1178)] = as_type<uint>(_1140);
    int _1180 = _1160 + 12;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1182)] = as_type<uint>(_1142);
    uint _1184 = uint(int(uint(_1166) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1184)] = as_type<uint>(_1152);
    int _1186 = _1166 + 4;
    uint _1188 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1188)] = as_type<uint>(_1154);
    int _1190 = _1166 + 8;
    uint _1192 = uint(int(uint(_1190) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1192)] = as_type<uint>(_1162);
    int _1194 = _1166 + 12;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1196)] = as_type<uint>(_1164);
    uint _1198 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1198)] = as_type<uint>(_1156);
    int _1200 = _1168 + 4;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1202)] = as_type<uint>(_1146);
    int _1204 = _1168 + 8;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1206)] = as_type<uint>(_1148);
    int _1208 = _1168 + 12;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1210)] = as_type<uint>(_1158);
}

