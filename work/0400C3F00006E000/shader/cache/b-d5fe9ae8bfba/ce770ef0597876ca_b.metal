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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    device _21* cp_s1 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _2413, thread const int& _2414, constant _10& support_buffer)
{
    int _2417 = 1 + _2414;
    float _2419 = support_buffer._m5[_2417].x;
    bool _2421 = _2419 == 1.0;
    if (_2421)
    {
        return _2413;
    }
    float _2423 = float(_2413);
    float _2425 = _2423 * _2419;
    int _2427 = int(_2425);
    return _2427;
}

static inline __attribute__((always_inline))
int _50(thread const int& _1515, thread const int& _1516, device _21& cp_s1)
{
    int _1519 = 0 + 2048;
    int _1521 = _1519 * 8;
    int _1523 = _1521 + 0;
    float _1525 = as_type<float>(cp_s1._m0[_1523]);
    int _1527 = _1521 + 1;
    float _1529 = as_type<float>(cp_s1._m0[_1527]);
    bool _1531 = as_type<uint>(_1529) < uint(_1516);
    bool _1533 = as_type<int>(_1529) == _1516;
    bool _1535 = as_type<uint>(_1525) <= uint(_1515);
    bool _1537 = _1533 && _1535;
    bool _1539 = _1531 || _1537;
    int _1541 = _1539 ? _1519 : 0;
    int _1543 = _1541 + 1024;
    int _1545 = _1543 * 8;
    int _1547 = _1545 + 0;
    float _1549 = as_type<float>(cp_s1._m0[_1547]);
    int _1551 = _1545 + 1;
    float _1553 = as_type<float>(cp_s1._m0[_1551]);
    bool _1555 = as_type<uint>(_1553) < uint(_1516);
    bool _1557 = as_type<int>(_1553) == _1516;
    bool _1559 = as_type<uint>(_1549) <= uint(_1515);
    bool _1561 = _1557 && _1559;
    bool _1563 = _1555 || _1561;
    int _1565 = _1563 ? _1543 : _1541;
    int _1567 = _1565 + 512;
    int _1569 = _1567 * 8;
    int _1571 = _1569 + 0;
    float _1573 = as_type<float>(cp_s1._m0[_1571]);
    int _1575 = _1569 + 1;
    float _1577 = as_type<float>(cp_s1._m0[_1575]);
    bool _1579 = as_type<uint>(_1577) < uint(_1516);
    bool _1581 = as_type<int>(_1577) == _1516;
    bool _1583 = as_type<uint>(_1573) <= uint(_1515);
    bool _1585 = _1581 && _1583;
    bool _1587 = _1579 || _1585;
    int _1589 = _1587 ? _1567 : _1565;
    int _1591 = _1589 + 256;
    int _1593 = _1591 * 8;
    int _1595 = _1593 + 0;
    float _1597 = as_type<float>(cp_s1._m0[_1595]);
    int _1599 = _1593 + 1;
    float _1601 = as_type<float>(cp_s1._m0[_1599]);
    bool _1603 = as_type<uint>(_1601) < uint(_1516);
    bool _1605 = as_type<int>(_1601) == _1516;
    bool _1607 = as_type<uint>(_1597) <= uint(_1515);
    bool _1609 = _1605 && _1607;
    bool _1611 = _1603 || _1609;
    int _1613 = _1611 ? _1591 : _1589;
    int _1615 = _1613 + 128;
    int _1617 = _1615 * 8;
    int _1619 = _1617 + 0;
    float _1621 = as_type<float>(cp_s1._m0[_1619]);
    int _1623 = _1617 + 1;
    float _1625 = as_type<float>(cp_s1._m0[_1623]);
    bool _1627 = as_type<uint>(_1625) < uint(_1516);
    bool _1629 = as_type<int>(_1625) == _1516;
    bool _1631 = as_type<uint>(_1621) <= uint(_1515);
    bool _1633 = _1629 && _1631;
    bool _1635 = _1627 || _1633;
    int _1637 = _1635 ? _1615 : _1613;
    int _1639 = _1637 + 64;
    int _1641 = _1639 * 8;
    int _1643 = _1641 + 0;
    float _1645 = as_type<float>(cp_s1._m0[_1643]);
    int _1647 = _1641 + 1;
    float _1649 = as_type<float>(cp_s1._m0[_1647]);
    bool _1651 = as_type<uint>(_1649) < uint(_1516);
    bool _1653 = as_type<int>(_1649) == _1516;
    bool _1655 = as_type<uint>(_1645) <= uint(_1515);
    bool _1657 = _1653 && _1655;
    bool _1659 = _1651 || _1657;
    int _1661 = _1659 ? _1639 : _1637;
    int _1663 = _1661 + 32;
    int _1665 = _1663 * 8;
    int _1667 = _1665 + 0;
    float _1669 = as_type<float>(cp_s1._m0[_1667]);
    int _1671 = _1665 + 1;
    float _1673 = as_type<float>(cp_s1._m0[_1671]);
    bool _1675 = as_type<uint>(_1673) < uint(_1516);
    bool _1677 = as_type<int>(_1673) == _1516;
    bool _1679 = as_type<uint>(_1669) <= uint(_1515);
    bool _1681 = _1677 && _1679;
    bool _1683 = _1675 || _1681;
    int _1685 = _1683 ? _1663 : _1661;
    int _1687 = _1685 + 16;
    int _1689 = _1687 * 8;
    int _1691 = _1689 + 0;
    float _1693 = as_type<float>(cp_s1._m0[_1691]);
    int _1695 = _1689 + 1;
    float _1697 = as_type<float>(cp_s1._m0[_1695]);
    bool _1699 = as_type<uint>(_1697) < uint(_1516);
    bool _1701 = as_type<int>(_1697) == _1516;
    bool _1703 = as_type<uint>(_1693) <= uint(_1515);
    bool _1705 = _1701 && _1703;
    bool _1707 = _1699 || _1705;
    int _1709 = _1707 ? _1687 : _1685;
    int _1711 = _1709 + 8;
    int _1713 = _1711 * 8;
    int _1715 = _1713 + 0;
    float _1717 = as_type<float>(cp_s1._m0[_1715]);
    int _1719 = _1713 + 1;
    float _1721 = as_type<float>(cp_s1._m0[_1719]);
    bool _1723 = as_type<uint>(_1721) < uint(_1516);
    bool _1725 = as_type<int>(_1721) == _1516;
    bool _1727 = as_type<uint>(_1717) <= uint(_1515);
    bool _1729 = _1725 && _1727;
    bool _1731 = _1723 || _1729;
    int _1733 = _1731 ? _1711 : _1709;
    int _1735 = _1733 + 4;
    int _1737 = _1735 * 8;
    int _1739 = _1737 + 0;
    float _1741 = as_type<float>(cp_s1._m0[_1739]);
    int _1743 = _1737 + 1;
    float _1745 = as_type<float>(cp_s1._m0[_1743]);
    bool _1747 = as_type<uint>(_1745) < uint(_1516);
    bool _1749 = as_type<int>(_1745) == _1516;
    bool _1751 = as_type<uint>(_1741) <= uint(_1515);
    bool _1753 = _1749 && _1751;
    bool _1755 = _1747 || _1753;
    int _1757 = _1755 ? _1735 : _1733;
    int _1759 = _1757 + 2;
    int _1761 = _1759 * 8;
    int _1763 = _1761 + 0;
    float _1765 = as_type<float>(cp_s1._m0[_1763]);
    int _1767 = _1761 + 1;
    float _1769 = as_type<float>(cp_s1._m0[_1767]);
    bool _1771 = as_type<uint>(_1769) < uint(_1516);
    bool _1773 = as_type<int>(_1769) == _1516;
    bool _1775 = as_type<uint>(_1765) <= uint(_1515);
    bool _1777 = _1773 && _1775;
    bool _1779 = _1771 || _1777;
    int _1781 = _1779 ? _1759 : _1757;
    int _1783 = _1781 + 1;
    int _1785 = _1783 * 8;
    int _1787 = _1785 + 0;
    float _1789 = as_type<float>(cp_s1._m0[_1787]);
    int _1791 = _1785 + 1;
    float _1793 = as_type<float>(cp_s1._m0[_1791]);
    bool _1795 = as_type<uint>(_1793) < uint(_1516);
    bool _1797 = as_type<int>(_1793) == _1516;
    bool _1799 = as_type<uint>(_1789) <= uint(_1515);
    bool _1801 = _1797 && _1799;
    bool _1803 = _1795 || _1801;
    int _1805 = _1803 ? _1783 : _1781;
    int _1807 = _1805 * 8;
    int _1809 = _1807 + 2;
    float _1811 = as_type<float>(cp_s1._m0[_1809]);
    int _1813 = _1807 + 3;
    float _1815 = as_type<float>(cp_s1._m0[_1813]);
    bool _1817 = uint(_1516) < as_type<uint>(_1815);
    bool _1819 = _1516 == as_type<int>(_1815);
    bool _1821 = uint(_1515) < as_type<uint>(_1811);
    bool _1823 = _1819 && _1821;
    bool _1825 = _1817 || _1823;
    if (_1825)
    {
        int _1827 = _1807 + 4;
        float _1829 = as_type<float>(cp_s1._m0[_1827]);
        int _1831 = _1515 + as_type<int>(_1829);
        bool _1833 = uint(_1831) < uint(_1515);
        int _1835 = int(_1833);
        int _1837 = _1807 + 5;
        float _1839 = as_type<float>(cp_s1._m0[_1837]);
        int _1841 = _1516 + as_type<int>(_1839);
        int _1843 = _1841 + _1835;
        uint _2408 = *(reinterpret_cast<device uint*>(as_type<ulong>(uint2(uint(_1831), uint(_1843)))));
        float _1845 = as_type<float>(_2408);
        return as_type<int>(_1845);
    }
    return 0;
}

