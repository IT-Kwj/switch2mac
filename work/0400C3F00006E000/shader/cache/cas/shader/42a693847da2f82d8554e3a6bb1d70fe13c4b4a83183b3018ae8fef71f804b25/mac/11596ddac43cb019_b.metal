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
    int _286 = _67 + 80;
    uint _288 = uint(int(uint(_286) >> uint(2)));
    float _290 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_288)]);
    int _292 = _286 + 4;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    float _296 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_294)]);
    int _298 = _280 + 16;
    uint _300 = uint(int(uint(_298) >> uint(2)));
    float _302 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_300)]);
    float _304 = -_90;
    float _306 = _304 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _308 = -_84;
    float _310 = _308 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _312 = -_96;
    float _314 = _312 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _316 = _306 * _306;
    float _318 = fma(_310, _310, _316);
    float _320 = fma(_314, _314, _318);
    uint _322 = uint(int(uint(as_type<int>(_284)) >> uint(16)));
    int _324 = int(_322) << 4;
    float _326 = float2(as_type<half2>(as_type<uint>(_290))).x;
    float _328 = (-0.0) + _326;
    float _330 = float2(as_type<half2>(as_type<uint>(_290))).y;
    float _332 = (-0.0) + _330;
    uint _334 = uint(int(uint(_324) >> uint(2)));
    uint _336 = uint(int(uint(int(_334)) >> uint(2)));
    int _338 = int(_334) & 3;
    float _340 = (*spvDescriptorSet0.cp_c4)._m0[int(_336)][_338];
    float _342 = float2(as_type<half2>(as_type<uint>(_296))).x;
    float _344 = (-0.0) + _342;
    float _346 = float2(as_type<half2>(as_type<uint>(_296))).y;
    float _348 = (-0.0) + _346;
    int _350 = as_type<int>(_302) + (-1);
    float _352 = _340 * _340;
    float _354 = _328 * _352;
    float _356 = _332 * _352;
    float _358 = _344 * _352;
    float _360 = _348 * _352;
    float _362 = _354 * _354;
    float _364 = _356 * _356;
    float _366 = _358 * _358;
    bool _368 = _320 >= _362;
    bool _370 = isnan(_320);
    bool _372 = _368 || _370;
    bool _374 = isnan(_362);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = _360 * _360;
    bool _382 = _320 >= _364;
    bool _384 = isnan(_320);
    bool _386 = _382 || _384;
    bool _388 = isnan(_364);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    bool _394 = _320 >= _366;
    bool _396 = isnan(_320);
    bool _398 = _394 || _396;
    bool _400 = isnan(_366);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    bool _406 = _320 >= _380;
    bool _408 = isnan(_320);
    bool _410 = _406 || _408;
    bool _412 = isnan(_380);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    float _418 = _378 + _392;
    float _420 = _404 + _418;
    float _422 = _416 + _420;
    float _424 = trunc(_422);
    float _426 = precise::max(_424, 0.0);
    uint _428 = uint(_426);
    int _430 = int(_428) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _432 = min(uint(_350), uint(_430));
    int _434 = as_type<int>(_76) << 2;
    int _436 = _434 + int(_432);
    int _438 = _436 << 3;
    int _440 = _438 + 4;
    int _442 = _440 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _444 = uint(_442) < uint(_440);
    int _446 = int(_444);
    bool _448 = uint(_442) < uint(_442);
    int _450 = int(_448);
    int _452 = _446 + _450;
    int _454 = _452 & 1;
    bool _456 = _454 != 0;
    int _458 = int(_456);
    int _460 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _458;
    uint _462 = spvSubgroupBallot(true).x;
    float _464 = spvSubgroupShuffle(as_type<float>(_442), 0u);
    bool _466 = as_type<int>(_464) == _442;
    float _468 = spvSubgroupShuffle(as_type<float>(_460), 0u);
    bool _470 = as_type<int>(_468) == _460;
    bool _472 = _466 && _470;
    int _474 = int(_472);
    float _476 = spvSubgroupShuffle(as_type<float>(_442), 1u);
    bool _478 = as_type<int>(_476) == _442;
    float _480 = spvSubgroupShuffle(as_type<float>(_460), 1u);
    bool _482 = as_type<int>(_480) == _460;
    bool _484 = _478 && _482;
    int _486 = _484 ? 2 : 0;
    int _488 = _474 | _486;
    float _490 = spvSubgroupShuffle(as_type<float>(_442), 2u);
    bool _492 = as_type<int>(_490) == _442;
    float _494 = spvSubgroupShuffle(as_type<float>(_460), 2u);
    bool _496 = as_type<int>(_494) == _460;
    bool _498 = _492 && _496;
    int _500 = _498 ? 4 : 0;
    int _502 = _488 | _500;
    float _504 = spvSubgroupShuffle(as_type<float>(_442), 3u);
    bool _506 = as_type<int>(_504) == _442;
    float _508 = spvSubgroupShuffle(as_type<float>(_460), 3u);
    bool _510 = as_type<int>(_508) == _460;
    bool _512 = _506 && _510;
    int _514 = _512 ? 8 : 0;
    int _516 = _502 | _514;
    float _518 = spvSubgroupShuffle(as_type<float>(_442), 4u);
    bool _520 = as_type<int>(_518) == _442;
    float _522 = spvSubgroupShuffle(as_type<float>(_460), 4u);
    bool _524 = as_type<int>(_522) == _460;
    bool _526 = _520 && _524;
    int _528 = _526 ? 16 : 0;
    int _530 = _516 | _528;
    float _532 = spvSubgroupShuffle(as_type<float>(_442), 5u);
    bool _534 = as_type<int>(_532) == _442;
    float _536 = spvSubgroupShuffle(as_type<float>(_460), 5u);
    bool _538 = as_type<int>(_536) == _460;
    bool _540 = _534 && _538;
    int _542 = _540 ? 32 : 0;
    int _544 = _530 | _542;
    float _546 = spvSubgroupShuffle(as_type<float>(_442), 6u);
    bool _548 = as_type<int>(_546) == _442;
    float _550 = spvSubgroupShuffle(as_type<float>(_460), 6u);
    bool _552 = as_type<int>(_550) == _460;
    bool _554 = _548 && _552;
    int _556 = _554 ? 64 : 0;
    int _558 = _544 | _556;
    float _560 = spvSubgroupShuffle(as_type<float>(_442), 7u);
    bool _562 = as_type<int>(_560) == _442;
    float _564 = spvSubgroupShuffle(as_type<float>(_460), 7u);
    bool _566 = as_type<int>(_564) == _460;
    bool _568 = _562 && _566;
    int _570 = _568 ? 128 : 0;
    int _572 = _558 | _570;
    float _574 = spvSubgroupShuffle(as_type<float>(_442), 8u);
    bool _576 = as_type<int>(_574) == _442;
    float _578 = spvSubgroupShuffle(as_type<float>(_460), 8u);
    bool _580 = as_type<int>(_578) == _460;
    bool _582 = _576 && _580;
    int _584 = _582 ? 256 : 0;
    int _586 = _572 | _584;
    float _588 = spvSubgroupShuffle(as_type<float>(_442), 9u);
    bool _590 = as_type<int>(_588) == _442;
    float _592 = spvSubgroupShuffle(as_type<float>(_460), 9u);
    bool _594 = as_type<int>(_592) == _460;
    bool _596 = _590 && _594;
    int _598 = _596 ? 512 : 0;
    int _600 = _586 | _598;
    float _602 = spvSubgroupShuffle(as_type<float>(_442), 10u);
    bool _604 = as_type<int>(_602) == _442;
    float _606 = spvSubgroupShuffle(as_type<float>(_460), 10u);
    bool _608 = as_type<int>(_606) == _460;
    bool _610 = _604 && _608;
    int _612 = _610 ? 1024 : 0;
    int _614 = _600 | _612;
    float _616 = spvSubgroupShuffle(as_type<float>(_442), 11u);
    bool _618 = as_type<int>(_616) == _442;
    float _620 = spvSubgroupShuffle(as_type<float>(_460), 11u);
    bool _622 = as_type<int>(_620) == _460;
    bool _624 = _618 && _622;
    int _626 = _624 ? 2048 : 0;
    int _628 = _614 | _626;
    float _630 = spvSubgroupShuffle(as_type<float>(_442), 12u);
    bool _632 = as_type<int>(_630) == _442;
    float _634 = spvSubgroupShuffle(as_type<float>(_460), 12u);
    bool _636 = as_type<int>(_634) == _460;
    bool _638 = _632 && _636;
    int _640 = _638 ? 4096 : 0;
    int _642 = _628 | _640;
    float _644 = spvSubgroupShuffle(as_type<float>(_442), 13u);
    bool _646 = as_type<int>(_644) == _442;
    float _648 = spvSubgroupShuffle(as_type<float>(_460), 13u);
    bool _650 = as_type<int>(_648) == _460;
    bool _652 = _646 && _650;
    int _654 = _652 ? 8192 : 0;
    int _656 = _642 | _654;
    float _658 = spvSubgroupShuffle(as_type<float>(_442), 14u);
    bool _660 = as_type<int>(_658) == _442;
    float _662 = spvSubgroupShuffle(as_type<float>(_460), 14u);
    bool _664 = as_type<int>(_662) == _460;
    bool _666 = _660 && _664;
    int _668 = _666 ? 16384 : 0;
    int _670 = _656 | _668;
    float _672 = spvSubgroupShuffle(as_type<float>(_442), 15u);
    bool _674 = as_type<int>(_672) == _442;
    float _676 = spvSubgroupShuffle(as_type<float>(_460), 15u);
    bool _678 = as_type<int>(_676) == _460;
    bool _680 = _674 && _678;
    int _682 = _680 ? 32768 : 0;
    int _684 = _670 | _682;
    float _686 = spvSubgroupShuffle(as_type<float>(_442), 16u);
    bool _688 = as_type<int>(_686) == _442;
    float _690 = spvSubgroupShuffle(as_type<float>(_460), 16u);
    bool _692 = as_type<int>(_690) == _460;
    bool _694 = _688 && _692;
    int _696 = _694 ? 65536 : 0;
    int _698 = _684 | _696;
    float _700 = spvSubgroupShuffle(as_type<float>(_442), 17u);
    bool _702 = as_type<int>(_700) == _442;
    float _704 = spvSubgroupShuffle(as_type<float>(_460), 17u);
    bool _706 = as_type<int>(_704) == _460;
    bool _708 = _702 && _706;
    int _710 = _708 ? 131072 : 0;
    int _712 = _698 | _710;
    float _714 = spvSubgroupShuffle(as_type<float>(_442), 18u);
    bool _716 = as_type<int>(_714) == _442;
    float _718 = spvSubgroupShuffle(as_type<float>(_460), 18u);
    bool _720 = as_type<int>(_718) == _460;
    bool _722 = _716 && _720;
    int _724 = _722 ? 262144 : 0;
    int _726 = _712 | _724;
    float _728 = spvSubgroupShuffle(as_type<float>(_442), 19u);
    bool _730 = as_type<int>(_728) == _442;
    float _732 = spvSubgroupShuffle(as_type<float>(_460), 19u);
    bool _734 = as_type<int>(_732) == _460;
    bool _736 = _730 && _734;
    int _738 = _736 ? 524288 : 0;
    int _740 = _726 | _738;
    float _742 = spvSubgroupShuffle(as_type<float>(_442), 20u);
    bool _744 = as_type<int>(_742) == _442;
    float _746 = spvSubgroupShuffle(as_type<float>(_460), 20u);
    bool _748 = as_type<int>(_746) == _460;
    bool _750 = _744 && _748;
    int _752 = _750 ? 1048576 : 0;
    int _754 = _740 | _752;
    float _756 = spvSubgroupShuffle(as_type<float>(_442), 21u);
    bool _758 = as_type<int>(_756) == _442;
    float _760 = spvSubgroupShuffle(as_type<float>(_460), 21u);
    bool _762 = as_type<int>(_760) == _460;
    bool _764 = _758 && _762;
    int _766 = _764 ? 2097152 : 0;
    int _768 = _754 | _766;
    float _770 = spvSubgroupShuffle(as_type<float>(_442), 22u);
    bool _772 = as_type<int>(_770) == _442;
    float _774 = spvSubgroupShuffle(as_type<float>(_460), 22u);
    bool _776 = as_type<int>(_774) == _460;
    bool _778 = _772 && _776;
    int _780 = _778 ? 4194304 : 0;
    int _782 = _768 | _780;
    float _784 = spvSubgroupShuffle(as_type<float>(_442), 23u);
    bool _786 = as_type<int>(_784) == _442;
    float _788 = spvSubgroupShuffle(as_type<float>(_460), 23u);
    bool _790 = as_type<int>(_788) == _460;
    bool _792 = _786 && _790;
    int _794 = _792 ? 8388608 : 0;
    int _796 = _782 | _794;
    float _798 = spvSubgroupShuffle(as_type<float>(_442), 24u);
    bool _800 = as_type<int>(_798) == _442;
    float _802 = spvSubgroupShuffle(as_type<float>(_460), 24u);
    bool _804 = as_type<int>(_802) == _460;
    bool _806 = _800 && _804;
    int _808 = _806 ? 16777216 : 0;
    int _810 = _796 | _808;
    float _812 = spvSubgroupShuffle(as_type<float>(_442), 25u);
    bool _814 = as_type<int>(_812) == _442;
    float _816 = spvSubgroupShuffle(as_type<float>(_460), 25u);
    bool _818 = as_type<int>(_816) == _460;
    bool _820 = _814 && _818;
    int _822 = _820 ? 33554432 : 0;
    int _824 = _810 | _822;
    float _826 = spvSubgroupShuffle(as_type<float>(_442), 26u);
    bool _828 = as_type<int>(_826) == _442;
    float _830 = spvSubgroupShuffle(as_type<float>(_460), 26u);
    bool _832 = as_type<int>(_830) == _460;
    bool _834 = _828 && _832;
    int _836 = _834 ? 67108864 : 0;
    int _838 = _824 | _836;
    float _840 = spvSubgroupShuffle(as_type<float>(_442), 27u);
    bool _842 = as_type<int>(_840) == _442;
    float _844 = spvSubgroupShuffle(as_type<float>(_460), 27u);
    bool _846 = as_type<int>(_844) == _460;
    bool _848 = _842 && _846;
    int _850 = _848 ? 134217728 : 0;
    int _852 = _838 | _850;
    float _854 = spvSubgroupShuffle(as_type<float>(_442), 28u);
    bool _856 = as_type<int>(_854) == _442;
    float _858 = spvSubgroupShuffle(as_type<float>(_460), 28u);
    bool _860 = as_type<int>(_858) == _460;
    bool _862 = _856 && _860;
    int _864 = _862 ? 268435456 : 0;
    int _866 = _852 | _864;
    float _868 = spvSubgroupShuffle(as_type<float>(_442), 29u);
    bool _870 = as_type<int>(_868) == _442;
    float _872 = spvSubgroupShuffle(as_type<float>(_460), 29u);
    bool _874 = as_type<int>(_872) == _460;
    bool _876 = _870 && _874;
    int _878 = _876 ? 536870912 : 0;
    int _880 = _866 | _878;
    float _882 = spvSubgroupShuffle(as_type<float>(_442), 30u);
    bool _884 = as_type<int>(_882) == _442;
    float _886 = spvSubgroupShuffle(as_type<float>(_460), 30u);
    bool _888 = as_type<int>(_886) == _460;
    bool _890 = _884 && _888;
    int _892 = _890 ? 1073741824 : 0;
    int _894 = _880 | _892;
    float _896 = spvSubgroupShuffle(as_type<float>(_442), 31u);
    bool _898 = as_type<int>(_896) == _442;
    float _900 = spvSubgroupShuffle(as_type<float>(_460), 31u);
    bool _902 = as_type<int>(_900) == _460;
    bool _904 = _898 && _902;
    int _906 = _904 ? int(0x80000000) : 0;
    int _908 = _894 | _906;
    int _910 = _908 & int(_462);
    bool _912 = _910 == int(_462);
    if (!_912)
    {
        uint _914 = uint(int(uint(_440) >> uint(2)));
        uint _2391 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_914)], 1u, memory_order_relaxed);
        uint _916 = _2391;
    }
    if (!_912)
    {
        return;
    }
    float _918 = as_type<float>(gl_SubgroupInvocationID);
    uint _920 = spvSubgroupBallot(true).x;
    int _922 = int(spvFindUMSB(_920));
    int _924 = popcount(int(_920));
    bool _926 = as_type<int>(_918) == _922;
    if (_926)
    {
        uint _928 = uint(int(uint(_440) >> uint(2)));
        uint _2421 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_928)], uint(_924), memory_order_relaxed);
        uint _930 = _2421;
    }
}

