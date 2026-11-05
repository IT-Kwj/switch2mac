#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
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

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d_array<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    int _52 = as_type<int>(_43) * 8;
    int _54 = _52 + as_type<int>(_45);
    bool _58 = uint(_54) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _60 = as_type<int>(_47) * 8;
    int _62 = _60 + as_type<int>(_49);
    bool _64 = uint(_62) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _66 = !_58;
    bool _68 = _64 && _66;
    if (!_68)
    {
        return;
    }
    float _70 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _72 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _74 = 1.0 / _70;
    float _76 = float(uint(_62));
    float _78 = float(uint(_54));
    float _80 = _76 + 0.5;
    float _82 = 1.0 / _72;
    float _84 = _78 + 0.5;
    float _86 = _80 * _74;
    float _88 = _84 * _82;
    float3 _193 = float3(_88, _86, float(0));
    float3 _198 = select(_193, float3(0.0), isnan(_193));
    float _90 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _198.xy, uint(rint(_198.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _198.xy, uint(rint(_198.z)), level(0.0)).y;
    float _92 = -_90;
    float _94 = _92 + 1.0;
    float _96 = _94 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _98 = trunc(_96);
    float _100 = precise::max(_98, 0.0);
    uint _103 = uint(_100);
    uint _105 = min(_103, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_105), 0.0, 0.0, 0.0), uint2(int2(_54, _62)));
}

