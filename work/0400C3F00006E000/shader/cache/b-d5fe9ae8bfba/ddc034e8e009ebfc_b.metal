#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
};

static inline __attribute__((always_inline))
void _33(thread const int& _1549, thread const int& _1550, threadgroup spvUnsafeArray<uint, 593>& _24)
{
    uint _1553 = uint(int(uint(_1549) >> uint(2)));
    int _1555 = _1549 & 3;
    int _1557 = _1555 << 3;
    bool _1559;
    do
    {
        float _1561 = as_type<float>(_24[int(_1553)]);
        int _1563 = int(insert_bits(as_type<uint>(_1561), uint(_1550), uint(_1557), 8u));
        uint _1593 = as_type<uint>(_1561);
        uint _1598;
        do
        {
            _1598 = _1593;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_24[int(_1553)], &_1598, uint(_1563), memory_order_relaxed, memory_order_relaxed) && _1598 == _1593);
        uint _1565 = _1598;
        _1559 = int(_1565) != as_type<int>(_1561);
    } while (_1559);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 593>& _24)
{
    float _37 = as_type<float>(gl_SubgroupInvocationID);
    float _39 = as_type<float>(_24[4]);
    int _41 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z) << 4;
    uint _44 = uint(int(uint(_41) >> uint(2)));
    uint _46 = uint(int(uint(int(_44)) >> uint(2)));
    int _48 = int(_44) & 3;
    float _50 = (*spvDescriptorSet0.cp_c3)._m0[int(_46)][_48];
    uint _52 = spvSubgroupBallot(true).x;
    int _54 = reverse_bits(int(_52));
    float _56 = float(as_type<uint>(_37));
    int _58 = int(spvFindUMSB(uint(_54)));
    bool _62 = _58 != (-1);
    int _64 = _58 ^ 31;
    int _66 = _62 ? _64 : _58;
    int _68 = as_type<int>(_39) * 40;
    float _70 = _56 * 0.125;
    bool _72 = as_type<int>(_37) != _66;
    float _74 = _70 + 0.00999999977648258209228515625;
    float _76 = fma(_70, -3.0, 2.9700000286102294921875);
    int _78 = _68 + 48;
    uint _80 = uint(int(uint(_78) >> uint(2)));
    float _82 = as_type<float>(_24[int(_80)]);
    float _84 = _70 + 0.13500000536441802978515625;
    float _86 = -_70;
    float _88 = _86 + 0.8650000095367431640625;
    float _90 = _74 * _76;
    int _92 = _68 + 52;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>(_24[int(_94)]);
    float _98 = _74 * _74;
    float _100 = fma(_70, -3.0, 2.5950000286102294921875);
    float _102 = -_70;
    float _104 = _102 + 0.9900000095367431640625;
    float _106 = _88 * _88;
    float _108 = _74 * _98;
    float _110 = _84 * _84;
    float _112 = _84 * _100;
    float _114 = _104 * _104;
    float _116 = _88 * _106;
    float _118 = _84 * _110;
    float _120 = _88 * _112;
    float _122 = _84 * _112;
    int _124 = _68 + 32;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_24[int(_126)]);
    float _130 = fma(_70, -3.0, 3.0);
    float _132 = _104 * _114;
    float _134 = -_70;
    float _136 = _134 + 1.0;
    int _138 = _68 + 36;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_24[int(_140)]);
    float _144 = _104 * _90;
    float _146 = _74 * _90;
    float _148 = fma(_70, -3.0, 2.625);
    float _150 = _70 + 0.125;
    float _152 = -_70;
    float _154 = _152 + 0.875;
    int _156 = _68 + 56;
    uint _158 = uint(int(uint(_156) >> uint(2)));
    float _160 = as_type<float>(_24[int(_158)]);
    float _162 = _70 * _130;
    float _164 = _136 * _136;
    float _166 = _150 * _148;
    int _168 = _68 + 60;
    uint _170 = uint(int(uint(_168) >> uint(2)));
    float _172 = as_type<float>(_24[int(_170)]);
    float _174 = _154 * _154;
    float _176 = _136 * _162;
    float _178 = _136 * _164;
    float _180 = _154 * _166;
    int _182 = _68 + 44;
    uint _184 = uint(int(uint(_182) >> uint(2)));
    float _186 = as_type<float>(_24[int(_184)]);
    float _188 = _154 * _174;
    float _190 = _82 * _176;
    float _192 = _96 * _176;
    float _194 = _82 * _144;
    float _196 = _96 * _144;
    float _198 = _82 * _180;
    int _200 = _68 + 40;
    uint _202 = uint(int(uint(_200) >> uint(2)));
    float _204 = as_type<float>(_24[int(_202)]);
    float _206 = _82 * _120;
    float _208 = _96 * _120;
    float _210 = fma(_128, _178, _190);
    float _212 = fma(_142, _178, _192);
    float _214 = _70 * _162;
    float _216 = fma(_128, _132, _194);
    float _218 = fma(_142, _132, _196);
    float _220 = _96 * _180;
    float _222 = fma(_128, _188, _198);
    float _224 = fma(_128, _116, _206);
    float _226 = _70 * _70;
    float _228 = fma(_142, _116, _208);
    float _230 = fma(_160, _214, _210);
    float _232 = fma(_172, _214, _212);
    float _234 = _150 * _166;
    float _236 = fma(_160, _146, _216);
    float _238 = fma(_172, _146, _218);
    float _240 = fma(_142, _188, _220);
    float _242 = _70 * _226;
    float _244 = _150 * _150;
    float _246 = fma(_160, _234, _222);
    float _248 = fma(_160, _122, _224);
    float _250 = fma(_172, _122, _228);
    float _252 = fma(_186, _108, _238);
    float _254 = fma(_172, _234, _240);
    float _256 = fma(_186, _242, _232);
    float _258 = _150 * _244;
    float _260 = fma(_204, _108, _236);
    float _262 = fma(_204, _242, _230);
    float _264 = -_256;
    float _266 = _264 + _252;
    float _268 = fma(_186, _258, _254);
    float _270 = fma(_186, _118, _250);
    float _272 = -_262;
    float _274 = _272 + _260;
    float _276 = _266 * _266;
    float _278 = fma(_204, _258, _246);
    float _280 = fma(_204, _118, _248);
    float _282 = -_268;
    float _284 = _282 + _270;
    float _286 = fma(_274, _274, _276);
    int _288 = _68 + 64;
    uint _290 = uint(int(uint(_288) >> uint(2)));
    float _292 = as_type<float>(_24[int(_290)]);
    float _294 = -_278;
    float _296 = _294 + _280;
    float _298 = _284 * _284;
    int _300 = _68 + 68;
    uint _302 = uint(int(uint(_300) >> uint(2)));
    float _304 = as_type<float>(_24[int(_302)]);
    float _306 = rsqrt(_286);
    float _308 = fma(_296, _296, _298);
    float _310 = rsqrt(_308);
    float _312 = _274 * _306;
    float _314 = _266 * _306;
    float _316 = -_312;
    float _318 = fma(_292, _316, _256);
    float _320 = _256 + _312;
    float _322 = _284 * _310;
    float _324 = fma(_292, _314, _262);
    float _326 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _328 = _318 + _326;
    float _330 = _296 * _310;
    int _332 = as_type<int>(_37) << 2;
    float _334 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _336 = _324 + _334;
    float _338 = _328 * _50;
    float _340 = _338 * 2.0;
    float _342 = -_314;
    float _344 = _262 + _342;
    float _346 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _348 = _320 + _346;
    float _350 = _336 * _50;
    float _352 = _350 * 2.0;
    int _354 = _332 << 2;
    float _356 = -_330;
    float _358 = fma(_292, _356, _268);
    float _360 = -_340;
    float _362 = _360 + (-0.0);
    float _364 = _268 + _330;
    float _366 = fma(_292, _322, _278);
    int _368 = _332 + 1;
    float _370 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _372 = _344 + _370;
    float _374 = _348 * _50;
    float _376 = _374 * 2.0;
    float _378 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _380 = _358 + _378;
    int _382 = _354 + 1424;
    uint _384 = uint(int(uint(_382) >> uint(2)));
    _24[int(_384)] = as_type<uint>(_352);
    float _386 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _388 = _366 + _386;
    int _390 = _332 + 2;
    int _392 = _354 + 1552;
    uint _394 = uint(int(uint(_392) >> uint(2)));
    _24[int(_394)] = as_type<uint>(_362);
    int _396 = _368 << 2;
    float _398 = _372 * _50;
    float _400 = _398 * 2.0;
    float _402 = -_322;
    float _404 = _278 + _402;
    float _406 = _380 * _50;
    float _408 = _406 * 2.0;
    float _410 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _412 = _364 + _410;
    int _414 = _354 + 1680;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    _24[int(_416)] = 0u;
    int _418 = _390 << 2;
    float _420 = _388 * _50;
    float _422 = _420 * 2.0;
    float _424 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _426 = _404 + _424;
    float _428 = -_376;
    float _430 = _428 + (-0.0);
    int _432 = _354 + 1808;
    uint _434 = uint(int(uint(_432) >> uint(2)));
    _24[int(_434)] = 1065353216u;
    int _436 = _332 + 3;
    float _438 = -_408;
    float _440 = _438 + (-0.0);
    float _442 = _412 * _50;
    float _444 = _442 * 2.0;
    int _446 = _396 + 1424;
    uint _448 = uint(int(uint(_446) >> uint(2)));
    _24[int(_448)] = as_type<uint>(_400);
    int _450 = _436 << 2;
    float _452 = _426 * _50;
    float _454 = _452 * 2.0;
    float _456 = -_444;
    float _458 = _456 + (-0.0);
    int _460 = _396 + 1552;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    _24[int(_462)] = as_type<uint>(_430);
    int _464 = _396 + 1680;
    uint _466 = uint(int(uint(_464) >> uint(2)));
    _24[int(_466)] = 0u;
    int _468 = _396 + 1808;
    uint _470 = uint(int(uint(_468) >> uint(2)));
    _24[int(_470)] = 1065353216u;
    int _472 = _418 + 1424;
    uint _474 = uint(int(uint(_472) >> uint(2)));
    _24[int(_474)] = as_type<uint>(_422);
    int _476 = _418 + 1552;
    uint _478 = uint(int(uint(_476) >> uint(2)));
    _24[int(_478)] = as_type<uint>(_440);
    int _480 = _418 + 1680;
    uint _482 = uint(int(uint(_480) >> uint(2)));
    _24[int(_482)] = 0u;
    int _484 = _332 & 255;
    int _486 = as_type<int>(_37) * 6;
    int _488 = _418 + 1808;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    _24[int(_490)] = 1065353216u;
    int _492 = as_type<int>(_37) << 1;
    int _494 = _484 + 1;
    int _496 = _450 + 1424;
    uint _498 = uint(int(uint(_496) >> uint(2)));
    _24[int(_498)] = as_type<uint>(_454);
    int _500 = _484 + 2;
    int _502 = _484 + 3;
    int _504 = _450 + 1552;
    uint _506 = uint(int(uint(_504) >> uint(2)));
    _24[int(_506)] = as_type<uint>(_458);
    int _508 = _492 + 1;
    int _510 = _492 << 2;
    int _512 = _510 + 768;
    int _514 = _450 + 1680;
    uint _516 = uint(int(uint(_514) >> uint(2)));
    _24[int(_516)] = 0u;
    int _518 = _508 << 2;
    int _520 = _518 + 768;
    int _522 = _450 + 1808;
    uint _524 = uint(int(uint(_522) >> uint(2)));
    _24[int(_524)] = 1065353216u;
    int _526 = _486 + 2324;
    int _528 = _526;
    int _530 = _484;
    _33(_528, _530, _24);
    int _532 = _486 + 2325;
    int _534 = _532;
    int _536 = _494;
    _33(_534, _536, _24);
    int _538 = _486 + 2326;
    int _540 = _538;
    int _542 = _500;
    _33(_540, _542, _24);
    int _544 = _486 + 2327;
    int _546 = _544;
    int _548 = _494;
    _33(_546, _548, _24);
    int _550 = _486 + 2328;
    int _552 = _550;
    int _554 = _502;
    _33(_552, _554, _24);
    int _556 = _486 + 2329;
    int _558 = _556;
    int _560 = _500;
    _33(_558, _560, _24);
    int _562 = _354 + 1936;
    uint _564 = uint(int(uint(_562) >> uint(2)));
    _24[int(_564)] = as_type<uint>(_70);
    int _566 = _354 + 2064;
    uint _568 = uint(int(uint(_566) >> uint(2)));
    _24[int(_568)] = 0u;
    int _570 = _396 + 1936;
    uint _572 = uint(int(uint(_570) >> uint(2)));
    _24[int(_572)] = as_type<uint>(_70);
    int _574 = _396 + 2064;
    uint _576 = uint(int(uint(_574) >> uint(2)));
    _24[int(_576)] = 1065353216u;
    int _578 = _418 + 1936;
    uint _580 = uint(int(uint(_578) >> uint(2)));
    _24[int(_580)] = as_type<uint>(_150);
    int _582 = _418 + 2064;
    uint _584 = uint(int(uint(_582) >> uint(2)));
    _24[int(_584)] = 0u;
    int _586 = _450 + 1936;
    uint _588 = uint(int(uint(_586) >> uint(2)));
    _24[int(_588)] = as_type<uint>(_150);
    int _590 = _450 + 2064;
    uint _592 = uint(int(uint(_590) >> uint(2)));
    _24[int(_592)] = 1065353216u;
    int _594 = _512 + 1424;
    uint _596 = uint(int(uint(_594) >> uint(2)));
    _24[int(_596)] = as_type<uint>(_304);
    int _598 = _520 + 1424;
    uint _600 = uint(int(uint(_598) >> uint(2)));
    _24[int(_600)] = as_type<uint>(_304);
    if (_72)
    {
        return;
    }
    int _602 = 2323;
    int _604 = 16;
    _33(_602, _604, _24);
}


