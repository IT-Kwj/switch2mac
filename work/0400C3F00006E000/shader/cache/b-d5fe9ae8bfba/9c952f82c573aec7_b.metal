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
    bool _74 = as_type<int>(_72) != (-1);
    if (!_74)
    {
        return;
    }
    int _76 = as_type<int>(_72) * 20;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_78)]);
    int _82 = _63 + 48;
    int _84 = as_type<int>(_80) & 2;
    bool _86 = _84 != 0;
    if (!_86)
    {
        return;
    }
    uint _88 = uint(int(uint(_82) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    int _92 = _82 + 4;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
    int _98 = _82 + 8;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
    int _104 = _82 + 12;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    float _108 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_106)]);
    int _110 = _63 + 92;
    float _112 = _96 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _114 = _96 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _116 = _96 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _118 = _96 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _120 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[1].x, _112);
    float _122 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[0].x, _114);
    float _124 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[2].x, _116);
    float _126 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[3].x, _118);
    float _128 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[1].z, _120);
    float _130 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[0].z, _122);
    float _132 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[2].z, _124);
    float _134 = fma(_102, (*spvDescriptorSet0.cp_c3)._m0[3].z, _126);
    float _136 = _128 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _138 = _130 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _140 = _136 >= _108;
    bool _142 = isnan(_136);
    bool _144 = _140 || _142;
    bool _146 = isnan(_108);
    bool _148 = _144 || _146;
    float _150 = _132 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _152 = _138 < _108;
    bool _154 = !_148;
    bool _156 = _152 && _154;
    float _158 = _134 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _160 = _150 < _108;
    bool _162 = _160 && _156;
    bool _164 = _158 < _108;
    bool _166 = _164 && _162;
    if (!_166)
    {
        return;
    }
    uint _168 = uint(int(uint(_110) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    float _172 = -_96;
    float _174 = _172 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _176 = -_90;
    float _178 = _176 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _180 = -_102;
    float _182 = _180 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _184 = _174 * _174;
    float _186 = fma(_178, _178, _184);
    float _188 = fma(_182, _182, _186);
    float _190 = precise::min(_170, 300.0);
    float _192 = _190 * _190;
    bool _194 = _188 > _192;
    if (_194)
    {
        return;
    }
    int _196 = as_type<int>(_72) << 3;
    int _198 = _196 + 4;
    int _200 = _198 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _202 = uint(_200) < uint(_198);
    int _204 = int(_202);
    bool _206 = uint(_200) < uint(_200);
    int _208 = int(_206);
    int _210 = _204 + _208;
    int _212 = _210 & 1;
    bool _214 = _212 != 0;
    int _216 = int(_214);
    int _218 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _216;
    uint _220 = spvSubgroupBallot(true).x;
    float _222 = spvSubgroupShuffle(as_type<float>(_200), 0u);
    bool _224 = as_type<int>(_222) == _200;
    float _226 = spvSubgroupShuffle(as_type<float>(_218), 0u);
    bool _228 = as_type<int>(_226) == _218;
    bool _230 = _224 && _228;
    int _232 = int(_230);
    float _234 = spvSubgroupShuffle(as_type<float>(_200), 1u);
    bool _236 = as_type<int>(_234) == _200;
    float _238 = spvSubgroupShuffle(as_type<float>(_218), 1u);
    bool _240 = as_type<int>(_238) == _218;
    bool _242 = _236 && _240;
    int _244 = _242 ? 2 : 0;
    int _246 = _232 | _244;
    float _248 = spvSubgroupShuffle(as_type<float>(_200), 2u);
    bool _250 = as_type<int>(_248) == _200;
    float _252 = spvSubgroupShuffle(as_type<float>(_218), 2u);
    bool _254 = as_type<int>(_252) == _218;
    bool _256 = _250 && _254;
    int _258 = _256 ? 4 : 0;
    int _260 = _246 | _258;
    float _262 = spvSubgroupShuffle(as_type<float>(_200), 3u);
    bool _264 = as_type<int>(_262) == _200;
    float _266 = spvSubgroupShuffle(as_type<float>(_218), 3u);
    bool _268 = as_type<int>(_266) == _218;
    bool _270 = _264 && _268;
    int _272 = _270 ? 8 : 0;
    int _274 = _260 | _272;
    float _276 = spvSubgroupShuffle(as_type<float>(_200), 4u);
    bool _278 = as_type<int>(_276) == _200;
    float _280 = spvSubgroupShuffle(as_type<float>(_218), 4u);
    bool _282 = as_type<int>(_280) == _218;
    bool _284 = _278 && _282;
    int _286 = _284 ? 16 : 0;
    int _288 = _274 | _286;
    float _290 = spvSubgroupShuffle(as_type<float>(_200), 5u);
    bool _292 = as_type<int>(_290) == _200;
    float _294 = spvSubgroupShuffle(as_type<float>(_218), 5u);
    bool _296 = as_type<int>(_294) == _218;
    bool _298 = _292 && _296;
    int _300 = _298 ? 32 : 0;
    int _302 = _288 | _300;
    float _304 = spvSubgroupShuffle(as_type<float>(_200), 6u);
    bool _306 = as_type<int>(_304) == _200;
    float _308 = spvSubgroupShuffle(as_type<float>(_218), 6u);
    bool _310 = as_type<int>(_308) == _218;
    bool _312 = _306 && _310;
    int _314 = _312 ? 64 : 0;
    int _316 = _302 | _314;
    float _318 = spvSubgroupShuffle(as_type<float>(_200), 7u);
    bool _320 = as_type<int>(_318) == _200;
    float _322 = spvSubgroupShuffle(as_type<float>(_218), 7u);
    bool _324 = as_type<int>(_322) == _218;
    bool _326 = _320 && _324;
    int _328 = _326 ? 128 : 0;
    int _330 = _316 | _328;
    float _332 = spvSubgroupShuffle(as_type<float>(_200), 8u);
    bool _334 = as_type<int>(_332) == _200;
    float _336 = spvSubgroupShuffle(as_type<float>(_218), 8u);
    bool _338 = as_type<int>(_336) == _218;
    bool _340 = _334 && _338;
    int _342 = _340 ? 256 : 0;
    int _344 = _330 | _342;
    float _346 = spvSubgroupShuffle(as_type<float>(_200), 9u);
    bool _348 = as_type<int>(_346) == _200;
    float _350 = spvSubgroupShuffle(as_type<float>(_218), 9u);
    bool _352 = as_type<int>(_350) == _218;
    bool _354 = _348 && _352;
    int _356 = _354 ? 512 : 0;
    int _358 = _344 | _356;
    float _360 = spvSubgroupShuffle(as_type<float>(_200), 10u);
    bool _362 = as_type<int>(_360) == _200;
    float _364 = spvSubgroupShuffle(as_type<float>(_218), 10u);
    bool _366 = as_type<int>(_364) == _218;
    bool _368 = _362 && _366;
    int _370 = _368 ? 1024 : 0;
    int _372 = _358 | _370;
    float _374 = spvSubgroupShuffle(as_type<float>(_200), 11u);
    bool _376 = as_type<int>(_374) == _200;
    float _378 = spvSubgroupShuffle(as_type<float>(_218), 11u);
    bool _380 = as_type<int>(_378) == _218;
    bool _382 = _376 && _380;
    int _384 = _382 ? 2048 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_200), 12u);
    bool _390 = as_type<int>(_388) == _200;
    float _392 = spvSubgroupShuffle(as_type<float>(_218), 12u);
    bool _394 = as_type<int>(_392) == _218;
    bool _396 = _390 && _394;
    int _398 = _396 ? 4096 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_200), 13u);
    bool _404 = as_type<int>(_402) == _200;
    float _406 = spvSubgroupShuffle(as_type<float>(_218), 13u);
    bool _408 = as_type<int>(_406) == _218;
    bool _410 = _404 && _408;
    int _412 = _410 ? 8192 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_200), 14u);
    bool _418 = as_type<int>(_416) == _200;
    float _420 = spvSubgroupShuffle(as_type<float>(_218), 14u);
    bool _422 = as_type<int>(_420) == _218;
    bool _424 = _418 && _422;
    int _426 = _424 ? 16384 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_200), 15u);
    bool _432 = as_type<int>(_430) == _200;
    float _434 = spvSubgroupShuffle(as_type<float>(_218), 15u);
    bool _436 = as_type<int>(_434) == _218;
    bool _438 = _432 && _436;
    int _440 = _438 ? 32768 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_200), 16u);
    bool _446 = as_type<int>(_444) == _200;
    float _448 = spvSubgroupShuffle(as_type<float>(_218), 16u);
    bool _450 = as_type<int>(_448) == _218;
    bool _452 = _446 && _450;
    int _454 = _452 ? 65536 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_200), 17u);
    bool _460 = as_type<int>(_458) == _200;
    float _462 = spvSubgroupShuffle(as_type<float>(_218), 17u);
    bool _464 = as_type<int>(_462) == _218;
    bool _466 = _460 && _464;
    int _468 = _466 ? 131072 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_200), 18u);
    bool _474 = as_type<int>(_472) == _200;
    float _476 = spvSubgroupShuffle(as_type<float>(_218), 18u);
    bool _478 = as_type<int>(_476) == _218;
    bool _480 = _474 && _478;
    int _482 = _480 ? 262144 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_200), 19u);
    bool _488 = as_type<int>(_486) == _200;
    float _490 = spvSubgroupShuffle(as_type<float>(_218), 19u);
    bool _492 = as_type<int>(_490) == _218;
    bool _494 = _488 && _492;
    int _496 = _494 ? 524288 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_200), 20u);
    bool _502 = as_type<int>(_500) == _200;
    float _504 = spvSubgroupShuffle(as_type<float>(_218), 20u);
    bool _506 = as_type<int>(_504) == _218;
    bool _508 = _502 && _506;
    int _510 = _508 ? 1048576 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_200), 21u);
    bool _516 = as_type<int>(_514) == _200;
    float _518 = spvSubgroupShuffle(as_type<float>(_218), 21u);
    bool _520 = as_type<int>(_518) == _218;
    bool _522 = _516 && _520;
    int _524 = _522 ? 2097152 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_200), 22u);
    bool _530 = as_type<int>(_528) == _200;
    float _532 = spvSubgroupShuffle(as_type<float>(_218), 22u);
    bool _534 = as_type<int>(_532) == _218;
    bool _536 = _530 && _534;
    int _538 = _536 ? 4194304 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_200), 23u);
    bool _544 = as_type<int>(_542) == _200;
    float _546 = spvSubgroupShuffle(as_type<float>(_218), 23u);
    bool _548 = as_type<int>(_546) == _218;
    bool _550 = _544 && _548;
    int _552 = _550 ? 8388608 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_200), 24u);
    bool _558 = as_type<int>(_556) == _200;
    float _560 = spvSubgroupShuffle(as_type<float>(_218), 24u);
    bool _562 = as_type<int>(_560) == _218;
    bool _564 = _558 && _562;
    int _566 = _564 ? 16777216 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_200), 25u);
    bool _572 = as_type<int>(_570) == _200;
    float _574 = spvSubgroupShuffle(as_type<float>(_218), 25u);
    bool _576 = as_type<int>(_574) == _218;
    bool _578 = _572 && _576;
    int _580 = _578 ? 33554432 : 0;
    int _582 = _568 | _580;
    float _584 = spvSubgroupShuffle(as_type<float>(_200), 26u);
    bool _586 = as_type<int>(_584) == _200;
    float _588 = spvSubgroupShuffle(as_type<float>(_218), 26u);
    bool _590 = as_type<int>(_588) == _218;
    bool _592 = _586 && _590;
    int _594 = _592 ? 67108864 : 0;
    int _596 = _582 | _594;
    float _598 = spvSubgroupShuffle(as_type<float>(_200), 27u);
    bool _600 = as_type<int>(_598) == _200;
    float _602 = spvSubgroupShuffle(as_type<float>(_218), 27u);
    bool _604 = as_type<int>(_602) == _218;
    bool _606 = _600 && _604;
    int _608 = _606 ? 134217728 : 0;
    int _610 = _596 | _608;
    float _612 = spvSubgroupShuffle(as_type<float>(_200), 28u);
    bool _614 = as_type<int>(_612) == _200;
    float _616 = spvSubgroupShuffle(as_type<float>(_218), 28u);
    bool _618 = as_type<int>(_616) == _218;
    bool _620 = _614 && _618;
    int _622 = _620 ? 268435456 : 0;
    int _624 = _610 | _622;
    float _626 = spvSubgroupShuffle(as_type<float>(_200), 29u);
    bool _628 = as_type<int>(_626) == _200;
    float _630 = spvSubgroupShuffle(as_type<float>(_218), 29u);
    bool _632 = as_type<int>(_630) == _218;
    bool _634 = _628 && _632;
    int _636 = _634 ? 536870912 : 0;
    int _638 = _624 | _636;
    float _640 = spvSubgroupShuffle(as_type<float>(_200), 30u);
    bool _642 = as_type<int>(_640) == _200;
    float _644 = spvSubgroupShuffle(as_type<float>(_218), 30u);
    bool _646 = as_type<int>(_644) == _218;
    bool _648 = _642 && _646;
    int _650 = _648 ? 1073741824 : 0;
    int _652 = _638 | _650;
    float _654 = spvSubgroupShuffle(as_type<float>(_200), 31u);
    bool _656 = as_type<int>(_654) == _200;
    float _658 = spvSubgroupShuffle(as_type<float>(_218), 31u);
    bool _660 = as_type<int>(_658) == _218;
    bool _662 = _656 && _660;
    int _664 = _662 ? int(0x80000000) : 0;
    int _666 = _652 | _664;
    int _668 = _666 & int(_220);
    bool _670 = _668 == int(_220);
    if (!_670)
    {
        uint _672 = uint(int(uint(_198) >> uint(2)));
        uint _1794 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_672)], 1u, memory_order_relaxed);
        uint _674 = _1794;
    }
    if (!_670)
    {
        return;
    }
    float _676 = as_type<float>(gl_SubgroupInvocationID);
    uint _678 = spvSubgroupBallot(true).x;
    int _680 = int(spvFindUMSB(_678));
    int _682 = popcount(int(_678));
    bool _684 = as_type<int>(_676) == _680;
    if (_684)
    {
        uint _686 = uint(int(uint(_198) >> uint(2)));
        uint _1824 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_686)], uint(_682), memory_order_relaxed);
        uint _688 = _1824;
    }
}

