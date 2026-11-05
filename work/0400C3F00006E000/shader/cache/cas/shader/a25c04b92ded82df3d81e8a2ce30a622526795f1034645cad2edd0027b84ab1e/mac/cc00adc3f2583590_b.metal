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
    float2 _369 = float2(_93, _91);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369)), level(0.0)).x;
    float3 _382 = float3(_93, _91, float(0));
    float3 _386 = select(_382, float3(0.0), isnan(_382));
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _386.xy, uint(rint(_386.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _386.xy, uint(rint(_386.z)), level(0.0)).y;
    float _99 = -_91;
    float _101 = _99 + 1.0;
    float _103 = _101 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _105 = _93 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _107 = fma(_103, 2.0, -1.0);
    float _109 = fma(_105, 2.0, -1.0);
    float _111 = _107 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _113 = _109 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _115 = -_95;
    float _117 = fma(_115, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _119 = -_97;
    float _121 = _119 + 1.0;
    float _123 = _121 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _125 = 1.0 / _117;
    float _127 = trunc(_123);
    float _129 = precise::max(_127, 0.0);
    uint _132 = uint(_129);
    float _134 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _136 = _125 * _134;
    float _138 = _136 * _111;
    float _140 = _136 * _113;
    float _142 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _144 = _138 * _142;
    float _146 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _148 = _138 * _146;
    float _150 = -_140;
    float _152 = fma(_150, (*spvDescriptorSet0.cp_c3)._m0[1].x, _144);
    float _154 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _156 = _138 * _154;
    float _158 = -_140;
    float _160 = fma(_158, (*spvDescriptorSet0.cp_c3)._m0[0].x, _148);
    float _162 = fma(_136, (*spvDescriptorSet0.cp_c3)._m0[1].z, _152);
    float _164 = -_140;
    float _166 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[2].x, _156);
    float _168 = fma(_136, (*spvDescriptorSet0.cp_c3)._m0[0].z, _160);
    float _170 = _162 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _172 = fma(_136, (*spvDescriptorSet0.cp_c3)._m0[2].z, _166);
    float _174 = _168 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _176 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _178 = _170 + _176;
    float _180 = _172 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _182 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _184 = _174 + _182;
    float _186 = _178 * _178;
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _190 = _180 + _188;
    float _192 = abs(_174);
    float _194 = abs(_180);
    float _196 = precise::max(_192, _194);
    float _198 = fma(_184, _184, _186);
    float _200 = fma(_190, _190, _198);
    float _202 = fma(_196, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = sqrt(_200);
    float _208 = -_204;
    float _210 = _208 + 1.0;
    float _212 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _214 = fma(_206, (*spvDescriptorSet0.cp_c3)._m0[8].y, _212);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _220 = _206 + _218;
    float _222 = -_216;
    float _224 = _222 + 1.0;
    float _226 = abs(_224);
    float _228 = log2(_226);
    float _230 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _232 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _230;
    float _234 = 1.0 / _232;
    float _236 = _228 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _238 = exp2(_236);
    float _240 = _220 * _234;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = precise::min(_210, _242);
    float _246 = _244 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _248 = -_238;
    float _250 = _248 + 1.0;
    float _252 = trunc(_246);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    float _258 = -_250;
    float _260 = fma(_258, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = -_262;
    float _266 = _264 + 1.0;
    float _268 = precise::min(_210, _266);
    float _270 = _268 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _272 = trunc(_270);
    float _274 = precise::max(_272, 0.0);
    uint _276 = uint(_274);
    uint _278 = max(_256, _276);
    uint _280 = max(_132, _278);
    uint _282 = min(_280, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_282), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

