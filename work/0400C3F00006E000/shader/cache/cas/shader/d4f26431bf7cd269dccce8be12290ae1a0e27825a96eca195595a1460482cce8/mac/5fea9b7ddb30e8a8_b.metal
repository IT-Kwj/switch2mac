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
int _49(thread const int& _1315, thread const int& _1316, thread const int& _1317, thread int& _1318, thread uint& gl_SubgroupInvocationID)
{
    int _1321 = _1317 & 31;
    uint _1323 = uint(int(uint(_1317) >> uint(8)));
    int _1325 = int(_1323) & 31;
    float _1327 = as_type<float>(gl_SubgroupInvocationID);
    int _1329 = as_type<int>(_1327) & _1325;
    int _1331 = ~_1325;
    int _1333 = _1321 & _1331;
    int _1335 = _1333 | _1329;
    int _1337 = ~_1325;
    int _1339 = _1316 & _1337;
    int _1341 = _1339 | _1329;
    bool _1343 = uint(_1341) <= uint(_1335);
    _1318 = _1343 ? (-1) : 0;
    float _1345 = spvSubgroupShuffle(as_type<float>(_1315), uint(_1341));
    uint _1347 = uint(_1343 ? as_type<int>(_1345) : _1315);
    return int(_1347);
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
    float _184 = _182 + (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _186 = -_124;
    float _188 = _186 + (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _190 = -_146;
    float _192 = _190 + (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _194 = _180 * _180;
    float _196 = -_146;
    float _198 = _196 + (*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _200 = -_146;
    float _202 = _200 + (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _204 = _184 * _184;
    float _206 = fma(_192, _192, _194);
    float _208 = -_124;
    float _210 = _208 + (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _212 = -_146;
    float _214 = _212 + (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _216 = _188 * _188;
    float _218 = _210 * _210;
    float _220 = -_170;
    float _222 = _220 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _224 = fma(_202, _202, _216);
    float _226 = -_124;
    float _228 = _226 + (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _230 = fma(_214, _214, _218);
    float _232 = fma(_222, _222, _206);
    float _234 = -_170;
    float _236 = _234 + (*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _238 = fma(_198, _198, _204);
    float _240 = -_170;
    float _242 = _240 + (*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _244 = -_170;
    float _246 = _244 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _248 = fma(_236, _236, _230);
    float _250 = -_146;
    float _252 = _250 + (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _254 = _228 * _228;
    float _256 = fma(_242, _242, _238);
    float _258 = fma(_246, _246, _224);
    float _260 = _176 + 90.50966644287109375;
    float _262 = precise::min(_232, _248);
    float _264 = fma(_252, _252, _254);
    float _266 = -_170;
    float _268 = _266 + (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _270 = precise::min(_256, _258);
    float _272 = precise::max(_260, 2000.0);
    float _274 = fma(_268, _268, _264);
    float _276 = precise::min(_262, _270);
    int _278 = _73 + 48;
    float _280 = _272 * _272;
    float _282 = precise::min(_274, _276);
    int _284 = _73 + 88;
    bool _286 = _282 > _280;
    int _288 = _73 + 80;
    if (_286)
    {
        return;
    }
    float _290 = as_type<float>(gl_SubgroupInvocationID);
    uint _292 = uint(int(uint(_278) >> uint(2)));
    float _294 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_292)]);
    int _296 = _278 + 4;
    uint _298 = uint(int(uint(_296) >> uint(2)));
    float _300 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_298)]);
    int _302 = _278 + 8;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_304)]);
    int _308 = _278 + 12;
    uint _310 = uint(int(uint(_308) >> uint(2)));
    float _312 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_310)]);
    uint _314 = uint(int(uint(_288) >> uint(2)));
    float _316 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_314)]);
    int _318 = _288 + 4;
    uint _320 = uint(int(uint(_318) >> uint(2)));
    float _322 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_320)]);
    uint _324 = uint(int(uint(_284) >> uint(2)));
    float _326 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_324)]);
    uint _328 = spvSubgroupBallot(true).x;
    int _330 = reverse_bits(int(_328));
    int _332 = int(spvFindUMSB(uint(_330)));
    bool _334 = _332 != (-1);
    int _336 = _332 ^ 31;
    int _338 = _334 ? _336 : _332;
    bool _340 = as_type<int>(_290) != _338;
    int _342 = as_type<int>(_290);
    if (_340)
    {
        _342 = 0;
    }
    int _344 = _342;
    int _346 = _344;
    if (!_340)
    {
        int _348 = popcount(int(_328));
        uint _1024 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[0], uint(_348), memory_order_relaxed);
        uint _350 = _1024;
        int _352 = int(_350) + 63;
        int _354 = _352 + _348;
        uint _356 = uint(int(uint(_354) >> uint(6)));
        uint _1037 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[1], _356, memory_order_relaxed);
        uint _358 = _1037;
        _346 = int(_350);
    }
    int _360 = _346;
    uint _362 = spvSubgroupBallot(true).x;
    float _364 = as_type<float>(gl_SubgroupLtMask.x);
    int _366 = reverse_bits(int(_362));
    int _368 = int(spvFindUMSB(uint(_366)));
    bool _370 = _368 != (-1);
    int _372 = _368 ^ 31;
    int _374 = _370 ? _372 : _368;
    int _376 = as_type<int>(_364) & int(_328);
    int _378 = _360;
    int _380 = _374;
    int _382 = 31;
    int _384;
    int _1069 = _49(_378, _380, _382, _384, gl_SubgroupInvocationID);
    int _386 = _1069;
    int _388 = popcount(_376);
    int _390 = _386 + _388;
    int _392 = _390 * 96;
    int _394 = _392 + 16;
    uint _396 = uint(int(uint(_392) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_396)] = as_type<uint>(_128);
    int _398 = _392 + 4;
    uint _400 = uint(int(uint(_398) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_400)] = as_type<uint>(_134);
    int _402 = _392 + 8;
    uint _404 = uint(int(uint(_402) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_404)] = as_type<uint>(_140);
    int _406 = _392 + 12;
    uint _408 = uint(int(uint(_406) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_408)] = as_type<uint>(_146);
    int _410 = _392 + 32;
    int _412 = _392 + 48;
    uint _414 = uint(int(uint(_394) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_414)] = as_type<uint>(_106);
    int _416 = _394 + 4;
    uint _418 = uint(int(uint(_416) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_418)] = as_type<uint>(_112);
    int _420 = _394 + 8;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_422)] = as_type<uint>(_118);
    int _424 = _394 + 12;
    uint _426 = uint(int(uint(_424) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_426)] = as_type<uint>(_124);
    int _428 = _392 + 64;
    int _430 = _392 + 80;
    uint _432 = uint(int(uint(_410) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_432)] = as_type<uint>(_152);
    int _434 = _410 + 4;
    uint _436 = uint(int(uint(_434) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_436)] = as_type<uint>(_158);
    int _438 = _410 + 8;
    uint _440 = uint(int(uint(_438) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_440)] = as_type<uint>(_164);
    int _442 = _410 + 12;
    uint _444 = uint(int(uint(_442) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_444)] = as_type<uint>(_170);
    int _446 = _392 + 88;
    int _448 = _392 + 92;
    uint _450 = uint(int(uint(_412) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_450)] = as_type<uint>(_294);
    int _452 = _412 + 4;
    uint _454 = uint(int(uint(_452) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_454)] = as_type<uint>(_300);
    int _456 = _412 + 8;
    uint _458 = uint(int(uint(_456) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_458)] = as_type<uint>(_306);
    int _460 = _412 + 12;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_462)] = as_type<uint>(_312);
    uint _464 = uint(int(uint(_428) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_464)] = as_type<uint>(_80);
    int _466 = _428 + 4;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_468)] = as_type<uint>(_86);
    int _470 = _428 + 8;
    uint _472 = uint(int(uint(_470) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_472)] = as_type<uint>(_92);
    int _474 = _428 + 12;
    uint _476 = uint(int(uint(_474) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_476)] = as_type<uint>(_98);
    uint _478 = uint(int(uint(_430) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_478)] = as_type<uint>(_316);
    int _480 = _430 + 4;
    uint _482 = uint(int(uint(_480) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_482)] = as_type<uint>(_322);
    uint _484 = uint(int(uint(_446) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_484)] = as_type<uint>(_326);
    uint _486 = uint(int(uint(_448) >> uint(2)));
    (*spvDescriptorSet0.cp_s2)._m0[int(_486)] = as_type<uint>(_176);
}

