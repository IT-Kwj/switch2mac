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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _48 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_LocalInvocationID.x);
    int _55 = as_type<int>(_50) << 6;
    int _57 = _55 + as_type<int>(_52);
    bool _61 = uint(_57) >= as_type<uint>(_48);
    if (_61)
    {
        return;
    }
    int _63 = _57 * 96;
    int _65 = _63 + 64;
    int _67 = _65 + 8;
    uint _70 = uint(int(uint(_67) >> uint(2)));
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_70)]);
    int _74 = as_type<int>(_72) * 20;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_76)]);
    int _80 = _63 + 48;
    int _82 = as_type<int>(_78) & 2;
    bool _84 = _82 != 0;
    if (!_84)
    {
        return;
    }
    uint _86 = uint(int(uint(_80) >> uint(2)));
    float _88 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_86)]);
    int _90 = _80 + 4;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_92)]);
    int _96 = _80 + 8;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_98)]);
    int _102 = _80 + 12;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_104)]);
    int _108 = _63 + 92;
    float _110 = _94 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _112 = _94 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _114 = _94 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _116 = _94 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _118 = fma(_88, (*spvDescriptorSet0.cp_c3)._m0[1].x, _110);
    float _120 = fma(_88, (*spvDescriptorSet0.cp_c3)._m0[0].x, _112);
    float _122 = fma(_88, (*spvDescriptorSet0.cp_c3)._m0[2].x, _114);
    float _124 = fma(_88, (*spvDescriptorSet0.cp_c3)._m0[3].x, _116);
    float _126 = fma(_100, (*spvDescriptorSet0.cp_c3)._m0[1].z, _118);
    float _128 = fma(_100, (*spvDescriptorSet0.cp_c3)._m0[0].z, _120);
    float _130 = fma(_100, (*spvDescriptorSet0.cp_c3)._m0[2].z, _122);
    float _132 = fma(_100, (*spvDescriptorSet0.cp_c3)._m0[3].z, _124);
    float _134 = _126 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _136 = _128 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _138 = _134 >= _106;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan(_106);
    bool _146 = _142 || _144;
    float _148 = _130 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _150 = _136 < _106;
    bool _152 = !_146;
    bool _154 = _150 && _152;
    float _156 = _132 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _158 = _148 < _106;
    bool _160 = _158 && _154;
    bool _162 = _156 < _106;
    bool _164 = _162 && _160;
    if (!_164)
    {
        return;
    }
    uint _166 = uint(int(uint(_108) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_166)]);
    float _170 = -_94;
    float _172 = _170 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _174 = -_88;
    float _176 = _174 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _178 = -_100;
    float _180 = _178 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _182 = _172 * _172;
    float _184 = fma(_176, _176, _182);
    float _186 = fma(_180, _180, _184);
    float _188 = precise::min(_168, 300.0);
    float _190 = _188 * _188;
    bool _192 = _186 > _190;
    if (_192)
    {
        return;
    }
    int _194 = as_type<int>(_72) << 3;
    int _196 = _194 + 4;
    int _198 = _196 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _200 = uint(_198) < uint(_196);
    int _202 = int(_200);
    bool _204 = uint(_198) < uint(_198);
    int _206 = int(_204);
    int _208 = _202 + _206;
    int _210 = _208 & 1;
    bool _212 = _210 != 0;
    int _214 = int(_212);
    int _216 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _214;
    uint _218 = spvSubgroupBallot(true).x;
    float _220 = spvSubgroupShuffle(as_type<float>(_198), 0u);
    bool _222 = as_type<int>(_220) == _198;
    float _224 = spvSubgroupShuffle(as_type<float>(_216), 0u);
    bool _226 = as_type<int>(_224) == _216;
    bool _228 = _222 && _226;
    int _230 = int(_228);
    float _232 = spvSubgroupShuffle(as_type<float>(_198), 1u);
    bool _234 = as_type<int>(_232) == _198;
    float _236 = spvSubgroupShuffle(as_type<float>(_216), 1u);
    bool _238 = as_type<int>(_236) == _216;
    bool _240 = _234 && _238;
    int _242 = _240 ? 2 : 0;
    int _244 = _230 | _242;
    float _246 = spvSubgroupShuffle(as_type<float>(_198), 2u);
    bool _248 = as_type<int>(_246) == _198;
    float _250 = spvSubgroupShuffle(as_type<float>(_216), 2u);
    bool _252 = as_type<int>(_250) == _216;
    bool _254 = _248 && _252;
    int _256 = _254 ? 4 : 0;
    int _258 = _244 | _256;
    float _260 = spvSubgroupShuffle(as_type<float>(_198), 3u);
    bool _262 = as_type<int>(_260) == _198;
    float _264 = spvSubgroupShuffle(as_type<float>(_216), 3u);
    bool _266 = as_type<int>(_264) == _216;
    bool _268 = _262 && _266;
    int _270 = _268 ? 8 : 0;
    int _272 = _258 | _270;
    float _274 = spvSubgroupShuffle(as_type<float>(_198), 4u);
    bool _276 = as_type<int>(_274) == _198;
    float _278 = spvSubgroupShuffle(as_type<float>(_216), 4u);
    bool _280 = as_type<int>(_278) == _216;
    bool _282 = _276 && _280;
    int _284 = _282 ? 16 : 0;
    int _286 = _272 | _284;
    float _288 = spvSubgroupShuffle(as_type<float>(_198), 5u);
    bool _290 = as_type<int>(_288) == _198;
    float _292 = spvSubgroupShuffle(as_type<float>(_216), 5u);
    bool _294 = as_type<int>(_292) == _216;
    bool _296 = _290 && _294;
    int _298 = _296 ? 32 : 0;
    int _300 = _286 | _298;
    float _302 = spvSubgroupShuffle(as_type<float>(_198), 6u);
    bool _304 = as_type<int>(_302) == _198;
    float _306 = spvSubgroupShuffle(as_type<float>(_216), 6u);
    bool _308 = as_type<int>(_306) == _216;
    bool _310 = _304 && _308;
    int _312 = _310 ? 64 : 0;
    int _314 = _300 | _312;
    float _316 = spvSubgroupShuffle(as_type<float>(_198), 7u);
    bool _318 = as_type<int>(_316) == _198;
    float _320 = spvSubgroupShuffle(as_type<float>(_216), 7u);
    bool _322 = as_type<int>(_320) == _216;
    bool _324 = _318 && _322;
    int _326 = _324 ? 128 : 0;
    int _328 = _314 | _326;
    float _330 = spvSubgroupShuffle(as_type<float>(_198), 8u);
    bool _332 = as_type<int>(_330) == _198;
    float _334 = spvSubgroupShuffle(as_type<float>(_216), 8u);
    bool _336 = as_type<int>(_334) == _216;
    bool _338 = _332 && _336;
    int _340 = _338 ? 256 : 0;
    int _342 = _328 | _340;
    float _344 = spvSubgroupShuffle(as_type<float>(_198), 9u);
    bool _346 = as_type<int>(_344) == _198;
    float _348 = spvSubgroupShuffle(as_type<float>(_216), 9u);
    bool _350 = as_type<int>(_348) == _216;
    bool _352 = _346 && _350;
    int _354 = _352 ? 512 : 0;
    int _356 = _342 | _354;
    float _358 = spvSubgroupShuffle(as_type<float>(_198), 10u);
    bool _360 = as_type<int>(_358) == _198;
    float _362 = spvSubgroupShuffle(as_type<float>(_216), 10u);
    bool _364 = as_type<int>(_362) == _216;
    bool _366 = _360 && _364;
    int _368 = _366 ? 1024 : 0;
    int _370 = _356 | _368;
    float _372 = spvSubgroupShuffle(as_type<float>(_198), 11u);
    bool _374 = as_type<int>(_372) == _198;
    float _376 = spvSubgroupShuffle(as_type<float>(_216), 11u);
    bool _378 = as_type<int>(_376) == _216;
    bool _380 = _374 && _378;
    int _382 = _380 ? 2048 : 0;
    int _384 = _370 | _382;
    float _386 = spvSubgroupShuffle(as_type<float>(_198), 12u);
    bool _388 = as_type<int>(_386) == _198;
    float _390 = spvSubgroupShuffle(as_type<float>(_216), 12u);
    bool _392 = as_type<int>(_390) == _216;
    bool _394 = _388 && _392;
    int _396 = _394 ? 4096 : 0;
    int _398 = _384 | _396;
    float _400 = spvSubgroupShuffle(as_type<float>(_198), 13u);
    bool _402 = as_type<int>(_400) == _198;
    float _404 = spvSubgroupShuffle(as_type<float>(_216), 13u);
    bool _406 = as_type<int>(_404) == _216;
    bool _408 = _402 && _406;
    int _410 = _408 ? 8192 : 0;
    int _412 = _398 | _410;
    float _414 = spvSubgroupShuffle(as_type<float>(_198), 14u);
    bool _416 = as_type<int>(_414) == _198;
    float _418 = spvSubgroupShuffle(as_type<float>(_216), 14u);
    bool _420 = as_type<int>(_418) == _216;
    bool _422 = _416 && _420;
    int _424 = _422 ? 16384 : 0;
    int _426 = _412 | _424;
    float _428 = spvSubgroupShuffle(as_type<float>(_198), 15u);
    bool _430 = as_type<int>(_428) == _198;
    float _432 = spvSubgroupShuffle(as_type<float>(_216), 15u);
    bool _434 = as_type<int>(_432) == _216;
    bool _436 = _430 && _434;
    int _438 = _436 ? 32768 : 0;
    int _440 = _426 | _438;
    float _442 = spvSubgroupShuffle(as_type<float>(_198), 16u);
    bool _444 = as_type<int>(_442) == _198;
    float _446 = spvSubgroupShuffle(as_type<float>(_216), 16u);
    bool _448 = as_type<int>(_446) == _216;
    bool _450 = _444 && _448;
    int _452 = _450 ? 65536 : 0;
    int _454 = _440 | _452;
    float _456 = spvSubgroupShuffle(as_type<float>(_198), 17u);
    bool _458 = as_type<int>(_456) == _198;
    float _460 = spvSubgroupShuffle(as_type<float>(_216), 17u);
    bool _462 = as_type<int>(_460) == _216;
    bool _464 = _458 && _462;
    int _466 = _464 ? 131072 : 0;
    int _468 = _454 | _466;
    float _470 = spvSubgroupShuffle(as_type<float>(_198), 18u);
    bool _472 = as_type<int>(_470) == _198;
    float _474 = spvSubgroupShuffle(as_type<float>(_216), 18u);
    bool _476 = as_type<int>(_474) == _216;
    bool _478 = _472 && _476;
    int _480 = _478 ? 262144 : 0;
    int _482 = _468 | _480;
    float _484 = spvSubgroupShuffle(as_type<float>(_198), 19u);
    bool _486 = as_type<int>(_484) == _198;
    float _488 = spvSubgroupShuffle(as_type<float>(_216), 19u);
    bool _490 = as_type<int>(_488) == _216;
    bool _492 = _486 && _490;
    int _494 = _492 ? 524288 : 0;
    int _496 = _482 | _494;
    float _498 = spvSubgroupShuffle(as_type<float>(_198), 20u);
    bool _500 = as_type<int>(_498) == _198;
    float _502 = spvSubgroupShuffle(as_type<float>(_216), 20u);
    bool _504 = as_type<int>(_502) == _216;
    bool _506 = _500 && _504;
    int _508 = _506 ? 1048576 : 0;
    int _510 = _496 | _508;
    float _512 = spvSubgroupShuffle(as_type<float>(_198), 21u);
    bool _514 = as_type<int>(_512) == _198;
    float _516 = spvSubgroupShuffle(as_type<float>(_216), 21u);
    bool _518 = as_type<int>(_516) == _216;
    bool _520 = _514 && _518;
    int _522 = _520 ? 2097152 : 0;
    int _524 = _510 | _522;
    float _526 = spvSubgroupShuffle(as_type<float>(_198), 22u);
    bool _528 = as_type<int>(_526) == _198;
    float _530 = spvSubgroupShuffle(as_type<float>(_216), 22u);
    bool _532 = as_type<int>(_530) == _216;
    bool _534 = _528 && _532;
    int _536 = _534 ? 4194304 : 0;
    int _538 = _524 | _536;
    float _540 = spvSubgroupShuffle(as_type<float>(_198), 23u);
    bool _542 = as_type<int>(_540) == _198;
    float _544 = spvSubgroupShuffle(as_type<float>(_216), 23u);
    bool _546 = as_type<int>(_544) == _216;
    bool _548 = _542 && _546;
    int _550 = _548 ? 8388608 : 0;
    int _552 = _538 | _550;
    float _554 = spvSubgroupShuffle(as_type<float>(_198), 24u);
    bool _556 = as_type<int>(_554) == _198;
    float _558 = spvSubgroupShuffle(as_type<float>(_216), 24u);
    bool _560 = as_type<int>(_558) == _216;
    bool _562 = _556 && _560;
    int _564 = _562 ? 16777216 : 0;
    int _566 = _552 | _564;
    float _568 = spvSubgroupShuffle(as_type<float>(_198), 25u);
    bool _570 = as_type<int>(_568) == _198;
    float _572 = spvSubgroupShuffle(as_type<float>(_216), 25u);
    bool _574 = as_type<int>(_572) == _216;
    bool _576 = _570 && _574;
    int _578 = _576 ? 33554432 : 0;
    int _580 = _566 | _578;
    float _582 = spvSubgroupShuffle(as_type<float>(_198), 26u);
    bool _584 = as_type<int>(_582) == _198;
    float _586 = spvSubgroupShuffle(as_type<float>(_216), 26u);
    bool _588 = as_type<int>(_586) == _216;
    bool _590 = _584 && _588;
    int _592 = _590 ? 67108864 : 0;
    int _594 = _580 | _592;
    float _596 = spvSubgroupShuffle(as_type<float>(_198), 27u);
    bool _598 = as_type<int>(_596) == _198;
    float _600 = spvSubgroupShuffle(as_type<float>(_216), 27u);
    bool _602 = as_type<int>(_600) == _216;
    bool _604 = _598 && _602;
    int _606 = _604 ? 134217728 : 0;
    int _608 = _594 | _606;
    float _610 = spvSubgroupShuffle(as_type<float>(_198), 28u);
    bool _612 = as_type<int>(_610) == _198;
    float _614 = spvSubgroupShuffle(as_type<float>(_216), 28u);
    bool _616 = as_type<int>(_614) == _216;
    bool _618 = _612 && _616;
    int _620 = _618 ? 268435456 : 0;
    int _622 = _608 | _620;
    float _624 = spvSubgroupShuffle(as_type<float>(_198), 29u);
    bool _626 = as_type<int>(_624) == _198;
    float _628 = spvSubgroupShuffle(as_type<float>(_216), 29u);
    bool _630 = as_type<int>(_628) == _216;
    bool _632 = _626 && _630;
    int _634 = _632 ? 536870912 : 0;
    int _636 = _622 | _634;
    float _638 = spvSubgroupShuffle(as_type<float>(_198), 30u);
    bool _640 = as_type<int>(_638) == _198;
    float _642 = spvSubgroupShuffle(as_type<float>(_216), 30u);
    bool _644 = as_type<int>(_642) == _216;
    bool _646 = _640 && _644;
    int _648 = _646 ? 1073741824 : 0;
    int _650 = _636 | _648;
    float _652 = spvSubgroupShuffle(as_type<float>(_198), 31u);
    bool _654 = as_type<int>(_652) == _198;
    float _656 = spvSubgroupShuffle(as_type<float>(_216), 31u);
    bool _658 = as_type<int>(_656) == _216;
    bool _660 = _654 && _658;
    int _662 = _660 ? int(0x80000000) : 0;
    int _664 = _650 | _662;
    int _666 = _664 & int(_218);
    bool _668 = _666 == int(_218);
    if (!_668)
    {
        uint _670 = uint(int(uint(_196) >> uint(2)));
        uint _1784 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_670)], 1u, memory_order_relaxed);
        uint _672 = _1784;
    }
    if (!_668)
    {
        return;
    }
    float _674 = as_type<float>(gl_SubgroupInvocationID);
    uint _676 = spvSubgroupBallot(true).x;
    int _678 = int(spvFindUMSB(_676));
    int _680 = popcount(int(_676));
    bool _682 = as_type<int>(_674) == _678;
    if (_682)
    {
        uint _684 = uint(int(uint(_196) >> uint(2)));
        uint _1814 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_684)], uint(_680), memory_order_relaxed);
        uint _686 = _1814;
    }
}

