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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    const device _21* cp_s0 [[id(1)]];
};

static inline __attribute__((always_inline))
void _42(thread const int& _1416, thread const int& _1417, threadgroup spvUnsafeArray<uint, 885>& _29)
{
    uint _1420 = uint(int(uint(_1416) >> uint(2)));
    int _1422 = _1416 & 3;
    int _1424 = _1422 << 3;
    bool _1426;
    do
    {
        float _1428 = as_type<float>(_29[int(_1420)]);
        int _1430 = int(insert_bits(as_type<uint>(_1428), uint(_1417), uint(_1424), 8u));
        uint _1460 = as_type<uint>(_1428);
        uint _1465;
        do
        {
            _1465 = _1460;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_29[int(_1420)], &_1465, uint(_1430), memory_order_relaxed, memory_order_relaxed) && _1465 == _1460);
        uint _1432 = _1465;
        _1426 = int(_1432) != as_type<int>(_1428);
    } while (_1426);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 885>& _29)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _46 = as_type<float>(_29[4]);
    float _48 = as_type<float>(gl_SubgroupInvocationID);
    int _50 = as_type<int>(_46) << 2;
    int _52 = _50 + 32;
    uint _55 = uint(int(uint(_52) >> uint(2)));
    float _57 = as_type<float>(_29[int(_55)]);
    int _59 = as_type<int>(_48) & 7;
    int _61 = as_type<int>(_57) & (-4);
    int _63 = as_type<int>(_57) << 3;
    uint _65 = uint(int(uint(as_type<int>(_48)) >> uint(3)));
    int _67 = int(_65) + _61;
    int _69 = 24 & _63;
    int _71 = (-25) & _59;
    int _73 = _69 | _71;
    int _75 = _67 << 5;
    int _77 = _75 + _67;
    int _79 = _67 * 33;
    int _81 = _79 + _73;
    int _83 = _73 + 33;
    int _85 = _83 + _77;
    int _87 = _73 + 34;
    int _89 = _87 + _77;
    int _91 = _81 << 3;
    int _93 = _73 + 1;
    int _95 = _93 + _77;
    int _97 = _85 << 3;
    int _99 = _89 << 3;
    int _101 = _95 << 3;
    uint _103 = uint(int(uint(_91) >> uint(2)));
    float _105 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_103)]);
    uint _107 = uint(int(uint(_97) >> uint(2)));
    float _109 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_107)]);
    uint _111 = uint(int(uint(_101) >> uint(2)));
    float _113 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_111)]);
    uint _115 = uint(int(uint(_99) >> uint(2)));
    float _117 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_115)]);
    uint _119 = min(as_type<uint>(_105), as_type<uint>(_109));
    uint _121 = max(as_type<uint>(_105), as_type<uint>(_109));
    uint _123 = min(as_type<uint>(_113), as_type<uint>(_117));
    uint _125 = max(as_type<uint>(_113), as_type<uint>(_117));
    uint _127 = min(_119, _123);
    uint _129 = max(_121, _125);
    bool _133 = int(_127) != 0;
    int _135 = int(_127) + 30000;
    bool _137 = _129 < uint(_135);
    bool _139 = _137 && _133;
    uint _141 = spvSubgroupBallot(_139).x;
    if (!_139)
    {
        return;
    }
    float _143 = as_type<float>(gl_SubgroupLtMask.x);
    float _145 = float(as_type<uint>(_105));
    uint _147 = spvSubgroupBallot(true).x;
    float _149 = float(as_type<uint>(_109));
    int _151 = reverse_bits(int(_147));
    float _153 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].z));
    float _155 = float(uint(_67));
    int _157 = int(spvFindUMSB(uint(_151)));
    bool _159 = _157 != (-1);
    int _161 = _157 ^ 31;
    int _163 = _159 ? _161 : _157;
    float _165 = float(as_type<uint>(_113));
    float _167 = fma(_155, 2.0, _153);
    float _169 = float(as_type<uint>(_117));
    float _171 = _155 * 0.03125;
    float _173 = float(as_type<int>((*spvDescriptorSet0.cp_c3)._m0[3].w));
    float _175 = fma(_145, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _177 = fma(_165, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _179 = fma(_149, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _181 = fma(_169, 9.9999997473787516355514526367188e-05, 0.100000001490116119384765625);
    float _183 = _167 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _185 = _167 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _187 = _167 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _189 = _167 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    int _191 = int(_141) & as_type<int>(_143);
    float _193 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[5].y, _183);
    float _195 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[5].y, _183);
    float _197 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[6].y, _185);
    float _199 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[6].y, _185);
    float _201 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[7].y, _187);
    float _203 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[7].y, _187);
    float _205 = _167 + 2.0;
    float _207 = float(uint(_73));
    int _209 = popcount(_191);
    float _211 = fma(_175, (*spvDescriptorSet0.cp_c3)._m0[8].y, _189);
    float _213 = fma(_177, (*spvDescriptorSet0.cp_c3)._m0[8].y, _189);
    float _215 = _205 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _217 = _205 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _219 = _205 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    bool _221 = as_type<int>(_48) != _163;
    float _223 = _205 * (*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _225 = fma(_207, 2.0, _173);
    float _227 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[5].y, _215);
    float _229 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[6].y, _217);
    float _231 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[7].y, _219);
    float _233 = fma(_181, (*spvDescriptorSet0.cp_c3)._m0[5].y, _215);
    float _235 = fma(_181, (*spvDescriptorSet0.cp_c3)._m0[6].y, _217);
    float _237 = fma(_181, (*spvDescriptorSet0.cp_c3)._m0[7].y, _219);
    float _239 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[8].y, _223);
    float _241 = fma(_181, (*spvDescriptorSet0.cp_c3)._m0[8].y, _223);
    int _243 = _209 << 2;
    float _245 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[5].z, _227);
    float _247 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[7].z, _231);
    float _249 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[6].z, _229);
    int _251 = _243 << 2;
    float _253 = _225 + 2.0;
    float _255 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[5].z, _193);
    float _257 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[6].z, _197);
    float _259 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[7].z, _201);
    float _261 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[8].z, _211);
    float _263 = fma(_225, (*spvDescriptorSet0.cp_c3)._m0[8].z, _239);
    int _265 = _243 + 1;
    float _267 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[5].z, _195);
    uint _269 = uint(int(uint(_243) >> uint(5)));
    float _271 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[6].z, _199);
    int _273 = 124 & _251;
    float _275 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[7].z, _203);
    int _277 = _243 + 2;
    float _279 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[8].z, _213);
    int _281 = _265 << 2;
    float _283 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[5].z, _233);
    float _285 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[6].z, _235);
    float _287 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[7].z, _237);
    float _289 = fma(_253, (*spvDescriptorSet0.cp_c3)._m0[8].z, _241);
    int _291 = int(_269) * 768;
    int _293 = _291 + _273;
    float _295 = _255 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _297 = _243 + 3;
    float _299 = _261 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    uint _301 = uint(int(uint(_265) >> uint(5)));
    float _303 = _267 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    int _305 = _277 << 2;
    int _307 = _293 + 272;
    uint _309 = uint(int(uint(_307) >> uint(2)));
    _29[int(_309)] = as_type<uint>(_295);
    int _311 = 124 & _281;
    float _313 = _271 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    uint _315 = uint(int(uint(_277) >> uint(5)));
    float _317 = _279 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    int _319 = _297 << 2;
    int _321 = int(_301) * 768;
    int _323 = _321 + _311;
    int _325 = 124 & _305;
    float _327 = _245 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    uint _329 = uint(int(uint(_297) >> uint(5)));
    float _331 = _257 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _333 = 124 & _319;
    int _335 = int(_315) * 768;
    int _337 = _335 + _325;
    float _339 = _259 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _341 = _249 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _343 = _293 + 400;
    uint _345 = uint(int(uint(_343) >> uint(2)));
    _29[int(_345)] = as_type<uint>(_331);
    int _347 = int(_329) * 768;
    int _349 = _347 + _333;
    float _351 = _275 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _353 = _247 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    int _355 = _293 + 528;
    uint _357 = uint(int(uint(_355) >> uint(2)));
    _29[int(_357)] = as_type<uint>(_339);
    int _359 = _73 + 1;
    float _361 = _263 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    int _363 = _67 + 1;
    int _365 = _293 + 656;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _29[int(_367)] = as_type<uint>(_299);
    float _369 = _283 + (*spvDescriptorSet0.cp_c3)._m0[5].w;
    float _371 = _287 + (*spvDescriptorSet0.cp_c3)._m0[7].w;
    float _373 = float(uint(_359));
    int _375 = _323 + 272;
    uint _377 = uint(int(uint(_375) >> uint(2)));
    _29[int(_377)] = as_type<uint>(_303);
    float _379 = _289 + (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _381 = float(uint(_363));
    float _383 = _207 * 0.03125;
    int _385 = _323 + 400;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    _29[int(_387)] = as_type<uint>(_313);
    int _389 = _243 & 255;
    int _391 = _209 * 6;
    int _393 = popcount(int(_141));
    int _395 = _323 + 528;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _29[int(_397)] = as_type<uint>(_351);
    float _399 = _285 + (*spvDescriptorSet0.cp_c3)._m0[6].w;
    int _401 = _323 + 656;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    _29[int(_403)] = as_type<uint>(_317);
    int _405 = _337 + 272;
    uint _407 = uint(int(uint(_405) >> uint(2)));
    _29[int(_407)] = as_type<uint>(_327);
    int _409 = _337 + 400;
    uint _411 = uint(int(uint(_409) >> uint(2)));
    _29[int(_411)] = as_type<uint>(_341);
    float _413 = _373 * 0.03125;
    int _415 = _337 + 528;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _29[int(_417)] = as_type<uint>(_353);
    int _419 = _389 + 2;
    int _421 = _337 + 656;
    uint _423 = uint(int(uint(_421) >> uint(2)));
    _29[int(_423)] = as_type<uint>(_361);
    int _425 = _349 + 272;
    uint _427 = uint(int(uint(_425) >> uint(2)));
    _29[int(_427)] = as_type<uint>(_369);
    int _429 = _349 + 400;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    _29[int(_431)] = as_type<uint>(_399);
    int _433 = _349 + 528;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    _29[int(_435)] = as_type<uint>(_371);
    int _437 = _349 + 656;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _29[int(_439)] = as_type<uint>(_379);
    float _441 = _381 * 0.03125;
    int _443 = _293 + 784;
    uint _445 = uint(int(uint(_443) >> uint(2)));
    _29[int(_445)] = as_type<uint>(_171);
    int _447 = _293 + 912;
    uint _449 = uint(int(uint(_447) >> uint(2)));
    _29[int(_449)] = as_type<uint>(_383);
    int _451 = _389 + 1;
    int _453 = _323 + 784;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    _29[int(_455)] = as_type<uint>(_171);
    int _457 = _323 + 912;
    uint _459 = uint(int(uint(_457) >> uint(2)));
    _29[int(_459)] = as_type<uint>(_413);
    int _461 = _337 + 784;
    uint _463 = uint(int(uint(_461) >> uint(2)));
    _29[int(_463)] = as_type<uint>(_441);
    int _465 = _389 + 3;
    int _467 = _337 + 912;
    uint _469 = uint(int(uint(_467) >> uint(2)));
    _29[int(_469)] = as_type<uint>(_383);
    int _471 = _349 + 784;
    uint _473 = uint(int(uint(_471) >> uint(2)));
    _29[int(_473)] = as_type<uint>(_441);
    int _475 = _349 + 912;
    uint _477 = uint(int(uint(_475) >> uint(2)));
    _29[int(_477)] = as_type<uint>(_413);
    int _479 = _391 + 3348;
    int _481 = _479;
    int _483 = _389;
    _42(_481, _483, _29);
    int _485 = _391 + 3349;
    int _487 = _485;
    int _489 = _451;
    _42(_487, _489, _29);
    int _491 = _391 + 3350;
    int _493 = _491;
    int _495 = _419;
    _42(_493, _495, _29);
    int _497 = _391 + 3351;
    int _499 = _497;
    int _501 = _451;
    _42(_499, _501, _29);
    int _503 = _391 + 3352;
    int _505 = _503;
    int _507 = _465;
    _42(_505, _507, _29);
    int _509 = _391 + 3353;
    int _511 = _509;
    int _513 = _419;
    _42(_511, _513, _29);
    if (_221)
    {
        return;
    }
    int _515 = _393 << 1;
    int _517 = 3347;
    int _519 = _515;
    _42(_517, _519, _29);
}


struct dm_payload_t { uint w[64]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, void, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 885> _29;
    for (uint i = dm_lid; i < 885u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[836] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 192u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), 0.0, 1.0);
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3348u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, const object_data dm_payload_t& dm_payload [[payload]])
{
    threadgroup spvUnsafeArray<uint, 885> _29;
    for (uint i = dm_lid; i < 885u; i += 32u) _29[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) _29[4u + i] = dm_payload.w[i];
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) { _29[0] = dm_tg; _29[4] = dm_tg; }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _29);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_29[836] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 68u + (n / 32u) * 192u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_29[b + 0u]), as_type<float>(_29[b + 32u]), as_type<float>(_29[b + 64u]), as_type<float>(_29[b + 96u]));
        v.a0 = float4(as_type<float>(_29[b + 128u]), as_type<float>(_29[b + 160u]), 0.0, 1.0);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3348u + n;
        dm_out.set_index(n, (_29[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
