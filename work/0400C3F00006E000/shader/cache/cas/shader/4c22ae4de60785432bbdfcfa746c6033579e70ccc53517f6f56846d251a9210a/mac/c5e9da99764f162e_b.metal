#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    device _21* cp_s0 [[id(1)]];
    device _21* cp_s1 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> cp_t_tcb_A [[id(5)]];
    sampler cp_t_tcb_ASmplr [[id(6)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(7)]];
    sampler cp_t_tcb_8Smplr_w [[id(8)]];
    sampler cp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _53 = as_type<float>(gl_WorkGroupID.z);
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    int _64 = as_type<int>(_53) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _66 = _64 << 4;
    int _68 = _66 + 4;
    uint _71 = uint(int(uint(_68) >> uint(2)));
    uint _73 = uint(int(uint(int(_71)) >> uint(2)));
    int _75 = int(_71) & 3;
    float _77 = (*spvDescriptorSet0.cp_c3)._m0[int(_73)][_75];
    int _79 = as_type<int>(_55) * 8;
    int _81 = _79 + as_type<int>(_57);
    float _83 = float(_81);
    int _85 = _66 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c3)._m0[int(_89)][_91];
    int _95 = as_type<int>(_59) << 2;
    int _97 = _95 + as_type<int>(_61);
    float _99 = _83 + 0.5;
    float _101 = float(_97);
    float _103 = _101 + 0.5;
    float _105 = 1.0 / _77;
    float _107 = _77 * _93;
    float _109 = fma(_99, _105, -0.5);
    float _111 = fma(_103, _105, -0.5);
    float _113 = fma(_107, _109, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _115 = fma(_107, _111, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _117 = fma(_113, 6.2500002968590706586837768554688e-05, 0.5);
    float _119 = fma(_115, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _311 = float2(_117, _119);
    float _121 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_311, float2(0.0), isnan(_311)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_311, float2(0.0), isnan(_311)), level(0.0)).x;
    float2 _322 = float2(_117, _119);
    float2 _125 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322)), level(_121)).xy;
    float _127 = _125.x;
    float _129 = _125.y;
    int _131 = _81 | _97;
    bool _135 = _131 != 0;
    float _137 = as_type<float>(gl_SubgroupInvocationID);
    int _139;
    if (!_135)
    {
        _139 = as_type<int>(_53) << 2;
    }
    if (!_135)
    {
        uint _141 = uint(int(uint(_139) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_141)] = 0u;
    }
    float _143 = -_127;
    float _145 = _143 + _129;
    uint _147 = spvSubgroupBallot(true).x;
    float _149 = _145 * 20.0;
    int _151 = reverse_bits(int(_147));
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    int _157 = int(spvFindUMSB(uint(_151)));
    bool _159 = _157 != (-1);
    int _161 = _157 ^ 31;
    int _163 = _159 ? _161 : _157;
    bool _165 = _149 > (-0.00999999977648258209228515625);
    int3 _401 = int3(_81, _97, as_type<int>(_53));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_155, 1.0, 0.0, 0.0), uint2(_401.xy), uint(_401.z));
    bool _167 = as_type<int>(_137) != _163;
    uint _169 = spvSubgroupBallot(_165).x;
    if (_167)
    {
        return;
    }
    int _171 = as_type<int>(_53) * 32;
    int _173 = _171 + as_type<int>(_59);
    int _175 = popcount(int(_169));
    int _177 = as_type<int>(_53) << 2;
    int _179 = _173 << 4;
    int _181 = _179 + as_type<int>(_55);
    int _183 = _181 << 2;
    uint _185 = uint(int(uint(_177) >> uint(2)));
    uint _446 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_185)], uint(_175), memory_order_relaxed);
    uint _187 = _446;
    uint _189 = uint(int(uint(_183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_189)] = uint(_175);
}

