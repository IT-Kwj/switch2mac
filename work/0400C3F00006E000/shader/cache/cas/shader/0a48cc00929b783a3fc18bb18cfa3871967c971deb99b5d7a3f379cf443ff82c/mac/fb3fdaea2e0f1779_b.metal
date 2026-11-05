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
int _53(thread const int& _2478, thread const int& _2479, thread const int& _2480, thread int& _2481, thread uint& gl_SubgroupInvocationID)
{
    int _2484 = _2480 & 31;
    uint _2486 = uint(int(uint(_2480) >> uint(8)));
    int _2488 = int(_2486) & 31;
    float _2490 = as_type<float>(gl_SubgroupInvocationID);
    int _2492 = as_type<int>(_2490) & _2488;
    int _2494 = ~_2488;
    int _2496 = _2484 & _2494;
    int _2498 = _2496 | _2492;
    int _2500 = ~_2488;
    int _2502 = _2479 & _2500;
    int _2504 = _2502 | _2492;
    bool _2506 = uint(_2504) <= uint(_2498);
    _2481 = _2506 ? (-1) : 0;
    float _2508 = spvSubgroupShuffle(as_type<float>(_2478), uint(_2504));
    uint _2510 = uint(_2506 ? as_type<int>(_2508) : _2478);
    return int(_2510);
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
    int _88 = as_type<int>(_80) * 20;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_90)]);
    int _94 = _71 + 48;
    int _96 = as_type<int>(_92) & 2;
    bool _98 = _96 != 0;
    if (!_98)
    {
        return;
    }
    uint _100 = uint(int(uint(_94) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
    int _104 = _94 + 4;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_106)]);
    int _110 = _94 + 8;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_112)]);
    int _116 = _94 + 12;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_118)]);
    float _122 = _108 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _124 = _108 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _126 = _108 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _128 = _108 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _130 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[1].x, _122);
    float _132 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[0].x, _124);
    float _134 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[2].x, _126);
    float _136 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[3].x, _128);
    float _138 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[1].z, _130);
    float _140 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[0].z, _132);
    float _142 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[2].z, _134);
    float _144 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[3].z, _136);
    float _146 = _138 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _148 = _140 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _150 = _146 >= _120;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan(_120);
    bool _158 = _154 || _156;
    float _160 = _142 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _162 = _148 < _120;
    bool _164 = !_158;
    bool _166 = _162 && _164;
    float _168 = _144 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _170 = _160 < _120;
    bool _172 = _170 && _166;
    bool _174 = _168 < _120;
    bool _176 = _174 && _172;
    int _178 = _71 + 92;
    if (!_176)
    {
        return;
    }
    uint _180 = uint(int(uint(_178) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_180)]);
    float _184 = -_108;
    float _186 = _184 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _188 = -_102;
    float _190 = _188 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _192 = -_114;
    float _194 = _192 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _196 = _186 * _186;
    float _198 = fma(_190, _190, _196);
    float _200 = fma(_194, _194, _198);
    float _202 = precise::min(_182, 300.0);
    float _204 = _202 * _202;
    bool _206 = _200 > _204;
    if (_206)
    {
        return;
    }
    int _208 = as_type<int>(_80) << 3;
    int _210 = _71 + 16;
    uint _212 = uint(int(uint(_71) >> uint(2)));
    float _214 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_212)]);
    int _216 = _71 + 4;
    uint _218 = uint(int(uint(_216) >> uint(2)));
    float _220 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_218)]);
    int _222 = _71 + 8;
    uint _224 = uint(int(uint(_222) >> uint(2)));
    float _226 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_224)]);
    int _228 = _71 + 12;
    uint _230 = uint(int(uint(_228) >> uint(2)));
    float _232 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_230)]);
    int _234 = _208 + 4;
    int _236 = _71 + 32;
    int _238 = _234 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _240 = uint(_238) < uint(_234);
    int _242 = int(_240);
    bool _244 = uint(_238) < uint(_238);
    int _246 = int(_244);
    int _248 = _242 + _246;
    int _250 = _248 & 1;
    bool _252 = _250 != 0;
    uint _254 = uint(int(uint(_210) >> uint(2)));
    float _256 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_254)]);
    int _258 = _210 + 4;
    uint _260 = uint(int(uint(_258) >> uint(2)));
    float _262 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_260)]);
    int _264 = _210 + 8;
    uint _266 = uint(int(uint(_264) >> uint(2)));
    float _268 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_266)]);
    int _270 = _210 + 12;
    uint _272 = uint(int(uint(_270) >> uint(2)));
    float _274 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_272)]);
    int _276 = int(_252);
    int _278 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _276;
    int _280 = _71 + 88;
    uint _282 = uint(int(uint(_236) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_282)]);
    int _286 = _236 + 4;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_288)]);
    int _292 = _236 + 8;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_294)]);
    int _298 = _236 + 12;
    uint _300 = uint(int(uint(_298) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_300)]);
    uint _304 = spvSubgroupBallot(true).x;
    float _306 = spvSubgroupShuffle(as_type<float>(_238), 0u);
    bool _308 = as_type<int>(_306) == _238;
    float _310 = spvSubgroupShuffle(as_type<float>(_278), 0u);
    bool _312 = as_type<int>(_310) == _278;
    bool _314 = _308 && _312;
    int _316 = int(_314);
    float _318 = spvSubgroupShuffle(as_type<float>(_238), 1u);
    bool _320 = as_type<int>(_318) == _238;
    float _322 = spvSubgroupShuffle(as_type<float>(_278), 1u);
    bool _324 = as_type<int>(_322) == _278;
    bool _326 = _320 && _324;
    int _328 = _326 ? 2 : 0;
    int _330 = _316 | _328;
    float _332 = spvSubgroupShuffle(as_type<float>(_238), 2u);
    bool _334 = as_type<int>(_332) == _238;
    float _336 = spvSubgroupShuffle(as_type<float>(_278), 2u);
    bool _338 = as_type<int>(_336) == _278;
    bool _340 = _334 && _338;
    int _342 = _340 ? 4 : 0;
    int _344 = _330 | _342;
    float _346 = spvSubgroupShuffle(as_type<float>(_238), 3u);
    bool _348 = as_type<int>(_346) == _238;
    float _350 = spvSubgroupShuffle(as_type<float>(_278), 3u);
    bool _352 = as_type<int>(_350) == _278;
    bool _354 = _348 && _352;
    int _356 = _354 ? 8 : 0;
    int _358 = _344 | _356;
    float _360 = spvSubgroupShuffle(as_type<float>(_238), 4u);
    bool _362 = as_type<int>(_360) == _238;
    float _364 = spvSubgroupShuffle(as_type<float>(_278), 4u);
    bool _366 = as_type<int>(_364) == _278;
    bool _368 = _362 && _366;
    int _370 = _368 ? 16 : 0;
    int _372 = _358 | _370;
    float _374 = spvSubgroupShuffle(as_type<float>(_238), 5u);
    bool _376 = as_type<int>(_374) == _238;
    float _378 = spvSubgroupShuffle(as_type<float>(_278), 5u);
    bool _380 = as_type<int>(_378) == _278;
    bool _382 = _376 && _380;
    int _384 = _382 ? 32 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_238), 6u);
    bool _390 = as_type<int>(_388) == _238;
    float _392 = spvSubgroupShuffle(as_type<float>(_278), 6u);
    bool _394 = as_type<int>(_392) == _278;
    bool _396 = _390 && _394;
    int _398 = _396 ? 64 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_238), 7u);
    bool _404 = as_type<int>(_402) == _238;
    float _406 = spvSubgroupShuffle(as_type<float>(_278), 7u);
    bool _408 = as_type<int>(_406) == _278;
    bool _410 = _404 && _408;
    int _412 = _410 ? 128 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_238), 8u);
    bool _418 = as_type<int>(_416) == _238;
    float _420 = spvSubgroupShuffle(as_type<float>(_278), 8u);
    bool _422 = as_type<int>(_420) == _278;
    bool _424 = _418 && _422;
    int _426 = _424 ? 256 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_238), 9u);
    bool _432 = as_type<int>(_430) == _238;
    float _434 = spvSubgroupShuffle(as_type<float>(_278), 9u);
    bool _436 = as_type<int>(_434) == _278;
    bool _438 = _432 && _436;
    int _440 = _438 ? 512 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_238), 10u);
    bool _446 = as_type<int>(_444) == _238;
    float _448 = spvSubgroupShuffle(as_type<float>(_278), 10u);
    bool _450 = as_type<int>(_448) == _278;
    bool _452 = _446 && _450;
    int _454 = _452 ? 1024 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_238), 11u);
    bool _460 = as_type<int>(_458) == _238;
    float _462 = spvSubgroupShuffle(as_type<float>(_278), 11u);
    bool _464 = as_type<int>(_462) == _278;
    bool _466 = _460 && _464;
    int _468 = _466 ? 2048 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_238), 12u);
    bool _474 = as_type<int>(_472) == _238;
    float _476 = spvSubgroupShuffle(as_type<float>(_278), 12u);
    bool _478 = as_type<int>(_476) == _278;
    bool _480 = _474 && _478;
    int _482 = _480 ? 4096 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_238), 13u);
    bool _488 = as_type<int>(_486) == _238;
    float _490 = spvSubgroupShuffle(as_type<float>(_278), 13u);
    bool _492 = as_type<int>(_490) == _278;
    bool _494 = _488 && _492;
    int _496 = _494 ? 8192 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_238), 14u);
    bool _502 = as_type<int>(_500) == _238;
    float _504 = spvSubgroupShuffle(as_type<float>(_278), 14u);
    bool _506 = as_type<int>(_504) == _278;
    bool _508 = _502 && _506;
    int _510 = _508 ? 16384 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_238), 15u);
    bool _516 = as_type<int>(_514) == _238;
    float _518 = spvSubgroupShuffle(as_type<float>(_278), 15u);
    bool _520 = as_type<int>(_518) == _278;
    bool _522 = _516 && _520;
    int _524 = _522 ? 32768 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_238), 16u);
    bool _530 = as_type<int>(_528) == _238;
    float _532 = spvSubgroupShuffle(as_type<float>(_278), 16u);
    bool _534 = as_type<int>(_532) == _278;
    bool _536 = _530 && _534;
    int _538 = _536 ? 65536 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_238), 17u);
    bool _544 = as_type<int>(_542) == _238;
    float _546 = spvSubgroupShuffle(as_type<float>(_278), 17u);
    bool _548 = as_type<int>(_546) == _278;
    bool _550 = _544 && _548;
    int _552 = _550 ? 131072 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_238), 18u);
    bool _558 = as_type<int>(_556) == _238;
    float _560 = spvSubgroupShuffle(as_type<float>(_278), 18u);
    bool _562 = as_type<int>(_560) == _278;
    bool _564 = _558 && _562;
    int _566 = _564 ? 262144 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_238), 19u);
    bool _572 = as_type<int>(_570) == _238;
    float _574 = spvSubgroupShuffle(as_type<float>(_278), 19u);
    bool _576 = as_type<int>(_574) == _278;
    bool _578 = _572 && _576;
    int _580 = _578 ? 524288 : 0;
    int _582 = _568 | _580;
    float _584 = spvSubgroupShuffle(as_type<float>(_238), 20u);
    bool _586 = as_type<int>(_584) == _238;
    float _588 = spvSubgroupShuffle(as_type<float>(_278), 20u);
    bool _590 = as_type<int>(_588) == _278;
    bool _592 = _586 && _590;
    int _594 = _592 ? 1048576 : 0;
    int _596 = _582 | _594;
    float _598 = spvSubgroupShuffle(as_type<float>(_238), 21u);
    bool _600 = as_type<int>(_598) == _238;
    float _602 = spvSubgroupShuffle(as_type<float>(_278), 21u);
    bool _604 = as_type<int>(_602) == _278;
    bool _606 = _600 && _604;
    int _608 = _606 ? 2097152 : 0;
    int _610 = _596 | _608;
    float _612 = spvSubgroupShuffle(as_type<float>(_238), 22u);
    bool _614 = as_type<int>(_612) == _238;
    float _616 = spvSubgroupShuffle(as_type<float>(_278), 22u);
    bool _618 = as_type<int>(_616) == _278;
    bool _620 = _614 && _618;
    int _622 = _620 ? 4194304 : 0;
    int _624 = _610 | _622;
    float _626 = spvSubgroupShuffle(as_type<float>(_238), 23u);
    bool _628 = as_type<int>(_626) == _238;
    float _630 = spvSubgroupShuffle(as_type<float>(_278), 23u);
    bool _632 = as_type<int>(_630) == _278;
    bool _634 = _628 && _632;
    int _636 = _634 ? 8388608 : 0;
    int _638 = _624 | _636;
    float _640 = spvSubgroupShuffle(as_type<float>(_238), 24u);
    bool _642 = as_type<int>(_640) == _238;
    float _644 = spvSubgroupShuffle(as_type<float>(_278), 24u);
    bool _646 = as_type<int>(_644) == _278;
    bool _648 = _642 && _646;
    int _650 = _648 ? 16777216 : 0;
    int _652 = _638 | _650;
    float _654 = spvSubgroupShuffle(as_type<float>(_238), 25u);
    bool _656 = as_type<int>(_654) == _238;
    float _658 = spvSubgroupShuffle(as_type<float>(_278), 25u);
    bool _660 = as_type<int>(_658) == _278;
    bool _662 = _656 && _660;
    int _664 = _662 ? 33554432 : 0;
    int _666 = _652 | _664;
    float _668 = spvSubgroupShuffle(as_type<float>(_238), 26u);
    bool _670 = as_type<int>(_668) == _238;
    float _672 = spvSubgroupShuffle(as_type<float>(_278), 26u);
    bool _674 = as_type<int>(_672) == _278;
    bool _676 = _670 && _674;
    int _678 = _676 ? 67108864 : 0;
    int _680 = _666 | _678;
    float _682 = spvSubgroupShuffle(as_type<float>(_238), 27u);
    bool _684 = as_type<int>(_682) == _238;
    float _686 = spvSubgroupShuffle(as_type<float>(_278), 27u);
    bool _688 = as_type<int>(_686) == _278;
    bool _690 = _684 && _688;
    int _692 = _690 ? 134217728 : 0;
    int _694 = _680 | _692;
    float _696 = spvSubgroupShuffle(as_type<float>(_238), 28u);
    bool _698 = as_type<int>(_696) == _238;
    float _700 = spvSubgroupShuffle(as_type<float>(_278), 28u);
    bool _702 = as_type<int>(_700) == _278;
    bool _704 = _698 && _702;
    int _706 = _704 ? 268435456 : 0;
    int _708 = _694 | _706;
    float _710 = spvSubgroupShuffle(as_type<float>(_238), 29u);
    bool _712 = as_type<int>(_710) == _238;
    float _714 = spvSubgroupShuffle(as_type<float>(_278), 29u);
    bool _716 = as_type<int>(_714) == _278;
    bool _718 = _712 && _716;
    int _720 = _718 ? 536870912 : 0;
    int _722 = _708 | _720;
    float _724 = spvSubgroupShuffle(as_type<float>(_238), 30u);
    bool _726 = as_type<int>(_724) == _238;
    float _728 = spvSubgroupShuffle(as_type<float>(_278), 30u);
    bool _730 = as_type<int>(_728) == _278;
    bool _732 = _726 && _730;
    int _734 = _732 ? 1073741824 : 0;
    int _736 = _722 | _734;
    float _738 = spvSubgroupShuffle(as_type<float>(_238), 31u);
    bool _740 = as_type<int>(_738) == _238;
    float _742 = spvSubgroupShuffle(as_type<float>(_278), 31u);
    bool _744 = as_type<int>(_742) == _278;
    bool _746 = _740 && _744;
    int _748 = _746 ? int(0x80000000) : 0;
    int _750 = _736 | _748;
    int _752 = _750 & int(_304);
    bool _754 = _752 == int(_304);
    uint _756 = uint(int(uint(_280) >> uint(2)));
    float _758 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_756)]);
    int _760 = 1;
    if (!_754)
    {
        uint _762 = uint(int(uint(_234) >> uint(2)));
        uint _2164 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_762)], 1u, memory_order_relaxed);
        uint _764 = _2164;
        _760 = int(_764);
    }
    int _766 = _760;
    bool _768 = !_754;
    int _770 = _766;
    if (!_768)
    {
        float _772 = as_type<float>(gl_SubgroupInvocationID);
        uint _774 = spvSubgroupBallot(true).x;
        int _776 = int(spvFindUMSB(_774));
        int _778 = popcount(int(_774));
        bool _780 = _776 == as_type<int>(_772);
        int _782 = _778;
        if (_780)
        {
            uint _784 = uint(int(uint(_234) >> uint(2)));
            uint _2200 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_784)], uint(_778), memory_order_relaxed);
            uint _786 = _2200;
            _782 = int(_786);
        }
        int _788 = _782;
        float _790 = as_type<float>(gl_SubgroupLtMask.x);
        int _792 = as_type<int>(_790) & int(_774);
        int _794 = popcount(_792);
        int _796 = _788;
        int _798 = _776;
        int _800 = 31;
        int _802;
        int _2218 = _53(_796, _798, _800, _802, gl_SubgroupInvocationID);
        int _804 = _2218;
        int _806 = _804 + _794;
        _770 = _806;
    }
    int _808 = _770;
    uint _810 = uint(int(uint(_208) >> uint(2)));
    float _812 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_810)]);
    int _814 = as_type<int>(_232) * 1664525;
    int _816 = _814 + 1013904223;
    int _818 = as_type<int>(_274) * 1664525;
    int _820 = _818 + 1013904223;
    int _822 = as_type<int>(_302) * 1664525;
    int _824 = _822 + 1013904223;
    int _826 = _820 * _824;
    int _828 = _826 + _816;
    int _830 = _824 * _828;
    int _832 = _830 + _820;
    uint _834 = uint(int(uint(_828) >> uint(16)));
    int _836 = _828 * _832;
    int _838 = _836 + _824;
    uint _840 = uint(int(uint(_832) >> uint(16)));
    int _842 = _828 ^ int(_834);
    uint _844 = uint(int(uint(_838) >> uint(16)));
    int _846 = _832 ^ int(_840);
    int _848 = _838 ^ int(_844);
    uint _850 = uint(int(uint(as_type<int>(_758)) >> uint(16)));
    int _852 = as_type<int>(_758) & 65535;
    int _854 = _846 * _848;
    int _856 = _854 + _842;
    uint _858 = uint(int(uint(_856) >> uint(9)));
    int _860 = int(_858) + 1065353216;
    float _862 = as_type<float>(_860) + (-1.0);
    int _864 = _808 + as_type<int>(_812);
    int _866 = _864 << 6;
    int _868 = _866 + 16;
    uint _870 = uint(int(uint(_866) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_870)] = as_type<uint>(_214);
    int _872 = _866 + 4;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_874)] = as_type<uint>(_220);
    int _876 = _866 + 8;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_878)] = as_type<uint>(_226);
    int _880 = _866 + 12;
    uint _882 = uint(int(uint(_880) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_882)] = as_type<uint>(_232);
    int _884 = _866 + 32;
    int _886 = _866 + 48;
    uint _888 = uint(int(uint(_868) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_888)] = as_type<uint>(_256);
    int _890 = _868 + 4;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_892)] = as_type<uint>(_262);
    int _894 = _868 + 8;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_896)] = as_type<uint>(_268);
    int _898 = _868 + 12;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_900)] = as_type<uint>(_274);
    uint _902 = uint(int(uint(_884) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_902)] = as_type<uint>(_284);
    int _904 = _884 + 4;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_906)] = as_type<uint>(_290);
    int _908 = _884 + 8;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_910)] = as_type<uint>(_296);
    int _912 = _884 + 12;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_914)] = as_type<uint>(_302);
    uint _916 = uint(int(uint(_886) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_916)] = as_type<uint>(_862);
    int _918 = _886 + 4;
    uint _920 = uint(int(uint(_918) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_920)] = _850;
    int _922 = _886 + 8;
    uint _924 = uint(int(uint(_922) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_924)] = uint(_852);
    int _926 = _886 + 12;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_928)] = as_type<uint>(_86);
}

