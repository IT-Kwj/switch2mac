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
    texture3d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_E [[id(8)]];
    sampler cp_t_tcb_ESmplr [[id(9)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    sampler cp_t_tcb_8Smplr_w [[id(11)]];
    sampler cp_t_tcb_ASmplr_w [[id(12)]];
    sampler cp_t_tcb_CSmplr_w [[id(13)]];
    sampler cp_t_tcb_ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    int _64 = as_type<int>(_55) << 3;
    int _66 = _64 + as_type<int>(_57);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _72 = as_type<int>(_59) << 3;
    int _74 = _72 + as_type<int>(_61);
    bool _76 = uint(_74) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _78 = !_70;
    bool _80 = _76 && _78;
    if (!_80)
    {
        return;
    }
    float _82 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _84 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _86 = 1.0 / _82;
    float _88 = float(uint(_66));
    float _90 = float(uint(_74));
    float _92 = _88 + 0.5;
    float _94 = 1.0 / _84;
    float _96 = _90 + 0.5;
    float _98 = _92 * _86;
    float _100 = _96 * _94;
    float2 _370 = float2(_98, _100);
    float _102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370)), level(0.0)).x;
    float _104 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _106 = -_102;
    float _108 = fma(_106, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _110 = 1.0 / _108;
    float _112 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _114 = _110 * _112;
    float _116 = _114 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _118 = -_116;
    float _120 = fma(_118, _104, 1.0);
    float _122 = log2(_120);
    float2 _414 = float2(_98, _100);
    float _124 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_414, float2(0.0), isnan(_414)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_414, float2(0.0), isnan(_414)), level(0.0)).w;
    float _126 = _122 * 0.693147182464599609375;
    float _128 = _126 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _431 = float3(_98, _100, _128);
    float _130 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_431, float3(0.0), isnan(_431)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_431, float3(0.0), isnan(_431)), level(0.0)).w;
    float3 _442 = float3(_98, _100, float(0));
    float3 _444 = select(_442, float3(0.0), isnan(_442));
    float _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _444.xy, uint(rint(_444.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _444.xy, uint(rint(_444.z)), level(0.0)).y;
    float _134 = -_100;
    float _136 = _134 + 1.0;
    float _138 = _136 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _140 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _142 = fma(_138, 2.0, -1.0);
    float _144 = fma(_140, 2.0, -1.0);
    float _146 = _142 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _148 = _144 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _150 = _114 * _146;
    float _152 = _114 * _148;
    float _154 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _156 = _150 * _154;
    float _158 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _160 = _150 * _158;
    float _162 = -_152;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[1].x, _156);
    float _166 = -_152;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c3)._m0[0].x, _160);
    float _170 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _172 = _150 * _170;
    float _174 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[1].z, _164);
    float _176 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[0].z, _168);
    float _178 = -_152;
    float _180 = fma(_178, (*spvDescriptorSet0.cp_c3)._m0[2].x, _172);
    float _182 = _174 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _184 = _176 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _186 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[2].z, _180);
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _190 = _182 + _188;
    float _192 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _194 = _184 + _192;
    float _196 = _186 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _198 = _190 * _190;
    float _200 = fma(_194, _194, _198);
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _204 = _196 + _202;
    float _206 = abs(_184);
    float _208 = abs(_196);
    float _210 = precise::max(_206, _208);
    float _212 = fma(_204, _204, _200);
    float _214 = fma(_210, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _220 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _218;
    float _222 = sqrt(_212);
    float _224 = -_216;
    float _226 = _224 + 1.0;
    float _228 = 1.0 / _220;
    float _230 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _232 = _222 + _230;
    float _234 = _232 * _228;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = precise::min(_226, _236);
    float _240 = _238 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _242 = trunc(_240);
    float _244 = precise::max(_242, 0.0);
    uint _247 = uint(_244);
    float _249 = _124 * _130;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = -_132;
    float _255 = _253 + 1.0;
    float _257 = -_251;
    float _259 = _257 + 1.0;
    float _261 = _255 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _263 = precise::min(_226, _259);
    float _265 = trunc(_261);
    float _267 = precise::max(_265, 0.0);
    uint _269 = uint(_267);
    float _271 = _263 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _273 = trunc(_271);
    float _275 = precise::max(_273, 0.0);
    uint _277 = uint(_275);
    uint _279 = max(_247, _277);
    uint _281 = max(_269, _279);
    uint _283 = min(_281, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_283), 0.0, 0.0, 0.0), uint2(int2(_66, _74)));
}

