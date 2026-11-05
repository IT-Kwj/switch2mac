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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _54(thread const int& _2939, thread const int& _2940, constant _10& support_buffer)
{
    int _2943 = 1 + _2940;
    float _2945 = support_buffer._m5[_2943].x;
    bool _2947 = _2945 == 1.0;
    if (_2947)
    {
        return _2939;
    }
    float _2949 = float(_2939);
    float _2951 = _2949 * _2945;
    int _2953 = int(_2951);
    return _2953;
}

static inline __attribute__((always_inline))
int _56(thread const int& _2974, thread const int& _2975, thread const int& _2976, thread int& _2977, thread uint& gl_SubgroupInvocationID)
{
    int _2980 = _2976 & 31;
    uint _2982 = uint(int(uint(_2976) >> uint(8)));
    int _2984 = int(_2982) & 31;
    float _2986 = as_type<float>(gl_SubgroupInvocationID);
    int _2988 = as_type<int>(_2986) & _2984;
    int _2990 = ~_2984;
    int _2992 = _2980 & _2990;
    int _2994 = _2992 | _2988;
    int _2996 = ~_2984;
    int _2998 = _2975 & _2996;
    int _3000 = _2998 | _2988;
    bool _3002 = uint(_3000) <= uint(_2994);
    _2977 = _3002 ? (-1) : 0;
    float _3004 = spvSubgroupShuffle(as_type<float>(_2974), uint(_3000));
    uint _3006 = uint(_3002 ? as_type<int>(_3004) : _2974);
    return int(_3006);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    bool _748 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = int(_75) + 1;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    int _87 = _83 & 3;
    float _89 = (*spvDescriptorSet0.cp_c5)._m0[int(_85)][_87];
    int _91 = _66;
    int _93 = 0;
    int _95 = _54(_91, _93, (*spvDescriptorSet0.support_buffer));
    int _97 = as_type<int>(_81);
    int _99 = 0;
    int _101 = _54(_97, _99, (*spvDescriptorSet0.support_buffer));
    int3 _1270 = int3(_95, _101, 1);
    float4 _104 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1270.xy), uint(_1270.z), 0).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    int _114 = _66;
    int _116 = 0;
    int _118 = _54(_114, _116, (*spvDescriptorSet0.support_buffer));
    int _120 = as_type<int>(_89);
    int _122 = 0;
    int _124 = _54(_120, _122, (*spvDescriptorSet0.support_buffer));
    int3 _1290 = int3(_118, _124, 1);
    float4 _126 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1290.xy), uint(_1290.z), 0).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    int _136 = _66;
    int _138 = 0;
    int _140 = _54(_136, _138, (*spvDescriptorSet0.support_buffer));
    int _142 = as_type<int>(_81);
    int _144 = 0;
    int _146 = _54(_142, _144, (*spvDescriptorSet0.support_buffer));
    int3 _1310 = int3(_140, _146, 0);
    float3 _150 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1310.xy), uint(_1310.z), 0).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    int _158 = _66;
    int _160 = 0;
    int _162 = _54(_158, _160, (*spvDescriptorSet0.support_buffer));
    int _164 = as_type<int>(_89);
    int _166 = 0;
    int _168 = _54(_164, _166, (*spvDescriptorSet0.support_buffer));
    int3 _1328 = int3(_162, _168, 0);
    float3 _170 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1328.xy), uint(_1328.z), 0).xyz;
    float _172 = _170.x;
    float _174 = _170.y;
    float _176 = _170.z;
    int _178 = _66;
    int _180 = 0;
    int _182 = _54(_178, _180, (*spvDescriptorSet0.support_buffer));
    int _184 = as_type<int>(_81);
    int _186 = 0;
    int _188 = _54(_184, _186, (*spvDescriptorSet0.support_buffer));
    int3 _1346 = int3(_182, _188, 2);
    float3 _190 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1346.xy), uint(_1346.z), 0).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    int _198 = _66;
    int _200 = 0;
    int _202 = _54(_198, _200, (*spvDescriptorSet0.support_buffer));
    int _204 = as_type<int>(_89);
    int _206 = 0;
    int _208 = _54(_204, _206, (*spvDescriptorSet0.support_buffer));
    int3 _1364 = int3(_202, _208, 2);
    float3 _210 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1364.xy), uint(_1364.z), 0).xyz;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    int _218 = _72 + 16;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    uint _222 = uint(int(uint(int(_220)) >> uint(2)));
    int _224 = int(_220) & 3;
    float _226 = (*spvDescriptorSet0.cp_c5)._m0[int(_222)][_224];
    bool _228 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _230 = -_106;
    float _232 = _230 + _128;
    float _234 = -_112;
    float _236 = _234 + _134;
    float _238 = fma(_232, _226, _106);
    float _240 = fma(_236, _226, _112);
    float _242 = -_108;
    float _244 = _242 + _130;
    float _246 = -_110;
    float _248 = _246 + _132;
    float _250 = _240 * 2.0;
    float _252 = fma(_244, _226, _108);
    float _254 = fma(_248, _226, _110);
    bool _256 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _258 = _238 * 2.0;
    float _260 = _252 * _250;
    float _262 = _254 * _250;
    float _264 = _252 * 2.0;
    float _266 = _238 * _250;
    float _268 = fma(_254, _258, _260);
    float _270 = -_262;
    float _272 = fma(_252, _258, _270);
    float _274 = fma(_252, _258, _262);
    float _276 = -_260;
    float _278 = fma(_254, _258, _276);
    float _280 = -_152;
    float _282 = _280 + _172;
    float _284 = -_266;
    float _286 = fma(_254, _264, _284);
    float _288 = fma(_254, _264, _266);
    float _290 = _252 * _252;
    float _292 = fma(_282, _226, _152);
    float _294 = -_154;
    float _296 = _294 + _174;
    float _298 = _238 * _238;
    float _300 = _254 * _254;
    float _302 = fma(_290, -2.0, 1.0);
    float _304 = fma(_296, _226, _154);
    float _306 = fma(_298, -2.0, 1.0);
    float _308 = _292 * _278;
    float _310 = -_156;
    float _312 = _310 + _176;
    float _314 = -_194;
    float _316 = _314 + _214;
    float _318 = fma(_300, -2.0, _302);
    float _320 = -_192;
    float _322 = _320 + _212;
    float _324 = -_196;
    float _326 = _324 + _216;
    float _328 = fma(_300, -2.0, _306);
    float _330 = fma(_290, -2.0, _306);
    float _332 = fma(_312, _226, _156);
    float _334 = _292 * _318;
    float _336 = fma(_322, _226, _192);
    float _338 = fma(_316, _226, _194);
    float _340 = fma(_326, _226, _196);
    float _342 = _292 * _274;
    float _344 = _304 * _328;
    float _346 = _304 * _272;
    float _348 = _304 * _288;
    float _350 = _332 * _268;
    float _352 = _332 * _286;
    float _354 = _332 * _330;
    float _356 = _350;
    float _358 = _336;
    if (!_256)
    {
        int _360 = _66 * 48;
        int _362 = _360 + 16;
        uint _364 = uint(int(uint(_360) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_364)] = as_type<uint>(_334);
        int _366 = _360 + 4;
        uint _368 = uint(int(uint(_366) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_368)] = as_type<uint>(_346);
        int _370 = _360 + 8;
        uint _372 = uint(int(uint(_370) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_372)] = as_type<uint>(_350);
        int _374 = _360 + 12;
        uint _376 = uint(int(uint(_374) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_376)] = as_type<uint>(_336);
        int _378 = _360 + 32;
        uint _380 = uint(int(uint(_362) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_380)] = as_type<uint>(_342);
        int _382 = _362 + 4;
        uint _384 = uint(int(uint(_382) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_384)] = as_type<uint>(_344);
        int _386 = _362 + 8;
        uint _388 = uint(int(uint(_386) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_388)] = as_type<uint>(_352);
        int _390 = _362 + 12;
        uint _392 = uint(int(uint(_390) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_392)] = as_type<uint>(_338);
        uint _394 = uint(int(uint(_378) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_394)] = as_type<uint>(_308);
        int _396 = _378 + 4;
        uint _398 = uint(int(uint(_396) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_398)] = as_type<uint>(_348);
        int _400 = _378 + 8;
        uint _402 = uint(int(uint(_400) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_402)] = as_type<uint>(_354);
        int _404 = _378 + 12;
        uint _406 = uint(int(uint(_404) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_406)] = as_type<uint>(_340);
    }
    int _408 = _66 * 112;
    bool _410 = !_228;
    float _728;
    float _730;
    float _732;
    float _734;
    float _736;
    float _738;
    float _740;
    float _742;
    float _744;
    float _746;
    if (!_410)
    {
        int _412 = 0;
        float _414 = _334;
        float _416 = _346;
        float _418 = _350;
        float _420 = _336;
        float _422 = _342;
        float _424 = _344;
        float _426 = _352;
        float _428 = _338;
        float _430 = _308;
        float _432 = _348;
        float _434 = _354;
        float _436 = _340;
        bool _438;
        int _486;
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
        int _704;
        int _708;
        int _710;
        int _714;
        int _716;
        int _718;
        int _722;
        int _724;
        int _726;
        do
        {
            int _440 = _412;
            int _442 = as_type<int>(_414);
            int _444 = as_type<int>(_416);
            int _446 = as_type<int>(_418);
            int _448 = as_type<int>(_420);
            int _450 = as_type<int>(_422);
            int _452 = as_type<int>(_424);
            int _454 = as_type<int>(_426);
            int _456 = as_type<int>(_428);
            int _458 = as_type<int>(_430);
            int _460 = as_type<int>(_432);
            int _462 = as_type<int>(_434);
            int _464 = as_type<int>(_436);
            uint _466 = uint(int(uint(_408) >> uint(2)));
            uint _468 = uint(int(uint(int(_466)) >> uint(2)));
            int _470 = int(_466) & 3;
            float _472 = (*spvDescriptorSet0.cp_c6)._m0[int(_468)][_470];
            bool _474 = _66 != 0;
            int _476 = _440 + 1;
            bool _478 = uint(_476) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
            int _480 = _442;
            int _482 = as_type<int>(_472);
            int _484 = 31;
            int _1798 = _56(_480, _482, _484, _486, gl_SubgroupInvocationID);
            int _488 = _1798;
            int _490 = _444;
            int _492 = as_type<int>(_472);
            int _494 = 31;
            int _1802 = _56(_490, _492, _494, _496, gl_SubgroupInvocationID);
            int _498 = _1802;
            int _500 = _446;
            int _502 = as_type<int>(_472);
            int _504 = 31;
            int _1806 = _56(_500, _502, _504, _506, gl_SubgroupInvocationID);
            int _508 = _1806;
            int _510 = _448;
            int _512 = as_type<int>(_472);
            int _514 = 31;
            int _1810 = _56(_510, _512, _514, _516, gl_SubgroupInvocationID);
            int _518 = _1810;
            int _520 = _450;
            int _522 = as_type<int>(_472);
            int _524 = 31;
            int _1814 = _56(_520, _522, _524, _526, gl_SubgroupInvocationID);
            int _528 = _1814;
            int _530 = _452;
            int _532 = as_type<int>(_472);
            int _534 = 31;
            int _1818 = _56(_530, _532, _534, _536, gl_SubgroupInvocationID);
            int _538 = _1818;
            int _540 = _454;
            int _542 = as_type<int>(_472);
            int _544 = 31;
            int _1822 = _56(_540, _542, _544, _546, gl_SubgroupInvocationID);
            int _548 = _1822;
            int _550 = _456;
            int _552 = as_type<int>(_472);
            int _554 = 31;
            int _1826 = _56(_550, _552, _554, _556, gl_SubgroupInvocationID);
            int _558 = _1826;
            int _560 = _458;
            int _562 = as_type<int>(_472);
            int _564 = 31;
            int _1830 = _56(_560, _562, _564, _566, gl_SubgroupInvocationID);
            int _568 = _1830;
            int _570 = _460;
            int _572 = as_type<int>(_472);
            int _574 = 31;
            int _1834 = _56(_570, _572, _574, _576, gl_SubgroupInvocationID);
            int _578 = _1834;
            int _580 = _462;
            int _582 = as_type<int>(_472);
            int _584 = 31;
            int _1838 = _56(_580, _582, _584, _586, gl_SubgroupInvocationID);
            int _588 = _1838;
            int _590 = _464;
            int _592 = as_type<int>(_472);
            int _594 = 31;
            int _1842 = _56(_590, _592, _594, _596, gl_SubgroupInvocationID);
            int _598 = _1842;
            bool _600 = !_474;
            _412 = _476;
            int _602 = _442;
            int _604 = _444;
            int _606 = _446;
            int _608 = _448;
            int _610 = _450;
            int _612 = _452;
            int _614 = _454;
            int _616 = _456;
            int _618 = _458;
            int _620 = _460;
            int _622 = _462;
            int _624 = _464;
            if (!_600)
            {
                float _626 = _338 * as_type<float>(_538);
                float _628 = _344 * as_type<float>(_538);
                float _630 = _352 * as_type<float>(_538);
                float _632 = _344 * as_type<float>(_498);
                float _634 = _342 * as_type<float>(_498);
                float _636 = _352 * as_type<float>(_498);
                float _638 = _338 * as_type<float>(_498);
                float _640 = fma(_336, as_type<float>(_528), _626);
                float _642 = fma(_346, as_type<float>(_528), _628);
                float _644 = _338 * as_type<float>(_578);
                float _646 = fma(_350, as_type<float>(_528), _630);
                float _648 = _344 * as_type<float>(_578);
                float _650 = fma(_346, as_type<float>(_488), _632);
                float _652 = _342 * as_type<float>(_538);
                float _654 = _342 * as_type<float>(_578);
                float _656 = fma(_334, as_type<float>(_488), _634);
                float _658 = fma(_350, as_type<float>(_488), _636);
                float _660 = fma(_336, as_type<float>(_488), _638);
                float _662 = _352 * as_type<float>(_578);
                float _664 = fma(_336, as_type<float>(_568), _644);
                float _666 = fma(_346, as_type<float>(_568), _648);
                float _668 = fma(_334, as_type<float>(_528), _652);
                float _670 = fma(_334, as_type<float>(_568), _654);
                float _672 = fma(_348, as_type<float>(_508), _650);
                float _674 = fma(_308, as_type<float>(_508), _656);
                float _676 = fma(_354, as_type<float>(_508), _658);
                float _678 = fma(_354, as_type<float>(_548), _646);
                float _680 = fma(_350, as_type<float>(_568), _662);
                float _682 = fma(_340, as_type<float>(_508), _660);
                float _684 = fma(_340, as_type<float>(_548), _640);
                float _686 = fma(_340, as_type<float>(_588), _664);
                float _688 = fma(_308, as_type<float>(_548), _668);
                float _690 = fma(_348, as_type<float>(_548), _642);
                float _692 = fma(_308, as_type<float>(_588), _670);
                float _694 = fma(_348, as_type<float>(_588), _666);
                float _696 = fma(_354, as_type<float>(_588), _680);
                float _698 = as_type<float>(_518) + _682;
                float _700 = as_type<float>(_558) + _684;
                float _702 = as_type<float>(_598) + _686;
                _602 = as_type<int>(_674);
                _604 = as_type<int>(_672);
                _606 = as_type<int>(_676);
                _608 = as_type<int>(_698);
                _610 = as_type<int>(_688);
                _612 = as_type<int>(_690);
                _614 = as_type<int>(_678);
                _616 = as_type<int>(_700);
                _618 = as_type<int>(_692);
                _620 = as_type<int>(_694);
                _622 = as_type<int>(_696);
                _624 = as_type<int>(_702);
            }
            _704 = _602;
            int _706 = _604;
            _708 = _606;
            _710 = _608;
            int _712 = _610;
            _714 = _612;
            _716 = _614;
            _718 = _616;
            int _720 = _618;
            _722 = _620;
            _724 = _622;
            _726 = _624;
            _438 = !_478;
            _414 = as_type<float>(_704);
            _416 = as_type<float>(_706);
            _418 = as_type<float>(_708);
            _420 = as_type<float>(_710);
            _422 = as_type<float>(_712);
            _424 = as_type<float>(_714);
            _426 = as_type<float>(_716);
            _428 = as_type<float>(_718);
            _430 = as_type<float>(_720);
            _432 = as_type<float>(_722);
            _434 = as_type<float>(_724);
            _436 = as_type<float>(_726);
            _728 = as_type<float>(_706);
            _730 = as_type<float>(_712);
            _732 = as_type<float>(_720);
        } while (_438);
        _734 = as_type<float>(_714);
        _736 = as_type<float>(_722);
        _738 = as_type<float>(_704);
        _356 = as_type<float>(_708);
        _740 = as_type<float>(_716);
        _742 = as_type<float>(_724);
        _744 = as_type<float>(_718);
        _746 = as_type<float>(_726);
        _358 = as_type<float>(_710);
        _748 = true;
    }
    else
    {
        _728 = _346;
        _734 = _344;
        _736 = _348;
        _738 = _334;
        _730 = _342;
        _732 = _308;
        _740 = _352;
        _742 = _354;
        _744 = _338;
        _746 = _340;
    }
    _748 = false;
    float _750 = _728;
    float _752 = _734;
    float _754 = _736;
    float _756 = _738;
    float _758 = _730;
    float _760 = _732;
    float _762 = _356;
    float _764 = _740;
    float _766 = _742;
    float _768 = _744;
    float _770 = _746;
    float _772 = _358;
    int _774 = _408 + 80;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.cp_c6)._m0[int(_778)][_780];
    int _784 = int(_776) + 1;
    uint _786 = uint(int(uint(_784) >> uint(2)));
    int _788 = _784 & 3;
    float _790 = (*spvDescriptorSet0.cp_c6)._m0[int(_786)][_788];
    int _792 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _794 = _792 + _66;
    int _796 = _408 + 64;
    uint _798 = uint(int(uint(_796) >> uint(2)));
    uint _800 = uint(int(uint(int(_798)) >> uint(2)));
    int _802 = int(_798) & 3;
    float _804 = (*spvDescriptorSet0.cp_c6)._m0[int(_800)][_802];
    int _806 = int(_798) + 1;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    int _810 = _806 & 3;
    float _812 = (*spvDescriptorSet0.cp_c6)._m0[int(_808)][_810];
    int _814 = _408 + 88;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.cp_c6)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.cp_c6)._m0[int(_826)][_828];
    int _832 = _408 + 72;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.cp_c6)._m0[int(_836)][_838];
    int _842 = int(_834) + 1;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    int _846 = _842 & 3;
    float _848 = (*spvDescriptorSet0.cp_c6)._m0[int(_844)][_846];
    int _850 = _408 + 96;
    uint _852 = uint(int(uint(_850) >> uint(2)));
    uint _854 = uint(int(uint(int(_852)) >> uint(2)));
    int _856 = int(_852) & 3;
    float _858 = (*spvDescriptorSet0.cp_c6)._m0[int(_854)][_856];
    int _860 = int(_852) + 1;
    uint _862 = uint(int(uint(_860) >> uint(2)));
    int _864 = _860 & 3;
    float _866 = (*spvDescriptorSet0.cp_c6)._m0[int(_862)][_864];
    int _868 = _408 + 104;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    uint _872 = uint(int(uint(int(_870)) >> uint(2)));
    int _874 = int(_870) & 3;
    float _876 = (*spvDescriptorSet0.cp_c6)._m0[int(_872)][_874];
    int _878 = int(_870) + 1;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    int _882 = _878 & 3;
    float _884 = (*spvDescriptorSet0.cp_c6)._m0[int(_880)][_882];
    float _886 = _750 * _782;
    float _888 = _752 * _782;
    float _890 = _754 * _782;
    int _892 = _408 + 16;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    uint _896 = uint(int(uint(int(_894)) >> uint(2)));
    int _898 = int(_894) & 3;
    float _900 = (*spvDescriptorSet0.cp_c6)._m0[int(_896)][_898];
    int _902 = int(_894) + 1;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    int _906 = _902 & 3;
    float _908 = (*spvDescriptorSet0.cp_c6)._m0[int(_904)][_906];
    float _910 = _750 * _790;
    float _912 = _754 * _790;
    float _914 = fma(_756, _804, _886);
    float _916 = fma(_758, _804, _888);
    float _918 = fma(_760, _804, _890);
    float _920 = _752 * _790;
    int _922 = _408 + 32;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.cp_c6)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.cp_c6)._m0[int(_934)][_936];
    float _940 = fma(_756, _812, _910);
    float _942 = fma(_760, _812, _912);
    float _944 = fma(_758, _812, _920);
    float _946 = _750 * _822;
    float _948 = _752 * _822;
    float _950 = _750 * _830;
    float _952 = _752 * _830;
    int _954 = _408 + 48;
    uint _956 = uint(int(uint(_954) >> uint(2)));
    uint _958 = uint(int(uint(int(_956)) >> uint(2)));
    int _960 = int(_956) & 3;
    float _962 = (*spvDescriptorSet0.cp_c6)._m0[int(_958)][_960];
    int _964 = int(_956) + 1;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    int _968 = _964 & 3;
    float _970 = (*spvDescriptorSet0.cp_c6)._m0[int(_966)][_968];
    float _972 = _754 * _822;
    float _974 = _754 * _830;
    float _976 = fma(_756, _840, _946);
    float _978 = fma(_758, _840, _948);
    float _980 = fma(_756, _848, _950);
    float _982 = fma(_758, _848, _952);
    int _984 = _408 + 24;
    uint _986 = uint(int(uint(_984) >> uint(2)));
    uint _988 = uint(int(uint(int(_986)) >> uint(2)));
    int _990 = int(_986) & 3;
    float _992 = (*spvDescriptorSet0.cp_c6)._m0[int(_988)][_990];
    int _994 = int(_986) + 1;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    int _998 = _994 & 3;
    float _1000 = (*spvDescriptorSet0.cp_c6)._m0[int(_996)][_998];
    float _1002 = fma(_760, _840, _972);
    float _1004 = fma(_760, _848, _974);
    float _1006 = fma(_762, _858, _914);
    float _1008 = fma(_764, _858, _916);
    float _1010 = fma(_766, _858, _918);
    float _1012 = fma(_764, _866, _944);
    int _1014 = _408 + 40;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.cp_c6)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.cp_c6)._m0[int(_1026)][_1028];
    float _1032 = fma(_762, _866, _940);
    float _1034 = fma(_766, _866, _942);
    float _1036 = fma(_762, _876, _976);
    float _1038 = fma(_764, _884, _982);
    float _1040 = fma(_766, _884, _1004);
    float _1042 = fma(_762, _884, _980);
    int _1044 = _408 + 56;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.cp_c6)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.cp_c6)._m0[int(_1056)][_1058];
    float _1062 = fma(_764, _876, _978);
    float _1064 = _1038 + _768;
    float _1066 = _1040 + _770;
    float _1068 = fma(_766, _876, _1002);
    float _1070 = _1042 + _772;
    float _1072 = _1012 * _908;
    float _1074 = _1008 * _908;
    float _1076 = _1062 * _908;
    float _1078 = _1064 * _908;
    float _1080 = fma(_1032, _900, _1072);
    float _1082 = fma(_1006, _900, _1074);
    float _1084 = fma(_1036, _900, _1076);
    float _1086 = fma(_1070, _900, _1078);
    float _1088 = _1064 * _938;
    float _1090 = _1012 * _938;
    float _1092 = _1008 * _938;
    float _1094 = _1062 * _938;
    float _1096 = fma(_1070, _930, _1088);
    float _1098 = fma(_1032, _930, _1090);
    float _1100 = fma(_1006, _930, _1092);
    float _1102 = fma(_1036, _930, _1094);
    float _1104 = _1064 * _970;
    float _1106 = _1012 * _970;
    float _1108 = _1008 * _970;
    float _1110 = _1062 * _970;
    float _1112 = fma(_1070, _962, _1104);
    float _1114 = fma(_1032, _962, _1106);
    float _1116 = fma(_1006, _962, _1108);
    float _1118 = fma(_1036, _962, _1110);
    float _1120 = fma(_1034, _992, _1080);
    int _1122 = _794 * 48;
    float _1124 = fma(_1066, _992, _1086);
    float _1126 = fma(_1010, _992, _1082);
    float _1128 = fma(_1068, _992, _1084);
    float _1130 = _1124 + _1000;
    int _1132 = _1122 + 32;
    float _1134 = fma(_1066, _1022, _1096);
    float _1136 = fma(_1034, _1022, _1098);
    float _1138 = fma(_1010, _1022, _1100);
    float _1140 = fma(_1068, _1022, _1102);
    float _1142 = _1134 + _1030;
    float _1144 = fma(_1066, _1052, _1112);
    float _1146 = fma(_1034, _1052, _1114);
    int _1148 = _1122 + 16;
    float _1150 = fma(_1010, _1052, _1116);
    float _1152 = fma(_1068, _1052, _1118);
    float _1154 = _1144 + _1060;
    int _1156 = _1122 + 48;
    uint _1158 = uint(int(uint(_1148) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1158)] = as_type<uint>(_1126);
    int _1160 = _1148 + 4;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1162)] = as_type<uint>(_1120);
    int _1164 = _1148 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1166)] = as_type<uint>(_1128);
    int _1168 = _1148 + 12;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1170)] = as_type<uint>(_1130);
    uint _1172 = uint(int(uint(_1132) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1172)] = as_type<uint>(_1138);
    int _1174 = _1132 + 4;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1176)] = as_type<uint>(_1136);
    int _1178 = _1132 + 8;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1180)] = as_type<uint>(_1140);
    int _1182 = _1132 + 12;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1184)] = as_type<uint>(_1142);
    uint _1186 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1186)] = as_type<uint>(_1150);
    int _1188 = _1156 + 4;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1190)] = as_type<uint>(_1146);
    int _1192 = _1156 + 8;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1194)] = as_type<uint>(_1152);
    int _1196 = _1156 + 12;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1198)] = as_type<uint>(_1154);
}

