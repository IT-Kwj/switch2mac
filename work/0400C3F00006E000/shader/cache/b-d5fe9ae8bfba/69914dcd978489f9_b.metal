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
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    sampler cp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = as_type<float>(gl_LocalInvocationID.y);
    int _54 = as_type<int>(_45) << 3;
    int _56 = _54 + as_type<int>(_47);
    bool _60 = uint(_56) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _62 = as_type<int>(_49) << 3;
    int _64 = _62 + as_type<int>(_51);
    bool _66 = uint(_64) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _68 = !_60;
    bool _70 = _66 && _68;
    if (!_70)
    {
        return;
    }
    float _72 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _74 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _76 = 1.0 / _72;
    float _78 = float(uint(_56));
    float _80 = float(uint(_64));
    float _82 = _78 + 0.5;
    float _84 = 1.0 / _74;
    float _86 = _80 + 0.5;
    float _88 = _82 * _76;
    float _90 = _86 * _84;
    float2 _328 = float2(_88, _90);
    float _92 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328)), level(0.0)).x;
    float2 _339 = float2(_88, _90);
    float _94 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_339, float2(0.0), isnan(_339)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_339, float2(0.0), isnan(_339)), level(0.0)).w;
    float _96 = -_90;
    float _98 = _96 + 1.0;
    float _100 = _88 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _102 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _104 = fma(_100, 2.0, -1.0);
    float _106 = fma(_102, 2.0, -1.0);
    float _108 = _104 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _110 = -_92;
    float _112 = fma(_110, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _114 = _106 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _116 = 1.0 / _112;
    float _118 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _120 = _116 * _118;
    float _122 = _120 * _114;
    float _124 = _120 * _108;
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _128 = _122 * _126;
    float _130 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _132 = _122 * _130;
    float _134 = 0.0 + _94;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = -_124;
    float _140 = fma(_138, (*spvDescriptorSet0.cp_c3)._m0[1].x, _128);
    float _142 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _144 = _122 * _142;
    float _146 = -_124;
    float _148 = fma(_146, (*spvDescriptorSet0.cp_c3)._m0[0].x, _132);
    float _150 = -_136;
    float _152 = _150 + 1.0;
    float _154 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[1].z, _140);
    float _156 = -_124;
    float _158 = fma(_156, (*spvDescriptorSet0.cp_c3)._m0[2].x, _144);
    float _160 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[0].z, _148);
    float _162 = _154 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _164 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[2].z, _158);
    float _166 = _160 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _168 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _170 = _162 + _168;
    float _172 = _164 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _174 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _176 = _166 + _174;
    float _178 = _170 * _170;
    float _180 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _182 = _172 + _180;
    float _184 = abs(_166);
    float _186 = abs(_172);
    float _188 = precise::max(_184, _186);
    float _190 = fma(_176, _176, _178);
    float _192 = fma(_182, _182, _190);
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _196 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _194;
    float _198 = fma(_188, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = 1.0 / _196;
    float _204 = -_200;
    float _206 = _204 + 1.0;
    float _208 = precise::min(_206, _152);
    float _210 = sqrt(_192);
    float _212 = _208 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _214 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _216 = _210 + _214;
    float _218 = _216 * _202;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = precise::min(_206, _220);
    float _224 = trunc(_212);
    float _226 = precise::max(_224, 0.0);
    uint _229 = uint(_226);
    float _231 = _222 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _233 = trunc(_231);
    float _235 = precise::max(_233, 0.0);
    uint _237 = uint(_235);
    uint _239 = max(_237, _229);
    uint _241 = min(_239, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_241), 0.0, 0.0, 0.0), uint2(int2(_56, _64)));
}

