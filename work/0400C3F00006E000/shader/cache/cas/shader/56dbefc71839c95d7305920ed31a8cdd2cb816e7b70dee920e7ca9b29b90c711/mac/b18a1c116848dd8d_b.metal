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
    device _25* cp_s3 [[id(6)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _2732, thread const int& _2733, thread const int& _2734, thread int& _2735, thread uint& gl_SubgroupInvocationID)
{
    int _2738 = _2734 & 31;
    uint _2740 = uint(int(uint(_2734) >> uint(8)));
    int _2742 = int(_2740) & 31;
    float _2744 = as_type<float>(gl_SubgroupInvocationID);
    int _2746 = as_type<int>(_2744) & _2742;
    int _2748 = ~_2742;
    int _2750 = _2738 & _2748;
    int _2752 = _2750 | _2746;
    int _2754 = ~_2742;
    int _2756 = _2733 & _2754;
    int _2758 = _2756 | _2746;
    bool _2760 = uint(_2758) <= uint(_2752);
    _2735 = _2760 ? (-1) : 0;
    float _2762 = spvSubgroupShuffle(as_type<float>(_2732), uint(_2758));
    uint _2764 = uint(_2760 ? as_type<int>(_2762) : _2732);
    return int(_2764);
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
    uint _76 = uint(int(uint(_73) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_76)]);
    int _80 = _73 + 4;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_82)]);
    int _86 = _73 + 8;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    int _92 = _73 + 12;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
    bool _98 = as_type<int>(_90) != (-1);
    if (!_98)
    {
        return;
    }
    int _100 = _71 + 48;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_102)]);
    int _106 = _100 + 4;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    float _110 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_108)]);
    int _112 = _100 + 8;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_114)]);
    int _118 = _100 + 12;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_120)]);
    float _124 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _126 = _116 + _124;
    float _128 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _130 = _104 + _128;
    float _132 = _126 * _126;
    float _134 = fma(_130, _130, _132);
    float _136 = sqrt(_134);
    bool _138 = _136 > (*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _140 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _142 = _136 + _140;
    float _144 = 0.0;
    float _146 = _142;
    float _148 = _110;
    float _150 = _104;
    float _152 = _116;
    if (_138)
    {
        float _154 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _144 = _154;
    }
    float _156 = _144;
    float _158 = 0.0;
    if (_138)
    {
        float _160 = rsqrt(_134);
        _158 = _160;
    }
    float _162 = _158;
    float _164 = _156;
    if (_138)
    {
        float _166 = _142 * _156;
        _146 = _166;
    }
    float _168 = _146;
    if (_138)
    {
        float _170 = _110 + (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _164 = _170;
    }
    float _172 = _164;
    float _174 = 0.0;
    if (_138)
    {
        float _176 = _168 * 0.15915493667125701904296875;
        _174 = _176;
    }
    float _178 = _174;
    float _180 = _168;
    if (_138)
    {
        float _182 = _178 * 6.283185482025146484375;
        float _184 = cos(_182);
        _180 = _184;
    }
    float _186 = _180;
    float _188 = 0.0;
    if (_138)
    {
        float _190 = _178 * 6.283185482025146484375;
        float _192 = sin(_190);
        _188 = _192;
    }
    float _194 = _188;
    float _196 = 0.0;
    if (_138)
    {
        float _198 = _186 + (-1.0);
        _196 = _198;
    }
    float _200 = _196;
    float _202 = _200;
    if (_138)
    {
        float _204 = _200 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _202 = _204;
    }
    float _206 = _202;
    float _208 = _194;
    if (_138)
    {
        float _210 = fma(_194, _172, (*spvDescriptorSet0.cp_c5)._m0[0].x);
        _208 = _210;
    }
    float _212 = _208;
    float _214 = _212;
    if (_138)
    {
        float _216 = fma(_110, _186, _206);
        _148 = _216;
    }
    float _218 = _148;
    if (_138)
    {
        float _220 = _162 * _212;
        _214 = _220;
    }
    float _222 = _214;
    float _224 = _218 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _226 = _218 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    if (_138)
    {
        float _228 = fma(_130, _222, (*spvDescriptorSet0.cp_c3)._m0[4].x);
        _150 = _228;
    }
    float _230 = _150;
    if (_138)
    {
        float _232 = fma(_126, _222, (*spvDescriptorSet0.cp_c3)._m0[4].z);
        _152 = _232;
    }
    float _234 = _152;
    float _236 = _218 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _238 = _218 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _240 = fma(_230, (*spvDescriptorSet0.cp_c3)._m0[1].x, _224);
    float _242 = fma(_230, (*spvDescriptorSet0.cp_c3)._m0[2].x, _226);
    float _244 = fma(_230, (*spvDescriptorSet0.cp_c3)._m0[0].x, _236);
    float _246 = fma(_230, (*spvDescriptorSet0.cp_c3)._m0[3].x, _238);
    float _248 = fma(_234, (*spvDescriptorSet0.cp_c3)._m0[1].z, _240);
    float _250 = fma(_234, (*spvDescriptorSet0.cp_c3)._m0[2].z, _242);
    float _252 = fma(_234, (*spvDescriptorSet0.cp_c3)._m0[0].z, _244);
    float _254 = fma(_234, (*spvDescriptorSet0.cp_c3)._m0[3].z, _246);
    float _256 = _248 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _258 = _250 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _260 = _252 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _262 = _256 >= _122;
    bool _264 = isnan(_256);
    bool _266 = _262 || _264;
    bool _268 = isnan(_122);
    bool _270 = _266 || _268;
    bool _272 = _260 < _122;
    bool _274 = !_270;
    bool _276 = _272 && _274;
    float _278 = _254 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _280 = _258 < _122;
    bool _282 = _280 && _276;
    bool _284 = _278 < _122;
    bool _286 = _284 && _282;
    if (!_286)
    {
        return;
    }
    int _288 = as_type<int>(_90) << 5;
    int _290 = _71 + 16;
    uint _292 = uint(int(uint(_71) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_292)]);
    int _296 = _71 + 4;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_298)]);
    int _302 = _71 + 8;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_304)]);
    int _308 = _71 + 12;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_310)]);
    int _314 = _288 + 4;
    int _316 = _71 + 32;
    int _318 = _314 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _320 = uint(_318) < uint(_314);
    int _322 = int(_320);
    bool _324 = uint(_318) < uint(_318);
    int _326 = int(_324);
    int _328 = _322 + _326;
    int _330 = _328 & 1;
    bool _332 = _330 != 0;
    uint _334 = uint(int(uint(_290) >> uint(2)));
    float _336 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_334)]);
    int _338 = _290 + 4;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_340)]);
    int _344 = _290 + 8;
    uint _346 = uint(int(uint(_344) >> uint(2)));
    float _348 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_346)]);
    int _350 = _290 + 12;
    uint _352 = uint(int(uint(_350) >> uint(2)));
    float _354 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_352)]);
    int _356 = int(_332);
    int _358 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _356;
    uint _360 = uint(int(uint(_316) >> uint(2)));
    float _362 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_360)]);
    int _364 = _316 + 4;
    uint _366 = uint(int(uint(_364) >> uint(2)));
    float _368 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_366)]);
    int _370 = _316 + 8;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    float _374 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_372)]);
    int _376 = _316 + 12;
    uint _378 = uint(int(uint(_376) >> uint(2)));
    float _380 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_378)]);
    uint _382 = spvSubgroupBallot(true).x;
    float _384 = spvSubgroupShuffle(as_type<float>(_318), 0u);
    bool _386 = as_type<int>(_384) == _318;
    float _388 = spvSubgroupShuffle(as_type<float>(_358), 0u);
    bool _390 = as_type<int>(_388) == _358;
    bool _392 = _386 && _390;
    int _394 = int(_392);
    float _396 = spvSubgroupShuffle(as_type<float>(_318), 1u);
    bool _398 = as_type<int>(_396) == _318;
    float _400 = spvSubgroupShuffle(as_type<float>(_358), 1u);
    bool _402 = as_type<int>(_400) == _358;
    bool _404 = _398 && _402;
    int _406 = _404 ? 2 : 0;
    int _408 = _394 | _406;
    float _410 = spvSubgroupShuffle(as_type<float>(_318), 2u);
    bool _412 = as_type<int>(_410) == _318;
    float _414 = spvSubgroupShuffle(as_type<float>(_358), 2u);
    bool _416 = as_type<int>(_414) == _358;
    bool _418 = _412 && _416;
    int _420 = _418 ? 4 : 0;
    int _422 = _408 | _420;
    float _424 = spvSubgroupShuffle(as_type<float>(_318), 3u);
    bool _426 = as_type<int>(_424) == _318;
    float _428 = spvSubgroupShuffle(as_type<float>(_358), 3u);
    bool _430 = as_type<int>(_428) == _358;
    bool _432 = _426 && _430;
    int _434 = _432 ? 8 : 0;
    int _436 = _422 | _434;
    float _438 = spvSubgroupShuffle(as_type<float>(_318), 4u);
    bool _440 = as_type<int>(_438) == _318;
    float _442 = spvSubgroupShuffle(as_type<float>(_358), 4u);
    bool _444 = as_type<int>(_442) == _358;
    bool _446 = _440 && _444;
    int _448 = _446 ? 16 : 0;
    int _450 = _436 | _448;
    float _452 = spvSubgroupShuffle(as_type<float>(_318), 5u);
    bool _454 = as_type<int>(_452) == _318;
    float _456 = spvSubgroupShuffle(as_type<float>(_358), 5u);
    bool _458 = as_type<int>(_456) == _358;
    bool _460 = _454 && _458;
    int _462 = _460 ? 32 : 0;
    int _464 = _450 | _462;
    float _466 = spvSubgroupShuffle(as_type<float>(_318), 6u);
    bool _468 = as_type<int>(_466) == _318;
    float _470 = spvSubgroupShuffle(as_type<float>(_358), 6u);
    bool _472 = as_type<int>(_470) == _358;
    bool _474 = _468 && _472;
    int _476 = _474 ? 64 : 0;
    int _478 = _464 | _476;
    float _480 = spvSubgroupShuffle(as_type<float>(_318), 7u);
    bool _482 = as_type<int>(_480) == _318;
    float _484 = spvSubgroupShuffle(as_type<float>(_358), 7u);
    bool _486 = as_type<int>(_484) == _358;
    bool _488 = _482 && _486;
    int _490 = _488 ? 128 : 0;
    int _492 = _478 | _490;
    float _494 = spvSubgroupShuffle(as_type<float>(_318), 8u);
    bool _496 = as_type<int>(_494) == _318;
    float _498 = spvSubgroupShuffle(as_type<float>(_358), 8u);
    bool _500 = as_type<int>(_498) == _358;
    bool _502 = _496 && _500;
    int _504 = _502 ? 256 : 0;
    int _506 = _492 | _504;
    float _508 = spvSubgroupShuffle(as_type<float>(_318), 9u);
    bool _510 = as_type<int>(_508) == _318;
    float _512 = spvSubgroupShuffle(as_type<float>(_358), 9u);
    bool _514 = as_type<int>(_512) == _358;
    bool _516 = _510 && _514;
    int _518 = _516 ? 512 : 0;
    int _520 = _506 | _518;
    float _522 = spvSubgroupShuffle(as_type<float>(_318), 10u);
    bool _524 = as_type<int>(_522) == _318;
    float _526 = spvSubgroupShuffle(as_type<float>(_358), 10u);
    bool _528 = as_type<int>(_526) == _358;
    bool _530 = _524 && _528;
    int _532 = _530 ? 1024 : 0;
    int _534 = _520 | _532;
    float _536 = spvSubgroupShuffle(as_type<float>(_318), 11u);
    bool _538 = as_type<int>(_536) == _318;
    float _540 = spvSubgroupShuffle(as_type<float>(_358), 11u);
    bool _542 = as_type<int>(_540) == _358;
    bool _544 = _538 && _542;
    int _546 = _544 ? 2048 : 0;
    int _548 = _534 | _546;
    float _550 = spvSubgroupShuffle(as_type<float>(_318), 12u);
    bool _552 = as_type<int>(_550) == _318;
    float _554 = spvSubgroupShuffle(as_type<float>(_358), 12u);
    bool _556 = as_type<int>(_554) == _358;
    bool _558 = _552 && _556;
    int _560 = _558 ? 4096 : 0;
    int _562 = _548 | _560;
    float _564 = spvSubgroupShuffle(as_type<float>(_318), 13u);
    bool _566 = as_type<int>(_564) == _318;
    float _568 = spvSubgroupShuffle(as_type<float>(_358), 13u);
    bool _570 = as_type<int>(_568) == _358;
    bool _572 = _566 && _570;
    int _574 = _572 ? 8192 : 0;
    int _576 = _562 | _574;
    float _578 = spvSubgroupShuffle(as_type<float>(_318), 14u);
    bool _580 = as_type<int>(_578) == _318;
    float _582 = spvSubgroupShuffle(as_type<float>(_358), 14u);
    bool _584 = as_type<int>(_582) == _358;
    bool _586 = _580 && _584;
    int _588 = _586 ? 16384 : 0;
    int _590 = _576 | _588;
    float _592 = spvSubgroupShuffle(as_type<float>(_318), 15u);
    bool _594 = as_type<int>(_592) == _318;
    float _596 = spvSubgroupShuffle(as_type<float>(_358), 15u);
    bool _598 = as_type<int>(_596) == _358;
    bool _600 = _594 && _598;
    int _602 = _600 ? 32768 : 0;
    int _604 = _590 | _602;
    float _606 = spvSubgroupShuffle(as_type<float>(_318), 16u);
    bool _608 = as_type<int>(_606) == _318;
    float _610 = spvSubgroupShuffle(as_type<float>(_358), 16u);
    bool _612 = as_type<int>(_610) == _358;
    bool _614 = _608 && _612;
    int _616 = _614 ? 65536 : 0;
    int _618 = _604 | _616;
    float _620 = spvSubgroupShuffle(as_type<float>(_318), 17u);
    bool _622 = as_type<int>(_620) == _318;
    float _624 = spvSubgroupShuffle(as_type<float>(_358), 17u);
    bool _626 = as_type<int>(_624) == _358;
    bool _628 = _622 && _626;
    int _630 = _628 ? 131072 : 0;
    int _632 = _618 | _630;
    float _634 = spvSubgroupShuffle(as_type<float>(_318), 18u);
    bool _636 = as_type<int>(_634) == _318;
    float _638 = spvSubgroupShuffle(as_type<float>(_358), 18u);
    bool _640 = as_type<int>(_638) == _358;
    bool _642 = _636 && _640;
    int _644 = _642 ? 262144 : 0;
    int _646 = _632 | _644;
    float _648 = spvSubgroupShuffle(as_type<float>(_318), 19u);
    bool _650 = as_type<int>(_648) == _318;
    float _652 = spvSubgroupShuffle(as_type<float>(_358), 19u);
    bool _654 = as_type<int>(_652) == _358;
    bool _656 = _650 && _654;
    int _658 = _656 ? 524288 : 0;
    int _660 = _646 | _658;
    float _662 = spvSubgroupShuffle(as_type<float>(_318), 20u);
    bool _664 = as_type<int>(_662) == _318;
    float _666 = spvSubgroupShuffle(as_type<float>(_358), 20u);
    bool _668 = as_type<int>(_666) == _358;
    bool _670 = _664 && _668;
    int _672 = _670 ? 1048576 : 0;
    int _674 = _660 | _672;
    float _676 = spvSubgroupShuffle(as_type<float>(_318), 21u);
    bool _678 = as_type<int>(_676) == _318;
    float _680 = spvSubgroupShuffle(as_type<float>(_358), 21u);
    bool _682 = as_type<int>(_680) == _358;
    bool _684 = _678 && _682;
    int _686 = _684 ? 2097152 : 0;
    int _688 = _674 | _686;
    float _690 = spvSubgroupShuffle(as_type<float>(_318), 22u);
    bool _692 = as_type<int>(_690) == _318;
    float _694 = spvSubgroupShuffle(as_type<float>(_358), 22u);
    bool _696 = as_type<int>(_694) == _358;
    bool _698 = _692 && _696;
    int _700 = _698 ? 4194304 : 0;
    int _702 = _688 | _700;
    float _704 = spvSubgroupShuffle(as_type<float>(_318), 23u);
    bool _706 = as_type<int>(_704) == _318;
    float _708 = spvSubgroupShuffle(as_type<float>(_358), 23u);
    bool _710 = as_type<int>(_708) == _358;
    bool _712 = _706 && _710;
    int _714 = _712 ? 8388608 : 0;
    int _716 = _702 | _714;
    float _718 = spvSubgroupShuffle(as_type<float>(_318), 24u);
    bool _720 = as_type<int>(_718) == _318;
    float _722 = spvSubgroupShuffle(as_type<float>(_358), 24u);
    bool _724 = as_type<int>(_722) == _358;
    bool _726 = _720 && _724;
    int _728 = _726 ? 16777216 : 0;
    int _730 = _716 | _728;
    float _732 = spvSubgroupShuffle(as_type<float>(_318), 25u);
    bool _734 = as_type<int>(_732) == _318;
    float _736 = spvSubgroupShuffle(as_type<float>(_358), 25u);
    bool _738 = as_type<int>(_736) == _358;
    bool _740 = _734 && _738;
    int _742 = _740 ? 33554432 : 0;
    int _744 = _730 | _742;
    float _746 = spvSubgroupShuffle(as_type<float>(_318), 26u);
    bool _748 = as_type<int>(_746) == _318;
    float _750 = spvSubgroupShuffle(as_type<float>(_358), 26u);
    bool _752 = as_type<int>(_750) == _358;
    bool _754 = _748 && _752;
    int _756 = _754 ? 67108864 : 0;
    int _758 = _744 | _756;
    float _760 = spvSubgroupShuffle(as_type<float>(_318), 27u);
    bool _762 = as_type<int>(_760) == _318;
    float _764 = spvSubgroupShuffle(as_type<float>(_358), 27u);
    bool _766 = as_type<int>(_764) == _358;
    bool _768 = _762 && _766;
    int _770 = _768 ? 134217728 : 0;
    int _772 = _758 | _770;
    float _774 = spvSubgroupShuffle(as_type<float>(_318), 28u);
    bool _776 = as_type<int>(_774) == _318;
    float _778 = spvSubgroupShuffle(as_type<float>(_358), 28u);
    bool _780 = as_type<int>(_778) == _358;
    bool _782 = _776 && _780;
    int _784 = _782 ? 268435456 : 0;
    int _786 = _772 | _784;
    float _788 = spvSubgroupShuffle(as_type<float>(_318), 29u);
    bool _790 = as_type<int>(_788) == _318;
    float _792 = spvSubgroupShuffle(as_type<float>(_358), 29u);
    bool _794 = as_type<int>(_792) == _358;
    bool _796 = _790 && _794;
    int _798 = _796 ? 536870912 : 0;
    int _800 = _786 | _798;
    float _802 = spvSubgroupShuffle(as_type<float>(_318), 30u);
    bool _804 = as_type<int>(_802) == _318;
    float _806 = spvSubgroupShuffle(as_type<float>(_358), 30u);
    bool _808 = as_type<int>(_806) == _358;
    bool _810 = _804 && _808;
    int _812 = _810 ? 1073741824 : 0;
    int _814 = _800 | _812;
    float _816 = spvSubgroupShuffle(as_type<float>(_318), 31u);
    bool _818 = as_type<int>(_816) == _318;
    float _820 = spvSubgroupShuffle(as_type<float>(_358), 31u);
    bool _822 = as_type<int>(_820) == _358;
    bool _824 = _818 && _822;
    int _826 = _824 ? int(0x80000000) : 0;
    int _828 = _814 | _826;
    int _830 = _828 & int(_382);
    bool _832 = _830 == int(_382);
    int _834 = _71 + 88;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    float _838 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_836)]);
    int _840 = 0;
    if (!_832)
    {
        uint _842 = uint(int(uint(_314) >> uint(2)));
        uint _2379 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_842)], 1u, memory_order_relaxed);
        uint _844 = _2379;
        _840 = int(_844);
    }
    int _846 = _840;
    bool _848 = !_832;
    int _850 = _846;
    if (!_848)
    {
        float _852 = as_type<float>(gl_SubgroupInvocationID);
        uint _854 = spvSubgroupBallot(true).x;
        int _856 = int(spvFindUMSB(_854));
        int _858 = popcount(int(_854));
        bool _860 = _856 == as_type<int>(_852);
        int _862 = _858;
        if (_860)
        {
            uint _864 = uint(int(uint(_314) >> uint(2)));
            uint _2415 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_864)], uint(_858), memory_order_relaxed);
            uint _866 = _2415;
            _862 = int(_866);
        }
        int _868 = _862;
        float _870 = as_type<float>(gl_SubgroupLtMask.x);
        int _872 = as_type<int>(_870) & int(_854);
        int _874 = popcount(_872);
        int _876 = _868;
        int _878 = _856;
        int _880 = 31;
        int _882;
        int _2433 = _53(_876, _878, _880, _882, gl_SubgroupInvocationID);
        int _884 = _2433;
        int _886 = _884 + _874;
        _850 = _886;
    }
    int _888 = _850;
    uint _890 = uint(int(uint(_288) >> uint(2)));
    float _892 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_890)]);
    int _894 = as_type<int>(_312) * 1664525;
    int _896 = _894 + 1013904223;
    int _898 = as_type<int>(_354) * 1664525;
    int _900 = _898 + 1013904223;
    int _902 = as_type<int>(_380) * 1664525;
    int _904 = _902 + 1013904223;
    uint _906 = uint(int(uint(as_type<int>(_838)) >> uint(16)));
    int _908 = _900 * _904;
    int _910 = _908 + _896;
    int _912 = _904 * _910;
    int _914 = _912 + _900;
    uint _916 = uint(int(uint(_910) >> uint(16)));
    int _918 = _910 * _914;
    int _920 = _918 + _904;
    uint _922 = uint(int(uint(_914) >> uint(16)));
    int _924 = _910 ^ int(_916);
    uint _926 = uint(int(uint(_920) >> uint(16)));
    int _928 = _914 ^ int(_922);
    int _930 = _920 ^ int(_926);
    int _932 = _928 * _930;
    int _934 = _932 + _924;
    int _936 = as_type<int>(_838) & 65535;
    uint _938 = uint(int(uint(_934) >> uint(9)));
    int _940 = int(_938) + 1065353216;
    float _942 = as_type<float>(_940) + (-1.0);
    int _944 = _888 + as_type<int>(_892);
    int _946 = _944 * 80;
    int _948 = _946 + 16;
    uint _950 = uint(int(uint(_946) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_950)] = as_type<uint>(_294);
    int _952 = _946 + 4;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_954)] = as_type<uint>(_300);
    int _956 = _946 + 8;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_958)] = as_type<uint>(_306);
    int _960 = _946 + 12;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_962)] = as_type<uint>(_312);
    int _964 = _946 + 32;
    int _966 = _946 + 48;
    uint _968 = uint(int(uint(_948) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_968)] = as_type<uint>(_336);
    int _970 = _948 + 4;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_972)] = as_type<uint>(_342);
    int _974 = _948 + 8;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_976)] = as_type<uint>(_348);
    int _978 = _948 + 12;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_980)] = as_type<uint>(_354);
    int _982 = _946 + 64;
    uint _984 = uint(int(uint(_964) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_984)] = as_type<uint>(_362);
    int _986 = _964 + 4;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_988)] = as_type<uint>(_368);
    int _990 = _964 + 8;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_992)] = as_type<uint>(_374);
    int _994 = _964 + 12;
    uint _996 = uint(int(uint(_994) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_996)] = as_type<uint>(_380);
    uint _998 = uint(int(uint(_966) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_998)] = as_type<uint>(_942);
    int _1000 = _966 + 4;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1002)] = _906;
    int _1004 = _966 + 8;
    uint _1006 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1006)] = uint(_936);
    int _1008 = _966 + 12;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1010)] = as_type<uint>(_96);
    uint _1012 = uint(int(uint(_982) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1012)] = 1065353216u;
    int _1014 = _982 + 4;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1016)] = as_type<uint>(_78);
    int _1018 = _982 + 8;
    uint _1020 = uint(int(uint(_1018) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1020)] = as_type<uint>(_84);
    int _1022 = _982 + 12;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_1024)] = as_type<uint>(_90);
}

