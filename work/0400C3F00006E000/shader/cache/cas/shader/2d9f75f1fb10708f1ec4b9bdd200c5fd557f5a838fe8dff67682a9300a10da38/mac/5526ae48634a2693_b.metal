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
    constant _16* cp_c3 [[id(0)]];
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    texture2d<float> cp_t_tcb_A [[id(3)]];
    sampler cp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> cp_t_tcb_8 [[id(5)]];
    sampler cp_t_tcb_8Smplr [[id(6)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(7)]];
    sampler cp_t_tcb_ASmplr_w [[id(8)]];
    sampler cp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _47 = as_type<float>(gl_WorkGroupID.x);
    float _49 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = (*spvDescriptorSet0.cp_c3)._m0[1].y * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_LocalInvocationID.y);
    int _60 = as_type<int>(_47) << 3;
    int _62 = _60 + as_type<int>(_51);
    int _64 = as_type<int>(_55) << 3;
    int _66 = _64 + as_type<int>(_57);
    float _68 = float(uint(_62));
    float _70 = float(uint(_66));
    float _72 = _68 + 0.5;
    float _74 = _70 + 0.5;
    float _76 = fma(_72, _49, -0.5);
    float _78 = fma(_74, _49, -0.5);
    float _80 = fma(_53, _76, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _82 = fma(_53, _78, (*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _84 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _86 = _80 + _84;
    float _88 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _90 = _82 + _88;
    float _92 = fma(_86, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _94 = fma(_90, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _96 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _98 = _92 + _96;
    float _100 = _92 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _102 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _104 = _94 + _102;
    float _106 = _94 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float2 _304 = float2(_98, _94);
    float _108 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_304, float2(0.0), isnan(_304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_304, float2(0.0), isnan(_304)), level(0.0)).x;
    float2 _316 = float2(_100, _94);
    float _110 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_316, float2(0.0), isnan(_316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_316, float2(0.0), isnan(_316)), level(0.0)).x;
    float2 _324 = float2(_92, _104);
    float _112 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_324, float2(0.0), isnan(_324)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_324, float2(0.0), isnan(_324)), level(0.0)).x;
    float2 _332 = float2(_92, _106);
    float _114 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_332, float2(0.0), isnan(_332)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_332, float2(0.0), isnan(_332)), level(0.0)).x;
    float2 _340 = float2(_92, _94);
    float2 _118 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_340, float2(0.0), isnan(_340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_340, float2(0.0), isnan(_340)), level(0.0)).xy;
    float _120 = _118.x;
    float _122 = _118.y;
    float2 _352 = float2(_92, _94);
    float _124 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352)), level(0.0)).x;
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _128 = _80 + _126;
    float _130 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _132 = _82 + _130;
    float _134 = fma(_128, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _136 = -_128;
    float _138 = fma(_136, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _140 = fma(_132, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _142 = -_132;
    float _144 = fma(_142, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _146 = precise::min(_134, _138);
    float _148 = precise::min(_140, _144);
    float _150 = precise::min(_146, _148);
    float _152 = precise::min(1.0, (*spvDescriptorSet0.cp_c5)._m0[1].z);
    float _154 = _150 * 20.0;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _108 + _110;
    float _160 = _112 + _158;
    float _162 = _114 + _160;
    float _164 = fma(_120, -4.0, _162);
    float _166 = fma(_164, (*spvDescriptorSet0.cp_c5)._m0[1].y, _122);
    float _168 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _170 = fma((*spvDescriptorSet0.cp_c5)._m0[0].y, _168, 1.0);
    float _172 = fma(_124, _152, _166);
    float _174 = (*spvDescriptorSet0.cp_c5)._m0[0].y * (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _176 = _172 * _170;
    float _178 = -_174;
    float _180 = fma(_178, (*spvDescriptorSet0.cp_c5)._m0[1].z, 1.0);
    float _182 = _176 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _184 = _176 * _156;
    float _186 = fma(_182, (*spvDescriptorSet0.cp_c5)._m0[1].z, _120);
    float _188 = _186 * _180;
    float _190 = _188 * _156;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_190, _184, 0.0, 0.0), uint2(int2(_62, _66)));
}

