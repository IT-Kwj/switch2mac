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
    device _23* cp_s4 [[id(6)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _2795, thread const int& _2796, thread const int& _2797, thread int& _2798, thread uint& gl_SubgroupInvocationID)
{
    int _2801 = _2797 & 31;
    uint _2803 = uint(int(uint(_2797) >> uint(8)));
    int _2805 = int(_2803) & 31;
    float _2807 = as_type<float>(gl_SubgroupInvocationID);
    int _2809 = as_type<int>(_2807) & _2805;
    int _2811 = ~_2805;
    int _2813 = _2801 & _2811;
    int _2815 = _2813 | _2809;
    int _2817 = ~_2805;
    int _2819 = _2796 & _2817;
    int _2821 = _2819 | _2809;
    bool _2823 = uint(_2821) <= uint(_2815);
    _2798 = _2823 ? (-1) : 0;
    float _2825 = spvSubgroupShuffle(as_type<float>(_2795), uint(_2821));
    uint _2827 = uint(_2823 ? as_type<int>(_2825) : _2795);
    return int(_2827);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    int _61 = as_type<int>(_57) * 64;
    int _63 = _61 + as_type<int>(_59);
    bool _67 = _63 != 0;
    if (!_67)
    {
        bool _69 = 0u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        bool _71 = !_69;
        if (!_71)
        {
            bool _73 = 0u >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _75 = 0;
            uint _78 = 0u;
            int _80 = 0;
            if (_73)
            {
                _75 = 0;
            }
            int _82 = _75;
            uint _84 = 0u;
            if (_73)
            {
                int _86 = _82 + 16;
                _84 = uint(_86);
            }
            uint _88 = _84;
            uint _90 = 0u;
            if (_73)
            {
                int _92 = _82 + 4;
                _90 = uint(_92);
            }
            uint _94 = _90;
            if (_73)
            {
                uint _96 = uint(int(uint(int(_88)) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_96)] = 0u;
            }
            int _98 = 0;
            if (_73)
            {
                uint _100 = uint(int(uint(int(_94)) >> uint(2)));
                float _102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_100)]);
                _98 = as_type<int>(_102);
            }
            int _104 = _98;
            if (_73)
            {
                _78 = 1u;
            }
            uint _106 = _78;
            bool _108 = _106 >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _110 = ~int(_106);
            int _112 = _110 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _114 = _112 + 1;
            bool _116 = uint(_114) <= 3u;
            bool _118 = _116 || _108;
            bool _120 = !_73;
            int _122 = int(_106);
            uint _124 = _106;
            int _126 = _120 ? (-1) : 0;
            if (_73)
            {
                _80 = _104;
            }
            int _128 = _80;
            int _130 = _128;
            int _132 = _128;
            if (!_118)
            {
                int _134 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x) + (-3);
                _126 = 0;
                bool _136;
                do
                {
                    int _138 = _122;
                    int _140 = _130;
                    int _142 = _138 * 20;
                    int _144 = _142 + 16;
                    int _146 = _142 + 4;
                    uint _148 = uint(int(uint(_144) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_148)] = uint(_140);
                    uint _150 = uint(int(uint(_146) >> uint(2)));
                    float _152 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_150)]);
                    int _154 = _142 + 36;
                    int _156 = _142 + 24;
                    int _158 = as_type<int>(_152) + _140;
                    uint _160 = uint(int(uint(_154) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_160)] = uint(_158);
                    uint _162 = uint(int(uint(_156) >> uint(2)));
                    float _164 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_162)]);
                    int _166 = _142 + 56;
                    int _168 = _142 + 44;
                    int _170 = _158 + as_type<int>(_164);
                    uint _172 = uint(int(uint(_166) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_172)] = uint(_170);
                    uint _174 = uint(int(uint(_168) >> uint(2)));
                    float _176 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_174)]);
                    int _178 = _142 + 76;
                    int _180 = _142 + 64;
                    int _182 = _138 + 4;
                    bool _184 = uint(_182) >= uint(_134);
                    int _186 = _170 + as_type<int>(_176);
                    uint _188 = uint(int(uint(_178) >> uint(2)));
                    (*spvDescriptorSet0.cp_s0)._m0[int(_188)] = uint(_186);
                    uint _190 = uint(int(uint(_180) >> uint(2)));
                    float _192 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_190)]);
                    int _194 = _186 + as_type<int>(_192);
                    _136 = !_184;
                    _122 = _182;
                    _130 = _194;
                    _124 = uint(_182);
                    _132 = _194;
                } while (_136);
            }
            uint _196 = _124;
            int _198 = _132;
            int _200 = _126;
            bool _202 = _196 >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _204 = ~int(_196);
            int _206 = _204 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _208 = _206 + 1;
            bool _210 = uint(_208) <= 1u;
            bool _212 = _210 || _202;
            uint _214 = _196;
            int _216 = _200;
            int _218 = _208;
            int _220 = _198;
            if (!_212)
            {
                int _222 = int(_196) * 20;
                int _224 = _222 + 16;
                int _226 = _222 + 4;
                uint _228 = uint(int(uint(_224) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_228)] = uint(_198);
                uint _230 = uint(int(uint(_226) >> uint(2)));
                float _232 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_230)]);
                int _234 = _222 + 36;
                int _236 = _222 + 24;
                int _238 = _198 + as_type<int>(_232);
                uint _240 = uint(int(uint(_234) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_240)] = uint(_238);
                uint _242 = uint(int(uint(_236) >> uint(2)));
                float _244 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_242)]);
                int _246 = int(_196) + 2;
                int _248 = _238 + as_type<int>(_244);
                _214 = uint(_246);
                _216 = 0;
                _218 = _234;
                _220 = _248;
            }
            uint _250 = _214;
            int _252 = _216;
            int _254 = _218;
            int _256 = _220;
            bool _258 = _250 < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _260 = (_258 ? (-1) : 0) | _252;
            int _262 = _254;
            uint _264 = _250;
            if (_260 != 0)
            {
                _262 = 20;
            }
            int _266 = _262;
            if (_260 != 0)
            {
                int _268 = int(_250) * _266;
                int _270 = _268 + 16;
                _264 = uint(_270);
            }
            uint _272 = _264;
            if (_260 != 0)
            {
                uint _274 = uint(int(uint(int(_272)) >> uint(2)));
                (*spvDescriptorSet0.cp_s0)._m0[int(_274)] = uint(_256);
            }
        }
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup | mem_flags::mem_texture);
    float _276 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[0]);
    bool _278 = uint(_63) >= as_type<uint>(_276);
    if (_278)
    {
        return;
    }
    int _280 = _63 * 48;
    int _282 = _280 + 32;
    uint _284 = uint(int(uint(_282) >> uint(2)));
    float _286 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_284)]);
    int _288 = _282 + 8;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_290)]);
    int _294 = _282 + 12;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_296)]);
    int _300 = _280 + 16;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_302)]);
    int _306 = _300 + 4;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    float _310 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_308)]);
    int _312 = _300 + 8;
    uint _314 = uint(int(uint(_312) >> uint(2)));
    float _316 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_314)]);
    int _318 = _300 + 12;
    uint _320 = uint(int(uint(_318) >> uint(2)));
    float _322 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_320)]);
    int _324 = as_type<int>(_298) << 2;
    int _326 = _324 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].x);
    bool _328 = uint(_326) < uint(_324);
    int _330 = as_type<int>(_298) * 20;
    int _332 = _330 + 16;
    uint _334 = uint(int(uint(_280) >> uint(2)));
    float _336 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_334)]);
    int _338 = _280 + 4;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    float _342 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_340)]);
    int _344 = _280 + 8;
    uint _346 = uint(int(uint(_344) >> uint(2)));
    float _348 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_346)]);
    int _350 = _280 + 12;
    uint _352 = uint(int(uint(_350) >> uint(2)));
    float _354 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_352)]);
    int _356 = int(_328);
    int _358 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].y) + _356;
    uint _360 = spvSubgroupBallot(true).x;
    float _362 = spvSubgroupShuffle(as_type<float>(_326), 0u);
    bool _364 = as_type<int>(_362) == _326;
    float _366 = spvSubgroupShuffle(as_type<float>(_358), 0u);
    bool _368 = as_type<int>(_366) == _358;
    bool _370 = _364 && _368;
    int _372 = int(_370);
    float _374 = spvSubgroupShuffle(as_type<float>(_326), 1u);
    bool _376 = as_type<int>(_374) == _326;
    float _378 = spvSubgroupShuffle(as_type<float>(_358), 1u);
    bool _380 = as_type<int>(_378) == _358;
    bool _382 = _376 && _380;
    int _384 = _382 ? 2 : 0;
    int _386 = _372 | _384;
    float _388 = spvSubgroupShuffle(as_type<float>(_326), 2u);
    bool _390 = as_type<int>(_388) == _326;
    float _392 = spvSubgroupShuffle(as_type<float>(_358), 2u);
    bool _394 = as_type<int>(_392) == _358;
    bool _396 = _390 && _394;
    int _398 = _396 ? 4 : 0;
    int _400 = _386 | _398;
    float _402 = spvSubgroupShuffle(as_type<float>(_326), 3u);
    bool _404 = as_type<int>(_402) == _326;
    float _406 = spvSubgroupShuffle(as_type<float>(_358), 3u);
    bool _408 = as_type<int>(_406) == _358;
    bool _410 = _404 && _408;
    int _412 = _410 ? 8 : 0;
    int _414 = _400 | _412;
    float _416 = spvSubgroupShuffle(as_type<float>(_326), 4u);
    bool _418 = as_type<int>(_416) == _326;
    float _420 = spvSubgroupShuffle(as_type<float>(_358), 4u);
    bool _422 = as_type<int>(_420) == _358;
    bool _424 = _418 && _422;
    int _426 = _424 ? 16 : 0;
    int _428 = _414 | _426;
    float _430 = spvSubgroupShuffle(as_type<float>(_326), 5u);
    bool _432 = as_type<int>(_430) == _326;
    float _434 = spvSubgroupShuffle(as_type<float>(_358), 5u);
    bool _436 = as_type<int>(_434) == _358;
    bool _438 = _432 && _436;
    int _440 = _438 ? 32 : 0;
    int _442 = _428 | _440;
    float _444 = spvSubgroupShuffle(as_type<float>(_326), 6u);
    bool _446 = as_type<int>(_444) == _326;
    float _448 = spvSubgroupShuffle(as_type<float>(_358), 6u);
    bool _450 = as_type<int>(_448) == _358;
    bool _452 = _446 && _450;
    int _454 = _452 ? 64 : 0;
    int _456 = _442 | _454;
    float _458 = spvSubgroupShuffle(as_type<float>(_326), 7u);
    bool _460 = as_type<int>(_458) == _326;
    float _462 = spvSubgroupShuffle(as_type<float>(_358), 7u);
    bool _464 = as_type<int>(_462) == _358;
    bool _466 = _460 && _464;
    int _468 = _466 ? 128 : 0;
    int _470 = _456 | _468;
    float _472 = spvSubgroupShuffle(as_type<float>(_326), 8u);
    bool _474 = as_type<int>(_472) == _326;
    float _476 = spvSubgroupShuffle(as_type<float>(_358), 8u);
    bool _478 = as_type<int>(_476) == _358;
    bool _480 = _474 && _478;
    int _482 = _480 ? 256 : 0;
    int _484 = _470 | _482;
    float _486 = spvSubgroupShuffle(as_type<float>(_326), 9u);
    bool _488 = as_type<int>(_486) == _326;
    float _490 = spvSubgroupShuffle(as_type<float>(_358), 9u);
    bool _492 = as_type<int>(_490) == _358;
    bool _494 = _488 && _492;
    int _496 = _494 ? 512 : 0;
    int _498 = _484 | _496;
    float _500 = spvSubgroupShuffle(as_type<float>(_326), 10u);
    bool _502 = as_type<int>(_500) == _326;
    float _504 = spvSubgroupShuffle(as_type<float>(_358), 10u);
    bool _506 = as_type<int>(_504) == _358;
    bool _508 = _502 && _506;
    int _510 = _508 ? 1024 : 0;
    int _512 = _498 | _510;
    float _514 = spvSubgroupShuffle(as_type<float>(_326), 11u);
    bool _516 = as_type<int>(_514) == _326;
    float _518 = spvSubgroupShuffle(as_type<float>(_358), 11u);
    bool _520 = as_type<int>(_518) == _358;
    bool _522 = _516 && _520;
    int _524 = _522 ? 2048 : 0;
    int _526 = _512 | _524;
    float _528 = spvSubgroupShuffle(as_type<float>(_326), 12u);
    bool _530 = as_type<int>(_528) == _326;
    float _532 = spvSubgroupShuffle(as_type<float>(_358), 12u);
    bool _534 = as_type<int>(_532) == _358;
    bool _536 = _530 && _534;
    int _538 = _536 ? 4096 : 0;
    int _540 = _526 | _538;
    float _542 = spvSubgroupShuffle(as_type<float>(_326), 13u);
    bool _544 = as_type<int>(_542) == _326;
    float _546 = spvSubgroupShuffle(as_type<float>(_358), 13u);
    bool _548 = as_type<int>(_546) == _358;
    bool _550 = _544 && _548;
    int _552 = _550 ? 8192 : 0;
    int _554 = _540 | _552;
    float _556 = spvSubgroupShuffle(as_type<float>(_326), 14u);
    bool _558 = as_type<int>(_556) == _326;
    float _560 = spvSubgroupShuffle(as_type<float>(_358), 14u);
    bool _562 = as_type<int>(_560) == _358;
    bool _564 = _558 && _562;
    int _566 = _564 ? 16384 : 0;
    int _568 = _554 | _566;
    float _570 = spvSubgroupShuffle(as_type<float>(_326), 15u);
    bool _572 = as_type<int>(_570) == _326;
    float _574 = spvSubgroupShuffle(as_type<float>(_358), 15u);
    bool _576 = as_type<int>(_574) == _358;
    bool _578 = _572 && _576;
    int _580 = _578 ? 32768 : 0;
    int _582 = _568 | _580;
    float _584 = spvSubgroupShuffle(as_type<float>(_326), 16u);
    bool _586 = as_type<int>(_584) == _326;
    float _588 = spvSubgroupShuffle(as_type<float>(_358), 16u);
    bool _590 = as_type<int>(_588) == _358;
    bool _592 = _586 && _590;
    int _594 = _592 ? 65536 : 0;
    int _596 = _582 | _594;
    float _598 = spvSubgroupShuffle(as_type<float>(_326), 17u);
    bool _600 = as_type<int>(_598) == _326;
    float _602 = spvSubgroupShuffle(as_type<float>(_358), 17u);
    bool _604 = as_type<int>(_602) == _358;
    bool _606 = _600 && _604;
    int _608 = _606 ? 131072 : 0;
    int _610 = _596 | _608;
    float _612 = spvSubgroupShuffle(as_type<float>(_326), 18u);
    bool _614 = as_type<int>(_612) == _326;
    float _616 = spvSubgroupShuffle(as_type<float>(_358), 18u);
    bool _618 = as_type<int>(_616) == _358;
    bool _620 = _614 && _618;
    int _622 = _620 ? 262144 : 0;
    int _624 = _610 | _622;
    float _626 = spvSubgroupShuffle(as_type<float>(_326), 19u);
    bool _628 = as_type<int>(_626) == _326;
    float _630 = spvSubgroupShuffle(as_type<float>(_358), 19u);
    bool _632 = as_type<int>(_630) == _358;
    bool _634 = _628 && _632;
    int _636 = _634 ? 524288 : 0;
    int _638 = _624 | _636;
    float _640 = spvSubgroupShuffle(as_type<float>(_326), 20u);
    bool _642 = as_type<int>(_640) == _326;
    float _644 = spvSubgroupShuffle(as_type<float>(_358), 20u);
    bool _646 = as_type<int>(_644) == _358;
    bool _648 = _642 && _646;
    int _650 = _648 ? 1048576 : 0;
    int _652 = _638 | _650;
    float _654 = spvSubgroupShuffle(as_type<float>(_326), 21u);
    bool _656 = as_type<int>(_654) == _326;
    float _658 = spvSubgroupShuffle(as_type<float>(_358), 21u);
    bool _660 = as_type<int>(_658) == _358;
    bool _662 = _656 && _660;
    int _664 = _662 ? 2097152 : 0;
    int _666 = _652 | _664;
    float _668 = spvSubgroupShuffle(as_type<float>(_326), 22u);
    bool _670 = as_type<int>(_668) == _326;
    float _672 = spvSubgroupShuffle(as_type<float>(_358), 22u);
    bool _674 = as_type<int>(_672) == _358;
    bool _676 = _670 && _674;
    int _678 = _676 ? 4194304 : 0;
    int _680 = _666 | _678;
    float _682 = spvSubgroupShuffle(as_type<float>(_326), 23u);
    bool _684 = as_type<int>(_682) == _326;
    float _686 = spvSubgroupShuffle(as_type<float>(_358), 23u);
    bool _688 = as_type<int>(_686) == _358;
    bool _690 = _684 && _688;
    int _692 = _690 ? 8388608 : 0;
    int _694 = _680 | _692;
    float _696 = spvSubgroupShuffle(as_type<float>(_326), 24u);
    bool _698 = as_type<int>(_696) == _326;
    float _700 = spvSubgroupShuffle(as_type<float>(_358), 24u);
    bool _702 = as_type<int>(_700) == _358;
    bool _704 = _698 && _702;
    int _706 = _704 ? 16777216 : 0;
    int _708 = _694 | _706;
    float _710 = spvSubgroupShuffle(as_type<float>(_326), 25u);
    bool _712 = as_type<int>(_710) == _326;
    float _714 = spvSubgroupShuffle(as_type<float>(_358), 25u);
    bool _716 = as_type<int>(_714) == _358;
    bool _718 = _712 && _716;
    int _720 = _718 ? 33554432 : 0;
    int _722 = _708 | _720;
    float _724 = spvSubgroupShuffle(as_type<float>(_326), 26u);
    bool _726 = as_type<int>(_724) == _326;
    float _728 = spvSubgroupShuffle(as_type<float>(_358), 26u);
    bool _730 = as_type<int>(_728) == _358;
    bool _732 = _726 && _730;
    int _734 = _732 ? 67108864 : 0;
    int _736 = _722 | _734;
    float _738 = spvSubgroupShuffle(as_type<float>(_326), 27u);
    bool _740 = as_type<int>(_738) == _326;
    float _742 = spvSubgroupShuffle(as_type<float>(_358), 27u);
    bool _744 = as_type<int>(_742) == _358;
    bool _746 = _740 && _744;
    int _748 = _746 ? 134217728 : 0;
    int _750 = _736 | _748;
    float _752 = spvSubgroupShuffle(as_type<float>(_326), 28u);
    bool _754 = as_type<int>(_752) == _326;
    float _756 = spvSubgroupShuffle(as_type<float>(_358), 28u);
    bool _758 = as_type<int>(_756) == _358;
    bool _760 = _754 && _758;
    int _762 = _760 ? 268435456 : 0;
    int _764 = _750 | _762;
    float _766 = spvSubgroupShuffle(as_type<float>(_326), 29u);
    bool _768 = as_type<int>(_766) == _326;
    float _770 = spvSubgroupShuffle(as_type<float>(_358), 29u);
    bool _772 = as_type<int>(_770) == _358;
    bool _774 = _768 && _772;
    int _776 = _774 ? 536870912 : 0;
    int _778 = _764 | _776;
    float _780 = spvSubgroupShuffle(as_type<float>(_326), 30u);
    bool _782 = as_type<int>(_780) == _326;
    float _784 = spvSubgroupShuffle(as_type<float>(_358), 30u);
    bool _786 = as_type<int>(_784) == _358;
    bool _788 = _782 && _786;
    int _790 = _788 ? 1073741824 : 0;
    int _792 = _778 | _790;
    float _794 = spvSubgroupShuffle(as_type<float>(_326), 31u);
    bool _796 = as_type<int>(_794) == _326;
    float _798 = spvSubgroupShuffle(as_type<float>(_358), 31u);
    bool _800 = as_type<int>(_798) == _358;
    bool _802 = _796 && _800;
    int _804 = _802 ? int(0x80000000) : 0;
    int _806 = _792 | _804;
    int _808 = _806 & int(_360);
    bool _810 = _808 == int(_360);
    int _812 = 1;
    if (!_810)
    {
        uint _814 = uint(int(uint(_324) >> uint(2)));
        uint _2378 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_814)], 1u, memory_order_relaxed);
        uint _816 = _2378;
        _812 = int(_816);
    }
    int _818 = _812;
    bool _820 = !_810;
    int _822 = _818;
    if (!_820)
    {
        float _824 = as_type<float>(gl_SubgroupInvocationID);
        uint _826 = spvSubgroupBallot(true).x;
        int _828 = int(spvFindUMSB(_826));
        int _830 = popcount(int(_826));
        bool _832 = _828 == as_type<int>(_824);
        int _834 = _830;
        if (_832)
        {
            uint _836 = uint(int(uint(_324) >> uint(2)));
            uint _2415 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s3)._m0[int(_836)], uint(_830), memory_order_relaxed);
            uint _838 = _2415;
            _834 = int(_838);
        }
        int _840 = _834;
        float _842 = as_type<float>(gl_SubgroupLtMask.x);
        int _844 = as_type<int>(_842) & int(_826);
        int _846 = popcount(_844);
        int _848 = _840;
        int _850 = _828;
        int _852 = 31;
        int _854;
        int _2433 = _53(_848, _850, _852, _854, gl_SubgroupInvocationID);
        int _856 = _2433;
        int _858 = _856 + _846;
        _822 = _858;
    }
    int _860 = _822;
    uint _862 = uint(int(uint(_332) >> uint(2)));
    float _864 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_862)]);
    float _866 = _354 * _304;
    uint _868 = uint(int(uint(as_type<int>(_286)) >> uint(9)));
    int _870 = int(_868) + 1065353216;
    int _872 = as_type<int>(_292) & 65535;
    float _874 = fma(as_type<float>(_870), 6.28299999237060546875, -6.28299999237060546875);
    uint _876 = uint(int(uint(as_type<int>(_292)) >> uint(16)));
    float _878 = _874 * 0.15915493667125701904296875;
    float _880 = _878 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _878 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _316 * _882;
    float _890 = _310 * _882;
    float _892 = -_888;
    float _894 = fma(_304, _886, _892);
    float _896 = _310 * _886;
    float _898 = _894 * _894;
    float _900 = fma(_896, _896, _898);
    float _902 = fma(_890, _890, _900);
    float _904 = rsqrt(_902);
    float _906 = _890 * _904;
    float _908 = _896 * _904;
    float _910 = _894 * _904;
    float _912 = _304 * _906;
    float _914 = _316 * _910;
    float _916 = -_908;
    float _918 = -_912;
    float _920 = fma(_316, _916, _918);
    float _922 = -_908;
    float _924 = _310 * _922;
    float _926 = -_914;
    float _928 = fma(_310, _906, _926);
    float _930 = -_908;
    float _932 = _354 * _930;
    float _934 = _920 * _920;
    float _936 = -_924;
    float _938 = fma(_304, _910, _936);
    float _940 = fma(_928, _928, _934);
    float _942 = _354 * _310;
    float _944 = fma(_938, _938, _940);
    float _946 = _354 * _910;
    float _948 = rsqrt(_944);
    float _950 = _928 * _948;
    float _952 = _920 * _948;
    float _954 = _938 * _948;
    float _956 = _354 * _906;
    float _958 = _354 * _950;
    float _960 = _354 * _952;
    float _962 = _354 * _316;
    int _964 = _860 + as_type<int>(_864);
    float _966 = _354 * _954;
    int _968 = _964 * 80;
    int _970 = _968 + 16;
    uint _972 = uint(int(uint(_968) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_972)] = as_type<uint>(_958);
    int _974 = _968 + 4;
    uint _976 = uint(int(uint(_974) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_976)] = as_type<uint>(_866);
    int _978 = _968 + 8;
    uint _980 = uint(int(uint(_978) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_980)] = as_type<uint>(_932);
    int _982 = _968 + 12;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_984)] = as_type<uint>(_336);
    int _986 = _968 + 32;
    int _988 = _968 + 48;
    uint _990 = uint(int(uint(_970) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_990)] = as_type<uint>(_960);
    int _992 = _970 + 4;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_994)] = as_type<uint>(_942);
    int _996 = _970 + 8;
    uint _998 = uint(int(uint(_996) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_998)] = as_type<uint>(_946);
    int _1000 = _970 + 12;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1002)] = as_type<uint>(_342);
    int _1004 = _968 + 64;
    uint _1006 = uint(int(uint(_986) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1006)] = as_type<uint>(_966);
    int _1008 = _986 + 4;
    uint _1010 = uint(int(uint(_1008) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1010)] = as_type<uint>(_962);
    int _1012 = _986 + 8;
    uint _1014 = uint(int(uint(_1012) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1014)] = as_type<uint>(_956);
    int _1016 = _986 + 12;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1018)] = as_type<uint>(_348);
    uint _1020 = uint(int(uint(_988) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1020)] = 0u;
    int _1022 = _988 + 4;
    uint _1024 = uint(int(uint(_1022) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1024)] = uint(_872);
    int _1026 = _988 + 8;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1028)] = _876;
    int _1030 = _988 + 12;
    uint _1032 = uint(int(uint(_1030) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1032)] = 0u;
    uint _1034 = uint(int(uint(_1004) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1034)] = as_type<uint>(_322);
    int _1036 = _1004 + 4;
    uint _1038 = uint(int(uint(_1036) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1038)] = 0u;
    int _1040 = _1004 + 8;
    uint _1042 = uint(int(uint(_1040) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1042)] = 0u;
    int _1044 = _1004 + 12;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    (*spvDescriptorSet0.cp_s4)._m0[int(_1046)] = 0u;
}

