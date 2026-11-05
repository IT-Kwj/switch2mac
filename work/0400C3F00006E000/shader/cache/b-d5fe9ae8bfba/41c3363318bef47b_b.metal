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
    device _25* cp_s4 [[id(7)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _2916, thread const int& _2917, thread const int& _2918, thread int& _2919, thread uint& gl_SubgroupInvocationID)
{
    int _2922 = _2918 & 31;
    uint _2924 = uint(int(uint(_2918) >> uint(8)));
    int _2926 = int(_2924) & 31;
    float _2928 = as_type<float>(gl_SubgroupInvocationID);
    int _2930 = as_type<int>(_2928) & _2926;
    int _2932 = ~_2926;
    int _2934 = _2922 & _2932;
    int _2936 = _2934 | _2930;
    int _2938 = ~_2926;
    int _2940 = _2917 & _2938;
    int _2942 = _2940 | _2930;
    bool _2944 = uint(_2942) <= uint(_2936);
    _2919 = _2944 ? (-1) : 0;
    float _2946 = spvSubgroupShuffle(as_type<float>(_2916), uint(_2942));
    uint _2948 = uint(_2944 ? as_type<int>(_2946) : _2916);
    return int(_2948);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _59 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    float _61 = as_type<float>(gl_WorkGroupID.x);
    float _63 = as_type<float>(gl_LocalInvocationID.x);
    int _65 = as_type<int>(_61) << 6;
    int _67 = _65 + as_type<int>(_63);
    bool _71 = uint(_67) >= as_type<uint>(_59);
    if (_71)
    {
        return;
    }
    int _73 = _67 * 96;
    int _75 = _73 + 48;
    uint _78 = uint(int(uint(_75) >> uint(2)));
    float _80 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_78)]);
    int _82 = _75 + 4;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_84)]);
    int _88 = _75 + 8;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_90)]);
    int _94 = _75 + 12;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_96)]);
    float _100 = _86 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _102 = _86 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _104 = _86 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _106 = _86 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _108 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[1].x, _100);
    float _110 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[0].x, _102);
    float _112 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[2].x, _104);
    float _114 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[3].x, _106);
    float _116 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[1].z, _108);
    float _118 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[0].z, _110);
    float _120 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[2].z, _112);
    float _122 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[3].z, _114);
    float _124 = _116 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _126 = _118 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    bool _128 = _124 >= _98;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan(_98);
    bool _136 = _132 || _134;
    float _138 = _120 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    bool _140 = _126 < _98;
    bool _142 = !_136;
    bool _144 = _140 && _142;
    float _146 = _122 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _148 = _138 < _98;
    bool _150 = _148 && _144;
    bool _152 = _146 < _98;
    bool _154 = _152 && _150;
    int _156 = _73 + 64;
    if (!_154)
    {
        return;
    }
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_158)]);
    int _162 = _156 + 4;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_164)]);
    int _168 = _156 + 8;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_170)]);
    int _174 = _156 + 12;
    uint _176 = uint(int(uint(_174) >> uint(2)));
    float _178 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_176)]);
    int _180 = _73 + 92;
    uint _182 = uint(int(uint(_180) >> uint(2)));
    float _184 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_182)]);
    int _186 = as_type<int>(_172) * 20;
    uint _188 = uint(int(uint(_186) >> uint(2)));
    float _190 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_188)]);
    float _192 = -_86;
    float _194 = _192 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _196 = -_80;
    float _198 = _196 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _200 = _194 * _194;
    float _202 = -_92;
    float _204 = _202 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _206 = fma(_198, _198, _200);
    float _208 = fma(_204, _204, _206);
    uint _210 = uint(int(uint(as_type<int>(_190)) >> uint(16)));
    int _212 = int(_210) << 4;
    int _214 = _212 + 4;
    uint _216 = uint(int(uint(_214) >> uint(2)));
    uint _218 = uint(int(uint(int(_216)) >> uint(2)));
    int _220 = int(_216) & 3;
    float _222 = (*spvDescriptorSet0.cp_c4)._m0[int(_218)][_220];
    float _224 = _184 * _222;
    float _226 = _224 * _224;
    bool _228 = _208 > _226;
    if (_228)
    {
        return;
    }
    int _230 = _73 + 80;
    uint _232 = uint(int(uint(_230) >> uint(2)));
    float _234 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_232)]);
    int _236 = _230 + 4;
    uint _238 = uint(int(uint(_236) >> uint(2)));
    float _240 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_238)]);
    int _242 = _186 + 16;
    uint _244 = uint(int(uint(_242) >> uint(2)));
    float _246 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_244)]);
    uint _248 = uint(int(uint(_212) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.cp_c4)._m0[int(_250)][_252];
    float _256 = _254 * _254;
    int _258 = _73 + 16;
    int _260 = _73 + 88;
    uint _262 = uint(int(uint(_260) >> uint(2)));
    float _264 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_262)]);
    float _266 = float2(as_type<half2>(as_type<uint>(_234))).x;
    float _268 = (-0.0) + _266;
    float _270 = float2(as_type<half2>(as_type<uint>(_234))).y;
    float _272 = (-0.0) + _270;
    float _274 = float2(as_type<half2>(as_type<uint>(_240))).x;
    float _276 = (-0.0) + _274;
    float _278 = _268 * _256;
    float _280 = float2(as_type<half2>(as_type<uint>(_240))).y;
    float _282 = (-0.0) + _280;
    float _284 = _272 * _256;
    int _286 = as_type<int>(_246) + (-1);
    float _288 = _276 * _256;
    float _290 = _278 * _278;
    float _292 = _284 * _284;
    float _294 = _282 * _256;
    float _296 = _288 * _288;
    int _298 = _73 + 32;
    bool _300 = _208 >= _290;
    bool _302 = isnan(_208);
    bool _304 = _300 || _302;
    bool _306 = isnan(_290);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = _294 * _294;
    bool _314 = _208 >= _292;
    bool _316 = isnan(_208);
    bool _318 = _314 || _316;
    bool _320 = isnan(_292);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    bool _326 = _208 >= _296;
    bool _328 = isnan(_208);
    bool _330 = _326 || _328;
    bool _332 = isnan(_296);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    uint _338 = uint(int(uint(_298) >> uint(2)));
    float _340 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_338)]);
    int _342 = _298 + 4;
    uint _344 = uint(int(uint(_342) >> uint(2)));
    float _346 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_344)]);
    int _348 = _298 + 8;
    uint _350 = uint(int(uint(_348) >> uint(2)));
    float _352 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_350)]);
    int _354 = _298 + 12;
    uint _356 = uint(int(uint(_354) >> uint(2)));
    float _358 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_356)]);
    bool _360 = _208 >= _312;
    bool _362 = isnan(_208);
    bool _364 = _360 || _362;
    bool _366 = isnan(_312);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = _310 + _324;
    float _374 = _336 + _372;
    float _376 = _370 + _374;
    uint _378 = uint(int(uint(_258) >> uint(2)));
    float _380 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_378)]);
    int _382 = _258 + 4;
    uint _384 = uint(int(uint(_382) >> uint(2)));
    float _386 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_384)]);
    int _388 = _258 + 8;
    uint _390 = uint(int(uint(_388) >> uint(2)));
    float _392 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_390)]);
    int _394 = _258 + 12;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    float _398 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_396)]);
    float _400 = trunc(_376);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    int _406 = int(_404) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    uint _408 = min(uint(_286), uint(_406));
    int _410 = as_type<int>(_172) << 2;
    int _412 = _410 + int(_408);
    int _414 = _412 << 3;
    uint _416 = uint(int(uint(_73) >> uint(2)));
    float _418 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_416)]);
    int _420 = _73 + 4;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_422)]);
    int _426 = _73 + 8;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    float _430 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_428)]);
    int _432 = _73 + 12;
    uint _434 = uint(int(uint(_432) >> uint(2)));
    float _436 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_434)]);
    int _438 = _414 + 4;
    int _440 = _438 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    bool _442 = uint(_440) < uint(_438);
    int _444 = int(_442);
    bool _446 = uint(_440) < uint(_440);
    int _448 = int(_446);
    int _450 = _444 + _448;
    int _452 = _450 & 1;
    bool _454 = _452 != 0;
    int _456 = int(_454);
    int _458 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].y) + _456;
    uint _460 = spvSubgroupBallot(true).x;
    float _462 = spvSubgroupShuffle(as_type<float>(_440), 0u);
    bool _464 = as_type<int>(_462) == _440;
    float _466 = spvSubgroupShuffle(as_type<float>(_458), 0u);
    bool _468 = as_type<int>(_466) == _458;
    bool _470 = _464 && _468;
    int _472 = int(_470);
    float _474 = spvSubgroupShuffle(as_type<float>(_440), 1u);
    bool _476 = as_type<int>(_474) == _440;
    float _478 = spvSubgroupShuffle(as_type<float>(_458), 1u);
    bool _480 = as_type<int>(_478) == _458;
    bool _482 = _476 && _480;
    int _484 = _482 ? 2 : 0;
    int _486 = _472 | _484;
    float _488 = spvSubgroupShuffle(as_type<float>(_440), 2u);
    bool _490 = as_type<int>(_488) == _440;
    float _492 = spvSubgroupShuffle(as_type<float>(_458), 2u);
    bool _494 = as_type<int>(_492) == _458;
    bool _496 = _490 && _494;
    int _498 = _496 ? 4 : 0;
    int _500 = _486 | _498;
    float _502 = spvSubgroupShuffle(as_type<float>(_440), 3u);
    bool _504 = as_type<int>(_502) == _440;
    float _506 = spvSubgroupShuffle(as_type<float>(_458), 3u);
    bool _508 = as_type<int>(_506) == _458;
    bool _510 = _504 && _508;
    int _512 = _510 ? 8 : 0;
    int _514 = _500 | _512;
    float _516 = spvSubgroupShuffle(as_type<float>(_440), 4u);
    bool _518 = as_type<int>(_516) == _440;
    float _520 = spvSubgroupShuffle(as_type<float>(_458), 4u);
    bool _522 = as_type<int>(_520) == _458;
    bool _524 = _518 && _522;
    int _526 = _524 ? 16 : 0;
    int _528 = _514 | _526;
    float _530 = spvSubgroupShuffle(as_type<float>(_440), 5u);
    bool _532 = as_type<int>(_530) == _440;
    float _534 = spvSubgroupShuffle(as_type<float>(_458), 5u);
    bool _536 = as_type<int>(_534) == _458;
    bool _538 = _532 && _536;
    int _540 = _538 ? 32 : 0;
    int _542 = _528 | _540;
    float _544 = spvSubgroupShuffle(as_type<float>(_440), 6u);
    bool _546 = as_type<int>(_544) == _440;
    float _548 = spvSubgroupShuffle(as_type<float>(_458), 6u);
    bool _550 = as_type<int>(_548) == _458;
    bool _552 = _546 && _550;
    int _554 = _552 ? 64 : 0;
    int _556 = _542 | _554;
    float _558 = spvSubgroupShuffle(as_type<float>(_440), 7u);
    bool _560 = as_type<int>(_558) == _440;
    float _562 = spvSubgroupShuffle(as_type<float>(_458), 7u);
    bool _564 = as_type<int>(_562) == _458;
    bool _566 = _560 && _564;
    int _568 = _566 ? 128 : 0;
    int _570 = _556 | _568;
    float _572 = spvSubgroupShuffle(as_type<float>(_440), 8u);
    bool _574 = as_type<int>(_572) == _440;
    float _576 = spvSubgroupShuffle(as_type<float>(_458), 8u);
    bool _578 = as_type<int>(_576) == _458;
    bool _580 = _574 && _578;
    int _582 = _580 ? 256 : 0;
    int _584 = _570 | _582;
    float _586 = spvSubgroupShuffle(as_type<float>(_440), 9u);
    bool _588 = as_type<int>(_586) == _440;
    float _590 = spvSubgroupShuffle(as_type<float>(_458), 9u);
    bool _592 = as_type<int>(_590) == _458;
    bool _594 = _588 && _592;
    int _596 = _594 ? 512 : 0;
    int _598 = _584 | _596;
    float _600 = spvSubgroupShuffle(as_type<float>(_440), 10u);
    bool _602 = as_type<int>(_600) == _440;
    float _604 = spvSubgroupShuffle(as_type<float>(_458), 10u);
    bool _606 = as_type<int>(_604) == _458;
    bool _608 = _602 && _606;
    int _610 = _608 ? 1024 : 0;
    int _612 = _598 | _610;
    float _614 = spvSubgroupShuffle(as_type<float>(_440), 11u);
    bool _616 = as_type<int>(_614) == _440;
    float _618 = spvSubgroupShuffle(as_type<float>(_458), 11u);
    bool _620 = as_type<int>(_618) == _458;
    bool _622 = _616 && _620;
    int _624 = _622 ? 2048 : 0;
    int _626 = _612 | _624;
    float _628 = spvSubgroupShuffle(as_type<float>(_440), 12u);
    bool _630 = as_type<int>(_628) == _440;
    float _632 = spvSubgroupShuffle(as_type<float>(_458), 12u);
    bool _634 = as_type<int>(_632) == _458;
    bool _636 = _630 && _634;
    int _638 = _636 ? 4096 : 0;
    int _640 = _626 | _638;
    float _642 = spvSubgroupShuffle(as_type<float>(_440), 13u);
    bool _644 = as_type<int>(_642) == _440;
    float _646 = spvSubgroupShuffle(as_type<float>(_458), 13u);
    bool _648 = as_type<int>(_646) == _458;
    bool _650 = _644 && _648;
    int _652 = _650 ? 8192 : 0;
    int _654 = _640 | _652;
    float _656 = spvSubgroupShuffle(as_type<float>(_440), 14u);
    bool _658 = as_type<int>(_656) == _440;
    float _660 = spvSubgroupShuffle(as_type<float>(_458), 14u);
    bool _662 = as_type<int>(_660) == _458;
    bool _664 = _658 && _662;
    int _666 = _664 ? 16384 : 0;
    int _668 = _654 | _666;
    float _670 = spvSubgroupShuffle(as_type<float>(_440), 15u);
    bool _672 = as_type<int>(_670) == _440;
    float _674 = spvSubgroupShuffle(as_type<float>(_458), 15u);
    bool _676 = as_type<int>(_674) == _458;
    bool _678 = _672 && _676;
    int _680 = _678 ? 32768 : 0;
    int _682 = _668 | _680;
    float _684 = spvSubgroupShuffle(as_type<float>(_440), 16u);
    bool _686 = as_type<int>(_684) == _440;
    float _688 = spvSubgroupShuffle(as_type<float>(_458), 16u);
    bool _690 = as_type<int>(_688) == _458;
    bool _692 = _686 && _690;
    int _694 = _692 ? 65536 : 0;
    int _696 = _682 | _694;
    float _698 = spvSubgroupShuffle(as_type<float>(_440), 17u);
    bool _700 = as_type<int>(_698) == _440;
    float _702 = spvSubgroupShuffle(as_type<float>(_458), 17u);
    bool _704 = as_type<int>(_702) == _458;
    bool _706 = _700 && _704;
    int _708 = _706 ? 131072 : 0;
    int _710 = _696 | _708;
    float _712 = spvSubgroupShuffle(as_type<float>(_440), 18u);
    bool _714 = as_type<int>(_712) == _440;
    float _716 = spvSubgroupShuffle(as_type<float>(_458), 18u);
    bool _718 = as_type<int>(_716) == _458;
    bool _720 = _714 && _718;
    int _722 = _720 ? 262144 : 0;
    int _724 = _710 | _722;
    float _726 = spvSubgroupShuffle(as_type<float>(_440), 19u);
    bool _728 = as_type<int>(_726) == _440;
    float _730 = spvSubgroupShuffle(as_type<float>(_458), 19u);
    bool _732 = as_type<int>(_730) == _458;
    bool _734 = _728 && _732;
    int _736 = _734 ? 524288 : 0;
    int _738 = _724 | _736;
    float _740 = spvSubgroupShuffle(as_type<float>(_440), 20u);
    bool _742 = as_type<int>(_740) == _440;
    float _744 = spvSubgroupShuffle(as_type<float>(_458), 20u);
    bool _746 = as_type<int>(_744) == _458;
    bool _748 = _742 && _746;
    int _750 = _748 ? 1048576 : 0;
    int _752 = _738 | _750;
    float _754 = spvSubgroupShuffle(as_type<float>(_440), 21u);
    bool _756 = as_type<int>(_754) == _440;
    float _758 = spvSubgroupShuffle(as_type<float>(_458), 21u);
    bool _760 = as_type<int>(_758) == _458;
    bool _762 = _756 && _760;
    int _764 = _762 ? 2097152 : 0;
    int _766 = _752 | _764;
    float _768 = spvSubgroupShuffle(as_type<float>(_440), 22u);
    bool _770 = as_type<int>(_768) == _440;
    float _772 = spvSubgroupShuffle(as_type<float>(_458), 22u);
    bool _774 = as_type<int>(_772) == _458;
    bool _776 = _770 && _774;
    int _778 = _776 ? 4194304 : 0;
    int _780 = _766 | _778;
    float _782 = spvSubgroupShuffle(as_type<float>(_440), 23u);
    bool _784 = as_type<int>(_782) == _440;
    float _786 = spvSubgroupShuffle(as_type<float>(_458), 23u);
    bool _788 = as_type<int>(_786) == _458;
    bool _790 = _784 && _788;
    int _792 = _790 ? 8388608 : 0;
    int _794 = _780 | _792;
    float _796 = spvSubgroupShuffle(as_type<float>(_440), 24u);
    bool _798 = as_type<int>(_796) == _440;
    float _800 = spvSubgroupShuffle(as_type<float>(_458), 24u);
    bool _802 = as_type<int>(_800) == _458;
    bool _804 = _798 && _802;
    int _806 = _804 ? 16777216 : 0;
    int _808 = _794 | _806;
    float _810 = spvSubgroupShuffle(as_type<float>(_440), 25u);
    bool _812 = as_type<int>(_810) == _440;
    float _814 = spvSubgroupShuffle(as_type<float>(_458), 25u);
    bool _816 = as_type<int>(_814) == _458;
    bool _818 = _812 && _816;
    int _820 = _818 ? 33554432 : 0;
    int _822 = _808 | _820;
    float _824 = spvSubgroupShuffle(as_type<float>(_440), 26u);
    bool _826 = as_type<int>(_824) == _440;
    float _828 = spvSubgroupShuffle(as_type<float>(_458), 26u);
    bool _830 = as_type<int>(_828) == _458;
    bool _832 = _826 && _830;
    int _834 = _832 ? 67108864 : 0;
    int _836 = _822 | _834;
    float _838 = spvSubgroupShuffle(as_type<float>(_440), 27u);
    bool _840 = as_type<int>(_838) == _440;
    float _842 = spvSubgroupShuffle(as_type<float>(_458), 27u);
    bool _844 = as_type<int>(_842) == _458;
    bool _846 = _840 && _844;
    int _848 = _846 ? 134217728 : 0;
    int _850 = _836 | _848;
    float _852 = spvSubgroupShuffle(as_type<float>(_440), 28u);
    bool _854 = as_type<int>(_852) == _440;
    float _856 = spvSubgroupShuffle(as_type<float>(_458), 28u);
    bool _858 = as_type<int>(_856) == _458;
    bool _860 = _854 && _858;
    int _862 = _860 ? 268435456 : 0;
    int _864 = _850 | _862;
    float _866 = spvSubgroupShuffle(as_type<float>(_440), 29u);
    bool _868 = as_type<int>(_866) == _440;
    float _870 = spvSubgroupShuffle(as_type<float>(_458), 29u);
    bool _872 = as_type<int>(_870) == _458;
    bool _874 = _868 && _872;
    int _876 = _874 ? 536870912 : 0;
    int _878 = _864 | _876;
    float _880 = spvSubgroupShuffle(as_type<float>(_440), 30u);
    bool _882 = as_type<int>(_880) == _440;
    float _884 = spvSubgroupShuffle(as_type<float>(_458), 30u);
    bool _886 = as_type<int>(_884) == _458;
    bool _888 = _882 && _886;
    int _890 = _888 ? 1073741824 : 0;
    int _892 = _878 | _890;
    float _894 = spvSubgroupShuffle(as_type<float>(_440), 31u);
    bool _896 = as_type<int>(_894) == _440;
    float _898 = spvSubgroupShuffle(as_type<float>(_458), 31u);
    bool _900 = as_type<int>(_898) == _458;
    bool _902 = _896 && _900;
    int _904 = _902 ? int(0x80000000) : 0;
    int _906 = _892 | _904;
    int _908 = _906 & int(_460);
    bool _910 = _908 == int(_460);
    int _912 = 0;
    if (!_910)
    {
        uint _914 = uint(int(uint(_438) >> uint(2)));
        uint _2563 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_914)], 1u, memory_order_relaxed);
        uint _916 = _2563;
        _912 = int(_916);
    }
    int _918 = _912;
    bool _920 = !_910;
    int _922 = _918;
    if (!_920)
    {
        float _924 = as_type<float>(gl_SubgroupInvocationID);
        uint _926 = spvSubgroupBallot(true).x;
        int _928 = int(spvFindUMSB(_926));
        int _930 = popcount(int(_926));
        bool _932 = _928 == as_type<int>(_924);
        int _934 = _930;
        if (_932)
        {
            uint _936 = uint(int(uint(_438) >> uint(2)));
            uint _2599 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_936)], uint(_930), memory_order_relaxed);
            uint _938 = _2599;
            _934 = int(_938);
        }
        int _940 = _934;
        float _942 = as_type<float>(gl_SubgroupLtMask.x);
        int _944 = as_type<int>(_942) & int(_926);
        int _946 = popcount(_944);
        int _948 = _940;
        int _950 = _928;
        int _952 = 31;
        int _954;
        int _2617 = _55(_948, _950, _952, _954, gl_SubgroupInvocationID);
        int _956 = _2617;
        int _958 = _956 + _946;
        _922 = _958;
    }
    int _960 = _922;
    uint _962 = uint(int(uint(_414) >> uint(2)));
    float _964 = as_type<float>((*spvDescriptorSet0.cp_s3)._m0[int(_962)]);
    int _966 = as_type<int>(_436) * 1664525;
    int _968 = _966 + 1013904223;
    int _970 = as_type<int>(_398) * 1664525;
    int _972 = _970 + 1013904223;
    int _974 = as_type<int>(_358) * 1664525;
    int _976 = _974 + 1013904223;
    uint _978 = uint(int(uint(as_type<int>(_264)) >> uint(16)));
    int _980 = _972 * _976;
    int _982 = _980 + _968;
    int _984 = _976 * _982;
    int _986 = _984 + _972;
    uint _988 = uint(int(uint(_982) >> uint(16)));
    int _990 = _982 * _986;
    int _992 = _990 + _976;
    uint _994 = uint(int(uint(_986) >> uint(16)));
    int _996 = _982 ^ int(_988);
    uint _998 = uint(int(uint(_992) >> uint(16)));
    int _1000 = _986 ^ int(_994);
    int _1002 = _992 ^ int(_998);
    int _1004 = _1000 * _1002;
    int _1006 = _1004 + _996;
    int _1008 = as_type<int>(_264) & 65535;
    uint _1010 = uint(int(uint(_1006) >> uint(9)));
    int _1012 = int(_1010) + 1065353216;
    float _1014 = as_type<float>(_1012) + (-1.0);
    int _1016 = _960 + as_type<int>(_964);
    int _1018 = _1016 * 80;
    int _1020 = _1018 + 16;
    uint _1022 = uint(int(uint(_1018) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1022)] = as_type<uint>(_418);
    int _1024 = _1018 + 4;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1026)] = as_type<uint>(_424);
    int _1028 = _1018 + 8;
    uint _1030 = uint(int(uint(_1028) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1030)] = as_type<uint>(_430);
    int _1032 = _1018 + 12;
    uint _1034 = uint(int(uint(_1032) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1034)] = as_type<uint>(_436);
    int _1036 = _1018 + 32;
    int _1038 = _1018 + 48;
    uint _1040 = uint(int(uint(_1020) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1040)] = as_type<uint>(_380);
    int _1042 = _1020 + 4;
    uint _1044 = uint(int(uint(_1042) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1044)] = as_type<uint>(_386);
    int _1046 = _1020 + 8;
    uint _1048 = uint(int(uint(_1046) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1048)] = as_type<uint>(_392);
    int _1050 = _1020 + 12;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1052)] = as_type<uint>(_398);
    int _1054 = _1018 + 64;
    uint _1056 = uint(int(uint(_1036) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1056)] = as_type<uint>(_340);
    int _1058 = _1036 + 4;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1060)] = as_type<uint>(_346);
    int _1062 = _1036 + 8;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1064)] = as_type<uint>(_352);
    int _1066 = _1036 + 12;
    uint _1068 = uint(int(uint(_1066) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1068)] = as_type<uint>(_358);
    uint _1070 = uint(int(uint(_1038) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1070)] = as_type<uint>(_1014);
    int _1072 = _1038 + 4;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1074)] = _978;
    int _1076 = _1038 + 8;
    uint _1078 = uint(int(uint(_1076) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1078)] = uint(_1008);
    int _1080 = _1038 + 12;
    uint _1082 = uint(int(uint(_1080) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1082)] = as_type<uint>(_178);
    uint _1084 = uint(int(uint(_1054) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1084)] = 1065353216u;
    int _1086 = _1054 + 4;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1088)] = as_type<uint>(_160);
    int _1090 = _1054 + 8;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1092)] = as_type<uint>(_166);
    int _1094 = _1054 + 12;
    uint _1096 = uint(int(uint(_1094) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1096)] = as_type<uint>(_172);
}

