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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    texturecube<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    float _38 = abs((*spvDescriptorSet0.cp_c3)._m0[4].x);
    float _40 = abs((*spvDescriptorSet0.cp_c3)._m0[4].y);
    float _42 = precise::max(_38, _40);
    float _44 = abs((*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _46 = precise::max(_42, _44);
    float _48 = 1.0 / _46;
    float _50 = _48 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _52 = _48 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _54 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _56 = _48 * _54;
    float3 _145 = float3(_50, _52, _56);
    float3 _60 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_145, float3(0.0), isnan(_145)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_145, float3(0.0), isnan(_145)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).xyz;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = (*spvDescriptorSet0.cp_c3)._m0[4].x * 0.48860299587249755859375;
    float _70 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _72 = _62 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _74 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _76 = _64 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _78 = _66 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _80 = _72 * 0.2820949852466583251953125;
    float _82 = _70 * _72;
    float _84 = _74 * _72;
    float _86 = _70 * _76;
    float _88 = _70 * _78;
    float _90 = _76 * 0.2820949852466583251953125;
    float _92 = _74 * _76;
    float _94 = _74 * _78;
    float _96 = _68 * _72;
    float _98 = _68 * _76;
    float _100 = _68 * _78;
    float _102 = _78 * 0.2820949852466583251953125;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_80);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_82);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_84);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_96);
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>(_90);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>(_86);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>(_92);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>(_98);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>(_102);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>(_88);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>(_94);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>(_100);
}

