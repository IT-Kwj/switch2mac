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
    float3 _209 = float3(_50, _52, _56);
    float3 _60 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_209, float3(0.0), isnan(_209)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_209, float3(0.0), isnan(_209)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).xyz;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = (*spvDescriptorSet0.cp_c3)._m0[0].z * 0.2820949852466583251953125;
    float _70 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _72 = _70 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _74 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _76 = (*spvDescriptorSet0.cp_c3)._m0[4].z * (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _78 = (*spvDescriptorSet0.cp_c3)._m0[4].z * 1.09254801273345947265625;
    float _80 = _74 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _82 = fma(_76, 0.94617593288421630859375, -0.3153919875621795654296875);
    float _84 = (*spvDescriptorSet0.cp_c3)._m0[4].x * 0.48860299587249755859375;
    float _86 = _78 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _88 = _82 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _90 = _84 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _92 = _86 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _94 = _62 * _68;
    float _96 = _64 * _68;
    float _98 = _66 * _68;
    float _100 = (*spvDescriptorSet0.cp_c3)._m0[4].y * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _102 = _62 * _72;
    float _104 = _62 * _80;
    float _106 = _64 * _80;
    float _108 = -_100;
    float _110 = fma((*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].x, _108);
    float _112 = (*spvDescriptorSet0.cp_c3)._m0[4].y * 1.09254801273345947265625;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_94);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_96);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_98);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_102);
    float _114 = _62 * _90;
    float _116 = _110 * 0.546274006366729736328125;
    float _118 = _112 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _120 = _112 * (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _122 = _62 * _92;
    float _124 = _116 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _126 = _118 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _128 = _120 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _130 = _66 * _80;
    float _132 = _62 * _124;
    float _134 = _62 * _88;
    float _136 = _64 * _72;
    float _138 = _64 * _90;
    float _140 = _62 * _126;
    float _142 = _62 * _128;
    float _144 = _66 * _72;
    float _146 = _66 * _90;
    float _148 = _64 * _92;
    float _150 = _64 * _88;
    float _152 = _64 * _126;
    float _154 = _64 * _128;
    float _156 = _64 * _124;
    float _158 = _66 * _124;
    float _160 = _66 * _92;
    float _162 = _66 * _88;
    float _164 = _66 * _126;
    float _166 = _66 * _128;
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>(_136);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>(_144);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>(_104);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>(_106);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>(_130);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>(_114);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>(_138);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>(_146);
    (*spvDescriptorSet0.cp_s0)._m0[20] = as_type<uint>(_162);
    (*spvDescriptorSet0.cp_s0)._m0[21] = as_type<uint>(_122);
    (*spvDescriptorSet0.cp_s0)._m0[22] = as_type<uint>(_148);
    (*spvDescriptorSet0.cp_s0)._m0[23] = as_type<uint>(_160);
    (*spvDescriptorSet0.cp_s0)._m0[12] = as_type<uint>(_140);
    (*spvDescriptorSet0.cp_s0)._m0[13] = as_type<uint>(_152);
    (*spvDescriptorSet0.cp_s0)._m0[14] = as_type<uint>(_164);
    (*spvDescriptorSet0.cp_s0)._m0[15] = as_type<uint>(_142);
    (*spvDescriptorSet0.cp_s0)._m0[16] = as_type<uint>(_154);
    (*spvDescriptorSet0.cp_s0)._m0[17] = as_type<uint>(_166);
    (*spvDescriptorSet0.cp_s0)._m0[18] = as_type<uint>(_134);
    (*spvDescriptorSet0.cp_s0)._m0[19] = as_type<uint>(_150);
    (*spvDescriptorSet0.cp_s0)._m0[24] = as_type<uint>(_132);
    (*spvDescriptorSet0.cp_s0)._m0[25] = as_type<uint>(_156);
    (*spvDescriptorSet0.cp_s0)._m0[26] = as_type<uint>(_158);
}

