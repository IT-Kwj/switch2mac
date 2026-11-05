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
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_LocalInvocationID.x);
    float _54 = as_type<float>(gl_WorkGroupID.y);
    float _56 = as_type<float>(gl_LocalInvocationID.y);
    int _59 = as_type<int>(_50) << 3;
    int _61 = _59 + as_type<int>(_52);
    bool _65 = uint(_61) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _67 = as_type<int>(_54) << 3;
    int _69 = _67 + as_type<int>(_56);
    bool _71 = uint(_69) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _73 = !_65;
    bool _75 = _71 && _73;
    if (!_75)
    {
        return;
    }
    float _77 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _79 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _81 = 1.0 / _77;
    float _83 = float(uint(_69));
    float _85 = float(uint(_61));
    float _87 = _83 + 0.5;
    float _89 = 1.0 / _79;
    float _91 = _85 + 0.5;
    float _93 = _87 * _81;
    float _95 = _91 * _89;
    float2 _349 = float2(_95, _93);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349)), level(0.0)).x;
    float2 _360 = float2(_95, _93);
    float _99 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_360, float2(0.0), isnan(_360)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_360, float2(0.0), isnan(_360)), level(0.0)).w;
    float3 _370 = float3(_95, _93, float(0));
    float3 _374 = select(_370, float3(0.0), isnan(_370));
    float _101 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _374.xy, uint(rint(_374.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _374.xy, uint(rint(_374.z)), level(0.0)).y;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    float _107 = _95 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _109 = _105 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _111 = fma(_107, 2.0, -1.0);
    float _113 = fma(_109, 2.0, -1.0);
    float _115 = _111 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _117 = _113 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _119 = -_97;
    float _121 = fma(_119, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _123 = 1.0 / _121;
    float _125 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _127 = _123 * _125;
    float _129 = _127 * _117;
    float _131 = _127 * _115;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _135 = _129 * _133;
    float _137 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _139 = _129 * _137;
    float _141 = -_131;
    float _143 = fma(_141, (*spvDescriptorSet0.cp_c3)._m0[1].x, _135);
    float _145 = -_131;
    float _147 = fma(_145, (*spvDescriptorSet0.cp_c3)._m0[0].x, _139);
    float _149 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _151 = _129 * _149;
    float _153 = 0.0 + _99;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[1].z, _143);
    float _159 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[0].z, _147);
    float _161 = -_131;
    float _163 = fma(_161, (*spvDescriptorSet0.cp_c3)._m0[2].x, _151);
    float _165 = -_155;
    float _167 = _165 + 1.0;
    float _169 = _157 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _171 = _159 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _173 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[2].z, _163);
    float _175 = -_101;
    float _177 = _175 + 1.0;
    float _179 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _181 = _169 + _179;
    float _183 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _185 = _171 + _183;
    float _187 = _173 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _189 = _177 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _191 = _181 * _181;
    float _193 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _195 = _187 + _193;
    float _197 = abs(_171);
    float _199 = abs(_187);
    float _201 = precise::max(_197, _199);
    float _203 = fma(_185, _185, _191);
    float _205 = trunc(_189);
    float _207 = precise::max(_205, 0.0);
    uint _210 = uint(_207);
    float _212 = fma(_195, _195, _203);
    float _214 = fma(_201, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _220 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _218;
    float _222 = sqrt(_212);
    float _224 = -_216;
    float _226 = _224 + 1.0;
    float _228 = precise::min(_226, _167);
    float _230 = 1.0 / _220;
    float _232 = _228 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _234 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _236 = _222 + _234;
    float _238 = _236 * _230;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = precise::min(_226, _240);
    float _244 = trunc(_232);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    float _250 = _242 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _252 = trunc(_250);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    uint _258 = max(_256, _248);
    uint _260 = max(_210, _258);
    uint _262 = min(_260, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_262), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

