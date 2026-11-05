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
    constant _16* cp_c4 [[id(2)]];
    device _25* cp_s0 [[id(3)]];
    device _25* cp_s1 [[id(4)]];
    device _25* cp_s2 [[id(5)]];
    device _25* cp_s3 [[id(6)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _2554, thread const int& _2555, thread const int& _2556, thread int& _2557, thread uint& gl_SubgroupInvocationID)
{
    int _2560 = _2556 & 31;
    uint _2562 = uint(int(uint(_2556) >> uint(8)));
    int _2564 = int(_2562) & 31;
    float _2566 = as_type<float>(gl_SubgroupInvocationID);
    int _2568 = as_type<int>(_2566) & _2564;
    int _2570 = ~_2564;
    int _2572 = _2560 & _2570;
    int _2574 = _2572 | _2568;
    int _2576 = ~_2564;
    int _2578 = _2555 & _2576;
    int _2580 = _2578 | _2568;
    bool _2582 = uint(_2580) <= uint(_2574);
    _2557 = _2582 ? (-1) : 0;
    float _2584 = spvSubgroupShuffle(as_type<float>(_2554), uint(_2580));
    uint _2586 = uint(_2582 ? as_type<int>(_2584) : _2554);
    return int(_2586);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    int _61 = as_type<int>(_57) << 6;
    int _63 = _61 + as_type<int>(_59);
    int _65 = _63 * 80;
    int _67 = _65 + 60;
    uint _70 = uint(int(uint(_67) >> uint(2)));
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_70)]);
    bool _76 = as_type<int>(_72) != (-1);
    if (!_76)
    {
        return;
    }
    int _78 = _63 << 2;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_80)]);
    int _84 = _65 + 16;
    bool _86 = _82 >= 0.0199999995529651641845703125;
    bool _88 = isnan(_82);
    bool _90 = _86 || _88;
    bool _92 = isnan(0.0199999995529651641845703125);
    bool _94 = _90 || _92;
    if (!_94)
    {
        return;
    }
    uint _96 = uint(int(uint(_84) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_96)]);
    int _100 = _84 + 4;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_102)]);
    int _106 = _84 + 8;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_108)]);
    int _112 = _84 + 12;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_114)]);
    int _118 = _65 + 32;
    uint _120 = uint(int(uint(_65) >> uint(2)));
    float _122 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_120)]);
    int _124 = _65 + 4;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_126)]);
    int _130 = _65 + 8;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_132)]);
    int _136 = _65 + 12;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_138)]);
    int _142 = _65 + 56;
    uint _144 = uint(int(uint(_118) >> uint(2)));
    float _146 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_144)]);
    int _148 = _118 + 4;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_150)]);
    int _154 = _118 + 8;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_156)]);
    int _160 = _118 + 12;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_162)]);
    uint _166 = uint(int(uint(_142) >> uint(2)));
    float _168 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_166)]);
    float _170 = _116 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _172 = _116 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _174 = _116 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _176 = _116 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _178 = fma(_140, (*spvDescriptorSet0.cp_c3)._m0[1].x, _170);
    float _180 = fma(_140, (*spvDescriptorSet0.cp_c3)._m0[0].x, _172);
    float _182 = fma(_140, (*spvDescriptorSet0.cp_c3)._m0[2].x, _174);
    float _184 = fma(_140, (*spvDescriptorSet0.cp_c3)._m0[3].x, _176);
    float _186 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[1].z, _178);
    float _188 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[0].z, _180);
    float _190 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[2].z, _182);
    float _192 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[3].z, _184);
    float _194 = _186 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _196 = _188 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _198 = _194 >= _168;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan(_168);
    bool _206 = _202 || _204;
    float _208 = _190 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _210 = _196 < _168;
    bool _212 = !_206;
    bool _214 = _210 && _212;
    float _216 = _192 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _218 = _208 < _168;
    bool _220 = _218 && _214;
    bool _222 = _216 < _168;
    bool _224 = _222 && _220;
    if (!_224)
    {
        return;
    }
    int _226 = as_type<int>(_72) * 20;
    int _228 = _65 + 48;
    int _230 = _226 + 4;
    int _232 = _65 + 64;
    uint _234 = uint(int(uint(_228) >> uint(2)));
    float _236 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_234)]);
    int _238 = _228 + 4;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_240)]);
    int _244 = _230 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[50].x);
    bool _246 = uint(_244) < uint(_230);
    int _248 = int(_246);
    bool _250 = uint(_244) < uint(_244);
    int _252 = int(_250);
    int _254 = _248 + _252;
    int _256 = _254 & 1;
    bool _258 = _256 != 0;
    int _260 = int(_258);
    int _262 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[50].y) + _260;
    uint _264 = uint(int(uint(_232) >> uint(2)));
    float _266 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_264)]);
    int _268 = _232 + 4;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_270)]);
    uint _274 = spvSubgroupBallot(true).x;
    float _276 = spvSubgroupShuffle(as_type<float>(_244), 0u);
    bool _278 = as_type<int>(_276) == _244;
    float _280 = spvSubgroupShuffle(as_type<float>(_262), 0u);
    bool _282 = as_type<int>(_280) == _262;
    bool _284 = _278 && _282;
    int _286 = int(_284);
    float _288 = spvSubgroupShuffle(as_type<float>(_244), 1u);
    bool _290 = as_type<int>(_288) == _244;
    float _292 = spvSubgroupShuffle(as_type<float>(_262), 1u);
    bool _294 = as_type<int>(_292) == _262;
    bool _296 = _290 && _294;
    int _298 = _296 ? 2 : 0;
    int _300 = _286 | _298;
    float _302 = spvSubgroupShuffle(as_type<float>(_244), 2u);
    bool _304 = as_type<int>(_302) == _244;
    float _306 = spvSubgroupShuffle(as_type<float>(_262), 2u);
    bool _308 = as_type<int>(_306) == _262;
    bool _310 = _304 && _308;
    int _312 = _310 ? 4 : 0;
    int _314 = _300 | _312;
    float _316 = spvSubgroupShuffle(as_type<float>(_244), 3u);
    bool _318 = as_type<int>(_316) == _244;
    float _320 = spvSubgroupShuffle(as_type<float>(_262), 3u);
    bool _322 = as_type<int>(_320) == _262;
    bool _324 = _318 && _322;
    int _326 = _324 ? 8 : 0;
    int _328 = _314 | _326;
    float _330 = spvSubgroupShuffle(as_type<float>(_244), 4u);
    bool _332 = as_type<int>(_330) == _244;
    float _334 = spvSubgroupShuffle(as_type<float>(_262), 4u);
    bool _336 = as_type<int>(_334) == _262;
    bool _338 = _332 && _336;
    int _340 = _338 ? 16 : 0;
    int _342 = _328 | _340;
    float _344 = spvSubgroupShuffle(as_type<float>(_244), 5u);
    bool _346 = as_type<int>(_344) == _244;
    float _348 = spvSubgroupShuffle(as_type<float>(_262), 5u);
    bool _350 = as_type<int>(_348) == _262;
    bool _352 = _346 && _350;
    int _354 = _352 ? 32 : 0;
    int _356 = _342 | _354;
    float _358 = spvSubgroupShuffle(as_type<float>(_244), 6u);
    bool _360 = as_type<int>(_358) == _244;
    float _362 = spvSubgroupShuffle(as_type<float>(_262), 6u);
    bool _364 = as_type<int>(_362) == _262;
    bool _366 = _360 && _364;
    int _368 = _366 ? 64 : 0;
    int _370 = _356 | _368;
    float _372 = spvSubgroupShuffle(as_type<float>(_244), 7u);
    bool _374 = as_type<int>(_372) == _244;
    float _376 = spvSubgroupShuffle(as_type<float>(_262), 7u);
    bool _378 = as_type<int>(_376) == _262;
    bool _380 = _374 && _378;
    int _382 = _380 ? 128 : 0;
    int _384 = _370 | _382;
    float _386 = spvSubgroupShuffle(as_type<float>(_244), 8u);
    bool _388 = as_type<int>(_386) == _244;
    float _390 = spvSubgroupShuffle(as_type<float>(_262), 8u);
    bool _392 = as_type<int>(_390) == _262;
    bool _394 = _388 && _392;
    int _396 = _394 ? 256 : 0;
    int _398 = _384 | _396;
    float _400 = spvSubgroupShuffle(as_type<float>(_244), 9u);
    bool _402 = as_type<int>(_400) == _244;
    float _404 = spvSubgroupShuffle(as_type<float>(_262), 9u);
    bool _406 = as_type<int>(_404) == _262;
    bool _408 = _402 && _406;
    int _410 = _408 ? 512 : 0;
    int _412 = _398 | _410;
    float _414 = spvSubgroupShuffle(as_type<float>(_244), 10u);
    bool _416 = as_type<int>(_414) == _244;
    float _418 = spvSubgroupShuffle(as_type<float>(_262), 10u);
    bool _420 = as_type<int>(_418) == _262;
    bool _422 = _416 && _420;
    int _424 = _422 ? 1024 : 0;
    int _426 = _412 | _424;
    float _428 = spvSubgroupShuffle(as_type<float>(_244), 11u);
    bool _430 = as_type<int>(_428) == _244;
    float _432 = spvSubgroupShuffle(as_type<float>(_262), 11u);
    bool _434 = as_type<int>(_432) == _262;
    bool _436 = _430 && _434;
    int _438 = _436 ? 2048 : 0;
    int _440 = _426 | _438;
    float _442 = spvSubgroupShuffle(as_type<float>(_244), 12u);
    bool _444 = as_type<int>(_442) == _244;
    float _446 = spvSubgroupShuffle(as_type<float>(_262), 12u);
    bool _448 = as_type<int>(_446) == _262;
    bool _450 = _444 && _448;
    int _452 = _450 ? 4096 : 0;
    int _454 = _440 | _452;
    float _456 = spvSubgroupShuffle(as_type<float>(_244), 13u);
    bool _458 = as_type<int>(_456) == _244;
    float _460 = spvSubgroupShuffle(as_type<float>(_262), 13u);
    bool _462 = as_type<int>(_460) == _262;
    bool _464 = _458 && _462;
    int _466 = _464 ? 8192 : 0;
    int _468 = _454 | _466;
    float _470 = spvSubgroupShuffle(as_type<float>(_244), 14u);
    bool _472 = as_type<int>(_470) == _244;
    float _474 = spvSubgroupShuffle(as_type<float>(_262), 14u);
    bool _476 = as_type<int>(_474) == _262;
    bool _478 = _472 && _476;
    int _480 = _478 ? 16384 : 0;
    int _482 = _468 | _480;
    float _484 = spvSubgroupShuffle(as_type<float>(_244), 15u);
    bool _486 = as_type<int>(_484) == _244;
    float _488 = spvSubgroupShuffle(as_type<float>(_262), 15u);
    bool _490 = as_type<int>(_488) == _262;
    bool _492 = _486 && _490;
    int _494 = _492 ? 32768 : 0;
    int _496 = _482 | _494;
    float _498 = spvSubgroupShuffle(as_type<float>(_244), 16u);
    bool _500 = as_type<int>(_498) == _244;
    float _502 = spvSubgroupShuffle(as_type<float>(_262), 16u);
    bool _504 = as_type<int>(_502) == _262;
    bool _506 = _500 && _504;
    int _508 = _506 ? 65536 : 0;
    int _510 = _496 | _508;
    float _512 = spvSubgroupShuffle(as_type<float>(_244), 17u);
    bool _514 = as_type<int>(_512) == _244;
    float _516 = spvSubgroupShuffle(as_type<float>(_262), 17u);
    bool _518 = as_type<int>(_516) == _262;
    bool _520 = _514 && _518;
    int _522 = _520 ? 131072 : 0;
    int _524 = _510 | _522;
    float _526 = spvSubgroupShuffle(as_type<float>(_244), 18u);
    bool _528 = as_type<int>(_526) == _244;
    float _530 = spvSubgroupShuffle(as_type<float>(_262), 18u);
    bool _532 = as_type<int>(_530) == _262;
    bool _534 = _528 && _532;
    int _536 = _534 ? 262144 : 0;
    int _538 = _524 | _536;
    float _540 = spvSubgroupShuffle(as_type<float>(_244), 19u);
    bool _542 = as_type<int>(_540) == _244;
    float _544 = spvSubgroupShuffle(as_type<float>(_262), 19u);
    bool _546 = as_type<int>(_544) == _262;
    bool _548 = _542 && _546;
    int _550 = _548 ? 524288 : 0;
    int _552 = _538 | _550;
    float _554 = spvSubgroupShuffle(as_type<float>(_244), 20u);
    bool _556 = as_type<int>(_554) == _244;
    float _558 = spvSubgroupShuffle(as_type<float>(_262), 20u);
    bool _560 = as_type<int>(_558) == _262;
    bool _562 = _556 && _560;
    int _564 = _562 ? 1048576 : 0;
    int _566 = _552 | _564;
    float _568 = spvSubgroupShuffle(as_type<float>(_244), 21u);
    bool _570 = as_type<int>(_568) == _244;
    float _572 = spvSubgroupShuffle(as_type<float>(_262), 21u);
    bool _574 = as_type<int>(_572) == _262;
    bool _576 = _570 && _574;
    int _578 = _576 ? 2097152 : 0;
    int _580 = _566 | _578;
    float _582 = spvSubgroupShuffle(as_type<float>(_244), 22u);
    bool _584 = as_type<int>(_582) == _244;
    float _586 = spvSubgroupShuffle(as_type<float>(_262), 22u);
    bool _588 = as_type<int>(_586) == _262;
    bool _590 = _584 && _588;
    int _592 = _590 ? 4194304 : 0;
    int _594 = _580 | _592;
    float _596 = spvSubgroupShuffle(as_type<float>(_244), 23u);
    bool _598 = as_type<int>(_596) == _244;
    float _600 = spvSubgroupShuffle(as_type<float>(_262), 23u);
    bool _602 = as_type<int>(_600) == _262;
    bool _604 = _598 && _602;
    int _606 = _604 ? 8388608 : 0;
    int _608 = _594 | _606;
    float _610 = spvSubgroupShuffle(as_type<float>(_244), 24u);
    bool _612 = as_type<int>(_610) == _244;
    float _614 = spvSubgroupShuffle(as_type<float>(_262), 24u);
    bool _616 = as_type<int>(_614) == _262;
    bool _618 = _612 && _616;
    int _620 = _618 ? 16777216 : 0;
    int _622 = _608 | _620;
    float _624 = spvSubgroupShuffle(as_type<float>(_244), 25u);
    bool _626 = as_type<int>(_624) == _244;
    float _628 = spvSubgroupShuffle(as_type<float>(_262), 25u);
    bool _630 = as_type<int>(_628) == _262;
    bool _632 = _626 && _630;
    int _634 = _632 ? 33554432 : 0;
    int _636 = _622 | _634;
    float _638 = spvSubgroupShuffle(as_type<float>(_244), 26u);
    bool _640 = as_type<int>(_638) == _244;
    float _642 = spvSubgroupShuffle(as_type<float>(_262), 26u);
    bool _644 = as_type<int>(_642) == _262;
    bool _646 = _640 && _644;
    int _648 = _646 ? 67108864 : 0;
    int _650 = _636 | _648;
    float _652 = spvSubgroupShuffle(as_type<float>(_244), 27u);
    bool _654 = as_type<int>(_652) == _244;
    float _656 = spvSubgroupShuffle(as_type<float>(_262), 27u);
    bool _658 = as_type<int>(_656) == _262;
    bool _660 = _654 && _658;
    int _662 = _660 ? 134217728 : 0;
    int _664 = _650 | _662;
    float _666 = spvSubgroupShuffle(as_type<float>(_244), 28u);
    bool _668 = as_type<int>(_666) == _244;
    float _670 = spvSubgroupShuffle(as_type<float>(_262), 28u);
    bool _672 = as_type<int>(_670) == _262;
    bool _674 = _668 && _672;
    int _676 = _674 ? 268435456 : 0;
    int _678 = _664 | _676;
    float _680 = spvSubgroupShuffle(as_type<float>(_244), 29u);
    bool _682 = as_type<int>(_680) == _244;
    float _684 = spvSubgroupShuffle(as_type<float>(_262), 29u);
    bool _686 = as_type<int>(_684) == _262;
    bool _688 = _682 && _686;
    int _690 = _688 ? 536870912 : 0;
    int _692 = _678 | _690;
    float _694 = spvSubgroupShuffle(as_type<float>(_244), 30u);
    bool _696 = as_type<int>(_694) == _244;
    float _698 = spvSubgroupShuffle(as_type<float>(_262), 30u);
    bool _700 = as_type<int>(_698) == _262;
    bool _702 = _696 && _700;
    int _704 = _702 ? 1073741824 : 0;
    int _706 = _692 | _704;
    float _708 = spvSubgroupShuffle(as_type<float>(_244), 31u);
    bool _710 = as_type<int>(_708) == _244;
    float _712 = spvSubgroupShuffle(as_type<float>(_262), 31u);
    bool _714 = as_type<int>(_712) == _262;
    bool _716 = _710 && _714;
    int _718 = _716 ? int(0x80000000) : 0;
    int _720 = _706 | _718;
    int _722 = _720 & int(_274);
    bool _724 = _722 == int(_274);
    int _726 = _226 + 16;
    int _728 = 1;
    if (!_724)
    {
        uint _730 = uint(int(uint(_230) >> uint(2)));
        uint _2136 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_730)], 1u, memory_order_relaxed);
        uint _732 = _2136;
        _728 = int(_732);
    }
    int _734 = _728;
    bool _736 = !_724;
    int _738 = _734;
    if (!_736)
    {
        float _740 = as_type<float>(gl_SubgroupInvocationID);
        uint _742 = spvSubgroupBallot(true).x;
        int _744 = int(spvFindUMSB(_742));
        int _746 = popcount(int(_742));
        bool _748 = _744 == as_type<int>(_740);
        int _750 = _746;
        if (_748)
        {
            uint _752 = uint(int(uint(_230) >> uint(2)));
            uint _2172 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_752)], uint(_746), memory_order_relaxed);
            uint _754 = _2172;
            _750 = int(_754);
        }
        int _756 = _750;
        float _758 = as_type<float>(gl_SubgroupLtMask.x);
        int _760 = as_type<int>(_758) & int(_742);
        int _762 = popcount(_760);
        int _764 = _756;
        int _766 = _744;
        int _768 = 31;
        int _770;
        int _2190 = _53(_764, _766, _768, _770, gl_SubgroupInvocationID);
        int _772 = _2190;
        int _774 = _772 + _762;
        _738 = _774;
    }
    int _776 = _738;
    uint _778 = uint(int(uint(_726) >> uint(2)));
    float _780 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_778)]);
    float _782 = -_116;
    float _784 = _782 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _786 = -_140;
    float _788 = _786 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _790 = -_164;
    float _792 = _790 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _794 = _236 + 50.0;
    float _796 = _784 * _784;
    float _798 = _794 * (*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _800 = fma(_788, _788, _796);
    int _802 = as_type<int>(_140) * 1664525;
    int _804 = _802 + 1013904223;
    float _806 = -_798;
    float _808 = fma(_242, (*spvDescriptorSet0.cp_c4)._m0[0].z, _806);
    float _810 = fma(_792, _792, _800);
    int _812 = as_type<int>(_116) * 1664525;
    int _814 = _812 + 1013904223;
    float _816 = 1.0 / _808;
    int _818 = as_type<int>(_164) * 1664525;
    int _820 = _818 + 1013904223;
    float _822 = sqrt(_810);
    float _824 = rsqrt(_810);
    float _826 = -_798;
    float _828 = _822 + _826;
    int _830 = _814 * _820;
    int _832 = _830 + _804;
    float _834 = _828 * _816;
    float _836 = precise::clamp(_834, 0.0, 1.0);
    int _838 = _820 * _832;
    int _840 = _838 + _814;
    uint _842 = uint(int(uint(_832) >> uint(16)));
    float _844 = -_836;
    float _846 = _844 + 1.0;
    int _848 = _832 * _840;
    int _850 = _848 + _820;
    uint _852 = uint(int(uint(_840) >> uint(16)));
    float _854 = _824 * _846;
    int _856 = _832 ^ int(_842);
    uint _858 = uint(int(uint(_850) >> uint(16)));
    float _860 = _168 * _854;
    int _862 = _840 ^ int(_852);
    int _864 = _850 ^ int(_858);
    float _866 = fma(_788, _860, _140);
    float _868 = fma(_784, _860, _116);
    float _870 = fma(_792, _860, _164);
    int _872 = _862 * _864;
    int _874 = _872 + _856;
    uint _876 = uint(int(uint(_874) >> uint(9)));
    int _878 = int(_876) + 1065353216;
    float _880 = as_type<float>(_878) + (-1.0);
    int _882 = _776 + as_type<int>(_780);
    int _884 = _882 * 80;
    int _886 = _884 + 16;
    uint _888 = uint(int(uint(_884) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_888)] = as_type<uint>(_122);
    int _890 = _884 + 4;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_892)] = as_type<uint>(_128);
    int _894 = _884 + 8;
    uint _896 = uint(int(uint(_894) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_896)] = as_type<uint>(_134);
    int _898 = _884 + 12;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_900)] = as_type<uint>(_866);
    int _902 = _884 + 32;
    int _904 = _884 + 48;
    uint _906 = uint(int(uint(_886) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_906)] = as_type<uint>(_98);
    int _908 = _886 + 4;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_910)] = as_type<uint>(_104);
    int _912 = _886 + 8;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_914)] = as_type<uint>(_110);
    int _916 = _886 + 12;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_918)] = as_type<uint>(_868);
    int _920 = _884 + 64;
    int _922 = _884 + 68;
    uint _924 = uint(int(uint(_902) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_924)] = as_type<uint>(_146);
    int _926 = _902 + 4;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_928)] = as_type<uint>(_152);
    int _930 = _902 + 8;
    uint _932 = uint(int(uint(_930) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_932)] = as_type<uint>(_158);
    int _934 = _902 + 12;
    uint _936 = uint(int(uint(_934) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_936)] = as_type<uint>(_870);
    int _938 = _884 + 72;
    uint _940 = uint(int(uint(_904) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_940)] = as_type<uint>(_880);
    int _942 = _904 + 4;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_944)] = 0u;
    int _946 = _904 + 8;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_948)] = 0u;
    int _950 = _904 + 12;
    uint _952 = uint(int(uint(_950) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_952)] = uint(_63);
    uint _954 = uint(int(uint(_920) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_954)] = as_type<uint>(_82);
    uint _956 = uint(int(uint(_922) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_956)] = as_type<uint>(_266);
    uint _958 = uint(int(uint(_938) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_958)] = as_type<uint>(_272);
}

