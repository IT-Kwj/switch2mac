#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

// Implementation of the unsigned GLSL findMSB() function
template<typename T>
inline T spvFindUMSB(T x)
{
    return select(clz(T(0)) - (clz(x) + T(1)), T(-1), x == T(0));
}

inline uint4 spvSubgroupBallot(bool value)
{
    simd_vote vote = simd_ballot(value);
    // simd_ballot() returns a 64-bit integer-like object, but
    // SPIR-V callers expect a uint4. We must convert.
    // FIXME: This won't include higher bits if Apple ever supports
    // 128 lanes in an SIMD-group.
    return uint4(as_type<uint2>((simd_vote::vote_t)vote), 0, 0);
}

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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    device _27* cp_s0 [[id(4)]];
    device _27* cp_s1 [[id(5)]];
    device _27* cp_s2 [[id(6)]];
    device _27* cp_s3 [[id(7)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _2093, thread const int& _2094, thread const int& _2095, thread int& _2096, thread uint& gl_SubgroupInvocationID)
{
    int _2099 = _2095 & 31;
    uint _2101 = uint(int(uint(_2095) >> uint(8)));
    int _2103 = int(_2101) & 31;
    float _2105 = as_type<float>(gl_SubgroupInvocationID);
    int _2107 = as_type<int>(_2105) & _2103;
    int _2109 = ~_2103;
    int _2111 = _2099 & _2109;
    int _2113 = _2111 | _2107;
    int _2115 = ~_2103;
    int _2117 = _2094 & _2115;
    int _2119 = _2117 | _2107;
    bool _2121 = uint(_2119) <= uint(_2113);
    _2096 = _2121 ? (-1) : 0;
    float _2123 = spvSubgroupShuffle(as_type<float>(_2093), uint(_2119));
    uint _2125 = uint(_2121 ? as_type<int>(_2123) : _2093);
    return int(_2125);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _59 = as_type<float>(gl_WorkGroupID.x);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    int _63 = as_type<int>(_59) << 6;
    int _65 = _63 + as_type<int>(_61);
    bool _69 = uint(_65) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    if (_69)
    {
        return;
    }
    int _71 = _65 * 48;
    int _73 = _71 + 16;
    uint _76 = uint(int(uint(_71) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_76)]);
    int _80 = _71 + 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_82)]);
    int _86 = _71 + 8;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_88)]);
    int _92 = _71 + 12;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_94)]);
    uint _98 = uint(int(uint(_73) >> uint(2)));
    float _100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_98)]);
    int _102 = _73 + 4;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_104)]);
    int _108 = _73 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_110)]);
    int _114 = _73 + 12;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_116)]);
    float _120 = _84 + _106;
    float _122 = _78 + _100;
    float _124 = _90 + _112;
    float _126 = _120 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _128 = _120 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _130 = _120 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _132 = _120 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _134 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[1].x, _126);
    float _136 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[0].x, _128);
    float _138 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[2].x, _130);
    float _140 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[3].x, _132);
    float _142 = fma(_124, (*spvDescriptorSet0.cp_c3)._m0[1].z, _134);
    float _144 = fma(_124, (*spvDescriptorSet0.cp_c3)._m0[0].z, _136);
    float _146 = fma(_124, (*spvDescriptorSet0.cp_c3)._m0[2].z, _138);
    float _148 = fma(_124, (*spvDescriptorSet0.cp_c3)._m0[3].z, _140);
    float _150 = _142 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _152 = _144 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _154 = _146 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _156 = _148 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _158 = _150 >= _118;
    bool _160 = isnan(_150);
    bool _162 = _158 || _160;
    bool _164 = isnan(_118);
    bool _166 = _162 || _164;
    bool _168 = _152 < _118;
    bool _170 = !_166;
    bool _172 = _168 && _170;
    bool _174 = _154 < _118;
    bool _176 = _174 && _172;
    bool _178 = _156 < _118;
    bool _180 = _178 && _176;
    if (!_180)
    {
        return;
    }
    float _182 = -_120;
    float _184 = _182 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _186 = -_122;
    float _188 = _186 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _190 = -_124;
    float _192 = _190 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _194 = _184 * _184;
    float _196 = fma(_188, _188, _194);
    float _198 = fma(_192, _192, _196);
    bool _200 = _198 > (*spvDescriptorSet0.cp_c5)._m0[0].y;
    if (_200)
    {
        return;
    }
    float _202 = as_type<float>(gl_SubgroupInvocationID);
    uint _204 = spvSubgroupBallot(true).x;
    int _206 = _71 + 32;
    int _208 = int(spvFindUMSB(_204));
    int _210 = _71 + 36;
    int _212 = _71 + 40;
    int _214 = _71 + 44;
    uint _216 = uint(int(uint(_206) >> uint(2)));
    float _218 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_216)]);
    int _220 = popcount(int(_204));
    uint _222 = uint(int(uint(_210) >> uint(2)));
    float _224 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_222)]);
    uint _226 = uint(int(uint(_212) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_226)]);
    uint _230 = uint(int(uint(_214) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_230)]);
    bool _234 = _208 == as_type<int>(_202);
    int _236 = _220;
    if (_234)
    {
        uint _1122 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s1)._m0[0], uint(_220), memory_order_relaxed);
        uint _238 = _1122;
        _236 = int(_238);
    }
    int _240 = _236;
    float _242 = as_type<float>(gl_SubgroupLtMask.x);
    int _244 = as_type<int>(_242) & int(_204);
    int _246 = popcount(_244);
    int _248 = as_type<int>(_218) << 2;
    int _250 = _248 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[54].x);
    bool _252 = uint(_250) < uint(_248);
    int _254 = int(_252);
    int _256 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[54].y) + _254;
    int _258 = _240;
    int _260 = _208;
    int _262 = 31;
    int _264;
    int _1161 = _55(_258, _260, _262, _264, gl_SubgroupInvocationID);
    int _266 = _1161;
    uint _268 = spvSubgroupBallot(true).x;
    float _270 = spvSubgroupShuffle(as_type<float>(_250), 0u);
    bool _272 = as_type<int>(_270) == _250;
    float _274 = spvSubgroupShuffle(as_type<float>(_256), 0u);
    bool _276 = as_type<int>(_274) == _256;
    bool _278 = _272 && _276;
    int _280 = int(_278);
    float _282 = spvSubgroupShuffle(as_type<float>(_250), 1u);
    bool _284 = as_type<int>(_282) == _250;
    float _286 = spvSubgroupShuffle(as_type<float>(_256), 1u);
    bool _288 = as_type<int>(_286) == _256;
    bool _290 = _284 && _288;
    int _292 = _290 ? 2 : 0;
    int _294 = _280 | _292;
    float _296 = spvSubgroupShuffle(as_type<float>(_250), 2u);
    bool _298 = as_type<int>(_296) == _250;
    float _300 = spvSubgroupShuffle(as_type<float>(_256), 2u);
    bool _302 = as_type<int>(_300) == _256;
    bool _304 = _298 && _302;
    int _306 = _304 ? 4 : 0;
    int _308 = _294 | _306;
    float _310 = spvSubgroupShuffle(as_type<float>(_250), 3u);
    bool _312 = as_type<int>(_310) == _250;
    float _314 = spvSubgroupShuffle(as_type<float>(_256), 3u);
    bool _316 = as_type<int>(_314) == _256;
    bool _318 = _312 && _316;
    int _320 = _318 ? 8 : 0;
    int _322 = _308 | _320;
    float _324 = spvSubgroupShuffle(as_type<float>(_250), 4u);
    bool _326 = as_type<int>(_324) == _250;
    float _328 = spvSubgroupShuffle(as_type<float>(_256), 4u);
    bool _330 = as_type<int>(_328) == _256;
    bool _332 = _326 && _330;
    int _334 = _332 ? 16 : 0;
    int _336 = _322 | _334;
    float _338 = spvSubgroupShuffle(as_type<float>(_250), 5u);
    bool _340 = as_type<int>(_338) == _250;
    float _342 = spvSubgroupShuffle(as_type<float>(_256), 5u);
    bool _344 = as_type<int>(_342) == _256;
    bool _346 = _340 && _344;
    int _348 = _346 ? 32 : 0;
    int _350 = _336 | _348;
    float _352 = spvSubgroupShuffle(as_type<float>(_250), 6u);
    bool _354 = as_type<int>(_352) == _250;
    float _356 = spvSubgroupShuffle(as_type<float>(_256), 6u);
    bool _358 = as_type<int>(_356) == _256;
    bool _360 = _354 && _358;
    int _362 = _360 ? 64 : 0;
    int _364 = _350 | _362;
    float _366 = spvSubgroupShuffle(as_type<float>(_250), 7u);
    bool _368 = as_type<int>(_366) == _250;
    float _370 = spvSubgroupShuffle(as_type<float>(_256), 7u);
    bool _372 = as_type<int>(_370) == _256;
    bool _374 = _368 && _372;
    int _376 = _374 ? 128 : 0;
    int _378 = _364 | _376;
    float _380 = spvSubgroupShuffle(as_type<float>(_250), 8u);
    bool _382 = as_type<int>(_380) == _250;
    float _384 = spvSubgroupShuffle(as_type<float>(_256), 8u);
    bool _386 = as_type<int>(_384) == _256;
    bool _388 = _382 && _386;
    int _390 = _388 ? 256 : 0;
    int _392 = _378 | _390;
    float _394 = spvSubgroupShuffle(as_type<float>(_250), 9u);
    bool _396 = as_type<int>(_394) == _250;
    float _398 = spvSubgroupShuffle(as_type<float>(_256), 9u);
    bool _400 = as_type<int>(_398) == _256;
    bool _402 = _396 && _400;
    int _404 = _402 ? 512 : 0;
    int _406 = _392 | _404;
    float _408 = spvSubgroupShuffle(as_type<float>(_250), 10u);
    bool _410 = as_type<int>(_408) == _250;
    float _412 = spvSubgroupShuffle(as_type<float>(_256), 10u);
    bool _414 = as_type<int>(_412) == _256;
    bool _416 = _410 && _414;
    int _418 = _416 ? 1024 : 0;
    int _420 = _406 | _418;
    float _422 = spvSubgroupShuffle(as_type<float>(_250), 11u);
    bool _424 = as_type<int>(_422) == _250;
    float _426 = spvSubgroupShuffle(as_type<float>(_256), 11u);
    bool _428 = as_type<int>(_426) == _256;
    bool _430 = _424 && _428;
    int _432 = _430 ? 2048 : 0;
    int _434 = _420 | _432;
    float _436 = spvSubgroupShuffle(as_type<float>(_250), 12u);
    bool _438 = as_type<int>(_436) == _250;
    float _440 = spvSubgroupShuffle(as_type<float>(_256), 12u);
    bool _442 = as_type<int>(_440) == _256;
    bool _444 = _438 && _442;
    int _446 = _444 ? 4096 : 0;
    int _448 = _434 | _446;
    float _450 = spvSubgroupShuffle(as_type<float>(_250), 13u);
    bool _452 = as_type<int>(_450) == _250;
    float _454 = spvSubgroupShuffle(as_type<float>(_256), 13u);
    bool _456 = as_type<int>(_454) == _256;
    bool _458 = _452 && _456;
    int _460 = _458 ? 8192 : 0;
    int _462 = _448 | _460;
    float _464 = spvSubgroupShuffle(as_type<float>(_250), 14u);
    bool _466 = as_type<int>(_464) == _250;
    float _468 = spvSubgroupShuffle(as_type<float>(_256), 14u);
    bool _470 = as_type<int>(_468) == _256;
    bool _472 = _466 && _470;
    int _474 = _472 ? 16384 : 0;
    int _476 = _462 | _474;
    float _478 = spvSubgroupShuffle(as_type<float>(_250), 15u);
    bool _480 = as_type<int>(_478) == _250;
    float _482 = spvSubgroupShuffle(as_type<float>(_256), 15u);
    bool _484 = as_type<int>(_482) == _256;
    bool _486 = _480 && _484;
    int _488 = _486 ? 32768 : 0;
    int _490 = _476 | _488;
    float _492 = spvSubgroupShuffle(as_type<float>(_250), 16u);
    bool _494 = as_type<int>(_492) == _250;
    float _496 = spvSubgroupShuffle(as_type<float>(_256), 16u);
    bool _498 = as_type<int>(_496) == _256;
    bool _500 = _494 && _498;
    int _502 = _500 ? 65536 : 0;
    int _504 = _490 | _502;
    float _506 = spvSubgroupShuffle(as_type<float>(_250), 17u);
    bool _508 = as_type<int>(_506) == _250;
    float _510 = spvSubgroupShuffle(as_type<float>(_256), 17u);
    bool _512 = as_type<int>(_510) == _256;
    bool _514 = _508 && _512;
    int _516 = _514 ? 131072 : 0;
    int _518 = _504 | _516;
    float _520 = spvSubgroupShuffle(as_type<float>(_250), 18u);
    bool _522 = as_type<int>(_520) == _250;
    float _524 = spvSubgroupShuffle(as_type<float>(_256), 18u);
    bool _526 = as_type<int>(_524) == _256;
    bool _528 = _522 && _526;
    int _530 = _528 ? 262144 : 0;
    int _532 = _518 | _530;
    float _534 = spvSubgroupShuffle(as_type<float>(_250), 19u);
    bool _536 = as_type<int>(_534) == _250;
    float _538 = spvSubgroupShuffle(as_type<float>(_256), 19u);
    bool _540 = as_type<int>(_538) == _256;
    bool _542 = _536 && _540;
    int _544 = _542 ? 524288 : 0;
    int _546 = _532 | _544;
    float _548 = spvSubgroupShuffle(as_type<float>(_250), 20u);
    bool _550 = as_type<int>(_548) == _250;
    float _552 = spvSubgroupShuffle(as_type<float>(_256), 20u);
    bool _554 = as_type<int>(_552) == _256;
    bool _556 = _550 && _554;
    int _558 = _556 ? 1048576 : 0;
    int _560 = _546 | _558;
    float _562 = spvSubgroupShuffle(as_type<float>(_250), 21u);
    bool _564 = as_type<int>(_562) == _250;
    float _566 = spvSubgroupShuffle(as_type<float>(_256), 21u);
    bool _568 = as_type<int>(_566) == _256;
    bool _570 = _564 && _568;
    int _572 = _570 ? 2097152 : 0;
    int _574 = _560 | _572;
    float _576 = spvSubgroupShuffle(as_type<float>(_250), 22u);
    bool _578 = as_type<int>(_576) == _250;
    float _580 = spvSubgroupShuffle(as_type<float>(_256), 22u);
    bool _582 = as_type<int>(_580) == _256;
    bool _584 = _578 && _582;
    int _586 = _584 ? 4194304 : 0;
    int _588 = _574 | _586;
    float _590 = spvSubgroupShuffle(as_type<float>(_250), 23u);
    bool _592 = as_type<int>(_590) == _250;
    float _594 = spvSubgroupShuffle(as_type<float>(_256), 23u);
    bool _596 = as_type<int>(_594) == _256;
    bool _598 = _592 && _596;
    int _600 = _598 ? 8388608 : 0;
    int _602 = _588 | _600;
    float _604 = spvSubgroupShuffle(as_type<float>(_250), 24u);
    bool _606 = as_type<int>(_604) == _250;
    float _608 = spvSubgroupShuffle(as_type<float>(_256), 24u);
    bool _610 = as_type<int>(_608) == _256;
    bool _612 = _606 && _610;
    int _614 = _612 ? 16777216 : 0;
    int _616 = _602 | _614;
    float _618 = spvSubgroupShuffle(as_type<float>(_250), 25u);
    bool _620 = as_type<int>(_618) == _250;
    float _622 = spvSubgroupShuffle(as_type<float>(_256), 25u);
    bool _624 = as_type<int>(_622) == _256;
    bool _626 = _620 && _624;
    int _628 = _626 ? 33554432 : 0;
    int _630 = _616 | _628;
    float _632 = spvSubgroupShuffle(as_type<float>(_250), 26u);
    bool _634 = as_type<int>(_632) == _250;
    float _636 = spvSubgroupShuffle(as_type<float>(_256), 26u);
    bool _638 = as_type<int>(_636) == _256;
    bool _640 = _634 && _638;
    int _642 = _640 ? 67108864 : 0;
    int _644 = _630 | _642;
    float _646 = spvSubgroupShuffle(as_type<float>(_250), 27u);
    bool _648 = as_type<int>(_646) == _250;
    float _650 = spvSubgroupShuffle(as_type<float>(_256), 27u);
    bool _652 = as_type<int>(_650) == _256;
    bool _654 = _648 && _652;
    int _656 = _654 ? 134217728 : 0;
    int _658 = _644 | _656;
    float _660 = spvSubgroupShuffle(as_type<float>(_250), 28u);
    bool _662 = as_type<int>(_660) == _250;
    float _664 = spvSubgroupShuffle(as_type<float>(_256), 28u);
    bool _666 = as_type<int>(_664) == _256;
    bool _668 = _662 && _666;
    int _670 = _668 ? 268435456 : 0;
    int _672 = _658 | _670;
    float _674 = spvSubgroupShuffle(as_type<float>(_250), 29u);
    bool _676 = as_type<int>(_674) == _250;
    float _678 = spvSubgroupShuffle(as_type<float>(_256), 29u);
    bool _680 = as_type<int>(_678) == _256;
    bool _682 = _676 && _680;
    int _684 = _682 ? 536870912 : 0;
    int _686 = _672 | _684;
    float _688 = spvSubgroupShuffle(as_type<float>(_250), 30u);
    bool _690 = as_type<int>(_688) == _250;
    float _692 = spvSubgroupShuffle(as_type<float>(_256), 30u);
    bool _694 = as_type<int>(_692) == _256;
    bool _696 = _690 && _694;
    int _698 = _696 ? 1073741824 : 0;
    int _700 = _686 | _698;
    float _702 = spvSubgroupShuffle(as_type<float>(_250), 31u);
    bool _704 = as_type<int>(_702) == _250;
    float _706 = spvSubgroupShuffle(as_type<float>(_256), 31u);
    bool _708 = as_type<int>(_706) == _256;
    bool _710 = _704 && _708;
    int _712 = _710 ? int(0x80000000) : 0;
    int _714 = _700 | _712;
    int _716 = _714 & int(_268);
    bool _718 = _716 == int(_268);
    int _720 = _266 + _246;
    int _722 = _720 * 48;
    int _724 = _722 + 16;
    int _726 = _722 + 32;
    int _728 = _722 + 36;
    uint _730 = uint(int(uint(_722) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_730)] = as_type<uint>(_78);
    int _732 = _722 + 4;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_734)] = as_type<uint>(_84);
    int _736 = _722 + 8;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_738)] = as_type<uint>(_90);
    int _740 = _722 + 12;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_742)] = as_type<uint>(_96);
    int _744 = _722 + 40;
    int _746 = _722 + 44;
    uint _748 = uint(int(uint(_724) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_748)] = as_type<uint>(_100);
    int _750 = _724 + 4;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_752)] = as_type<uint>(_106);
    int _754 = _724 + 8;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_756)] = as_type<uint>(_112);
    int _758 = _724 + 12;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_760)] = as_type<uint>(_118);
    uint _762 = uint(int(uint(_726) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_762)] = as_type<uint>(_218);
    uint _764 = uint(int(uint(_728) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_764)] = as_type<uint>(_224);
    uint _766 = uint(int(uint(_744) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_766)] = as_type<uint>(_228);
    uint _768 = uint(int(uint(_746) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_768)] = as_type<uint>(_232);
    if (!_718)
    {
        uint _770 = uint(int(uint(_248) >> uint(2)));
        uint _2063 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_770)], 1u, memory_order_relaxed);
        uint _772 = _2063;
    }
    if (!_718)
    {
        return;
    }
    uint _774 = spvSubgroupBallot(true).x;
    int _776 = int(spvFindUMSB(_774));
    int _778 = popcount(int(_774));
    bool _780 = as_type<int>(_202) == _776;
    if (_780)
    {
        uint _782 = uint(int(uint(_248) >> uint(2)));
        uint _2091 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_782)], uint(_778), memory_order_relaxed);
        uint _784 = _2091;
    }
}

