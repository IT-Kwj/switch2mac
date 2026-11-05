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
    texturecube<float> cp_t_tcb_A [[id(2)]];
    sampler cp_t_tcb_ASmplr [[id(3)]];
    texturecube<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    sampler cp_t_tcb_ASmplr_w [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    float _40 = abs((*spvDescriptorSet0.cp_c3)._m0[4].x);
    float _42 = abs((*spvDescriptorSet0.cp_c3)._m0[4].y);
    float _44 = precise::max(_40, _42);
    float _46 = abs((*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _48 = precise::max(_44, _46);
    float _50 = 1.0 / _48;
    float _52 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _54 = _50 * _52;
    float _56 = _50 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _58 = _50 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float3 _223 = float3(_56, _58, _54);
    float _60 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_223, float3(0.0), isnan(_223)), level((*spvDescriptorSet0.cp_c3)._m0[1].y)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_223, float3(0.0), isnan(_223)), level((*spvDescriptorSet0.cp_c3)._m0[1].y)).x;
    float3 _237 = float3(_56, _58, _54);
    float3 _64 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_237, float3(0.0), isnan(_237)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_237, float3(0.0), isnan(_237)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).xyz;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _76 = 0.0 != (*spvDescriptorSet0.cp_c3)._m0[3].z;
    bool _78 = isnan(0.0);
    bool _80 = _76 || _78;
    bool _82 = isnan((*spvDescriptorSet0.cp_c3)._m0[3].z);
    bool _84 = _80 || _82;
    bool _86 = 0.0 < (*spvDescriptorSet0.cp_c3)._m0[3].w;
    bool _88 = _86 && _84;
    float _90 = _88 ? (*spvDescriptorSet0.cp_c3)._m0[2].w : 1.0;
    float _92 = -_60;
    float _94 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _96 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[3].y, _94);
    float _98 = abs(_96);
    float _100 = -_98;
    float _102 = _100 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _104 = abs(_96);
    bool _106 = _104 > (*spvDescriptorSet0.cp_c3)._m0[2].z;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.cp_c3)._m0[2].z);
    bool _114 = _110 || _112;
    float _116 = precise::max(0.0, _102);
    float _118 = _116 * _72;
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = abs(_120);
    float _124 = log2(_122);
    float _126 = _124 * (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _128 = exp2(_126);
    float _130 = _88 ? _128 : 1.0;
    float _132 = _130 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _134 = _132;
    if (_114)
    {
        float _136 = _90 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        _134 = _136;
    }
    float _138 = _134;
    float _140 = _66 * _138;
    float _142 = _68 * _138;
    float _144 = _70 * _138;
    float _146 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _148 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _150 = _140 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _152 = _142 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _154 = _144 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _156 = 0.48860299587249755859375 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _158 = _150 * 0.2820949852466583251953125;
    float _160 = _146 * _150;
    float _162 = _148 * _150;
    float _164 = _146 * _152;
    float _166 = _146 * _154;
    float _168 = _152 * 0.2820949852466583251953125;
    float _170 = _148 * _152;
    float _172 = _156 * _150;
    float _174 = _156 * _152;
    float _176 = _156 * _154;
    float _178 = _148 * _154;
    float _180 = _154 * 0.2820949852466583251953125;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_158);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_160);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_162);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_172);
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>(_168);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>(_164);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>(_170);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>(_174);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>(_180);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>(_166);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>(_178);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>(_176);
}

