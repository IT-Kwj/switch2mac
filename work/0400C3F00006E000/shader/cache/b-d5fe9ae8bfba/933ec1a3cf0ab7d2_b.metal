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
    int _89 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z) + 1;
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
    int _147 = _62 + 8;
    int _149 = _56 * 8;
    int _151 = _62 + 16;
    uint _153 = uint(int(uint(_62) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_153)];
    float _155 = as_type<float>(_dmw1.x);
    int _157 = _62 + 4;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    float _161 = as_type<float>(_dmw1.y);
    int _163 = _62 + 24;
    int _165 = _149 + 4;
    uint _167 = uint(int(uint(_147) >> uint(2)));
    float _169 = as_type<float>(_dmw1.z);
    int _171 = _147 + 4;
    uint _173 = uint(int(uint(_171) >> uint(2)));
    float _175 = as_type<float>(_dmw1.w);
    uint _177 = uint(int(uint(_151) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.cp_s0)._m0[int(_177)];
    float _179 = as_type<float>(_dmw2.x);
    int _181 = _151 + 4;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    float _185 = as_type<float>(_dmw2.y);
    uint _187 = uint(int(uint(_163) >> uint(2)));
    float _189 = as_type<float>(_dmw2.z);
    int _191 = _163 + 4;
    uint _193 = uint(int(uint(_191) >> uint(2)));
    float _195 = as_type<float>(_dmw2.w);
    uint _197 = uint(int(uint(_149) >> uint(2)));
    packed_uint2 _dmw3 = *(const device packed_uint2*)&(*spvDescriptorSet0.cp_s1)._m0[int(_197)];
    float _199 = as_type<float>(_dmw3.x);
    uint _201 = uint(int(uint(_165) >> uint(2)));
    float _203 = as_type<float>(_dmw3.y);
    uint _205 = spvSubgroupBallot(true).x;
    int _207 = reverse_bits(int(_205));
    float _209 = as_type<float>(gl_SubgroupLtMask.x);
    int _211 = int(spvFindUMSB(uint(_207)));
    bool _213 = _211 != (-1);
    int _215 = _211 ^ 31;
    int _217 = _213 ? _215 : _211;
    bool _219 = as_type<int>(_51) != _217;
    int _221 = as_type<int>(_209) & int(_205);
    int _223 = popcount(_221);
    int _225 = _223 * 40;
    int _227 = _225 + 1440;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    _35[int(_229)] = as_type<uint>(_155);
    int _231 = _225 + 1444;
    uint _233 = uint(int(uint(_231) >> uint(2)));
    _35[int(_233)] = as_type<uint>(_161);
    int _235 = _225 + 1448;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    _35[int(_237)] = as_type<uint>(_169);
    int _239 = _225 + 1452;
    uint _241 = uint(int(uint(_239) >> uint(2)));
    _35[int(_241)] = as_type<uint>(_175);
    int _243 = _225 + 1456;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    _35[int(_245)] = as_type<uint>(_179);
    int _247 = _225 + 1460;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    _35[int(_249)] = as_type<uint>(_185);
    int _251 = _225 + 1464;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    _35[int(_253)] = as_type<uint>(_189);
    int _255 = _225 + 1468;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    _35[int(_257)] = as_type<uint>(_195);
    int _259 = _225 + 1472;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    _35[int(_261)] = as_type<uint>(_199);
    int _263 = _225 + 1476;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    _35[int(_265)] = as_type<uint>(_203);
    if (_219)
    {
        return;
    }
    int _267 = popcount(int(_205));
    _35[357] = uint(_267);
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
