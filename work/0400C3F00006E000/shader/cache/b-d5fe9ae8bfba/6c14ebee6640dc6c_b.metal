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
    float2 _349 = float2(_93, _95);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349)), level(0.0)).x;
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
    float2 _393 = float2(_93, _95);
    float _119 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_393, float2(0.0), isnan(_393)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_393, float2(0.0), isnan(_393)), level(0.0)).w;
    float _121 = _117 * 0.693147182464599609375;
    float _123 = _121 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _410 = float3(_93, _95, _123);
    float _125 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_410, float3(0.0), isnan(_410)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_410, float3(0.0), isnan(_410)), level(0.0)).w;
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
    float _211 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _213 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _211;
    float _215 = sqrt(_205);
    float _217 = -_209;
    float _219 = _217 + 1.0;
    float _221 = 1.0 / _213;
    float _223 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _225 = _215 + _223;
    float _227 = _225 * _221;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = precise::min(_219, _229);
    float _233 = _231 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _235 = trunc(_233);
    float _237 = precise::max(_235, 0.0);
    uint _240 = uint(_237);
    float _242 = _119 * _125;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = -_244;
    float _248 = _246 + 1.0;
    float _250 = precise::min(_219, _248);
    float _252 = _250 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _254 = trunc(_252);
    float _256 = precise::max(_254, 0.0);
    uint _258 = uint(_256);
    uint _260 = max(_240, _258);
    uint _262 = min(_260, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_262), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

