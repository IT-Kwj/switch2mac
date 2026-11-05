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
    float _79 = float(uint(_67));
    float _81 = 1.0 / _75;
    float _83 = float(uint(_59));
    float _85 = _79 + 0.5;
    float _87 = _83 + 0.5;
    float _89 = 1.0 / _77;
    float _91 = _85 * _81;
    float _93 = _87 * _89;
    float2 _405 = float2(_93, _91);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_405, float2(0.0), isnan(_405)), level(0.0)).x;
    float3 _418 = float3(_93, _91, float(0));
    float3 _422 = select(_418, float3(0.0), isnan(_418));
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _422.xy, uint(rint(_422.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _422.xy, uint(rint(_422.z)), level(0.0)).y;
    float _99 = -_91;
    float _101 = _99 + 1.0;
    float _103 = _101 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _105 = _93 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _107 = fma(_103, 2.0, -1.0);
    float _109 = fma(_105, 2.0, -1.0);
    float _111 = _107 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _113 = _109 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _115 = fma(_91, 2.0, -1.0);
    float _117 = fma(_93, 2.0, -1.0);
    float _119 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _121 = _115 + _119;
    float _123 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _125 = _117 + _123;
    float _127 = -_95;
    float _129 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _131 = -_97;
    float _133 = _131 + 1.0;
    float _135 = 1.0 / _129;
    float _137 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _139 = _135 * _137;
    float _141 = _139 * _111;
    float _143 = _139 * _113;
    float _145 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _147 = _141 * _145;
    float _149 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _151 = _141 * _149;
    float _153 = -_143;
    float _155 = fma(_153, (*spvDescriptorSet0.cp_c3)._m0[1].x, _147);
    float _157 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _159 = _141 * _157;
    float _161 = -_143;
    float _163 = fma(_161, (*spvDescriptorSet0.cp_c3)._m0[0].x, _151);
    float _165 = fma(_139, (*spvDescriptorSet0.cp_c3)._m0[1].z, _155);
    float _167 = -_143;
    float _169 = fma(_167, (*spvDescriptorSet0.cp_c3)._m0[2].x, _159);
    float _171 = fma(_139, (*spvDescriptorSet0.cp_c3)._m0[0].z, _163);
    float _173 = _165 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _175 = fma(_139, (*spvDescriptorSet0.cp_c3)._m0[2].z, _169);
    float _177 = _171 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _179 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _181 = _173 + _179;
    float _183 = _175 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _185 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _187 = _177 + _185;
    float _189 = _181 * _181;
    float _191 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _193 = _183 + _191;
    float _195 = _121 * _121;
    float _197 = abs(_177);
    float _199 = abs(_183);
    float _201 = precise::max(_197, _199);
    float _203 = fma(_187, _187, _189);
    float _205 = fma(_125, _125, _195);
    float _207 = fma(_193, _193, _203);
    float _209 = fma(_201, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = sqrt(_205);
    float _215 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _217 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _215;
    float _219 = -_211;
    float _221 = _219 + 1.0;
    float _223 = sqrt(_207);
    float _225 = 1.0 / _217;
    float _227 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _229 = fma(_223, (*spvDescriptorSet0.cp_c3)._m0[8].y, _227);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _235 = _223 + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    float _241 = _235 * _225;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = abs(_239);
    float _247 = log2(_245);
    float _249 = precise::min(_221, _243);
    float _251 = _249 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _253 = trunc(_251);
    float _255 = precise::max(_253, 0.0);
    uint _258 = uint(_255);
    float _260 = _247 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _262 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _264 = _213 + _262;
    float _266 = _264 * 4.0;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = exp2(_260);
    float _272 = _268 * 16.0;
    float _274 = -_270;
    float _276 = _274 + 1.0;
    float _278 = trunc(_272);
    float _280 = precise::max(_278, 0.0);
    uint _282 = uint(_280);
    float _284 = -_276;
    float _286 = fma(_284, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _133 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _292 = -_288;
    float _294 = _292 + 1.0;
    float _296 = trunc(_290);
    float _298 = precise::max(_296, 0.0);
    uint _300 = uint(_298);
    float _302 = precise::min(_221, _294);
    float _304 = _302 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _306 = trunc(_304);
    float _308 = precise::max(_306, 0.0);
    uint _310 = uint(_308);
    uint _312 = max(_300, _282);
    uint _314 = max(_258, _310);
    uint _316 = max(_314, _312);
    uint _318 = min(_316, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_318), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

