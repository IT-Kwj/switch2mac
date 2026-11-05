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
    texture3d<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(8)]];
    sampler cp_t_tcb_8Smplr_w [[id(9)]];
    sampler cp_t_tcb_ASmplr_w [[id(10)]];
    sampler cp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _53 = as_type<float>(gl_WorkGroupID.x);
    float _55 = as_type<float>(gl_LocalInvocationID.x);
    float _57 = as_type<float>(gl_WorkGroupID.y);
    float _59 = as_type<float>(gl_LocalInvocationID.y);
    int _62 = as_type<int>(_53) << 3;
    int _64 = _62 + as_type<int>(_55);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _70 = as_type<int>(_57) << 3;
    int _72 = _70 + as_type<int>(_59);
    bool _74 = uint(_72) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _76 = !_68;
    bool _78 = _74 && _76;
    if (!_78)
    {
        return;
    }
    float _80 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _82 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _84 = 1.0 / _80;
    float _86 = float(uint(_64));
    float _88 = float(uint(_72));
    float _90 = _86 + 0.5;
    float _92 = 1.0 / _82;
    float _94 = _88 + 0.5;
    float _96 = _90 * _84;
    float _98 = _94 * _92;
    float2 _392 = float2(_96, _98);
    float _100 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392)), level(0.0)).x;
    float _102 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _104 = -_100;
    float _106 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _108 = 1.0 / _106;
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _112 = _108 * _110;
    float _114 = _112 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _116 = -_114;
    float _118 = fma(_116, _102, 1.0);
    float _120 = log2(_118);
    float _122 = _120 * 0.693147182464599609375;
    float _124 = _122 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _445 = float3(_96, _98, _124);
    float _126 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_445, float3(0.0), isnan(_445)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_445, float3(0.0), isnan(_445)), level(0.0)).w;
    float3 _456 = float3(_96, _98, float(0));
    float3 _458 = select(_456, float3(0.0), isnan(_456));
    float _128 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _458.xy, uint(rint(_458.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _458.xy, uint(rint(_458.z)), level(0.0)).y;
    float _130 = -_98;
    float _132 = _130 + 1.0;
    float _134 = _132 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _136 = _96 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _138 = fma(_134, 2.0, -1.0);
    float _140 = fma(_136, 2.0, -1.0);
    float _142 = _138 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _144 = _140 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _146 = _112 * _142;
    float _148 = _112 * _144;
    float _150 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _152 = _146 * _150;
    float _154 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _156 = _146 * _154;
    float _158 = -_148;
    float _160 = fma(_158, (*spvDescriptorSet0.cp_c3)._m0[1].x, _152);
    float _162 = -_148;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[0].x, _156);
    float _166 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _168 = _146 * _166;
    float _170 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[1].z, _160);
    float _172 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[0].z, _164);
    float _174 = -_148;
    float _176 = fma(_174, (*spvDescriptorSet0.cp_c3)._m0[2].x, _168);
    float _178 = _170 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _180 = _172 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _182 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[2].z, _176);
    float _184 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _186 = _178 + _184;
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _190 = _180 + _188;
    float _192 = _182 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _194 = _186 * _186;
    float _196 = fma(_190, _190, _194);
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _200 = _192 + _198;
    float _202 = abs(_180);
    float _204 = abs(_192);
    float _206 = precise::max(_202, _204);
    float _208 = fma(_200, _200, _196);
    float _210 = fma(_206, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = sqrt(_208);
    float _216 = -_212;
    float _218 = _216 + 1.0;
    float _220 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _222 = fma(_214, (*spvDescriptorSet0.cp_c3)._m0[8].y, _220);
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _228 = _214 + _226;
    float _230 = -_224;
    float _232 = _230 + 1.0;
    float _234 = abs(_232);
    float _236 = log2(_234);
    float _238 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _240 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _238;
    float _242 = 1.0 / _240;
    float _244 = _236 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _246 = exp2(_244);
    float _248 = _228 * _242;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = precise::min(_218, _250);
    float _254 = _252 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _256 = -_246;
    float _258 = _256 + 1.0;
    float _260 = trunc(_254);
    float _262 = precise::max(_260, 0.0);
    uint _265 = uint(_262);
    float _267 = -_258;
    float _269 = fma(_267, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _271 = _269 * _126;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = -_128;
    float _277 = _275 + 1.0;
    float _279 = -_273;
    float _281 = _279 + 1.0;
    float _283 = _277 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _285 = precise::min(_218, _281);
    float _287 = trunc(_283);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    float _293 = _285 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _295 = trunc(_293);
    float _297 = precise::max(_295, 0.0);
    uint _299 = uint(_297);
    uint _301 = max(_265, _299);
    uint _303 = max(_291, _301);
    uint _305 = min(_303, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_305), 0.0, 0.0, 0.0), uint2(int2(_64, _72)));
}

