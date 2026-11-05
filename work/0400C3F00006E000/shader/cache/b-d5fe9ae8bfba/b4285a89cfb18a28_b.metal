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
    float2 _364 = float2(_88, _90);
    float _92 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364)), level(0.0)).x;
    float2 _375 = float2(_88, _90);
    float _94 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_375, float2(0.0), isnan(_375)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_375, float2(0.0), isnan(_375)), level(0.0)).w;
    float _96 = -_90;
    float _98 = _96 + 1.0;
    float _100 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _102 = _88 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _104 = fma(_88, 2.0, -1.0);
    float _106 = fma(_100, 2.0, -1.0);
    float _108 = fma(_102, 2.0, -1.0);
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _112 = _104 + _110;
    float _114 = _106 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _116 = _108 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _118 = -_92;
    float _120 = fma(_118, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _122 = 1.0 / _120;
    float _124 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _126 = _122 * _124;
    float _128 = _126 * _114;
    float _130 = _126 * _116;
    float _132 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _134 = _128 * _132;
    float _136 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _138 = _128 * _136;
    float _140 = 0.0 + _94;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = -_130;
    float _146 = fma(_144, (*spvDescriptorSet0.cp_c3)._m0[1].x, _134);
    float _148 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _150 = _128 * _148;
    float _152 = fma(_90, 2.0, -1.0);
    float _154 = -_130;
    float _156 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[0].x, _138);
    float _158 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[1].z, _146);
    float _160 = -_130;
    float _162 = fma(_160, (*spvDescriptorSet0.cp_c3)._m0[2].x, _150);
    float _164 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _166 = _152 + _164;
    float _168 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[0].z, _156);
    float _170 = _158 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _172 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[2].z, _162);
    float _174 = _166 * _166;
    float _176 = _168 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _178 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _180 = _170 + _178;
    float _182 = _172 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _184 = fma(_112, _112, _174);
    float _186 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _188 = _176 + _186;
    float _190 = _180 * _180;
    float _192 = -_142;
    float _194 = _192 + 1.0;
    float _196 = fma(_188, _188, _190);
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _200 = _182 + _198;
    float _202 = abs(_176);
    float _204 = abs(_182);
    float _206 = precise::max(_202, _204);
    float _208 = sqrt(_184);
    float _210 = fma(_200, _200, _196);
    float _212 = fma(_206, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _218 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _216;
    float _220 = sqrt(_210);
    float _222 = -_214;
    float _224 = _222 + 1.0;
    float _226 = precise::min(_224, _194);
    float _228 = 1.0 / _218;
    float _230 = _226 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _232 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _234 = _220 + _232;
    float _236 = _234 * _228;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _242 = _208 + _240;
    float _244 = precise::min(_224, _238);
    float _246 = _242 * 4.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = trunc(_230);
    float _252 = precise::max(_250, 0.0);
    uint _255 = uint(_252);
    float _257 = _244 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _259 = _248 * 16.0;
    float _261 = trunc(_257);
    float _263 = precise::max(_261, 0.0);
    uint _265 = uint(_263);
    float _267 = trunc(_259);
    float _269 = precise::max(_267, 0.0);
    uint _271 = uint(_269);
    uint _273 = max(_265, _255);
    uint _275 = max(_271, _273);
    uint _277 = min(_275, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_277), 0.0, 0.0, 0.0), uint2(int2(_56, _64)));
}

