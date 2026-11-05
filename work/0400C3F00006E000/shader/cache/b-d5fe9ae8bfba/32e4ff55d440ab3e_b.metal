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
    float _79 = float(uint(_59));
    float _81 = 1.0 / _75;
    float _83 = float(uint(_67));
    float _85 = _79 + 0.5;
    float _87 = _83 + 0.5;
    float _89 = 1.0 / _77;
    float _91 = _85 * _81;
    float _93 = _87 * _89;
    float2 _407 = float2(_91, _93);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407)), level(0.0)).x;
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
    float3 _460 = float3(_91, _93, _119);
    float _121 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_460, float3(0.0), isnan(_460)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_460, float3(0.0), isnan(_460)), level(0.0)).w;
    float _123 = -_93;
    float _125 = _123 + 1.0;
    float _127 = _91 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _129 = _125 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _131 = fma(_127, 2.0, -1.0);
    float _133 = fma(_129, 2.0, -1.0);
    float _135 = _131 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _137 = _133 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _139 = _107 * _135;
    float _141 = _107 * _137;
    float _143 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _145 = _141 * _143;
    float _147 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _149 = _141 * _147;
    float _151 = -_139;
    float _153 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[1].x, _145);
    float _155 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _157 = _141 * _155;
    float _159 = -_139;
    float _161 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[0].x, _149);
    float _163 = fma(_107, (*spvDescriptorSet0.cp_c3)._m0[1].z, _153);
    float _165 = -_139;
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
    float _193 = fma(_93, 2.0, -1.0);
    float _195 = fma(_91, 2.0, -1.0);
    float _197 = fma(_185, _185, _187);
    float _199 = abs(_175);
    float _201 = abs(_181);
    float _203 = precise::max(_199, _201);
    float _205 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _207 = _193 + _205;
    float _209 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _211 = _195 + _209;
    float _213 = fma(_191, _191, _197);
    float _215 = sqrt(_213);
    float _217 = fma(_203, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = -_219;
    float _223 = _221 + 1.0;
    float _225 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _227 = fma(_215, (*spvDescriptorSet0.cp_c3)._m0[8].y, _225);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _233 = _215 + _231;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    float _239 = abs(_237);
    float _241 = log2(_239);
    float _243 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _245 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _243;
    float _247 = 1.0 / _245;
    float _249 = _241 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _251 = _207 * _207;
    float _253 = fma(_211, _211, _251);
    float _255 = exp2(_249);
    float _257 = _233 * _247;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = precise::min(_223, _259);
    float _263 = sqrt(_253);
    float _265 = _261 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _267 = -_255;
    float _269 = _267 + 1.0;
    float _271 = trunc(_265);
    float _273 = precise::max(_271, 0.0);
    uint _276 = uint(_273);
    float _278 = -_269;
    float _280 = fma(_278, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _282 = _280 * _121;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_284;
    float _288 = _286 + 1.0;
    float _290 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _292 = _263 + _290;
    float _294 = precise::min(_223, _288);
    float _296 = _292 * 4.0;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _294 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _302 = _298 * 16.0;
    float _304 = trunc(_300);
    float _306 = precise::max(_304, 0.0);
    uint _308 = uint(_306);
    float _310 = trunc(_302);
    float _312 = precise::max(_310, 0.0);
    uint _314 = uint(_312);
    uint _316 = max(_276, _308);
    uint _318 = max(_314, _316);
    uint _320 = min(_318, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_320), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

