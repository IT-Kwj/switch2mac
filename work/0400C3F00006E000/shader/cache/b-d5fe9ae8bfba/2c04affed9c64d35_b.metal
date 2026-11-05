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
    texture2d<float, access::write> cp_i_tcb_48_ [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    int _52 = as_type<int>(_43) << 3;
    int _54 = _52 + as_type<int>(_45);
    bool _58 = uint(_54) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _60 = as_type<int>(_47) << 3;
    int _62 = _60 + as_type<int>(_49);
    bool _64 = uint(_62) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _66 = !_58;
    bool _68 = _64 && _66;
    if (!_68)
    {
        return;
    }
    float _70 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _72 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _74 = 1.0 / _70;
    float _76 = float(uint(_54));
    float _78 = float(uint(_62));
    float _80 = _76 + 0.5;
    float _82 = 1.0 / _72;
    float _84 = _78 + 0.5;
    float _86 = _80 * _74;
    float _88 = _84 * _82;
    float2 _348 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348)), level(0.0)).x;
    float _92 = -_88;
    float _94 = _92 + 1.0;
    float _96 = _94 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _98 = _86 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _100 = fma(_96, 2.0, -1.0);
    float _102 = fma(_98, 2.0, -1.0);
    float _104 = _100 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _106 = _102 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _108 = -_90;
    float _110 = fma(_108, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _112 = 1.0 / _110;
    float _114 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _116 = _112 * _114;
    float _118 = _116 * _104;
    float _120 = _116 * _106;
    float _122 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _124 = _118 * _122;
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _128 = _118 * _126;
    float _130 = -_120;
    float _132 = fma(_130, (*spvDescriptorSet0.cp_c3)._m0[1].x, _124);
    float _134 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _136 = _118 * _134;
    float _138 = -_120;
    float _140 = fma(_138, (*spvDescriptorSet0.cp_c3)._m0[0].x, _128);
    float _142 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[1].z, _132);
    float _144 = -_120;
    float _146 = fma(_144, (*spvDescriptorSet0.cp_c3)._m0[2].x, _136);
    float _148 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[0].z, _140);
    float _150 = _142 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _152 = fma(_116, (*spvDescriptorSet0.cp_c3)._m0[2].z, _146);
    float _154 = _148 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _156 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _158 = _150 + _156;
    float _160 = _152 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _162 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _164 = _154 + _162;
    float _166 = _158 * _158;
    float _168 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _170 = _160 + _168;
    float _172 = abs(_154);
    float _174 = abs(_160);
    float _176 = precise::max(_172, _174);
    float _178 = fma(_164, _164, _166);
    float _180 = fma(_170, _170, _178);
    float _182 = fma(_176, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = sqrt(_180);
    float _188 = -_184;
    float _190 = _188 + 1.0;
    float _192 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _194 = fma(_186, (*spvDescriptorSet0.cp_c3)._m0[8].y, _192);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _200 = _186 + _198;
    float _202 = -_196;
    float _204 = _202 + 1.0;
    float _206 = abs(_204);
    float _208 = log2(_206);
    float _210 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _212 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _210;
    float _214 = 1.0 / _212;
    float _216 = _208 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _218 = exp2(_216);
    float _220 = _200 * _214;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = precise::min(_190, _222);
    float _226 = _224 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _228 = -_218;
    float _230 = _228 + 1.0;
    float _232 = trunc(_226);
    float _234 = precise::max(_232, 0.0);
    uint _237 = uint(_234);
    float _239 = -_230;
    float _241 = fma(_239, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = -_243;
    float _247 = _245 + 1.0;
    float _249 = precise::min(_190, _247);
    float _251 = _249 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _253 = trunc(_251);
    float _255 = precise::max(_253, 0.0);
    uint _257 = uint(_255);
    uint _259 = max(_237, _257);
    uint _261 = min(_259, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_261), 0.0, 0.0, 0.0), uint2(int2(_54, _62)));
}

