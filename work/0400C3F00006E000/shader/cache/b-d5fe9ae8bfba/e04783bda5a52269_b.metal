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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c3 [[id(2)]];
    device _25* cp_s0 [[id(3)]];
    device _25* cp_s1 [[id(4)]];
    device _25* cp_s2 [[id(5)]];
    device _25* cp_s3 [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _50 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _52 = as_type<float>(gl_WorkGroupID.x);
    float _54 = as_type<float>(gl_LocalInvocationID.x);
    int _57 = as_type<int>(_52) << 6;
    int _59 = _57 + as_type<int>(_54);
    bool _63 = uint(_59) >= as_type<uint>(_50);
    if (_63)
    {
        return;
    }
    int _65 = _59 * 96;
    int _67 = _65 + 48;
    uint _70 = uint(int(uint(_67) >> uint(2)));
    float _72 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_70)]);
    int _74 = _67 + 4;
    uint _76 = uint(int(uint(_74) >> uint(2)));
    float _78 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_76)]);
    int _80 = _67 + 8;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_82)]);
    int _86 = _67 + 12;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_88)]);
    float _92 = _78 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _94 = _78 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _96 = _78 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _98 = _78 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _100 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[1].x, _92);
    float _102 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[0].x, _94);
    float _104 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[2].x, _96);
    float _106 = fma(_72, (*spvDescriptorSet0.cp_c3)._m0[3].x, _98);
    float _108 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[1].z, _100);
    float _110 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[0].z, _102);
    float _112 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[2].z, _104);
    float _114 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[3].z, _106);
    float _116 = _108 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _118 = _110 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _120 = _116 >= _90;
    bool _122 = isnan(_116);
    bool _124 = _120 || _122;
    bool _126 = isnan(_90);
    bool _128 = _124 || _126;
    float _130 = _112 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _132 = _118 < _90;
    bool _134 = !_128;
    bool _136 = _132 && _134;
    float _138 = _114 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _140 = _130 < _90;
    bool _142 = _140 && _136;
    bool _144 = _138 < _90;
    bool _146 = _144 && _142;
    int _148 = _65 + 64;
    if (!_146)
    {
        return;
    }
    int _150 = _148 + 8;
    uint _152 = uint(int(uint(_150) >> uint(2)));
    float _154 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_152)]);
    int _156 = _65 + 92;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_158)]);
    int _162 = as_type<int>(_154) * 20;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_164)]);
    float _168 = -_78;
    float _170 = _168 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _172 = -_72;
    float _174 = _172 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _176 = _170 * _170;
    float _178 = -_84;
    float _180 = _178 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _182 = fma(_174, _174, _176);
    float _184 = fma(_180, _180, _182);
    int _186 = _65 + 80;
    uint _188 = uint(int(uint(as_type<int>(_166)) >> uint(16)));
    int _190 = int(_188) << 4;
    int _192 = _190 + 4;
    uint _194 = uint(int(uint(_192) >> uint(2)));
    uint _196 = uint(int(uint(int(_194)) >> uint(2)));
    int _198 = int(_194) & 3;
    float _200 = (*spvDescriptorSet0.cp_c4)._m0[int(_196)][_198];
    float _202 = _160 * _200;
    float _204 = _202 * _202;
    bool _206 = _184 > _204;
    if (_206)
    {
        return;
    }
    uint _208 = uint(int(uint(_186) >> uint(2)));
    float _210 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_208)]);
    int _212 = _186 + 4;
    uint _214 = uint(int(uint(_212) >> uint(2)));
    float _216 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_214)]);
    int _218 = _162 + 16;
    uint _220 = uint(int(uint(_218) >> uint(2)));
    float _222 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_220)]);
    uint _224 = uint(int(uint(_190) >> uint(2)));
    uint _226 = uint(int(uint(int(_224)) >> uint(2)));
    int _228 = int(_224) & 3;
    float _230 = (*spvDescriptorSet0.cp_c4)._m0[int(_226)][_228];
    float _232 = _230 * _230;
    float _234 = float2(as_type<half2>(as_type<uint>(_210))).x;
    float _236 = (-0.0) + _234;
    float _238 = float2(as_type<half2>(as_type<uint>(_210))).y;
    float _240 = (-0.0) + _238;
    float _242 = float2(as_type<half2>(as_type<uint>(_216))).x;
    float _244 = (-0.0) + _242;
    float _246 = _236 * _232;
    float _248 = float2(as_type<half2>(as_type<uint>(_216))).y;
    float _250 = (-0.0) + _248;
    float _252 = _240 * _232;
    int _254 = as_type<int>(_222) + (-1);
    float _256 = _244 * _232;
    float _258 = _246 * _246;
    float _260 = _252 * _252;
    float _262 = _250 * _232;
    float _264 = _256 * _256;
    bool _266 = _184 >= _258;
    bool _268 = isnan(_184);
    bool _270 = _266 || _268;
    bool _272 = isnan(_258);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = _262 * _262;
    bool _280 = _184 >= _260;
    bool _282 = isnan(_184);
    bool _284 = _280 || _282;
    bool _286 = isnan(_260);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    bool _292 = _184 >= _264;
    bool _294 = isnan(_184);
    bool _296 = _292 || _294;
    bool _298 = isnan(_264);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _184 >= _278;
    bool _306 = isnan(_184);
    bool _308 = _304 || _306;
    bool _310 = isnan(_278);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = _276 + _290;
    float _318 = _302 + _316;
    float _320 = _314 + _318;
    float _322 = trunc(_320);
    float _324 = precise::max(_322, 0.0);
    uint _326 = uint(_324);
    int _328 = int(_326) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _330 = min(uint(_254), uint(_328));
    int _332 = as_type<int>(_154) << 2;
    int _334 = _332 + int(_330);
    int _336 = _334 << 3;
    int _338 = _336 + 4;
    int _340 = _338 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _342 = uint(_340) < uint(_338);
    int _344 = int(_342);
    bool _346 = uint(_340) < uint(_340);
    int _348 = int(_346);
    int _350 = _344 + _348;
    int _352 = _350 & 1;
    bool _354 = _352 != 0;
    int _356 = int(_354);
    int _358 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _356;
    uint _360 = spvSubgroupBallot(true).x;
    float _362 = spvSubgroupShuffle(as_type<float>(_340), 0u);
    bool _364 = as_type<int>(_362) == _340;
    float _366 = spvSubgroupShuffle(as_type<float>(_358), 0u);
    bool _368 = as_type<int>(_366) == _358;
    bool _370 = _364 && _368;
    int _372 = int(_370);
    float _374 = spvSubgroupShuffle(as_type<float>(_340), 1u);
    bool _376 = as_type<int>(_374) == _340;
    float _378 = spvSubgroupShuffle(as_type<float>(_358), 1u);
    bool _380 = as_type<int>(_378) == _358;
    bool _382 = _376 && _380;
    int _384 = _382 ? 2 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_340), 2u);
    bool _390 = as_type<int>(_388) == _340;
    float _392 = spvSubgroupShuffle(as_type<float>(_358), 2u);
    bool _394 = as_type<int>(_392) == _358;
    bool _396 = _390 && _394;
    int _398 = _396 ? 4 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_340), 3u);
    bool _404 = as_type<int>(_402) == _340;
    float _406 = spvSubgroupShuffle(as_type<float>(_358), 3u);
    bool _408 = as_type<int>(_406) == _358;
    bool _410 = _404 && _408;
    int _412 = _410 ? 8 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_340), 4u);
    bool _418 = as_type<int>(_416) == _340;
    float _420 = spvSubgroupShuffle(as_type<float>(_358), 4u);
    bool _422 = as_type<int>(_420) == _358;
    bool _424 = _418 && _422;
    int _426 = _424 ? 16 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_340), 5u);
    bool _432 = as_type<int>(_430) == _340;
    float _434 = spvSubgroupShuffle(as_type<float>(_358), 5u);
    bool _436 = as_type<int>(_434) == _358;
    bool _438 = _432 && _436;
    int _440 = _438 ? 32 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_340), 6u);
    bool _446 = as_type<int>(_444) == _340;
    float _448 = spvSubgroupShuffle(as_type<float>(_358), 6u);
    bool _450 = as_type<int>(_448) == _358;
    bool _452 = _446 && _450;
    int _454 = _452 ? 64 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_340), 7u);
    bool _460 = as_type<int>(_458) == _340;
    float _462 = spvSubgroupShuffle(as_type<float>(_358), 7u);
    bool _464 = as_type<int>(_462) == _358;
    bool _466 = _460 && _464;
    int _468 = _466 ? 128 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_340), 8u);
    bool _474 = as_type<int>(_472) == _340;
    float _476 = spvSubgroupShuffle(as_type<float>(_358), 8u);
    bool _478 = as_type<int>(_476) == _358;
    bool _480 = _474 && _478;
    int _482 = _480 ? 256 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_340), 9u);
    bool _488 = as_type<int>(_486) == _340;
    float _490 = spvSubgroupShuffle(as_type<float>(_358), 9u);
    bool _492 = as_type<int>(_490) == _358;
    bool _494 = _488 && _492;
    int _496 = _494 ? 512 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_340), 10u);
    bool _502 = as_type<int>(_500) == _340;
    float _504 = spvSubgroupShuffle(as_type<float>(_358), 10u);
    bool _506 = as_type<int>(_504) == _358;
    bool _508 = _502 && _506;
    int _510 = _508 ? 1024 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_340), 11u);
    bool _516 = as_type<int>(_514) == _340;
    float _518 = spvSubgroupShuffle(as_type<float>(_358), 11u);
    bool _520 = as_type<int>(_518) == _358;
    bool _522 = _516 && _520;
    int _524 = _522 ? 2048 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_340), 12u);
    bool _530 = as_type<int>(_528) == _340;
    float _532 = spvSubgroupShuffle(as_type<float>(_358), 12u);
    bool _534 = as_type<int>(_532) == _358;
    bool _536 = _530 && _534;
    int _538 = _536 ? 4096 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_340), 13u);
    bool _544 = as_type<int>(_542) == _340;
    float _546 = spvSubgroupShuffle(as_type<float>(_358), 13u);
    bool _548 = as_type<int>(_546) == _358;
    bool _550 = _544 && _548;
    int _552 = _550 ? 8192 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_340), 14u);
    bool _558 = as_type<int>(_556) == _340;
    float _560 = spvSubgroupShuffle(as_type<float>(_358), 14u);
    bool _562 = as_type<int>(_560) == _358;
    bool _564 = _558 && _562;
    int _566 = _564 ? 16384 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_340), 15u);
    bool _572 = as_type<int>(_570) == _340;
    float _574 = spvSubgroupShuffle(as_type<float>(_358), 15u);
    bool _576 = as_type<int>(_574) == _358;
    bool _578 = _572 && _576;
    int _580 = _578 ? 32768 : 0;
    int _582 = _568 | _580;
    float _584 = spvSubgroupShuffle(as_type<float>(_340), 16u);
    bool _586 = as_type<int>(_584) == _340;
    float _588 = spvSubgroupShuffle(as_type<float>(_358), 16u);
    bool _590 = as_type<int>(_588) == _358;
    bool _592 = _586 && _590;
    int _594 = _592 ? 65536 : 0;
    int _596 = _582 | _594;
    float _598 = spvSubgroupShuffle(as_type<float>(_340), 17u);
    bool _600 = as_type<int>(_598) == _340;
    float _602 = spvSubgroupShuffle(as_type<float>(_358), 17u);
    bool _604 = as_type<int>(_602) == _358;
    bool _606 = _600 && _604;
    int _608 = _606 ? 131072 : 0;
    int _610 = _596 | _608;
    float _612 = spvSubgroupShuffle(as_type<float>(_340), 18u);
    bool _614 = as_type<int>(_612) == _340;
    float _616 = spvSubgroupShuffle(as_type<float>(_358), 18u);
    bool _618 = as_type<int>(_616) == _358;
    bool _620 = _614 && _618;
    int _622 = _620 ? 262144 : 0;
    int _624 = _610 | _622;
    float _626 = spvSubgroupShuffle(as_type<float>(_340), 19u);
    bool _628 = as_type<int>(_626) == _340;
    float _630 = spvSubgroupShuffle(as_type<float>(_358), 19u);
    bool _632 = as_type<int>(_630) == _358;
    bool _634 = _628 && _632;
    int _636 = _634 ? 524288 : 0;
    int _638 = _624 | _636;
    float _640 = spvSubgroupShuffle(as_type<float>(_340), 20u);
    bool _642 = as_type<int>(_640) == _340;
    float _644 = spvSubgroupShuffle(as_type<float>(_358), 20u);
    bool _646 = as_type<int>(_644) == _358;
    bool _648 = _642 && _646;
    int _650 = _648 ? 1048576 : 0;
    int _652 = _638 | _650;
    float _654 = spvSubgroupShuffle(as_type<float>(_340), 21u);
    bool _656 = as_type<int>(_654) == _340;
    float _658 = spvSubgroupShuffle(as_type<float>(_358), 21u);
    bool _660 = as_type<int>(_658) == _358;
    bool _662 = _656 && _660;
    int _664 = _662 ? 2097152 : 0;
    int _666 = _652 | _664;
    float _668 = spvSubgroupShuffle(as_type<float>(_340), 22u);
    bool _670 = as_type<int>(_668) == _340;
    float _672 = spvSubgroupShuffle(as_type<float>(_358), 22u);
    bool _674 = as_type<int>(_672) == _358;
    bool _676 = _670 && _674;
    int _678 = _676 ? 4194304 : 0;
    int _680 = _666 | _678;
    float _682 = spvSubgroupShuffle(as_type<float>(_340), 23u);
    bool _684 = as_type<int>(_682) == _340;
    float _686 = spvSubgroupShuffle(as_type<float>(_358), 23u);
    bool _688 = as_type<int>(_686) == _358;
    bool _690 = _684 && _688;
    int _692 = _690 ? 8388608 : 0;
    int _694 = _680 | _692;
    float _696 = spvSubgroupShuffle(as_type<float>(_340), 24u);
    bool _698 = as_type<int>(_696) == _340;
    float _700 = spvSubgroupShuffle(as_type<float>(_358), 24u);
    bool _702 = as_type<int>(_700) == _358;
    bool _704 = _698 && _702;
    int _706 = _704 ? 16777216 : 0;
    int _708 = _694 | _706;
    float _710 = spvSubgroupShuffle(as_type<float>(_340), 25u);
    bool _712 = as_type<int>(_710) == _340;
    float _714 = spvSubgroupShuffle(as_type<float>(_358), 25u);
    bool _716 = as_type<int>(_714) == _358;
    bool _718 = _712 && _716;
    int _720 = _718 ? 33554432 : 0;
    int _722 = _708 | _720;
    float _724 = spvSubgroupShuffle(as_type<float>(_340), 26u);
    bool _726 = as_type<int>(_724) == _340;
    float _728 = spvSubgroupShuffle(as_type<float>(_358), 26u);
    bool _730 = as_type<int>(_728) == _358;
    bool _732 = _726 && _730;
    int _734 = _732 ? 67108864 : 0;
    int _736 = _722 | _734;
    float _738 = spvSubgroupShuffle(as_type<float>(_340), 27u);
    bool _740 = as_type<int>(_738) == _340;
    float _742 = spvSubgroupShuffle(as_type<float>(_358), 27u);
    bool _744 = as_type<int>(_742) == _358;
    bool _746 = _740 && _744;
    int _748 = _746 ? 134217728 : 0;
    int _750 = _736 | _748;
    float _752 = spvSubgroupShuffle(as_type<float>(_340), 28u);
    bool _754 = as_type<int>(_752) == _340;
    float _756 = spvSubgroupShuffle(as_type<float>(_358), 28u);
    bool _758 = as_type<int>(_756) == _358;
    bool _760 = _754 && _758;
    int _762 = _760 ? 268435456 : 0;
    int _764 = _750 | _762;
    float _766 = spvSubgroupShuffle(as_type<float>(_340), 29u);
    bool _768 = as_type<int>(_766) == _340;
    float _770 = spvSubgroupShuffle(as_type<float>(_358), 29u);
    bool _772 = as_type<int>(_770) == _358;
    bool _774 = _768 && _772;
    int _776 = _774 ? 536870912 : 0;
    int _778 = _764 | _776;
    float _780 = spvSubgroupShuffle(as_type<float>(_340), 30u);
    bool _782 = as_type<int>(_780) == _340;
    float _784 = spvSubgroupShuffle(as_type<float>(_358), 30u);
    bool _786 = as_type<int>(_784) == _358;
    bool _788 = _782 && _786;
    int _790 = _788 ? 1073741824 : 0;
    int _792 = _778 | _790;
    float _794 = spvSubgroupShuffle(as_type<float>(_340), 31u);
    bool _796 = as_type<int>(_794) == _340;
    float _798 = spvSubgroupShuffle(as_type<float>(_358), 31u);
    bool _800 = as_type<int>(_798) == _358;
    bool _802 = _796 && _800;
    int _804 = _802 ? int(0x80000000) : 0;
    int _806 = _792 | _804;
    int _808 = _806 & int(_360);
    bool _810 = _808 == int(_360);
    if (!_810)
    {
        uint _812 = uint(int(uint(_338) >> uint(2)));
        uint _2139 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_812)], 1u, memory_order_relaxed);
        uint _814 = _2139;
    }
    if (!_810)
    {
        return;
    }
    float _816 = as_type<float>(gl_SubgroupInvocationID);
    uint _818 = spvSubgroupBallot(true).x;
    int _820 = int(spvFindUMSB(_818));
    int _822 = popcount(int(_818));
    bool _824 = as_type<int>(_816) == _820;
    if (_824)
    {
        uint _826 = uint(int(uint(_338) >> uint(2)));
        uint _2169 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_826)], uint(_822), memory_order_relaxed);
        uint _828 = _2169;
    }
}

