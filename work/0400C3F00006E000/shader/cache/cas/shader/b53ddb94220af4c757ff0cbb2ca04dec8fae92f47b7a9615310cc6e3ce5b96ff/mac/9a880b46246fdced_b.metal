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
    texture2d<float> cp_t_tcb_A [[id(3)]];
    sampler cp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> cp_t_tcb_8 [[id(5)]];
    sampler cp_t_tcb_8Smplr [[id(6)]];
    sampler cp_t_tcb_ASmplr_w [[id(7)]];
    sampler cp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _48 = as_type<float>(gl_WorkGroupID.x);
    float _50 = as_type<float>(gl_LocalInvocationID.x);
    int _53 = as_type<int>(_48) << 5;
    int _55 = _53 + as_type<int>(_50);
    bool _59 = uint(_55) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    if (_59)
    {
        return;
    }
    int _61 = _55 << 4;
    uint _64 = uint(int(uint(_61) >> uint(2)));
    uint _66 = uint(int(uint(int(_64)) >> uint(2)));
    int _68 = int(_64) & 3;
    float _70 = (*spvDescriptorSet0.cp_c3)._m0[int(_66)][_68];
    int _72 = int(_64) + 1;
    uint _74 = uint(int(uint(_72) >> uint(2)));
    int _76 = _72 & 3;
    float _78 = (*spvDescriptorSet0.cp_c3)._m0[int(_74)][_76];
    float2 _182 = float2(_70, _78);
    float _80 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_182, float2(0.0), isnan(_182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_182, float2(0.0), isnan(_182)), level(0.0)).x;
    int _82 = _61 + 8;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    uint _86 = uint(int(uint(int(_84)) >> uint(2)));
    int _88 = int(_84) & 3;
    float _90 = (*spvDescriptorSet0.cp_c3)._m0[int(_86)][_88];
    float _92 = _80 + _90;
    float2 _214 = float2(_70, _78);
    float4 _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214)), level(_92)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_214, float2(0.0), isnan(_214)), level(_92)).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    uint _105 = uint(int(uint(_61) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_105)] = as_type<uint>(_97);
    int _107 = _61 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_109)] = as_type<uint>(_99);
    int _111 = _61 + 8;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_113)] = as_type<uint>(_101);
    int _115 = _61 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_117)] = as_type<uint>(_103);
}

