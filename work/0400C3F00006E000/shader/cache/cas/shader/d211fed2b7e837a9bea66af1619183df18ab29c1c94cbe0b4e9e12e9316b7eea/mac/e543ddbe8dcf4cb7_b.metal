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
int _57(thread const int& _3295, thread const int& _3296, thread const int& _3297, thread int& _3298, thread uint& gl_SubgroupInvocationID)
{
    int _3301 = _3297 & 31;
    uint _3303 = uint(int(uint(_3297) >> uint(8)));
    int _3305 = int(_3303) & 31;
    float _3307 = as_type<float>(gl_SubgroupInvocationID);
    int _3309 = as_type<int>(_3307) & _3305;
    int _3311 = ~_3305;
    int _3313 = _3301 & _3311;
    int _3315 = _3313 | _3309;
    int _3317 = ~_3305;
    int _3319 = _3296 & _3317;
    int _3321 = _3319 | _3309;
    bool _3323 = uint(_3321) <= uint(_3315);
    _3298 = _3323 ? (-1) : 0;
    float _3325 = spvSubgroupShuffle(as_type<float>(_3295), uint(_3321));
    uint _3327 = uint(_3323 ? as_type<int>(_3325) : _3295);
    return int(_3327);
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
    bool _280 = _272 >= _126;
    bool _282 = isnan(_272);
    bool _284 = _280 || _282;
    bool _286 = isnan(_126);
    bool _288 = _284 || _286;
    bool _290 = _276 < _126;
    bool _292 = !_288;
    bool _294 = _290 && _292;
    bool _296 = _274 < _126;
    bool _298 = _296 && _294;
    bool _300 = _278 < _126;
    bool _302 = _300 && _298;
    int _304 = as_type<int>(_94) * 20;
    if (!_302)
    {
        return;
    }
    uint _306 = uint(int(uint(_304) >> uint(2)));
    float _308 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_306)]);
    int _310 = _75 + 92;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    float _314 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_312)]);
    float _316 = -_114;
    float _318 = _316 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _320 = -_108;
    float _322 = _320 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _324 = -_120;
    float _326 = _324 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _328 = _318 * _318;
    float _330 = fma(_322, _322, _328);
    float _332 = fma(_326, _326, _330);
    float _334 = sqrt(_332);
    uint _336 = uint(int(uint(as_type<int>(_308)) >> uint(16)));
    int _338 = int(_336) << 4;
    int _340 = _338 + 4;
    uint _342 = uint(int(uint(_340) >> uint(2)));
    uint _344 = uint(int(uint(int(_342)) >> uint(2)));
    int _346 = int(_342) & 3;
    float _348 = (*spvDescriptorSet0.cp_c4)._m0[int(_344)][_346];
    float _350 = _314 * _348;
    float _352 = precise::max(_350, 2500.0);
    bool _354 = _352 >= _334;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan(_334);
    bool _362 = _358 || _360;
    if (!_362)
    {
        return;
    }
    float _364 = _126 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
    float _366 = _334 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _368 = _366 * 8.0;
    bool _370 = _364 >= _368;
    bool _372 = isnan(_364);
    bool _374 = _370 || _372;
    bool _376 = isnan(_368);
    bool _378 = _374 || _376;
    int _380 = _75 + 80;
    if (!_378)
    {
        return;
    }
    uint _382 = uint(int(uint(_380) >> uint(2)));
    float _384 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_382)]);
    int _386 = _380 + 4;
    uint _388 = uint(int(uint(_386) >> uint(2)));
    float _390 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_388)]);
    int _392 = _304 + 16;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    float _396 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_394)]);
    uint _398 = uint(int(uint(_338) >> uint(2)));
    uint _400 = uint(int(uint(int(_398)) >> uint(2)));
    int _402 = int(_398) & 3;
    float _404 = (*spvDescriptorSet0.cp_c4)._m0[int(_400)][_402];
    int _406 = _75 + 32;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    float _410 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_408)]);
    int _412 = _406 + 4;
    uint _414 = uint(int(uint(_412) >> uint(2)));
    float _416 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_414)]);
    int _418 = _406 + 8;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    float _422 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_420)]);
    int _424 = _406 + 12;
    uint _426 = uint(int(uint(_424) >> uint(2)));
    float _428 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_426)]);
    float _430 = _404 * _404;
    float _432 = float2(as_type<half2>(as_type<uint>(_384))).x;
    float _434 = (-0.0) + _432;
    float _436 = float2(as_type<half2>(as_type<uint>(_384))).y;
    float _438 = (-0.0) + _436;
    float _440 = float2(as_type<half2>(as_type<uint>(_390))).x;
    float _442 = (-0.0) + _440;
    float _444 = _434 * _430;
    float _446 = float2(as_type<half2>(as_type<uint>(_390))).y;
    float _448 = (-0.0) + _446;
    float _450 = _438 * _430;
    int _452 = as_type<int>(_396) + (-1);
    float _454 = _442 * _430;
    float _456 = _444 * _444;
    float _458 = _450 * _450;
    float _460 = _448 * _430;
    float _462 = _454 * _454;
    int _464 = _75 + 16;
    bool _466 = _332 >= _456;
    bool _468 = isnan(_332);
    bool _470 = _466 || _468;
    bool _472 = isnan(_456);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = _460 * _460;
    bool _480 = _332 >= _458;
    bool _482 = isnan(_332);
    bool _484 = _480 || _482;
    bool _486 = isnan(_458);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    bool _492 = _332 >= _462;
    bool _494 = isnan(_332);
    bool _496 = _492 || _494;
    bool _498 = isnan(_462);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    bool _504 = _332 >= _478;
    bool _506 = isnan(_332);
    bool _508 = _504 || _506;
    bool _510 = isnan(_478);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _476 + _490;
    float _518 = _502 + _516;
    int _520 = _75 + 88;
    uint _522 = uint(int(uint(_464) >> uint(2)));
    float _524 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_522)]);
    int _526 = _464 + 4;
    uint _528 = uint(int(uint(_526) >> uint(2)));
    float _530 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_528)]);
    int _532 = _464 + 8;
    uint _534 = uint(int(uint(_532) >> uint(2)));
    float _536 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_534)]);
    int _538 = _464 + 12;
    uint _540 = uint(int(uint(_538) >> uint(2)));
    float _542 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_540)]);
    float _544 = _514 + _518;
    uint _546 = uint(int(uint(_520) >> uint(2)));
    float _548 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_546)]);
    float _550 = trunc(_544);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    int _556 = int(_554) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _558 = min(uint(_452), uint(_556));
    int _560 = as_type<int>(_94) << 2;
    int _562 = _560 + int(_558);
    int _564 = _562 << 3;
    uint _566 = uint(int(uint(_75) >> uint(2)));
    float _568 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_566)]);
    int _570 = _75 + 4;
    uint _572 = uint(int(uint(_570) >> uint(2)));
    float _574 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_572)]);
    int _576 = _75 + 8;
    uint _578 = uint(int(uint(_576) >> uint(2)));
    float _580 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_578)]);
    int _582 = _75 + 12;
    uint _584 = uint(int(uint(_582) >> uint(2)));
    float _586 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_584)]);
    int _588 = _564 + 4;
    int _590 = _588 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _592 = uint(_590) < uint(_588);
    int _594 = int(_592);
    bool _596 = uint(_590) < uint(_590);
    int _598 = int(_596);
    int _600 = _594 + _598;
    int _602 = _600 & 1;
    bool _604 = _602 != 0;
    int _606 = int(_604);
    int _608 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _606;
    uint _610 = spvSubgroupBallot(true).x;
    float _612 = spvSubgroupShuffle(as_type<float>(_590), 0u);
    bool _614 = as_type<int>(_612) == _590;
    float _616 = spvSubgroupShuffle(as_type<float>(_608), 0u);
    bool _618 = as_type<int>(_616) == _608;
    bool _620 = _614 && _618;
    int _622 = int(_620);
    float _624 = spvSubgroupShuffle(as_type<float>(_590), 1u);
    bool _626 = as_type<int>(_624) == _590;
    float _628 = spvSubgroupShuffle(as_type<float>(_608), 1u);
    bool _630 = as_type<int>(_628) == _608;
    bool _632 = _626 && _630;
    int _634 = _632 ? 2 : 0;
    int _636 = _622 | _634;
    float _638 = spvSubgroupShuffle(as_type<float>(_590), 2u);
    bool _640 = as_type<int>(_638) == _590;
    float _642 = spvSubgroupShuffle(as_type<float>(_608), 2u);
    bool _644 = as_type<int>(_642) == _608;
    bool _646 = _640 && _644;
    int _648 = _646 ? 4 : 0;
    int _650 = _636 | _648;
    float _652 = spvSubgroupShuffle(as_type<float>(_590), 3u);
    bool _654 = as_type<int>(_652) == _590;
    float _656 = spvSubgroupShuffle(as_type<float>(_608), 3u);
    bool _658 = as_type<int>(_656) == _608;
    bool _660 = _654 && _658;
    int _662 = _660 ? 8 : 0;
    int _664 = _650 | _662;
    float _666 = spvSubgroupShuffle(as_type<float>(_590), 4u);
    bool _668 = as_type<int>(_666) == _590;
    float _670 = spvSubgroupShuffle(as_type<float>(_608), 4u);
    bool _672 = as_type<int>(_670) == _608;
    bool _674 = _668 && _672;
    int _676 = _674 ? 16 : 0;
    int _678 = _664 | _676;
    float _680 = spvSubgroupShuffle(as_type<float>(_590), 5u);
    bool _682 = as_type<int>(_680) == _590;
    float _684 = spvSubgroupShuffle(as_type<float>(_608), 5u);
    bool _686 = as_type<int>(_684) == _608;
    bool _688 = _682 && _686;
    int _690 = _688 ? 32 : 0;
    int _692 = _678 | _690;
    float _694 = spvSubgroupShuffle(as_type<float>(_590), 6u);
    bool _696 = as_type<int>(_694) == _590;
    float _698 = spvSubgroupShuffle(as_type<float>(_608), 6u);
    bool _700 = as_type<int>(_698) == _608;
    bool _702 = _696 && _700;
    int _704 = _702 ? 64 : 0;
    int _706 = _692 | _704;
    float _708 = spvSubgroupShuffle(as_type<float>(_590), 7u);
    bool _710 = as_type<int>(_708) == _590;
    float _712 = spvSubgroupShuffle(as_type<float>(_608), 7u);
    bool _714 = as_type<int>(_712) == _608;
    bool _716 = _710 && _714;
    int _718 = _716 ? 128 : 0;
    int _720 = _706 | _718;
    float _722 = spvSubgroupShuffle(as_type<float>(_590), 8u);
    bool _724 = as_type<int>(_722) == _590;
    float _726 = spvSubgroupShuffle(as_type<float>(_608), 8u);
    bool _728 = as_type<int>(_726) == _608;
    bool _730 = _724 && _728;
    int _732 = _730 ? 256 : 0;
    int _734 = _720 | _732;
    float _736 = spvSubgroupShuffle(as_type<float>(_590), 9u);
    bool _738 = as_type<int>(_736) == _590;
    float _740 = spvSubgroupShuffle(as_type<float>(_608), 9u);
    bool _742 = as_type<int>(_740) == _608;
    bool _744 = _738 && _742;
    int _746 = _744 ? 512 : 0;
    int _748 = _734 | _746;
    float _750 = spvSubgroupShuffle(as_type<float>(_590), 10u);
    bool _752 = as_type<int>(_750) == _590;
    float _754 = spvSubgroupShuffle(as_type<float>(_608), 10u);
    bool _756 = as_type<int>(_754) == _608;
    bool _758 = _752 && _756;
    int _760 = _758 ? 1024 : 0;
    int _762 = _748 | _760;
    float _764 = spvSubgroupShuffle(as_type<float>(_590), 11u);
    bool _766 = as_type<int>(_764) == _590;
    float _768 = spvSubgroupShuffle(as_type<float>(_608), 11u);
    bool _770 = as_type<int>(_768) == _608;
    bool _772 = _766 && _770;
    int _774 = _772 ? 2048 : 0;
    int _776 = _762 | _774;
    float _778 = spvSubgroupShuffle(as_type<float>(_590), 12u);
    bool _780 = as_type<int>(_778) == _590;
    float _782 = spvSubgroupShuffle(as_type<float>(_608), 12u);
    bool _784 = as_type<int>(_782) == _608;
    bool _786 = _780 && _784;
    int _788 = _786 ? 4096 : 0;
    int _790 = _776 | _788;
    float _792 = spvSubgroupShuffle(as_type<float>(_590), 13u);
    bool _794 = as_type<int>(_792) == _590;
    float _796 = spvSubgroupShuffle(as_type<float>(_608), 13u);
    bool _798 = as_type<int>(_796) == _608;
    bool _800 = _794 && _798;
    int _802 = _800 ? 8192 : 0;
    int _804 = _790 | _802;
    float _806 = spvSubgroupShuffle(as_type<float>(_590), 14u);
    bool _808 = as_type<int>(_806) == _590;
    float _810 = spvSubgroupShuffle(as_type<float>(_608), 14u);
    bool _812 = as_type<int>(_810) == _608;
    bool _814 = _808 && _812;
    int _816 = _814 ? 16384 : 0;
    int _818 = _804 | _816;
    float _820 = spvSubgroupShuffle(as_type<float>(_590), 15u);
    bool _822 = as_type<int>(_820) == _590;
    float _824 = spvSubgroupShuffle(as_type<float>(_608), 15u);
    bool _826 = as_type<int>(_824) == _608;
    bool _828 = _822 && _826;
    int _830 = _828 ? 32768 : 0;
    int _832 = _818 | _830;
    float _834 = spvSubgroupShuffle(as_type<float>(_590), 16u);
    bool _836 = as_type<int>(_834) == _590;
    float _838 = spvSubgroupShuffle(as_type<float>(_608), 16u);
    bool _840 = as_type<int>(_838) == _608;
    bool _842 = _836 && _840;
    int _844 = _842 ? 65536 : 0;
    int _846 = _832 | _844;
    float _848 = spvSubgroupShuffle(as_type<float>(_590), 17u);
    bool _850 = as_type<int>(_848) == _590;
    float _852 = spvSubgroupShuffle(as_type<float>(_608), 17u);
    bool _854 = as_type<int>(_852) == _608;
    bool _856 = _850 && _854;
    int _858 = _856 ? 131072 : 0;
    int _860 = _846 | _858;
    float _862 = spvSubgroupShuffle(as_type<float>(_590), 18u);
    bool _864 = as_type<int>(_862) == _590;
    float _866 = spvSubgroupShuffle(as_type<float>(_608), 18u);
    bool _868 = as_type<int>(_866) == _608;
    bool _870 = _864 && _868;
    int _872 = _870 ? 262144 : 0;
    int _874 = _860 | _872;
    float _876 = spvSubgroupShuffle(as_type<float>(_590), 19u);
    bool _878 = as_type<int>(_876) == _590;
    float _880 = spvSubgroupShuffle(as_type<float>(_608), 19u);
    bool _882 = as_type<int>(_880) == _608;
    bool _884 = _878 && _882;
    int _886 = _884 ? 524288 : 0;
    int _888 = _874 | _886;
    float _890 = spvSubgroupShuffle(as_type<float>(_590), 20u);
    bool _892 = as_type<int>(_890) == _590;
    float _894 = spvSubgroupShuffle(as_type<float>(_608), 20u);
    bool _896 = as_type<int>(_894) == _608;
    bool _898 = _892 && _896;
    int _900 = _898 ? 1048576 : 0;
    int _902 = _888 | _900;
    float _904 = spvSubgroupShuffle(as_type<float>(_590), 21u);
    bool _906 = as_type<int>(_904) == _590;
    float _908 = spvSubgroupShuffle(as_type<float>(_608), 21u);
    bool _910 = as_type<int>(_908) == _608;
    bool _912 = _906 && _910;
    int _914 = _912 ? 2097152 : 0;
    int _916 = _902 | _914;
    float _918 = spvSubgroupShuffle(as_type<float>(_590), 22u);
    bool _920 = as_type<int>(_918) == _590;
    float _922 = spvSubgroupShuffle(as_type<float>(_608), 22u);
    bool _924 = as_type<int>(_922) == _608;
    bool _926 = _920 && _924;
    int _928 = _926 ? 4194304 : 0;
    int _930 = _916 | _928;
    float _932 = spvSubgroupShuffle(as_type<float>(_590), 23u);
    bool _934 = as_type<int>(_932) == _590;
    float _936 = spvSubgroupShuffle(as_type<float>(_608), 23u);
    bool _938 = as_type<int>(_936) == _608;
    bool _940 = _934 && _938;
    int _942 = _940 ? 8388608 : 0;
    int _944 = _930 | _942;
    float _946 = spvSubgroupShuffle(as_type<float>(_590), 24u);
    bool _948 = as_type<int>(_946) == _590;
    float _950 = spvSubgroupShuffle(as_type<float>(_608), 24u);
    bool _952 = as_type<int>(_950) == _608;
    bool _954 = _948 && _952;
    int _956 = _954 ? 16777216 : 0;
    int _958 = _944 | _956;
    float _960 = spvSubgroupShuffle(as_type<float>(_590), 25u);
    bool _962 = as_type<int>(_960) == _590;
    float _964 = spvSubgroupShuffle(as_type<float>(_608), 25u);
    bool _966 = as_type<int>(_964) == _608;
    bool _968 = _962 && _966;
    int _970 = _968 ? 33554432 : 0;
    int _972 = _958 | _970;
    float _974 = spvSubgroupShuffle(as_type<float>(_590), 26u);
    bool _976 = as_type<int>(_974) == _590;
    float _978 = spvSubgroupShuffle(as_type<float>(_608), 26u);
    bool _980 = as_type<int>(_978) == _608;
    bool _982 = _976 && _980;
    int _984 = _982 ? 67108864 : 0;
    int _986 = _972 | _984;
    float _988 = spvSubgroupShuffle(as_type<float>(_590), 27u);
    bool _990 = as_type<int>(_988) == _590;
    float _992 = spvSubgroupShuffle(as_type<float>(_608), 27u);
    bool _994 = as_type<int>(_992) == _608;
    bool _996 = _990 && _994;
    int _998 = _996 ? 134217728 : 0;
    int _1000 = _986 | _998;
    float _1002 = spvSubgroupShuffle(as_type<float>(_590), 28u);
    bool _1004 = as_type<int>(_1002) == _590;
    float _1006 = spvSubgroupShuffle(as_type<float>(_608), 28u);
    bool _1008 = as_type<int>(_1006) == _608;
    bool _1010 = _1004 && _1008;
    int _1012 = _1010 ? 268435456 : 0;
    int _1014 = _1000 | _1012;
    float _1016 = spvSubgroupShuffle(as_type<float>(_590), 29u);
    bool _1018 = as_type<int>(_1016) == _590;
    float _1020 = spvSubgroupShuffle(as_type<float>(_608), 29u);
    bool _1022 = as_type<int>(_1020) == _608;
    bool _1024 = _1018 && _1022;
    int _1026 = _1024 ? 536870912 : 0;
    int _1028 = _1014 | _1026;
    float _1030 = spvSubgroupShuffle(as_type<float>(_590), 30u);
    bool _1032 = as_type<int>(_1030) == _590;
    float _1034 = spvSubgroupShuffle(as_type<float>(_608), 30u);
    bool _1036 = as_type<int>(_1034) == _608;
    bool _1038 = _1032 && _1036;
    int _1040 = _1038 ? 1073741824 : 0;
    int _1042 = _1028 | _1040;
    float _1044 = spvSubgroupShuffle(as_type<float>(_590), 31u);
    bool _1046 = as_type<int>(_1044) == _590;
    float _1048 = spvSubgroupShuffle(as_type<float>(_608), 31u);
    bool _1050 = as_type<int>(_1048) == _608;
    bool _1052 = _1046 && _1050;
    int _1054 = _1052 ? int(0x80000000) : 0;
    int _1056 = _1042 | _1054;
    int _1058 = _1056 & int(_610);
    bool _1060 = _1058 == int(_610);
    int _1062 = 0;
    if (!_1060)
    {
        uint _1064 = uint(int(uint(_588) >> uint(2)));
        uint _2943 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1064)], 1u, memory_order_relaxed);
        uint _1066 = _2943;
        _1062 = int(_1066);
    }
    int _1068 = _1062;
    bool _1070 = !_1060;
    int _1072 = _1068;
    if (!_1070)
    {
        float _1074 = as_type<float>(gl_SubgroupInvocationID);
        uint _1076 = spvSubgroupBallot(true).x;
        int _1078 = int(spvFindUMSB(_1076));
        int _1080 = popcount(int(_1076));
        bool _1082 = _1078 == as_type<int>(_1074);
        int _1084 = _1080;
        if (_1082)
        {
            uint _1086 = uint(int(uint(_588) >> uint(2)));
            uint _2979 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_1086)], uint(_1080), memory_order_relaxed);
            uint _1088 = _2979;
            _1084 = int(_1088);
        }
        int _1090 = _1084;
        float _1092 = as_type<float>(gl_SubgroupLtMask.x);
        int _1094 = as_type<int>(_1092) & int(_1076);
        int _1096 = popcount(_1094);
        int _1098 = _1090;
        int _1100 = _1078;
        int _1102 = 31;
        int _1104;
        int _2997 = _57(_1098, _1100, _1102, _1104, gl_SubgroupInvocationID);
        int _1106 = _2997;
        int _1108 = _1106 + _1096;
        _1072 = _1108;
    }
    int _1110 = _1072;
    uint _1112 = uint(int(uint(_564) >> uint(2)));
    float _1114 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_1112)]);
    int _1116 = as_type<int>(_586) * 1664525;
    int _1118 = _1116 + 1013904223;
    int _1120 = as_type<int>(_542) * 1664525;
    int _1122 = _1120 + 1013904223;
    int _1124 = as_type<int>(_428) * 1664525;
    int _1126 = _1124 + 1013904223;
    uint _1128 = uint(int(uint(as_type<int>(_548)) >> uint(16)));
    int _1130 = _1122 * _1126;
    int _1132 = _1130 + _1118;
    int _1134 = _1126 * _1132;
    int _1136 = _1134 + _1122;
    uint _1138 = uint(int(uint(_1132) >> uint(16)));
    int _1140 = _1132 * _1136;
    int _1142 = _1140 + _1126;
    uint _1144 = uint(int(uint(_1136) >> uint(16)));
    int _1146 = _1132 ^ int(_1138);
    uint _1148 = uint(int(uint(_1142) >> uint(16)));
    int _1150 = _1136 ^ int(_1144);
    int _1152 = _1142 ^ int(_1148);
    int _1154 = _1150 * _1152;
    int _1156 = _1154 + _1146;
    int _1158 = as_type<int>(_548) & 65535;
    uint _1160 = uint(int(uint(_1156) >> uint(9)));
    int _1162 = int(_1160) + 1065353216;
    float _1164 = as_type<float>(_1162) + (-1.0);
    int _1166 = _1110 + as_type<int>(_1114);
    int _1168 = _1166 * 80;
    int _1170 = _1168 + 16;
    uint _1172 = uint(int(uint(_1168) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1172)] = as_type<uint>(_568);
    int _1174 = _1168 + 4;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1176)] = as_type<uint>(_574);
    int _1178 = _1168 + 8;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1180)] = as_type<uint>(_580);
    int _1182 = _1168 + 12;
    uint _1184 = uint(int(uint(_1182) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1184)] = as_type<uint>(_586);
    int _1186 = _1168 + 32;
    int _1188 = _1168 + 48;
    uint _1190 = uint(int(uint(_1170) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1190)] = as_type<uint>(_524);
    int _1192 = _1170 + 4;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1194)] = as_type<uint>(_530);
    int _1196 = _1170 + 8;
    uint _1198 = uint(int(uint(_1196) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1198)] = as_type<uint>(_536);
    int _1200 = _1170 + 12;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1202)] = as_type<uint>(_542);
    int _1204 = _1168 + 64;
    uint _1206 = uint(int(uint(_1186) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1206)] = as_type<uint>(_410);
    int _1208 = _1186 + 4;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1210)] = as_type<uint>(_416);
    int _1212 = _1186 + 8;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1214)] = as_type<uint>(_422);
    int _1216 = _1186 + 12;
    uint _1218 = uint(int(uint(_1216) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1218)] = as_type<uint>(_428);
    uint _1220 = uint(int(uint(_1188) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1220)] = as_type<uint>(_1164);
    int _1222 = _1188 + 4;
    uint _1224 = uint(int(uint(_1222) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1224)] = _1128;
    int _1226 = _1188 + 8;
    uint _1228 = uint(int(uint(_1226) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1228)] = uint(_1158);
    int _1230 = _1188 + 12;
    uint _1232 = uint(int(uint(_1230) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1232)] = as_type<uint>(_100);
    uint _1234 = uint(int(uint(_1204) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1234)] = 1065353216u;
    int _1236 = _1204 + 4;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1238)] = as_type<uint>(_82);
    int _1240 = _1204 + 8;
    uint _1242 = uint(int(uint(_1240) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1242)] = as_type<uint>(_88);
    int _1244 = _1204 + 12;
    uint _1246 = uint(int(uint(_1244) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1246)] = as_type<uint>(_94);
}

