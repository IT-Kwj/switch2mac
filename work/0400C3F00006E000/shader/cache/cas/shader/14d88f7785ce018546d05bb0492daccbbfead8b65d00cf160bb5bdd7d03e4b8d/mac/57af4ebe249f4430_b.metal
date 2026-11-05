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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    const device _23* cp_s0 [[id(1)]];
};

static inline __attribute__((always_inline))
void _44(thread const int& _800, thread const int& _801, threadgroup spvUnsafeArray<uint, 725>& _31)
{
    uint _804 = uint(int(uint(_800) >> uint(2)));
    int _806 = _800 & 3;
    int _808 = _806 << 3;
    bool _810;
    do
    {
        float _812 = as_type<float>(_31[int(_804)]);
        int _814 = int(insert_bits(as_type<uint>(_812), uint(_801), uint(_808), 8u));
        uint _844 = as_type<uint>(_812);
        uint _849;
        do
        {
            _849 = _844;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_31[int(_804)], &_849, uint(_814), memory_order_relaxed, memory_order_relaxed) && _849 == _844);
        uint _816 = _849;
        _810 = int(_816) != as_type<int>(_812);
    } while (_810);
}

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 725>& _31)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _48 = as_type<float>(_31[0]);
    float _50 = as_type<float>(gl_SubgroupInvocationID);
    int _52 = as_type<int>(_48) * 32;
    int _54 = _52 + as_type<int>(_50);
    bool _58 = uint(_54) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_58)
    {
        return;
    }
    int _60 = _54 * 24;
    uint _63 = uint(int(uint(_60) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_63)];
    float _65 = as_type<float>(_dmw0.x);
    int _67 = _60 + 4;
    uint _69 = uint(int(uint(_67) >> uint(2)));
    float _71 = as_type<float>(_dmw0.y);
    int _73 = _60 + 8;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    float _77 = as_type<float>(_dmw0.z);
    int _79 = _73 + 4;
    uint _81 = uint(int(uint(_79) >> uint(2)));
    float _83 = as_type<float>(_dmw0.w);
    int _85 = _60 + 16;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    float _89 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_87)]);
    uint _91 = spvSubgroupBallot(true).x;
    int _93 = reverse_bits(int(_91));
    float _95 = as_type<float>(gl_SubgroupLtMask.x);
    int _97 = int(spvFindUMSB(uint(_93)));
    bool _99 = _97 != (-1);
    int _101 = _97 ^ 31;
    int _103 = _99 ? _101 : _97;
    bool _105 = as_type<int>(_50) != _103;
    int _107 = as_type<int>(_95) & int(_91);
    int _109 = as_type<int>(_95);
    if (!_105)
    {
        int _111 = popcount(int(_91));
        _109 = _111;
    }
    int _113 = _109;
    int _115 = popcount(_107);
    int _117 = _113;
    if (!_105)
    {
        int _119 = _113 * 2;
        _117 = _119;
    }
    int _121 = _117;
    if (!_105)
    {
        int _123 = 2707;
        int _125 = _121;
        _44(_123, _125, _31);
    }
    int _127 = _115 * 4;
    int _129 = _115 * 2;
    int _131 = _127 * 4;
    int _133 = _127 + 1;
    int _135 = _129 * 4;
    uint _137 = uint(int(uint(_129) >> uint(5)));
    int _139 = _115 * 6;
    uint _141 = uint(int(uint(_127) >> uint(5)));
    int _143 = _133 * 4;
    int _145 = int(_137) << 7;
    int _147 = _145 + 2048;
    uint _149 = uint(int(uint(_133) >> uint(5)));
    int _151 = 124 & _143;
    int _153 = 124 & _131;
    int _155 = 124 & _135;
    int _157 = int(_149) * 512;
    int _159 = _157 + _151;
    int _161 = _127 + 2;
    int _163 = int(_141) * 512;
    int _165 = _163 + _153;
    int _167 = _129 + 1;
    int _169 = _147 + _155;
    uint _171 = uint(int(uint(_161) >> uint(5)));
    int _173 = _161 * 4;
    uint _175 = uint(int(uint(_167) >> uint(5)));
    int _177 = _167 * 4;
    int _179 = int(_175) << 7;
    int _181 = _179 + 2048;
    int _183 = 124 & _177;
    int _185 = _181 + _183;
    float _187 = -_65;
    float _189 = _187 + (-0.0);
    int _191 = _127 + 3;
    int _193 = _127 & 255;
    uint _195 = uint(int(uint(_191) >> uint(5)));
    int _197 = _191 * 4;
    int _199 = 124 & _173;
    int _201 = _165 + 144;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    _31[int(_203)] = as_type<uint>(_189);
    int _205 = 124 & _197;
    int _207 = _165 + 272;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    _31[int(_209)] = as_type<uint>(_71);
    int _211 = int(_171) * 512;
    int _213 = _211 + _199;
    float _215 = -_77;
    float _217 = _215 + (-0.0);
    int _219 = _193 + 2;
    int _221 = int(_195) * 512;
    int _223 = _221 + _205;
    int _225 = _165 + 400;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    _31[int(_227)] = 0u;
    int _229 = _193 + 3;
    int _231 = _193 + 1;
    int _233 = _165 + 528;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    _31[int(_235)] = 1065353216u;
    int _237 = _159 + 144;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    _31[int(_239)] = as_type<uint>(_189);
    int _241 = _159 + 272;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    _31[int(_243)] = as_type<uint>(_83);
    int _245 = _159 + 400;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    _31[int(_247)] = 0u;
    int _249 = _159 + 528;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    _31[int(_251)] = 1065353216u;
    int _253 = _213 + 144;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    _31[int(_255)] = as_type<uint>(_217);
    int _257 = _213 + 272;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    _31[int(_259)] = as_type<uint>(_71);
    int _261 = _213 + 400;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    _31[int(_263)] = 0u;
    int _265 = _213 + 528;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    _31[int(_267)] = 1065353216u;
    int _269 = _223 + 144;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    _31[int(_271)] = as_type<uint>(_217);
    int _273 = _223 + 272;
    uint _275 = uint(int(uint(_273) >> uint(2)));
    _31[int(_275)] = as_type<uint>(_83);
    int _277 = _223 + 400;
    uint _279 = uint(int(uint(_277) >> uint(2)));
    _31[int(_279)] = 0u;
    int _281 = _223 + 528;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    _31[int(_283)] = 1065353216u;
    int _285 = _139 + 2708;
    int _287 = _285;
    int _289 = _219;
    _44(_287, _289, _31);
    int _291 = _139 + 2709;
    int _293 = _291;
    int _295 = _229;
    _44(_293, _295, _31);
    int _297 = _139 + 2710;
    int _299 = _297;
    int _301 = _193;
    _44(_299, _301, _31);
    int _303 = _139 + 2711;
    int _305 = _303;
    int _307 = _229;
    _44(_305, _307, _31);
    int _309 = _139 + 2712;
    int _311 = _309;
    int _313 = _231;
    _44(_311, _313, _31);
    int _315 = _139 + 2713;
    int _317 = _315;
    int _319 = _193;
    _44(_317, _319, _31);
    int _321 = _169 + 144;
    uint _323 = uint(int(uint(_321) >> uint(2)));
    _31[int(_323)] = as_type<uint>(_89);
    int _325 = _185 + 144;
    uint _327 = uint(int(uint(_325) >> uint(2)));
    _31[int(_327)] = as_type<uint>(_89);
}


