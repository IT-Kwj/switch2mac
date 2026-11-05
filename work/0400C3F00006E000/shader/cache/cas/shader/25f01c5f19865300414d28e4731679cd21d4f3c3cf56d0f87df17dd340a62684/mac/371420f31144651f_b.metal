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
    float _77 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _79 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _81 = 1.0 / _77;
    float _83 = float(uint(_61));
    float _85 = float(uint(_69));
    float _87 = _83 + 0.5;
    float _89 = 1.0 / _79;
    float _91 = _85 + 0.5;
    float _93 = _87 * _81;
    float _95 = _91 * _89;
    float2 _377 = float2(_93, _95);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377)), level(0.0)).x;
    float _99 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _101 = -_97;
    float _103 = fma(_101, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _105 = 1.0 / _103;
    float _107 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _109 = _105 * _107;
    float _111 = _109 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _113 = -_111;
    float _115 = fma(_113, _99, 1.0);
    float _117 = log2(_115);
    float2 _421 = float2(_93, _95);
    float _119 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_421, float2(0.0), isnan(_421)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_421, float2(0.0), isnan(_421)), level(0.0)).w;
    float _121 = _117 * 0.693147182464599609375;
    float _123 = _121 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _438 = float3(_93, _95, _123);
    float _125 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_438, float3(0.0), isnan(_438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_438, float3(0.0), isnan(_438)), level(0.0)).w;
    float _127 = -_95;
    float _129 = _127 + 1.0;
    float _131 = _129 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _133 = _93 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _135 = fma(_131, 2.0, -1.0);
    float _137 = fma(_133, 2.0, -1.0);
    float _139 = _135 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _141 = _137 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _143 = _109 * _139;
    float _145 = _109 * _141;
    float _147 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _149 = _143 * _147;
    float _151 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _153 = _143 * _151;
    float _155 = -_145;
    float _157 = fma(_155, (*spvDescriptorSet0.cp_c3)._m0[1].x, _149);
    float _159 = -_145;
    float _161 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[0].x, _153);
    float _163 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _165 = _143 * _163;
    float _167 = fma(_109, (*spvDescriptorSet0.cp_c3)._m0[1].z, _157);
    float _169 = fma(_109, (*spvDescriptorSet0.cp_c3)._m0[0].z, _161);
    float _171 = -_145;
    float _173 = fma(_171, (*spvDescriptorSet0.cp_c3)._m0[2].x, _165);
    float _175 = _167 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _177 = _169 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _179 = fma(_109, (*spvDescriptorSet0.cp_c3)._m0[2].z, _173);
    float _181 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _183 = _175 + _181;
    float _185 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _187 = _177 + _185;
    float _189 = _179 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _191 = _183 * _183;
    float _193 = fma(_187, _187, _191);
    float _195 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _197 = _189 + _195;
    float _199 = abs(_177);
    float _201 = abs(_189);
    float _203 = precise::max(_199, _201);
    float _205 = fma(_197, _197, _193);
    float _207 = fma(_203, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = sqrt(_205);
    float _213 = -_209;
    float _215 = _213 + 1.0;
    float _217 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _219 = fma(_211, (*spvDescriptorSet0.cp_c3)._m0[8].y, _217);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _225 = _211 + _223;
    float _227 = -_221;
    float _229 = _227 + 1.0;
    float _231 = abs(_229);
    float _233 = log2(_231);
    float _235 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _237 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _235;
    float _239 = 1.0 / _237;
    float _241 = _233 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _243 = exp2(_241);
    float _245 = _225 * _239;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = precise::min(_215, _247);
    float _251 = _249 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _253 = -_243;
    float _255 = _253 + 1.0;
    float _257 = trunc(_251);
    float _259 = precise::max(_257, 0.0);
    uint _262 = uint(_259);
    float _264 = -_255;
    float _266 = fma(_264, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _268 = _119 * _125;
    float _270 = _266 * _268;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = precise::min(_215, _276);
    float _280 = _278 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _282 = trunc(_280);
    float _284 = precise::max(_282, 0.0);
    uint _286 = uint(_284);
    uint _288 = max(_262, _286);
    uint _290 = min(_288, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_290), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

