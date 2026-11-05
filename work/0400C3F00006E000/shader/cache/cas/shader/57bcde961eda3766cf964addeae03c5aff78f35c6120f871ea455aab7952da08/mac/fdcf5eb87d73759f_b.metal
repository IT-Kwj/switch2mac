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
void _48(thread const int& _1274, thread const int& _1275, threadgroup spvUnsafeArray<uint, 853>& _35)
{
    uint _1278 = uint(int(uint(_1274) >> uint(2)));
    int _1280 = _1274 & 3;
    int _1282 = _1280 << 3;
    bool _1284;
    do
    {
        float _1286 = as_type<float>(_35[int(_1278)]);
        int _1288 = int(insert_bits(as_type<uint>(_1286), uint(_1275), uint(_1282), 8u));
        uint _1318 = as_type<uint>(_1286);
        uint _1323;
        do
        {
            _1323 = _1318;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_35[int(_1278)], &_1323, uint(_1288), memory_order_relaxed, memory_order_relaxed) && _1323 == _1318);
        uint _1290 = _1323;
        _1284 = int(_1290) != as_type<int>(_1286);
    } while (_1284);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 853>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _52 = as_type<float>(_35[0]);
    float _54 = as_type<float>(gl_SubgroupInvocationID);
    int _56 = as_type<int>(_52) << 5;
    int _58 = _56 + as_type<int>(_54);
    bool _62 = uint(_58) >= as_type<uint>((*spvDescriptorSet0.cp_c5)._m0[1].x);
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
    int _91 = _89 * 16;
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
    float _131 = fma(_113, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _133 = _81 >= _117;
    bool _135 = !_127;
    bool _137 = _133 && _135;
    bool _139 = _75 <= _129;
    bool _141 = _139 && _137;
    bool _143 = _87 >= _131;
    bool _145 = _143 && _141;
    if (!_145)
    {
        return;
    }
    int _147 = _64 + 16;
    int _149 = _64 + 40;
    int _151 = _64 + 24;
    int _153 = _64 + 32;
    uint _155 = uint(int(uint(_147) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_155)];
    float _157 = as_type<float>(_dmw1.x);
    int _159 = _147 + 4;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    float _163 = as_type<float>(_dmw1.y);
    uint _165 = uint(int(uint(_149) >> uint(2)));
    float _167 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_165)]);
    int _169 = _149 + 4;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    float _173 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_171)]);
    uint _175 = uint(int(uint(_151) >> uint(2)));
    float _177 = as_type<float>(_dmw1.z);
    int _179 = _151 + 4;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw1.w);
    uint _185 = uint(int(uint(_153) >> uint(2)));
    float _187 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_185)]);
    int _189 = _153 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_191)]);
    float _195 = as_type<float>(gl_SubgroupLtMask.x);
    uint _197 = spvSubgroupBallot(true).x;
    int _199 = reverse_bits(int(_197));
    int _201 = int(spvFindUMSB(uint(_199)));
    bool _203 = _201 != (-1);
    int _205 = _201 ^ 31;
    int _207 = _203 ? _205 : _201;
    uint _209 = uint(int(uint(_91) >> uint(2)));
    uint _211 = uint(int(uint(int(_209)) >> uint(2)));
    int _213 = int(_209) & 3;
    float _215 = (*spvDescriptorSet0.cp_c3)._m0[int(_211)][_213];
    int _217 = as_type<int>(_195) & int(_197);
    int _219 = popcount(_217);
    bool _221 = as_type<int>(_54) != _207;
    int _223 = _219 << 2;
    int _225 = 0;
    if (!_221)
    {
        int _227 = popcount(int(_197));
        _225 = _227;
    }
    int _229 = _225;
    int _231 = _223 * 4;
    uint _233 = uint(int(uint(_223) >> uint(5)));
    int _235 = 124 & _231;
    int _237 = int(_233) * 768;
    int _239 = _237 + _235;
    int _241 = _223 + 2;
    int _243 = _229;
    if (!_221)
    {
        int _245 = _229 << 1;
        _243 = _245;
    }
    int _247 = _243;
    int _249 = _241 * 4;
    uint _251 = uint(int(uint(_241) >> uint(5)));
    if (!_221)
    {
        int _253 = 3219;
        int _255 = _247;
        _48(_253, _255, _35);
    }
    int _257 = 124 & _249;
    int _259 = int(_251) * 768;
    int _261 = _259 + _257;
    int _263 = _219 * 6;
    float _265 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _267 = _157 + _265;
    float _269 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _271 = _163 + _269;
    float _273 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _275 = _173 + _273;
    float _277 = _267 * _215;
    float _279 = _277 * 2.0;
    float _281 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _283 = _167 + _281;
    int _285 = _223 + 1;
    float _287 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _289 = _177 + _287;
    float _291 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _293 = _183 + _291;
    float _295 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _297 = _187 + _295;
    float _299 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _301 = _193 + _299;
    float _303 = _271 * _215;
    float _305 = _303 * 2.0;
    float _307 = _289 * _215;
    float _309 = _307 * 2.0;
    float _311 = _293 * _215;
    float _313 = _311 * 2.0;
    float _315 = _297 * _215;
    float _317 = _315 * 2.0;
    float _319 = _301 * _215;
    float _321 = _319 * 2.0;
    float _323 = _283 * _215;
    float _325 = _323 * 2.0;
    float _327 = _275 * _215;
    float _329 = _327 * 2.0;
    uint _331 = uint(int(uint(_285) >> uint(5)));
    int _333 = _223 + 3;
    int _335 = _285 << 2;
    int _337 = _333 << 2;
    int _339 = 124 & _335;
    float _341 = -_305;
    float _343 = _341 + (-0.0);
    int _345 = _239 + 144;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    _35[int(_347)] = as_type<uint>(_279);
    uint _349 = uint(int(uint(_333) >> uint(5)));
    int _351 = int(_331) * 768;
    int _353 = _351 + _339;
    float _355 = -_313;
    float _357 = _355 + (-0.0);
    int _359 = _239 + 272;
    uint _361 = uint(int(uint(_359) >> uint(2)));
    _35[int(_361)] = as_type<uint>(_343);
    int _363 = 124 & _337;
    int _365 = _239 + 400;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _35[int(_367)] = 0u;
    int _369 = int(_349) * 768;
    int _371 = _369 + _363;
    int _373 = _239 + 528;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    _35[int(_375)] = 1065353216u;
    float _377 = -_321;
    float _379 = _377 + (-0.0);
    int _381 = _353 + 144;
    uint _383 = uint(int(uint(_381) >> uint(2)));
    _35[int(_383)] = as_type<uint>(_309);
    int _385 = _223 & 255;
    int _387 = _353 + 272;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    _35[int(_389)] = as_type<uint>(_357);
    float _391 = -_329;
    float _393 = _391 + (-0.0);
    int _395 = _353 + 400;
    uint _397 = uint(int(uint(_395) >> uint(2)));
    _35[int(_397)] = 0u;
    int _399 = _353 + 528;
    uint _401 = uint(int(uint(_399) >> uint(2)));
    _35[int(_401)] = 1065353216u;
    int _403 = _261 + 144;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    _35[int(_405)] = as_type<uint>(_317);
    int _407 = _385 + 1;
    int _409 = _261 + 272;
    uint _411 = uint(int(uint(_409) >> uint(2)));
    _35[int(_411)] = as_type<uint>(_379);
    int _413 = _385 + 2;
    int _415 = _261 + 400;
    uint _417 = uint(int(uint(_415) >> uint(2)));
    _35[int(_417)] = 0u;
    int _419 = _261 + 528;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _35[int(_421)] = 1065353216u;
    int _423 = _385 + 3;
    int _425 = _371 + 144;
    uint _427 = uint(int(uint(_425) >> uint(2)));
    _35[int(_427)] = as_type<uint>(_325);
    int _429 = _371 + 272;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    _35[int(_431)] = as_type<uint>(_393);
    int _433 = _371 + 400;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    _35[int(_435)] = 0u;
    int _437 = _371 + 528;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _35[int(_439)] = 1065353216u;
    int _441 = _263 + 3220;
    int _443 = _441;
    int _445 = _385;
    _48(_443, _445, _35);
    int _447 = _263 + 3221;
    int _449 = _447;
    int _451 = _407;
    _48(_449, _451, _35);
    int _453 = _263 + 3222;
    int _455 = _453;
    int _457 = _413;
    _48(_455, _457, _35);
    int _459 = _263 + 3223;
    int _461 = _459;
    int _463 = _407;
    _48(_461, _463, _35);
    int _465 = _263 + 3224;
    int _467 = _465;
    int _469 = _423;
    _48(_467, _469, _35);
    int _471 = _263 + 3225;
    int _473 = _471;
    int _475 = _413;
    _48(_473, _475, _35);
    int _477 = _239 + 656;
    uint _479 = uint(int(uint(_477) >> uint(2)));
    _35[int(_479)] = 0u;
    int _481 = _239 + 784;
    uint _483 = uint(int(uint(_481) >> uint(2)));
    _35[int(_483)] = 0u;
    int _485 = _353 + 656;
    uint _487 = uint(int(uint(_485) >> uint(2)));
    _35[int(_487)] = 0u;
    int _489 = _353 + 784;
    uint _491 = uint(int(uint(_489) >> uint(2)));
    _35[int(_491)] = 1065353216u;
    int _493 = _261 + 656;
    uint _495 = uint(int(uint(_493) >> uint(2)));
    _35[int(_495)] = 1065353216u;
    int _497 = _261 + 784;
    uint _499 = uint(int(uint(_497) >> uint(2)));
    _35[int(_499)] = 0u;
    int _501 = _371 + 656;
    uint _503 = uint(int(uint(_501) >> uint(2)));
    _35[int(_503)] = 1065353216u;
    int _505 = _371 + 784;
    uint _507 = uint(int(uint(_505) >> uint(2)));
    _35[int(_507)] = 1065353216u;
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
