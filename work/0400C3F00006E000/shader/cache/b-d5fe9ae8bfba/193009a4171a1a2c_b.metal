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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    device _27* cp_s0 [[id(4)]];
    device _27* cp_s1 [[id(5)]];
    device _27* cp_s2 [[id(6)]];
    device _27* cp_s3 [[id(7)]];
    device _27* cp_s4 [[id(8)]];
};

static inline __attribute__((always_inline))
int _57(thread const int& _3166, thread const int& _3167, thread const int& _3168, thread int& _3169, thread uint& gl_SubgroupInvocationID)
{
    int _3172 = _3168 & 31;
    uint _3174 = uint(int(uint(_3168) >> uint(8)));
    int _3176 = int(_3174) & 31;
    float _3178 = as_type<float>(gl_SubgroupInvocationID);
    int _3180 = as_type<int>(_3178) & _3176;
    int _3182 = ~_3176;
    int _3184 = _3172 & _3182;
    int _3186 = _3184 | _3180;
    int _3188 = ~_3176;
    int _3190 = _3167 & _3188;
    int _3192 = _3190 | _3180;
    bool _3194 = uint(_3192) <= uint(_3186);
    _3169 = _3194 ? (-1) : 0;
    float _3196 = spvSubgroupShuffle(as_type<float>(_3166), uint(_3192));
    uint _3198 = uint(_3194 ? as_type<int>(_3196) : _3166);
    return int(_3198);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _61 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_LocalInvocationID.x);
    int _67 = as_type<int>(_63) << 6;
    int _69 = _67 + as_type<int>(_65);
    bool _73 = uint(_69) >= as_type<uint>(_61);
    if (_73)
    {
        return;
    }
    int _75 = _69 * 96;
    int _77 = _75 + 64;
    uint _80 = uint(int(uint(_77) >> uint(2)));
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_80)]);
    int _84 = _77 + 4;
    uint _86 = uint(int(uint(_84) >> uint(2)));
    float _88 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_86)]);
    int _90 = _77 + 8;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_92)]);
    int _96 = _77 + 12;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_98)]);
    int _102 = _75 + 48;
    bool _104 = as_type<int>(_94) != (-1);
    if (!_104)
    {
        return;
    }
    uint _106 = uint(int(uint(_102) >> uint(2)));
    float _108 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_106)]);
    int _110 = _102 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_112)]);
    int _116 = _102 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_118)]);
    int _122 = _102 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_124)]);
    float _128 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _130 = _120 + _128;
    float _132 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _134 = _108 + _132;
    float _136 = _130 * _130;
    float _138 = fma(_134, _134, _136);
    float _140 = sqrt(_138);
    bool _142 = _140 > (*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _144 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _146 = _140 + _144;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _148 = _152;
    }
    float _154 = _148;
    float _156 = 0.0;
    if (_142)
    {
        float _158 = rsqrt(_138);
        _156 = _158;
    }
    float _160 = _156;
    float _162 = _154;
    float _164 = _160;
    if (_142)
    {
        float _166 = _146 * _154;
        _150 = _166;
    }
    float _168 = _150;
    if (_142)
    {
        float _170 = _114 + (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _162 = _170;
    }
    float _172 = _162;
    float _174 = 0.0;
    float _176 = _172;
    if (_142)
    {
        float _178 = _168 * 0.15915493667125701904296875;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = 0.0;
    if (_142)
    {
        float _184 = _180 * 6.283185482025146484375;
        float _186 = cos(_184);
        _182 = _186;
    }
    float _188 = _182;
    float _190 = _168;
    if (_142)
    {
        float _192 = _180 * 6.283185482025146484375;
        float _194 = sin(_192);
        _190 = _194;
    }
    float _196 = _190;
    float _198 = 0.0;
    if (_142)
    {
        float _200 = _188 + (-1.0);
        _198 = _200;
    }
    float _202 = _198;
    float _204 = 0.0;
    float _206 = _202;
    if (_142)
    {
        float _208 = _202 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _204 = _208;
    }
    float _210 = _204;
    if (!_142)
    {
        _206 = _108;
    }
    float _212 = _206;
    float _214 = 0.0;
    float _216 = _196;
    float _218 = _212;
    if (_142)
    {
        float _220 = fma(_196, _172, (*spvDescriptorSet0.cp_c5)._m0[0].x);
        _214 = _220;
    }
    float _222 = _214;
    if (!_142)
    {
        _176 = _114;
    }
    float _224 = _176;
    float _226 = _224;
    if (_142)
    {
        float _228 = fma(_114, _188, _210);
        _226 = _228;
    }
    float _230 = _226;
    if (!_142)
    {
        _216 = _120;
    }
    float _232 = _216;
    float _234 = _232;
    if (_142)
    {
        float _236 = _160 * _222;
        _164 = _236;
    }
    float _238 = _164;
    float _240 = _230 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _242 = _230 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    if (_142)
    {
        float _244 = fma(_134, _238, (*spvDescriptorSet0.cp_c3)._m0[4].x);
        _218 = _244;
    }
    float _246 = _218;
    if (_142)
    {
        float _248 = fma(_130, _238, (*spvDescriptorSet0.cp_c3)._m0[4].z);
        _234 = _248;
    }
    float _250 = _234;
    float _252 = _230 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _254 = _230 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _256 = fma(_246, (*spvDescriptorSet0.cp_c3)._m0[1].x, _240);
    float _258 = fma(_246, (*spvDescriptorSet0.cp_c3)._m0[2].x, _242);
    float _260 = fma(_246, (*spvDescriptorSet0.cp_c3)._m0[0].x, _252);
    float _262 = fma(_246, (*spvDescriptorSet0.cp_c3)._m0[3].x, _254);
    float _264 = fma(_250, (*spvDescriptorSet0.cp_c3)._m0[1].z, _256);
    float _266 = fma(_250, (*spvDescriptorSet0.cp_c3)._m0[2].z, _258);
    float _268 = fma(_250, (*spvDescriptorSet0.cp_c3)._m0[0].z, _260);
    float _270 = fma(_250, (*spvDescriptorSet0.cp_c3)._m0[3].z, _262);
    float _272 = _264 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _274 = _266 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _276 = _268 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _278 = _270 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    int _280 = as_type<int>(_94) * 20;
    bool _282 = _272 >= _126;
    bool _284 = isnan(_272);
    bool _286 = _282 || _284;
    bool _288 = isnan(_126);
    bool _290 = _286 || _288;
    bool _292 = _276 < _126;
    bool _294 = !_290;
    bool _296 = _292 && _294;
    bool _298 = _274 < _126;
    bool _300 = _298 && _296;
    bool _302 = _278 < _126;
    bool _304 = _302 && _300;
    if (!_304)
    {
        return;
    }
    uint _306 = uint(int(uint(_280) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_306)]);
    int _310 = _75 + 80;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    float _314 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_312)]);
    int _316 = _310 + 4;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    float _320 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_318)]);
    int _322 = _280 + 16;
    uint _324 = uint(int(uint(_322) >> uint(2)));
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_324)]);
    float _328 = -_114;
    float _330 = _328 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _332 = -_108;
    float _334 = _332 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _336 = -_120;
    float _338 = _336 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    int _340 = _75 + 32;
    float _342 = _330 * _330;
    float _344 = fma(_334, _334, _342);
    uint _346 = uint(int(uint(_340) >> uint(2)));
    float _348 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_346)]);
    int _350 = _340 + 4;
    uint _352 = uint(int(uint(_350) >> uint(2)));
    float _354 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_352)]);
    int _356 = _340 + 8;
    uint _358 = uint(int(uint(_356) >> uint(2)));
    float _360 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_358)]);
    int _362 = _340 + 12;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    float _366 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_364)]);
    float _368 = fma(_338, _338, _344);
    uint _370 = uint(int(uint(as_type<int>(_308)) >> uint(16)));
    int _372 = int(_370) << 4;
    float _374 = float2(as_type<half2>(as_type<uint>(_314))).x;
    float _376 = (-0.0) + _374;
    float _378 = float2(as_type<half2>(as_type<uint>(_314))).y;
    float _380 = (-0.0) + _378;
    uint _382 = uint(int(uint(_372) >> uint(2)));
    uint _384 = uint(int(uint(int(_382)) >> uint(2)));
    int _386 = int(_382) & 3;
    float _388 = (*spvDescriptorSet0.cp_c4)._m0[int(_384)][_386];
    float _390 = float2(as_type<half2>(as_type<uint>(_320))).x;
    float _392 = (-0.0) + _390;
    float _394 = float2(as_type<half2>(as_type<uint>(_320))).y;
    float _396 = (-0.0) + _394;
    int _398 = as_type<int>(_326) + (-1);
    float _400 = _388 * _388;
    int _402 = _75 + 16;
    float _404 = _376 * _400;
    float _406 = _380 * _400;
    float _408 = _392 * _400;
    float _410 = _396 * _400;
    float _412 = _404 * _404;
    float _414 = _406 * _406;
    float _416 = _408 * _408;
    bool _418 = _368 >= _412;
    bool _420 = isnan(_368);
    bool _422 = _418 || _420;
    bool _424 = isnan(_412);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _410 * _410;
    bool _432 = _368 >= _414;
    bool _434 = isnan(_368);
    bool _436 = _432 || _434;
    bool _438 = isnan(_414);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    bool _444 = _368 >= _416;
    bool _446 = isnan(_368);
    bool _448 = _444 || _446;
    bool _450 = isnan(_416);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    bool _456 = _368 >= _430;
    bool _458 = isnan(_368);
    bool _460 = _456 || _458;
    bool _462 = isnan(_430);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _428 + _442;
    float _470 = _454 + _468;
    float _472 = _466 + _470;
    float _474 = trunc(_472);
    float _476 = precise::max(_474, 0.0);
    uint _478 = uint(_476);
    int _480 = int(_478) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _482 = min(uint(_398), uint(_480));
    int _484 = _75 + 88;
    uint _486 = uint(int(uint(_75) >> uint(2)));
    float _488 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_486)]);
    int _490 = _75 + 4;
    uint _492 = uint(int(uint(_490) >> uint(2)));
    float _494 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_492)]);
    int _496 = _75 + 8;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    float _500 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_498)]);
    int _502 = _75 + 12;
    uint _504 = uint(int(uint(_502) >> uint(2)));
    float _506 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_504)]);
    int _508 = as_type<int>(_94) << 2;
    int _510 = _508 + int(_482);
    int _512 = _510 << 3;
    uint _514 = uint(int(uint(_484) >> uint(2)));
    float _516 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_514)]);
    int _518 = _512 + 4;
    uint _520 = uint(int(uint(_402) >> uint(2)));
    float _522 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_520)]);
    int _524 = _402 + 4;
    uint _526 = uint(int(uint(_524) >> uint(2)));
    float _528 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_526)]);
    int _530 = _402 + 8;
    uint _532 = uint(int(uint(_530) >> uint(2)));
    float _534 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_532)]);
    int _536 = _402 + 12;
    uint _538 = uint(int(uint(_536) >> uint(2)));
    float _540 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_538)]);
    int _542 = _518 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _544 = uint(_542) < uint(_518);
    int _546 = int(_544);
    bool _548 = uint(_542) < uint(_542);
    int _550 = int(_548);
    int _552 = _546 + _550;
    int _554 = _552 & 1;
    bool _556 = _554 != 0;
    int _558 = int(_556);
    int _560 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _558;
    uint _562 = spvSubgroupBallot(true).x;
    float _564 = spvSubgroupShuffle(as_type<float>(_542), 0u);
    bool _566 = as_type<int>(_564) == _542;
    float _568 = spvSubgroupShuffle(as_type<float>(_560), 0u);
    bool _570 = as_type<int>(_568) == _560;
    bool _572 = _566 && _570;
    int _574 = int(_572);
    float _576 = spvSubgroupShuffle(as_type<float>(_542), 1u);
    bool _578 = as_type<int>(_576) == _542;
    float _580 = spvSubgroupShuffle(as_type<float>(_560), 1u);
    bool _582 = as_type<int>(_580) == _560;
    bool _584 = _578 && _582;
    int _586 = _584 ? 2 : 0;
    int _588 = _574 | _586;
    float _590 = spvSubgroupShuffle(as_type<float>(_542), 2u);
    bool _592 = as_type<int>(_590) == _542;
    float _594 = spvSubgroupShuffle(as_type<float>(_560), 2u);
    bool _596 = as_type<int>(_594) == _560;
    bool _598 = _592 && _596;
    int _600 = _598 ? 4 : 0;
    int _602 = _588 | _600;
    float _604 = spvSubgroupShuffle(as_type<float>(_542), 3u);
    bool _606 = as_type<int>(_604) == _542;
    float _608 = spvSubgroupShuffle(as_type<float>(_560), 3u);
    bool _610 = as_type<int>(_608) == _560;
    bool _612 = _606 && _610;
    int _614 = _612 ? 8 : 0;
    int _616 = _602 | _614;
    float _618 = spvSubgroupShuffle(as_type<float>(_542), 4u);
    bool _620 = as_type<int>(_618) == _542;
    float _622 = spvSubgroupShuffle(as_type<float>(_560), 4u);
    bool _624 = as_type<int>(_622) == _560;
    bool _626 = _620 && _624;
    int _628 = _626 ? 16 : 0;
    int _630 = _616 | _628;
    float _632 = spvSubgroupShuffle(as_type<float>(_542), 5u);
    bool _634 = as_type<int>(_632) == _542;
    float _636 = spvSubgroupShuffle(as_type<float>(_560), 5u);
    bool _638 = as_type<int>(_636) == _560;
    bool _640 = _634 && _638;
    int _642 = _640 ? 32 : 0;
    int _644 = _630 | _642;
    float _646 = spvSubgroupShuffle(as_type<float>(_542), 6u);
    bool _648 = as_type<int>(_646) == _542;
    float _650 = spvSubgroupShuffle(as_type<float>(_560), 6u);
    bool _652 = as_type<int>(_650) == _560;
    bool _654 = _648 && _652;
    int _656 = _654 ? 64 : 0;
    int _658 = _644 | _656;
    float _660 = spvSubgroupShuffle(as_type<float>(_542), 7u);
    bool _662 = as_type<int>(_660) == _542;
    float _664 = spvSubgroupShuffle(as_type<float>(_560), 7u);
    bool _666 = as_type<int>(_664) == _560;
    bool _668 = _662 && _666;
    int _670 = _668 ? 128 : 0;
    int _672 = _658 | _670;
    float _674 = spvSubgroupShuffle(as_type<float>(_542), 8u);
    bool _676 = as_type<int>(_674) == _542;
    float _678 = spvSubgroupShuffle(as_type<float>(_560), 8u);
    bool _680 = as_type<int>(_678) == _560;
    bool _682 = _676 && _680;
    int _684 = _682 ? 256 : 0;
    int _686 = _672 | _684;
    float _688 = spvSubgroupShuffle(as_type<float>(_542), 9u);
    bool _690 = as_type<int>(_688) == _542;
    float _692 = spvSubgroupShuffle(as_type<float>(_560), 9u);
    bool _694 = as_type<int>(_692) == _560;
    bool _696 = _690 && _694;
    int _698 = _696 ? 512 : 0;
    int _700 = _686 | _698;
    float _702 = spvSubgroupShuffle(as_type<float>(_542), 10u);
    bool _704 = as_type<int>(_702) == _542;
    float _706 = spvSubgroupShuffle(as_type<float>(_560), 10u);
    bool _708 = as_type<int>(_706) == _560;
    bool _710 = _704 && _708;
    int _712 = _710 ? 1024 : 0;
    int _714 = _700 | _712;
    float _716 = spvSubgroupShuffle(as_type<float>(_542), 11u);
    bool _718 = as_type<int>(_716) == _542;
    float _720 = spvSubgroupShuffle(as_type<float>(_560), 11u);
    bool _722 = as_type<int>(_720) == _560;
    bool _724 = _718 && _722;
    int _726 = _724 ? 2048 : 0;
    int _728 = _714 | _726;
    float _730 = spvSubgroupShuffle(as_type<float>(_542), 12u);
    bool _732 = as_type<int>(_730) == _542;
    float _734 = spvSubgroupShuffle(as_type<float>(_560), 12u);
    bool _736 = as_type<int>(_734) == _560;
    bool _738 = _732 && _736;
    int _740 = _738 ? 4096 : 0;
    int _742 = _728 | _740;
    float _744 = spvSubgroupShuffle(as_type<float>(_542), 13u);
    bool _746 = as_type<int>(_744) == _542;
    float _748 = spvSubgroupShuffle(as_type<float>(_560), 13u);
    bool _750 = as_type<int>(_748) == _560;
    bool _752 = _746 && _750;
    int _754 = _752 ? 8192 : 0;
    int _756 = _742 | _754;
    float _758 = spvSubgroupShuffle(as_type<float>(_542), 14u);
    bool _760 = as_type<int>(_758) == _542;
    float _762 = spvSubgroupShuffle(as_type<float>(_560), 14u);
    bool _764 = as_type<int>(_762) == _560;
    bool _766 = _760 && _764;
    int _768 = _766 ? 16384 : 0;
    int _770 = _756 | _768;
    float _772 = spvSubgroupShuffle(as_type<float>(_542), 15u);
    bool _774 = as_type<int>(_772) == _542;
    float _776 = spvSubgroupShuffle(as_type<float>(_560), 15u);
    bool _778 = as_type<int>(_776) == _560;
    bool _780 = _774 && _778;
    int _782 = _780 ? 32768 : 0;
    int _784 = _770 | _782;
    float _786 = spvSubgroupShuffle(as_type<float>(_542), 16u);
    bool _788 = as_type<int>(_786) == _542;
    float _790 = spvSubgroupShuffle(as_type<float>(_560), 16u);
    bool _792 = as_type<int>(_790) == _560;
    bool _794 = _788 && _792;
    int _796 = _794 ? 65536 : 0;
    int _798 = _784 | _796;
    float _800 = spvSubgroupShuffle(as_type<float>(_542), 17u);
    bool _802 = as_type<int>(_800) == _542;
    float _804 = spvSubgroupShuffle(as_type<float>(_560), 17u);
    bool _806 = as_type<int>(_804) == _560;
    bool _808 = _802 && _806;
    int _810 = _808 ? 131072 : 0;
    int _812 = _798 | _810;
    float _814 = spvSubgroupShuffle(as_type<float>(_542), 18u);
    bool _816 = as_type<int>(_814) == _542;
    float _818 = spvSubgroupShuffle(as_type<float>(_560), 18u);
    bool _820 = as_type<int>(_818) == _560;
    bool _822 = _816 && _820;
    int _824 = _822 ? 262144 : 0;
    int _826 = _812 | _824;
    float _828 = spvSubgroupShuffle(as_type<float>(_542), 19u);
    bool _830 = as_type<int>(_828) == _542;
    float _832 = spvSubgroupShuffle(as_type<float>(_560), 19u);
    bool _834 = as_type<int>(_832) == _560;
    bool _836 = _830 && _834;
    int _838 = _836 ? 524288 : 0;
    int _840 = _826 | _838;
    float _842 = spvSubgroupShuffle(as_type<float>(_542), 20u);
    bool _844 = as_type<int>(_842) == _542;
    float _846 = spvSubgroupShuffle(as_type<float>(_560), 20u);
    bool _848 = as_type<int>(_846) == _560;
    bool _850 = _844 && _848;
    int _852 = _850 ? 1048576 : 0;
    int _854 = _840 | _852;
    float _856 = spvSubgroupShuffle(as_type<float>(_542), 21u);
    bool _858 = as_type<int>(_856) == _542;
    float _860 = spvSubgroupShuffle(as_type<float>(_560), 21u);
    bool _862 = as_type<int>(_860) == _560;
    bool _864 = _858 && _862;
    int _866 = _864 ? 2097152 : 0;
    int _868 = _854 | _866;
    float _870 = spvSubgroupShuffle(as_type<float>(_542), 22u);
    bool _872 = as_type<int>(_870) == _542;
    float _874 = spvSubgroupShuffle(as_type<float>(_560), 22u);
    bool _876 = as_type<int>(_874) == _560;
    bool _878 = _872 && _876;
    int _880 = _878 ? 4194304 : 0;
    int _882 = _868 | _880;
    float _884 = spvSubgroupShuffle(as_type<float>(_542), 23u);
    bool _886 = as_type<int>(_884) == _542;
    float _888 = spvSubgroupShuffle(as_type<float>(_560), 23u);
    bool _890 = as_type<int>(_888) == _560;
    bool _892 = _886 && _890;
    int _894 = _892 ? 8388608 : 0;
    int _896 = _882 | _894;
    float _898 = spvSubgroupShuffle(as_type<float>(_542), 24u);
    bool _900 = as_type<int>(_898) == _542;
    float _902 = spvSubgroupShuffle(as_type<float>(_560), 24u);
    bool _904 = as_type<int>(_902) == _560;
    bool _906 = _900 && _904;
    int _908 = _906 ? 16777216 : 0;
    int _910 = _896 | _908;
    float _912 = spvSubgroupShuffle(as_type<float>(_542), 25u);
    bool _914 = as_type<int>(_912) == _542;
    float _916 = spvSubgroupShuffle(as_type<float>(_560), 25u);
    bool _918 = as_type<int>(_916) == _560;
    bool _920 = _914 && _918;
    int _922 = _920 ? 33554432 : 0;
    int _924 = _910 | _922;
    float _926 = spvSubgroupShuffle(as_type<float>(_542), 26u);
    bool _928 = as_type<int>(_926) == _542;
    float _930 = spvSubgroupShuffle(as_type<float>(_560), 26u);
    bool _932 = as_type<int>(_930) == _560;
    bool _934 = _928 && _932;
    int _936 = _934 ? 67108864 : 0;
    int _938 = _924 | _936;
    float _940 = spvSubgroupShuffle(as_type<float>(_542), 27u);
    bool _942 = as_type<int>(_940) == _542;
    float _944 = spvSubgroupShuffle(as_type<float>(_560), 27u);
    bool _946 = as_type<int>(_944) == _560;
    bool _948 = _942 && _946;
    int _950 = _948 ? 134217728 : 0;
    int _952 = _938 | _950;
    float _954 = spvSubgroupShuffle(as_type<float>(_542), 28u);
    bool _956 = as_type<int>(_954) == _542;
    float _958 = spvSubgroupShuffle(as_type<float>(_560), 28u);
    bool _960 = as_type<int>(_958) == _560;
    bool _962 = _956 && _960;
    int _964 = _962 ? 268435456 : 0;
    int _966 = _952 | _964;
    float _968 = spvSubgroupShuffle(as_type<float>(_542), 29u);
    bool _970 = as_type<int>(_968) == _542;
    float _972 = spvSubgroupShuffle(as_type<float>(_560), 29u);
    bool _974 = as_type<int>(_972) == _560;
    bool _976 = _970 && _974;
    int _978 = _976 ? 536870912 : 0;
    int _980 = _966 | _978;
    float _982 = spvSubgroupShuffle(as_type<float>(_542), 30u);
    bool _984 = as_type<int>(_982) == _542;
    float _986 = spvSubgroupShuffle(as_type<float>(_560), 30u);
    bool _988 = as_type<int>(_986) == _560;
    bool _990 = _984 && _988;
    int _992 = _990 ? 1073741824 : 0;
    int _994 = _980 | _992;
    float _996 = spvSubgroupShuffle(as_type<float>(_542), 31u);
    bool _998 = as_type<int>(_996) == _542;
    float _1000 = spvSubgroupShuffle(as_type<float>(_560), 31u);
    bool _1002 = as_type<int>(_1000) == _560;
    bool _1004 = _998 && _1002;
    int _1006 = _1004 ? int(0x80000000) : 0;
    int _1008 = _994 | _1006;
    int _1010 = _1008 & int(_562);
    bool _1012 = _1010 == int(_562);
    int _1014 = 0;
    if (!_1012)
    {
        uint _1016 = uint(int(uint(_518) >> uint(2)));
        uint _2814 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1016)], 1u, memory_order_relaxed);
        uint _1018 = _2814;
        _1014 = int(_1018);
    }
    int _1020 = _1014;
    bool _1022 = !_1012;
    int _1024 = _1020;
    if (!_1022)
    {
        float _1026 = as_type<float>(gl_SubgroupInvocationID);
        uint _1028 = spvSubgroupBallot(true).x;
        int _1030 = int(spvFindUMSB(_1028));
        int _1032 = popcount(int(_1028));
        bool _1034 = _1030 == as_type<int>(_1026);
        int _1036 = _1032;
        if (_1034)
        {
            uint _1038 = uint(int(uint(_518) >> uint(2)));
            uint _2850 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1038)], uint(_1032), memory_order_relaxed);
            uint _1040 = _2850;
            _1036 = int(_1040);
        }
        int _1042 = _1036;
        float _1044 = as_type<float>(gl_SubgroupLtMask.x);
        int _1046 = as_type<int>(_1044) & int(_1028);
        int _1048 = popcount(_1046);
        int _1050 = _1042;
        int _1052 = _1030;
        int _1054 = 31;
        int _1056;
        int _2868 = _57(_1050, _1052, _1054, _1056, gl_SubgroupInvocationID);
        int _1058 = _2868;
        int _1060 = _1058 + _1048;
        _1024 = _1060;
    }
    int _1062 = _1024;
    uint _1064 = uint(int(uint(_512) >> uint(2)));
    float _1066 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_1064)]);
    int _1068 = as_type<int>(_506) * 1664525;
    int _1070 = _1068 + 1013904223;
    int _1072 = as_type<int>(_540) * 1664525;
    int _1074 = _1072 + 1013904223;
    int _1076 = as_type<int>(_366) * 1664525;
    int _1078 = _1076 + 1013904223;
    uint _1080 = uint(int(uint(as_type<int>(_516)) >> uint(16)));
    int _1082 = _1074 * _1078;
    int _1084 = _1082 + _1070;
    int _1086 = _1078 * _1084;
    int _1088 = _1086 + _1074;
    uint _1090 = uint(int(uint(_1084) >> uint(16)));
    int _1092 = _1084 * _1088;
    int _1094 = _1092 + _1078;
    uint _1096 = uint(int(uint(_1088) >> uint(16)));
    int _1098 = _1084 ^ int(_1090);
    uint _1100 = uint(int(uint(_1094) >> uint(16)));
    int _1102 = _1088 ^ int(_1096);
    int _1104 = _1094 ^ int(_1100);
    int _1106 = _1102 * _1104;
    int _1108 = _1106 + _1098;
    int _1110 = as_type<int>(_516) & 65535;
    uint _1112 = uint(int(uint(_1108) >> uint(9)));
    int _1114 = int(_1112) + 1065353216;
    float _1116 = as_type<float>(_1114) + (-1.0);
    int _1118 = _1062 + as_type<int>(_1066);
    int _1120 = _1118 * 80;
    int _1122 = _1120 + 16;
    uint _1124 = uint(int(uint(_1120) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1124)] = as_type<uint>(_488);
    int _1126 = _1120 + 4;
    uint _1128 = uint(int(uint(_1126) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1128)] = as_type<uint>(_494);
    int _1130 = _1120 + 8;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1132)] = as_type<uint>(_500);
    int _1134 = _1120 + 12;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1136)] = as_type<uint>(_506);
    int _1138 = _1120 + 32;
    int _1140 = _1120 + 48;
    uint _1142 = uint(int(uint(_1122) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1142)] = as_type<uint>(_522);
    int _1144 = _1122 + 4;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1146)] = as_type<uint>(_528);
    int _1148 = _1122 + 8;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1150)] = as_type<uint>(_534);
    int _1152 = _1122 + 12;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1154)] = as_type<uint>(_540);
    int _1156 = _1120 + 64;
    uint _1158 = uint(int(uint(_1138) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1158)] = as_type<uint>(_348);
    int _1160 = _1138 + 4;
    uint _1162 = uint(int(uint(_1160) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1162)] = as_type<uint>(_354);
    int _1164 = _1138 + 8;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1166)] = as_type<uint>(_360);
    int _1168 = _1138 + 12;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1170)] = as_type<uint>(_366);
    uint _1172 = uint(int(uint(_1140) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1172)] = as_type<uint>(_1116);
    int _1174 = _1140 + 4;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1176)] = _1080;
    int _1178 = _1140 + 8;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1180)] = uint(_1110);
    int _1182 = _1140 + 12;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1184)] = as_type<uint>(_100);
    uint _1186 = uint(int(uint(_1156) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1186)] = 1065353216u;
    int _1188 = _1156 + 4;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1190)] = as_type<uint>(_82);
    int _1192 = _1156 + 8;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1194)] = as_type<uint>(_88);
    int _1196 = _1156 + 12;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1198)] = as_type<uint>(_94);
}

