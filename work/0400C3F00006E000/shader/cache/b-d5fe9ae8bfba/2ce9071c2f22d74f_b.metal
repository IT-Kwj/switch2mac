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
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    device _23* cp_s1 [[id(2)]];
    device _23* cp_s2 [[id(3)]];
};

static inline __attribute__((always_inline))
int _49(thread const int& _1310, thread const int& _1311, thread const int& _1312, thread int& _1313, thread uint& gl_SubgroupInvocationID)
{
    int _1316 = _1312 & 31;
    uint _1318 = uint(int(uint(_1312) >> uint(8)));
    int _1320 = int(_1318) & 31;
    float _1322 = as_type<float>(gl_SubgroupInvocationID);
    int _1324 = as_type<int>(_1322) & _1320;
    int _1326 = ~_1320;
    int _1328 = _1316 & _1326;
    int _1330 = _1328 | _1324;
    int _1332 = ~_1320;
    int _1334 = _1311 & _1332;
    int _1336 = _1334 | _1324;
    bool _1338 = uint(_1336) <= uint(_1330);
    _1313 = _1338 ? (-1) : 0;
    float _1340 = spvSubgroupShuffle(as_type<float>(_1310), uint(_1336));
    uint _1342 = uint(_1338 ? as_type<int>(_1340) : _1310);
    return int(_1342);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _53 = as_type<float>(gl_WorkGroupID.x);
    float _55 = as_type<float>(gl_LocalInvocationID.x);
    int _57 = as_type<int>(_53) << 6;
    int _59 = ~as_type<int>(_55);
    int _61 = _59 + 1;
    bool _65 = _61 != _57;
    int _67 = _61;
    if (!_65)
    {
        _67 = 1;
    }
    int _69 = _67;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    int _71 = as_type<int>(_55) + _57;
    int _73 = _71 * 96;
    int _75 = _73 + 64;
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
    int _100 = _73 + 16;
    bool _102 = as_type<int>(_92) != (-1);
    if (!_102)
    {
        return;
    }
    uint _104 = uint(int(uint(_100) >> uint(2)));
    float _106 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_104)]);
    int _108 = _100 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_110)]);
    int _114 = _100 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_116)]);
    int _120 = _100 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_122)]);
    uint _126 = uint(int(uint(_73) >> uint(2)));
    float _128 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_126)]);
    int _130 = _73 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_132)]);
    int _136 = _73 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_138)]);
    int _142 = _73 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_144)]);
    int _148 = _73 + 32;
    uint _150 = uint(int(uint(_148) >> uint(2)));
    float _152 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_150)]);
    int _154 = _148 + 4;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    float _158 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_156)]);
    int _160 = _148 + 8;
    uint _162 = uint(int(uint(_160) >> uint(2)));
    float _164 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_162)]);
    int _166 = _148 + 12;
    uint _168 = uint(int(uint(_166) >> uint(2)));
    float _170 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_168)]);
    int _172 = _73 + 92;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_174)]);
    float _178 = -_124;
    float _180 = _178 + (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _182 = -_124;
    float _184 = _182 + (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _186 = -_146;
    float _188 = _186 + (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _190 = _180 * _180;
    float _192 = -_146;
    float _194 = _192 + (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _196 = _184 * _184;
    float _198 = fma(_188, _188, _190);
    float _200 = -_124;
    float _202 = _200 + (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _204 = -_124;
    float _206 = _204 + (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _208 = fma(_194, _194, _196);
    float _210 = -_146;
    float _212 = _210 + (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _214 = _202 * _202;
    float _216 = _206 * _206;
    float _218 = -_170;
    float _220 = _218 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _222 = -_170;
    float _224 = _222 + (*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _226 = -_146;
    float _228 = _226 + (*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _230 = fma(_212, _212, _216);
    float _232 = fma(_220, _220, _198);
    float _234 = fma(_224, _224, _208);
    float _236 = -_124;
    float _238 = _236 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _240 = fma(_228, _228, _214);
    float _242 = -_170;
    float _244 = _242 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _246 = -_170;
    float _248 = _246 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _250 = -_146;
    float _252 = _250 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _254 = _238 * _238;
    float _256 = fma(_244, _244, _240);
    float _258 = fma(_248, _248, _230);
    float _260 = -_170;
    float _262 = _260 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _264 = fma(_252, _252, _254);
    float _266 = precise::min(_232, _234);
    float _268 = precise::min(_256, _258);
    float _270 = fma(_262, _262, _264);
    float _272 = _176 + 90.50966644287109375;
    int _274 = _73 + 48;
    float _276 = precise::min(_266, _268);
    float _278 = _272 * _272;
    int _280 = _73 + 88;
    float _282 = precise::min(_270, _276);
    bool _284 = _282 > _278;
    int _286 = _73 + 80;
    if (_284)
    {
        return;
    }
    float _288 = as_type<float>(gl_SubgroupInvocationID);
    uint _290 = uint(int(uint(_274) >> uint(2)));
    float _292 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_290)]);
    int _294 = _274 + 4;
    uint _296 = uint(int(uint(_294) >> uint(2)));
    float _298 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_296)]);
    int _300 = _274 + 8;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    float _304 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_302)]);
    int _306 = _274 + 12;
    uint _308 = uint(int(uint(_306) >> uint(2)));
    float _310 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_308)]);
    uint _312 = uint(int(uint(_286) >> uint(2)));
    float _314 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_312)]);
    int _316 = _286 + 4;
    uint _318 = uint(int(uint(_316) >> uint(2)));
    float _320 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_318)]);
    uint _322 = uint(int(uint(_280) >> uint(2)));
    float _324 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_322)]);
    uint _326 = spvSubgroupBallot(true).x;
    int _328 = reverse_bits(int(_326));
    int _330 = int(spvFindUMSB(uint(_328)));
    bool _332 = _330 != (-1);
    int _334 = _330 ^ 31;
    int _336 = _332 ? _334 : _330;
    bool _338 = as_type<int>(_288) != _336;
    int _340 = as_type<int>(_288);
    if (_338)
    {
        _340 = 0;
    }
    int _342 = _340;
    int _344 = _342;
    if (!_338)
    {
        int _346 = popcount(int(_326));
        uint _1019 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[0], uint(_346), memory_order_relaxed);
        uint _348 = _1019;
        int _350 = int(_348) + 63;
        int _352 = _350 + _346;
        uint _354 = uint(int(uint(_352) >> uint(6)));
        uint _1032 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[1], _354, memory_order_relaxed);
        uint _356 = _1032;
        _344 = int(_348);
    }
    int _358 = _344;
    uint _360 = spvSubgroupBallot(true).x;
    float _362 = as_type<float>(gl_SubgroupLtMask.x);
    int _364 = reverse_bits(int(_360));
    int _366 = int(spvFindUMSB(uint(_364)));
    bool _368 = _366 != (-1);
    int _370 = _366 ^ 31;
    int _372 = _368 ? _370 : _366;
    int _374 = as_type<int>(_362) & int(_326);
    int _376 = _358;
    int _378 = _372;
    int _380 = 31;
    int _382;
    int _1064 = _49(_376, _378, _380, _382, gl_SubgroupInvocationID);
    int _384 = _1064;
    int _386 = popcount(_374);
    int _388 = _384 + _386;
    int _390 = _388 * 96;
    int _392 = _390 + 16;
    uint _394 = uint(int(uint(_390) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_394)] = as_type<uint>(_128);
    int _396 = _390 + 4;
    uint _398 = uint(int(uint(_396) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_398)] = as_type<uint>(_134);
    int _400 = _390 + 8;
    uint _402 = uint(int(uint(_400) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_402)] = as_type<uint>(_140);
    int _404 = _390 + 12;
    uint _406 = uint(int(uint(_404) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_406)] = as_type<uint>(_146);
    int _408 = _390 + 32;
    int _410 = _390 + 48;
    uint _412 = uint(int(uint(_392) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_412)] = as_type<uint>(_106);
    int _414 = _392 + 4;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_416)] = as_type<uint>(_112);
    int _418 = _392 + 8;
    uint _420 = uint(int(uint(_418) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_420)] = as_type<uint>(_118);
    int _422 = _392 + 12;
    uint _424 = uint(int(uint(_422) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_424)] = as_type<uint>(_124);
    int _426 = _390 + 64;
    int _428 = _390 + 80;
    uint _430 = uint(int(uint(_408) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_430)] = as_type<uint>(_152);
    int _432 = _408 + 4;
    uint _434 = uint(int(uint(_432) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_434)] = as_type<uint>(_158);
    int _436 = _408 + 8;
    uint _438 = uint(int(uint(_436) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_438)] = as_type<uint>(_164);
    int _440 = _408 + 12;
    uint _442 = uint(int(uint(_440) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_442)] = as_type<uint>(_170);
    int _444 = _390 + 88;
    int _446 = _390 + 92;
    uint _448 = uint(int(uint(_410) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_448)] = as_type<uint>(_292);
    int _450 = _410 + 4;
    uint _452 = uint(int(uint(_450) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_452)] = as_type<uint>(_298);
    int _454 = _410 + 8;
    uint _456 = uint(int(uint(_454) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_456)] = as_type<uint>(_304);
    int _458 = _410 + 12;
    uint _460 = uint(int(uint(_458) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_460)] = as_type<uint>(_310);
    uint _462 = uint(int(uint(_426) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_462)] = as_type<uint>(_80);
    int _464 = _426 + 4;
    uint _466 = uint(int(uint(_464) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_466)] = as_type<uint>(_86);
    int _468 = _426 + 8;
    uint _470 = uint(int(uint(_468) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_470)] = as_type<uint>(_92);
    int _472 = _426 + 12;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_474)] = as_type<uint>(_98);
    uint _476 = uint(int(uint(_428) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_476)] = as_type<uint>(_314);
    int _478 = _428 + 4;
    uint _480 = uint(int(uint(_478) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_480)] = as_type<uint>(_320);
    uint _482 = uint(int(uint(_444) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_482)] = as_type<uint>(_324);
    uint _484 = uint(int(uint(_446) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_484)] = as_type<uint>(_176);
}

