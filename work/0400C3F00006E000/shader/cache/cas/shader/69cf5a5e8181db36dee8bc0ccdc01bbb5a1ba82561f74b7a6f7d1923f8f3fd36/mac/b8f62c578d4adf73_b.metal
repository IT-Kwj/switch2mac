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
    float _86 = float(uint(_66));
    float _88 = 1.0 / _82;
    float _90 = float(uint(_74));
    float _92 = _86 + 0.5;
    float _94 = _90 + 0.5;
    float _96 = 1.0 / _84;
    float _98 = _92 * _88;
    float _100 = _94 * _96;
    float2 _434 = float2(_98, _100);
    float _102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434)), level(0.0)).x;
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
    float2 _478 = float2(_98, _100);
    float _124 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_478, float2(0.0), isnan(_478)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_478, float2(0.0), isnan(_478)), level(0.0)).w;
    float _126 = _122 * 0.693147182464599609375;
    float _128 = _126 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _495 = float3(_98, _100, _128);
    float _130 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_495, float3(0.0), isnan(_495)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_495, float3(0.0), isnan(_495)), level(0.0)).w;
    float3 _506 = float3(_98, _100, float(0));
    float3 _508 = select(_506, float3(0.0), isnan(_506));
    float _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _508.xy, uint(rint(_508.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _508.xy, uint(rint(_508.z)), level(0.0)).y;
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
    float _162 = fma(_98, 2.0, -1.0);
    float _164 = -_152;
    float _166 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[1].x, _156);
    float _168 = -_152;
    float _170 = fma(_168, (*spvDescriptorSet0.cp_c3)._m0[0].x, _160);
    float _172 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _174 = _150 * _172;
    float _176 = fma(_100, 2.0, -1.0);
    float _178 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[1].z, _166);
    float _180 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[0].z, _170);
    float _182 = -_152;
    float _184 = fma(_182, (*spvDescriptorSet0.cp_c3)._m0[2].x, _174);
    float _186 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _188 = _176 + _186;
    float _190 = _178 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _192 = _180 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _194 = fma(_114, (*spvDescriptorSet0.cp_c3)._m0[2].z, _184);
    float _196 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _198 = _162 + _196;
    float _200 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _202 = _190 + _200;
    float _204 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _206 = _192 + _204;
    float _208 = _194 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _210 = _188 * _188;
    float _212 = _202 * _202;
    float _214 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _216 = _208 + _214;
    float _218 = fma(_198, _198, _210);
    float _220 = fma(_206, _206, _212);
    float _222 = abs(_192);
    float _224 = abs(_208);
    float _226 = precise::max(_222, _224);
    float _228 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _230 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _228;
    float _232 = fma(_216, _216, _220);
    float _234 = sqrt(_218);
    float _236 = sqrt(_232);
    float _238 = 1.0 / _230;
    float _240 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _242 = _234 + _240;
    float _244 = _242 * 4.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _250 = fma(_236, (*spvDescriptorSet0.cp_c3)._m0[8].y, _248);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _256 = _236 + _254;
    float _258 = _246 * 16.0;
    float _260 = -_252;
    float _262 = _260 + 1.0;
    float _264 = _256 * _238;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = trunc(_258);
    float _270 = precise::max(_268, 0.0);
    uint _273 = uint(_270);
    float _275 = abs(_262);
    float _277 = log2(_275);
    float _279 = _277 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _281 = exp2(_279);
    float _283 = fma(_226, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = -_285;
    float _289 = _287 + 1.0;
    float _291 = precise::min(_289, _266);
    float _293 = _291 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _295 = -_281;
    float _297 = _295 + 1.0;
    float _299 = -_297;
    float _301 = fma(_299, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _303 = trunc(_293);
    float _305 = precise::max(_303, 0.0);
    uint _307 = uint(_305);
    float _309 = _124 * _130;
    float _311 = -_132;
    float _313 = _311 + 1.0;
    float _315 = _301 * _309;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = _313 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _321 = -_317;
    float _323 = _321 + 1.0;
    float _325 = trunc(_319);
    float _327 = precise::max(_325, 0.0);
    uint _329 = uint(_327);
    float _331 = precise::min(_289, _323);
    float _333 = _331 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _335 = trunc(_333);
    float _337 = precise::max(_335, 0.0);
    uint _339 = uint(_337);
    uint _341 = max(_329, _273);
    uint _343 = max(_307, _339);
    uint _345 = max(_343, _341);
    uint _347 = min(_345, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_347), 0.0, 0.0, 0.0), uint2(int2(_66, _74)));
}

