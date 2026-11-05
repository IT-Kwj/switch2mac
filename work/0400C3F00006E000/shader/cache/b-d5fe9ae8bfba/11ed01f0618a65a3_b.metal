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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    const device _27* cp_s0 [[id(3)]];
};

static inline __attribute__((always_inline))
void _48(thread const int& _1420, thread const int& _1421, threadgroup spvUnsafeArray<uint, 853>& _35)
{
    uint _1424 = uint(int(uint(_1420) >> uint(2)));
    int _1426 = _1420 & 3;
    int _1428 = _1426 << 3;
    bool _1430;
    do
    {
        float _1432 = as_type<float>(_35[int(_1424)]);
        int _1434 = int(insert_bits(as_type<uint>(_1432), uint(_1421), uint(_1428), 8u));
        uint _1464 = as_type<uint>(_1432);
        uint _1469;
        do
        {
            _1469 = _1464;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_35[int(_1424)], &_1469, uint(_1434), memory_order_relaxed, memory_order_relaxed) && _1469 == _1464);
        uint _1436 = _1469;
        _1430 = int(_1436) != as_type<int>(_1432);
    } while (_1430);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 853>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _52 = as_type<float>(_35[0]);
    float _54 = as_type<float>(gl_SubgroupInvocationID);
    int _56 = as_type<int>(_52) << 5;
    int _58 = _56 + as_type<int>(_54);
    bool _62 = uint(_58) >= as_type<uint>((*spvDescriptorSet0.cp_c5)._m0[0].y);
    if (_62)
    {
        return;
    }
    int _64 = _58 * 48;
    uint _67 = uint(int(uint(_64) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_67)];
    float _69 = as_type<float>(_dmw0.x);
    int _71 = _64 + 4;
    uint _73 = uint(int(uint(_71) >> uint(2)));
    float _75 = as_type<float>(_dmw0.y);
    int _77 = _64 + 8;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    float _81 = as_type<float>(_dmw0.z);
    int _83 = _64 + 12;
    uint _85 = uint(int(uint(_83) >> uint(2)));
    float _87 = as_type<float>(_dmw0.w);
    int _89 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _91 = _89 << 4;
    int _93 = _91 + 12;
    uint _95 = uint(int(uint(_93) >> uint(2)));
    uint _97 = uint(int(uint(int(_95)) >> uint(2)));
    int _99 = int(_95) & 3;
    float _101 = (*spvDescriptorSet0.cp_c3)._m0[int(_97)][_99];
    int _103 = _91 + 4;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c3)._m0[int(_107)][_109];
    float _113 = _101 * _111;
    float _115 = fma(_113, 0.5, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _117 = fma(_113, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    bool _119 = _69 > _115;
    bool _121 = isnan(_69);
    bool _123 = _119 || _121;
    bool _125 = isnan(_115);
    bool _127 = _123 || _125;
    float _129 = fma(_113, 0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _131 = _81 >= _117;
    bool _133 = !_127;
    bool _135 = _131 && _133;
    float _137 = fma(_113, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _139 = _75 <= _129;
    bool _141 = _139 && _135;
    bool _143 = _87 >= _137;
    bool _145 = _143 && _141;
    if (!_145)
    {
        return;
    }
    int _147 = _64 + 16;
    int _149 = _64 + 24;
    int _151 = _64 + 32;
    int _153 = _64 + 40;
    uint _155 = uint(int(uint(_147) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_155)];
    float _157 = as_type<float>(_dmw1.x);
    int _159 = _147 + 4;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>(_dmw1.y);
    uint _165 = uint(int(uint(_149) >> uint(2)));
    float _167 = as_type<float>(_dmw1.z);
    int _169 = _149 + 4;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    float _173 = as_type<float>(_dmw1.w);
    uint _175 = uint(int(uint(_151) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_175)];
    float _177 = as_type<float>(_dmw2.x);
    int _179 = _151 + 4;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw2.y);
    uint _185 = uint(int(uint(_153) >> uint(2)));
    float _187 = as_type<float>(_dmw2.z);
    int _189 = _153 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>(_dmw2.w);
    uint _195 = spvSubgroupBallot(true).x;
    uint _197 = uint(int(uint(_91) >> uint(2)));
    uint _199 = uint(int(uint(int(_197)) >> uint(2)));
    int _201 = int(_197) & 3;
    float _203 = (*spvDescriptorSet0.cp_c3)._m0[int(_199)][_201];
    int _205 = reverse_bits(int(_195));
    float _207 = as_type<float>(gl_SubgroupLtMask.x);
    int _209 = int(spvFindUMSB(uint(_205)));
    bool _211 = _209 != (-1);
    int _213 = _209 ^ 31;
    int _215 = _211 ? _213 : _209;
    bool _217 = as_type<int>(_54) != _215;
    int _219 = 0;
    if (!_217)
    {
        int _221 = popcount(int(_195));
        _219 = _221;
    }
    int _223 = _219;
    int _225 = as_type<int>(_207) & int(_195);
    int _227 = popcount(_225);
    int _229 = _227 << 2;
    int _231 = _227 * 6;
    int _233 = _229 << 2;
    uint _235 = uint(int(uint(_229) >> uint(5)));
    int _237 = 124 & _233;
    int _239 = _229 + 1;
    int _241 = _229 + 2;
    int _243 = int(_235) * 768;
    int _245 = _243 + _237;
    uint _247 = uint(int(uint(_239) >> uint(5)));
    float _249 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _251 = _163 + _249;
    float _253 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _255 = _157 + _253;
    float _257 = fma(_157, 6.2500002968590706586837768554688e-05, 0.5);
    float _259 = fma(_163, 6.2500002968590706586837768554688e-05, 0.5);
    float _261 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _263 = _167 + _261;
    float _265 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _267 = _173 + _265;
    float _269 = fma(_167, 6.2500002968590706586837768554688e-05, 0.5);
    float _271 = fma(_173, 6.2500002968590706586837768554688e-05, 0.5);
    float _273 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _275 = _177 + _273;
    float _277 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _279 = _183 + _277;
    float _281 = fma(_177, 6.2500002968590706586837768554688e-05, 0.5);
    float _283 = fma(_183, 6.2500002968590706586837768554688e-05, 0.5);
    float _285 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _287 = _187 + _285;
    float _289 = fma(_187, 6.2500002968590706586837768554688e-05, 0.5);
    float _291 = fma(_193, 6.2500002968590706586837768554688e-05, 0.5);
    float _293 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _295 = _193 + _293;
    float _297 = _251 * _203;
    float _299 = _297 * 2.0;
    float _301 = _263 * _203;
    float _303 = _301 * 2.0;
    float _305 = _267 * _203;
    float _307 = _305 * 2.0;
    int _309 = as_type<int>(_251);
    if (!_217)
    {
        int _311 = _223 << 1;
        _309 = _311;
    }
    int _313 = _309;
    float _315 = _255 * _203;
    float _317 = _315 * 2.0;
    int _319 = _229 + 3;
    float _321 = _275 * _203;
    float _323 = _321 * 2.0;
    int _325 = _239 << 2;
    if (!_217)
    {
        int _327 = 3219;
        int _329 = _313;
        _48(_327, _329, _35);
    }
    int _331 = _241 << 2;
    float _333 = _279 * _203;
    float _335 = _333 * 2.0;
    int _337 = _319 << 2;
    int _339 = _245 + 144;
    uint _341 = uint(int(uint(_339) >> uint(2)));
    _35[int(_341)] = as_type<uint>(_317);
    int _343 = 124 & _325;
    float _345 = -_307;
    float _347 = _345 + (-0.0);
    uint _349 = uint(int(uint(_241) >> uint(5)));
    float _351 = _287 * _203;
    float _353 = _351 * 2.0;
    int _355 = 124 & _331;
    int _357 = int(_247) * 768;
    int _359 = _357 + _343;
    uint _361 = uint(int(uint(_319) >> uint(5)));
    float _363 = _295 * _203;
    float _365 = _363 * 2.0;
    int _367 = 124 & _337;
    float _369 = -_299;
    float _371 = _369 + (-0.0);
    int _373 = int(_349) * 768;
    int _375 = _373 + _355;
    int _377 = _229 & 255;
    int _379 = int(_361) * 768;
    int _381 = _379 + _367;
    int _383 = _245 + 272;
    uint _385 = uint(int(uint(_383) >> uint(2)));
    _35[int(_385)] = as_type<uint>(_371);
    float _387 = -_335;
    float _389 = _387 + (-0.0);
    int _391 = _377 + 1;
    int _393 = _245 + 400;
    uint _395 = uint(int(uint(_393) >> uint(2)));
    _35[int(_395)] = 0u;
    int _397 = _377 + 2;
    int _399 = _245 + 528;
    uint _401 = uint(int(uint(_399) >> uint(2)));
    _35[int(_401)] = 1065353216u;
    float _403 = -_365;
    float _405 = _403 + (-0.0);
    int _407 = _359 + 144;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _35[int(_409)] = as_type<uint>(_303);
    int _411 = _359 + 272;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _35[int(_413)] = as_type<uint>(_347);
    int _415 = _359 + 400;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _35[int(_417)] = 0u;
    int _419 = _359 + 528;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _35[int(_421)] = 1065353216u;
    int _423 = _375 + 144;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    _35[int(_425)] = as_type<uint>(_323);
    int _427 = _375 + 272;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    _35[int(_429)] = as_type<uint>(_389);
    int _431 = _375 + 400;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _35[int(_433)] = 0u;
    int _435 = _377 + 3;
    int _437 = _375 + 528;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _35[int(_439)] = 1065353216u;
    int _441 = _381 + 144;
    uint _443 = uint(int(uint(_441) >> uint(2)));
    _35[int(_443)] = as_type<uint>(_353);
    int _445 = _381 + 272;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    _35[int(_447)] = as_type<uint>(_405);
    int _449 = _381 + 400;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    _35[int(_451)] = 0u;
    int _453 = _381 + 528;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    _35[int(_455)] = 1065353216u;
    int _457 = _231 + 3220;
    int _459 = _457;
    int _461 = _377;
    _48(_459, _461, _35);
    int _463 = _231 + 3221;
    int _465 = _463;
    int _467 = _391;
    _48(_465, _467, _35);
    int _469 = _231 + 3222;
    int _471 = _469;
    int _473 = _397;
    _48(_471, _473, _35);
    int _475 = _231 + 3223;
    int _477 = _475;
    int _479 = _391;
    _48(_477, _479, _35);
    int _481 = _231 + 3224;
    int _483 = _481;
    int _485 = _435;
    _48(_483, _485, _35);
    int _487 = _231 + 3225;
    int _489 = _487;
    int _491 = _397;
    _48(_489, _491, _35);
    int _493 = _245 + 656;
    uint _495 = uint(int(uint(_493) >> uint(2)));
    _35[int(_495)] = 0u;
    int _497 = _245 + 784;
    uint _499 = uint(int(uint(_497) >> uint(2)));
    _35[int(_499)] = 0u;
    int _501 = _359 + 656;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    _35[int(_503)] = 0u;
    int _505 = _359 + 784;
    uint _507 = uint(int(uint(_505) >> uint(2)));
    _35[int(_507)] = 1065353216u;
    int _509 = _375 + 656;
    uint _511 = uint(int(uint(_509) >> uint(2)));
    _35[int(_511)] = 1065353216u;
    int _513 = _375 + 784;
    uint _515 = uint(int(uint(_513) >> uint(2)));
    _35[int(_515)] = 0u;
    int _517 = _381 + 656;
    uint _519 = uint(int(uint(_517) >> uint(2)));
    _35[int(_519)] = 1065353216u;
    int _521 = _381 + 784;
    uint _523 = uint(int(uint(_521) >> uint(2)));
    _35[int(_523)] = 1065353216u;
    int _525 = _245 + 656;
    uint _527 = uint(int(uint(_525) >> uint(2)));
    _35[int(_527)] = as_type<uint>(_257);
    int _529 = _245 + 784;
    uint _531 = uint(int(uint(_529) >> uint(2)));
    _35[int(_531)] = as_type<uint>(_259);
    int _533 = _359 + 656;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    _35[int(_535)] = as_type<uint>(_269);
    int _537 = _359 + 784;
    uint _539 = uint(int(uint(_537) >> uint(2)));
    _35[int(_539)] = as_type<uint>(_271);
    int _541 = _375 + 656;
    uint _543 = uint(int(uint(_541) >> uint(2)));
    _35[int(_543)] = as_type<uint>(_281);
    int _545 = _375 + 784;
    uint _547 = uint(int(uint(_545) >> uint(2)));
    _35[int(_547)] = as_type<uint>(_283);
    int _549 = _381 + 656;
    uint _551 = uint(int(uint(_549) >> uint(2)));
    _35[int(_551)] = as_type<uint>(_289);
    int _553 = _381 + 784;
    uint _555 = uint(int(uint(_553) >> uint(2)));
    _35[int(_555)] = as_type<uint>(_291);
}


struct dm_payload_t { uint w[32]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, void, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 853> _35;
    for (uint i = dm_lid; i < 853u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[804] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 192u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a0 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), 0.0, 1.0);
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3220u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 853> _35;
    for (uint i = dm_lid; i < 853u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[804] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 192u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a0 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), 0.0, 1.0);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3220u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
