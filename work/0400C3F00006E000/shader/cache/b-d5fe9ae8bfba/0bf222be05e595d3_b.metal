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

struct _15
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    const device _15* cp_s0 [[id(0)]];
};

static inline __attribute__((always_inline)) void dm_stage_body(constant spvDescriptorSetBuffer0& spvDescriptorSet0, uint gl_SubgroupInvocationID, threadgroup spvUnsafeArray<uint, 132>& _23)
{
    uint4 gl_SubgroupLtMask = uint4(extract_bits(0xFFFFFFFF, 0, min(gl_SubgroupInvocationID, 32u)), extract_bits(0xFFFFFFFF, 0, (uint)max((int)gl_SubgroupInvocationID - 32, 0)), uint2(0));
    float _37 = as_type<float>(gl_SubgroupInvocationID);
    int _40 = as_type<int>(_37) << 2;
    uint _43 = uint(int(uint(_40) >> uint(2)));
    float _45 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_43)]);
    uint _47 = spvSubgroupBallot(true).x;
    int _49 = reverse_bits(int(_47));
    int _51 = int(spvFindUMSB(uint(_49)));
    bool _55 = _51 != (-1);
    int _57 = _51 ^ 31;
    int _59 = _55 ? _57 : _51;
    bool _61 = as_type<int>(_37) != _59;
    bool _63 = as_type<int>(_45) > 4;
    int _65 = 0;
    if (_63)
    {
        float _67 = as_type<float>(gl_SubgroupLtMask.x);
        _65 = as_type<int>(_67);
    }
    int _69 = _65;
    uint _71 = spvSubgroupBallot(_63).x;
    int _73 = _69;
    if (_63)
    {
        int _75 = int(_71) & _69;
        _73 = _75;
    }
    int _77 = _73;
    int _79 = _77;
    if (_63)
    {
        int _81 = popcount(_77);
        _79 = _81;
    }
    int _83 = _79;
    int _85 = 0;
    if (_63)
    {
        int _87 = _83 * 4;
        _85 = _87;
    }
    int _89 = _85;
    if (_63)
    {
        int _91 = _89 + 288;
        uint _93 = uint(int(uint(_91) >> uint(2)));
        _23[int(_93)] = as_type<uint>(_37);
    }
    if (_61)
    {
        return;
    }
    int _95 = popcount(int(_71));
    _23[69] = uint(_95);
}


struct dm_payload_t { uint w[64]; };
[[object]] void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]], uint dm_lid [[thread_position_in_threadgroup]], uint dm_tg [[threadgroup_position_in_grid]], object_data dm_payload_t& dm_payload [[payload]], mesh_grid_properties dm_grid, constant uint* dm_first [[buffer(29)]])
{
    threadgroup spvUnsafeArray<uint, 132> _23;
    for (uint i = dm_lid; i < 132u; i += 32u) _23[i] = 0u;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (dm_lid == 0u) _23[0] = dm_first[0] + dm_tg;
    threadgroup_barrier(mem_flags::mem_threadgroup);
    dm_stage_body(spvDescriptorSet0, gl_SubgroupInvocationID, _23);
    threadgroup_barrier(mem_flags::mem_threadgroup);
    for (uint i = dm_lid; i < 64u; i += 32u) dm_payload.w[i] = _23[68u + i];
    if (dm_lid == 0u) dm_grid.set_threadgroups_per_grid(uint3(min(_23[69], 1024u), 1u, 1u));
}
