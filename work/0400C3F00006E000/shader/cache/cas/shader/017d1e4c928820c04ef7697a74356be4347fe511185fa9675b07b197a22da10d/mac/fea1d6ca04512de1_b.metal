#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    const device _25* cp_s0 [[id(2)]];
    const device _25* cp_s1 [[id(3)]];
};

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 708>& _35)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _49 = as_type<float>(_35[0]);
    float _51 = as_type<float>(gl_SubgroupInvocationID);
    int _54 = as_type<int>(_49) * 32;
    int _56 = _54 + as_type<int>(_51);
    bool _60 = uint(_56) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    if (_60)
    {
        return;
    }
    int _62 = _56 * 48;
    int _64 = _62 + 32;
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
    int _89 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z) << 4;
    int _91 = _89 + 12;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    uint _95 = uint(int(uint(int(_93)) >> uint(2)));
    int _97 = int(_93) & 3;
    float _99 = (*spvDescriptorSet0.cp_c3)._m0[int(_95)][_97];
    int _101 = _89 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c3)._m0[int(_105)][_107];
    float _111 = _99 * _109;
    float _113 = fma(_111, 0.5, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _115 = fma(_111, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _117 = fma(_111, 0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _119 = _69 > _113;
    bool _121 = isnan(_69);
    bool _123 = _119 || _121;
    bool _125 = isnan(_113);
    bool _127 = _123 || _125;
    float _129 = fma(_111, -0.5, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    bool _131 = _81 >= _115;
    bool _133 = !_127;
    bool _135 = _131 && _133;
    bool _137 = _75 <= _117;
    bool _139 = _137 && _135;
    bool _141 = _87 >= _129;
    bool _143 = _141 && _139;
    if (!_143)
    {
        return;
    }
    int _145 = _62 + 8;
    int _147 = _56 * 8;
    int _149 = _62 + 16;
    uint _151 = uint(int(uint(_62) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_151)];
    float _153 = as_type<float>(_dmw1.x);
    int _155 = _62 + 4;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    float _159 = as_type<float>(_dmw1.y);
    int _161 = _62 + 24;
    int _163 = _147 + 4;
    uint _165 = uint(int(uint(_145) >> uint(2)));
    float _167 = as_type<float>(_dmw1.z);
    int _169 = _145 + 4;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    float _173 = as_type<float>(_dmw1.w);
    uint _175 = uint(int(uint(_149) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_175)];
    float _177 = as_type<float>(_dmw2.x);
    int _179 = _149 + 4;
    uint _181 = uint(int(uint(_179) >> uint(2)));
    float _183 = as_type<float>(_dmw2.y);
    uint _185 = uint(int(uint(_161) >> uint(2)));
    float _187 = as_type<float>(_dmw2.z);
    int _189 = _161 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>(_dmw2.w);
    uint _195 = uint(int(uint(_147) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.cp_s1)._m0[int(_195)];
    float _197 = as_type<float>(_dmw3.x);
    uint _199 = uint(int(uint(_163) >> uint(2)));
    float _201 = as_type<float>(_dmw3.y);
    uint _203 = spvSubgroupBallot(true).x;
    int _205 = reverse_bits(int(_203));
    float _207 = as_type<float>(gl_SubgroupLtMask.x);
    int _209 = int(spvFindUMSB(uint(_205)));
    bool _211 = _209 != (-1);
    int _213 = _209 ^ 31;
    int _215 = _211 ? _213 : _209;
    bool _217 = as_type<int>(_51) != _215;
    int _219 = as_type<int>(_207) & int(_203);
    int _221 = popcount(_219);
    int _223 = _221 * 40;
    int _225 = _223 + 1440;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    _35[int(_227)] = as_type<uint>(_153);
    int _229 = _223 + 1444;
    uint _231 = uint(int(uint(_229) >> uint(2)));
    _35[int(_231)] = as_type<uint>(_159);
    int _233 = _223 + 1448;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    _35[int(_235)] = as_type<uint>(_167);
    int _237 = _223 + 1452;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    _35[int(_239)] = as_type<uint>(_173);
    int _241 = _223 + 1456;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    _35[int(_243)] = as_type<uint>(_177);
    int _245 = _223 + 1460;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    _35[int(_247)] = as_type<uint>(_183);
    int _249 = _223 + 1464;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    _35[int(_251)] = as_type<uint>(_187);
    int _253 = _223 + 1468;
    uint _255 = uint(int(uint(_253) >> uint(2)));
    _35[int(_255)] = as_type<uint>(_193);
    int _257 = _223 + 1472;
    uint _259 = uint(int(uint(_257) >> uint(2)));
    _35[int(_259)] = as_type<uint>(_197);
    int _261 = _223 + 1476;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    _35[int(_263)] = as_type<uint>(_201);
    if (_217)
    {
        return;
    }
    int _265 = popcount(int(_203));
    _35[357] = uint(_265);
}


struct dm_payload_t { uint w[352]; };
[[object]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], object_data dm_payload_t& dm_payload [[payload]], mesh_grid_properties dm_grid, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 708> _35;
    for (uint i = dm_lid; i < 708u; i += 32u) _35[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _35[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _35);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 352u; i += 32u) dm_payload.w[i] = _35[356u + i];
    if (dm_lid == 0u) dm_grid.set_threadgroups_per_grid(uint3(min(_35[357], 1024u), 1u, 1u));
}
