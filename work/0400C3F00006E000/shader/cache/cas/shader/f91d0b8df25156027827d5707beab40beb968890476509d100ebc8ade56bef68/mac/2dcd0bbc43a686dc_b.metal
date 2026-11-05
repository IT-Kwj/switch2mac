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
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _44 = as_type<float>(gl_WorkGroupID.x);
    float _46 = as_type<float>(gl_LocalInvocationID.x);
    int _49 = as_type<int>(_44) * 32;
    int _51 = _49 + as_type<int>(_46);
    int _53 = _51 << 2;
    int _55 = _53 + 19456;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    float _60 = as_type<float>((*spvDescriptorSet0.cp_s0)._m0[int(_58)]);
    bool _64 = _60 >= 1.0;
    bool _66 = isnan(_60);
    bool _68 = _64 || _66;
    bool _70 = isnan(1.0);
    bool _72 = _68 || _70;
    if (_72)
    {
        return;
    }
    float _74 = float(uint(_51));
    int _76 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[40].x) + 1;
    float _78 = float(uint(_76));
    int _80 = -_76;
    float _82 = 1.0 / _78;
    int _84 = as_type<int>(_82) + (-2);
    float _86 = as_type<float>(_84) * _74;
    float _88 = trunc(_86);
    float _90 = precise::max(_88, 0.0);
    uint _92 = uint(_90);
    int _94 = _80 * int(_92);
    int _96 = _94 + _51;
    float _98 = float(uint(_96));
    int _100 = -_76;
    float _102 = as_type<float>(_84) * _98;
    float _104 = trunc(_102);
    float _106 = precise::max(_104, 0.0);
    uint _108 = uint(_106);
    int _110 = int(_92) + int(_108);
    int _112 = _100 * _110;
    int _114 = _112 + _51;
    bool _116 = uint(_114) >= uint(_76);
    bool _118 = !_116;
    int _120 = _118 ? 0 : (-1);
    bool _122 = 0 == _76;
    int _124 = -_120;
    int _126 = _110 + _124;
    bool _128 = !_122;
    int _130 = _128 ? _126 : (-1);
    int _132 = -_130;
    float _134 = float(uint(_130));
    int _136 = _132 * _76;
    int _138 = _136 + _51;
    float _140 = _134 * (*spvDescriptorSet0.cp_c3)._m0[40].w;
    float _142 = float(uint(_138));
    float _144 = _142 * (*spvDescriptorSet0.cp_c3)._m0[40].z;
    float2 _334 = float2(_144, _140);
    float _146 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334)), level(0.0)).x;
    bool _148 = _146 > _60;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan(_60);
    bool _156 = _152 || _154;
    if (_156)
    {
        return;
    }
    bool _158 = _146 != _60;
    bool _160 = isnan(_146);
    bool _162 = _158 || _160;
    bool _164 = isnan(_60);
    bool _166 = _162 || _164;
    bool _168 = !_166;
    int _170 = _168 ? (-1082130432) : (-1073741824);
    uint _172 = uint(int(uint(_55) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_172)] = uint(_170);
}

