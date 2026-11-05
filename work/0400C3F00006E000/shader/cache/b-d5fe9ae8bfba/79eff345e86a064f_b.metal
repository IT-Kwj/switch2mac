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
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(5)]];
    sampler cp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _49 = as_type<float>(gl_LocalInvocationID.x);
    float _51 = (*spvDescriptorSet0.cp_c3)._m0[1].y * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _53 = as_type<float>(gl_WorkGroupID.y);
    float _55 = as_type<float>(gl_LocalInvocationID.y);
    int _58 = as_type<int>(_45) << 3;
    int _60 = _58 + as_type<int>(_49);
    int _62 = as_type<int>(_53) << 3;
    int _64 = _62 + as_type<int>(_55);
    float _66 = float(uint(_60));
    float _68 = float(uint(_64));
    float _70 = _66 + 0.5;
    float _72 = _68 + 0.5;
    float _74 = fma(_70, _47, -0.5);
    float _76 = fma(_72, _47, -0.5);
    float _78 = fma(_51, _74, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _80 = fma(_51, _76, (*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _82 = -(*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _84 = _78 + _82;
    float _86 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _88 = _80 + _86;
    float _90 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _92 = fma(_88, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _94 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _96 = _90 + _94;
    float _98 = _90 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _100 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _102 = _92 + _100;
    float _104 = _92 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float2 _284 = float2(_96, _92);
    float _106 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_284, float2(0.0), isnan(_284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_284, float2(0.0), isnan(_284)), level(0.0)).x;
    float2 _296 = float2(_98, _92);
    float _108 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296)), level(0.0)).x;
    float2 _304 = float2(_90, _102);
    float _110 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304)), level(0.0)).x;
    float2 _312 = float2(_90, _104);
    float _112 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312)), level(0.0)).x;
    float2 _320 = float2(_90, _92);
    float2 _116 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320)), level(0.0)).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = -_84;
    float _124 = fma(_122, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _126 = -_88;
    float _128 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _130 = precise::min(_90, _124);
    float _132 = precise::min(_92, _128);
    float _134 = precise::min(_130, _132);
    float _136 = _134 * 20.0;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = _106 + _108;
    float _142 = _110 + _140;
    float _144 = _112 + _142;
    float _146 = fma(_118, -4.0, _144);
    float _148 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _150 = fma((*spvDescriptorSet0.cp_c5)._m0[0].y, _148, 1.0);
    float _152 = (*spvDescriptorSet0.cp_c5)._m0[0].y * (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _154 = fma(_146, (*spvDescriptorSet0.cp_c5)._m0[1].y, _120);
    float _156 = -_152;
    float _158 = fma(_156, (*spvDescriptorSet0.cp_c5)._m0[1].z, 1.0);
    float _160 = _154 * _150;
    float _162 = _160 * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _164 = _160 * _138;
    float _166 = fma(_162, (*spvDescriptorSet0.cp_c5)._m0[1].z, _118);
    float _168 = _166 * _158;
    float _170 = _168 * _138;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_170, _164, 0.0, 0.0), uint2(int2(_60, _64)));
}

