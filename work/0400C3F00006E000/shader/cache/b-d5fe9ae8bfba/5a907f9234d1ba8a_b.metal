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
    float2 _406 = float2(_98, _100);
    float _102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406)), level(0.0)).x;
    float2 _417 = float2(_98, _100);
    float _104 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417)), level(0.0)).w;
    float _106 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _108 = -_102;
    float _110 = fma(_108, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _112 = 1.0 / _110;
    float _114 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _116 = _112 * _114;
    float _118 = _116 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _120 = -_118;
    float _122 = fma(_120, _106, 1.0);
    float _124 = log2(_122);
    float _126 = _124 * 0.693147182464599609375;
    float _128 = _126 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _467 = float3(_98, _100, _128);
    float _130 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_467, float3(0.0), isnan(_467)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_467, float3(0.0), isnan(_467)), level(0.0)).w;
    float3 _478 = float3(_98, _100, float(0));
    float3 _480 = select(_478, float3(0.0), isnan(_478));
    float _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _480.xy, uint(rint(_480.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _480.xy, uint(rint(_480.z)), level(0.0)).y;
    float _134 = -_100;
    float _136 = _134 + 1.0;
    float _138 = _136 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _140 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _142 = fma(_138, 2.0, -1.0);
    float _144 = fma(_140, 2.0, -1.0);
    float _146 = _142 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _148 = _144 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _150 = _116 * _146;
    float _152 = _116 * _148;
    float _154 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _156 = _150 * _154;
    float _158 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _160 = _150 * _158;
    float _162 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _164 = _150 * _162;
    float _166 = -_152;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c3)._m0[1].x, _156);
    float _170 = -_152;
    float _172 = fma(_170, (*spvDescriptorSet0.cp_c3)._m0[0].x, _160);
    float _174 = fma(_100, 2.0, -1.0);
    float _176 = -_152;
    float _178 = fma(_176, (*spvDescriptorSet0.cp_c3)._m0[2].x, _164);
    float _180 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[1].z, _168);
    float _182 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[0].z, _172);
    float _184 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _186 = _174 + _184;
    float _188 = fma(_98, 2.0, -1.0);
    float _190 = _180 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _192 = _182 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _194 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[2].z, _178);
    float _196 = _186 * _186;
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _200 = _190 + _198;
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _204 = _188 + _202;
    float _206 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _208 = _192 + _206;
    float _210 = _194 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _212 = _200 * _200;
    float _214 = fma(_204, _204, _196);
    float _216 = fma(_208, _208, _212);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _220 = _210 + _218;
    float _222 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _224 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _222;
    float _226 = abs(_192);
    float _228 = abs(_210);
    float _230 = precise::max(_226, _228);
    float _232 = sqrt(_214);
    float _234 = fma(_220, _220, _216);
    float _236 = fma(_230, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = sqrt(_234);
    float _242 = -_238;
    float _244 = _242 + 1.0;
    float _246 = 1.0 / _224;
    float _248 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _250 = _232 + _248;
    float _252 = _250 * 4.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _258 = _240 + _256;
    float _260 = _254 * 16.0;
    float _262 = trunc(_260);
    float _264 = precise::max(_262, 0.0);
    uint _267 = uint(_264);
    float _269 = _258 * _246;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = precise::min(_244, _271);
    float _275 = _273 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _277 = trunc(_275);
    float _279 = precise::max(_277, 0.0);
    uint _281 = uint(_279);
    float _283 = _104 * _130;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = -_132;
    float _289 = _287 + 1.0;
    float _291 = -_285;
    float _293 = _291 + 1.0;
    float _295 = _289 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _297 = precise::min(_244, _293);
    float _299 = trunc(_295);
    float _301 = precise::max(_299, 0.0);
    uint _303 = uint(_301);
    float _305 = _297 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _307 = trunc(_305);
    float _309 = precise::max(_307, 0.0);
    uint _311 = uint(_309);
    uint _313 = max(_303, _267);
    uint _315 = max(_281, _311);
    uint _317 = max(_315, _313);
    uint _319 = min(_317, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_319), 0.0, 0.0, 0.0), uint2(int2(_66, _74)));
}

