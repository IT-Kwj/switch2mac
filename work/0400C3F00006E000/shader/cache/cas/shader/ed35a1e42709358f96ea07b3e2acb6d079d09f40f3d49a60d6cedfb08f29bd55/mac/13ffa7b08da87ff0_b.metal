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

static inline __attribute__((always_inline))
int _51(thread const int& _2031, thread const int& _2032, thread const int& _2033, thread int& _2034, thread uint& gl_SubgroupInvocationID)
{
    int _2037 = _2033 & 31;
    uint _2039 = uint(int(uint(_2033) >> uint(8)));
    int _2041 = int(_2039) & 31;
    float _2043 = as_type<float>(gl_SubgroupInvocationID);
    int _2045 = as_type<int>(_2043) & _2041;
    int _2047 = ~_2041;
    int _2049 = _2037 & _2047;
    int _2051 = _2049 | _2045;
    int _2053 = ~_2041;
    int _2055 = _2032 & _2053;
    int _2057 = _2055 | _2045;
    bool _2059 = uint(_2057) <= uint(_2051);
    _2034 = _2059 ? (-1) : 0;
    float _2061 = spvSubgroupShuffle(as_type<float>(_2031), uint(_2057));
    uint _2063 = uint(_2059 ? as_type<int>(_2061) : _2031);
    return int(_2063);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _55 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    int _61 = as_type<int>(_57) * 64;
    int _63 = _61 + as_type<int>(_59);
    bool _67 = uint(_63) >= as_type<uint>(_55);
    if (_67)
    {
        return;
    }
    int _69 = _63 * 48;
    int _71 = _69 + 32;
    int _73 = _69 + 36;
    uint _76 = uint(int(uint(_69) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_76)]);
    int _80 = _69 + 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_82)]);
    int _86 = _69 + 8;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    uint _92 = uint(int(uint(_71) >> uint(2)));
    float _94 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_92)]);
    int _96 = _69 + 40;
    int _98 = _69 + 44;
    uint _100 = uint(int(uint(_73) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
    uint _104 = uint(int(uint(_96) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_104)]);
    int _108 = as_type<int>(_94) * 20;
    uint _110 = uint(int(uint(_98) >> uint(2)));
    float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
    int _114 = _108 + 4;
    int _116 = _114 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _118 = uint(_116) < uint(_114);
    int _120 = int(_118);
    bool _122 = uint(_116) < uint(_116);
    int _124 = int(_122);
    int _126 = _120 + _124;
    int _128 = _126 & 1;
    bool _130 = _128 != 0;
    int _132 = int(_130);
    int _134 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _132;
    uint _136 = spvSubgroupBallot(true).x;
    float _138 = spvSubgroupShuffle(as_type<float>(_116), 0u);
    bool _140 = as_type<int>(_138) == _116;
    float _142 = spvSubgroupShuffle(as_type<float>(_134), 0u);
    bool _144 = as_type<int>(_142) == _134;
    bool _146 = _140 && _144;
    int _148 = int(_146);
    float _150 = spvSubgroupShuffle(as_type<float>(_116), 1u);
    bool _152 = as_type<int>(_150) == _116;
    float _154 = spvSubgroupShuffle(as_type<float>(_134), 1u);
    bool _156 = as_type<int>(_154) == _134;
    bool _158 = _152 && _156;
    int _160 = _158 ? 2 : 0;
    int _162 = _148 | _160;
    float _164 = spvSubgroupShuffle(as_type<float>(_116), 2u);
    bool _166 = as_type<int>(_164) == _116;
    float _168 = spvSubgroupShuffle(as_type<float>(_134), 2u);
    bool _170 = as_type<int>(_168) == _134;
    bool _172 = _166 && _170;
    int _174 = _172 ? 4 : 0;
    int _176 = _162 | _174;
    float _178 = spvSubgroupShuffle(as_type<float>(_116), 3u);
    bool _180 = as_type<int>(_178) == _116;
    float _182 = spvSubgroupShuffle(as_type<float>(_134), 3u);
    bool _184 = as_type<int>(_182) == _134;
    bool _186 = _180 && _184;
    int _188 = _186 ? 8 : 0;
    int _190 = _176 | _188;
    float _192 = spvSubgroupShuffle(as_type<float>(_116), 4u);
    bool _194 = as_type<int>(_192) == _116;
    float _196 = spvSubgroupShuffle(as_type<float>(_134), 4u);
    bool _198 = as_type<int>(_196) == _134;
    bool _200 = _194 && _198;
    int _202 = _200 ? 16 : 0;
    int _204 = _190 | _202;
    float _206 = spvSubgroupShuffle(as_type<float>(_116), 5u);
    bool _208 = as_type<int>(_206) == _116;
    float _210 = spvSubgroupShuffle(as_type<float>(_134), 5u);
    bool _212 = as_type<int>(_210) == _134;
    bool _214 = _208 && _212;
    int _216 = _214 ? 32 : 0;
    int _218 = _204 | _216;
    float _220 = spvSubgroupShuffle(as_type<float>(_116), 6u);
    bool _222 = as_type<int>(_220) == _116;
    float _224 = spvSubgroupShuffle(as_type<float>(_134), 6u);
    bool _226 = as_type<int>(_224) == _134;
    bool _228 = _222 && _226;
    int _230 = _228 ? 64 : 0;
    int _232 = _218 | _230;
    float _234 = spvSubgroupShuffle(as_type<float>(_116), 7u);
    bool _236 = as_type<int>(_234) == _116;
    float _238 = spvSubgroupShuffle(as_type<float>(_134), 7u);
    bool _240 = as_type<int>(_238) == _134;
    bool _242 = _236 && _240;
    int _244 = _242 ? 128 : 0;
    int _246 = _232 | _244;
    float _248 = spvSubgroupShuffle(as_type<float>(_116), 8u);
    bool _250 = as_type<int>(_248) == _116;
    float _252 = spvSubgroupShuffle(as_type<float>(_134), 8u);
    bool _254 = as_type<int>(_252) == _134;
    bool _256 = _250 && _254;
    int _258 = _256 ? 256 : 0;
    int _260 = _246 | _258;
    float _262 = spvSubgroupShuffle(as_type<float>(_116), 9u);
    bool _264 = as_type<int>(_262) == _116;
    float _266 = spvSubgroupShuffle(as_type<float>(_134), 9u);
    bool _268 = as_type<int>(_266) == _134;
    bool _270 = _264 && _268;
    int _272 = _270 ? 512 : 0;
    int _274 = _260 | _272;
    float _276 = spvSubgroupShuffle(as_type<float>(_116), 10u);
    bool _278 = as_type<int>(_276) == _116;
    float _280 = spvSubgroupShuffle(as_type<float>(_134), 10u);
    bool _282 = as_type<int>(_280) == _134;
    bool _284 = _278 && _282;
    int _286 = _284 ? 1024 : 0;
    int _288 = _274 | _286;
    float _290 = spvSubgroupShuffle(as_type<float>(_116), 11u);
    bool _292 = as_type<int>(_290) == _116;
    float _294 = spvSubgroupShuffle(as_type<float>(_134), 11u);
    bool _296 = as_type<int>(_294) == _134;
    bool _298 = _292 && _296;
    int _300 = _298 ? 2048 : 0;
    int _302 = _288 | _300;
    float _304 = spvSubgroupShuffle(as_type<float>(_116), 12u);
    bool _306 = as_type<int>(_304) == _116;
    float _308 = spvSubgroupShuffle(as_type<float>(_134), 12u);
    bool _310 = as_type<int>(_308) == _134;
    bool _312 = _306 && _310;
    int _314 = _312 ? 4096 : 0;
    int _316 = _302 | _314;
    float _318 = spvSubgroupShuffle(as_type<float>(_116), 13u);
    bool _320 = as_type<int>(_318) == _116;
    float _322 = spvSubgroupShuffle(as_type<float>(_134), 13u);
    bool _324 = as_type<int>(_322) == _134;
    bool _326 = _320 && _324;
    int _328 = _326 ? 8192 : 0;
    int _330 = _316 | _328;
    float _332 = spvSubgroupShuffle(as_type<float>(_116), 14u);
    bool _334 = as_type<int>(_332) == _116;
    float _336 = spvSubgroupShuffle(as_type<float>(_134), 14u);
    bool _338 = as_type<int>(_336) == _134;
    bool _340 = _334 && _338;
    int _342 = _340 ? 16384 : 0;
    int _344 = _330 | _342;
    float _346 = spvSubgroupShuffle(as_type<float>(_116), 15u);
    bool _348 = as_type<int>(_346) == _116;
    float _350 = spvSubgroupShuffle(as_type<float>(_134), 15u);
    bool _352 = as_type<int>(_350) == _134;
    bool _354 = _348 && _352;
    int _356 = _354 ? 32768 : 0;
    int _358 = _344 | _356;
    float _360 = spvSubgroupShuffle(as_type<float>(_116), 16u);
    bool _362 = as_type<int>(_360) == _116;
    float _364 = spvSubgroupShuffle(as_type<float>(_134), 16u);
    bool _366 = as_type<int>(_364) == _134;
    bool _368 = _362 && _366;
    int _370 = _368 ? 65536 : 0;
    int _372 = _358 | _370;
    float _374 = spvSubgroupShuffle(as_type<float>(_116), 17u);
    bool _376 = as_type<int>(_374) == _116;
    float _378 = spvSubgroupShuffle(as_type<float>(_134), 17u);
    bool _380 = as_type<int>(_378) == _134;
    bool _382 = _376 && _380;
    int _384 = _382 ? 131072 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_116), 18u);
    bool _390 = as_type<int>(_388) == _116;
    float _392 = spvSubgroupShuffle(as_type<float>(_134), 18u);
    bool _394 = as_type<int>(_392) == _134;
    bool _396 = _390 && _394;
    int _398 = _396 ? 262144 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_116), 19u);
    bool _404 = as_type<int>(_402) == _116;
    float _406 = spvSubgroupShuffle(as_type<float>(_134), 19u);
    bool _408 = as_type<int>(_406) == _134;
    bool _410 = _404 && _408;
    int _412 = _410 ? 524288 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_116), 20u);
    bool _418 = as_type<int>(_416) == _116;
    float _420 = spvSubgroupShuffle(as_type<float>(_134), 20u);
    bool _422 = as_type<int>(_420) == _134;
    bool _424 = _418 && _422;
    int _426 = _424 ? 1048576 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_116), 21u);
    bool _432 = as_type<int>(_430) == _116;
    float _434 = spvSubgroupShuffle(as_type<float>(_134), 21u);
    bool _436 = as_type<int>(_434) == _134;
    bool _438 = _432 && _436;
    int _440 = _438 ? 2097152 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_116), 22u);
    bool _446 = as_type<int>(_444) == _116;
    float _448 = spvSubgroupShuffle(as_type<float>(_134), 22u);
    bool _450 = as_type<int>(_448) == _134;
    bool _452 = _446 && _450;
    int _454 = _452 ? 4194304 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_116), 23u);
    bool _460 = as_type<int>(_458) == _116;
    float _462 = spvSubgroupShuffle(as_type<float>(_134), 23u);
    bool _464 = as_type<int>(_462) == _134;
    bool _466 = _460 && _464;
    int _468 = _466 ? 8388608 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_116), 24u);
    bool _474 = as_type<int>(_472) == _116;
    float _476 = spvSubgroupShuffle(as_type<float>(_134), 24u);
    bool _478 = as_type<int>(_476) == _134;
    bool _480 = _474 && _478;
    int _482 = _480 ? 16777216 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_116), 25u);
    bool _488 = as_type<int>(_486) == _116;
    float _490 = spvSubgroupShuffle(as_type<float>(_134), 25u);
    bool _492 = as_type<int>(_490) == _134;
    bool _494 = _488 && _492;
    int _496 = _494 ? 33554432 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_116), 26u);
    bool _502 = as_type<int>(_500) == _116;
    float _504 = spvSubgroupShuffle(as_type<float>(_134), 26u);
    bool _506 = as_type<int>(_504) == _134;
    bool _508 = _502 && _506;
    int _510 = _508 ? 67108864 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_116), 27u);
    bool _516 = as_type<int>(_514) == _116;
    float _518 = spvSubgroupShuffle(as_type<float>(_134), 27u);
    bool _520 = as_type<int>(_518) == _134;
    bool _522 = _516 && _520;
    int _524 = _522 ? 134217728 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_116), 28u);
    bool _530 = as_type<int>(_528) == _116;
    float _532 = spvSubgroupShuffle(as_type<float>(_134), 28u);
    bool _534 = as_type<int>(_532) == _134;
    bool _536 = _530 && _534;
    int _538 = _536 ? 268435456 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_116), 29u);
    bool _544 = as_type<int>(_542) == _116;
    float _546 = spvSubgroupShuffle(as_type<float>(_134), 29u);
    bool _548 = as_type<int>(_546) == _134;
    bool _550 = _544 && _548;
    int _552 = _550 ? 536870912 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_116), 30u);
    bool _558 = as_type<int>(_556) == _116;
    float _560 = spvSubgroupShuffle(as_type<float>(_134), 30u);
    bool _562 = as_type<int>(_560) == _134;
    bool _564 = _558 && _562;
    int _566 = _564 ? 1073741824 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_116), 31u);
    bool _572 = as_type<int>(_570) == _116;
    float _574 = spvSubgroupShuffle(as_type<float>(_134), 31u);
    bool _576 = as_type<int>(_574) == _134;
    bool _578 = _572 && _576;
    int _580 = _578 ? int(0x80000000) : 0;
    int _582 = _568 | _580;
    int _584 = _582 & int(_136);
    bool _586 = _584 == int(_136);
    int _588 = _108 + 16;
    int _590 = _108;
    if (!_586)
    {
        uint _592 = uint(int(uint(_114) >> uint(2)));
        uint _1709 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_592)], 1u, memory_order_relaxed);
        uint _594 = _1709;
        _590 = int(_594);
    }
    int _596 = _590;
    bool _598 = !_586;
    int _600 = _596;
    if (!_598)
    {
        float _602 = as_type<float>(gl_SubgroupInvocationID);
        uint _604 = spvSubgroupBallot(true).x;
        int _606 = int(spvFindUMSB(_604));
        int _608 = popcount(int(_604));
        bool _610 = _606 == as_type<int>(_602);
        int _612 = _608;
        if (_610)
        {
            uint _614 = uint(int(uint(_114) >> uint(2)));
            uint _1746 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_614)], uint(_608), memory_order_relaxed);
            uint _616 = _1746;
            _612 = int(_616);
        }
        int _618 = _612;
        float _620 = as_type<float>(gl_SubgroupLtMask.x);
        int _622 = as_type<int>(_620) & int(_604);
        int _624 = popcount(_622);
        int _626 = _618;
        int _628 = _606;
        int _630 = 31;
        int _632;
        int _1764 = _51(_626, _628, _630, _632, gl_SubgroupInvocationID);
        int _634 = _1764;
        int _636 = _634 + _624;
        _600 = _636;
    }
    int _638 = _600;
    uint _640 = uint(int(uint(_588) >> uint(2)));
    float _642 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_640)]);
    float _644 = float(as_type<uint>(_102));
    int _646 = -as_type<int>(_102);
    int _648 = as_type<int>(_106) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _650 = ~as_type<int>(_102);
    int _652 = _650 + 1;
    float _654 = 1.0 / _644;
    float _656 = float(uint(_648));
    int _658 = as_type<int>(_654) + (-2);
    float _660 = as_type<float>(_658) * _656;
    float _662 = trunc(_660);
    float _664 = precise::max(_662, 0.0);
    uint _666 = uint(_664);
    int _668 = _646 * int(_666);
    int _670 = _668 + _648;
    float _672 = float(uint(_670));
    float _674 = as_type<float>(_658) * _672;
    float _676 = trunc(_674);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    int _682 = int(_666) + int(_680);
    int _684 = _652 * _682;
    int _686 = _684 + _648;
    bool _688 = uint(_686) >= as_type<uint>(_102);
    bool _690 = !_688;
    int _692 = _690 ? 0 : (-1);
    bool _694 = as_type<int>(_102) == 0;
    int _696 = -_682;
    int _698 = _692 + _696;
    int _700 = as_type<int>(_102) * _698;
    int _702 = _700 + _648;
    bool _704 = !_694;
    int _706 = _704 ? _702 : (-1);
    int _708 = _638 + as_type<int>(_642);
    int _710 = _708 * 80;
    int _712 = _710 + 16;
    uint _714 = uint(int(uint(_710) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_714)] = 1065353216u;
    int _716 = _710 + 4;
    uint _718 = uint(int(uint(_716) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_718)] = 0u;
    int _720 = _710 + 8;
    uint _722 = uint(int(uint(_720) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_722)] = 0u;
    int _724 = _710 + 12;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_726)] = as_type<uint>(_78);
    int _728 = _710 + 32;
    int _730 = _710 + 48;
    uint _732 = uint(int(uint(_712) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_732)] = 0u;
    int _734 = _712 + 4;
    uint _736 = uint(int(uint(_734) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_736)] = 1065353216u;
    int _738 = _712 + 8;
    uint _740 = uint(int(uint(_738) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_740)] = 0u;
    int _742 = _712 + 12;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_744)] = as_type<uint>(_84);
    int _746 = _710 + 64;
    uint _748 = uint(int(uint(_728) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_748)] = 0u;
    int _750 = _728 + 4;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_752)] = 0u;
    int _754 = _728 + 8;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_756)] = 1065353216u;
    int _758 = _728 + 12;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_760)] = as_type<uint>(_90);
    uint _762 = uint(int(uint(_730) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_762)] = 0u;
    int _764 = _730 + 4;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_766)] = as_type<uint>(_112);
    int _768 = _730 + 8;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_770)] = uint(_706);
    int _772 = _730 + 12;
    uint _774 = uint(int(uint(_772) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_774)] = 0u;
    uint _776 = uint(int(uint(_746) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_776)] = 1065353216u;
}

