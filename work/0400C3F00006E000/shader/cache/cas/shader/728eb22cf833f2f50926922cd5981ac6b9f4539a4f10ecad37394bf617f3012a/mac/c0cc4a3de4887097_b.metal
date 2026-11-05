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
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c5 [[id(3)]];
    texture2d_array<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _47 = as_type<float>(gl_WorkGroupID.y);
    int _50 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].z) << 3;
    float _52 = as_type<float>(gl_LocalInvocationID.y);
    float _54 = float(uint(_50));
    float _56 = 1.0 / _54;
    int _58 = as_type<int>(_47) << 3;
    int _60 = _58 + as_type<int>(_52);
    float _62 = float(uint(_60));
    float _64 = _62 * _56;
    float3 _253 = float3(_64, 0.5, float(1));
    float3 _259 = select(_253, float3(0.0), isnan(_253));
    float _66 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _259.xy, uint(rint(_259.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _259.xy, uint(rint(_259.z)), level(0.0)).x;
    float3 _265 = float3(_64, 0.5, float(0));
    float3 _267 = select(_265, float3(0.0), isnan(_265));
    float _68 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _267.xy, uint(rint(_267.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _267.xy, uint(rint(_267.z)), level(0.0)).x;
    float _70 = as_type<float>(gl_WorkGroupID.x);
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 3;
    float _74 = as_type<float>(gl_LocalInvocationID.x);
    float _76 = float(uint(_72));
    float _78 = 1.0 / _76;
    int _80 = as_type<int>(_70) << 3;
    int _82 = _80 + as_type<int>(_74);
    float _84 = float(uint(_82));
    float _86 = _84 * _78;
    float _88 = _86 * 6.283185482025146484375;
    float _90 = _88 * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _92 = _88 * (*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _94 = _88 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
    float _96 = _88 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
    float _98 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c3)._m0[1].y, _90);
    float _100 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c3)._m0[0].y, _92);
    float _102 = _88 * (*spvDescriptorSet0.cp_c4)._m0[2].y;
    float _104 = _98 * 0.15915493667125701904296875;
    float _106 = _88 * (*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _108 = _100 * 0.15915493667125701904296875;
    float _110 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c3)._m0[2].y, _96);
    float _112 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[2].w, _102);
    float _114 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[0].w, _106);
    float _116 = _88 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _118 = _110 * 0.15915493667125701904296875;
    float _120 = _88 * (*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _122 = _114 * 0.15915493667125701904296875;
    float _124 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[1].w, _94);
    float _126 = _112 * 0.15915493667125701904296875;
    float _128 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c3)._m0[3].y, _116);
    float _130 = _122 * 6.283185482025146484375;
    float _132 = cos(_130);
    float _134 = _124 * 0.15915493667125701904296875;
    float _136 = _88 * (*spvDescriptorSet0.cp_c4)._m0[3].y;
    float _138 = _88 * (*spvDescriptorSet0.cp_c4)._m0[4].x;
    float _140 = _128 * 0.15915493667125701904296875;
    float _142 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c3)._m0[4].y, _120);
    float _144 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[3].w, _136);
    float _146 = _134 * 6.283185482025146484375;
    float _148 = cos(_146);
    float _150 = _142 * 0.15915493667125701904296875;
    float _152 = _144 * 0.15915493667125701904296875;
    float _154 = fma(6.283185482025146484375, (*spvDescriptorSet0.cp_c4)._m0[4].y, _138);
    float _156 = _154 * 0.15915493667125701904296875;
    float _158 = _108 * 6.283185482025146484375;
    float _160 = cos(_158);
    float _162 = _104 * 6.283185482025146484375;
    float _164 = cos(_162);
    float _166 = _132 * _148;
    float _168 = _126 * 6.283185482025146484375;
    float _170 = cos(_168);
    float _172 = _118 * 6.283185482025146484375;
    float _174 = cos(_172);
    float _176 = _160 * _164;
    float _178 = _152 * 6.283185482025146484375;
    float _180 = cos(_178);
    float _182 = _166 * _170;
    float _184 = _140 * 6.283185482025146484375;
    float _186 = cos(_184);
    float _188 = _176 * _174;
    float _190 = _156 * 6.283185482025146484375;
    float _192 = sin(_190);
    float _194 = _180 * _182;
    float _196 = _150 * 6.283185482025146484375;
    float _198 = sin(_196);
    float _200 = _186 * _188;
    float _202 = fma(_192, 0.100000001490116119384765625, _194);
    float _204 = fma(_198, 0.100000001490116119384765625, _200);
    float _206 = _66 * (*spvDescriptorSet0.cp_c5)._m0[8].y;
    float _208 = _68 * (*spvDescriptorSet0.cp_c5)._m0[8].x;
    float _210 = _202 * _206;
    float _212 = fma(_204, _208, _210);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_212, 0.0, 0.0, 0.0), uint2(int2(_82, _60)));
}

