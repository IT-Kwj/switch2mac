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
};

static inline __attribute__((always_inline))
int _53(thread const int& _1767, thread const int& _1768, thread const int& _1769, thread int& _1770, thread uint& gl_SubgroupInvocationID)
{
    int _1773 = _1769 & 31;
    uint _1775 = uint(int(uint(_1769) >> uint(8)));
    int _1777 = int(_1775) & 31;
    float _1779 = as_type<float>(gl_SubgroupInvocationID);
    int _1781 = as_type<int>(_1779) & _1777;
    int _1783 = ~_1777;
    int _1785 = _1773 & _1783;
    int _1787 = _1785 | _1781;
    int _1789 = ~_1777;
    int _1791 = _1768 & _1789;
    int _1793 = _1791 | _1781;
    bool _1795 = uint(_1793) <= uint(_1787);
    _1770 = _1795 ? (-1) : 0;
    float _1797 = spvSubgroupShuffle(as_type<float>(_1767), uint(_1793));
    uint _1799 = uint(_1795 ? as_type<int>(_1797) : _1767);
    return int(_1799);
}

static inline __attribute__((always_inline))
void _51(thread const int& _1464, thread const int& _1465, thread const int& _1466, thread const int& _1467, thread const int& _1468, thread const int& _1469, thread const int& _1470, thread const int& _1471, thread const int& _1472, thread const int& _1473, thread int& _1474, thread int& _1475, thread int& _1476, thread int& _1477, thread int& _1478, thread int& _1479, thread int& _1480, thread int& _1481, thread int& _1482, thread int& _1483, thread int& _1484, thread uint& gl_SubgroupInvocationID, thread uint4& gl_SubgroupLtMask)
{
    float _1487 = as_type<float>(gl_SubgroupLtMask.x);
    uint _1489 = spvSubgroupBallot(true).x;
    int _1491 = as_type<int>(_1487) & int(_1489);
    bool _1493 = _1491 != 0;
    int _1495 = as_type<int>(_1487) & int(_1489);
    int _1497 = int(spvFindUMSB(uint(_1491)));
    int _1499 = int(spvFindUMSB(uint(_1495)));
    int _1501 = _1465;
    int _1503 = _1497;
    int _1505 = 31;
    int _1507;
    int _1667 = _53(_1501, _1503, _1505, _1507, gl_SubgroupInvocationID);
    int _1509 = _1667;
    int _1511 = _1493 ? _1509 : 0;
    int _1513 = _1499;
    int _1515 = _1499;
    int _1517 = 30;
    int _1519;
    int _1673 = _53(_1513, _1515, _1517, _1519, gl_SubgroupInvocationID);
    int _1521 = _1673;
    int _1523 = _1511;
    int _1525 = _1499;
    int _1527 = 31;
    int _1529;
    int _1676 = _53(_1523, _1525, _1527, _1529, gl_SubgroupInvocationID);
    int _1531 = _1676;
    int _1533 = (_1519 != 0) ? _1521 : _1499;
    int _1535 = (_1519 != 0) ? _1531 : 0;
    int _1537 = _1533;
    int _1539 = _1533;
    int _1541 = 30;
    int _1543;
    int _1688 = _53(_1537, _1539, _1541, _1543, gl_SubgroupInvocationID);
    int _1545 = _1688;
    int _1547 = _1511 + _1535;
    int _1549 = _1547;
    int _1551 = _1533;
    int _1553 = 31;
    int _1555;
    int _1694 = _53(_1549, _1551, _1553, _1555, gl_SubgroupInvocationID);
    int _1557 = _1694;
    int _1559 = (_1543 != 0) ? _1545 : _1533;
    int _1561 = (_1543 != 0) ? _1557 : 0;
    int _1563 = _1559;
    int _1565 = _1559;
    int _1567 = 30;
    int _1569;
    int _1706 = _53(_1563, _1565, _1567, _1569, gl_SubgroupInvocationID);
    int _1571 = _1706;
    int _1573 = _1547 + _1561;
    int _1575 = _1573;
    int _1577 = _1559;
    int _1579 = 31;
    int _1581;
    int _1712 = _53(_1575, _1577, _1579, _1581, gl_SubgroupInvocationID);
    int _1583 = _1712;
    int _1585 = (_1569 != 0) ? _1571 : _1559;
    int _1587 = (_1569 != 0) ? _1583 : 0;
    int _1589 = _1585;
    int _1591 = _1585;
    int _1593 = 30;
    int _1595;
    int _1724 = _53(_1589, _1591, _1593, _1595, gl_SubgroupInvocationID);
    int _1597 = _1724;
    int _1599 = _1573 + _1587;
    int _1601 = _1599;
    int _1603 = _1585;
    int _1605 = 31;
    int _1607;
    int _1730 = _53(_1601, _1603, _1605, _1607, gl_SubgroupInvocationID);
    int _1609 = _1730;
    int _1611 = (_1595 != 0) ? _1597 : _1585;
    int _1613 = (_1595 != 0) ? _1609 : 0;
    int _1615 = _1611;
    int _1617 = _1611;
    int _1619 = 30;
    int _1621;
    int _1742 = _53(_1615, _1617, _1619, _1621, gl_SubgroupInvocationID);
    int _1623 = _1742;
    int _1625 = _1599 + _1613;
    int _1627 = _1625;
    int _1629 = _1611;
    int _1631 = 31;
    int _1633;
    int _1748 = _53(_1627, _1629, _1631, _1633, gl_SubgroupInvocationID);
    int _1635 = _1748;
    int _1637 = (_1621 != 0) ? _1635 : 0;
    int _1639 = _1625 + _1637;
    _1474 = _1472;
    _1475 = 0;
    _1476 = _1599;
    _1477 = _1639;
    _1478 = _1625;
    _1479 = _1611;
    _1480 = _1559;
    _1481 = _1585;
    _1482 = _1597;
    _1483 = _1621;
    _1484 = int(_1489);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    float _61 = as_type<float>(gl_SubgroupInvocationID);
    int _63 = as_type<int>(_57) << 5;
    int _65 = -as_type<int>(_59);
    bool _69 = _65 != _63;
    int _71 = as_type<int>(_61) + _63;
    bool _73 = uint(_71) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (!_69)
    {
        float _75 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
        uint _78 = min(as_type<uint>(_75), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y));
        int _80 = int(_78) + 63;
        uint _82 = uint(int(uint(_80) >> uint(6)));
        (*spvDescriptorSet0.cp_s1)._m0[0] = _82;
    }
    if (_73)
    {
        return;
    }
    int _84 = _71 << 2;
    int _86 = _84 + as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].x);
    bool _88 = uint(_86) < uint(_84);
    int _90 = int(_88);
    int _92 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[53].y) + _90;
    uint _94 = uint(int(uint(_84) >> uint(2)));
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s2)._m0[int(_94)]);
    int _98 = _92;
    int _100 = as_type<int>(_96);
    int _102 = 0;
    int _104 = 0;
    int _106 = 0;
    int _108 = 0;
    int _110 = 0;
    int _112 = 0;
    int _114 = 384;
    int _116 = _63;
    int _118;
    int _120;
    int _122;
    int _124;
    int _126;
    int _128;
    int _130;
    int _132;
    int _134;
    int _136;
    int _138;
    _51(_98, _100, _102, _104, _106, _108, _110, _112, _114, _116, _118, _120, _122, _124, _126, _128, _130, _132, _134, _136, _138, gl_SubgroupInvocationID, gl_SubgroupLtMask);
    int _140 = _118;
    uint _142 = spvSubgroupBallot(true).x;
    float _144 = spvSubgroupShuffle(_96, 0u);
    int _146 = int(_142) & 1;
    bool _148 = _146 != 0;
    int _150 = _148 ? as_type<int>(_144) : 0;
    float _152 = spvSubgroupShuffle(_96, 1u);
    int _154 = _150 + as_type<int>(_152);
    uint _156 = uint(int(uint(int(_142)) >> uint(1)));
    int _158 = int(_156) & 1;
    bool _160 = _158 != 0;
    int _162 = _160 ? _154 : _150;
    float _164 = spvSubgroupShuffle(_96, 2u);
    int _166 = _162 + as_type<int>(_164);
    uint _168 = uint(int(uint(int(_142)) >> uint(2)));
    int _170 = int(_168) & 1;
    bool _172 = _170 != 0;
    int _174 = _172 ? _166 : _162;
    float _176 = spvSubgroupShuffle(_96, 3u);
    int _178 = _174 + as_type<int>(_176);
    uint _180 = uint(int(uint(int(_142)) >> uint(3)));
    int _182 = int(_180) & 1;
    bool _184 = _182 != 0;
    int _186 = _184 ? _178 : _174;
    float _188 = spvSubgroupShuffle(_96, 4u);
    int _190 = _186 + as_type<int>(_188);
    uint _192 = uint(int(uint(int(_142)) >> uint(4)));
    int _194 = int(_192) & 1;
    bool _196 = _194 != 0;
    int _198 = _196 ? _190 : _186;
    float _200 = spvSubgroupShuffle(_96, 5u);
    int _202 = _198 + as_type<int>(_200);
    uint _204 = uint(int(uint(int(_142)) >> uint(5)));
    int _206 = int(_204) & 1;
    bool _208 = _206 != 0;
    int _210 = _208 ? _202 : _198;
    float _212 = spvSubgroupShuffle(_96, 6u);
    int _214 = _210 + as_type<int>(_212);
    uint _216 = uint(int(uint(int(_142)) >> uint(6)));
    int _218 = int(_216) & 1;
    bool _220 = _218 != 0;
    int _222 = _220 ? _214 : _210;
    float _224 = spvSubgroupShuffle(_96, 7u);
    int _226 = _222 + as_type<int>(_224);
    uint _228 = uint(int(uint(int(_142)) >> uint(7)));
    int _230 = int(_228) & 1;
    bool _232 = _230 != 0;
    int _234 = _232 ? _226 : _222;
    float _236 = spvSubgroupShuffle(_96, 8u);
    int _238 = _234 + as_type<int>(_236);
    uint _240 = uint(int(uint(int(_142)) >> uint(8)));
    int _242 = int(_240) & 1;
    bool _244 = _242 != 0;
    int _246 = _244 ? _238 : _234;
    float _248 = spvSubgroupShuffle(_96, 9u);
    int _250 = _246 + as_type<int>(_248);
    uint _252 = uint(int(uint(int(_142)) >> uint(9)));
    int _254 = int(_252) & 1;
    bool _256 = _254 != 0;
    int _258 = _256 ? _250 : _246;
    float _260 = spvSubgroupShuffle(_96, 10u);
    int _262 = _258 + as_type<int>(_260);
    uint _264 = uint(int(uint(int(_142)) >> uint(10)));
    int _266 = int(_264) & 1;
    bool _268 = _266 != 0;
    int _270 = _268 ? _262 : _258;
    float _272 = spvSubgroupShuffle(_96, 11u);
    int _274 = _270 + as_type<int>(_272);
    uint _276 = uint(int(uint(int(_142)) >> uint(11)));
    int _278 = int(_276) & 1;
    bool _280 = _278 != 0;
    int _282 = _280 ? _274 : _270;
    float _284 = spvSubgroupShuffle(_96, 12u);
    int _286 = _282 + as_type<int>(_284);
    uint _288 = uint(int(uint(int(_142)) >> uint(12)));
    int _290 = int(_288) & 1;
    bool _292 = _290 != 0;
    int _294 = _292 ? _286 : _282;
    float _296 = spvSubgroupShuffle(_96, 13u);
    int _298 = _294 + as_type<int>(_296);
    uint _300 = uint(int(uint(int(_142)) >> uint(13)));
    int _302 = int(_300) & 1;
    bool _304 = _302 != 0;
    int _306 = _304 ? _298 : _294;
    float _308 = spvSubgroupShuffle(_96, 14u);
    int _310 = _306 + as_type<int>(_308);
    uint _312 = uint(int(uint(int(_142)) >> uint(14)));
    int _314 = int(_312) & 1;
    bool _316 = _314 != 0;
    int _318 = _316 ? _310 : _306;
    float _320 = spvSubgroupShuffle(_96, 15u);
    int _322 = _318 + as_type<int>(_320);
    uint _324 = uint(int(uint(int(_142)) >> uint(15)));
    int _326 = int(_324) & 1;
    bool _328 = _326 != 0;
    int _330 = _328 ? _322 : _318;
    float _332 = spvSubgroupShuffle(_96, 16u);
    int _334 = _330 + as_type<int>(_332);
    uint _336 = uint(int(uint(int(_142)) >> uint(16)));
    int _338 = int(_336) & 1;
    bool _340 = _338 != 0;
    int _342 = _340 ? _334 : _330;
    float _344 = spvSubgroupShuffle(_96, 17u);
    int _346 = _342 + as_type<int>(_344);
    uint _348 = uint(int(uint(int(_142)) >> uint(17)));
    int _350 = int(_348) & 1;
    bool _352 = _350 != 0;
    int _354 = _352 ? _346 : _342;
    float _356 = spvSubgroupShuffle(_96, 18u);
    int _358 = _354 + as_type<int>(_356);
    uint _360 = uint(int(uint(int(_142)) >> uint(18)));
    int _362 = int(_360) & 1;
    bool _364 = _362 != 0;
    int _366 = _364 ? _358 : _354;
    float _368 = spvSubgroupShuffle(_96, 19u);
    int _370 = _366 + as_type<int>(_368);
    uint _372 = uint(int(uint(int(_142)) >> uint(19)));
    int _374 = int(_372) & 1;
    bool _376 = _374 != 0;
    int _378 = _376 ? _370 : _366;
    float _380 = spvSubgroupShuffle(_96, 20u);
    int _382 = _378 + as_type<int>(_380);
    uint _384 = uint(int(uint(int(_142)) >> uint(20)));
    int _386 = int(_384) & 1;
    bool _388 = _386 != 0;
    int _390 = _388 ? _382 : _378;
    float _392 = spvSubgroupShuffle(_96, 21u);
    int _394 = _390 + as_type<int>(_392);
    uint _396 = uint(int(uint(int(_142)) >> uint(21)));
    int _398 = int(_396) & 1;
    bool _400 = _398 != 0;
    int _402 = _400 ? _394 : _390;
    float _404 = spvSubgroupShuffle(_96, 22u);
    int _406 = _402 + as_type<int>(_404);
    uint _408 = uint(int(uint(int(_142)) >> uint(22)));
    int _410 = int(_408) & 1;
    bool _412 = _410 != 0;
    int _414 = _412 ? _406 : _402;
    float _416 = spvSubgroupShuffle(_96, 23u);
    int _418 = _414 + as_type<int>(_416);
    uint _420 = uint(int(uint(int(_142)) >> uint(23)));
    int _422 = int(_420) & 1;
    bool _424 = _422 != 0;
    int _426 = _424 ? _418 : _414;
    float _428 = spvSubgroupShuffle(_96, 24u);
    int _430 = _426 + as_type<int>(_428);
    uint _432 = uint(int(uint(int(_142)) >> uint(24)));
    int _434 = int(_432) & 1;
    bool _436 = _434 != 0;
    int _438 = _436 ? _430 : _426;
    float _440 = spvSubgroupShuffle(_96, 25u);
    int _442 = _438 + as_type<int>(_440);
    uint _444 = uint(int(uint(int(_142)) >> uint(25)));
    int _446 = int(_444) & 1;
    bool _448 = _446 != 0;
    int _450 = _448 ? _442 : _438;
    float _452 = spvSubgroupShuffle(_96, 26u);
    int _454 = _450 + as_type<int>(_452);
    uint _456 = uint(int(uint(int(_142)) >> uint(26)));
    int _458 = int(_456) & 1;
    bool _460 = _458 != 0;
    int _462 = _460 ? _454 : _450;
    float _464 = spvSubgroupShuffle(_96, 27u);
    int _466 = _462 + as_type<int>(_464);
    uint _468 = uint(int(uint(int(_142)) >> uint(27)));
    int _470 = int(_468) & 1;
    bool _472 = _470 != 0;
    int _474 = _472 ? _466 : _462;
    float _476 = spvSubgroupShuffle(_96, 28u);
    int _478 = _474 + as_type<int>(_476);
    uint _480 = uint(int(uint(int(_142)) >> uint(28)));
    int _482 = int(_480) & 1;
    bool _484 = _482 != 0;
    int _486 = _484 ? _478 : _474;
    float _488 = spvSubgroupShuffle(_96, 29u);
    int _490 = _486 + as_type<int>(_488);
    uint _492 = uint(int(uint(int(_142)) >> uint(29)));
    int _494 = int(_492) & 1;
    bool _496 = _494 != 0;
    int _498 = _496 ? _490 : _486;
    float _500 = spvSubgroupShuffle(_96, 30u);
    int _502 = _498 + as_type<int>(_500);
    uint _504 = uint(int(uint(int(_142)) >> uint(30)));
    int _506 = int(_504) & 1;
    bool _508 = _506 != 0;
    int _510 = _508 ? _502 : _498;
    float _512 = spvSubgroupShuffle(_96, 31u);
    int _514 = _510 + as_type<int>(_512);
    uint _516 = uint(int(uint(int(_142)) >> uint(31)));
    int _518 = int(_516) & 1;
    bool _520 = _518 != 0;
    int _522 = _520 ? _514 : _510;
    uint _524 = spvSubgroupBallot(true).x;
    int _526 = reverse_bits(int(_524));
    int _528 = int(spvFindUMSB(uint(_526)));
    bool _530 = _528 != (-1);
    int _532 = _528 ^ 31;
    int _534 = _530 ? _532 : _528;
    bool _536 = as_type<int>(_61) != _534;
    if (_536)
    {
        _140 = 0;
    }
    int _538 = _140;
    int _540 = _538;
    if (!_536)
    {
        int _542 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x) << 2;
        uint _544 = uint(int(uint(_542) >> uint(2)));
        uint _1395 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s2)._m0[int(_544)], uint(_522), memory_order_relaxed);
        uint _546 = _1395;
        _540 = int(_546);
    }
    int _548 = _540;
    uint _550 = spvSubgroupBallot(true).x;
    int _552 = reverse_bits(int(_550));
    int _554 = int(spvFindUMSB(uint(_552)));
    bool _556 = _554 != (-1);
    int _558 = _554 ^ 31;
    int _560 = _556 ? _558 : _554;
    int _562 = _548;
    int _564 = _560;
    int _566 = 31;
    int _568;
    int _1419 = _53(_562, _564, _566, _568, gl_SubgroupInvocationID);
    int _570 = _1419;
    int _572 = _124 + _570;
    int _574 = _71 * 20;
    uint _576 = min(uint(_572), as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y));
    int _578 = _574 + 16;
    int _580 = ~int(_576);
    int _582 = _580 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    int _584 = _582 + 1;
    int _586 = _574 + 4;
    uint _588 = uint(int(uint(_578) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_588)] = _576;
    uint _590 = min(as_type<uint>(_96), uint(_584));
    uint _592 = uint(int(uint(_586) >> uint(2)));
    (*spvDescriptorSet0.cp_s3)._m0[int(_592)] = _590;
}

