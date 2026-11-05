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
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _1535, thread const int& _1536, thread const int& _1537, thread int& _1538, thread uint& gl_SubgroupInvocationID)
{
    int _1541 = _1537 & 31;
    uint _1543 = uint(int(uint(_1537) >> uint(8)));
    int _1545 = int(_1543) & 31;
    float _1547 = as_type<float>(gl_SubgroupInvocationID);
    int _1549 = as_type<int>(_1547) & _1545;
    int _1551 = ~_1545;
    int _1553 = _1541 & _1551;
    int _1555 = _1553 | _1549;
    int _1557 = ~_1545;
    int _1559 = _1536 & _1557;
    int _1561 = _1559 | _1549;
    bool _1563 = uint(_1561) <= uint(_1555);
    _1538 = _1563 ? (-1) : 0;
    float _1565 = spvSubgroupShuffle(as_type<float>(_1535), uint(_1561));
    uint _1567 = uint(_1563 ? as_type<int>(_1565) : _1535);
    return int(_1567);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _51 = as_type<float>(gl_WorkGroupID.x);
    float _53 = as_type<float>(gl_LocalInvocationID.x);
    int _55 = as_type<int>(_51) * 64;
    int _57 = _55 + as_type<int>(_53);
    bool _61 = _57 != 0;
    bool _63 = uint(_57) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    if (!_61)
    {
        (*spvDescriptorSet0.cp_s0)._m0[0] = 0u;
        (*spvDescriptorSet0.cp_s0)._m0[1] = 0u;
        (*spvDescriptorSet0.cp_s0)._m0[2] = 0u;
        (*spvDescriptorSet0.cp_s0)._m0[3] = 0u;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (_63)
    {
        return;
    }
    int _65 = _57 << 4;
    uint _68 = uint(int(uint(_65) >> uint(2)));
    float _70 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_68)]);
    int _72 = _65 + 4;
    uint _74 = uint(int(uint(_72) >> uint(2)));
    float _76 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_74)]);
    int _78 = _65 + 8;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_80)]);
    int _84 = _65 + 12;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    float _88 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_86)]);
    bool _90 = as_type<int>(_76) != (-33686019);
    bool _92 = as_type<int>(_76) != (-842150451);
    bool _94 = as_type<int>(_76) != (-572662307);
    bool _96 = as_type<int>(_70) == (-33686019);
    bool _98 = !_90;
    bool _100 = _96 || _98;
    bool _102 = as_type<int>(_70) == (-842150451);
    bool _104 = !_92;
    bool _106 = _102 || _104;
    bool _108 = as_type<int>(_70) == (-572662307);
    bool _110 = !_94;
    bool _112 = _108 || _110;
    bool _114 = as_type<int>(_82) == (-33686019);
    bool _116 = _114 || _100;
    bool _118 = as_type<int>(_82) == (-842150451);
    bool _120 = _118 || _106;
    bool _122 = as_type<int>(_82) == (-572662307);
    bool _124 = _122 || _112;
    bool _126 = as_type<int>(_88) == (-33686019);
    bool _128 = _126 || _116;
    bool _130 = as_type<int>(_88) == (-842150451);
    bool _132 = _130 || _120;
    bool _134 = as_type<int>(_88) == (-572662307);
    bool _136 = _134 || _124;
    bool _138 = as_type<int>(_76) != 1515870810;
    bool _140 = !_136;
    bool _142 = !_128;
    bool _144 = _140 && _142;
    bool _146 = _144 && _132;
    bool _148 = !_136;
    bool _150 = _148 && _128;
    bool _152 = !_132;
    bool _154 = _150 && _152;
    bool _156 = _146 || _154;
    bool _158 = !_136;
    bool _160 = _158 && _128;
    bool _162 = _160 && _132;
    bool _164 = _156 || _162;
    bool _166 = !_128;
    bool _168 = _136 && _166;
    bool _170 = !_132;
    bool _172 = _168 && _170;
    bool _174 = _164 || _172;
    bool _176 = !_128;
    bool _178 = _136 && _176;
    bool _180 = _178 && _132;
    bool _182 = _174 || _180;
    bool _184 = _136 && _128;
    bool _186 = !_132;
    bool _188 = _184 && _186;
    bool _190 = _182 || _188;
    bool _192 = _136 && _128;
    bool _194 = _192 && _132;
    bool _196 = _190 || _194;
    bool _198 = as_type<int>(_70) == 1515870810;
    bool _200 = !_138;
    bool _202 = _198 || _200;
    int _204 = int(_90);
    int _206 = _92 ? 2 : 0;
    int _208 = _204 | _206;
    int _210 = _94 ? 4 : 0;
    int _212 = _208 | _210;
    int _214 = _138 ? 8 : 0;
    int _216 = _212 | _214;
    int _218 = _196 ? 16 : 0;
    int _220 = _216 | _218;
    int _222 = _202 ? 32 : 0;
    int _224 = _220 | _222;
    int _226 = _132 ? 64 : 0;
    int _228 = _224 | _226;
    int _230 = _228 & 1;
    bool _232 = as_type<int>(_82) == 1515870810;
    bool _234 = _232 || _202;
    float _236 = abs(_76);
    bool _238 = _236 > as_type<float>(0x7f800000u /* inf */);
    bool _240 = isnan(_236);
    bool _242 = _238 || _240;
    bool _244 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _246 = _242 || _244;
    bool _248 = as_type<int>(_88) == 1515870810;
    bool _250 = _248 || _234;
    int _252 = int(_90);
    int _254 = _92 ? 2 : 0;
    int _256 = _252 | _254;
    int _258 = _94 ? 4 : 0;
    int _260 = _256 | _258;
    int _262 = _138 ? 8 : 0;
    int _264 = _260 | _262;
    int _266 = _196 ? 16 : 0;
    int _268 = _264 | _266;
    int _270 = _250 ? 32 : 0;
    int _272 = _268 | _270;
    int _274 = _246 ? 64 : 0;
    int _276 = _272 | _274;
    int _278 = _276 & 64;
    bool _280 = !_196;
    bool _282 = _280 && _250;
    bool _284 = !_250;
    bool _286 = _196 && _284;
    bool _288 = _282 || _286;
    bool _290 = _196 && _250;
    bool _292 = _288 || _290;
    float _294 = abs(_76);
    bool _296 = _294 != as_type<float>(0x7f800000u /* inf */);
    bool _298 = isnan(_294);
    bool _300 = _296 || _298;
    bool _302 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _304 = _300 || _302;
    float _306 = abs(_70);
    bool _308 = _306 > as_type<float>(0x7f800000u /* inf */);
    bool _310 = isnan(_306);
    bool _312 = _308 || _310;
    bool _314 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _316 = _312 || _314;
    bool _318 = _316 || _246;
    float _320 = abs(_70);
    bool _322 = _320 == as_type<float>(0x7f800000u /* inf */);
    bool _324 = !_304;
    bool _326 = _322 || _324;
    float _328 = abs(_82);
    bool _330 = _328 > as_type<float>(0x7f800000u /* inf */);
    bool _332 = isnan(_328);
    bool _334 = _330 || _332;
    bool _336 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _338 = _334 || _336;
    bool _340 = _338 || _318;
    float _342 = abs(_82);
    bool _344 = _342 == as_type<float>(0x7f800000u /* inf */);
    bool _346 = _344 || _326;
    float _348 = abs(_88);
    bool _350 = _348 > as_type<float>(0x7f800000u /* inf */);
    bool _352 = isnan(_348);
    bool _354 = _350 || _352;
    bool _356 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _358 = _354 || _356;
    bool _360 = _358 || _340;
    float _362 = abs(_88);
    bool _364 = _362 == as_type<float>(0x7f800000u /* inf */);
    bool _366 = _364 || _346;
    bool _368 = !_292;
    bool _370 = !_360;
    bool _372 = _368 && _370;
    bool _374 = _372 && _366;
    bool _376 = !_292;
    bool _378 = _376 && _360;
    bool _380 = !_366;
    bool _382 = _378 && _380;
    bool _384 = _374 || _382;
    bool _386 = !_292;
    bool _388 = _386 && _360;
    bool _390 = _388 && _366;
    bool _392 = _384 || _390;
    bool _394 = !_360;
    bool _396 = _292 && _394;
    bool _398 = !_366;
    bool _400 = _396 && _398;
    bool _402 = _392 || _400;
    bool _404 = !_360;
    bool _406 = _292 && _404;
    bool _408 = _406 && _366;
    bool _410 = _402 || _408;
    bool _412 = _292 && _360;
    bool _414 = !_366;
    bool _416 = _412 && _414;
    bool _418 = _410 || _416;
    bool _420 = _292 && _360;
    bool _422 = _420 && _366;
    bool _424 = _418 || _422;
    bool _426 = _230 != 0;
    if (!_424)
    {
        return;
    }
    float _428 = as_type<float>(gl_SubgroupInvocationID);
    uint _430 = spvSubgroupBallot(true).x;
    bool _432 = _278 != 0;
    int _434 = int(spvFindUMSB(_430));
    int _436 = popcount(int(_430));
    bool _438 = _434 == as_type<int>(_428);
    int _440 = 0;
    if (_438)
    {
        uint _1237 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[0], uint(_436), memory_order_relaxed);
        uint _442 = _1237;
        _440 = int(_442);
    }
    int _444 = _440;
    int _446 = _304 ? 0 : 2;
    float _448 = abs(_82);
    bool _450 = _448 != as_type<float>(0x7f800000u /* inf */);
    bool _452 = isnan(_448);
    bool _454 = _450 || _452;
    bool _456 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _458 = _454 || _456;
    float _460 = as_type<float>(gl_SubgroupLtMask.x);
    float _462 = abs(_70);
    bool _464 = _462 != as_type<float>(0x7f800000u /* inf */);
    bool _466 = isnan(_462);
    bool _468 = _464 || _466;
    bool _470 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _472 = _468 || _470;
    int _474 = _458 ? 0 : 4;
    bool _476 = as_type<int>(_70) != (-572662307);
    int _478 = _472 ? 0 : 1;
    int _480 = _92 ? 0 : 2;
    bool _482 = as_type<int>(_82) != (-842150451);
    int _484 = _476 ? 0 : 1;
    bool _486 = as_type<int>(_82) != (-33686019);
    bool _488 = as_type<int>(_88) != (-33686019);
    int _490 = _426 ? 0 : 2;
    int _492 = _94 ? 0 : 2;
    bool _494 = as_type<int>(_70) != (-33686019);
    bool _496 = as_type<int>(_70) != (-842150451);
    int _498 = _482 ? 0 : 4;
    int _500 = _486 ? 0 : 4;
    float _502 = abs(_88);
    bool _504 = _502 != as_type<float>(0x7f800000u /* inf */);
    bool _506 = isnan(_502);
    bool _508 = _504 || _506;
    bool _510 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _512 = _508 || _510;
    int _514 = _488 ? 0 : 8;
    float _516 = abs(_82);
    bool _518 = _516 > as_type<float>(0x7f800000u /* inf */);
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _526 = _522 || _524;
    float _528 = abs(_70);
    bool _530 = _528 > as_type<float>(0x7f800000u /* inf */);
    bool _532 = isnan(_528);
    bool _534 = _530 || _532;
    bool _536 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _538 = _534 || _536;
    int _540 = as_type<int>(_460) & int(_430);
    int _542 = _494 ? 0 : 1;
    int _544 = _496 ? 0 : 1;
    bool _546 = as_type<int>(_82) != (-572662307);
    int _548 = popcount(_540);
    bool _550 = as_type<int>(_82) != 1515870810;
    int _552 = _512 ? 0 : 8;
    bool _554 = !_432;
    int _556 = _554 ? 0 : 2;
    float _558 = abs(_88);
    bool _560 = _558 > as_type<float>(0x7f800000u /* inf */);
    bool _562 = isnan(_558);
    bool _564 = _560 || _562;
    bool _566 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _568 = _564 || _566;
    bool _570 = !_526;
    int _572 = _570 ? 0 : 4;
    bool _574 = !_538;
    int _576 = _574 ? 0 : 1;
    bool _578 = as_type<int>(_70) != 1515870810;
    int _580 = _474 + _446;
    int _582 = _580 + _478;
    int _584 = _572 + _556;
    int _586 = _584 + _576;
    bool _588 = !_568;
    int _590 = _588 ? 0 : 8;
    int _592 = _582 + _552;
    bool _594 = as_type<int>(_88) != (-842150451);
    int _596 = _500 + _490;
    int _598 = _596 + _542;
    int _600 = _586 + _590;
    int _602 = _546 ? 0 : 4;
    bool _604 = as_type<int>(_88) != (-572662307);
    int _606 = _598 + _514;
    int _608 = _498 + _480;
    int _610 = _608 + _544;
    int _612 = _592 * 16;
    int _614 = _612 + _600;
    int _616 = _594 ? 0 : 8;
    bool _618 = as_type<int>(_88) != 1515870810;
    int _620 = _606 * 256;
    int _622 = _620 + _614;
    int _624 = _138 ? 0 : 2;
    int _626 = _610 + _616;
    int _628 = _550 ? 0 : 4;
    int _630 = _578 ? 0 : 1;
    int _632 = _626 * 4096;
    int _634 = _632 + _622;
    int _636 = _602 + _492;
    int _638 = _636 + _484;
    int _640 = _604 ? 0 : 8;
    int _642 = _628 + _624;
    int _644 = _642 + _630;
    int _646 = _618 ? 0 : 8;
    int _648 = _638 + _640;
    int _650 = _644 + _646;
    int _652 = _648 * 65536;
    int _654 = _652 + _634;
    int _656 = _650 * 1048576;
    int _658 = _656 + _654;
    int _660 = _444;
    int _662 = _434;
    int _664 = 31;
    int _666;
    int _1508 = _47(_660, _662, _664, _666, gl_SubgroupInvocationID);
    int _668 = _1508;
    int _670 = _668 + _548;
    int _672 = _670 * 16;
    int _674 = _672 + 16;
    int _676 = _672 + 20;
    uint _678 = uint(int(uint(_674) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_678)] = uint(_57);
    uint _680 = uint(int(uint(_676) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_680)] = uint(_658);
}

