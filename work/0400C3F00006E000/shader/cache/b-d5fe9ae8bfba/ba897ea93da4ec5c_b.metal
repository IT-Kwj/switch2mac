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
    float2 _398 = float2(_98, _100);
    float _102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398)), level(0.0)).x;
    float2 _409 = float2(_98, _100);
    float _104 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_409, float2(0.0), isnan(_409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_409, float2(0.0), isnan(_409)), level(0.0)).w;
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
    float3 _459 = float3(_98, _100, _128);
    float _130 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_459, float3(0.0), isnan(_459)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_459, float3(0.0), isnan(_459)), level(0.0)).w;
    float3 _470 = float3(_98, _100, float(0));
    float3 _472 = select(_470, float3(0.0), isnan(_470));
    float _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, _472.xy, uint(rint(_472.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, _472.xy, uint(rint(_472.z)), level(0.0)).y;
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
    float _162 = -_152;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[1].x, _156);
    float _166 = -_152;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c3)._m0[0].x, _160);
    float _170 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _172 = _150 * _170;
    float _174 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[1].z, _164);
    float _176 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[0].z, _168);
    float _178 = -_152;
    float _180 = fma(_178, (*spvDescriptorSet0.cp_c3)._m0[2].x, _172);
    float _182 = _174 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _184 = _176 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _186 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[2].z, _180);
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _190 = _182 + _188;
    float _192 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _194 = _184 + _192;
    float _196 = _186 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _198 = _190 * _190;
    float _200 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _202 = _196 + _200;
    float _204 = abs(_184);
    float _206 = abs(_196);
    float _208 = precise::max(_204, _206);
    float _210 = fma(_194, _194, _198);
    float _212 = fma(_202, _202, _210);
    float _214 = fma(_208, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = sqrt(_212);
    float _220 = -_216;
    float _222 = _220 + 1.0;
    float _224 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _226 = fma(_218, (*spvDescriptorSet0.cp_c3)._m0[8].y, _224);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _232 = _218 + _230;
    float _234 = -_228;
    float _236 = _234 + 1.0;
    float _238 = abs(_236);
    float _240 = log2(_238);
    float _242 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _244 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _242;
    float _246 = 1.0 / _244;
    float _248 = _240 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _250 = exp2(_248);
    float _252 = _232 * _246;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = precise::min(_222, _254);
    float _258 = _256 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _260 = -_250;
    float _262 = _260 + 1.0;
    float _264 = trunc(_258);
    float _266 = precise::max(_264, 0.0);
    uint _269 = uint(_266);
    float _271 = -_262;
    float _273 = fma(_271, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _275 = _104 * _130;
    float _277 = -_132;
    float _279 = _277 + 1.0;
    float _281 = _273 * _275;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _279 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _287 = -_283;
    float _289 = _287 + 1.0;
    float _291 = trunc(_285);
    float _293 = precise::max(_291, 0.0);
    uint _295 = uint(_293);
    float _297 = precise::min(_222, _289);
    float _299 = _297 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _301 = trunc(_299);
    float _303 = precise::max(_301, 0.0);
    uint _305 = uint(_303);
    uint _307 = max(_269, _305);
    uint _309 = max(_295, _307);
    uint _311 = min(_309, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_311), 0.0, 0.0, 0.0), uint2(int2(_66, _74)));
}

