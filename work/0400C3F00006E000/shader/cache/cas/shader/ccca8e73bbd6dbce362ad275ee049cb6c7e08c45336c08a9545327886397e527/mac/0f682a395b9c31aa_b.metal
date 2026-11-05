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
};

static inline __attribute__((always_inline))
int _49(thread const int& _2220, thread const int& _2221, thread const int& _2222, thread int& _2223, thread uint& gl_SubgroupInvocationID)
{
    int _2226 = _2222 & 31;
    uint _2228 = uint(int(uint(_2222) >> uint(8)));
    int _2230 = int(_2228) & 31;
    float _2232 = as_type<float>(gl_SubgroupInvocationID);
    int _2234 = as_type<int>(_2232) & _2230;
    int _2236 = ~_2230;
    int _2238 = _2226 & _2236;
    int _2240 = _2238 | _2234;
    int _2242 = ~_2230;
    int _2244 = _2221 & _2242;
    int _2246 = _2244 | _2234;
    bool _2248 = uint(_2246) <= uint(_2240);
    _2223 = _2248 ? (-1) : 0;
    float _2250 = spvSubgroupShuffle(as_type<float>(_2220), uint(_2246));
    uint _2252 = uint(_2248 ? as_type<int>(_2250) : _2220);
    return int(_2252);
}

