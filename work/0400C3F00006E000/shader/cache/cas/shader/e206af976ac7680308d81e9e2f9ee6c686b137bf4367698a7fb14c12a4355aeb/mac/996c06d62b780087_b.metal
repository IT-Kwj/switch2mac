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
void _48(thread const int& _1173, thread const int& _1174, threadgroup spvUnsafeArray<uint, 981>& _35)
{
    uint _1177 = uint(int(uint(_1173) >> uint(2)));
    int _1179 = _1173 & 3;
    int _1181 = _1179 << 3;
    bool _1183;
    do
    {
        float _1185 = as_type<float>(_35[int(_1177)]);
        int _1187 = int(insert_bits(as_type<uint>(_1185), uint(_1174), uint(_1181), 8u));
        uint _1217 = as_type<uint>(_1185);
        uint _1222;
        do
        {
            _1222 = _1217;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_35[int(_1177)], &_1222, uint(_1187), memory_order_relaxed, memory_order_relaxed) && _1222 == _1217);
        uint _1189 = _1222;
        _1183 = int(_1189) != as_type<int>(_1185);
    } while (_1183);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 981>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _52 = as_type<float>(_35[0]);
    float _54 = as_type<float>(gl_SubgroupInvocationID);
    int _56 = as_type<int>(_52) * 32;
    int _58 = _56 + as_type<int>(_54);
    bool _62 = uint(_58) >= as_type<uint>((*spvDescriptorSet0.cp_c5)._m0[0].z);
    if (_62)
    {
        return;
    }
    int _64 = _58 * 16;
    int _66 = _64 + 8;
    uint _69 = uint(int(uint(_64) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_69)];
    float _71 = as_type<float>(_dmw0.x);
    int _73 = _64 + 4;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    float _77 = as_type<float>(_dmw0.y);
    uint _79 = uint(int(uint(_66) >> uint(2)));
    float _81 = as_type<float>(_dmw0.z);
    int _83 = _66 + 4;
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
    float _119 = -_81;
    float _121 = _71 + _119;
    float _123 = _71 + _81;
    float _125 = -_81;
    float _127 = _77 + _125;
    float _129 = _77 + _81;
    bool _131 = _121 > _115;
    bool _133 = isnan(_121);
    bool _135 = _131 || _133;
    bool _137 = isnan(_115);
    bool _139 = _135 || _137;
    float _141 = fma(_113, 0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _143 = fma(_113, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _145 = _123 >= _117;
    bool _147 = !_139;
    bool _149 = _145 && _147;
    bool _151 = _127 <= _141;
    bool _153 = _151 && _149;
    bool _155 = _129 >= _143;
    bool _157 = _155 && _153;
    if (!_157)
    {
        return;
    }
    float _159 = as_type<float>(gl_SubgroupLtMask.x);
    uint _161 = spvSubgroupBallot(true).x;
    uint _163 = uint(int(uint(_91) >> uint(2)));
    uint _165 = uint(int(uint(int(_163)) >> uint(2)));
    int _167 = int(_163) & 3;
    float _169 = (*spvDescriptorSet0.cp_c3)._m0[int(_165)][_167];
    int _171 = reverse_bits(int(_161));
    float _173 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _175 = _127 + _173;
    float _177 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _179 = _121 + _177;
    float _181 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _183 = _123 + _181;
    int _185 = int(spvFindUMSB(uint(_171)));
    bool _187 = _185 != (-1);
    int _189 = _185 ^ 31;
    int _191 = _187 ? _189 : _185;
    float _193 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _195 = _129 + _193;
    bool _197 = as_type<int>(_54) != _191;
    int _199 = as_type<int>(_159) & int(_161);
    int _201 = as_type<int>(_54);
    if (!_197)
    {
        int _203 = popcount(int(_161));
        _201 = _203;
    }
    int _205 = _201;
    float _207 = _175 * _169;
    float _209 = _207 * 2.0;
    float _211 = _179 * _169;
    float _213 = _211 * 2.0;
    float _215 = _195 * _169;
    float _217 = _215 * 2.0;
    float _219 = -_217;
    float _221 = _219 + (-0.0);
    int _223 = popcount(_199);
    int _225 = _205;
    if (!_197)
    {
        int _227 = _205 * 2;
        _225 = _227;
    }
    int _229 = _225;
    if (!_197)
    {
        int _231 = 3731;
        int _233 = _229;
        _48(_231, _233, _35);
    }
    int _235 = _223 * 2;
    int _237 = _223 << 2;
    int _239 = _223 * 6;
    uint _241 = uint(int(uint(_235) >> uint(5)));
    int _243 = _237 * 4;
    int _245 = _235 << 2;
    int _247 = int(_241) << 7;
    int _249 = _247 + 3072;
    float _251 = _183 * _169;
    float _253 = _251 * 2.0;
    int _255 = 124 & _245;
    int _257 = _235 + 1;
    uint _259 = uint(int(uint(_237) >> uint(5)));
    int _261 = _249 + _255;
    int _263 = _237 + 1;
    int _265 = 124 & _243;
    int _267 = _237 + 2;
    uint _269 = uint(int(uint(_263) >> uint(5)));
    int _271 = int(_259) * 768;
    int _273 = _271 + _265;
    int _275 = _263 << 2;
    uint _277 = uint(int(uint(_267) >> uint(5)));
    int _279 = _267 * 4;
    int _281 = _237 + 3;
    int _283 = _273 + 144;
    uint _285 = uint(int(uint(_283) >> uint(2)));
    _35[int(_285)] = as_type<uint>(_213);
    int _287 = 124 & _275;
    int _289 = _257 << 2;
    int _291 = _281 * 4;
    int _293 = 124 & _279;
    uint _295 = uint(int(uint(_281) >> uint(5)));
    uint _297 = uint(int(uint(_257) >> uint(5)));
    int _299 = int(_269) * 768;
    int _301 = _299 + _287;
    int _303 = 124 & _289;
    int _305 = int(_277) * 768;
    int _307 = _305 + _293;
    float _309 = -_209;
    float _311 = _309 + (-0.0);
    int _313 = 124 & _291;
    int _315 = _273 + 272;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    _35[int(_317)] = as_type<uint>(_311);
    int _319 = int(_297) << 7;
    int _321 = _319 + 3072;
    int _323 = int(_295) * 768;
    int _325 = _323 + _313;
    int _327 = _273 + 400;
    uint _329 = uint(int(uint(_327) >> uint(2)));
    _35[int(_329)] = 0u;
    int _331 = _237 & 255;
    int _333 = _321 + _303;
    int _335 = _273 + 528;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    _35[int(_337)] = 1065353216u;
    int _339 = _331 + 1;
    int _341 = _331 + 2;
    int _343 = _301 + 144;
    uint _345 = uint(int(uint(_343) >> uint(2)));
    _35[int(_345)] = as_type<uint>(_213);
    int _347 = _331 + 3;
    int _349 = _301 + 272;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    _35[int(_351)] = as_type<uint>(_221);
    int _353 = _301 + 400;
    uint _355 = uint(int(uint(_353) >> uint(2)));
    _35[int(_355)] = 0u;
    int _357 = _301 + 528;
    uint _359 = uint(int(uint(_357) >> uint(2)));
    _35[int(_359)] = 1065353216u;
    int _361 = _307 + 144;
    uint _363 = uint(int(uint(_361) >> uint(2)));
    _35[int(_363)] = as_type<uint>(_253);
    int _365 = _307 + 272;
    uint _367 = uint(int(uint(_365) >> uint(2)));
    _35[int(_367)] = as_type<uint>(_311);
    int _369 = _307 + 400;
    uint _371 = uint(int(uint(_369) >> uint(2)));
    _35[int(_371)] = 0u;
    int _373 = _307 + 528;
    uint _375 = uint(int(uint(_373) >> uint(2)));
    _35[int(_375)] = 1065353216u;
    int _377 = _325 + 144;
    uint _379 = uint(int(uint(_377) >> uint(2)));
    _35[int(_379)] = as_type<uint>(_253);
    int _381 = _325 + 272;
    uint _383 = uint(int(uint(_381) >> uint(2)));
    _35[int(_383)] = as_type<uint>(_221);
    int _385 = _325 + 400;
    uint _387 = uint(int(uint(_385) >> uint(2)));
    _35[int(_387)] = 0u;
    int _389 = _325 + 528;
    uint _391 = uint(int(uint(_389) >> uint(2)));
    _35[int(_391)] = 1065353216u;
    int _393 = _239 + 3732;
    int _395 = _393;
    int _397 = _331;
    _48(_395, _397, _35);
    int _399 = _239 + 3733;
    int _401 = _399;
    int _403 = _339;
    _48(_401, _403, _35);
    int _405 = _239 + 3734;
    int _407 = _405;
    int _409 = _341;
    _48(_407, _409, _35);
    int _411 = _239 + 3735;
    int _413 = _411;
    int _415 = _339;
    _48(_413, _415, _35);
    int _417 = _239 + 3736;
    int _419 = _417;
    int _421 = _347;
    _48(_419, _421, _35);
    int _423 = _239 + 3737;
    int _425 = _423;
    int _427 = _341;
    _48(_425, _427, _35);
    int _429 = _273 + 656;
    uint _431 = uint(int(uint(_429) >> uint(2)));
    _35[int(_431)] = 0u;
    int _433 = _273 + 784;
    uint _435 = uint(int(uint(_433) >> uint(2)));
    _35[int(_435)] = 0u;
    int _437 = _301 + 656;
    uint _439 = uint(int(uint(_437) >> uint(2)));
    _35[int(_439)] = 0u;
    int _441 = _301 + 784;
    uint _443 = uint(int(uint(_441) >> uint(2)));
    _35[int(_443)] = 1065353216u;
    int _445 = _307 + 656;
    uint _447 = uint(int(uint(_445) >> uint(2)));
    _35[int(_447)] = 1065353216u;
    int _449 = _307 + 784;
    uint _451 = uint(int(uint(_449) >> uint(2)));
    _35[int(_451)] = 0u;
    int _453 = _325 + 656;
    uint _455 = uint(int(uint(_453) >> uint(2)));
    _35[int(_455)] = 1065353216u;
    int _457 = _325 + 784;
    uint _459 = uint(int(uint(_457) >> uint(2)));
    _35[int(_459)] = 1065353216u;
    int _461 = _261 + 144;
    uint _463 = uint(int(uint(_461) >> uint(2)));
    _35[int(_463)] = as_type<uint>(_87);
    int _465 = _333 + 144;
    uint _467 = uint(int(uint(_465) >> uint(2)));
    _35[int(_467)] = as_type<uint>(_87);
}


struct dm_payload_t { uint w[32]; };
struct dm_vertex_t {
    float4 position [[position]];
    float4 a1 [[user(locn1)]];
};
struct dm_prim_t {
    float4 p0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, dm_prim_t, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 981> _35;
    for (uint i = dm_lid; i < 981u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[932] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a1 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), 0.0, 1.0);
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 36u + (n / 32u) * 224u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_35[b + 192u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3732u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 981> _35;
    for (uint i = dm_lid; i < 981u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_35[932] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 224u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_35[b + 0u]), as_type<float>(_35[b + 32u]), as_type<float>(_35[b + 64u]), as_type<float>(_35[b + 96u]));
        v.a1 = float4(as_type<float>(_35[b + 128u]), as_type<float>(_35[b + 160u]), 0.0, 1.0);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 36u + (n / 32u) * 224u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_35[b + 192u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 3732u + n;
        dm_out.set_index(n, (_35[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
