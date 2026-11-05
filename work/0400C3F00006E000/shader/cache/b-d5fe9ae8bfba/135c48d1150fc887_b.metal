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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _50 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _52 = as_type<float>(gl_WorkGroupID.x);
    float _54 = as_type<float>(gl_LocalInvocationID.x);
    int _57 = as_type<int>(_52) << 6;
    int _59 = _57 + as_type<int>(_54);
    bool _63 = uint(_59) >= as_type<uint>(_50);
    if (_63)
    {
        return;
    }
    int _65 = _59 * 96;
    int _67 = _65 + 48;
    uint _70 = uint(int(uint(_67) >> uint(2)));
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_70)]);
    int _74 = _67 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_76)]);
    int _80 = _67 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_82)]);
    int _86 = _67 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    float _92 = _78 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _94 = _78 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _96 = _78 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _98 = _78 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _100 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[1].x, _92);
    float _102 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[0].x, _94);
    float _104 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[2].x, _96);
    float _106 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[3].x, _98);
    float _108 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[1].z, _100);
    float _110 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[0].z, _102);
    float _112 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[2].z, _104);
    float _114 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[3].z, _106);
    float _116 = _108 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _118 = _110 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _120 = _116 >= _90;
    bool _122 = isnan(_116);
    bool _124 = _120 || _122;
    bool _126 = isnan(_90);
    bool _128 = _124 || _126;
    float _130 = _112 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _132 = _118 < _90;
    bool _134 = !_128;
    bool _136 = _132 && _134;
    float _138 = _114 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _140 = _130 < _90;
    bool _142 = _140 && _136;
    bool _144 = _138 < _90;
    bool _146 = _144 && _142;
    int _148 = _65 + 64;
    if (!_146)
    {
        return;
    }
    int _150 = _148 + 8;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_152)]);
    int _156 = _65 + 92;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_158)]);
    int _162 = as_type<int>(_154) * 20;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_164)]);
    float _168 = -_78;
    float _170 = _168 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _172 = -_72;
    float _174 = _172 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _176 = _170 * _170;
    float _178 = -_84;
    float _180 = _178 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    uint _186 = uint(int(uint(as_type<int>(_166)) >> uint(16)));
    int _188 = int(_186) << 4;
    int _190 = _188 + 4;
    uint _192 = uint(int(uint(_190) >> uint(2)));
    uint _194 = uint(int(uint(int(_192)) >> uint(2)));
    int _196 = int(_192) & 3;
    float _198 = (*spvDescriptorSet0.cp_c4)._m0[int(_194)][_196];
    float _200 = _160 * _198;
    float _202 = _200 * _200;
    bool _204 = _184 > _202;
    if (_204)
    {
        return;
    }
    int _206 = as_type<int>(_154) << 5;
    int _208 = _206 + 4;
    int _210 = _208 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _212 = uint(_210) < uint(_208);
    int _214 = int(_212);
    bool _216 = uint(_210) < uint(_210);
    int _218 = int(_216);
    int _220 = _214 + _218;
    int _222 = _220 & 1;
    bool _224 = _222 != 0;
    int _226 = int(_224);
    int _228 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _226;
    uint _230 = spvSubgroupBallot(true).x;
    float _232 = spvSubgroupShuffle(as_type<float>(_210), 0u);
    bool _234 = as_type<int>(_232) == _210;
    float _236 = spvSubgroupShuffle(as_type<float>(_228), 0u);
    bool _238 = as_type<int>(_236) == _228;
    bool _240 = _234 && _238;
    int _242 = int(_240);
    float _244 = spvSubgroupShuffle(as_type<float>(_210), 1u);
    bool _246 = as_type<int>(_244) == _210;
    float _248 = spvSubgroupShuffle(as_type<float>(_228), 1u);
    bool _250 = as_type<int>(_248) == _228;
    bool _252 = _246 && _250;
    int _254 = _252 ? 2 : 0;
    int _256 = _242 | _254;
    float _258 = spvSubgroupShuffle(as_type<float>(_210), 2u);
    bool _260 = as_type<int>(_258) == _210;
    float _262 = spvSubgroupShuffle(as_type<float>(_228), 2u);
    bool _264 = as_type<int>(_262) == _228;
    bool _266 = _260 && _264;
    int _268 = _266 ? 4 : 0;
    int _270 = _256 | _268;
    float _272 = spvSubgroupShuffle(as_type<float>(_210), 3u);
    bool _274 = as_type<int>(_272) == _210;
    float _276 = spvSubgroupShuffle(as_type<float>(_228), 3u);
    bool _278 = as_type<int>(_276) == _228;
    bool _280 = _274 && _278;
    int _282 = _280 ? 8 : 0;
    int _284 = _270 | _282;
    float _286 = spvSubgroupShuffle(as_type<float>(_210), 4u);
    bool _288 = as_type<int>(_286) == _210;
    float _290 = spvSubgroupShuffle(as_type<float>(_228), 4u);
    bool _292 = as_type<int>(_290) == _228;
    bool _294 = _288 && _292;
    int _296 = _294 ? 16 : 0;
    int _298 = _284 | _296;
    float _300 = spvSubgroupShuffle(as_type<float>(_210), 5u);
    bool _302 = as_type<int>(_300) == _210;
    float _304 = spvSubgroupShuffle(as_type<float>(_228), 5u);
    bool _306 = as_type<int>(_304) == _228;
    bool _308 = _302 && _306;
    int _310 = _308 ? 32 : 0;
    int _312 = _298 | _310;
    float _314 = spvSubgroupShuffle(as_type<float>(_210), 6u);
    bool _316 = as_type<int>(_314) == _210;
    float _318 = spvSubgroupShuffle(as_type<float>(_228), 6u);
    bool _320 = as_type<int>(_318) == _228;
    bool _322 = _316 && _320;
    int _324 = _322 ? 64 : 0;
    int _326 = _312 | _324;
    float _328 = spvSubgroupShuffle(as_type<float>(_210), 7u);
    bool _330 = as_type<int>(_328) == _210;
    float _332 = spvSubgroupShuffle(as_type<float>(_228), 7u);
    bool _334 = as_type<int>(_332) == _228;
    bool _336 = _330 && _334;
    int _338 = _336 ? 128 : 0;
    int _340 = _326 | _338;
    float _342 = spvSubgroupShuffle(as_type<float>(_210), 8u);
    bool _344 = as_type<int>(_342) == _210;
    float _346 = spvSubgroupShuffle(as_type<float>(_228), 8u);
    bool _348 = as_type<int>(_346) == _228;
    bool _350 = _344 && _348;
    int _352 = _350 ? 256 : 0;
    int _354 = _340 | _352;
    float _356 = spvSubgroupShuffle(as_type<float>(_210), 9u);
    bool _358 = as_type<int>(_356) == _210;
    float _360 = spvSubgroupShuffle(as_type<float>(_228), 9u);
    bool _362 = as_type<int>(_360) == _228;
    bool _364 = _358 && _362;
    int _366 = _364 ? 512 : 0;
    int _368 = _354 | _366;
    float _370 = spvSubgroupShuffle(as_type<float>(_210), 10u);
    bool _372 = as_type<int>(_370) == _210;
    float _374 = spvSubgroupShuffle(as_type<float>(_228), 10u);
    bool _376 = as_type<int>(_374) == _228;
    bool _378 = _372 && _376;
    int _380 = _378 ? 1024 : 0;
    int _382 = _368 | _380;
    float _384 = spvSubgroupShuffle(as_type<float>(_210), 11u);
    bool _386 = as_type<int>(_384) == _210;
    float _388 = spvSubgroupShuffle(as_type<float>(_228), 11u);
    bool _390 = as_type<int>(_388) == _228;
    bool _392 = _386 && _390;
    int _394 = _392 ? 2048 : 0;
    int _396 = _382 | _394;
    float _398 = spvSubgroupShuffle(as_type<float>(_210), 12u);
    bool _400 = as_type<int>(_398) == _210;
    float _402 = spvSubgroupShuffle(as_type<float>(_228), 12u);
    bool _404 = as_type<int>(_402) == _228;
    bool _406 = _400 && _404;
    int _408 = _406 ? 4096 : 0;
    int _410 = _396 | _408;
    float _412 = spvSubgroupShuffle(as_type<float>(_210), 13u);
    bool _414 = as_type<int>(_412) == _210;
    float _416 = spvSubgroupShuffle(as_type<float>(_228), 13u);
    bool _418 = as_type<int>(_416) == _228;
    bool _420 = _414 && _418;
    int _422 = _420 ? 8192 : 0;
    int _424 = _410 | _422;
    float _426 = spvSubgroupShuffle(as_type<float>(_210), 14u);
    bool _428 = as_type<int>(_426) == _210;
    float _430 = spvSubgroupShuffle(as_type<float>(_228), 14u);
    bool _432 = as_type<int>(_430) == _228;
    bool _434 = _428 && _432;
    int _436 = _434 ? 16384 : 0;
    int _438 = _424 | _436;
    float _440 = spvSubgroupShuffle(as_type<float>(_210), 15u);
    bool _442 = as_type<int>(_440) == _210;
    float _444 = spvSubgroupShuffle(as_type<float>(_228), 15u);
    bool _446 = as_type<int>(_444) == _228;
    bool _448 = _442 && _446;
    int _450 = _448 ? 32768 : 0;
    int _452 = _438 | _450;
    float _454 = spvSubgroupShuffle(as_type<float>(_210), 16u);
    bool _456 = as_type<int>(_454) == _210;
    float _458 = spvSubgroupShuffle(as_type<float>(_228), 16u);
    bool _460 = as_type<int>(_458) == _228;
    bool _462 = _456 && _460;
    int _464 = _462 ? 65536 : 0;
    int _466 = _452 | _464;
    float _468 = spvSubgroupShuffle(as_type<float>(_210), 17u);
    bool _470 = as_type<int>(_468) == _210;
    float _472 = spvSubgroupShuffle(as_type<float>(_228), 17u);
    bool _474 = as_type<int>(_472) == _228;
    bool _476 = _470 && _474;
    int _478 = _476 ? 131072 : 0;
    int _480 = _466 | _478;
    float _482 = spvSubgroupShuffle(as_type<float>(_210), 18u);
    bool _484 = as_type<int>(_482) == _210;
    float _486 = spvSubgroupShuffle(as_type<float>(_228), 18u);
    bool _488 = as_type<int>(_486) == _228;
    bool _490 = _484 && _488;
    int _492 = _490 ? 262144 : 0;
    int _494 = _480 | _492;
    float _496 = spvSubgroupShuffle(as_type<float>(_210), 19u);
    bool _498 = as_type<int>(_496) == _210;
    float _500 = spvSubgroupShuffle(as_type<float>(_228), 19u);
    bool _502 = as_type<int>(_500) == _228;
    bool _504 = _498 && _502;
    int _506 = _504 ? 524288 : 0;
    int _508 = _494 | _506;
    float _510 = spvSubgroupShuffle(as_type<float>(_210), 20u);
    bool _512 = as_type<int>(_510) == _210;
    float _514 = spvSubgroupShuffle(as_type<float>(_228), 20u);
    bool _516 = as_type<int>(_514) == _228;
    bool _518 = _512 && _516;
    int _520 = _518 ? 1048576 : 0;
    int _522 = _508 | _520;
    float _524 = spvSubgroupShuffle(as_type<float>(_210), 21u);
    bool _526 = as_type<int>(_524) == _210;
    float _528 = spvSubgroupShuffle(as_type<float>(_228), 21u);
    bool _530 = as_type<int>(_528) == _228;
    bool _532 = _526 && _530;
    int _534 = _532 ? 2097152 : 0;
    int _536 = _522 | _534;
    float _538 = spvSubgroupShuffle(as_type<float>(_210), 22u);
    bool _540 = as_type<int>(_538) == _210;
    float _542 = spvSubgroupShuffle(as_type<float>(_228), 22u);
    bool _544 = as_type<int>(_542) == _228;
    bool _546 = _540 && _544;
    int _548 = _546 ? 4194304 : 0;
    int _550 = _536 | _548;
    float _552 = spvSubgroupShuffle(as_type<float>(_210), 23u);
    bool _554 = as_type<int>(_552) == _210;
    float _556 = spvSubgroupShuffle(as_type<float>(_228), 23u);
    bool _558 = as_type<int>(_556) == _228;
    bool _560 = _554 && _558;
    int _562 = _560 ? 8388608 : 0;
    int _564 = _550 | _562;
    float _566 = spvSubgroupShuffle(as_type<float>(_210), 24u);
    bool _568 = as_type<int>(_566) == _210;
    float _570 = spvSubgroupShuffle(as_type<float>(_228), 24u);
    bool _572 = as_type<int>(_570) == _228;
    bool _574 = _568 && _572;
    int _576 = _574 ? 16777216 : 0;
    int _578 = _564 | _576;
    float _580 = spvSubgroupShuffle(as_type<float>(_210), 25u);
    bool _582 = as_type<int>(_580) == _210;
    float _584 = spvSubgroupShuffle(as_type<float>(_228), 25u);
    bool _586 = as_type<int>(_584) == _228;
    bool _588 = _582 && _586;
    int _590 = _588 ? 33554432 : 0;
    int _592 = _578 | _590;
    float _594 = spvSubgroupShuffle(as_type<float>(_210), 26u);
    bool _596 = as_type<int>(_594) == _210;
    float _598 = spvSubgroupShuffle(as_type<float>(_228), 26u);
    bool _600 = as_type<int>(_598) == _228;
    bool _602 = _596 && _600;
    int _604 = _602 ? 67108864 : 0;
    int _606 = _592 | _604;
    float _608 = spvSubgroupShuffle(as_type<float>(_210), 27u);
    bool _610 = as_type<int>(_608) == _210;
    float _612 = spvSubgroupShuffle(as_type<float>(_228), 27u);
    bool _614 = as_type<int>(_612) == _228;
    bool _616 = _610 && _614;
    int _618 = _616 ? 134217728 : 0;
    int _620 = _606 | _618;
    float _622 = spvSubgroupShuffle(as_type<float>(_210), 28u);
    bool _624 = as_type<int>(_622) == _210;
    float _626 = spvSubgroupShuffle(as_type<float>(_228), 28u);
    bool _628 = as_type<int>(_626) == _228;
    bool _630 = _624 && _628;
    int _632 = _630 ? 268435456 : 0;
    int _634 = _620 | _632;
    float _636 = spvSubgroupShuffle(as_type<float>(_210), 29u);
    bool _638 = as_type<int>(_636) == _210;
    float _640 = spvSubgroupShuffle(as_type<float>(_228), 29u);
    bool _642 = as_type<int>(_640) == _228;
    bool _644 = _638 && _642;
    int _646 = _644 ? 536870912 : 0;
    int _648 = _634 | _646;
    float _650 = spvSubgroupShuffle(as_type<float>(_210), 30u);
    bool _652 = as_type<int>(_650) == _210;
    float _654 = spvSubgroupShuffle(as_type<float>(_228), 30u);
    bool _656 = as_type<int>(_654) == _228;
    bool _658 = _652 && _656;
    int _660 = _658 ? 1073741824 : 0;
    int _662 = _648 | _660;
    float _664 = spvSubgroupShuffle(as_type<float>(_210), 31u);
    bool _666 = as_type<int>(_664) == _210;
    float _668 = spvSubgroupShuffle(as_type<float>(_228), 31u);
    bool _670 = as_type<int>(_668) == _228;
    bool _672 = _666 && _670;
    int _674 = _672 ? int(0x80000000) : 0;
    int _676 = _662 | _674;
    int _678 = _676 & int(_230);
    bool _680 = _678 == int(_230);
    if (!_680)
    {
        uint _682 = uint(int(uint(_208) >> uint(2)));
        uint _1812 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_682)], 1u, memory_order_relaxed);
        uint _684 = _1812;
    }
    if (!_680)
    {
        return;
    }
    float _686 = as_type<float>(gl_SubgroupInvocationID);
    uint _688 = spvSubgroupBallot(true).x;
    int _690 = int(spvFindUMSB(_688));
    int _692 = popcount(int(_688));
    bool _694 = as_type<int>(_686) == _690;
    if (_694)
    {
        uint _696 = uint(int(uint(_208) >> uint(2)));
        uint _1842 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_696)], uint(_692), memory_order_relaxed);
        uint _698 = _1842;
    }
}