struct dm_payload_t { uint w[32]; };
struct dm_vertex_t {
    float4 position [[position]];
};
struct dm_prim_t {
    float4 p0 [[user(locn0)]];
};
using dm_mesh_t = metal::mesh<dm_vertex_t, dm_prim_t, 128, 64, metal::topology::triangle>;
[[mesh]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 725> _31;
    for (uint i = dm_lid; i < 725u; i += 32u) _31[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _31[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _31);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_31[676] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 160u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_31[b + 0u]), as_type<float>(_31[b + 32u]), as_type<float>(_31[b + 64u]), as_type<float>(_31[b + 96u]));
        v.position.z = fma(v.position.z, 0.5, v.position.w * 0.5);
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 36u + (n / 32u) * 160u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_31[b + 128u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 2708u + n;
        dm_out.set_index(n, (_31[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}

[[mesh]] void main0_z(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], dm_mesh_t dm_out, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 725> _31;
    for (uint i = dm_lid; i < 725u; i += 32u) _31[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _31[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _31);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    uint np = min(_31[676] >> 24, 64u);
    if (dm_lid == 0u) dm_out.set_primitive_count(np);
    for (uint n = dm_lid; n < 128u; n += 32u)
    {
        uint b = 36u + (n / 32u) * 160u + n % 32u;
        dm_vertex_t v;
        v.position = float4(as_type<float>(_31[b + 0u]), as_type<float>(_31[b + 32u]), as_type<float>(_31[b + 64u]), as_type<float>(_31[b + 96u]));
        dm_out.set_vertex(n, v);
    }
    for (uint n = dm_lid; n < np; n += 32u)
    {
        uint b = 36u + (n / 32u) * 160u + n % 32u;
        dm_prim_t p;
        p.p0 = float4(as_type<float>(_31[b + 128u]), 0.0, 0.0, 1.0);
        dm_out.set_primitive(n, p);
    }
    for (uint n = dm_lid; n < np * 3u; n += 32u)
    {
        uint at = 2708u + n;
        dm_out.set_index(n, (_31[at >> 2] >> ((at & 3u) * 8u)) & 0xffu);
    }
}
