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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    device _23* cp_s1 [[id(3)]];
    device _23* cp_s2 [[id(4)]];
    device _23* cp_s3 [[id(5)]];
    device _23* cp_s4 [[id(6)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _2488, thread const int& _2489, thread const int& _2490, thread int& _2491, thread uint& gl_SubgroupInvocationID)
{
    int _2494 = _2490 & 31;
    uint _2496 = uint(int(uint(_2490) >> uint(8)));
    int _2498 = int(_2496) & 31;
    float _2500 = as_type<float>(gl_SubgroupInvocationID);
    int _2502 = as_type<int>(_2500) & _2498;
    int _2504 = ~_2498;
    int _2506 = _2494 & _2504;
    int _2508 = _2506 | _2502;
    int _2510 = ~_2498;
    int _2512 = _2489 & _2510;
    int _2514 = _2512 | _2502;
    bool _2516 = uint(_2514) <= uint(_2508);
    _2491 = _2516 ? (-1) : 0;
    float _2518 = spvSubgroupShuffle(as_type<float>(_2488), uint(_2514));
    uint _2520 = uint(_2516 ? as_type<int>(_2518) : _2488);
    return int(_2520);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _57 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _59 = as_type<float>(gl_WorkGroupID.x);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    int _63 = as_type<int>(_59) << 6;
    int _65 = _63 + as_type<int>(_61);
    bool _69 = uint(_65) >= as_type<uint>(_57);
    if (_69)
    {
        return;
    }
    int _71 = _65 * 96;
    int _73 = _71 + 64;
    int _75 = _73 + 8;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_78)]);
    int _82 = _73 + 12;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_84)]);
    bool _88 = as_type<int>(_80) != (-1);
    if (!_88)
    {
        return;
    }
    int _90 = as_type<int>(_80) * 20;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_92)]);
    int _96 = _71 + 48;
    int _98 = as_type<int>(_94) & 2;
    bool _100 = _98 != 0;
    if (!_100)
    {
        return;
    }
    uint _102 = uint(int(uint(_96) >> uint(2)));
    float _104 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_102)]);
    int _106 = _96 + 4;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_108)]);
    int _112 = _96 + 8;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_114)]);
    int _118 = _96 + 12;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_120)]);
    float _124 = _110 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _126 = _110 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _128 = _110 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _130 = _110 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _132 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[1].x, _124);
    float _134 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[0].x, _126);
    float _136 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[2].x, _128);
    float _138 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[3].x, _130);
    float _140 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[1].z, _132);
    float _142 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[0].z, _134);
    float _144 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[2].z, _136);
    float _146 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[3].z, _138);
    float _148 = _140 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _150 = _142 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _152 = _148 >= _122;
    bool _154 = isnan(_148);
    bool _156 = _152 || _154;
    bool _158 = isnan(_122);
    bool _160 = _156 || _158;
    float _162 = _144 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _164 = _150 < _122;
    bool _166 = !_160;
    bool _168 = _164 && _166;
    float _170 = _146 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _172 = _162 < _122;
    bool _174 = _172 && _168;
    bool _176 = _170 < _122;
    bool _178 = _176 && _174;
    int _180 = _71 + 92;
    if (!_178)
    {
        return;
    }
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    float _186 = -_110;
    float _188 = _186 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _190 = -_104;
    float _192 = _190 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _194 = -_116;
    float _196 = _194 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _198 = _188 * _188;
    float _200 = fma(_192, _192, _198);
    float _202 = fma(_196, _196, _200);
    float _204 = precise::min(_184, 300.0);
    float _206 = _204 * _204;
    bool _208 = _202 > _206;
    if (_208)
    {
        return;
    }
    int _210 = as_type<int>(_80) << 3;
    int _212 = _71 + 16;
    uint _214 = uint(int(uint(_71) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_214)]);
    int _218 = _71 + 4;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_220)]);
    int _224 = _71 + 8;
    uint _226 = uint(int(uint(_224) >> uint(2)));
    float _228 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_226)]);
    int _230 = _71 + 12;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _210 + 4;
    int _238 = _71 + 32;
    int _240 = _236 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _242 = uint(_240) < uint(_236);
    int _244 = int(_242);
    bool _246 = uint(_240) < uint(_240);
    int _248 = int(_246);
    int _250 = _244 + _248;
    int _252 = _250 & 1;
    bool _254 = _252 != 0;
    uint _256 = uint(int(uint(_212) >> uint(2)));
    float _258 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_256)]);
    int _260 = _212 + 4;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_262)]);
    int _266 = _212 + 8;
    uint _268 = uint(int(uint(_266) >> uint(2)));
    float _270 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_268)]);
    int _272 = _212 + 12;
    uint _274 = uint(int(uint(_272) >> uint(2)));
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_274)]);
    int _278 = int(_254);
    int _280 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _278;
    int _282 = _71 + 88;
    uint _284 = uint(int(uint(_238) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_284)]);
    int _288 = _238 + 4;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_290)]);
    int _294 = _238 + 8;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_296)]);
    int _300 = _238 + 12;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_302)]);
    uint _306 = spvSubgroupBallot(true).x;
    float _308 = spvSubgroupShuffle(as_type<float>(_240), 0u);
    bool _310 = as_type<int>(_308) == _240;
    float _312 = spvSubgroupShuffle(as_type<float>(_280), 0u);
    bool _314 = as_type<int>(_312) == _280;
    bool _316 = _310 && _314;
    int _318 = int(_316);
    float _320 = spvSubgroupShuffle(as_type<float>(_240), 1u);
    bool _322 = as_type<int>(_320) == _240;
    float _324 = spvSubgroupShuffle(as_type<float>(_280), 1u);
    bool _326 = as_type<int>(_324) == _280;
    bool _328 = _322 && _326;
    int _330 = _328 ? 2 : 0;
    int _332 = _318 | _330;
    float _334 = spvSubgroupShuffle(as_type<float>(_240), 2u);
    bool _336 = as_type<int>(_334) == _240;
    float _338 = spvSubgroupShuffle(as_type<float>(_280), 2u);
    bool _340 = as_type<int>(_338) == _280;
    bool _342 = _336 && _340;
    int _344 = _342 ? 4 : 0;
    int _346 = _332 | _344;
    float _348 = spvSubgroupShuffle(as_type<float>(_240), 3u);
    bool _350 = as_type<int>(_348) == _240;
    float _352 = spvSubgroupShuffle(as_type<float>(_280), 3u);
    bool _354 = as_type<int>(_352) == _280;
    bool _356 = _350 && _354;
    int _358 = _356 ? 8 : 0;
    int _360 = _346 | _358;
    float _362 = spvSubgroupShuffle(as_type<float>(_240), 4u);
    bool _364 = as_type<int>(_362) == _240;
    float _366 = spvSubgroupShuffle(as_type<float>(_280), 4u);
    bool _368 = as_type<int>(_366) == _280;
    bool _370 = _364 && _368;
    int _372 = _370 ? 16 : 0;
    int _374 = _360 | _372;
    float _376 = spvSubgroupShuffle(as_type<float>(_240), 5u);
    bool _378 = as_type<int>(_376) == _240;
    float _380 = spvSubgroupShuffle(as_type<float>(_280), 5u);
    bool _382 = as_type<int>(_380) == _280;
    bool _384 = _378 && _382;
    int _386 = _384 ? 32 : 0;
    int _388 = _374 | _386;
    float _390 = spvSubgroupShuffle(as_type<float>(_240), 6u);
    bool _392 = as_type<int>(_390) == _240;
    float _394 = spvSubgroupShuffle(as_type<float>(_280), 6u);
    bool _396 = as_type<int>(_394) == _280;
    bool _398 = _392 && _396;
    int _400 = _398 ? 64 : 0;
    int _402 = _388 | _400;
    float _404 = spvSubgroupShuffle(as_type<float>(_240), 7u);
    bool _406 = as_type<int>(_404) == _240;
    float _408 = spvSubgroupShuffle(as_type<float>(_280), 7u);
    bool _410 = as_type<int>(_408) == _280;
    bool _412 = _406 && _410;
    int _414 = _412 ? 128 : 0;
    int _416 = _402 | _414;
    float _418 = spvSubgroupShuffle(as_type<float>(_240), 8u);
    bool _420 = as_type<int>(_418) == _240;
    float _422 = spvSubgroupShuffle(as_type<float>(_280), 8u);
    bool _424 = as_type<int>(_422) == _280;
    bool _426 = _420 && _424;
    int _428 = _426 ? 256 : 0;
    int _430 = _416 | _428;
    float _432 = spvSubgroupShuffle(as_type<float>(_240), 9u);
    bool _434 = as_type<int>(_432) == _240;
    float _436 = spvSubgroupShuffle(as_type<float>(_280), 9u);
    bool _438 = as_type<int>(_436) == _280;
    bool _440 = _434 && _438;
    int _442 = _440 ? 512 : 0;
    int _444 = _430 | _442;
    float _446 = spvSubgroupShuffle(as_type<float>(_240), 10u);
    bool _448 = as_type<int>(_446) == _240;
    float _450 = spvSubgroupShuffle(as_type<float>(_280), 10u);
    bool _452 = as_type<int>(_450) == _280;
    bool _454 = _448 && _452;
    int _456 = _454 ? 1024 : 0;
    int _458 = _444 | _456;
    float _460 = spvSubgroupShuffle(as_type<float>(_240), 11u);
    bool _462 = as_type<int>(_460) == _240;
    float _464 = spvSubgroupShuffle(as_type<float>(_280), 11u);
    bool _466 = as_type<int>(_464) == _280;
    bool _468 = _462 && _466;
    int _470 = _468 ? 2048 : 0;
    int _472 = _458 | _470;
    float _474 = spvSubgroupShuffle(as_type<float>(_240), 12u);
    bool _476 = as_type<int>(_474) == _240;
    float _478 = spvSubgroupShuffle(as_type<float>(_280), 12u);
    bool _480 = as_type<int>(_478) == _280;
    bool _482 = _476 && _480;
    int _484 = _482 ? 4096 : 0;
    int _486 = _472 | _484;
    float _488 = spvSubgroupShuffle(as_type<float>(_240), 13u);
    bool _490 = as_type<int>(_488) == _240;
    float _492 = spvSubgroupShuffle(as_type<float>(_280), 13u);
    bool _494 = as_type<int>(_492) == _280;
    bool _496 = _490 && _494;
    int _498 = _496 ? 8192 : 0;
    int _500 = _486 | _498;
    float _502 = spvSubgroupShuffle(as_type<float>(_240), 14u);
    bool _504 = as_type<int>(_502) == _240;
    float _506 = spvSubgroupShuffle(as_type<float>(_280), 14u);
    bool _508 = as_type<int>(_506) == _280;
    bool _510 = _504 && _508;
    int _512 = _510 ? 16384 : 0;
    int _514 = _500 | _512;
    float _516 = spvSubgroupShuffle(as_type<float>(_240), 15u);
    bool _518 = as_type<int>(_516) == _240;
    float _520 = spvSubgroupShuffle(as_type<float>(_280), 15u);
    bool _522 = as_type<int>(_520) == _280;
    bool _524 = _518 && _522;
    int _526 = _524 ? 32768 : 0;
    int _528 = _514 | _526;
    float _530 = spvSubgroupShuffle(as_type<float>(_240), 16u);
    bool _532 = as_type<int>(_530) == _240;
    float _534 = spvSubgroupShuffle(as_type<float>(_280), 16u);
    bool _536 = as_type<int>(_534) == _280;
    bool _538 = _532 && _536;
    int _540 = _538 ? 65536 : 0;
    int _542 = _528 | _540;
    float _544 = spvSubgroupShuffle(as_type<float>(_240), 17u);
    bool _546 = as_type<int>(_544) == _240;
    float _548 = spvSubgroupShuffle(as_type<float>(_280), 17u);
    bool _550 = as_type<int>(_548) == _280;
    bool _552 = _546 && _550;
    int _554 = _552 ? 131072 : 0;
    int _556 = _542 | _554;
    float _558 = spvSubgroupShuffle(as_type<float>(_240), 18u);
    bool _560 = as_type<int>(_558) == _240;
    float _562 = spvSubgroupShuffle(as_type<float>(_280), 18u);
    bool _564 = as_type<int>(_562) == _280;
    bool _566 = _560 && _564;
    int _568 = _566 ? 262144 : 0;
    int _570 = _556 | _568;
    float _572 = spvSubgroupShuffle(as_type<float>(_240), 19u);
    bool _574 = as_type<int>(_572) == _240;
    float _576 = spvSubgroupShuffle(as_type<float>(_280), 19u);
    bool _578 = as_type<int>(_576) == _280;
    bool _580 = _574 && _578;
    int _582 = _580 ? 524288 : 0;
    int _584 = _570 | _582;
    float _586 = spvSubgroupShuffle(as_type<float>(_240), 20u);
    bool _588 = as_type<int>(_586) == _240;
    float _590 = spvSubgroupShuffle(as_type<float>(_280), 20u);
    bool _592 = as_type<int>(_590) == _280;
    bool _594 = _588 && _592;
    int _596 = _594 ? 1048576 : 0;
    int _598 = _584 | _596;
    float _600 = spvSubgroupShuffle(as_type<float>(_240), 21u);
    bool _602 = as_type<int>(_600) == _240;
    float _604 = spvSubgroupShuffle(as_type<float>(_280), 21u);
    bool _606 = as_type<int>(_604) == _280;
    bool _608 = _602 && _606;
    int _610 = _608 ? 2097152 : 0;
    int _612 = _598 | _610;
    float _614 = spvSubgroupShuffle(as_type<float>(_240), 22u);
    bool _616 = as_type<int>(_614) == _240;
    float _618 = spvSubgroupShuffle(as_type<float>(_280), 22u);
    bool _620 = as_type<int>(_618) == _280;
    bool _622 = _616 && _620;
    int _624 = _622 ? 4194304 : 0;
    int _626 = _612 | _624;
    float _628 = spvSubgroupShuffle(as_type<float>(_240), 23u);
    bool _630 = as_type<int>(_628) == _240;
    float _632 = spvSubgroupShuffle(as_type<float>(_280), 23u);
    bool _634 = as_type<int>(_632) == _280;
    bool _636 = _630 && _634;
    int _638 = _636 ? 8388608 : 0;
    int _640 = _626 | _638;
    float _642 = spvSubgroupShuffle(as_type<float>(_240), 24u);
    bool _644 = as_type<int>(_642) == _240;
    float _646 = spvSubgroupShuffle(as_type<float>(_280), 24u);
    bool _648 = as_type<int>(_646) == _280;
    bool _650 = _644 && _648;
    int _652 = _650 ? 16777216 : 0;
    int _654 = _640 | _652;
    float _656 = spvSubgroupShuffle(as_type<float>(_240), 25u);
    bool _658 = as_type<int>(_656) == _240;
    float _660 = spvSubgroupShuffle(as_type<float>(_280), 25u);
    bool _662 = as_type<int>(_660) == _280;
    bool _664 = _658 && _662;
    int _666 = _664 ? 33554432 : 0;
    int _668 = _654 | _666;
    float _670 = spvSubgroupShuffle(as_type<float>(_240), 26u);
    bool _672 = as_type<int>(_670) == _240;
    float _674 = spvSubgroupShuffle(as_type<float>(_280), 26u);
    bool _676 = as_type<int>(_674) == _280;
    bool _678 = _672 && _676;
    int _680 = _678 ? 67108864 : 0;
    int _682 = _668 | _680;
    float _684 = spvSubgroupShuffle(as_type<float>(_240), 27u);
    bool _686 = as_type<int>(_684) == _240;
    float _688 = spvSubgroupShuffle(as_type<float>(_280), 27u);
    bool _690 = as_type<int>(_688) == _280;
    bool _692 = _686 && _690;
    int _694 = _692 ? 134217728 : 0;
    int _696 = _682 | _694;
    float _698 = spvSubgroupShuffle(as_type<float>(_240), 28u);
    bool _700 = as_type<int>(_698) == _240;
    float _702 = spvSubgroupShuffle(as_type<float>(_280), 28u);
    bool _704 = as_type<int>(_702) == _280;
    bool _706 = _700 && _704;
    int _708 = _706 ? 268435456 : 0;
    int _710 = _696 | _708;
    float _712 = spvSubgroupShuffle(as_type<float>(_240), 29u);
    bool _714 = as_type<int>(_712) == _240;
    float _716 = spvSubgroupShuffle(as_type<float>(_280), 29u);
    bool _718 = as_type<int>(_716) == _280;
    bool _720 = _714 && _718;
    int _722 = _720 ? 536870912 : 0;
    int _724 = _710 | _722;
    float _726 = spvSubgroupShuffle(as_type<float>(_240), 30u);
    bool _728 = as_type<int>(_726) == _240;
    float _730 = spvSubgroupShuffle(as_type<float>(_280), 30u);
    bool _732 = as_type<int>(_730) == _280;
    bool _734 = _728 && _732;
    int _736 = _734 ? 1073741824 : 0;
    int _738 = _724 | _736;
    float _740 = spvSubgroupShuffle(as_type<float>(_240), 31u);
    bool _742 = as_type<int>(_740) == _240;
    float _744 = spvSubgroupShuffle(as_type<float>(_280), 31u);
    bool _746 = as_type<int>(_744) == _280;
    bool _748 = _742 && _746;
    int _750 = _748 ? int(0x80000000) : 0;
    int _752 = _738 | _750;
    int _754 = _752 & int(_306);
    bool _756 = _754 == int(_306);
    uint _758 = uint(int(uint(_282) >> uint(2)));
    float _760 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_758)]);
    int _762 = 1;
    if (!_756)
    {
        uint _764 = uint(int(uint(_236) >> uint(2)));
        uint _2174 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_764)], 1u, memory_order_relaxed);
        uint _766 = _2174;
        _762 = int(_766);
    }
    int _768 = _762;
    bool _770 = !_756;
    int _772 = _768;
    if (!_770)
    {
        float _774 = as_type<float>(gl_SubgroupInvocationID);
        uint _776 = spvSubgroupBallot(true).x;
        int _778 = int(spvFindUMSB(_776));
        int _780 = popcount(int(_776));
        bool _782 = _778 == as_type<int>(_774);
        int _784 = _780;
        if (_782)
        {
            uint _786 = uint(int(uint(_236) >> uint(2)));
            uint _2210 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_786)], uint(_780), memory_order_relaxed);
            uint _788 = _2210;
            _784 = int(_788);
        }
        int _790 = _784;
        float _792 = as_type<float>(gl_SubgroupLtMask.x);
        int _794 = as_type<int>(_792) & int(_776);
        int _796 = popcount(_794);
        int _798 = _790;
        int _800 = _778;
        int _802 = 31;
        int _804;
        int _2228 = _53(_798, _800, _802, _804, gl_SubgroupInvocationID);
        int _806 = _2228;
        int _808 = _806 + _796;
        _772 = _808;
    }
    int _810 = _772;
    uint _812 = uint(int(uint(_210) >> uint(2)));
    float _814 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_812)]);
    int _816 = as_type<int>(_234) * 1664525;
    int _818 = _816 + 1013904223;
    int _820 = as_type<int>(_276) * 1664525;
    int _822 = _820 + 1013904223;
    int _824 = as_type<int>(_304) * 1664525;
    int _826 = _824 + 1013904223;
    int _828 = _822 * _826;
    int _830 = _828 + _818;
    int _832 = _826 * _830;
    int _834 = _832 + _822;
    uint _836 = uint(int(uint(_830) >> uint(16)));
    int _838 = _830 * _834;
    int _840 = _838 + _826;
    uint _842 = uint(int(uint(_834) >> uint(16)));
    int _844 = _830 ^ int(_836);
    uint _846 = uint(int(uint(_840) >> uint(16)));
    int _848 = _834 ^ int(_842);
    int _850 = _840 ^ int(_846);
    uint _852 = uint(int(uint(as_type<int>(_760)) >> uint(16)));
    int _854 = as_type<int>(_760) & 65535;
    int _856 = _848 * _850;
    int _858 = _856 + _844;
    uint _860 = uint(int(uint(_858) >> uint(9)));
    int _862 = int(_860) + 1065353216;
    float _864 = as_type<float>(_862) + (-1.0);
    int _866 = _810 + as_type<int>(_814);
    int _868 = _866 << 6;
    int _870 = _868 + 16;
    uint _872 = uint(int(uint(_868) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_872)] = as_type<uint>(_216);
    int _874 = _868 + 4;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_876)] = as_type<uint>(_222);
    int _878 = _868 + 8;
    uint _880 = uint(int(uint(_878) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_880)] = as_type<uint>(_228);
    int _882 = _868 + 12;
    uint _884 = uint(int(uint(_882) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_884)] = as_type<uint>(_234);
    int _886 = _868 + 32;
    int _888 = _868 + 48;
    uint _890 = uint(int(uint(_870) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_890)] = as_type<uint>(_258);
    int _892 = _870 + 4;
    uint _894 = uint(int(uint(_892) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_894)] = as_type<uint>(_264);
    int _896 = _870 + 8;
    uint _898 = uint(int(uint(_896) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_898)] = as_type<uint>(_270);
    int _900 = _870 + 12;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_902)] = as_type<uint>(_276);
    uint _904 = uint(int(uint(_886) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_904)] = as_type<uint>(_286);
    int _906 = _886 + 4;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_908)] = as_type<uint>(_292);
    int _910 = _886 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_912)] = as_type<uint>(_298);
    int _914 = _886 + 12;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_916)] = as_type<uint>(_304);
    uint _918 = uint(int(uint(_888) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_918)] = as_type<uint>(_864);
    int _920 = _888 + 4;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_922)] = _852;
    int _924 = _888 + 8;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_926)] = uint(_854);
    int _928 = _888 + 12;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_930)] = as_type<uint>(_86);
}

