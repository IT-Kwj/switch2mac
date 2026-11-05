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
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _52 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _54 = as_type<float>(gl_WorkGroupID.x);
    float _56 = as_type<float>(gl_LocalInvocationID.x);
    int _59 = as_type<int>(_54) << 6;
    int _61 = _59 + as_type<int>(_56);
    bool _65 = uint(_61) >= as_type<uint>(_52);
    if (_65)
    {
        return;
    }
    int _67 = _61 * 96;
    int _69 = _67 + 64;
    int _71 = _69 + 8;
    uint _74 = uint(int(uint(_71) >> uint(2)));
    float _76 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_74)]);
    int _78 = _67 + 48;
    bool _80 = as_type<int>(_76) != (-1);
    if (!_80)
    {
        return;
    }
    uint _82 = uint(int(uint(_78) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_82)]);
    int _86 = _78 + 4;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    int _92 = _78 + 8;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_94)]);
    int _98 = _78 + 12;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_100)]);
    float _104 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _106 = _96 + _104;
    float _108 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _110 = _84 + _108;
    float _112 = _106 * _106;
    float _114 = fma(_110, _110, _112);
    float _116 = sqrt(_114);
    bool _118 = _116 > (*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _120 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _122 = _116 + _120;
    float _124 = _112;
    float _126 = _122;
    if (_118)
    {
        float _128 = 1.0 / (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _124 = _128;
    }
    float _130 = _124;
    float _132 = 0.0;
    if (_118)
    {
        float _134 = rsqrt(_114);
        _132 = _134;
    }
    float _136 = _132;
    float _138 = _130;
    float _140 = _136;
    if (_118)
    {
        float _142 = _122 * _130;
        _126 = _142;
    }
    float _144 = _126;
    if (_118)
    {
        float _146 = _90 + (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _138 = _146;
    }
    float _148 = _138;
    float _150 = 0.0;
    float _152 = _148;
    if (_118)
    {
        float _154 = _144 * 0.15915493667125701904296875;
        _150 = _154;
    }
    float _156 = _150;
    float _158 = 0.0;
    if (_118)
    {
        float _160 = _156 * 6.283185482025146484375;
        float _162 = cos(_160);
        _158 = _162;
    }
    float _164 = _158;
    float _166 = _144;
    if (_118)
    {
        float _168 = _156 * 6.283185482025146484375;
        float _170 = sin(_168);
        _166 = _170;
    }
    float _172 = _166;
    float _174 = 0.0;
    if (_118)
    {
        float _176 = _164 + (-1.0);
        _174 = _176;
    }
    float _178 = _174;
    float _180 = 0.0;
    float _182 = _178;
    if (_118)
    {
        float _184 = _178 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
        _180 = _184;
    }
    float _186 = _180;
    if (!_118)
    {
        _182 = _84;
    }
    float _188 = _182;
    float _190 = 0.0;
    float _192 = _172;
    float _194 = _188;
    if (_118)
    {
        float _196 = fma(_172, _148, (*spvDescriptorSet0.cp_c5)._m0[0].x);
        _190 = _196;
    }
    float _198 = _190;
    if (!_118)
    {
        _152 = _90;
    }
    float _200 = _152;
    float _202 = _200;
    if (_118)
    {
        float _204 = fma(_90, _164, _186);
        _202 = _204;
    }
    float _206 = _202;
    if (!_118)
    {
        _192 = _96;
    }
    float _208 = _192;
    float _210 = _208;
    if (_118)
    {
        float _212 = _136 * _198;
        _140 = _212;
    }
    float _214 = _140;
    float _216 = _206 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _218 = _206 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    if (_118)
    {
        float _220 = fma(_110, _214, (*spvDescriptorSet0.cp_c3)._m0[4].x);
        _194 = _220;
    }
    float _222 = _194;
    if (_118)
    {
        float _224 = fma(_106, _214, (*spvDescriptorSet0.cp_c3)._m0[4].z);
        _210 = _224;
    }
    float _226 = _210;
    float _228 = _206 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _230 = _206 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _232 = fma(_222, (*spvDescriptorSet0.cp_c3)._m0[1].x, _216);
    float _234 = fma(_222, (*spvDescriptorSet0.cp_c3)._m0[2].x, _218);
    float _236 = fma(_222, (*spvDescriptorSet0.cp_c3)._m0[0].x, _228);
    float _238 = fma(_222, (*spvDescriptorSet0.cp_c3)._m0[3].x, _230);
    float _240 = fma(_226, (*spvDescriptorSet0.cp_c3)._m0[1].z, _232);
    float _242 = fma(_226, (*spvDescriptorSet0.cp_c3)._m0[2].z, _234);
    float _244 = fma(_226, (*spvDescriptorSet0.cp_c3)._m0[0].z, _236);
    float _246 = fma(_226, (*spvDescriptorSet0.cp_c3)._m0[3].z, _238);
    float _248 = _240 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _250 = _242 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _252 = _244 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    int _254 = as_type<int>(_76) * 20;
    bool _256 = _248 >= _102;
    bool _258 = isnan(_248);
    bool _260 = _256 || _258;
    bool _262 = isnan(_102);
    bool _264 = _260 || _262;
    bool _266 = _252 < _102;
    bool _268 = !_264;
    bool _270 = _266 && _268;
    float _272 = _246 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _274 = _250 < _102;
    bool _276 = _274 && _270;
    bool _278 = _272 < _102;
    bool _280 = _278 && _276;
    if (!_280)
    {
        return;
    }
    uint _282 = uint(int(uint(_254) >> uint(2)));
    float _284 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_282)]);
    int _286 = _67 + 92;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_288)]);
    float _292 = -_90;
    float _294 = _292 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _296 = -_84;
    float _298 = _296 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _300 = -_96;
    float _302 = _300 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _304 = _294 * _294;
    float _306 = fma(_298, _298, _304);
    float _308 = fma(_302, _302, _306);
    float _310 = sqrt(_308);
    uint _312 = uint(int(uint(as_type<int>(_284)) >> uint(16)));
    int _314 = int(_312) << 4;
    int _316 = _314 + 4;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    uint _320 = uint(int(uint(int(_318)) >> uint(2)));
    int _322 = int(_318) & 3;
    float _324 = (*spvDescriptorSet0.cp_c4)._m0[int(_320)][_322];
    float _326 = _290 * _324;
    float _328 = precise::max(_326, 2500.0);
    bool _330 = _328 >= _310;
    bool _332 = isnan(_328);
    bool _334 = _330 || _332;
    bool _336 = isnan(_310);
    bool _338 = _334 || _336;
    if (!_338)
    {
        return;
    }
    float _340 = _102 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
    float _342 = _310 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _344 = _342 * 8.0;
    bool _346 = _340 >= _344;
    bool _348 = isnan(_340);
    bool _350 = _346 || _348;
    bool _352 = isnan(_344);
    bool _354 = _350 || _352;
    if (!_354)
    {
        return;
    }
    int _356 = as_type<int>(_76) << 5;
    int _358 = _356 + 4;
    int _360 = _358 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _362 = uint(_360) < uint(_358);
    int _364 = int(_362);
    bool _366 = uint(_360) < uint(_360);
    int _368 = int(_366);
    int _370 = _364 + _368;
    int _372 = _370 & 1;
    bool _374 = _372 != 0;
    int _376 = int(_374);
    int _378 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _376;
    uint _380 = spvSubgroupBallot(true).x;
    float _382 = spvSubgroupShuffle(as_type<float>(_360), 0u);
    bool _384 = as_type<int>(_382) == _360;
    float _386 = spvSubgroupShuffle(as_type<float>(_378), 0u);
    bool _388 = as_type<int>(_386) == _378;
    bool _390 = _384 && _388;
    int _392 = int(_390);
    float _394 = spvSubgroupShuffle(as_type<float>(_360), 1u);
    bool _396 = as_type<int>(_394) == _360;
    float _398 = spvSubgroupShuffle(as_type<float>(_378), 1u);
    bool _400 = as_type<int>(_398) == _378;
    bool _402 = _396 && _400;
    int _404 = _402 ? 2 : 0;
    int _406 = _392 | _404;
    float _408 = spvSubgroupShuffle(as_type<float>(_360), 2u);
    bool _410 = as_type<int>(_408) == _360;
    float _412 = spvSubgroupShuffle(as_type<float>(_378), 2u);
    bool _414 = as_type<int>(_412) == _378;
    bool _416 = _410 && _414;
    int _418 = _416 ? 4 : 0;
    int _420 = _406 | _418;
    float _422 = spvSubgroupShuffle(as_type<float>(_360), 3u);
    bool _424 = as_type<int>(_422) == _360;
    float _426 = spvSubgroupShuffle(as_type<float>(_378), 3u);
    bool _428 = as_type<int>(_426) == _378;
    bool _430 = _424 && _428;
    int _432 = _430 ? 8 : 0;
    int _434 = _420 | _432;
    float _436 = spvSubgroupShuffle(as_type<float>(_360), 4u);
    bool _438 = as_type<int>(_436) == _360;
    float _440 = spvSubgroupShuffle(as_type<float>(_378), 4u);
    bool _442 = as_type<int>(_440) == _378;
    bool _444 = _438 && _442;
    int _446 = _444 ? 16 : 0;
    int _448 = _434 | _446;
    float _450 = spvSubgroupShuffle(as_type<float>(_360), 5u);
    bool _452 = as_type<int>(_450) == _360;
    float _454 = spvSubgroupShuffle(as_type<float>(_378), 5u);
    bool _456 = as_type<int>(_454) == _378;
    bool _458 = _452 && _456;
    int _460 = _458 ? 32 : 0;
    int _462 = _448 | _460;
    float _464 = spvSubgroupShuffle(as_type<float>(_360), 6u);
    bool _466 = as_type<int>(_464) == _360;
    float _468 = spvSubgroupShuffle(as_type<float>(_378), 6u);
    bool _470 = as_type<int>(_468) == _378;
    bool _472 = _466 && _470;
    int _474 = _472 ? 64 : 0;
    int _476 = _462 | _474;
    float _478 = spvSubgroupShuffle(as_type<float>(_360), 7u);
    bool _480 = as_type<int>(_478) == _360;
    float _482 = spvSubgroupShuffle(as_type<float>(_378), 7u);
    bool _484 = as_type<int>(_482) == _378;
    bool _486 = _480 && _484;
    int _488 = _486 ? 128 : 0;
    int _490 = _476 | _488;
    float _492 = spvSubgroupShuffle(as_type<float>(_360), 8u);
    bool _494 = as_type<int>(_492) == _360;
    float _496 = spvSubgroupShuffle(as_type<float>(_378), 8u);
    bool _498 = as_type<int>(_496) == _378;
    bool _500 = _494 && _498;
    int _502 = _500 ? 256 : 0;
    int _504 = _490 | _502;
    float _506 = spvSubgroupShuffle(as_type<float>(_360), 9u);
    bool _508 = as_type<int>(_506) == _360;
    float _510 = spvSubgroupShuffle(as_type<float>(_378), 9u);
    bool _512 = as_type<int>(_510) == _378;
    bool _514 = _508 && _512;
    int _516 = _514 ? 512 : 0;
    int _518 = _504 | _516;
    float _520 = spvSubgroupShuffle(as_type<float>(_360), 10u);
    bool _522 = as_type<int>(_520) == _360;
    float _524 = spvSubgroupShuffle(as_type<float>(_378), 10u);
    bool _526 = as_type<int>(_524) == _378;
    bool _528 = _522 && _526;
    int _530 = _528 ? 1024 : 0;
    int _532 = _518 | _530;
    float _534 = spvSubgroupShuffle(as_type<float>(_360), 11u);
    bool _536 = as_type<int>(_534) == _360;
    float _538 = spvSubgroupShuffle(as_type<float>(_378), 11u);
    bool _540 = as_type<int>(_538) == _378;
    bool _542 = _536 && _540;
    int _544 = _542 ? 2048 : 0;
    int _546 = _532 | _544;
    float _548 = spvSubgroupShuffle(as_type<float>(_360), 12u);
    bool _550 = as_type<int>(_548) == _360;
    float _552 = spvSubgroupShuffle(as_type<float>(_378), 12u);
    bool _554 = as_type<int>(_552) == _378;
    bool _556 = _550 && _554;
    int _558 = _556 ? 4096 : 0;
    int _560 = _546 | _558;
    float _562 = spvSubgroupShuffle(as_type<float>(_360), 13u);
    bool _564 = as_type<int>(_562) == _360;
    float _566 = spvSubgroupShuffle(as_type<float>(_378), 13u);
    bool _568 = as_type<int>(_566) == _378;
    bool _570 = _564 && _568;
    int _572 = _570 ? 8192 : 0;
    int _574 = _560 | _572;
    float _576 = spvSubgroupShuffle(as_type<float>(_360), 14u);
    bool _578 = as_type<int>(_576) == _360;
    float _580 = spvSubgroupShuffle(as_type<float>(_378), 14u);
    bool _582 = as_type<int>(_580) == _378;
    bool _584 = _578 && _582;
    int _586 = _584 ? 16384 : 0;
    int _588 = _574 | _586;
    float _590 = spvSubgroupShuffle(as_type<float>(_360), 15u);
    bool _592 = as_type<int>(_590) == _360;
    float _594 = spvSubgroupShuffle(as_type<float>(_378), 15u);
    bool _596 = as_type<int>(_594) == _378;
    bool _598 = _592 && _596;
    int _600 = _598 ? 32768 : 0;
    int _602 = _588 | _600;
    float _604 = spvSubgroupShuffle(as_type<float>(_360), 16u);
    bool _606 = as_type<int>(_604) == _360;
    float _608 = spvSubgroupShuffle(as_type<float>(_378), 16u);
    bool _610 = as_type<int>(_608) == _378;
    bool _612 = _606 && _610;
    int _614 = _612 ? 65536 : 0;
    int _616 = _602 | _614;
    float _618 = spvSubgroupShuffle(as_type<float>(_360), 17u);
    bool _620 = as_type<int>(_618) == _360;
    float _622 = spvSubgroupShuffle(as_type<float>(_378), 17u);
    bool _624 = as_type<int>(_622) == _378;
    bool _626 = _620 && _624;
    int _628 = _626 ? 131072 : 0;
    int _630 = _616 | _628;
    float _632 = spvSubgroupShuffle(as_type<float>(_360), 18u);
    bool _634 = as_type<int>(_632) == _360;
    float _636 = spvSubgroupShuffle(as_type<float>(_378), 18u);
    bool _638 = as_type<int>(_636) == _378;
    bool _640 = _634 && _638;
    int _642 = _640 ? 262144 : 0;
    int _644 = _630 | _642;
    float _646 = spvSubgroupShuffle(as_type<float>(_360), 19u);
    bool _648 = as_type<int>(_646) == _360;
    float _650 = spvSubgroupShuffle(as_type<float>(_378), 19u);
    bool _652 = as_type<int>(_650) == _378;
    bool _654 = _648 && _652;
    int _656 = _654 ? 524288 : 0;
    int _658 = _644 | _656;
    float _660 = spvSubgroupShuffle(as_type<float>(_360), 20u);
    bool _662 = as_type<int>(_660) == _360;
    float _664 = spvSubgroupShuffle(as_type<float>(_378), 20u);
    bool _666 = as_type<int>(_664) == _378;
    bool _668 = _662 && _666;
    int _670 = _668 ? 1048576 : 0;
    int _672 = _658 | _670;
    float _674 = spvSubgroupShuffle(as_type<float>(_360), 21u);
    bool _676 = as_type<int>(_674) == _360;
    float _678 = spvSubgroupShuffle(as_type<float>(_378), 21u);
    bool _680 = as_type<int>(_678) == _378;
    bool _682 = _676 && _680;
    int _684 = _682 ? 2097152 : 0;
    int _686 = _672 | _684;
    float _688 = spvSubgroupShuffle(as_type<float>(_360), 22u);
    bool _690 = as_type<int>(_688) == _360;
    float _692 = spvSubgroupShuffle(as_type<float>(_378), 22u);
    bool _694 = as_type<int>(_692) == _378;
    bool _696 = _690 && _694;
    int _698 = _696 ? 4194304 : 0;
    int _700 = _686 | _698;
    float _702 = spvSubgroupShuffle(as_type<float>(_360), 23u);
    bool _704 = as_type<int>(_702) == _360;
    float _706 = spvSubgroupShuffle(as_type<float>(_378), 23u);
    bool _708 = as_type<int>(_706) == _378;
    bool _710 = _704 && _708;
    int _712 = _710 ? 8388608 : 0;
    int _714 = _700 | _712;
    float _716 = spvSubgroupShuffle(as_type<float>(_360), 24u);
    bool _718 = as_type<int>(_716) == _360;
    float _720 = spvSubgroupShuffle(as_type<float>(_378), 24u);
    bool _722 = as_type<int>(_720) == _378;
    bool _724 = _718 && _722;
    int _726 = _724 ? 16777216 : 0;
    int _728 = _714 | _726;
    float _730 = spvSubgroupShuffle(as_type<float>(_360), 25u);
    bool _732 = as_type<int>(_730) == _360;
    float _734 = spvSubgroupShuffle(as_type<float>(_378), 25u);
    bool _736 = as_type<int>(_734) == _378;
    bool _738 = _732 && _736;
    int _740 = _738 ? 33554432 : 0;
    int _742 = _728 | _740;
    float _744 = spvSubgroupShuffle(as_type<float>(_360), 26u);
    bool _746 = as_type<int>(_744) == _360;
    float _748 = spvSubgroupShuffle(as_type<float>(_378), 26u);
    bool _750 = as_type<int>(_748) == _378;
    bool _752 = _746 && _750;
    int _754 = _752 ? 67108864 : 0;
    int _756 = _742 | _754;
    float _758 = spvSubgroupShuffle(as_type<float>(_360), 27u);
    bool _760 = as_type<int>(_758) == _360;
    float _762 = spvSubgroupShuffle(as_type<float>(_378), 27u);
    bool _764 = as_type<int>(_762) == _378;
    bool _766 = _760 && _764;
    int _768 = _766 ? 134217728 : 0;
    int _770 = _756 | _768;
    float _772 = spvSubgroupShuffle(as_type<float>(_360), 28u);
    bool _774 = as_type<int>(_772) == _360;
    float _776 = spvSubgroupShuffle(as_type<float>(_378), 28u);
    bool _778 = as_type<int>(_776) == _378;
    bool _780 = _774 && _778;
    int _782 = _780 ? 268435456 : 0;
    int _784 = _770 | _782;
    float _786 = spvSubgroupShuffle(as_type<float>(_360), 29u);
    bool _788 = as_type<int>(_786) == _360;
    float _790 = spvSubgroupShuffle(as_type<float>(_378), 29u);
    bool _792 = as_type<int>(_790) == _378;
    bool _794 = _788 && _792;
    int _796 = _794 ? 536870912 : 0;
    int _798 = _784 | _796;
    float _800 = spvSubgroupShuffle(as_type<float>(_360), 30u);
    bool _802 = as_type<int>(_800) == _360;
    float _804 = spvSubgroupShuffle(as_type<float>(_378), 30u);
    bool _806 = as_type<int>(_804) == _378;
    bool _808 = _802 && _806;
    int _810 = _808 ? 1073741824 : 0;
    int _812 = _798 | _810;
    float _814 = spvSubgroupShuffle(as_type<float>(_360), 31u);
    bool _816 = as_type<int>(_814) == _360;
    float _818 = spvSubgroupShuffle(as_type<float>(_378), 31u);
    bool _820 = as_type<int>(_818) == _378;
    bool _822 = _816 && _820;
    int _824 = _822 ? int(0x80000000) : 0;
    int _826 = _812 | _824;
    int _828 = _826 & int(_380);
    bool _830 = _828 == int(_380);
    if (!_830)
    {
        uint _832 = uint(int(uint(_358) >> uint(2)));
        uint _2196 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_832)], 1u, memory_order_relaxed);
        uint _834 = _2196;
    }
    if (!_830)
    {
        return;
    }
    float _836 = as_type<float>(gl_SubgroupInvocationID);
    uint _838 = spvSubgroupBallot(true).x;
    int _840 = int(spvFindUMSB(_838));
    int _842 = popcount(int(_838));
    bool _844 = as_type<int>(_836) == _840;
    if (_844)
    {
        uint _846 = uint(int(uint(_358) >> uint(2)));
        uint _2226 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_846)], uint(_842), memory_order_relaxed);
        uint _848 = _2226;
    }
}

