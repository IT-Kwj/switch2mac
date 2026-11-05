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
    texture2d<float> cp_t_tcb_C [[id(7)]];
    sampler cp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float, access::write> cp_i_tcb_48_ [[id(9)]];
    sampler cp_t_tcb_8Smplr_w [[id(10)]];
    sampler cp_t_tcb_ASmplr_w [[id(11)]];
    sampler cp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    float _55 = as_type<float>(gl_WorkGroupID.z);
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    float _61 = as_type<float>(gl_WorkGroupID.y);
    float _63 = as_type<float>(gl_LocalInvocationID.y);
    int _66 = as_type<int>(_55) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _68 = _66 << 4;
    int _70 = _68 + 4;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c3)._m0[int(_75)][_77];
    int _81 = as_type<int>(_57) << 3;
    int _83 = _81 + as_type<int>(_59);
    int _85 = _68 + 12;
    uint _87 = uint(int(uint(_85) >> uint(2)));
    uint _89 = uint(int(uint(int(_87)) >> uint(2)));
    int _91 = int(_87) & 3;
    float _93 = (*spvDescriptorSet0.cp_c3)._m0[int(_89)][_91];
    int _95 = as_type<int>(_61) * 4;
    int _97 = _95 + as_type<int>(_63);
    float _99 = float(_83);
    float _101 = float(_97);
    float _103 = _99 + 0.5;
    float _105 = _101 + 0.5;
    float _107 = 1.0 / _79;
    float _109 = _79 * _93;
    float _111 = fma(_103, _107, -0.5);
    float _113 = fma(_105, _107, -0.5);
    float _115 = fma(_109, _111, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _117 = fma(_109, _113, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _119 = fma(_115, 6.2500002968590706586837768554688e-05, 0.5);
    float _121 = fma(_117, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _320 = float2(_119, _121);
    float _123 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320)), level(0.0)).x;
    float2 _331 = float2(_119, _121);
    float2 _127 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_331, float2(0.0), isnan(_331)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_331, float2(0.0), isnan(_331)), level(_123)).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float2 _344 = float2(_119, _121);
    float2 _133 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_344, float2(0.0), isnan(_344)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_344, float2(0.0), isnan(_344)), level(0.0)).zw;
    float _135 = _133.x;
    float _137 = _133.y;
    int _139 = _83 | _97;
    bool _143 = _139 != 0;
    float _145 = as_type<float>(gl_SubgroupInvocationID);
    int _147;
    if (!_143)
    {
        _147 = as_type<int>(_55) << 2;
    }
    if (!_143)
    {
        uint _149 = uint(int(uint(_147) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_149)] = 0u;
    }
    float _151 = -_129;
    float _153 = _151 + _131;
    uint _155 = spvSubgroupBallot(true).x;
    float _157 = _153 * 20.0;
    int _159 = reverse_bits(int(_155));
    float _161 = precise::max(_135, 0.100000001490116119384765625);
    int _163 = int(spvFindUMSB(uint(_159)));
    bool _165 = _163 != (-1);
    int _167 = _163 ^ 31;
    int _169 = _165 ? _167 : _163;
    bool _171 = _157 > (-0.00999999977648258209228515625);
    float _173 = 0.0 + _157;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    bool _177 = as_type<int>(_145) != _169;
    int3 _429 = int3(_83, _97, as_type<int>(_55));
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_175, _161, 0.0, _137), uint2(_429.xy), uint(_429.z));
    uint _179 = spvSubgroupBallot(_171).x;
    if (_177)
    {
        return;
    }
    int _181 = as_type<int>(_55) * 32;
    int _183 = _181 + as_type<int>(_61);
    int _185 = popcount(int(_179));
    int _187 = as_type<int>(_55) << 2;
    int _189 = _183 << 4;
    int _191 = _189 + as_type<int>(_57);
    int _193 = _191 << 2;
    uint _195 = uint(int(uint(_187) >> uint(2)));
    uint _472 = atomic_fetch_add_explicit((device atomic_uint*)&(*spvDescriptorSet0.cp_s0)._m0[int(_195)], uint(_185), memory_order_relaxed);
    uint _197 = _472;
    uint _199 = uint(int(uint(_193) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_199)] = uint(_185);
}

