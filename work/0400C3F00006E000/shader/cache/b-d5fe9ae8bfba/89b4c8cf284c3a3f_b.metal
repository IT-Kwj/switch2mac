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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _46 = as_type<float>(gl_WorkGroupID.x);
    float _48 = as_type<float>(gl_LocalInvocationID.x);
    int _51 = as_type<int>(_46) << 6;
    int _53 = _51 + as_type<int>(_48);
    int _55 = _53 * 80;
    int _57 = _55 + 60;
    uint _60 = uint(int(uint(_57) >> uint(2)));
    float _62 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_60)]);
    bool _66 = as_type<int>(_62) != (-1);
    if (!_66)
    {
        return;
    }
    int _68 = _53 << 2;
    uint _70 = uint(int(uint(_68) >> uint(2)));
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_70)]);
    int _74 = _55 + 16;
    bool _76 = _72 >= 0.0199999995529651641845703125;
    bool _78 = isnan(_72);
    bool _80 = _76 || _78;
    bool _82 = isnan(0.0199999995529651641845703125);
    bool _84 = _80 || _82;
    if (!_84)
    {
        return;
    }
    int _86 = _74 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_88)]);
    int _92 = _55 + 32;
    int _94 = _55 + 12;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_96)]);
    int _100 = _55 + 56;
    int _102 = _92 + 12;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_104)]);
    uint _108 = uint(int(uint(_100) >> uint(2)));
    float _110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_108)]);
    float _112 = _90 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _114 = _90 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _116 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[1].x, _112);
    float _118 = _90 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _120 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[0].x, _114);
    float _122 = _90 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _124 = fma(_106, (*spvDescriptorSet0.cp_c3)._m0[1].z, _116);
    float _126 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[2].x, _118);
    float _128 = fma(_106, (*spvDescriptorSet0.cp_c3)._m0[0].z, _120);
    float _130 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[3].x, _122);
    float _132 = _124 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _134 = fma(_106, (*spvDescriptorSet0.cp_c3)._m0[2].z, _126);
    float _136 = _128 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _138 = fma(_106, (*spvDescriptorSet0.cp_c3)._m0[3].z, _130);
    bool _140 = _132 >= _110;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan(_110);
    bool _148 = _144 || _146;
    float _150 = _134 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _152 = _136 < _110;
    bool _154 = !_148;
    bool _156 = _152 && _154;
    float _158 = _138 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _160 = _150 < _110;
    bool _162 = _160 && _156;
    bool _164 = _158 < _110;
    bool _166 = _164 && _162;
    if (!_166)
    {
        return;
    }
    int _168 = as_type<int>(_62) << 2;
    int _170 = _168 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _172 = uint(_170) < uint(_168);
    int _174 = int(_172);
    int _176 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _174;
    uint _178 = spvSubgroupBallot(true).x;
    float _180 = spvSubgroupShuffle(as_type<float>(_170), 0u);
    bool _182 = as_type<int>(_180) == _170;
    float _184 = spvSubgroupShuffle(as_type<float>(_176), 0u);
    bool _186 = as_type<int>(_184) == _176;
    bool _188 = _182 && _186;
    int _190 = int(_188);
    float _192 = spvSubgroupShuffle(as_type<float>(_170), 1u);
    bool _194 = as_type<int>(_192) == _170;
    float _196 = spvSubgroupShuffle(as_type<float>(_176), 1u);
    bool _198 = as_type<int>(_196) == _176;
    bool _200 = _194 && _198;
    int _202 = _200 ? 2 : 0;
    int _204 = _190 | _202;
    float _206 = spvSubgroupShuffle(as_type<float>(_170), 2u);
    bool _208 = as_type<int>(_206) == _170;
    float _210 = spvSubgroupShuffle(as_type<float>(_176), 2u);
    bool _212 = as_type<int>(_210) == _176;
    bool _214 = _208 && _212;
    int _216 = _214 ? 4 : 0;
    int _218 = _204 | _216;
    float _220 = spvSubgroupShuffle(as_type<float>(_170), 3u);
    bool _222 = as_type<int>(_220) == _170;
    float _224 = spvSubgroupShuffle(as_type<float>(_176), 3u);
    bool _226 = as_type<int>(_224) == _176;
    bool _228 = _222 && _226;
    int _230 = _228 ? 8 : 0;
    int _232 = _218 | _230;
    float _234 = spvSubgroupShuffle(as_type<float>(_170), 4u);
    bool _236 = as_type<int>(_234) == _170;
    float _238 = spvSubgroupShuffle(as_type<float>(_176), 4u);
    bool _240 = as_type<int>(_238) == _176;
    bool _242 = _236 && _240;
    int _244 = _242 ? 16 : 0;
    int _246 = _232 | _244;
    float _248 = spvSubgroupShuffle(as_type<float>(_170), 5u);
    bool _250 = as_type<int>(_248) == _170;
    float _252 = spvSubgroupShuffle(as_type<float>(_176), 5u);
    bool _254 = as_type<int>(_252) == _176;
    bool _256 = _250 && _254;
    int _258 = _256 ? 32 : 0;
    int _260 = _246 | _258;
    float _262 = spvSubgroupShuffle(as_type<float>(_170), 6u);
    bool _264 = as_type<int>(_262) == _170;
    float _266 = spvSubgroupShuffle(as_type<float>(_176), 6u);
    bool _268 = as_type<int>(_266) == _176;
    bool _270 = _264 && _268;
    int _272 = _270 ? 64 : 0;
    int _274 = _260 | _272;
    float _276 = spvSubgroupShuffle(as_type<float>(_170), 7u);
    bool _278 = as_type<int>(_276) == _170;
    float _280 = spvSubgroupShuffle(as_type<float>(_176), 7u);
    bool _282 = as_type<int>(_280) == _176;
    bool _284 = _278 && _282;
    int _286 = _284 ? 128 : 0;
    int _288 = _274 | _286;
    float _290 = spvSubgroupShuffle(as_type<float>(_170), 8u);
    bool _292 = as_type<int>(_290) == _170;
    float _294 = spvSubgroupShuffle(as_type<float>(_176), 8u);
    bool _296 = as_type<int>(_294) == _176;
    bool _298 = _292 && _296;
    int _300 = _298 ? 256 : 0;
    int _302 = _288 | _300;
    float _304 = spvSubgroupShuffle(as_type<float>(_170), 9u);
    bool _306 = as_type<int>(_304) == _170;
    float _308 = spvSubgroupShuffle(as_type<float>(_176), 9u);
    bool _310 = as_type<int>(_308) == _176;
    bool _312 = _306 && _310;
    int _314 = _312 ? 512 : 0;
    int _316 = _302 | _314;
    float _318 = spvSubgroupShuffle(as_type<float>(_170), 10u);
    bool _320 = as_type<int>(_318) == _170;
    float _322 = spvSubgroupShuffle(as_type<float>(_176), 10u);
    bool _324 = as_type<int>(_322) == _176;
    bool _326 = _320 && _324;
    int _328 = _326 ? 1024 : 0;
    int _330 = _316 | _328;
    float _332 = spvSubgroupShuffle(as_type<float>(_170), 11u);
    bool _334 = as_type<int>(_332) == _170;
    float _336 = spvSubgroupShuffle(as_type<float>(_176), 11u);
    bool _338 = as_type<int>(_336) == _176;
    bool _340 = _334 && _338;
    int _342 = _340 ? 2048 : 0;
    int _344 = _330 | _342;
    float _346 = spvSubgroupShuffle(as_type<float>(_170), 12u);
    bool _348 = as_type<int>(_346) == _170;
    float _350 = spvSubgroupShuffle(as_type<float>(_176), 12u);
    bool _352 = as_type<int>(_350) == _176;
    bool _354 = _348 && _352;
    int _356 = _354 ? 4096 : 0;
    int _358 = _344 | _356;
    float _360 = spvSubgroupShuffle(as_type<float>(_170), 13u);
    bool _362 = as_type<int>(_360) == _170;
    float _364 = spvSubgroupShuffle(as_type<float>(_176), 13u);
    bool _366 = as_type<int>(_364) == _176;
    bool _368 = _362 && _366;
    int _370 = _368 ? 8192 : 0;
    int _372 = _358 | _370;
    float _374 = spvSubgroupShuffle(as_type<float>(_170), 14u);
    bool _376 = as_type<int>(_374) == _170;
    float _378 = spvSubgroupShuffle(as_type<float>(_176), 14u);
    bool _380 = as_type<int>(_378) == _176;
    bool _382 = _376 && _380;
    int _384 = _382 ? 16384 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_170), 15u);
    bool _390 = as_type<int>(_388) == _170;
    float _392 = spvSubgroupShuffle(as_type<float>(_176), 15u);
    bool _394 = as_type<int>(_392) == _176;
    bool _396 = _390 && _394;
    int _398 = _396 ? 32768 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_170), 16u);
    bool _404 = as_type<int>(_402) == _170;
    float _406 = spvSubgroupShuffle(as_type<float>(_176), 16u);
    bool _408 = as_type<int>(_406) == _176;
    bool _410 = _404 && _408;
    int _412 = _410 ? 65536 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_170), 17u);
    bool _418 = as_type<int>(_416) == _170;
    float _420 = spvSubgroupShuffle(as_type<float>(_176), 17u);
    bool _422 = as_type<int>(_420) == _176;
    bool _424 = _418 && _422;
    int _426 = _424 ? 131072 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_170), 18u);
    bool _432 = as_type<int>(_430) == _170;
    float _434 = spvSubgroupShuffle(as_type<float>(_176), 18u);
    bool _436 = as_type<int>(_434) == _176;
    bool _438 = _432 && _436;
    int _440 = _438 ? 262144 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_170), 19u);
    bool _446 = as_type<int>(_444) == _170;
    float _448 = spvSubgroupShuffle(as_type<float>(_176), 19u);
    bool _450 = as_type<int>(_448) == _176;
    bool _452 = _446 && _450;
    int _454 = _452 ? 524288 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_170), 20u);
    bool _460 = as_type<int>(_458) == _170;
    float _462 = spvSubgroupShuffle(as_type<float>(_176), 20u);
    bool _464 = as_type<int>(_462) == _176;
    bool _466 = _460 && _464;
    int _468 = _466 ? 1048576 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_170), 21u);
    bool _474 = as_type<int>(_472) == _170;
    float _476 = spvSubgroupShuffle(as_type<float>(_176), 21u);
    bool _478 = as_type<int>(_476) == _176;
    bool _480 = _474 && _478;
    int _482 = _480 ? 2097152 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_170), 22u);
    bool _488 = as_type<int>(_486) == _170;
    float _490 = spvSubgroupShuffle(as_type<float>(_176), 22u);
    bool _492 = as_type<int>(_490) == _176;
    bool _494 = _488 && _492;
    int _496 = _494 ? 4194304 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_170), 23u);
    bool _502 = as_type<int>(_500) == _170;
    float _504 = spvSubgroupShuffle(as_type<float>(_176), 23u);
    bool _506 = as_type<int>(_504) == _176;
    bool _508 = _502 && _506;
    int _510 = _508 ? 8388608 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_170), 24u);
    bool _516 = as_type<int>(_514) == _170;
    float _518 = spvSubgroupShuffle(as_type<float>(_176), 24u);
    bool _520 = as_type<int>(_518) == _176;
    bool _522 = _516 && _520;
    int _524 = _522 ? 16777216 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_170), 25u);
    bool _530 = as_type<int>(_528) == _170;
    float _532 = spvSubgroupShuffle(as_type<float>(_176), 25u);
    bool _534 = as_type<int>(_532) == _176;
    bool _536 = _530 && _534;
    int _538 = _536 ? 33554432 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_170), 26u);
    bool _544 = as_type<int>(_542) == _170;
    float _546 = spvSubgroupShuffle(as_type<float>(_176), 26u);
    bool _548 = as_type<int>(_546) == _176;
    bool _550 = _544 && _548;
    int _552 = _550 ? 67108864 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_170), 27u);
    bool _558 = as_type<int>(_556) == _170;
    float _560 = spvSubgroupShuffle(as_type<float>(_176), 27u);
    bool _562 = as_type<int>(_560) == _176;
    bool _564 = _558 && _562;
    int _566 = _564 ? 134217728 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_170), 28u);
    bool _572 = as_type<int>(_570) == _170;
    float _574 = spvSubgroupShuffle(as_type<float>(_176), 28u);
    bool _576 = as_type<int>(_574) == _176;
    bool _578 = _572 && _576;
    int _580 = _578 ? 268435456 : 0;
    int _582 = _568 | _580;
    float _584 = spvSubgroupShuffle(as_type<float>(_170), 29u);
    bool _586 = as_type<int>(_584) == _170;
    float _588 = spvSubgroupShuffle(as_type<float>(_176), 29u);
    bool _590 = as_type<int>(_588) == _176;
    bool _592 = _586 && _590;
    int _594 = _592 ? 536870912 : 0;
    int _596 = _582 | _594;
    float _598 = spvSubgroupShuffle(as_type<float>(_170), 30u);
    bool _600 = as_type<int>(_598) == _170;
    float _602 = spvSubgroupShuffle(as_type<float>(_176), 30u);
    bool _604 = as_type<int>(_602) == _176;
    bool _606 = _600 && _604;
    int _608 = _606 ? 1073741824 : 0;
    int _610 = _596 | _608;
    float _612 = spvSubgroupShuffle(as_type<float>(_170), 31u);
    bool _614 = as_type<int>(_612) == _170;
    float _616 = spvSubgroupShuffle(as_type<float>(_176), 31u);
    bool _618 = as_type<int>(_616) == _176;
    bool _620 = _614 && _618;
    int _622 = _620 ? int(0x80000000) : 0;
    int _624 = _610 | _622;
    int _626 = _624 & int(_178);
    bool _628 = _626 == int(_178);
    if (!_628)
    {
        uint _630 = uint(int(uint(_168) >> uint(2)));
        uint _1679 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_630)], 1u, memory_order_relaxed);
        uint _632 = _1679;
    }
    if (!_628)
    {
        return;
    }
    float _634 = as_type<float>(gl_SubgroupInvocationID);
    uint _636 = spvSubgroupBallot(true).x;
    int _638 = int(spvFindUMSB(_636));
    int _640 = popcount(int(_636));
    bool _642 = as_type<int>(_634) == _638;
    if (_642)
    {
        uint _644 = uint(int(uint(_168) >> uint(2)));
        uint _1709 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_644)], uint(_640), memory_order_relaxed);
        uint _646 = _1709;
    }
}

