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

struct _25
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    device _25* cp_s0 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _46 = as_type<float>(gl_WorkGroupID.x);
    float _48 = as_type<float>(gl_LocalInvocationID.x);
    int _51 = as_type<int>(_46) * 32;
    int _53 = _51 + as_type<int>(_48);
    bool _57 = uint(_53) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    if (_57)
    {
        return;
    }
    int _59 = _53 << 4;
    int _61 = _59 + 8;
    uint _64 = uint(int(uint(_61) >> uint(2)));
    uint _66 = uint(int(uint(int(_64)) >> uint(2)));
    int _68 = int(_64) & 3;
    float _70 = (*spvDescriptorSet0.cp_c3)._m0[int(_66)][_68];
    uint _72 = uint(int(uint(_59) >> uint(2)));
    uint _74 = uint(int(uint(int(_72)) >> uint(2)));
    int _76 = int(_72) & 3;
    float _78 = (*spvDescriptorSet0.cp_c3)._m0[int(_74)][_76];
    int _80 = int(_72) + 1;
    uint _82 = uint(int(uint(_80) >> uint(2)));
    int _84 = _80 & 3;
    float _86 = (*spvDescriptorSet0.cp_c3)._m0[int(_82)][_84];
    float2 _194 = float2(_78, _86);
    float4 _89 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194)), level(_70)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194)), level(_70)).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    uint _99 = uint(int(uint(_59) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_99)] = as_type<uint>(_91);
    int _101 = _59 + 4;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_103)] = as_type<uint>(_93);
    int _105 = _59 + 8;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_107)] = as_type<uint>(_95);
    int _109 = _59 + 12;
    uint _111 = uint(int(uint(_109) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_111)] = as_type<uint>(_97);
}

