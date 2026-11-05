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
    float _254 = _246 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _256 = _248 >= _102;
    bool _258 = isnan(_248);
    bool _260 = _256 || _258;
    bool _262 = isnan(_102);
    bool _264 = _260 || _262;
    bool _266 = _252 < _102;
    bool _268 = !_264;
    bool _270 = _266 && _268;
    bool _272 = _250 < _102;
    bool _274 = _272 && _270;
    bool _276 = _254 < _102;
    bool _278 = _276 && _274;
    int _280 = as_type<int>(_76) * 20;
    if (!_278)
    {
        return;
    }
    uint _282 = uint(int(uint(_280) >> uint(2)));
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
    int _346 = _67 + 80;
    bool _348 = _340 >= _344;
    bool _350 = isnan(_340);
    bool _352 = _348 || _350;
    bool _354 = isnan(_344);
    bool _356 = _352 || _354;
    if (!_356)
    {
        return;
    }
    uint _358 = uint(int(uint(_346) >> uint(2)));
    float _360 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_358)]);
    int _362 = _346 + 4;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    float _366 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_364)]);
    int _368 = _280 + 16;
    uint _370 = uint(int(uint(_368) >> uint(2)));
    float _372 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_370)]);
    uint _374 = uint(int(uint(_314) >> uint(2)));
    uint _376 = uint(int(uint(int(_374)) >> uint(2)));
    int _378 = int(_374) & 3;
    float _380 = (*spvDescriptorSet0.cp_c4)._m0[int(_376)][_378];
    float _382 = _380 * _380;
    float _384 = float2(as_type<half2>(as_type<uint>(_360))).x;
    float _386 = (-0.0) + _384;
    float _388 = float2(as_type<half2>(as_type<uint>(_360))).y;
    float _390 = (-0.0) + _388;
    float _392 = float2(as_type<half2>(as_type<uint>(_366))).x;
    float _394 = (-0.0) + _392;
    float _396 = _386 * _382;
    float _398 = float2(as_type<half2>(as_type<uint>(_366))).y;
    float _400 = (-0.0) + _398;
    float _402 = _390 * _382;
    int _404 = as_type<int>(_372) + (-1);
    float _406 = _394 * _382;
    float _408 = _396 * _396;
    float _410 = _402 * _402;
    float _412 = _400 * _382;
    float _414 = _406 * _406;
    bool _416 = _308 >= _408;
    bool _418 = isnan(_308);
    bool _420 = _416 || _418;
    bool _422 = isnan(_408);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = _412 * _412;
    bool _430 = _308 >= _410;
    bool _432 = isnan(_308);
    bool _434 = _430 || _432;
    bool _436 = isnan(_410);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    bool _442 = _308 >= _414;
    bool _444 = isnan(_308);
    bool _446 = _442 || _444;
    bool _448 = isnan(_414);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    bool _454 = _308 >= _428;
    bool _456 = isnan(_308);
    bool _458 = _454 || _456;
    bool _460 = isnan(_428);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = _426 + _440;
    float _468 = _452 + _466;
    float _470 = _464 + _468;
    float _472 = trunc(_470);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    int _478 = int(_476) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _480 = min(uint(_404), uint(_478));
    int _482 = as_type<int>(_76) << 2;
    int _484 = _482 + int(_480);
    int _486 = _484 << 3;
    int _488 = _486 + 4;
    int _490 = _488 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _492 = uint(_490) < uint(_488);
    int _494 = int(_492);
    bool _496 = uint(_490) < uint(_490);
    int _498 = int(_496);
    int _500 = _494 + _498;
    int _502 = _500 & 1;
    bool _504 = _502 != 0;
    int _506 = int(_504);
    int _508 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _506;
    uint _510 = spvSubgroupBallot(true).x;
    float _512 = spvSubgroupShuffle(as_type<float>(_490), 0u);
    bool _514 = as_type<int>(_512) == _490;
    float _516 = spvSubgroupShuffle(as_type<float>(_508), 0u);
    bool _518 = as_type<int>(_516) == _508;
    bool _520 = _514 && _518;
    int _522 = int(_520);
    float _524 = spvSubgroupShuffle(as_type<float>(_490), 1u);
    bool _526 = as_type<int>(_524) == _490;
    float _528 = spvSubgroupShuffle(as_type<float>(_508), 1u);
    bool _530 = as_type<int>(_528) == _508;
    bool _532 = _526 && _530;
    int _534 = _532 ? 2 : 0;
    int _536 = _522 | _534;
    float _538 = spvSubgroupShuffle(as_type<float>(_490), 2u);
    bool _540 = as_type<int>(_538) == _490;
    float _542 = spvSubgroupShuffle(as_type<float>(_508), 2u);
    bool _544 = as_type<int>(_542) == _508;
    bool _546 = _540 && _544;
    int _548 = _546 ? 4 : 0;
    int _550 = _536 | _548;
    float _552 = spvSubgroupShuffle(as_type<float>(_490), 3u);
    bool _554 = as_type<int>(_552) == _490;
    float _556 = spvSubgroupShuffle(as_type<float>(_508), 3u);
    bool _558 = as_type<int>(_556) == _508;
    bool _560 = _554 && _558;
    int _562 = _560 ? 8 : 0;
    int _564 = _550 | _562;
    float _566 = spvSubgroupShuffle(as_type<float>(_490), 4u);
    bool _568 = as_type<int>(_566) == _490;
    float _570 = spvSubgroupShuffle(as_type<float>(_508), 4u);
    bool _572 = as_type<int>(_570) == _508;
    bool _574 = _568 && _572;
    int _576 = _574 ? 16 : 0;
    int _578 = _564 | _576;
    float _580 = spvSubgroupShuffle(as_type<float>(_490), 5u);
    bool _582 = as_type<int>(_580) == _490;
    float _584 = spvSubgroupShuffle(as_type<float>(_508), 5u);
    bool _586 = as_type<int>(_584) == _508;
    bool _588 = _582 && _586;
    int _590 = _588 ? 32 : 0;
    int _592 = _578 | _590;
    float _594 = spvSubgroupShuffle(as_type<float>(_490), 6u);
    bool _596 = as_type<int>(_594) == _490;
    float _598 = spvSubgroupShuffle(as_type<float>(_508), 6u);
    bool _600 = as_type<int>(_598) == _508;
    bool _602 = _596 && _600;
    int _604 = _602 ? 64 : 0;
    int _606 = _592 | _604;
    float _608 = spvSubgroupShuffle(as_type<float>(_490), 7u);
    bool _610 = as_type<int>(_608) == _490;
    float _612 = spvSubgroupShuffle(as_type<float>(_508), 7u);
    bool _614 = as_type<int>(_612) == _508;
    bool _616 = _610 && _614;
    int _618 = _616 ? 128 : 0;
    int _620 = _606 | _618;
    float _622 = spvSubgroupShuffle(as_type<float>(_490), 8u);
    bool _624 = as_type<int>(_622) == _490;
    float _626 = spvSubgroupShuffle(as_type<float>(_508), 8u);
    bool _628 = as_type<int>(_626) == _508;
    bool _630 = _624 && _628;
    int _632 = _630 ? 256 : 0;
    int _634 = _620 | _632;
    float _636 = spvSubgroupShuffle(as_type<float>(_490), 9u);
    bool _638 = as_type<int>(_636) == _490;
    float _640 = spvSubgroupShuffle(as_type<float>(_508), 9u);
    bool _642 = as_type<int>(_640) == _508;
    bool _644 = _638 && _642;
    int _646 = _644 ? 512 : 0;
    int _648 = _634 | _646;
    float _650 = spvSubgroupShuffle(as_type<float>(_490), 10u);
    bool _652 = as_type<int>(_650) == _490;
    float _654 = spvSubgroupShuffle(as_type<float>(_508), 10u);
    bool _656 = as_type<int>(_654) == _508;
    bool _658 = _652 && _656;
    int _660 = _658 ? 1024 : 0;
    int _662 = _648 | _660;
    float _664 = spvSubgroupShuffle(as_type<float>(_490), 11u);
    bool _666 = as_type<int>(_664) == _490;
    float _668 = spvSubgroupShuffle(as_type<float>(_508), 11u);
    bool _670 = as_type<int>(_668) == _508;
    bool _672 = _666 && _670;
    int _674 = _672 ? 2048 : 0;
    int _676 = _662 | _674;
    float _678 = spvSubgroupShuffle(as_type<float>(_490), 12u);
    bool _680 = as_type<int>(_678) == _490;
    float _682 = spvSubgroupShuffle(as_type<float>(_508), 12u);
    bool _684 = as_type<int>(_682) == _508;
    bool _686 = _680 && _684;
    int _688 = _686 ? 4096 : 0;
    int _690 = _676 | _688;
    float _692 = spvSubgroupShuffle(as_type<float>(_490), 13u);
    bool _694 = as_type<int>(_692) == _490;
    float _696 = spvSubgroupShuffle(as_type<float>(_508), 13u);
    bool _698 = as_type<int>(_696) == _508;
    bool _700 = _694 && _698;
    int _702 = _700 ? 8192 : 0;
    int _704 = _690 | _702;
    float _706 = spvSubgroupShuffle(as_type<float>(_490), 14u);
    bool _708 = as_type<int>(_706) == _490;
    float _710 = spvSubgroupShuffle(as_type<float>(_508), 14u);
    bool _712 = as_type<int>(_710) == _508;
    bool _714 = _708 && _712;
    int _716 = _714 ? 16384 : 0;
    int _718 = _704 | _716;
    float _720 = spvSubgroupShuffle(as_type<float>(_490), 15u);
    bool _722 = as_type<int>(_720) == _490;
    float _724 = spvSubgroupShuffle(as_type<float>(_508), 15u);
    bool _726 = as_type<int>(_724) == _508;
    bool _728 = _722 && _726;
    int _730 = _728 ? 32768 : 0;
    int _732 = _718 | _730;
    float _734 = spvSubgroupShuffle(as_type<float>(_490), 16u);
    bool _736 = as_type<int>(_734) == _490;
    float _738 = spvSubgroupShuffle(as_type<float>(_508), 16u);
    bool _740 = as_type<int>(_738) == _508;
    bool _742 = _736 && _740;
    int _744 = _742 ? 65536 : 0;
    int _746 = _732 | _744;
    float _748 = spvSubgroupShuffle(as_type<float>(_490), 17u);
    bool _750 = as_type<int>(_748) == _490;
    float _752 = spvSubgroupShuffle(as_type<float>(_508), 17u);
    bool _754 = as_type<int>(_752) == _508;
    bool _756 = _750 && _754;
    int _758 = _756 ? 131072 : 0;
    int _760 = _746 | _758;
    float _762 = spvSubgroupShuffle(as_type<float>(_490), 18u);
    bool _764 = as_type<int>(_762) == _490;
    float _766 = spvSubgroupShuffle(as_type<float>(_508), 18u);
    bool _768 = as_type<int>(_766) == _508;
    bool _770 = _764 && _768;
    int _772 = _770 ? 262144 : 0;
    int _774 = _760 | _772;
    float _776 = spvSubgroupShuffle(as_type<float>(_490), 19u);
    bool _778 = as_type<int>(_776) == _490;
    float _780 = spvSubgroupShuffle(as_type<float>(_508), 19u);
    bool _782 = as_type<int>(_780) == _508;
    bool _784 = _778 && _782;
    int _786 = _784 ? 524288 : 0;
    int _788 = _774 | _786;
    float _790 = spvSubgroupShuffle(as_type<float>(_490), 20u);
    bool _792 = as_type<int>(_790) == _490;
    float _794 = spvSubgroupShuffle(as_type<float>(_508), 20u);
    bool _796 = as_type<int>(_794) == _508;
    bool _798 = _792 && _796;
    int _800 = _798 ? 1048576 : 0;
    int _802 = _788 | _800;
    float _804 = spvSubgroupShuffle(as_type<float>(_490), 21u);
    bool _806 = as_type<int>(_804) == _490;
    float _808 = spvSubgroupShuffle(as_type<float>(_508), 21u);
    bool _810 = as_type<int>(_808) == _508;
    bool _812 = _806 && _810;
    int _814 = _812 ? 2097152 : 0;
    int _816 = _802 | _814;
    float _818 = spvSubgroupShuffle(as_type<float>(_490), 22u);
    bool _820 = as_type<int>(_818) == _490;
    float _822 = spvSubgroupShuffle(as_type<float>(_508), 22u);
    bool _824 = as_type<int>(_822) == _508;
    bool _826 = _820 && _824;
    int _828 = _826 ? 4194304 : 0;
    int _830 = _816 | _828;
    float _832 = spvSubgroupShuffle(as_type<float>(_490), 23u);
    bool _834 = as_type<int>(_832) == _490;
    float _836 = spvSubgroupShuffle(as_type<float>(_508), 23u);
    bool _838 = as_type<int>(_836) == _508;
    bool _840 = _834 && _838;
    int _842 = _840 ? 8388608 : 0;
    int _844 = _830 | _842;
    float _846 = spvSubgroupShuffle(as_type<float>(_490), 24u);
    bool _848 = as_type<int>(_846) == _490;
    float _850 = spvSubgroupShuffle(as_type<float>(_508), 24u);
    bool _852 = as_type<int>(_850) == _508;
    bool _854 = _848 && _852;
    int _856 = _854 ? 16777216 : 0;
    int _858 = _844 | _856;
    float _860 = spvSubgroupShuffle(as_type<float>(_490), 25u);
    bool _862 = as_type<int>(_860) == _490;
    float _864 = spvSubgroupShuffle(as_type<float>(_508), 25u);
    bool _866 = as_type<int>(_864) == _508;
    bool _868 = _862 && _866;
    int _870 = _868 ? 33554432 : 0;
    int _872 = _858 | _870;
    float _874 = spvSubgroupShuffle(as_type<float>(_490), 26u);
    bool _876 = as_type<int>(_874) == _490;
    float _878 = spvSubgroupShuffle(as_type<float>(_508), 26u);
    bool _880 = as_type<int>(_878) == _508;
    bool _882 = _876 && _880;
    int _884 = _882 ? 67108864 : 0;
    int _886 = _872 | _884;
    float _888 = spvSubgroupShuffle(as_type<float>(_490), 27u);
    bool _890 = as_type<int>(_888) == _490;
    float _892 = spvSubgroupShuffle(as_type<float>(_508), 27u);
    bool _894 = as_type<int>(_892) == _508;
    bool _896 = _890 && _894;
    int _898 = _896 ? 134217728 : 0;
    int _900 = _886 | _898;
    float _902 = spvSubgroupShuffle(as_type<float>(_490), 28u);
    bool _904 = as_type<int>(_902) == _490;
    float _906 = spvSubgroupShuffle(as_type<float>(_508), 28u);
    bool _908 = as_type<int>(_906) == _508;
    bool _910 = _904 && _908;
    int _912 = _910 ? 268435456 : 0;
    int _914 = _900 | _912;
    float _916 = spvSubgroupShuffle(as_type<float>(_490), 29u);
    bool _918 = as_type<int>(_916) == _490;
    float _920 = spvSubgroupShuffle(as_type<float>(_508), 29u);
    bool _922 = as_type<int>(_920) == _508;
    bool _924 = _918 && _922;
    int _926 = _924 ? 536870912 : 0;
    int _928 = _914 | _926;
    float _930 = spvSubgroupShuffle(as_type<float>(_490), 30u);
    bool _932 = as_type<int>(_930) == _490;
    float _934 = spvSubgroupShuffle(as_type<float>(_508), 30u);
    bool _936 = as_type<int>(_934) == _508;
    bool _938 = _932 && _936;
    int _940 = _938 ? 1073741824 : 0;
    int _942 = _928 | _940;
    float _944 = spvSubgroupShuffle(as_type<float>(_490), 31u);
    bool _946 = as_type<int>(_944) == _490;
    float _948 = spvSubgroupShuffle(as_type<float>(_508), 31u);
    bool _950 = as_type<int>(_948) == _508;
    bool _952 = _946 && _950;
    int _954 = _952 ? int(0x80000000) : 0;
    int _956 = _942 | _954;
    int _958 = _956 & int(_510);
    bool _960 = _958 == int(_510);
    if (!_960)
    {
        uint _962 = uint(int(uint(_488) >> uint(2)));
        uint _2520 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_962)], 1u, memory_order_relaxed);
        uint _964 = _2520;
    }
    if (!_960)
    {
        return;
    }
    float _966 = as_type<float>(gl_SubgroupInvocationID);
    uint _968 = spvSubgroupBallot(true).x;
    int _970 = int(spvFindUMSB(_968));
    int _972 = popcount(int(_968));
    bool _974 = as_type<int>(_966) == _970;
    if (_974)
    {
        uint _976 = uint(int(uint(_488) >> uint(2)));
        uint _2550 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_976)], uint(_972), memory_order_relaxed);
        uint _978 = _2550;
    }
}

