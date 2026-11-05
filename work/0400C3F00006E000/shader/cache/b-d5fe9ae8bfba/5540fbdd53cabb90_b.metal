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
    texture2d_array<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    sampler cp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _48 = as_type<float>(gl_WorkGroupID.x);
    float _50 = as_type<float>(gl_LocalInvocationID.x);
    float _52 = as_type<float>(gl_WorkGroupID.y);
    float _54 = as_type<float>(gl_LocalInvocationID.y);
    int _57 = as_type<int>(_48) << 3;
    int _59 = _57 + as_type<int>(_50);
    bool _63 = uint(_59) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _65 = as_type<int>(_52) << 3;
    int _67 = _65 + as_type<int>(_54);
    bool _69 = uint(_67) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _71 = !_63;
    bool _73 = _69 && _71;
    if (!_73)
    {
        return;
    }
    float _75 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _77 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _79 = 1.0 / _75;
    float _81 = float(uint(_67));
    float _83 = float(uint(_59));
    float _85 = _81 + 0.5;
    float _87 = 1.0 / _77;
    float _89 = _83 + 0.5;
    float _91 = _85 * _79;
    float _93 = _89 * _87;
    float2 _361 = float2(_93, _91);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361)), level(0.0)).x;
    float3 _374 = float3(_93, _91, float(0));
    float3 _378 = select(_374, float3(0.0), isnan(_374));
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _378.xy, uint(rint(_378.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _378.xy, uint(rint(_378.z)), level(0.0)).y;
    float _99 = -_91;
    float _101 = _99 + 1.0;
    float _103 = _93 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _105 = _101 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _107 = fma(_93, 2.0, -1.0);
    float _109 = fma(_103, 2.0, -1.0);
    float _111 = fma(_105, 2.0, -1.0);
    float _113 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _115 = _107 + _113;
    float _117 = _109 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _119 = -_95;
    float _121 = fma(_119, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _123 = fma(_91, 2.0, -1.0);
    float _125 = 1.0 / _121;
    float _127 = _111 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _129 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _131 = _123 + _129;
    float _133 = -_97;
    float _135 = _133 + 1.0;
    float _137 = _135 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _139 = trunc(_137);
    float _141 = precise::max(_139, 0.0);
    uint _144 = uint(_141);
    float _146 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _148 = _125 * _146;
    float _150 = _131 * _131;
    float _152 = _148 * _127;
    float _154 = _148 * _117;
    float _156 = fma(_115, _115, _150);
    float _158 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _160 = _152 * _158;
    float _162 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _164 = _152 * _162;
    float _166 = -_154;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c3)._m0[1].x, _160);
    float _170 = -_154;
    float _172 = fma(_170, (*spvDescriptorSet0.cp_c3)._m0[0].x, _164);
    float _174 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _176 = _152 * _174;
    float _178 = sqrt(_156);
    float _180 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[1].z, _168);
    float _182 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[0].z, _172);
    float _184 = -_154;
    float _186 = fma(_184, (*spvDescriptorSet0.cp_c3)._m0[2].x, _176);
    float _188 = _180 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _190 = _182 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _192 = fma(_148, (*spvDescriptorSet0.cp_c3)._m0[2].z, _186);
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _196 = _188 + _194;
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _200 = _190 + _198;
    float _202 = _192 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _204 = _196 * _196;
    float _206 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _208 = _202 + _206;
    float _210 = abs(_190);
    float _212 = abs(_202);
    float _214 = precise::max(_210, _212);
    float _216 = fma(_200, _200, _204);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _220 = _178 + _218;
    float _222 = fma(_208, _208, _216);
    float _224 = fma(_214, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = _220 * 4.0;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _234 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _232;
    float _236 = sqrt(_222);
    float _238 = -_226;
    float _240 = _238 + 1.0;
    float _242 = _230 * 16.0;
    float _244 = 1.0 / _234;
    float _246 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _248 = _236 + _246;
    float _250 = trunc(_242);
    float _252 = precise::max(_250, 0.0);
    uint _254 = uint(_252);
    float _256 = _248 * _244;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = precise::min(_240, _258);
    uint _262 = max(_144, _254);
    float _264 = _260 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _266 = trunc(_264);
    float _268 = precise::max(_266, 0.0);
    uint _270 = uint(_268);
    uint _272 = max(_270, _262);
    uint _274 = min(_272, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_274), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