static inline __attribute__((always_inline))
int _53(thread const int& _2449, thread const int& _2450, thread const int& _2451, thread int& _2452, thread uint& gl_SubgroupInvocationID)
{
    int _2455 = _2451 & 31;
    uint _2457 = uint(int(uint(_2451) >> uint(8)));
    int _2459 = int(_2457) & 31;
    float _2461 = as_type<float>(gl_SubgroupInvocationID);
    int _2463 = as_type<int>(_2461) & _2459;
    int _2465 = ~_2459;
    int _2467 = _2455 & _2465;
    int _2469 = _2467 | _2463;
    int _2471 = ~_2459;
    int _2473 = _2450 & _2471;
    int _2475 = _2473 | _2463;
    bool _2477 = uint(_2475) <= uint(_2469);
    _2452 = _2477 ? (-1) : 0;
    float _2479 = spvSubgroupShuffle(as_type<float>(_2449), uint(_2475));
    uint _2481 = uint(_2477 ? as_type<int>(_2479) : _2449);
    return int(_2481);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    bool _408 = false;
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    float _61 = as_type<float>(gl_WorkGroupID.y);
    float _63 = as_type<float>(gl_LocalInvocationID.y);
    int _65 = as_type<int>(_57) * 16;
    int _67 = _65 + as_type<int>(_59);
    int _69 = as_type<int>(_61) * 16;
    int _71 = _69 + as_type<int>(_63);
    int _73 = _67;
    int _75 = 0;
    int _77 = _51(_73, _75, (*spvDescriptorSet0.support_buffer));
    int _79 = _71;
    int _81 = 0;
    int _83 = _51(_79, _81, (*spvDescriptorSet0.support_buffer));
    float4 _86 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(int2(_77, _83)), 0).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[8]);
    float _98 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[9]);
    float _100 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[10]);
    float _102 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[11]);
    bool _106 = as_type<int>(_96) != 0;
    bool _108 = as_type<int>(_98) != 0;
    float _110 = abs(_88);
    bool _112 = _110 == as_type<float>(0x7f800000u /* inf */);
    bool _114 = _112 && _106;
    float _116 = abs(_88);
    bool _118 = _116 > as_type<float>(0x7f800000u /* inf */);
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _126 = _122 || _124;
    bool _128 = _126 && _106;
    float _130 = float(as_type<int>(_96));
    float _132 = _88 * _130;
    float _134 = float(as_type<int>(_98));
    float _136 = float(as_type<int>(_100));
    int _138 = _106 ? (-1) : 0;
    int _140 = as_type<int>(_98);
    int _142 = as_type<int>(_98);
    int _144 = as_type<int>(_98);
    if (_114)
    {
        _138 = -1;
    }
    int _146 = _138;
    int _148 = _146;
    if (!_114)
    {
        float _150 = abs(_90);
        bool _152 = _150 == as_type<float>(0x7f800000u /* inf */);
        bool _154 = _152 && _108;
        _148 = _154 ? (-1) : 0;
    }
    int _156 = _148;
    float _158 = _92 * _136;
    int _160 = 0;
    if (_128)
    {
        _160 = -1;
    }
    int _162 = _160;
    int _164 = _162;
    if (!_128)
    {
        float _166 = abs(_90);
        bool _168 = _166 > as_type<float>(0x7f800000u /* inf */);
        bool _170 = isnan(_166);
        bool _172 = _168 || _170;
        bool _174 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _176 = _172 || _174;
        bool _178 = _176 && _108;
        _164 = _178 ? (-1) : 0;
    }
    int _180 = _164;
    float _182 = _90 * _134;
    bool _184 = as_type<int>(_102) != 0;
    bool _186 = as_type<int>(_100) != 0;
    float _188 = abs(_94);
    bool _190 = _188 > as_type<float>(0x7f800000u /* inf */);
    bool _192 = isnan(_188);
    bool _194 = _190 || _192;
    bool _196 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _198 = _194 || _196;
    bool _200 = _198 && _184;
    float _202 = abs(_92);
    bool _204 = _202 == as_type<float>(0x7f800000u /* inf */);
    bool _206 = _204 && _186;
    float _208 = abs(_94);
    bool _210 = _208 == as_type<float>(0x7f800000u /* inf */);
    bool _212 = _210 && _184;
    float _214 = float(as_type<int>(_102));
    int _216 = ~_156;
    int _218 = (_212 ? (-1) : 0) & _216;
    bool _220 = !_206;
    int _222 = _218 & (_220 ? (-1) : 0);
    float _224 = abs(_92);
    bool _226 = _224 > as_type<float>(0x7f800000u /* inf */);
    bool _228 = isnan(_224);
    bool _230 = _226 || _228;
    bool _232 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _234 = _230 || _232;
    bool _236 = _234 && _186;
    float _238 = _94 * _214;
    int _240 = ~_222;
    int _242 = ~_156;
    int _244 = _240 & _242;
    int _246 = _244 & (_206 ? (-1) : 0);
    int _248 = ~_222;
    int _250 = _248 & _156;
    bool _252 = !_206;
    int _254 = _250 & (_252 ? (-1) : 0);
    int _256 = _246 | _254;
    int _258 = ~_222;
    int _260 = _258 & _156;
    int _262 = _260 & (_206 ? (-1) : 0);
    int _264 = _256 | _262;
    int _266 = ~_156;
    int _268 = _222 & _266;
    bool _270 = !_206;
    int _272 = _268 & (_270 ? (-1) : 0);
    int _274 = _264 | _272;
    int _276 = ~_156;
    int _278 = _222 & _276;
    int _280 = _278 & (_206 ? (-1) : 0);
    int _282 = _274 | _280;
    int _284 = _222 & _156;
    bool _286 = !_206;
    int _288 = _284 & (_286 ? (-1) : 0);
    int _290 = _282 | _288;
    int _292 = _222 & _156;
    int _294 = _292 & (_206 ? (-1) : 0);
    int _296 = _290 | _294;
    float _298 = abs(_132);
    float _300 = abs(_182);
    float _302 = precise::max(_298, _300);
    int _304 = ~_180;
    int _306 = (_200 ? (-1) : 0) & _304;
    bool _308 = !_236;
    int _310 = _306 & (_308 ? (-1) : 0);
    float _312 = abs(_158);
    float _314 = precise::max(_312, _302);
    int _316 = ~_310;
    int _318 = ~_180;
    int _320 = _316 & _318;
    int _322 = _320 & (_236 ? (-1) : 0);
    int _324 = ~_310;
    int _326 = _324 & _180;
    bool _328 = !_236;
    int _330 = _326 & (_328 ? (-1) : 0);
    int _332 = _322 | _330;
    int _334 = ~_310;
    int _336 = _334 & _180;
    int _338 = _336 & (_236 ? (-1) : 0);
    int _340 = _332 | _338;
    int _342 = ~_180;
    int _344 = _310 & _342;
    bool _346 = !_236;
    int _348 = _344 & (_346 ? (-1) : 0);
    int _350 = _340 | _348;
    int _352 = ~_180;
    int _354 = _310 & _352;
    int _356 = _354 & (_236 ? (-1) : 0);
    int _358 = _350 | _356;
    int _360 = _310 & _180;
    bool _362 = !_236;
    int _364 = _360 & (_362 ? (-1) : 0);
    int _366 = _358 | _364;
    int _368 = _310 & _180;
    int _370 = _368 & (_236 ? (-1) : 0);
    int _372 = _366 | _370;
    float _374 = abs(_238);
    float _376 = precise::max(_374, _314);
    int _378 = ~_296;
    int _380 = as_type<int>(_182);
    int _382 = as_type<int>(_182);
    int _384 = as_type<int>(_182);
    bool _386 = _180 != 0;
    int _396;
    int _400;
    int _406;
    if (!(_378 != 0))
    {
        float _388 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[1]);
        bool _390 = as_type<int>(_388) != 0;
        int _392 = as_type<int>(_388);
        if (!_390)
        {
            _140 = 0;
        }
        int _394 = _140;
        _396 = _394;
        if (!_390)
        {
            _392 = -1;
        }
        int _398 = _392;
        _400 = _398;
        if (!_390)
        {
            _380 = 0;
        }
        int _402 = _380;
        bool _404 = !_390;
        _406 = _402;
        _408 = _404;
        if (!_408)
        {
            float _410 = as_type<float>(gl_SubgroupInvocationID);
            uint _413 = spvSubgroupBallot(true).x;
            int _415 = int(spvFindUMSB(_413));
            int _417 = popcount(int(_413));
            bool _419 = as_type<int>(_410) == _415;
            if (_419)
            {
                uint _1136 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[16], uint(_417), memory_order_relaxed);
                uint _421 = _1136;
            }
            _400 = 0;
            _396 = -268394496;
            _406 = 2139095040;
            _408 = true;
        }
    }
    else
    {
        int _423 = ~_372;
        if (!(_423 != 0))
        {
            float _425 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[2]);
            bool _427 = as_type<int>(_425) != 0;
            int _429 = as_type<int>(_425);
            if (!_427)
            {
                _142 = 0;
            }
            int _431 = _142;
            _396 = _431;
            if (!_427)
            {
                _429 = -1;
            }
            int _433 = _429;
            _400 = _433;
            if (!_427)
            {
                _382 = 0;
            }
            int _435 = _382;
            bool _437 = !_427;
            _406 = _435;
            _408 = _437;
            if (!_408)
            {
                float _439 = as_type<float>(gl_SubgroupInvocationID);
                uint _441 = spvSubgroupBallot(true).x;
                int _443 = int(spvFindUMSB(_441));
                int _445 = popcount(int(_441));
                bool _447 = as_type<int>(_439) == _443;
                if (_447)
                {
                    uint _1201 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[17], uint(_445), memory_order_relaxed);
                    uint _449 = _1201;
                }
                _400 = 1;
                _396 = -268390400;
                _406 = -4194304;
                _408 = true;
            }
        }
        else
        {
            float _451 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[4]);
            bool _453 = _376 >= _451;
            int _455 = as_type<int>(_451);
            if (!_453)
            {
                _144 = 0;
            }
            int _457 = _144;
            int _459 = _457;
            _396 = _457;
            if (!_453)
            {
                _455 = -1;
            }
            int _461 = _455;
            _400 = _461;
            if (!_453)
            {
                _384 = 0;
            }
            int _463 = _384;
            bool _465 = !_453;
            int _467 = _463;
            _406 = _463;
            if (!_465)
            {
                float _469 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[3]);
                bool _471 = as_type<int>(_469) != 0;
                int _473 = as_type<int>(_469);
                if (!_471)
                {
                    _459 = 0;
                }
                int _475 = _459;
                _396 = _475;
                if (!_471)
                {
                    _473 = -1;
                }
                int _477 = _473;
                _400 = _477;
                if (!_471)
                {
                    _467 = 0;
                }
                int _479 = _467;
                bool _481 = !_471;
                _406 = _479;
                if (!_481)
                {
                    float _483 = as_type<float>(gl_SubgroupInvocationID);
                    uint _485 = spvSubgroupBallot(true).x;
                    int _487 = int(spvFindUMSB(_485));
                    int _489 = popcount(int(_485));
                    bool _491 = as_type<int>(_483) == _487;
                    if (_491)
                    {
                        uint _1293 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[18], uint(_489), memory_order_relaxed);
                        uint _493 = _1293;
                    }
                    _400 = 2;
                    _396 = -268386304;
                    _406 = as_type<int>(_376);
                }
            }
        }
    }
    _408 = false;
    int _495 = _400;
    int _497 = _396;
    int _499 = _406;
    bool _501 = _495 != (-1);
    if (!_501)
    {
        return;
    }
    float _503 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[0]);
    bool _505 = as_type<int>(_503) != 0;
    int _507 = as_type<int>(_503);
    int _509 = as_type<int>(_94);
    if (_505)
    {
        float _511 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[14]);
        float _513 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[15]);
        _507 = as_type<int>(_511);
        _509 = as_type<int>(_513);
    }
    int _515 = _507;
    int _517 = _509;
    int _519 = as_type<int>(_376);
    if (_505)
    {
        float _521 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[20]);
        _519 = as_type<int>(_521);
    }
    int _523 = _519;
    uint _525 = spvSubgroupBallot(true).x;
    int _527 = int(spvFindUMSB(_525));
    int _529 = _515;
    int _531 = _517;
    if (_505)
    {
        int _533 = _515 + _497;
        bool _535 = uint(_533) < uint(_515);
        int _537 = int(_535);
        bool _539 = uint(_533) < uint(_533);
        int _541 = int(_539);
        int _543 = _537 + _541;
        int _545 = _543 & 1;
        bool _547 = _545 != 0;
        _386 = _547;
        _529 = _533;
    }
    bool _549 = _386;
    int _551 = _529;
    if (_505)
    {
        int _553 = int(_549);
        int _555 = _517 + _553;
        _531 = _555;
    }
    int _557 = _531;
    int _559 = _551;
    if (_505)
    {
        int _561 = _551;
        int _563 = _557;
        int _565 = _50(_561, _563, (*spvDescriptorSet0.cp_s1));
        _559 = _565;
    }
    int _567 = _559;
    float _569 = as_type<float>(gl_SubgroupInvocationID);
    int _571 = popcount(int(_525));
    bool _573 = _527 == as_type<int>(_569);
    int _575 = _523;
    if (_505)
    {
        int _577 = _567 + _523;
        _575 = _577;
    }
    int _579 = _575;
    if (_505)
    {
        (*spvDescriptorSet0.cp_s0)._m0[20] = uint(_579);
    }
    int _581 = as_type<int>(_102);
    if (_573)
    {
        uint _1439 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[19], uint(_571), memory_order_relaxed);
        uint _583 = _1439;
        _581 = int(_583);
    }
    int _585 = _581;
    float _587 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[12]);
    float _589 = as_type<float>(gl_SubgroupLtMask.x);
    int _591 = as_type<int>(_589) & int(_525);
    int _593 = popcount(_591);
    int _595 = _585;
    int _597 = _527;
    int _599 = 31;
    int _601;
    int _1461 = _53(_595, _597, _599, _601, gl_SubgroupInvocationID);
    int _603 = _1461;
    int _605 = _603 + _593;
    bool _607 = _605 >= as_type<int>(_587);
    if (_607)
    {
        return;
    }
    int _609 = _605 << 4;
    int _611 = _609 + 80;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_613)] = uint(_67);
    int _615 = _611 + 4;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_617)] = uint(_71);
    int _619 = _611 + 8;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_621)] = uint(_495);
    int _623 = _611 + 12;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_625)] = uint(_499);
}

