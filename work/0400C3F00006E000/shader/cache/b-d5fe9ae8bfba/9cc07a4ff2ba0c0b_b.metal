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
    texture3d<float> cp_t_tcb_A [[id(4)]];
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
    float _75 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _77 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _79 = 1.0 / _75;
    float _81 = float(uint(_59));
    float _83 = float(uint(_67));
    float _85 = _81 + 0.5;
    float _87 = 1.0 / _77;
    float _89 = _83 + 0.5;
    float _91 = _85 * _79;
    float _93 = _89 * _87;
    float2 _345 = float2(_91, _93);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345)), level(0.0)).x;
    float _97 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _99 = -_95;
    float _101 = fma(_99, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _103 = 1.0 / _101;
    float _105 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _107 = _103 * _105;
    float _109 = _107 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _111 = -_109;
    float _113 = fma(_111, _97, 1.0);
    float _115 = log2(_113);
    float _117 = _115 * 0.693147182464599609375;
    float _119 = _117 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _398 = float3(_91, _93, _119);
    float _121 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_398, float3(0.0), isnan(_398)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_398, float3(0.0), isnan(_398)), level(0.0)).w;
    float _123 = -_93;
    float _125 = _123 + 1.0;
    float _127 = _125 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _129 = _91 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _131 = fma(_127, 2.0, -1.0);
    float _133 = fma(_129, 2.0, -1.0);
    float _135 = _131 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _137 = _133 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _139 = _107 * _135;
    float _141 = _107 * _137;
    float _143 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _145 = _139 * _143;
    float _147 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _149 = _139 * _147;
    float _151 = -_141;
    float _153 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[1].x, _145);
    float _155 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _157 = _139 * _155;
    float _159 = -_141;
    float _161 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[0].x, _149);
    float _163 = fma(_107, (*spvDescriptorSet0.cp_c3)._m0[1].z, _153);
    float _165 = -_141;
    float _167 = fma(_165, (*spvDescriptorSet0.cp_c3)._m0[2].x, _157);
    float _169 = fma(_107, (*spvDescriptorSet0.cp_c3)._m0[0].z, _161);
    float _171 = _163 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _173 = fma(_107, (*spvDescriptorSet0.cp_c3)._m0[2].z, _167);
    float _175 = _169 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _177 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _179 = _171 + _177;
    float _181 = _173 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _183 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _185 = _175 + _183;
    float _187 = _179 * _179;
    float _189 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _191 = _181 + _189;
    float _193 = abs(_175);
    float _195 = abs(_181);
    float _197 = precise::max(_193, _195);
    float _199 = fma(_185, _185, _187);
    float _201 = fma(_191, _191, _199);
    float _203 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _205 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _203;
    float _207 = fma(_197, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = 1.0 / _205;
    float _213 = -_209;
    float _215 = _213 + 1.0;
    float _217 = sqrt(_201);
    float _219 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _221 = _217 + _219;
    float _223 = _221 * _211;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = precise::min(_215, _225);
    float _229 = _227 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _231 = trunc(_229);
    float _233 = precise::max(_231, 0.0);
    uint _236 = uint(_233);
    float _238 = 0.0 + _121;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::min(_215, _244);
    float _248 = _246 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _250 = trunc(_248);
    float _252 = precise::max(_250, 0.0);
    uint _254 = uint(_252);
    uint _256 = max(_236, _254);
    uint _258 = min(_256, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_258), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

