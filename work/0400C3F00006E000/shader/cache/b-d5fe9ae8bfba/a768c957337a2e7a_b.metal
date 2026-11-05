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
    float2 _340 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_340, float2(0.0), isnan(_340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_340, float2(0.0), isnan(_340)), level(0.0)).x;
    float _92 = -_88;
    float _94 = _92 + 1.0;
    float _96 = _86 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _98 = _94 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _100 = fma(_86, 2.0, -1.0);
    float _102 = fma(_88, 2.0, -1.0);
    float _104 = fma(_96, 2.0, -1.0);
    float _106 = fma(_98, 2.0, -1.0);
    float _108 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _110 = _100 + _108;
    float _112 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _114 = _102 + _112;
    float _116 = _104 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _118 = _106 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _120 = _114 * _114;
    float _122 = fma(_110, _110, _120);
    float _124 = sqrt(_122);
    float _126 = -_90;
    float _128 = fma(_126, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _130 = 1.0 / _128;
    float _132 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _134 = _130 * _132;
    float _136 = _134 * _118;
    float _138 = _134 * _116;
    float _140 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _142 = _136 * _140;
    float _144 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _146 = _136 * _144;
    float _148 = -_138;
    float _150 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[1].x, _142);
    float _152 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _154 = _136 * _152;
    float _156 = -_138;
    float _158 = fma(_156, (*spvDescriptorSet0.cp_c3)._m0[0].x, _146);
    float _160 = fma(_134, (*spvDescriptorSet0.cp_c3)._m0[1].z, _150);
    float _162 = -_138;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[2].x, _154);
    float _166 = fma(_134, (*spvDescriptorSet0.cp_c3)._m0[0].z, _158);
    float _168 = _160 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _170 = fma(_134, (*spvDescriptorSet0.cp_c3)._m0[2].z, _164);
    float _172 = _166 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _174 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _176 = _168 + _174;
    float _178 = _170 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _180 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _182 = _172 + _180;
    float _184 = _176 * _176;
    float _186 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _188 = _178 + _186;
    float _190 = abs(_172);
    float _192 = abs(_178);
    float _194 = precise::max(_190, _192);
    float _196 = fma(_182, _182, _184);
    float _198 = fma(_188, _188, _196);
    float _200 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _202 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _200;
    float _204 = fma(_194, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _210 = _124 + _208;
    float _212 = 1.0 / _202;
    float _214 = -_206;
    float _216 = _214 + 1.0;
    float _218 = _210 * 4.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = _220 * 16.0;
    float _224 = sqrt(_198);
    float _226 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _228 = _224 + _226;
    float _230 = _228 * _212;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = precise::min(_216, _232);
    float _236 = trunc(_222);
    float _238 = precise::max(_236, 0.0);
    uint _241 = uint(_238);
    float _243 = _234 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _245 = trunc(_243);
    float _247 = precise::max(_245, 0.0);
    uint _249 = uint(_247);
    uint _251 = max(_249, _241);
    uint _253 = min(_251, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_253), 0.0, 0.0, 0.0), uint2(int2(_54, _62)));
}

