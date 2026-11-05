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
int _57(thread const int& _2972, thread const int& _2973, thread const int& _2974, thread int& _2975, thread uint& gl_SubgroupInvocationID)
{
    int _2978 = _2974 & 31;
    uint _2980 = uint(int(uint(_2974) >> uint(8)));
    int _2982 = int(_2980) & 31;
    float _2984 = as_type<float>(gl_SubgroupInvocationID);
    int _2986 = as_type<int>(_2984) & _2982;
    int _2988 = ~_2982;
    int _2990 = _2978 & _2988;
    int _2992 = _2990 | _2986;
    int _2994 = ~_2982;
    int _2996 = _2973 & _2994;
    int _2998 = _2996 | _2986;
    bool _3000 = uint(_2998) <= uint(_2992);
    _2975 = _3000 ? (-1) : 0;
    float _3002 = spvSubgroupShuffle(as_type<float>(_2972), uint(_2998));
    uint _3004 = uint(_3000 ? as_type<int>(_3002) : _2972);
    return int(_3004);
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
    int _278 = as_type<int>(_94) * 20;
    bool _280 = _272 >= _126;
    bool _282 = isnan(_272);
    bool _284 = _280 || _282;
    bool _286 = isnan(_126);
    bool _288 = _284 || _286;
    bool _290 = _276 < _126;
    bool _292 = !_288;
    bool _294 = _290 && _292;
    float _296 = _270 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _298 = _274 < _126;
    bool _300 = _298 && _294;
    bool _302 = _296 < _126;
    bool _304 = _302 && _300;
    if (!_304)
    {
        return;
    }
    uint _306 = uint(int(uint(_278) >> uint(2)));
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
    if (!_378)
    {
        return;
    }
    int _380 = as_type<int>(_94) << 5;
    int _382 = _75 + 16;
    uint _384 = uint(int(uint(_75) >> uint(2)));
    float _386 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_384)]);
    int _388 = _75 + 4;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_390)]);
    int _394 = _75 + 8;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_396)]);
    int _400 = _75 + 12;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    float _404 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_402)]);
    int _406 = _380 + 4;
    int _408 = _75 + 32;
    int _410 = _406 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _412 = uint(_410) < uint(_406);
    int _414 = int(_412);
    bool _416 = uint(_410) < uint(_410);
    int _418 = int(_416);
    int _420 = _414 + _418;
    int _422 = _420 & 1;
    bool _424 = _422 != 0;
    uint _426 = uint(int(uint(_382) >> uint(2)));
    float _428 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_426)]);
    int _430 = _382 + 4;
    uint _432 = uint(int(uint(_430) >> uint(2)));
    float _434 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_432)]);
    int _436 = _382 + 8;
    uint _438 = uint(int(uint(_436) >> uint(2)));
    float _440 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_438)]);
    int _442 = _382 + 12;
    uint _444 = uint(int(uint(_442) >> uint(2)));
    float _446 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_444)]);
    int _448 = int(_424);
    int _450 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _448;
    uint _452 = uint(int(uint(_408) >> uint(2)));
    float _454 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_452)]);
    int _456 = _408 + 4;
    uint _458 = uint(int(uint(_456) >> uint(2)));
    float _460 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_458)]);
    int _462 = _408 + 8;
    uint _464 = uint(int(uint(_462) >> uint(2)));
    float _466 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_464)]);
    int _468 = _408 + 12;
    uint _470 = uint(int(uint(_468) >> uint(2)));
    float _472 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_470)]);
    uint _474 = spvSubgroupBallot(true).x;
    float _476 = spvSubgroupShuffle(as_type<float>(_410), 0u);
    bool _478 = as_type<int>(_476) == _410;
    float _480 = spvSubgroupShuffle(as_type<float>(_450), 0u);
    bool _482 = as_type<int>(_480) == _450;
    bool _484 = _478 && _482;
    int _486 = int(_484);
    float _488 = spvSubgroupShuffle(as_type<float>(_410), 1u);
    bool _490 = as_type<int>(_488) == _410;
    float _492 = spvSubgroupShuffle(as_type<float>(_450), 1u);
    bool _494 = as_type<int>(_492) == _450;
    bool _496 = _490 && _494;
    int _498 = _496 ? 2 : 0;
    int _500 = _486 | _498;
    float _502 = spvSubgroupShuffle(as_type<float>(_410), 2u);
    bool _504 = as_type<int>(_502) == _410;
    float _506 = spvSubgroupShuffle(as_type<float>(_450), 2u);
    bool _508 = as_type<int>(_506) == _450;
    bool _510 = _504 && _508;
    int _512 = _510 ? 4 : 0;
    int _514 = _500 | _512;
    float _516 = spvSubgroupShuffle(as_type<float>(_410), 3u);
    bool _518 = as_type<int>(_516) == _410;
    float _520 = spvSubgroupShuffle(as_type<float>(_450), 3u);
    bool _522 = as_type<int>(_520) == _450;
    bool _524 = _518 && _522;
    int _526 = _524 ? 8 : 0;
    int _528 = _514 | _526;
    float _530 = spvSubgroupShuffle(as_type<float>(_410), 4u);
    bool _532 = as_type<int>(_530) == _410;
    float _534 = spvSubgroupShuffle(as_type<float>(_450), 4u);
    bool _536 = as_type<int>(_534) == _450;
    bool _538 = _532 && _536;
    int _540 = _538 ? 16 : 0;
    int _542 = _528 | _540;
    float _544 = spvSubgroupShuffle(as_type<float>(_410), 5u);
    bool _546 = as_type<int>(_544) == _410;
    float _548 = spvSubgroupShuffle(as_type<float>(_450), 5u);
    bool _550 = as_type<int>(_548) == _450;
    bool _552 = _546 && _550;
    int _554 = _552 ? 32 : 0;
    int _556 = _542 | _554;
    float _558 = spvSubgroupShuffle(as_type<float>(_410), 6u);
    bool _560 = as_type<int>(_558) == _410;
    float _562 = spvSubgroupShuffle(as_type<float>(_450), 6u);
    bool _564 = as_type<int>(_562) == _450;
    bool _566 = _560 && _564;
    int _568 = _566 ? 64 : 0;
    int _570 = _556 | _568;
    float _572 = spvSubgroupShuffle(as_type<float>(_410), 7u);
    bool _574 = as_type<int>(_572) == _410;
    float _576 = spvSubgroupShuffle(as_type<float>(_450), 7u);
    bool _578 = as_type<int>(_576) == _450;
    bool _580 = _574 && _578;
    int _582 = _580 ? 128 : 0;
    int _584 = _570 | _582;
    float _586 = spvSubgroupShuffle(as_type<float>(_410), 8u);
    bool _588 = as_type<int>(_586) == _410;
    float _590 = spvSubgroupShuffle(as_type<float>(_450), 8u);
    bool _592 = as_type<int>(_590) == _450;
    bool _594 = _588 && _592;
    int _596 = _594 ? 256 : 0;
    int _598 = _584 | _596;
    float _600 = spvSubgroupShuffle(as_type<float>(_410), 9u);
    bool _602 = as_type<int>(_600) == _410;
    float _604 = spvSubgroupShuffle(as_type<float>(_450), 9u);
    bool _606 = as_type<int>(_604) == _450;
    bool _608 = _602 && _606;
    int _610 = _608 ? 512 : 0;
    int _612 = _598 | _610;
    float _614 = spvSubgroupShuffle(as_type<float>(_410), 10u);
    bool _616 = as_type<int>(_614) == _410;
    float _618 = spvSubgroupShuffle(as_type<float>(_450), 10u);
    bool _620 = as_type<int>(_618) == _450;
    bool _622 = _616 && _620;
    int _624 = _622 ? 1024 : 0;
    int _626 = _612 | _624;
    float _628 = spvSubgroupShuffle(as_type<float>(_410), 11u);
    bool _630 = as_type<int>(_628) == _410;
    float _632 = spvSubgroupShuffle(as_type<float>(_450), 11u);
    bool _634 = as_type<int>(_632) == _450;
    bool _636 = _630 && _634;
    int _638 = _636 ? 2048 : 0;
    int _640 = _626 | _638;
    float _642 = spvSubgroupShuffle(as_type<float>(_410), 12u);
    bool _644 = as_type<int>(_642) == _410;
    float _646 = spvSubgroupShuffle(as_type<float>(_450), 12u);
    bool _648 = as_type<int>(_646) == _450;
    bool _650 = _644 && _648;
    int _652 = _650 ? 4096 : 0;
    int _654 = _640 | _652;
    float _656 = spvSubgroupShuffle(as_type<float>(_410), 13u);
    bool _658 = as_type<int>(_656) == _410;
    float _660 = spvSubgroupShuffle(as_type<float>(_450), 13u);
    bool _662 = as_type<int>(_660) == _450;
    bool _664 = _658 && _662;
    int _666 = _664 ? 8192 : 0;
    int _668 = _654 | _666;
    float _670 = spvSubgroupShuffle(as_type<float>(_410), 14u);
    bool _672 = as_type<int>(_670) == _410;
    float _674 = spvSubgroupShuffle(as_type<float>(_450), 14u);
    bool _676 = as_type<int>(_674) == _450;
    bool _678 = _672 && _676;
    int _680 = _678 ? 16384 : 0;
    int _682 = _668 | _680;
    float _684 = spvSubgroupShuffle(as_type<float>(_410), 15u);
    bool _686 = as_type<int>(_684) == _410;
    float _688 = spvSubgroupShuffle(as_type<float>(_450), 15u);
    bool _690 = as_type<int>(_688) == _450;
    bool _692 = _686 && _690;
    int _694 = _692 ? 32768 : 0;
    int _696 = _682 | _694;
    float _698 = spvSubgroupShuffle(as_type<float>(_410), 16u);
    bool _700 = as_type<int>(_698) == _410;
    float _702 = spvSubgroupShuffle(as_type<float>(_450), 16u);
    bool _704 = as_type<int>(_702) == _450;
    bool _706 = _700 && _704;
    int _708 = _706 ? 65536 : 0;
    int _710 = _696 | _708;
    float _712 = spvSubgroupShuffle(as_type<float>(_410), 17u);
    bool _714 = as_type<int>(_712) == _410;
    float _716 = spvSubgroupShuffle(as_type<float>(_450), 17u);
    bool _718 = as_type<int>(_716) == _450;
    bool _720 = _714 && _718;
    int _722 = _720 ? 131072 : 0;
    int _724 = _710 | _722;
    float _726 = spvSubgroupShuffle(as_type<float>(_410), 18u);
    bool _728 = as_type<int>(_726) == _410;
    float _730 = spvSubgroupShuffle(as_type<float>(_450), 18u);
    bool _732 = as_type<int>(_730) == _450;
    bool _734 = _728 && _732;
    int _736 = _734 ? 262144 : 0;
    int _738 = _724 | _736;
    float _740 = spvSubgroupShuffle(as_type<float>(_410), 19u);
    bool _742 = as_type<int>(_740) == _410;
    float _744 = spvSubgroupShuffle(as_type<float>(_450), 19u);
    bool _746 = as_type<int>(_744) == _450;
    bool _748 = _742 && _746;
    int _750 = _748 ? 524288 : 0;
    int _752 = _738 | _750;
    float _754 = spvSubgroupShuffle(as_type<float>(_410), 20u);
    bool _756 = as_type<int>(_754) == _410;
    float _758 = spvSubgroupShuffle(as_type<float>(_450), 20u);
    bool _760 = as_type<int>(_758) == _450;
    bool _762 = _756 && _760;
    int _764 = _762 ? 1048576 : 0;
    int _766 = _752 | _764;
    float _768 = spvSubgroupShuffle(as_type<float>(_410), 21u);
    bool _770 = as_type<int>(_768) == _410;
    float _772 = spvSubgroupShuffle(as_type<float>(_450), 21u);
    bool _774 = as_type<int>(_772) == _450;
    bool _776 = _770 && _774;
    int _778 = _776 ? 2097152 : 0;
    int _780 = _766 | _778;
    float _782 = spvSubgroupShuffle(as_type<float>(_410), 22u);
    bool _784 = as_type<int>(_782) == _410;
    float _786 = spvSubgroupShuffle(as_type<float>(_450), 22u);
    bool _788 = as_type<int>(_786) == _450;
    bool _790 = _784 && _788;
    int _792 = _790 ? 4194304 : 0;
    int _794 = _780 | _792;
    float _796 = spvSubgroupShuffle(as_type<float>(_410), 23u);
    bool _798 = as_type<int>(_796) == _410;
    float _800 = spvSubgroupShuffle(as_type<float>(_450), 23u);
    bool _802 = as_type<int>(_800) == _450;
    bool _804 = _798 && _802;
    int _806 = _804 ? 8388608 : 0;
    int _808 = _794 | _806;
    float _810 = spvSubgroupShuffle(as_type<float>(_410), 24u);
    bool _812 = as_type<int>(_810) == _410;
    float _814 = spvSubgroupShuffle(as_type<float>(_450), 24u);
    bool _816 = as_type<int>(_814) == _450;
    bool _818 = _812 && _816;
    int _820 = _818 ? 16777216 : 0;
    int _822 = _808 | _820;
    float _824 = spvSubgroupShuffle(as_type<float>(_410), 25u);
    bool _826 = as_type<int>(_824) == _410;
    float _828 = spvSubgroupShuffle(as_type<float>(_450), 25u);
    bool _830 = as_type<int>(_828) == _450;
    bool _832 = _826 && _830;
    int _834 = _832 ? 33554432 : 0;
    int _836 = _822 | _834;
    float _838 = spvSubgroupShuffle(as_type<float>(_410), 26u);
    bool _840 = as_type<int>(_838) == _410;
    float _842 = spvSubgroupShuffle(as_type<float>(_450), 26u);
    bool _844 = as_type<int>(_842) == _450;
    bool _846 = _840 && _844;
    int _848 = _846 ? 67108864 : 0;
    int _850 = _836 | _848;
    float _852 = spvSubgroupShuffle(as_type<float>(_410), 27u);
    bool _854 = as_type<int>(_852) == _410;
    float _856 = spvSubgroupShuffle(as_type<float>(_450), 27u);
    bool _858 = as_type<int>(_856) == _450;
    bool _860 = _854 && _858;
    int _862 = _860 ? 134217728 : 0;
    int _864 = _850 | _862;
    float _866 = spvSubgroupShuffle(as_type<float>(_410), 28u);
    bool _868 = as_type<int>(_866) == _410;
    float _870 = spvSubgroupShuffle(as_type<float>(_450), 28u);
    bool _872 = as_type<int>(_870) == _450;
    bool _874 = _868 && _872;
    int _876 = _874 ? 268435456 : 0;
    int _878 = _864 | _876;
    float _880 = spvSubgroupShuffle(as_type<float>(_410), 29u);
    bool _882 = as_type<int>(_880) == _410;
    float _884 = spvSubgroupShuffle(as_type<float>(_450), 29u);
    bool _886 = as_type<int>(_884) == _450;
    bool _888 = _882 && _886;
    int _890 = _888 ? 536870912 : 0;
    int _892 = _878 | _890;
    float _894 = spvSubgroupShuffle(as_type<float>(_410), 30u);
    bool _896 = as_type<int>(_894) == _410;
    float _898 = spvSubgroupShuffle(as_type<float>(_450), 30u);
    bool _900 = as_type<int>(_898) == _450;
    bool _902 = _896 && _900;
    int _904 = _902 ? 1073741824 : 0;
    int _906 = _892 | _904;
    float _908 = spvSubgroupShuffle(as_type<float>(_410), 31u);
    bool _910 = as_type<int>(_908) == _410;
    float _912 = spvSubgroupShuffle(as_type<float>(_450), 31u);
    bool _914 = as_type<int>(_912) == _450;
    bool _916 = _910 && _914;
    int _918 = _916 ? int(0x80000000) : 0;
    int _920 = _906 | _918;
    int _922 = _920 & int(_474);
    bool _924 = _922 == int(_474);
    int _926 = _75 + 88;
    uint _928 = uint(int(uint(_926) >> uint(2)));
    float _930 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_928)]);
    int _932 = 0;
    if (!_924)
    {
        uint _934 = uint(int(uint(_406) >> uint(2)));
        uint _2619 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_934)], 1u, memory_order_relaxed);
        uint _936 = _2619;
        _932 = int(_936);
    }
    int _938 = _932;
    bool _940 = !_924;
    int _942 = _938;
    if (!_940)
    {
        float _944 = as_type<float>(gl_SubgroupInvocationID);
        uint _946 = spvSubgroupBallot(true).x;
        int _948 = int(spvFindUMSB(_946));
        int _950 = popcount(int(_946));
        bool _952 = _948 == as_type<int>(_944);
        int _954 = _950;
        if (_952)
        {
            uint _956 = uint(int(uint(_406) >> uint(2)));
            uint _2655 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_956)], uint(_950), memory_order_relaxed);
            uint _958 = _2655;
            _954 = int(_958);
        }
        int _960 = _954;
        float _962 = as_type<float>(gl_SubgroupLtMask.x);
        int _964 = as_type<int>(_962) & int(_946);
        int _966 = popcount(_964);
        int _968 = _960;
        int _970 = _948;
        int _972 = 31;
        int _974;
        int _2673 = _57(_968, _970, _972, _974, gl_SubgroupInvocationID);
        int _976 = _2673;
        int _978 = _976 + _966;
        _942 = _978;
    }
    int _980 = _942;
    uint _982 = uint(int(uint(_380) >> uint(2)));
    float _984 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_982)]);
    int _986 = as_type<int>(_404) * 1664525;
    int _988 = _986 + 1013904223;
    int _990 = as_type<int>(_446) * 1664525;
    int _992 = _990 + 1013904223;
    int _994 = as_type<int>(_472) * 1664525;
    int _996 = _994 + 1013904223;
    uint _998 = uint(int(uint(as_type<int>(_930)) >> uint(16)));
    int _1000 = _992 * _996;
    int _1002 = _1000 + _988;
    int _1004 = _996 * _1002;
    int _1006 = _1004 + _992;
    uint _1008 = uint(int(uint(_1002) >> uint(16)));
    int _1010 = _1002 * _1006;
    int _1012 = _1010 + _996;
    uint _1014 = uint(int(uint(_1006) >> uint(16)));
    int _1016 = _1002 ^ int(_1008);
    uint _1018 = uint(int(uint(_1012) >> uint(16)));
    int _1020 = _1006 ^ int(_1014);
    int _1022 = _1012 ^ int(_1018);
    int _1024 = _1020 * _1022;
    int _1026 = _1024 + _1016;
    int _1028 = as_type<int>(_930) & 65535;
    uint _1030 = uint(int(uint(_1026) >> uint(9)));
    int _1032 = int(_1030) + 1065353216;
    float _1034 = as_type<float>(_1032) + (-1.0);
    int _1036 = _980 + as_type<int>(_984);
    int _1038 = _1036 * 80;
    int _1040 = _1038 + 16;
    uint _1042 = uint(int(uint(_1038) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1042)] = as_type<uint>(_386);
    int _1044 = _1038 + 4;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1046)] = as_type<uint>(_392);
    int _1048 = _1038 + 8;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1050)] = as_type<uint>(_398);
    int _1052 = _1038 + 12;
    uint _1054 = uint(int(uint(_1052) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1054)] = as_type<uint>(_404);
    int _1056 = _1038 + 32;
    int _1058 = _1038 + 48;
    uint _1060 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1060)] = as_type<uint>(_428);
    int _1062 = _1040 + 4;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1064)] = as_type<uint>(_434);
    int _1066 = _1040 + 8;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1068)] = as_type<uint>(_440);
    int _1070 = _1040 + 12;
    uint _1072 = uint(int(uint(_1070) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1072)] = as_type<uint>(_446);
    int _1074 = _1038 + 64;
    uint _1076 = uint(int(uint(_1056) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1076)] = as_type<uint>(_454);
    int _1078 = _1056 + 4;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1080)] = as_type<uint>(_460);
    int _1082 = _1056 + 8;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1084)] = as_type<uint>(_466);
    int _1086 = _1056 + 12;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1088)] = as_type<uint>(_472);
    uint _1090 = uint(int(uint(_1058) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1090)] = as_type<uint>(_1034);
    int _1092 = _1058 + 4;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1094)] = _998;
    int _1096 = _1058 + 8;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1098)] = uint(_1028);
    int _1100 = _1058 + 12;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1102)] = as_type<uint>(_100);
    uint _1104 = uint(int(uint(_1074) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1104)] = 1065353216u;
    int _1106 = _1074 + 4;
    uint _1108 = uint(int(uint(_1106) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1108)] = as_type<uint>(_82);
    int _1110 = _1074 + 8;
    uint _1112 = uint(int(uint(_1110) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1112)] = as_type<uint>(_88);
    int _1114 = _1074 + 12;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1116)] = as_type<uint>(_94);
}

