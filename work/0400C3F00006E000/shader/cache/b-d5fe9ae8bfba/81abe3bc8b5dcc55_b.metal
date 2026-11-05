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
    float2 _354 = float2(_88, _90);
    float _92 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_354, float2(0.0), isnan(_354)), level(0.0)).x;
    float2 _365 = float2(_88, _90);
    float _94 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_365, float2(0.0), isnan(_365)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_365, float2(0.0), isnan(_365)), level(0.0)).w;
    float _96 = -_90;
    float _98 = _96 + 1.0;
    float _100 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _102 = _88 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _104 = fma(_100, 2.0, -1.0);
    float _106 = fma(_102, 2.0, -1.0);
    float _108 = _104 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _110 = _106 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _112 = -_92;
    float _114 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _116 = 1.0 / _114;
    float _118 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _120 = _116 * _118;
    float _122 = _120 * _108;
    float _124 = _120 * _110;
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _128 = _122 * _126;
    float _130 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _132 = _122 * _130;
    float _134 = -_124;
    float _136 = fma(_134, (*spvDescriptorSet0.cp_c3)._m0[1].x, _128);
    float _138 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _140 = _122 * _138;
    float _142 = -_124;
    float _144 = fma(_142, (*spvDescriptorSet0.cp_c3)._m0[0].x, _132);
    float _146 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[1].z, _136);
    float _148 = -_124;
    float _150 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[2].x, _140);
    float _152 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[0].z, _144);
    float _154 = _146 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _156 = fma(_120, (*spvDescriptorSet0.cp_c3)._m0[2].z, _150);
    float _158 = _152 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _160 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _162 = _154 + _160;
    float _164 = _156 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _166 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _168 = _158 + _166;
    float _170 = _162 * _162;
    float _172 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _174 = _164 + _172;
    float _176 = abs(_158);
    float _178 = abs(_164);
    float _180 = precise::max(_176, _178);
    float _182 = fma(_168, _168, _170);
    float _184 = fma(_174, _174, _182);
    float _186 = fma(_180, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = sqrt(_184);
    float _192 = -_188;
    float _194 = _192 + 1.0;
    float _196 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _198 = fma(_190, (*spvDescriptorSet0.cp_c3)._m0[8].y, _196);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _204 = _190 + _202;
    float _206 = -_200;
    float _208 = _206 + 1.0;
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _216 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _214;
    float _218 = 1.0 / _216;
    float _220 = _212 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _222 = exp2(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = -_226;
    float _230 = fma(_228, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _232 = _204 * _218;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = _230 * _94;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = precise::min(_194, _234);
    float _242 = -_238;
    float _244 = _242 + 1.0;
    float _246 = _240 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _248 = precise::min(_194, _244);
    float _250 = trunc(_246);
    float _252 = precise::max(_250, 0.0);
    uint _255 = uint(_252);
    float _257 = _248 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _259 = trunc(_257);
    float _261 = precise::max(_259, 0.0);
    uint _263 = uint(_261);
    uint _265 = max(_255, _263);
    uint _267 = min(_265, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_267), 0.0, 0.0, 0.0), uint2(int2(_56, _64)));
}