struct dm_payload_t { uint w[352]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a1 [[user(locn1)]];
};
struct dm_prim_t {
    float4 p0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, dm_prim_t, 32, 16, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 593> _24;
    for (uint i = dm_lid; i < 593u; i += 8u) _24[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 352u; i += 8u) _24[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _24[0] = dm_tg; _24[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _24);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_24[580] >> 24, 16u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 32u; n += 8u)
    {
        uint b = 356u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_24[b + 0u]), as_type<float>(_24[b + 32u]), as_type<float>(_24[b + 64u]), as_type<float>(_24[b + 96u]));
        v.a1 = float4(as_type<float>(_24[b + 128u]), as_type<float>(_24[b + 160u]), 0.0, 1.0);
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 8u)
    {
        uint b = 356u + (n / 32u) * 224u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_24[b + 192u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 8u)
    {
        uint at = 2324u + n;
        dm_out.set_index(n, (_24[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 593> _24;
    for (uint i = dm_lid; i < 593u; i += 8u) _24[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 352u; i += 8u) _24[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _24[0] = dm_tg; _24[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _24);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_24[580] >> 24, 16u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 32u; n += 8u)
    {
        uint b = 356u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_24[b + 0u]), as_type<float>(_24[b + 32u]), as_type<float>(_24[b + 64u]), as_type<float>(_24[b + 96u]));
        v.a1 = float4(as_type<float>(_24[b + 128u]), as_type<float>(_24[b + 160u]), 0.0, 1.0);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 8u)
    {
        uint b = 356u + (n / 32u) * 224u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_24[b + 192u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 8u)
    {
        uint at = 2324u + n;
        dm_out.set_index(n, (_24[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
