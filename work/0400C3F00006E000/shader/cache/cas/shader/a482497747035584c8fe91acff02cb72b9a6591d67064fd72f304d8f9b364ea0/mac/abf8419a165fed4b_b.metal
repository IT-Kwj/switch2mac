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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    device _25* cp_s0 [[id(3)]];
    device _25* cp_s1 [[id(4)]];
    device _25* cp_s2 [[id(5)]];
    device _25* cp_s3 [[id(6)]];
    device _25* cp_s4 [[id(7)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _2590, thread const int& _2591, thread const int& _2592, thread int& _2593, thread uint& gl_SubgroupInvocationID)
{
    int _2596 = _2592 & 31;
    uint _2598 = uint(int(uint(_2592) >> uint(8)));
    int _2600 = int(_2598) & 31;
    float _2602 = as_type<float>(gl_SubgroupInvocationID);
    int _2604 = as_type<int>(_2602) & _2600;
    int _2606 = ~_2600;
    int _2608 = _2596 & _2606;
    int _2610 = _2608 | _2604;
    int _2612 = ~_2600;
    int _2614 = _2591 & _2612;
    int _2616 = _2614 | _2604;
    bool _2618 = uint(_2616) <= uint(_2610);
    _2593 = _2618 ? (-1) : 0;
    float _2620 = spvSubgroupShuffle(as_type<float>(_2590), uint(_2616));
    uint _2622 = uint(_2618 ? as_type<int>(_2620) : _2590);
    return int(_2622);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _61 = as_type<float>(gl_WorkGroupID.x);
    float _63 = as_type<float>(gl_LocalInvocationID.x);
    int _65 = as_type<int>(_61) << 6;
    int _67 = _65 + as_type<int>(_63);
    bool _71 = uint(_67) >= as_type<uint>(_59);
    if (_71)
    {
        return;
    }
    int _73 = _67 * 96;
    int _75 = _73 + 48;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_78)]);
    int _82 = _75 + 4;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_84)]);
    int _88 = _75 + 8;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_90)]);
    int _94 = _75 + 12;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_96)]);
    float _100 = _86 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _102 = _86 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _104 = _86 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _106 = _86 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _108 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[1].x, _100);
    float _110 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[0].x, _102);
    float _112 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[2].x, _104);
    float _114 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[3].x, _106);
    float _116 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[1].z, _108);
    float _118 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[0].z, _110);
    float _120 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[2].z, _112);
    float _122 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[3].z, _114);
    float _124 = _116 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _126 = _118 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _128 = _124 >= _98;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan(_98);
    bool _136 = _132 || _134;
    float _138 = _120 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _140 = _126 < _98;
    bool _142 = !_136;
    bool _144 = _140 && _142;
    float _146 = _122 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _148 = _138 < _98;
    bool _150 = _148 && _144;
    bool _152 = _146 < _98;
    bool _154 = _152 && _150;
    int _156 = _73 + 64;
    if (!_154)
    {
        return;
    }
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_158)]);
    int _162 = _156 + 4;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_164)]);
    int _168 = _156 + 8;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_170)]);
    int _174 = _156 + 12;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_176)]);
    int _180 = _73 + 92;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = as_type<int>(_172) * 20;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    float _192 = -_86;
    float _194 = _192 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _196 = -_80;
    float _198 = _196 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _200 = _194 * _194;
    float _202 = -_92;
    float _204 = _202 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _206 = fma(_198, _198, _200);
    float _208 = fma(_204, _204, _206);
    uint _210 = uint(int(uint(as_type<int>(_190)) >> uint(16)));
    int _212 = int(_210) * 16;
    int _214 = _212 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    uint _218 = uint(int(uint(int(_216)) >> uint(2)));
    int _220 = int(_216) & 3;
    float _222 = (*spvDescriptorSet0.cp_c4)._m0[int(_218)][_220];
    float _224 = _184 * _222;
    float _226 = _224 * _224;
    bool _228 = _208 > _226;
    if (_228)
    {
        return;
    }
    int _230 = as_type<int>(_172) << 5;
    int _232 = _73 + 16;
    uint _234 = uint(int(uint(_73) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_234)]);
    int _238 = _73 + 4;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_240)]);
    int _244 = _73 + 8;
    uint _246 = uint(int(uint(_244) >> uint(2)));
    float _248 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_246)]);
    int _250 = _73 + 12;
    uint _252 = uint(int(uint(_250) >> uint(2)));
    float _254 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_252)]);
    int _256 = _230 + 4;
    int _258 = _73 + 32;
    int _260 = _256 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _262 = uint(_260) < uint(_256);
    int _264 = int(_262);
    bool _266 = uint(_260) < uint(_260);
    int _268 = int(_266);
    int _270 = _264 + _268;
    int _272 = _270 & 1;
    bool _274 = _272 != 0;
    uint _276 = uint(int(uint(_232) >> uint(2)));
    float _278 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_276)]);
    int _280 = _232 + 4;
    uint _282 = uint(int(uint(_280) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_282)]);
    int _286 = _232 + 8;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_288)]);
    int _292 = _232 + 12;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_294)]);
    int _298 = int(_274);
    int _300 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _298;
    int _302 = _73 + 88;
    uint _304 = uint(int(uint(_258) >> uint(2)));
    float _306 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_304)]);
    int _308 = _258 + 4;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_310)]);
    int _314 = _258 + 8;
    uint _316 = uint(int(uint(_314) >> uint(2)));
    float _318 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_316)]);
    int _320 = _258 + 12;
    uint _322 = uint(int(uint(_320) >> uint(2)));
    float _324 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_322)]);
    uint _326 = spvSubgroupBallot(true).x;
    float _328 = spvSubgroupShuffle(as_type<float>(_260), 0u);
    bool _330 = as_type<int>(_328) == _260;
    float _332 = spvSubgroupShuffle(as_type<float>(_300), 0u);
    bool _334 = as_type<int>(_332) == _300;
    bool _336 = _330 && _334;
    int _338 = int(_336);
    float _340 = spvSubgroupShuffle(as_type<float>(_260), 1u);
    bool _342 = as_type<int>(_340) == _260;
    float _344 = spvSubgroupShuffle(as_type<float>(_300), 1u);
    bool _346 = as_type<int>(_344) == _300;
    bool _348 = _342 && _346;
    int _350 = _348 ? 2 : 0;
    int _352 = _338 | _350;
    float _354 = spvSubgroupShuffle(as_type<float>(_260), 2u);
    bool _356 = as_type<int>(_354) == _260;
    float _358 = spvSubgroupShuffle(as_type<float>(_300), 2u);
    bool _360 = as_type<int>(_358) == _300;
    bool _362 = _356 && _360;
    int _364 = _362 ? 4 : 0;
    int _366 = _352 | _364;
    float _368 = spvSubgroupShuffle(as_type<float>(_260), 3u);
    bool _370 = as_type<int>(_368) == _260;
    float _372 = spvSubgroupShuffle(as_type<float>(_300), 3u);
    bool _374 = as_type<int>(_372) == _300;
    bool _376 = _370 && _374;
    int _378 = _376 ? 8 : 0;
    int _380 = _366 | _378;
    float _382 = spvSubgroupShuffle(as_type<float>(_260), 4u);
    bool _384 = as_type<int>(_382) == _260;
    float _386 = spvSubgroupShuffle(as_type<float>(_300), 4u);
    bool _388 = as_type<int>(_386) == _300;
    bool _390 = _384 && _388;
    int _392 = _390 ? 16 : 0;
    int _394 = _380 | _392;
    float _396 = spvSubgroupShuffle(as_type<float>(_260), 5u);
    bool _398 = as_type<int>(_396) == _260;
    float _400 = spvSubgroupShuffle(as_type<float>(_300), 5u);
    bool _402 = as_type<int>(_400) == _300;
    bool _404 = _398 && _402;
    int _406 = _404 ? 32 : 0;
    int _408 = _394 | _406;
    float _410 = spvSubgroupShuffle(as_type<float>(_260), 6u);
    bool _412 = as_type<int>(_410) == _260;
    float _414 = spvSubgroupShuffle(as_type<float>(_300), 6u);
    bool _416 = as_type<int>(_414) == _300;
    bool _418 = _412 && _416;
    int _420 = _418 ? 64 : 0;
    int _422 = _408 | _420;
    float _424 = spvSubgroupShuffle(as_type<float>(_260), 7u);
    bool _426 = as_type<int>(_424) == _260;
    float _428 = spvSubgroupShuffle(as_type<float>(_300), 7u);
    bool _430 = as_type<int>(_428) == _300;
    bool _432 = _426 && _430;
    int _434 = _432 ? 128 : 0;
    int _436 = _422 | _434;
    float _438 = spvSubgroupShuffle(as_type<float>(_260), 8u);
    bool _440 = as_type<int>(_438) == _260;
    float _442 = spvSubgroupShuffle(as_type<float>(_300), 8u);
    bool _444 = as_type<int>(_442) == _300;
    bool _446 = _440 && _444;
    int _448 = _446 ? 256 : 0;
    int _450 = _436 | _448;
    float _452 = spvSubgroupShuffle(as_type<float>(_260), 9u);
    bool _454 = as_type<int>(_452) == _260;
    float _456 = spvSubgroupShuffle(as_type<float>(_300), 9u);
    bool _458 = as_type<int>(_456) == _300;
    bool _460 = _454 && _458;
    int _462 = _460 ? 512 : 0;
    int _464 = _450 | _462;
    float _466 = spvSubgroupShuffle(as_type<float>(_260), 10u);
    bool _468 = as_type<int>(_466) == _260;
    float _470 = spvSubgroupShuffle(as_type<float>(_300), 10u);
    bool _472 = as_type<int>(_470) == _300;
    bool _474 = _468 && _472;
    int _476 = _474 ? 1024 : 0;
    int _478 = _464 | _476;
    float _480 = spvSubgroupShuffle(as_type<float>(_260), 11u);
    bool _482 = as_type<int>(_480) == _260;
    float _484 = spvSubgroupShuffle(as_type<float>(_300), 11u);
    bool _486 = as_type<int>(_484) == _300;
    bool _488 = _482 && _486;
    int _490 = _488 ? 2048 : 0;
    int _492 = _478 | _490;
    float _494 = spvSubgroupShuffle(as_type<float>(_260), 12u);
    bool _496 = as_type<int>(_494) == _260;
    float _498 = spvSubgroupShuffle(as_type<float>(_300), 12u);
    bool _500 = as_type<int>(_498) == _300;
    bool _502 = _496 && _500;
    int _504 = _502 ? 4096 : 0;
    int _506 = _492 | _504;
    float _508 = spvSubgroupShuffle(as_type<float>(_260), 13u);
    bool _510 = as_type<int>(_508) == _260;
    float _512 = spvSubgroupShuffle(as_type<float>(_300), 13u);
    bool _514 = as_type<int>(_512) == _300;
    bool _516 = _510 && _514;
    int _518 = _516 ? 8192 : 0;
    int _520 = _506 | _518;
    float _522 = spvSubgroupShuffle(as_type<float>(_260), 14u);
    bool _524 = as_type<int>(_522) == _260;
    float _526 = spvSubgroupShuffle(as_type<float>(_300), 14u);
    bool _528 = as_type<int>(_526) == _300;
    bool _530 = _524 && _528;
    int _532 = _530 ? 16384 : 0;
    int _534 = _520 | _532;
    float _536 = spvSubgroupShuffle(as_type<float>(_260), 15u);
    bool _538 = as_type<int>(_536) == _260;
    float _540 = spvSubgroupShuffle(as_type<float>(_300), 15u);
    bool _542 = as_type<int>(_540) == _300;
    bool _544 = _538 && _542;
    int _546 = _544 ? 32768 : 0;
    int _548 = _534 | _546;
    float _550 = spvSubgroupShuffle(as_type<float>(_260), 16u);
    bool _552 = as_type<int>(_550) == _260;
    float _554 = spvSubgroupShuffle(as_type<float>(_300), 16u);
    bool _556 = as_type<int>(_554) == _300;
    bool _558 = _552 && _556;
    int _560 = _558 ? 65536 : 0;
    int _562 = _548 | _560;
    float _564 = spvSubgroupShuffle(as_type<float>(_260), 17u);
    bool _566 = as_type<int>(_564) == _260;
    float _568 = spvSubgroupShuffle(as_type<float>(_300), 17u);
    bool _570 = as_type<int>(_568) == _300;
    bool _572 = _566 && _570;
    int _574 = _572 ? 131072 : 0;
    int _576 = _562 | _574;
    float _578 = spvSubgroupShuffle(as_type<float>(_260), 18u);
    bool _580 = as_type<int>(_578) == _260;
    float _582 = spvSubgroupShuffle(as_type<float>(_300), 18u);
    bool _584 = as_type<int>(_582) == _300;
    bool _586 = _580 && _584;
    int _588 = _586 ? 262144 : 0;
    int _590 = _576 | _588;
    float _592 = spvSubgroupShuffle(as_type<float>(_260), 19u);
    bool _594 = as_type<int>(_592) == _260;
    float _596 = spvSubgroupShuffle(as_type<float>(_300), 19u);
    bool _598 = as_type<int>(_596) == _300;
    bool _600 = _594 && _598;
    int _602 = _600 ? 524288 : 0;
    int _604 = _590 | _602;
    float _606 = spvSubgroupShuffle(as_type<float>(_260), 20u);
    bool _608 = as_type<int>(_606) == _260;
    float _610 = spvSubgroupShuffle(as_type<float>(_300), 20u);
    bool _612 = as_type<int>(_610) == _300;
    bool _614 = _608 && _612;
    int _616 = _614 ? 1048576 : 0;
    int _618 = _604 | _616;
    float _620 = spvSubgroupShuffle(as_type<float>(_260), 21u);
    bool _622 = as_type<int>(_620) == _260;
    float _624 = spvSubgroupShuffle(as_type<float>(_300), 21u);
    bool _626 = as_type<int>(_624) == _300;
    bool _628 = _622 && _626;
    int _630 = _628 ? 2097152 : 0;
    int _632 = _618 | _630;
    float _634 = spvSubgroupShuffle(as_type<float>(_260), 22u);
    bool _636 = as_type<int>(_634) == _260;
    float _638 = spvSubgroupShuffle(as_type<float>(_300), 22u);
    bool _640 = as_type<int>(_638) == _300;
    bool _642 = _636 && _640;
    int _644 = _642 ? 4194304 : 0;
    int _646 = _632 | _644;
    float _648 = spvSubgroupShuffle(as_type<float>(_260), 23u);
    bool _650 = as_type<int>(_648) == _260;
    float _652 = spvSubgroupShuffle(as_type<float>(_300), 23u);
    bool _654 = as_type<int>(_652) == _300;
    bool _656 = _650 && _654;
    int _658 = _656 ? 8388608 : 0;
    int _660 = _646 | _658;
    float _662 = spvSubgroupShuffle(as_type<float>(_260), 24u);
    bool _664 = as_type<int>(_662) == _260;
    float _666 = spvSubgroupShuffle(as_type<float>(_300), 24u);
    bool _668 = as_type<int>(_666) == _300;
    bool _670 = _664 && _668;
    int _672 = _670 ? 16777216 : 0;
    int _674 = _660 | _672;
    float _676 = spvSubgroupShuffle(as_type<float>(_260), 25u);
    bool _678 = as_type<int>(_676) == _260;
    float _680 = spvSubgroupShuffle(as_type<float>(_300), 25u);
    bool _682 = as_type<int>(_680) == _300;
    bool _684 = _678 && _682;
    int _686 = _684 ? 33554432 : 0;
    int _688 = _674 | _686;
    float _690 = spvSubgroupShuffle(as_type<float>(_260), 26u);
    bool _692 = as_type<int>(_690) == _260;
    float _694 = spvSubgroupShuffle(as_type<float>(_300), 26u);
    bool _696 = as_type<int>(_694) == _300;
    bool _698 = _692 && _696;
    int _700 = _698 ? 67108864 : 0;
    int _702 = _688 | _700;
    float _704 = spvSubgroupShuffle(as_type<float>(_260), 27u);
    bool _706 = as_type<int>(_704) == _260;
    float _708 = spvSubgroupShuffle(as_type<float>(_300), 27u);
    bool _710 = as_type<int>(_708) == _300;
    bool _712 = _706 && _710;
    int _714 = _712 ? 134217728 : 0;
    int _716 = _702 | _714;
    float _718 = spvSubgroupShuffle(as_type<float>(_260), 28u);
    bool _720 = as_type<int>(_718) == _260;
    float _722 = spvSubgroupShuffle(as_type<float>(_300), 28u);
    bool _724 = as_type<int>(_722) == _300;
    bool _726 = _720 && _724;
    int _728 = _726 ? 268435456 : 0;
    int _730 = _716 | _728;
    float _732 = spvSubgroupShuffle(as_type<float>(_260), 29u);
    bool _734 = as_type<int>(_732) == _260;
    float _736 = spvSubgroupShuffle(as_type<float>(_300), 29u);
    bool _738 = as_type<int>(_736) == _300;
    bool _740 = _734 && _738;
    int _742 = _740 ? 536870912 : 0;
    int _744 = _730 | _742;
    float _746 = spvSubgroupShuffle(as_type<float>(_260), 30u);
    bool _748 = as_type<int>(_746) == _260;
    float _750 = spvSubgroupShuffle(as_type<float>(_300), 30u);
    bool _752 = as_type<int>(_750) == _300;
    bool _754 = _748 && _752;
    int _756 = _754 ? 1073741824 : 0;
    int _758 = _744 | _756;
    float _760 = spvSubgroupShuffle(as_type<float>(_260), 31u);
    bool _762 = as_type<int>(_760) == _260;
    float _764 = spvSubgroupShuffle(as_type<float>(_300), 31u);
    bool _766 = as_type<int>(_764) == _300;
    bool _768 = _762 && _766;
    int _770 = _768 ? int(0x80000000) : 0;
    int _772 = _758 | _770;
    int _774 = _772 & int(_326);
    bool _776 = _774 == int(_326);
    uint _778 = uint(int(uint(_302) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_778)]);
    int _782 = 0;
    if (!_776)
    {
        uint _784 = uint(int(uint(_256) >> uint(2)));
        uint _2236 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_784)], 1u, memory_order_relaxed);
        uint _786 = _2236;
        _782 = int(_786);
    }
    int _788 = _782;
    bool _790 = !_776;
    int _792 = _788;
    if (!_790)
    {
        float _794 = as_type<float>(gl_SubgroupInvocationID);
        uint _796 = spvSubgroupBallot(true).x;
        int _798 = int(spvFindUMSB(_796));
        int _800 = popcount(int(_796));
        bool _802 = _798 == as_type<int>(_794);
        int _804 = _800;
        if (_802)
        {
            uint _806 = uint(int(uint(_256) >> uint(2)));
            uint _2272 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_806)], uint(_800), memory_order_relaxed);
            uint _808 = _2272;
            _804 = int(_808);
        }
        int _810 = _804;
        float _812 = as_type<float>(gl_SubgroupLtMask.x);
        int _814 = as_type<int>(_812) & int(_796);
        int _816 = popcount(_814);
        int _818 = _810;
        int _820 = _798;
        int _822 = 31;
        int _824;
        int _2290 = _55(_818, _820, _822, _824, gl_SubgroupInvocationID);
        int _826 = _2290;
        int _828 = _826 + _816;
        _792 = _828;
    }
    int _830 = _792;
    uint _832 = uint(int(uint(_230) >> uint(2)));
    float _834 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_832)]);
    int _836 = as_type<int>(_254) * 1664525;
    int _838 = _836 + 1013904223;
    int _840 = as_type<int>(_296) * 1664525;
    int _842 = _840 + 1013904223;
    int _844 = as_type<int>(_324) * 1664525;
    int _846 = _844 + 1013904223;
    uint _848 = uint(int(uint(as_type<int>(_780)) >> uint(16)));
    int _850 = _842 * _846;
    int _852 = _850 + _838;
    int _854 = _846 * _852;
    int _856 = _854 + _842;
    uint _858 = uint(int(uint(_852) >> uint(16)));
    int _860 = _852 * _856;
    int _862 = _860 + _846;
    uint _864 = uint(int(uint(_856) >> uint(16)));
    int _866 = _852 ^ int(_858);
    uint _868 = uint(int(uint(_862) >> uint(16)));
    int _870 = _856 ^ int(_864);
    int _872 = _862 ^ int(_868);
    int _874 = _870 * _872;
    int _876 = _874 + _866;
    int _878 = as_type<int>(_780) & 65535;
    uint _880 = uint(int(uint(_876) >> uint(9)));
    int _882 = int(_880) + 1065353216;
    float _884 = as_type<float>(_882) + (-1.0);
    int _886 = _830 + as_type<int>(_834);
    int _888 = _886 * 80;
    int _890 = _888 + 16;
    uint _892 = uint(int(uint(_888) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_892)] = as_type<uint>(_236);
    int _894 = _888 + 4;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_896)] = as_type<uint>(_242);
    int _898 = _888 + 8;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_900)] = as_type<uint>(_248);
    int _902 = _888 + 12;
    uint _904 = uint(int(uint(_902) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_904)] = as_type<uint>(_254);
    int _906 = _888 + 32;
    int _908 = _888 + 48;
    uint _910 = uint(int(uint(_890) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_910)] = as_type<uint>(_278);
    int _912 = _890 + 4;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_914)] = as_type<uint>(_284);
    int _916 = _890 + 8;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_918)] = as_type<uint>(_290);
    int _920 = _890 + 12;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_922)] = as_type<uint>(_296);
    int _924 = _888 + 64;
    uint _926 = uint(int(uint(_906) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_926)] = as_type<uint>(_306);
    int _928 = _906 + 4;
    uint _930 = uint(int(uint(_928) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_930)] = as_type<uint>(_312);
    int _932 = _906 + 8;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_934)] = as_type<uint>(_318);
    int _936 = _906 + 12;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_938)] = as_type<uint>(_324);
    uint _940 = uint(int(uint(_908) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_940)] = as_type<uint>(_884);
    int _942 = _908 + 4;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_944)] = _848;
    int _946 = _908 + 8;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_948)] = uint(_878);
    int _950 = _908 + 12;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_952)] = as_type<uint>(_178);
    uint _954 = uint(int(uint(_924) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_954)] = 1065353216u;
    int _956 = _924 + 4;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_958)] = as_type<uint>(_160);
    int _960 = _924 + 8;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_962)] = as_type<uint>(_166);
    int _964 = _924 + 12;
    uint _966 = uint(int(uint(_964) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_966)] = as_type<uint>(_172);
}

