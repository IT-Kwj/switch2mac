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
void _44(thread const int& _781, thread const int& _782, threadgroup spvUnsafeArray<uint, 725>& _31)
{
    uint _785 = uint(int(uint(_781) >> uint(2)));
    int _787 = _781 & 3;
    int _789 = _787 << 3;
    bool _791;
    do
    {
        float _793 = as_type<float>(_31[int(_785)]);
        int _795 = int(insert_bits(as_type<uint>(_793), uint(_782), uint(_789), 8u));
        uint _825 = as_type<uint>(_793);
        uint _830;
        do
        {
            _830 = _825;
        } while (!atomic_compare_exchange_weak_explicit((threadgroup atomic_uint*)&_31[int(_785)], &_830, uint(_795), memory_order_relaxed, memory_order_relaxed) && _830 == _825);
        uint _797 = _830;
        _791 = int(_797) != as_type<int>(_793);
    } while (_791);
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
    int _62 = _60 + 8;
    uint _65 = uint(int(uint(_60) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_65)];
    float _67 = as_type<float>(_dmw0.x);
    int _69 = _60 + 4;
    uint _71 = uint(int(uint(_69) >> uint(2)));
    float _73 = as_type<float>(_dmw0.y);
    uint _75 = uint(int(uint(_62) >> uint(2)));
    float _77 = as_type<float>(_dmw0.z);
    int _79 = _62 + 4;
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
    int _107 = 0;
    int _109 = _60;
    if (!_105)
    {
        int _111 = popcount(int(_91));
        _107 = _111;
    }
    int _113 = _107;
    int _115 = as_type<int>(_95) & int(_91);
    int _117 = popcount(_115);
    if (!_105)
    {
        int _119 = _113 * 2;
        _109 = _119;
    }
    int _121 = _109;
    if (!_105)
    {
        int _123 = 2707;
        int _125 = _121;
        _44(_123, _125, _31);
    }
    int _127 = _117 * 4;
    int _129 = _117 * 2;
    int _131 = _127 * 4;
    int _133 = _127 + 1;
    int _135 = _129 * 4;
    uint _137 = uint(int(uint(_129) >> uint(5)));
    int _139 = _117 * 6;
    int _141 = _127 + 2;
    int _143 = _133 * 4;
    int _145 = int(_137) << 7;
    int _147 = _145 + 2048;
    uint _149 = uint(int(uint(_133) >> uint(5)));
    int _151 = 124 & _143;
    int _153 = 124 & _135;
    uint _155 = uint(int(uint(_127) >> uint(5)));
    int _157 = int(_149) * 512;
    int _159 = _157 + _151;
    int _161 = 124 & _131;
    int _163 = _147 + _153;
    int _165 = _127 + 3;
    int _167 = _141 * 4;
    int _169 = _129 + 1;
    int _171 = int(_155) * 512;
    int _173 = _171 + _161;
    uint _175 = uint(int(uint(_141) >> uint(5)));
    int _177 = _165 * 4;
    uint _179 = uint(int(uint(_165) >> uint(5)));
    int _181 = _169 * 4;
    uint _183 = uint(int(uint(_169) >> uint(5)));
    int _185 = 124 & _167;
    int _187 = 124 & _177;
    int _189 = _127 & 255;
    int _191 = int(_175) * 512;
    int _193 = _191 + _185;
    int _195 = int(_183) << 7;
    int _197 = _195 + 2048;
    int _199 = int(_179) * 512;
    int _201 = _199 + _187;
    int _203 = 124 & _181;
    int _205 = _189 + 2;
    int _207 = _197 + _203;
    int _209 = _173 + 144;
    uint _211 = uint(int(uint(_209) >> uint(2)));
    _31[int(_211)] = as_type<uint>(_67);
    int _213 = _173 + 272;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    _31[int(_215)] = as_type<uint>(_73);
    int _217 = _173 + 400;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    _31[int(_219)] = 0u;
    int _221 = _173 + 528;
    uint _223 = uint(int(uint(_221) >> uint(2)));
    _31[int(_223)] = 1065353216u;
    int _225 = _159 + 144;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    _31[int(_227)] = as_type<uint>(_67);
    int _229 = _159 + 272;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    _31[int(_231)] = as_type<uint>(_83);
    int _233 = _189 + 3;
    int _235 = _159 + 400;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    _31[int(_237)] = 0u;
    int _239 = _189 + 1;
    int _241 = _159 + 528;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    _31[int(_243)] = 1065353216u;
    int _245 = _193 + 144;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    _31[int(_247)] = as_type<uint>(_77);
    int _249 = _193 + 272;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    _31[int(_251)] = as_type<uint>(_73);
    int _253 = _193 + 400;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    _31[int(_255)] = 0u;
    int _257 = _193 + 528;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    _31[int(_259)] = 1065353216u;
    int _261 = _201 + 144;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    _31[int(_263)] = as_type<uint>(_77);
    int _265 = _201 + 272;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    _31[int(_267)] = as_type<uint>(_83);
    int _269 = _201 + 400;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    _31[int(_271)] = 0u;
    int _273 = _201 + 528;
    uint _275 = uint(int(uint(_273) >> uint(2)));
    _31[int(_275)] = 1065353216u;
    int _277 = _139 + 2708;
    int _279 = _277;
    int _281 = _189;
    _44(_279, _281, _31);
    int _283 = _139 + 2709;
    int _285 = _283;
    int _287 = _239;
    _44(_285, _287, _31);
    int _289 = _139 + 2710;
    int _291 = _289;
    int _293 = _205;
    _44(_291, _293, _31);
    int _295 = _139 + 2711;
    int _297 = _295;
    int _299 = _239;
    _44(_297, _299, _31);
    int _301 = _139 + 2712;
    int _303 = _301;
    int _305 = _233;
    _44(_303, _305, _31);
    int _307 = _139 + 2713;
    int _309 = _307;
    int _311 = _205;
    _44(_309, _311, _31);
    int _313 = _163 + 144;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    _31[int(_315)] = as_type<uint>(_89);
    int _317 = _207 + 144;
    uint _319 = uint(int(uint(_317) >> uint(2)));
    _31[int(_319)] = as_type<uint>(_89);
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
