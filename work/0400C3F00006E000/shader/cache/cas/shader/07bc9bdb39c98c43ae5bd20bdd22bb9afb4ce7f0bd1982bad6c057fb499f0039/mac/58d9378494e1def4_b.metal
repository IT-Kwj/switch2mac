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
void _33(thread const int& _1553, thread const int& _1554, threadgroup spvUnsafeArray<uint, 593>& _24)
{
    uint _1557 = uint(int(uint(_1553) >> uint(2)));
    int _1559 = _1553 & 3;
    int _1561 = _1559 << 3;
    bool _1563;
    do
    {
        float _1565 = as_type<float>(_24[int(_1557)]);
        int _1567 = int(insert_bits(as_type<uint>(_1565), uint(_1554), uint(_1561), 8u));
        uint _1597 = as_type<uint>(_1565);
        uint _1602;
        do
        {
            _1602 = _1597;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_24[int(_1557)], &_1602, uint(_1567), memory_order_relaxed, memory_order_relaxed) && _1602 == _1597);
        uint _1569 = _1602;
        _1563 = int(_1569) != as_type<int>(_1565);
    } while (_1563);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 593>& _24)
{
    float _37 = as_type<float>(gl_SubgroupInvocationID);
    float _39 = as_type<float>(_24[4]);
    int _41 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z) << 4;
    int _43 = _41 + 32;
    uint _46 = uint(int(uint(_43) >> uint(2)));
    uint _48 = uint(int(uint(int(_46)) >> uint(2)));
    int _50 = int(_46) & 3;
    float _52 = (*spvDescriptorSet0.cp_c3)._m0[int(_48)][_50];
    uint _54 = spvSubgroupBallot(true).x;
    int _56 = reverse_bits(int(_54));
    float _58 = float(as_type<uint>(_37));
    int _60 = int(spvFindUMSB(uint(_56)));
    bool _64 = _60 != (-1);
    int _66 = _60 ^ 31;
    int _68 = _64 ? _66 : _60;
    int _70 = as_type<int>(_39) * 40;
    float _72 = _58 * 0.125;
    bool _74 = as_type<int>(_37) != _68;
    float _76 = _72 + 0.00999999977648258209228515625;
    float _78 = fma(_72, -3.0, 2.9700000286102294921875);
    int _80 = _70 + 48;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    float _84 = as_type<float>(_24[int(_82)]);
    float _86 = _72 + 0.13500000536441802978515625;
    float _88 = -_72;
    float _90 = _88 + 0.8650000095367431640625;
    float _92 = _76 * _78;
    int _94 = _70 + 52;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_24[int(_96)]);
    float _100 = _76 * _76;
    float _102 = fma(_72, -3.0, 2.5950000286102294921875);
    float _104 = -_72;
    float _106 = _104 + 0.9900000095367431640625;
    float _108 = _90 * _90;
    float _110 = _76 * _100;
    float _112 = _86 * _86;
    float _114 = _86 * _102;
    float _116 = _106 * _106;
    float _118 = _90 * _108;
    float _120 = _86 * _112;
    float _122 = _90 * _114;
    float _124 = _86 * _114;
    int _126 = _70 + 32;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_24[int(_128)]);
    float _132 = fma(_72, -3.0, 3.0);
    float _134 = _106 * _116;
    float _136 = -_72;
    float _138 = _136 + 1.0;
    int _140 = _70 + 36;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_24[int(_142)]);
    float _146 = _106 * _92;
    float _148 = _76 * _92;
    float _150 = fma(_72, -3.0, 2.625);
    float _152 = _72 + 0.125;
    float _154 = -_72;
    float _156 = _154 + 0.875;
    int _158 = _70 + 56;
    uint _160 = uint(int(uint(_158) >> uint(2)));
    float _162 = as_type<float>(_24[int(_160)]);
    float _164 = _72 * _132;
    float _166 = _138 * _138;
    float _168 = _152 * _150;
    int _170 = _70 + 60;
    uint _172 = uint(int(uint(_170) >> uint(2)));
    float _174 = as_type<float>(_24[int(_172)]);
    float _176 = _156 * _156;
    float _178 = _138 * _164;
    float _180 = _138 * _166;
    float _182 = _156 * _168;
    int _184 = _70 + 44;
    uint _186 = uint(int(uint(_184) >> uint(2)));
    float _188 = as_type<float>(_24[int(_186)]);
    float _190 = _156 * _176;
    float _192 = _84 * _178;
    float _194 = _98 * _178;
    float _196 = _84 * _146;
    float _198 = _98 * _146;
    float _200 = _84 * _182;
    int _202 = _70 + 40;
    uint _204 = uint(int(uint(_202) >> uint(2)));
    float _206 = as_type<float>(_24[int(_204)]);
    float _208 = _84 * _122;
    float _210 = _98 * _122;
    float _212 = fma(_130, _180, _192);
    float _214 = fma(_144, _180, _194);
    float _216 = _72 * _164;
    float _218 = fma(_130, _134, _196);
    float _220 = fma(_144, _134, _198);
    float _222 = _98 * _182;
    float _224 = fma(_130, _190, _200);
    float _226 = fma(_130, _118, _208);
    float _228 = _72 * _72;
    float _230 = fma(_144, _118, _210);
    float _232 = fma(_162, _216, _212);
    float _234 = fma(_174, _216, _214);
    float _236 = _152 * _168;
    float _238 = fma(_162, _148, _218);
    float _240 = fma(_174, _148, _220);
    float _242 = fma(_144, _190, _222);
    float _244 = _72 * _228;
    float _246 = _152 * _152;
    float _248 = fma(_162, _236, _224);
    float _250 = fma(_162, _124, _226);
    float _252 = fma(_174, _124, _230);
    float _254 = fma(_188, _110, _240);
    float _256 = fma(_174, _236, _242);
    float _258 = fma(_188, _244, _234);
    float _260 = _152 * _246;
    float _262 = fma(_206, _110, _238);
    float _264 = fma(_206, _244, _232);
    float _266 = -_258;
    float _268 = _266 + _254;
    float _270 = fma(_188, _260, _256);
    float _272 = fma(_188, _120, _252);
    float _274 = -_264;
    float _276 = _274 + _262;
    float _278 = _268 * _268;
    float _280 = fma(_206, _260, _248);
    float _282 = fma(_206, _120, _250);
    float _284 = -_270;
    float _286 = _284 + _272;
    float _288 = fma(_276, _276, _278);
    int _290 = _70 + 64;
    uint _292 = uint(int(uint(_290) >> uint(2)));
    float _294 = as_type<float>(_24[int(_292)]);
    float _296 = -_280;
    float _298 = _296 + _282;
    float _300 = _286 * _286;
    int _302 = _70 + 68;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    float _306 = as_type<float>(_24[int(_304)]);
    float _308 = rsqrt(_288);
    float _310 = fma(_298, _298, _300);
    float _312 = rsqrt(_310);
    float _314 = _276 * _308;
    float _316 = _268 * _308;
    float _318 = -_314;
    float _320 = fma(_294, _318, _258);
    float _322 = _258 + _314;
    float _324 = _286 * _312;
    float _326 = fma(_294, _316, _264);
    float _328 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _330 = _320 + _328;
    float _332 = _298 * _312;
    int _334 = as_type<int>(_37) << 2;
    float _336 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _338 = _326 + _336;
    float _340 = _330 * _52;
    float _342 = _340 * 2.0;
    float _344 = -_316;
    float _346 = _264 + _344;
    float _348 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _350 = _322 + _348;
    float _352 = _338 * _52;
    float _354 = _352 * 2.0;
    int _356 = _334 << 2;
    float _358 = -_332;
    float _360 = fma(_294, _358, _270);
    float _362 = -_342;
    float _364 = _362 + (-0.0);
    float _366 = _270 + _332;
    float _368 = fma(_294, _324, _280);
    int _370 = _334 + 1;
    float _372 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _374 = _346 + _372;
    float _376 = _350 * _52;
    float _378 = _376 * 2.0;
    float _380 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _382 = _360 + _380;
    int _384 = _356 + 1424;
    uint _386 = uint(int(uint(_384) >> uint(2)));
    _24[int(_386)] = as_type<uint>(_354);
    float _388 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _390 = _368 + _388;
    int _392 = _334 + 2;
    int _394 = _356 + 1552;
    uint _396 = uint(int(uint(_394) >> uint(2)));
    _24[int(_396)] = as_type<uint>(_364);
    int _398 = _370 << 2;
    float _400 = _374 * _52;
    float _402 = _400 * 2.0;
    float _404 = -_324;
    float _406 = _280 + _404;
    float _408 = _382 * _52;
    float _410 = _408 * 2.0;
    float _412 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _414 = _366 + _412;
    int _416 = _356 + 1680;
    uint _418 = uint(int(uint(_416) >> uint(2)));
    _24[int(_418)] = 0u;
    int _420 = _392 << 2;
    float _422 = _390 * _52;
    float _424 = _422 * 2.0;
    float _426 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _428 = _406 + _426;
    float _430 = -_378;
    float _432 = _430 + (-0.0);
    int _434 = _356 + 1808;
    uint _436 = uint(int(uint(_434) >> uint(2)));
    _24[int(_436)] = 1065353216u;
    int _438 = _334 + 3;
    float _440 = -_410;
    float _442 = _440 + (-0.0);
    float _444 = _414 * _52;
    float _446 = _444 * 2.0;
    int _448 = _398 + 1424;
    uint _450 = uint(int(uint(_448) >> uint(2)));
    _24[int(_450)] = as_type<uint>(_402);
    int _452 = _438 << 2;
    float _454 = _428 * _52;
    float _456 = _454 * 2.0;
    float _458 = -_446;
    float _460 = _458 + (-0.0);
    int _462 = _398 + 1552;
    uint _464 = uint(int(uint(_462) >> uint(2)));
    _24[int(_464)] = as_type<uint>(_432);
    int _466 = _398 + 1680;
    uint _468 = uint(int(uint(_466) >> uint(2)));
    _24[int(_468)] = 0u;
    int _470 = _398 + 1808;
    uint _472 = uint(int(uint(_470) >> uint(2)));
    _24[int(_472)] = 1065353216u;
    int _474 = _420 + 1424;
    uint _476 = uint(int(uint(_474) >> uint(2)));
    _24[int(_476)] = as_type<uint>(_424);
    int _478 = _420 + 1552;
    uint _480 = uint(int(uint(_478) >> uint(2)));
    _24[int(_480)] = as_type<uint>(_442);
    int _482 = _420 + 1680;
    uint _484 = uint(int(uint(_482) >> uint(2)));
    _24[int(_484)] = 0u;
    int _486 = _334 & 255;
    int _488 = as_type<int>(_37) * 6;
    int _490 = _420 + 1808;
    uint _492 = uint(int(uint(_490) >> uint(2)));
    _24[int(_492)] = 1065353216u;
    int _494 = as_type<int>(_37) << 1;
    int _496 = _486 + 1;
    int _498 = _452 + 1424;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    _24[int(_500)] = as_type<uint>(_456);
    int _502 = _486 + 2;
    int _504 = _486 + 3;
    int _506 = _452 + 1552;
    uint _508 = uint(int(uint(_506) >> uint(2)));
    _24[int(_508)] = as_type<uint>(_460);
    int _510 = _494 + 1;
    int _512 = _494 << 2;
    int _514 = _512 + 768;
    int _516 = _452 + 1680;
    uint _518 = uint(int(uint(_516) >> uint(2)));
    _24[int(_518)] = 0u;
    int _520 = _510 << 2;
    int _522 = _520 + 768;
    int _524 = _452 + 1808;
    uint _526 = uint(int(uint(_524) >> uint(2)));
    _24[int(_526)] = 1065353216u;
    int _528 = _488 + 2324;
    int _530 = _528;
    int _532 = _486;
    _33(_530, _532, _24);
    int _534 = _488 + 2325;
    int _536 = _534;
    int _538 = _496;
    _33(_536, _538, _24);
    int _540 = _488 + 2326;
    int _542 = _540;
    int _544 = _502;
    _33(_542, _544, _24);
    int _546 = _488 + 2327;
    int _548 = _546;
    int _550 = _496;
    _33(_548, _550, _24);
    int _552 = _488 + 2328;
    int _554 = _552;
    int _556 = _504;
    _33(_554, _556, _24);
    int _558 = _488 + 2329;
    int _560 = _558;
    int _562 = _502;
    _33(_560, _562, _24);
    int _564 = _356 + 1936;
    uint _566 = uint(int(uint(_564) >> uint(2)));
    _24[int(_566)] = as_type<uint>(_72);
    int _568 = _356 + 2064;
    uint _570 = uint(int(uint(_568) >> uint(2)));
    _24[int(_570)] = 0u;
    int _572 = _398 + 1936;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    _24[int(_574)] = as_type<uint>(_72);
    int _576 = _398 + 2064;
    uint _578 = uint(int(uint(_576) >> uint(2)));
    _24[int(_578)] = 1065353216u;
    int _580 = _420 + 1936;
    uint _582 = uint(int(uint(_580) >> uint(2)));
    _24[int(_582)] = as_type<uint>(_152);
    int _584 = _420 + 2064;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    _24[int(_586)] = 0u;
    int _588 = _452 + 1936;
    uint _590 = uint(int(uint(_588) >> uint(2)));
    _24[int(_590)] = as_type<uint>(_152);
    int _592 = _452 + 2064;
    uint _594 = uint(int(uint(_592) >> uint(2)));
    _24[int(_594)] = 1065353216u;
    int _596 = _514 + 1424;
    uint _598 = uint(int(uint(_596) >> uint(2)));
    _24[int(_598)] = as_type<uint>(_306);
    int _600 = _522 + 1424;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    _24[int(_602)] = as_type<uint>(_306);
    if (_74)
    {
        return;
    }
    int _604 = 2323;
    int _606 = 16;
    _33(_604, _606, _24);
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
