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
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c4 [[id(2)]];
    texture2d<float> cp_t_tcb_C [[id(3)]];
    sampler cp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> cp_t_tcb_A [[id(5)]];
    sampler cp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(9)]];
    sampler cp_t_tcb_CSmplr_w [[id(10)]];
    sampler cp_t_tcb_ASmplr_w [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _53 = as_type<float>(gl_LocalInvocationID.y);
    float _55 = (*spvDescriptorSet0.cp_c3)._m0[1].y * (*spvDescriptorSet0.cp_c3)._m0[1].x;
    float _57 = as_type<float>(gl_WorkGroupID.x);
    float _59 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_49) << 3;
    int _64 = _62 + as_type<int>(_53);
    int _66 = as_type<int>(_57) << 3;
    int _68 = _66 + as_type<int>(_59);
    float _70 = float(uint(_64));
    float _72 = float(uint(_68));
    float _74 = _70 + 0.5;
    float _76 = _72 + 0.5;
    float _78 = fma(_74, _51, -0.5);
    float _80 = fma(_76, _51, -0.5);
    float _82 = fma(_55, _78, (*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _84 = fma(_55, _80, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _86 = fma(_82, 6.2500002968590706586837768554688e-05, 0.5);
    float _88 = fma(_84, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _292 = float2(_88, _86);
    float2 _92 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_292, float2(0.0), isnan(_292)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_292, float2(0.0), isnan(_292)), level(0.0)).xy;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = (*spvDescriptorSet0.cp_c5)._m0[1].z * (*spvDescriptorSet0.cp_c5)._m0[0].y;
    float _100 = fma(_94, 80.0, -40.0);
    float _102 = fma(_96, 80.0, -40.0);
    float _104 = -_98;
    float _106 = fma(_100, _104, _84);
    float _108 = -_98;
    float _110 = fma(_102, _108, _82);
    float _112 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _114 = _106 + _112;
    float _116 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _118 = _110 + _116;
    float _120 = fma(_114, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _122 = fma(_118, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _124 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _126 = _120 + _124;
    float _128 = _120 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _130 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
    float _132 = _122 + _130;
    float _134 = _122 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
    float2 _372 = float2(_126, _122);
    float _136 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372)), level(0.0)).x;
    float2 _380 = float2(_128, _122);
    float _138 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_380, float2(0.0), isnan(_380)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_380, float2(0.0), isnan(_380)), level(0.0)).x;
    float2 _388 = float2(_120, _132);
    float _140 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_388, float2(0.0), isnan(_388)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_388, float2(0.0), isnan(_388)), level(0.0)).x;
    float2 _396 = float2(_120, _134);
    float _142 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_396, float2(0.0), isnan(_396)), level(0.0)).x;
    float2 _404 = float2(_120, _122);
    float2 _144 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_404, float2(0.0), isnan(_404)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_404, float2(0.0), isnan(_404)), level(0.0)).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float2 _416 = float2(_120, _122);
    float _150 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416)), level(0.0)).x;
    float _152 = -(*spvDescriptorSet0.cp_c3)._m0[0].x;
    float _154 = _106 + _152;
    float _156 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _158 = _110 + _156;
    float _160 = precise::min(1.0, (*spvDescriptorSet0.cp_c5)._m0[1].z);
    float _162 = _136 + _138;
    float _164 = (*spvDescriptorSet0.cp_c5)._m0[0].y * (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _166 = _140 + _162;
    float _168 = -_164;
    float _170 = fma(_168, (*spvDescriptorSet0.cp_c5)._m0[1].z, 1.0);
    float _172 = fma(_158, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _174 = -_158;
    float _176 = fma(_174, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _178 = _142 + _166;
    float _180 = -(*spvDescriptorSet0.cp_c5)._m0[0].x;
    float _182 = fma((*spvDescriptorSet0.cp_c5)._m0[0].y, _180, 1.0);
    float _184 = fma(_146, -4.0, _178);
    float _186 = precise::min(_172, _176);
    float _188 = fma(_184, (*spvDescriptorSet0.cp_c5)._m0[1].y, _148);
    float _190 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _192 = -_154;
    float _194 = fma(_192, (*spvDescriptorSet0.cp_c3)._m0[1].w, 0.5);
    float _196 = fma(_150, _160, _188);
    float _198 = precise::min(_190, _194);
    float _200 = _196 * _182;
    float _202 = precise::min(_198, _186);
    float _204 = fma(_200, _98, _146);
    float _206 = _202 * 20.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _204 * _170;
    float _212 = _200 * _208;
    float _214 = _210 * _208;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_214, _212, 0.0, 0.0), uint2(int2(_68, _64)));
}

