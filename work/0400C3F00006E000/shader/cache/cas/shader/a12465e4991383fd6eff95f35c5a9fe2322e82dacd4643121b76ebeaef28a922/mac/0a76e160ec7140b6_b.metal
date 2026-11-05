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
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    device _25* cp_s0 [[id(3)]];
    device _25* cp_s1 [[id(4)]];
    device _25* cp_s2 [[id(5)]];
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
    int _74 = _63 + 48;
    bool _76 = as_type<int>(_72) != (-1);
    if (!_76)
    {
        return;
    }
    uint _78 = uint(int(uint(_74) >> uint(2)));
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_78)]);
    int _82 = _74 + 4;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_84)]);
    int _88 = _74 + 8;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_90)]);
    int _94 = _74 + 12;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_96)]);
    float _100 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _102 = _92 + _100;
    float _104 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _106 = _80 + _104;
    float _108 = _102 * _102;
    float _110 = fma(_106, _106, _108);
    float _112 = sqrt(_110);
    bool _114 = _112 > (*spvDescriptorSet0.cp_c5)._m0[0].x;
    bool _116 = !_114;
    float _118 = _86;
    float _120 = _80;
    float _122 = _92;
    if (!_116)
    {
        float _124 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _126 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
        float _128 = _112 + _126;
        float _130 = rsqrt(_110);
        float _132 = _128 * _124;
        float _134 = _132 * 0.15915493667125701904296875;
        float _136 = _86 + (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _138 = _134 * 6.283185482025146484375;
        float _140 = cos(_138);
        float _142 = _134 * 6.283185482025146484375;
        float _144 = sin(_142);
        float _146 = _140 + (-1.0);
        float _148 = fma(_144, _136, (*spvDescriptorSet0.cp_c5)._m0[0].x);
        float _150 = _146 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        float _152 = _130 * _148;
        float _154 = fma(_86, _140, _150);
        float _156 = fma(_106, _152, (*spvDescriptorSet0.cp_c3)._m0[4].x);
        float _158 = fma(_102, _152, (*spvDescriptorSet0.cp_c3)._m0[4].z);
        _118 = _154;
        _120 = _156;
        _122 = _158;
    }
    float _160 = _118;
    float _162 = _120;
    float _164 = _122;
    float _166 = _160 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _168 = _160 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _170 = _160 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _172 = _160 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _174 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[1].x, _166);
    float _176 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[0].x, _168);
    float _178 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[2].x, _170);
    float _180 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[3].x, _172);
    float _182 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[1].z, _174);
    float _184 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[0].z, _176);
    float _186 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[2].z, _178);
    float _188 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[3].z, _180);
    float _190 = _182 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _192 = _184 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _194 = _186 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _196 = _190 >= _98;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan(_98);
    bool _204 = _200 || _202;
    bool _206 = _192 < _98;
    bool _208 = !_204;
    bool _210 = _206 && _208;
    float _212 = _188 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _214 = _194 < _98;
    bool _216 = _214 && _210;
    bool _218 = _212 < _98;
    bool _220 = _218 && _216;
    if (!_220)
    {
        return;
    }
    int _222 = as_type<int>(_72) << 5;
    int _224 = _222 + 4;
    int _226 = _224 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _228 = uint(_226) < uint(_224);
    int _230 = int(_228);
    bool _232 = uint(_226) < uint(_226);
    int _234 = int(_232);
    int _236 = _230 + _234;
    int _238 = _236 & 1;
    bool _240 = _238 != 0;
    int _242 = int(_240);
    int _244 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _242;
    uint _246 = spvSubgroupBallot(true).x;
    float _248 = spvSubgroupShuffle(as_type<float>(_226), 0u);
    bool _250 = as_type<int>(_248) == _226;
    float _252 = spvSubgroupShuffle(as_type<float>(_244), 0u);
    bool _254 = as_type<int>(_252) == _244;
    bool _256 = _250 && _254;
    int _258 = int(_256);
    float _260 = spvSubgroupShuffle(as_type<float>(_226), 1u);
    bool _262 = as_type<int>(_260) == _226;
    float _264 = spvSubgroupShuffle(as_type<float>(_244), 1u);
    bool _266 = as_type<int>(_264) == _244;
    bool _268 = _262 && _266;
    int _270 = _268 ? 2 : 0;
    int _272 = _258 | _270;
    float _274 = spvSubgroupShuffle(as_type<float>(_226), 2u);
    bool _276 = as_type<int>(_274) == _226;
    float _278 = spvSubgroupShuffle(as_type<float>(_244), 2u);
    bool _280 = as_type<int>(_278) == _244;
    bool _282 = _276 && _280;
    int _284 = _282 ? 4 : 0;
    int _286 = _272 | _284;
    float _288 = spvSubgroupShuffle(as_type<float>(_226), 3u);
    bool _290 = as_type<int>(_288) == _226;
    float _292 = spvSubgroupShuffle(as_type<float>(_244), 3u);
    bool _294 = as_type<int>(_292) == _244;
    bool _296 = _290 && _294;
    int _298 = _296 ? 8 : 0;
    int _300 = _286 | _298;
    float _302 = spvSubgroupShuffle(as_type<float>(_226), 4u);
    bool _304 = as_type<int>(_302) == _226;
    float _306 = spvSubgroupShuffle(as_type<float>(_244), 4u);
    bool _308 = as_type<int>(_306) == _244;
    bool _310 = _304 && _308;
    int _312 = _310 ? 16 : 0;
    int _314 = _300 | _312;
    float _316 = spvSubgroupShuffle(as_type<float>(_226), 5u);
    bool _318 = as_type<int>(_316) == _226;
    float _320 = spvSubgroupShuffle(as_type<float>(_244), 5u);
    bool _322 = as_type<int>(_320) == _244;
    bool _324 = _318 && _322;
    int _326 = _324 ? 32 : 0;
    int _328 = _314 | _326;
    float _330 = spvSubgroupShuffle(as_type<float>(_226), 6u);
    bool _332 = as_type<int>(_330) == _226;
    float _334 = spvSubgroupShuffle(as_type<float>(_244), 6u);
    bool _336 = as_type<int>(_334) == _244;
    bool _338 = _332 && _336;
    int _340 = _338 ? 64 : 0;
    int _342 = _328 | _340;
    float _344 = spvSubgroupShuffle(as_type<float>(_226), 7u);
    bool _346 = as_type<int>(_344) == _226;
    float _348 = spvSubgroupShuffle(as_type<float>(_244), 7u);
    bool _350 = as_type<int>(_348) == _244;
    bool _352 = _346 && _350;
    int _354 = _352 ? 128 : 0;
    int _356 = _342 | _354;
    float _358 = spvSubgroupShuffle(as_type<float>(_226), 8u);
    bool _360 = as_type<int>(_358) == _226;
    float _362 = spvSubgroupShuffle(as_type<float>(_244), 8u);
    bool _364 = as_type<int>(_362) == _244;
    bool _366 = _360 && _364;
    int _368 = _366 ? 256 : 0;
    int _370 = _356 | _368;
    float _372 = spvSubgroupShuffle(as_type<float>(_226), 9u);
    bool _374 = as_type<int>(_372) == _226;
    float _376 = spvSubgroupShuffle(as_type<float>(_244), 9u);
    bool _378 = as_type<int>(_376) == _244;
    bool _380 = _374 && _378;
    int _382 = _380 ? 512 : 0;
    int _384 = _370 | _382;
    float _386 = spvSubgroupShuffle(as_type<float>(_226), 10u);
    bool _388 = as_type<int>(_386) == _226;
    float _390 = spvSubgroupShuffle(as_type<float>(_244), 10u);
    bool _392 = as_type<int>(_390) == _244;
    bool _394 = _388 && _392;
    int _396 = _394 ? 1024 : 0;
    int _398 = _384 | _396;
    float _400 = spvSubgroupShuffle(as_type<float>(_226), 11u);
    bool _402 = as_type<int>(_400) == _226;
    float _404 = spvSubgroupShuffle(as_type<float>(_244), 11u);
    bool _406 = as_type<int>(_404) == _244;
    bool _408 = _402 && _406;
    int _410 = _408 ? 2048 : 0;
    int _412 = _398 | _410;
    float _414 = spvSubgroupShuffle(as_type<float>(_226), 12u);
    bool _416 = as_type<int>(_414) == _226;
    float _418 = spvSubgroupShuffle(as_type<float>(_244), 12u);
    bool _420 = as_type<int>(_418) == _244;
    bool _422 = _416 && _420;
    int _424 = _422 ? 4096 : 0;
    int _426 = _412 | _424;
    float _428 = spvSubgroupShuffle(as_type<float>(_226), 13u);
    bool _430 = as_type<int>(_428) == _226;
    float _432 = spvSubgroupShuffle(as_type<float>(_244), 13u);
    bool _434 = as_type<int>(_432) == _244;
    bool _436 = _430 && _434;
    int _438 = _436 ? 8192 : 0;
    int _440 = _426 | _438;
    float _442 = spvSubgroupShuffle(as_type<float>(_226), 14u);
    bool _444 = as_type<int>(_442) == _226;
    float _446 = spvSubgroupShuffle(as_type<float>(_244), 14u);
    bool _448 = as_type<int>(_446) == _244;
    bool _450 = _444 && _448;
    int _452 = _450 ? 16384 : 0;
    int _454 = _440 | _452;
    float _456 = spvSubgroupShuffle(as_type<float>(_226), 15u);
    bool _458 = as_type<int>(_456) == _226;
    float _460 = spvSubgroupShuffle(as_type<float>(_244), 15u);
    bool _462 = as_type<int>(_460) == _244;
    bool _464 = _458 && _462;
    int _466 = _464 ? 32768 : 0;
    int _468 = _454 | _466;
    float _470 = spvSubgroupShuffle(as_type<float>(_226), 16u);
    bool _472 = as_type<int>(_470) == _226;
    float _474 = spvSubgroupShuffle(as_type<float>(_244), 16u);
    bool _476 = as_type<int>(_474) == _244;
    bool _478 = _472 && _476;
    int _480 = _478 ? 65536 : 0;
    int _482 = _468 | _480;
    float _484 = spvSubgroupShuffle(as_type<float>(_226), 17u);
    bool _486 = as_type<int>(_484) == _226;
    float _488 = spvSubgroupShuffle(as_type<float>(_244), 17u);
    bool _490 = as_type<int>(_488) == _244;
    bool _492 = _486 && _490;
    int _494 = _492 ? 131072 : 0;
    int _496 = _482 | _494;
    float _498 = spvSubgroupShuffle(as_type<float>(_226), 18u);
    bool _500 = as_type<int>(_498) == _226;
    float _502 = spvSubgroupShuffle(as_type<float>(_244), 18u);
    bool _504 = as_type<int>(_502) == _244;
    bool _506 = _500 && _504;
    int _508 = _506 ? 262144 : 0;
    int _510 = _496 | _508;
    float _512 = spvSubgroupShuffle(as_type<float>(_226), 19u);
    bool _514 = as_type<int>(_512) == _226;
    float _516 = spvSubgroupShuffle(as_type<float>(_244), 19u);
    bool _518 = as_type<int>(_516) == _244;
    bool _520 = _514 && _518;
    int _522 = _520 ? 524288 : 0;
    int _524 = _510 | _522;
    float _526 = spvSubgroupShuffle(as_type<float>(_226), 20u);
    bool _528 = as_type<int>(_526) == _226;
    float _530 = spvSubgroupShuffle(as_type<float>(_244), 20u);
    bool _532 = as_type<int>(_530) == _244;
    bool _534 = _528 && _532;
    int _536 = _534 ? 1048576 : 0;
    int _538 = _524 | _536;
    float _540 = spvSubgroupShuffle(as_type<float>(_226), 21u);
    bool _542 = as_type<int>(_540) == _226;
    float _544 = spvSubgroupShuffle(as_type<float>(_244), 21u);
    bool _546 = as_type<int>(_544) == _244;
    bool _548 = _542 && _546;
    int _550 = _548 ? 2097152 : 0;
    int _552 = _538 | _550;
    float _554 = spvSubgroupShuffle(as_type<float>(_226), 22u);
    bool _556 = as_type<int>(_554) == _226;
    float _558 = spvSubgroupShuffle(as_type<float>(_244), 22u);
    bool _560 = as_type<int>(_558) == _244;
    bool _562 = _556 && _560;
    int _564 = _562 ? 4194304 : 0;
    int _566 = _552 | _564;
    float _568 = spvSubgroupShuffle(as_type<float>(_226), 23u);
    bool _570 = as_type<int>(_568) == _226;
    float _572 = spvSubgroupShuffle(as_type<float>(_244), 23u);
    bool _574 = as_type<int>(_572) == _244;
    bool _576 = _570 && _574;
    int _578 = _576 ? 8388608 : 0;
    int _580 = _566 | _578;
    float _582 = spvSubgroupShuffle(as_type<float>(_226), 24u);
    bool _584 = as_type<int>(_582) == _226;
    float _586 = spvSubgroupShuffle(as_type<float>(_244), 24u);
    bool _588 = as_type<int>(_586) == _244;
    bool _590 = _584 && _588;
    int _592 = _590 ? 16777216 : 0;
    int _594 = _580 | _592;
    float _596 = spvSubgroupShuffle(as_type<float>(_226), 25u);
    bool _598 = as_type<int>(_596) == _226;
    float _600 = spvSubgroupShuffle(as_type<float>(_244), 25u);
    bool _602 = as_type<int>(_600) == _244;
    bool _604 = _598 && _602;
    int _606 = _604 ? 33554432 : 0;
    int _608 = _594 | _606;
    float _610 = spvSubgroupShuffle(as_type<float>(_226), 26u);
    bool _612 = as_type<int>(_610) == _226;
    float _614 = spvSubgroupShuffle(as_type<float>(_244), 26u);
    bool _616 = as_type<int>(_614) == _244;
    bool _618 = _612 && _616;
    int _620 = _618 ? 67108864 : 0;
    int _622 = _608 | _620;
    float _624 = spvSubgroupShuffle(as_type<float>(_226), 27u);
    bool _626 = as_type<int>(_624) == _226;
    float _628 = spvSubgroupShuffle(as_type<float>(_244), 27u);
    bool _630 = as_type<int>(_628) == _244;
    bool _632 = _626 && _630;
    int _634 = _632 ? 134217728 : 0;
    int _636 = _622 | _634;
    float _638 = spvSubgroupShuffle(as_type<float>(_226), 28u);
    bool _640 = as_type<int>(_638) == _226;
    float _642 = spvSubgroupShuffle(as_type<float>(_244), 28u);
    bool _644 = as_type<int>(_642) == _244;
    bool _646 = _640 && _644;
    int _648 = _646 ? 268435456 : 0;
    int _650 = _636 | _648;
    float _652 = spvSubgroupShuffle(as_type<float>(_226), 29u);
    bool _654 = as_type<int>(_652) == _226;
    float _656 = spvSubgroupShuffle(as_type<float>(_244), 29u);
    bool _658 = as_type<int>(_656) == _244;
    bool _660 = _654 && _658;
    int _662 = _660 ? 536870912 : 0;
    int _664 = _650 | _662;
    float _666 = spvSubgroupShuffle(as_type<float>(_226), 30u);
    bool _668 = as_type<int>(_666) == _226;
    float _670 = spvSubgroupShuffle(as_type<float>(_244), 30u);
    bool _672 = as_type<int>(_670) == _244;
    bool _674 = _668 && _672;
    int _676 = _674 ? 1073741824 : 0;
    int _678 = _664 | _676;
    float _680 = spvSubgroupShuffle(as_type<float>(_226), 31u);
    bool _682 = as_type<int>(_680) == _226;
    float _684 = spvSubgroupShuffle(as_type<float>(_244), 31u);
    bool _686 = as_type<int>(_684) == _244;
    bool _688 = _682 && _686;
    int _690 = _688 ? int(0x80000000) : 0;
    int _692 = _678 | _690;
    int _694 = _692 & int(_246);
    bool _696 = _694 == int(_246);
    if (!_696)
    {
        uint _698 = uint(int(uint(_224) >> uint(2)));
        uint _1848 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_698)], 1u, memory_order_relaxed);
        uint _700 = _1848;
    }
    if (!_696)
    {
        return;
    }
    float _702 = as_type<float>(gl_SubgroupInvocationID);
    uint _704 = spvSubgroupBallot(true).x;
    int _706 = int(spvFindUMSB(_704));
    int _708 = popcount(int(_704));
    bool _710 = as_type<int>(_702) == _706;
    if (_710)
    {
        uint _712 = uint(int(uint(_224) >> uint(2)));
        uint _1878 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_712)], uint(_708), memory_order_relaxed);
        uint _714 = _1878;
    }
}

