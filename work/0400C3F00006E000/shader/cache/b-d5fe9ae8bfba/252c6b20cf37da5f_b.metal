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
};

static inline __attribute__((always_inline))
int _47(thread const int& _1646, thread const int& _1647, thread const int& _1648, thread int& _1649, thread uint& gl_SubgroupInvocationID)
{
    int _1652 = _1648 & 31;
    uint _1654 = uint(int(uint(_1648) >> uint(8)));
    int _1656 = int(_1654) & 31;
    float _1658 = as_type<float>(gl_SubgroupInvocationID);
    int _1660 = as_type<int>(_1658) & _1656;
    int _1662 = ~_1656;
    int _1664 = _1652 & _1662;
    int _1666 = _1664 | _1660;
    int _1668 = ~_1656;
    int _1670 = _1647 & _1668;
    int _1672 = _1670 | _1660;
    bool _1674 = uint(_1672) <= uint(_1666);
    _1649 = _1674 ? (-1) : 0;
    float _1676 = spvSubgroupShuffle(as_type<float>(_1646), uint(_1672));
    uint _1678 = uint(_1674 ? as_type<int>(_1676) : _1646);
    return int(_1678);
}

static inline __attribute__((always_inline))
void _45(thread const int& _1348, thread const int& _1349, thread const int& _1350, thread const int& _1351, thread const int& _1352, thread const int& _1353, thread const int& _1354, thread int& _1355, thread int& _1356, thread int& _1357, thread int& _1358, thread int& _1359, thread int& _1360, thread int& _1361, thread int& _1362, thread int& _1363, thread int& _1364, thread uint& gl_SubgroupInvocationID, thread uint4& gl_SubgroupLtMask)
{
    float _1367 = as_type<float>(gl_SubgroupLtMask.x);
    uint _1369 = spvSubgroupBallot(true).x;
    int _1371 = as_type<int>(_1367) & int(_1369);
    bool _1373 = _1371 != 0;
    int _1375 = as_type<int>(_1367) & int(_1369);
    int _1377 = int(spvFindUMSB(uint(_1371)));
    int _1379 = int(spvFindUMSB(uint(_1375)));
    int _1381 = _1348;
    int _1383 = _1377;
    int _1385 = 31;
    int _1387;
    int _1547 = _47(_1381, _1383, _1385, _1387, gl_SubgroupInvocationID);
    int _1389 = _1547;
    int _1391 = _1373 ? _1389 : 0;
    int _1393 = _1379;
    int _1395 = _1379;
    int _1397 = 30;
    int _1399;
    int _1553 = _47(_1393, _1395, _1397, _1399, gl_SubgroupInvocationID);
    int _1401 = _1553;
    int _1403 = _1391;
    int _1405 = _1379;
    int _1407 = 31;
    int _1409;
    int _1556 = _47(_1403, _1405, _1407, _1409, gl_SubgroupInvocationID);
    int _1411 = _1556;
    int _1413 = (_1399 != 0) ? _1401 : _1379;
    int _1415 = (_1399 != 0) ? _1411 : 0;
    int _1417 = _1413;
    int _1419 = _1413;
    int _1421 = 30;
    int _1423;
    int _1568 = _47(_1417, _1419, _1421, _1423, gl_SubgroupInvocationID);
    int _1425 = _1568;
    int _1427 = _1391 + _1415;
    int _1429 = _1427;
    int _1431 = _1413;
    int _1433 = 31;
    int _1435;
    int _1574 = _47(_1429, _1431, _1433, _1435, gl_SubgroupInvocationID);
    int _1437 = _1574;
    int _1439 = (_1423 != 0) ? _1425 : _1413;
    int _1441 = (_1423 != 0) ? _1437 : 0;
    int _1443 = _1439;
    int _1445 = _1439;
    int _1447 = 30;
    int _1449;
    int _1586 = _47(_1443, _1445, _1447, _1449, gl_SubgroupInvocationID);
    int _1451 = _1586;
    int _1453 = _1427 + _1441;
    int _1455 = _1453;
    int _1457 = _1439;
    int _1459 = 31;
    int _1461;
    int _1592 = _47(_1455, _1457, _1459, _1461, gl_SubgroupInvocationID);
    int _1463 = _1592;
    int _1465 = (_1449 != 0) ? _1451 : _1439;
    int _1467 = (_1449 != 0) ? _1463 : 0;
    int _1469 = _1465;
    int _1471 = _1465;
    int _1473 = 30;
    int _1475;
    int _1604 = _47(_1469, _1471, _1473, _1475, gl_SubgroupInvocationID);
    int _1477 = _1604;
    int _1479 = _1453 + _1467;
    int _1481 = _1479;
    int _1483 = _1465;
    int _1485 = 31;
    int _1487;
    int _1610 = _47(_1481, _1483, _1485, _1487, gl_SubgroupInvocationID);
    int _1489 = _1610;
    int _1491 = (_1475 != 0) ? _1477 : _1465;
    int _1493 = (_1475 != 0) ? _1489 : 0;
    int _1495 = _1491;
    int _1497 = _1491;
    int _1499 = 30;
    int _1501;
    int _1622 = _47(_1495, _1497, _1499, _1501, gl_SubgroupInvocationID);
    int _1503 = _1622;
    int _1505 = _1479 + _1493;
    int _1507 = _1505;
    int _1509 = _1491;
    int _1511 = 31;
    int _1513;
    int _1628 = _47(_1507, _1509, _1511, _1513, gl_SubgroupInvocationID);
    int _1515 = _1628;
    int _1517 = (_1501 != 0) ? _1515 : 0;
    int _1519 = _1505 + _1517;
    _1355 = _1353;
    _1356 = 0;
    _1357 = _1479;
    _1358 = _1465;
    _1359 = _1453;
    _1360 = _1505;
    _1361 = _1491;
    _1362 = _1519;
    _1363 = _1501;
    _1364 = int(_1369);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _51 = as_type<float>(gl_WorkGroupID.x);
    float _53 = as_type<float>(gl_SubgroupInvocationID);
    int _55 = as_type<int>(_51) * 32;
    int _57 = _55 + as_type<int>(_53);
    int _59 = _57 << 2;
    uint _62 = uint(int(uint(_59) >> uint(2)));
    float _64 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_62)]);
    int _66 = as_type<int>(_64);
    int _68 = 0;
    int _70 = 0;
    int _72 = 0;
    int _74 = 0;
    int _76 = 128;
    int _78 = 0;
    int _80;
    int _82;
    int _84;
    int _86;
    int _88;
    int _90;
    int _92;
    int _94;
    int _96;
    int _98;
    _45(_66, _68, _70, _72, _74, _76, _78, _80, _82, _84, _86, _88, _90, _92, _94, _96, _98, gl_SubgroupInvocationID, gl_SubgroupLtMask);
    int _100 = _80;
    uint _102 = uint(int(uint(_59) >> uint(2)));
    float _104 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_102)]);
    uint _106 = spvSubgroupBallot(true).x;
    int _108 = reverse_bits(int(_106));
    int _110 = int(spvFindUMSB(uint(_108)));
    bool _114 = _110 != (-1);
    int _116 = _110 ^ 31;
    int _118 = _114 ? _116 : _110;
    bool _120 = as_type<int>(_53) != _118;
    if (_120)
    {
        _100 = 0;
    }
    int _122 = _100;
    uint _124 = spvSubgroupBallot(true).x;
    float _126 = spvSubgroupShuffle(_104, 0u);
    int _128 = int(_124) & 1;
    bool _130 = _128 != 0;
    int _132 = _130 ? as_type<int>(_126) : 0;
    float _134 = spvSubgroupShuffle(_104, 1u);
    int _136 = _132 + as_type<int>(_134);
    uint _138 = uint(int(uint(int(_124)) >> uint(1)));
    int _140 = int(_138) & 1;
    bool _142 = _140 != 0;
    int _144 = _142 ? _136 : _132;
    float _146 = spvSubgroupShuffle(_104, 2u);
    int _148 = _144 + as_type<int>(_146);
    uint _150 = uint(int(uint(int(_124)) >> uint(2)));
    int _152 = int(_150) & 1;
    bool _154 = _152 != 0;
    int _156 = _154 ? _148 : _144;
    float _158 = spvSubgroupShuffle(_104, 3u);
    int _160 = _156 + as_type<int>(_158);
    uint _162 = uint(int(uint(int(_124)) >> uint(3)));
    int _164 = int(_162) & 1;
    bool _166 = _164 != 0;
    int _168 = _166 ? _160 : _156;
    float _170 = spvSubgroupShuffle(_104, 4u);
    int _172 = _168 + as_type<int>(_170);
    uint _174 = uint(int(uint(int(_124)) >> uint(4)));
    int _176 = int(_174) & 1;
    bool _178 = _176 != 0;
    int _180 = _178 ? _172 : _168;
    float _182 = spvSubgroupShuffle(_104, 5u);
    int _184 = _180 + as_type<int>(_182);
    uint _186 = uint(int(uint(int(_124)) >> uint(5)));
    int _188 = int(_186) & 1;
    bool _190 = _188 != 0;
    int _192 = _190 ? _184 : _180;
    float _194 = spvSubgroupShuffle(_104, 6u);
    int _196 = _192 + as_type<int>(_194);
    uint _198 = uint(int(uint(int(_124)) >> uint(6)));
    int _200 = int(_198) & 1;
    bool _202 = _200 != 0;
    int _204 = _202 ? _196 : _192;
    float _206 = spvSubgroupShuffle(_104, 7u);
    int _208 = _204 + as_type<int>(_206);
    uint _210 = uint(int(uint(int(_124)) >> uint(7)));
    int _212 = int(_210) & 1;
    bool _214 = _212 != 0;
    int _216 = _214 ? _208 : _204;
    float _218 = spvSubgroupShuffle(_104, 8u);
    int _220 = _216 + as_type<int>(_218);
    uint _222 = uint(int(uint(int(_124)) >> uint(8)));
    int _224 = int(_222) & 1;
    bool _226 = _224 != 0;
    int _228 = _226 ? _220 : _216;
    float _230 = spvSubgroupShuffle(_104, 9u);
    int _232 = _228 + as_type<int>(_230);
    uint _234 = uint(int(uint(int(_124)) >> uint(9)));
    int _236 = int(_234) & 1;
    bool _238 = _236 != 0;
    int _240 = _238 ? _232 : _228;
    float _242 = spvSubgroupShuffle(_104, 10u);
    int _244 = _240 + as_type<int>(_242);
    uint _246 = uint(int(uint(int(_124)) >> uint(10)));
    int _248 = int(_246) & 1;
    bool _250 = _248 != 0;
    int _252 = _250 ? _244 : _240;
    float _254 = spvSubgroupShuffle(_104, 11u);
    int _256 = _252 + as_type<int>(_254);
    uint _258 = uint(int(uint(int(_124)) >> uint(11)));
    int _260 = int(_258) & 1;
    bool _262 = _260 != 0;
    int _264 = _262 ? _256 : _252;
    float _266 = spvSubgroupShuffle(_104, 12u);
    int _268 = _264 + as_type<int>(_266);
    uint _270 = uint(int(uint(int(_124)) >> uint(12)));
    int _272 = int(_270) & 1;
    bool _274 = _272 != 0;
    int _276 = _274 ? _268 : _264;
    float _278 = spvSubgroupShuffle(_104, 13u);
    int _280 = _276 + as_type<int>(_278);
    uint _282 = uint(int(uint(int(_124)) >> uint(13)));
    int _284 = int(_282) & 1;
    bool _286 = _284 != 0;
    int _288 = _286 ? _280 : _276;
    float _290 = spvSubgroupShuffle(_104, 14u);
    int _292 = _288 + as_type<int>(_290);
    uint _294 = uint(int(uint(int(_124)) >> uint(14)));
    int _296 = int(_294) & 1;
    bool _298 = _296 != 0;
    int _300 = _298 ? _292 : _288;
    float _302 = spvSubgroupShuffle(_104, 15u);
    int _304 = _300 + as_type<int>(_302);
    uint _306 = uint(int(uint(int(_124)) >> uint(15)));
    int _308 = int(_306) & 1;
    bool _310 = _308 != 0;
    int _312 = _310 ? _304 : _300;
    float _314 = spvSubgroupShuffle(_104, 16u);
    int _316 = _312 + as_type<int>(_314);
    uint _318 = uint(int(uint(int(_124)) >> uint(16)));
    int _320 = int(_318) & 1;
    bool _322 = _320 != 0;
    int _324 = _322 ? _316 : _312;
    float _326 = spvSubgroupShuffle(_104, 17u);
    int _328 = _324 + as_type<int>(_326);
    uint _330 = uint(int(uint(int(_124)) >> uint(17)));
    int _332 = int(_330) & 1;
    bool _334 = _332 != 0;
    int _336 = _334 ? _328 : _324;
    float _338 = spvSubgroupShuffle(_104, 18u);
    int _340 = _336 + as_type<int>(_338);
    uint _342 = uint(int(uint(int(_124)) >> uint(18)));
    int _344 = int(_342) & 1;
    bool _346 = _344 != 0;
    int _348 = _346 ? _340 : _336;
    float _350 = spvSubgroupShuffle(_104, 19u);
    int _352 = _348 + as_type<int>(_350);
    uint _354 = uint(int(uint(int(_124)) >> uint(19)));
    int _356 = int(_354) & 1;
    bool _358 = _356 != 0;
    int _360 = _358 ? _352 : _348;
    float _362 = spvSubgroupShuffle(_104, 20u);
    int _364 = _360 + as_type<int>(_362);
    uint _366 = uint(int(uint(int(_124)) >> uint(20)));
    int _368 = int(_366) & 1;
    bool _370 = _368 != 0;
    int _372 = _370 ? _364 : _360;
    float _374 = spvSubgroupShuffle(_104, 21u);
    int _376 = _372 + as_type<int>(_374);
    uint _378 = uint(int(uint(int(_124)) >> uint(21)));
    int _380 = int(_378) & 1;
    bool _382 = _380 != 0;
    int _384 = _382 ? _376 : _372;
    float _386 = spvSubgroupShuffle(_104, 22u);
    int _388 = _384 + as_type<int>(_386);
    uint _390 = uint(int(uint(int(_124)) >> uint(22)));
    int _392 = int(_390) & 1;
    bool _394 = _392 != 0;
    int _396 = _394 ? _388 : _384;
    float _398 = spvSubgroupShuffle(_104, 23u);
    int _400 = _396 + as_type<int>(_398);
    uint _402 = uint(int(uint(int(_124)) >> uint(23)));
    int _404 = int(_402) & 1;
    bool _406 = _404 != 0;
    int _408 = _406 ? _400 : _396;
    float _410 = spvSubgroupShuffle(_104, 24u);
    int _412 = _408 + as_type<int>(_410);
    uint _414 = uint(int(uint(int(_124)) >> uint(24)));
    int _416 = int(_414) & 1;
    bool _418 = _416 != 0;
    int _420 = _418 ? _412 : _408;
    float _422 = spvSubgroupShuffle(_104, 25u);
    int _424 = _420 + as_type<int>(_422);
    uint _426 = uint(int(uint(int(_124)) >> uint(25)));
    int _428 = int(_426) & 1;
    bool _430 = _428 != 0;
    int _432 = _430 ? _424 : _420;
    float _434 = spvSubgroupShuffle(_104, 26u);
    int _436 = _432 + as_type<int>(_434);
    uint _438 = uint(int(uint(int(_124)) >> uint(26)));
    int _440 = int(_438) & 1;
    bool _442 = _440 != 0;
    int _444 = _442 ? _436 : _432;
    float _446 = spvSubgroupShuffle(_104, 27u);
    int _448 = _444 + as_type<int>(_446);
    uint _450 = uint(int(uint(int(_124)) >> uint(27)));
    int _452 = int(_450) & 1;
    bool _454 = _452 != 0;
    int _456 = _454 ? _448 : _444;
    float _458 = spvSubgroupShuffle(_104, 28u);
    int _460 = _456 + as_type<int>(_458);
    uint _462 = uint(int(uint(int(_124)) >> uint(28)));
    int _464 = int(_462) & 1;
    bool _466 = _464 != 0;
    int _468 = _466 ? _460 : _456;
    float _470 = spvSubgroupShuffle(_104, 29u);
    int _472 = _468 + as_type<int>(_470);
    uint _474 = uint(int(uint(int(_124)) >> uint(29)));
    int _476 = int(_474) & 1;
    bool _478 = _476 != 0;
    int _480 = _478 ? _472 : _468;
    float _482 = spvSubgroupShuffle(_104, 30u);
    int _484 = _480 + as_type<int>(_482);
    uint _486 = uint(int(uint(int(_124)) >> uint(30)));
    int _488 = int(_486) & 1;
    bool _490 = _488 != 0;
    int _492 = _490 ? _484 : _480;
    float _494 = spvSubgroupShuffle(_104, 31u);
    int _496 = _492 + as_type<int>(_494);
    uint _498 = uint(int(uint(int(_124)) >> uint(31)));
    int _500 = int(_498) & 1;
    bool _502 = _500 != 0;
    int _504 = _502 ? _496 : _492;
    int _506 = _122;
    if (!_120)
    {
        int _508 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x) << 2;
        uint _510 = uint(int(uint(_508) >> uint(2)));
        uint _1300 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_510)], uint(_504), memory_order_relaxed);
        uint _512 = _1300;
        _506 = int(_512);
    }
    int _514 = _506;
    uint _516 = spvSubgroupBallot(true).x;
    int _518 = _57 * 20;
    int _520 = reverse_bits(int(_516));
    int _522 = _518 + 4;
    int _524 = _518 + 16;
    int _526 = int(spvFindUMSB(uint(_520)));
    bool _528 = _526 != (-1);
    int _530 = _526 ^ 31;
    int _532 = _528 ? _530 : _526;
    uint _534 = uint(int(uint(_522) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_534)] = 0u;
    int _536 = _514;
    int _538 = _532;
    int _540 = 31;
    int _542;
    int _1336 = _47(_536, _538, _540, _542, gl_SubgroupInvocationID);
    int _544 = _1336;
    int _546 = _94 + _544;
    uint _548 = uint(int(uint(_524) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_548)] = uint(_546);
}