static inline __attribute__((always_inline))
void _47(thread const int& _1921, thread const int& _1922, thread const int& _1923, thread const int& _1924, thread const int& _1925, thread const int& _1926, thread const int& _1927, thread const int& _1928, thread int& _1929, thread int& _1930, thread int& _1931, thread int& _1932, thread int& _1933, thread int& _1934, thread int& _1935, thread int& _1936, thread int& _1937, thread int& _1938, thread uint& gl_SubgroupInvocationID, thread uint4& gl_SubgroupLtMask)
{
    float _1941 = as_type<float>(gl_SubgroupLtMask.x);
    uint _1943 = spvSubgroupBallot(true).x;
    int _1945 = as_type<int>(_1941) & int(_1943);
    bool _1947 = _1945 != 0;
    int _1949 = as_type<int>(_1941) & int(_1943);
    int _1951 = int(spvFindUMSB(uint(_1945)));
    int _1953 = int(spvFindUMSB(uint(_1949)));
    int _1955 = _1922;
    int _1957 = _1951;
    int _1959 = 31;
    int _1961;
    int _2121 = _49(_1955, _1957, _1959, _1961, gl_SubgroupInvocationID);
    int _1963 = _2121;
    int _1965 = _1947 ? _1963 : 0;
    int _1967 = _1953;
    int _1969 = _1953;
    int _1971 = 30;
    int _1973;
    int _2127 = _49(_1967, _1969, _1971, _1973, gl_SubgroupInvocationID);
    int _1975 = _2127;
    int _1977 = _1965;
    int _1979 = _1953;
    int _1981 = 31;
    int _1983;
    int _2130 = _49(_1977, _1979, _1981, _1983, gl_SubgroupInvocationID);
    int _1985 = _2130;
    int _1987 = (_1973 != 0) ? _1975 : _1953;
    int _1989 = (_1973 != 0) ? _1985 : 0;
    int _1991 = _1987;
    int _1993 = _1987;
    int _1995 = 30;
    int _1997;
    int _2142 = _49(_1991, _1993, _1995, _1997, gl_SubgroupInvocationID);
    int _1999 = _2142;
    int _2001 = _1965 + _1989;
    int _2003 = _2001;
    int _2005 = _1987;
    int _2007 = 31;
    int _2009;
    int _2148 = _49(_2003, _2005, _2007, _2009, gl_SubgroupInvocationID);
    int _2011 = _2148;
    int _2013 = (_1997 != 0) ? _1999 : _1987;
    int _2015 = (_1997 != 0) ? _2011 : 0;
    int _2017 = _2013;
    int _2019 = _2013;
    int _2021 = 30;
    int _2023;
    int _2160 = _49(_2017, _2019, _2021, _2023, gl_SubgroupInvocationID);
    int _2025 = _2160;
    int _2027 = _2001 + _2015;
    int _2029 = _2027;
    int _2031 = _2013;
    int _2033 = 31;
    int _2035;
    int _2166 = _49(_2029, _2031, _2033, _2035, gl_SubgroupInvocationID);
    int _2037 = _2166;
    int _2039 = (_2023 != 0) ? _2025 : _2013;
    int _2041 = (_2023 != 0) ? _2037 : 0;
    int _2043 = _2039;
    int _2045 = _2039;
    int _2047 = 30;
    int _2049;
    int _2178 = _49(_2043, _2045, _2047, _2049, gl_SubgroupInvocationID);
    int _2051 = _2178;
    int _2053 = _2027 + _2041;
    int _2055 = _2053;
    int _2057 = _2039;
    int _2059 = 31;
    int _2061;
    int _2184 = _49(_2055, _2057, _2059, _2061, gl_SubgroupInvocationID);
    int _2063 = _2184;
    int _2065 = (_2049 != 0) ? _2051 : _2039;
    int _2067 = (_2049 != 0) ? _2063 : 0;
    int _2069 = _2065;
    int _2071 = _2065;
    int _2073 = 30;
    int _2075;
    int _2196 = _49(_2069, _2071, _2073, _2075, gl_SubgroupInvocationID);
    int _2077 = _2196;
    int _2079 = _2053 + _2067;
    int _2081 = _2079;
    int _2083 = _2065;
    int _2085 = 31;
    int _2087;
    int _2202 = _49(_2081, _2083, _2085, _2087, gl_SubgroupInvocationID);
    int _2089 = _2202;
    int _2091 = (_2075 != 0) ? _2089 : 0;
    int _2093 = _2079 + _2091;
    _1929 = _1927;
    _1930 = 0;
    _1931 = _2053;
    _1932 = _2039;
    _1933 = _2079;
    _1934 = _2065;
    _1935 = _2093;
    _1936 = _2013;
    _1937 = _2075;
    _1938 = int(_1943);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _53 = as_type<float>(gl_WorkGroupID.x);
    bool _57 = 0 < as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].z);
    float _59 = as_type<float>(gl_SubgroupInvocationID);
    bool _61 = !_57;
    uint _64 = uint(_61 ? 0 : as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].z));
    uint _66 = uint(int(uint(int(_64)) >> uint(3)));
    int _68 = int(_66) + (-1);
    int _70 = as_type<int>(_53) * 32;
    int _72 = _70 + as_type<int>(_59);
    bool _74 = uint(_72) >= uint(_68);
    if (_74)
    {
        return;
    }
    int _76 = _72 * 8;
    int _78 = _76 + 4;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    float _82 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_80)]);
    int _84 = 0;
    int _86 = as_type<int>(_82);
    int _88 = 0;
    int _90 = 0;
    int _92 = 0;
    int _94 = 0;
    int _96 = 240;
    int _98 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[52].x);
    int _100;
    int _102;
    int _104;
    int _106;
    int _108;
    int _110;
    int _112;
    int _114;
    int _116;
    int _118;
    _47(_84, _86, _88, _90, _92, _94, _96, _98, _100, _102, _104, _106, _108, _110, _112, _114, _116, _118, gl_SubgroupInvocationID, gl_SubgroupLtMask);
    int _120 = _100;
    uint _122 = spvSubgroupBallot(true).x;
    float _124 = spvSubgroupShuffle(_82, 0u);
    int _126 = int(_122) & 1;
    bool _128 = _126 != 0;
    int _130 = _128 ? as_type<int>(_124) : 0;
    float _132 = spvSubgroupShuffle(_82, 1u);
    int _134 = _130 + as_type<int>(_132);
    uint _136 = uint(int(uint(int(_122)) >> uint(1)));
    int _138 = int(_136) & 1;
    bool _140 = _138 != 0;
    int _142 = _140 ? _134 : _130;
    float _144 = spvSubgroupShuffle(_82, 2u);
    int _146 = _142 + as_type<int>(_144);
    uint _148 = uint(int(uint(int(_122)) >> uint(2)));
    int _150 = int(_148) & 1;
    bool _152 = _150 != 0;
    int _154 = _152 ? _146 : _142;
    float _156 = spvSubgroupShuffle(_82, 3u);
    int _158 = _154 + as_type<int>(_156);
    uint _160 = uint(int(uint(int(_122)) >> uint(3)));
    int _162 = int(_160) & 1;
    bool _164 = _162 != 0;
    int _166 = _164 ? _158 : _154;
    float _168 = spvSubgroupShuffle(_82, 4u);
    int _170 = _166 + as_type<int>(_168);
    uint _172 = uint(int(uint(int(_122)) >> uint(4)));
    int _174 = int(_172) & 1;
    bool _176 = _174 != 0;
    int _178 = _176 ? _170 : _166;
    float _180 = spvSubgroupShuffle(_82, 5u);
    int _182 = _178 + as_type<int>(_180);
    uint _184 = uint(int(uint(int(_122)) >> uint(5)));
    int _186 = int(_184) & 1;
    bool _188 = _186 != 0;
    int _190 = _188 ? _182 : _178;
    float _192 = spvSubgroupShuffle(_82, 6u);
    int _194 = _190 + as_type<int>(_192);
    uint _196 = uint(int(uint(int(_122)) >> uint(6)));
    int _198 = int(_196) & 1;
    bool _200 = _198 != 0;
    int _202 = _200 ? _194 : _190;
    float _204 = spvSubgroupShuffle(_82, 7u);
    int _206 = _202 + as_type<int>(_204);
    uint _208 = uint(int(uint(int(_122)) >> uint(7)));
    int _210 = int(_208) & 1;
    bool _212 = _210 != 0;
    int _214 = _212 ? _206 : _202;
    float _216 = spvSubgroupShuffle(_82, 8u);
    int _218 = _214 + as_type<int>(_216);
    uint _220 = uint(int(uint(int(_122)) >> uint(8)));
    int _222 = int(_220) & 1;
    bool _224 = _222 != 0;
    int _226 = _224 ? _218 : _214;
    float _228 = spvSubgroupShuffle(_82, 9u);
    int _230 = _226 + as_type<int>(_228);
    uint _232 = uint(int(uint(int(_122)) >> uint(9)));
    int _234 = int(_232) & 1;
    bool _236 = _234 != 0;
    int _238 = _236 ? _230 : _226;
    float _240 = spvSubgroupShuffle(_82, 10u);
    int _242 = _238 + as_type<int>(_240);
    uint _244 = uint(int(uint(int(_122)) >> uint(10)));
    int _246 = int(_244) & 1;
    bool _248 = _246 != 0;
    int _250 = _248 ? _242 : _238;
    float _252 = spvSubgroupShuffle(_82, 11u);
    int _254 = _250 + as_type<int>(_252);
    uint _256 = uint(int(uint(int(_122)) >> uint(11)));
    int _258 = int(_256) & 1;
    bool _260 = _258 != 0;
    int _262 = _260 ? _254 : _250;
    float _264 = spvSubgroupShuffle(_82, 12u);
    int _266 = _262 + as_type<int>(_264);
    uint _268 = uint(int(uint(int(_122)) >> uint(12)));
    int _270 = int(_268) & 1;
    bool _272 = _270 != 0;
    int _274 = _272 ? _266 : _262;
    float _276 = spvSubgroupShuffle(_82, 13u);
    int _278 = _274 + as_type<int>(_276);
    uint _280 = uint(int(uint(int(_122)) >> uint(13)));
    int _282 = int(_280) & 1;
    bool _284 = _282 != 0;
    int _286 = _284 ? _278 : _274;
    float _288 = spvSubgroupShuffle(_82, 14u);
    int _290 = _286 + as_type<int>(_288);
    uint _292 = uint(int(uint(int(_122)) >> uint(14)));
    int _294 = int(_292) & 1;
    bool _296 = _294 != 0;
    int _298 = _296 ? _290 : _286;
    float _300 = spvSubgroupShuffle(_82, 15u);
    int _302 = _298 + as_type<int>(_300);
    uint _304 = uint(int(uint(int(_122)) >> uint(15)));
    int _306 = int(_304) & 1;
    bool _308 = _306 != 0;
    int _310 = _308 ? _302 : _298;
    float _312 = spvSubgroupShuffle(_82, 16u);
    int _314 = _310 + as_type<int>(_312);
    uint _316 = uint(int(uint(int(_122)) >> uint(16)));
    int _318 = int(_316) & 1;
    bool _320 = _318 != 0;
    int _322 = _320 ? _314 : _310;
    float _324 = spvSubgroupShuffle(_82, 17u);
    int _326 = _322 + as_type<int>(_324);
    uint _328 = uint(int(uint(int(_122)) >> uint(17)));
    int _330 = int(_328) & 1;
    bool _332 = _330 != 0;
    int _334 = _332 ? _326 : _322;
    float _336 = spvSubgroupShuffle(_82, 18u);
    int _338 = _334 + as_type<int>(_336);
    uint _340 = uint(int(uint(int(_122)) >> uint(18)));
    int _342 = int(_340) & 1;
    bool _344 = _342 != 0;
    int _346 = _344 ? _338 : _334;
    float _348 = spvSubgroupShuffle(_82, 19u);
    int _350 = _346 + as_type<int>(_348);
    uint _352 = uint(int(uint(int(_122)) >> uint(19)));
    int _354 = int(_352) & 1;
    bool _356 = _354 != 0;
    int _358 = _356 ? _350 : _346;
    float _360 = spvSubgroupShuffle(_82, 20u);
    int _362 = _358 + as_type<int>(_360);
    uint _364 = uint(int(uint(int(_122)) >> uint(20)));
    int _366 = int(_364) & 1;
    bool _368 = _366 != 0;
    int _370 = _368 ? _362 : _358;
    float _372 = spvSubgroupShuffle(_82, 21u);
    int _374 = _370 + as_type<int>(_372);
    uint _376 = uint(int(uint(int(_122)) >> uint(21)));
    int _378 = int(_376) & 1;
    bool _380 = _378 != 0;
    int _382 = _380 ? _374 : _370;
    float _384 = spvSubgroupShuffle(_82, 22u);
    int _386 = _382 + as_type<int>(_384);
    uint _388 = uint(int(uint(int(_122)) >> uint(22)));
    int _390 = int(_388) & 1;
    bool _392 = _390 != 0;
    int _394 = _392 ? _386 : _382;
    float _396 = spvSubgroupShuffle(_82, 23u);
    int _398 = _394 + as_type<int>(_396);
    uint _400 = uint(int(uint(int(_122)) >> uint(23)));
    int _402 = int(_400) & 1;
    bool _404 = _402 != 0;
    int _406 = _404 ? _398 : _394;
    float _408 = spvSubgroupShuffle(_82, 24u);
    int _410 = _406 + as_type<int>(_408);
    uint _412 = uint(int(uint(int(_122)) >> uint(24)));
    int _414 = int(_412) & 1;
    bool _416 = _414 != 0;
    int _418 = _416 ? _410 : _406;
    float _420 = spvSubgroupShuffle(_82, 25u);
    int _422 = _418 + as_type<int>(_420);
    uint _424 = uint(int(uint(int(_122)) >> uint(25)));
    int _426 = int(_424) & 1;
    bool _428 = _426 != 0;
    int _430 = _428 ? _422 : _418;
    float _432 = spvSubgroupShuffle(_82, 26u);
    int _434 = _430 + as_type<int>(_432);
    uint _436 = uint(int(uint(int(_122)) >> uint(26)));
    int _438 = int(_436) & 1;
    bool _440 = _438 != 0;
    int _442 = _440 ? _434 : _430;
    float _444 = spvSubgroupShuffle(_82, 27u);
    int _446 = _442 + as_type<int>(_444);
    uint _448 = uint(int(uint(int(_122)) >> uint(27)));
    int _450 = int(_448) & 1;
    bool _452 = _450 != 0;
    int _454 = _452 ? _446 : _442;
    float _456 = spvSubgroupShuffle(_82, 28u);
    int _458 = _454 + as_type<int>(_456);
    uint _460 = uint(int(uint(int(_122)) >> uint(28)));
    int _462 = int(_460) & 1;
    bool _464 = _462 != 0;
    int _466 = _464 ? _458 : _454;
    float _468 = spvSubgroupShuffle(_82, 29u);
    int _470 = _466 + as_type<int>(_468);
    uint _472 = uint(int(uint(int(_122)) >> uint(29)));
    int _474 = int(_472) & 1;
    bool _476 = _474 != 0;
    int _478 = _476 ? _470 : _466;
    float _480 = spvSubgroupShuffle(_82, 30u);
    int _482 = _478 + as_type<int>(_480);
    uint _484 = uint(int(uint(int(_122)) >> uint(30)));
    int _486 = int(_484) & 1;
    bool _488 = _486 != 0;
    int _490 = _488 ? _482 : _478;
    float _492 = spvSubgroupShuffle(_82, 31u);
    int _494 = _490 + as_type<int>(_492);
    uint _496 = uint(int(uint(int(_122)) >> uint(31)));
    int _498 = int(_496) & 1;
    bool _500 = _498 != 0;
    int _502 = _500 ? _494 : _490;
    uint _504 = spvSubgroupBallot(true).x;
    int _506 = reverse_bits(int(_504));
    int _508 = int(spvFindUMSB(uint(_506)));
    bool _510 = _508 != (-1);
    int _512 = _508 ^ 31;
    int _514 = _510 ? _512 : _508;
    bool _516 = as_type<int>(_59) != _514;
    if (_516)
    {
        _120 = 0;
    }
    int _518 = _120;
    int _520 = _518;
    if (!_516)
    {
        int _522 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z) << 3;
        uint _524 = uint(int(uint(_522) >> uint(2)));
        uint _1521 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_524)], uint(_502), memory_order_relaxed);
        uint _526 = _1521;
        _520 = int(_526);
    }
    int _528 = _520;
    uint _530 = spvSubgroupBallot(true).x;
    uint _532 = uint(int(uint(_72) >> uint(2)));
    int _534 = reverse_bits(int(_530));
    bool _536 = _532 >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _538 = int(spvFindUMSB(uint(_534)));
    bool _540 = _538 != (-1);
    int _542 = _538 ^ 31;
    int _544 = _540 ? _542 : _538;
    int _546 = _528;
    int _548 = _544;
    int _550 = 31;
    int _552;
    int _1553 = _49(_546, _548, _550, _552, gl_SubgroupInvocationID);
    int _554 = _1553;
    int _556 = _112 + _554;
    uint _558 = uint(int(uint(_76) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_558)] = uint(_556);
    if (_536)
    {
        return;
    }
    int _560 = int(_532) * 20;
    int _562 = _560 + 4;
    uint _564 = uint(int(uint(_562) >> uint(2)));
    float _566 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_564)]);
    int _568 = _560 + 8;
    bool _570 = as_type<uint>(_566) > 0u;
    bool _572 = !_570;
    if (!_572)
    {
        uint _574 = uint(int(uint(_568) >> uint(2)));
        float _576 = as_type<float>((*spvDescriptorSet0.cp_s1)._m0[int(_574)]);
        int _578 = _72 & 3;
        bool _580 = 0u >= as_type<uint>(_566);
        bool _582 = !_580;
        int _584 = 0;
        int _586 = -1;
        if (!_582)
        {
            int _588 = _578 + as_type<int>(_576);
            int _590 = _588 * 20;
            int _592 = _590 + 4;
            int _594 = _590 + 16;
            uint _596 = uint(int(uint(_592) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_596)] = as_type<uint>(_82);
            uint _598 = uint(int(uint(_594) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_598)] = uint(_556);
            _584 = 1;
            _586 = 0;
        }
        int _600 = _584;
        int _602 = _586;
        int _604 = -_600;
        int _606 = as_type<int>(_566) + _604;
        bool _608 = as_type<uint>(_566) > uint(_600);
        bool _610 = uint(_606) <= 3u;
        bool _612 = !_608;
        bool _614 = _610 || _612;
        int _616 = _600;
        int _618 = _600;
        int _620 = _602;
        if (!_614)
        {
            int _622 = as_type<int>(_566) + (-3);
            _620 = 0;
            bool _624;
            do
            {
                int _626 = _616;
                int _628 = _626 * 4;
                int _630 = _628 + as_type<int>(_576);
                int _632 = _626 + 4;
                int _634 = _578 + _630;
                bool _636 = uint(_632) >= uint(_622);
                int _638 = _634 * 20;
                int _640 = _638 + 4;
                int _642 = _638 + 16;
                int _644 = _638 + 84;
                uint _646 = uint(int(uint(_640) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_646)] = as_type<uint>(_82);
                int _648 = _638 + 96;
                int _650 = _638 + 164;
                uint _652 = uint(int(uint(_642) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_652)] = uint(_556);
                int _654 = _638 + 176;
                int _656 = _638 + 244;
                uint _658 = uint(int(uint(_644) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_658)] = as_type<uint>(_82);
                int _660 = _638 + 256;
                uint _662 = uint(int(uint(_648) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_662)] = uint(_556);
                uint _664 = uint(int(uint(_650) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_664)] = as_type<uint>(_82);
                uint _666 = uint(int(uint(_654) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_666)] = uint(_556);
                uint _668 = uint(int(uint(_656) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_668)] = as_type<uint>(_82);
                uint _670 = uint(int(uint(_660) >> uint(2)));
                (*spvDescriptorSet0.cp_s2)._m0[int(_670)] = uint(_556);
                _624 = !_636;
                _616 = _632;
                _618 = _632;
            } while (_624);
        }
        int _672 = _618;
        int _674 = _620;
        int _676 = -_672;
        int _678 = as_type<int>(_566) + _676;
        bool _680 = as_type<uint>(_566) > uint(_672);
        bool _682 = uint(_678) <= 1u;
        bool _684 = !_680;
        bool _686 = _682 || _684;
        uint _688 = uint(_672);
        int _690 = _674;
        if (!_686)
        {
            int _692 = _672 * 4;
            int _694 = _692 + as_type<int>(_576);
            int _696 = _578 + _694;
            int _698 = _672 + 2;
            int _700 = _696 * 20;
            int _702 = _700 + 4;
            int _704 = _700 + 16;
            int _706 = _700 + 84;
            uint _708 = uint(int(uint(_702) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_708)] = as_type<uint>(_82);
            int _710 = _700 + 96;
            uint _712 = uint(int(uint(_704) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_712)] = uint(_556);
            uint _714 = uint(int(uint(_706) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_714)] = as_type<uint>(_82);
            uint _716 = uint(int(uint(_710) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_716)] = uint(_556);
            _688 = uint(_698);
            _690 = 0;
        }
        uint _718 = _688;
        int _720 = _690;
        bool _722 = _718 < as_type<uint>(_566);
        int _724 = (_722 ? (-1) : 0) | _720;
        int _726 = ~_724;
        if (!(_726 != 0))
        {
            int _728 = int(_718) * 4;
            int _730 = _728 + as_type<int>(_576);
            int _732 = _578 + _730;
            int _734 = _732 * 20;
            int _736 = _734 + 4;
            int _738 = _734 + 16;
            uint _740 = uint(int(uint(_736) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_740)] = as_type<uint>(_82);
            uint _742 = uint(int(uint(_738) >> uint(2)));
            (*spvDescriptorSet0.cp_s2)._m0[int(_742)] = uint(_556);
        }
    }
    uint _744 = uint(int(uint(_78) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_744)] = 0u;
}

