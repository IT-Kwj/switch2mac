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
    float2 _385 = float2(_95, _93);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385)), level(0.0)).x;
    float2 _396 = float2(_95, _93);
    float _99 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_396, float2(0.0), isnan(_396)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_396, float2(0.0), isnan(_396)), level(0.0)).w;
    float3 _406 = float3(_95, _93, float(0));
    float3 _410 = select(_406, float3(0.0), isnan(_406));
    float _101 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _410.xy, uint(rint(_410.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _410.xy, uint(rint(_410.z)), level(0.0)).y;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    float _107 = _95 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _109 = _105 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _111 = fma(_95, 2.0, -1.0);
    float _113 = fma(_107, 2.0, -1.0);
    float _115 = fma(_109, 2.0, -1.0);
    float _117 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _119 = _111 + _117;
    float _121 = _113 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _123 = -_97;
    float _125 = fma(_123, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _127 = fma(_93, 2.0, -1.0);
    float _129 = 1.0 / _125;
    float _131 = _115 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _135 = _127 + _133;
    float _137 = 0.0 + _99;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = -_101;
    float _143 = _141 + 1.0;
    float _145 = -_139;
    float _147 = _145 + 1.0;
    float _149 = _143 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _151 = trunc(_149);
    float _153 = precise::max(_151, 0.0);
    uint _156 = uint(_153);
    float _158 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _160 = _129 * _158;
    float _162 = _135 * _135;
    float _164 = _160 * _131;
    float _166 = _160 * _121;
    float _168 = fma(_119, _119, _162);
    float _170 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _172 = _164 * _170;
    float _174 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _176 = _164 * _174;
    float _178 = -_166;
    float _180 = fma(_178, (*spvDescriptorSet0.cp_c3)._m0[1].x, _172);
    float _182 = -_166;
    float _184 = fma(_182, (*spvDescriptorSet0.cp_c3)._m0[0].x, _176);
    float _186 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _188 = _164 * _186;
    float _190 = sqrt(_168);
    float _192 = fma(_160, (*spvDescriptorSet0.cp_c3)._m0[1].z, _180);
    float _194 = fma(_160, (*spvDescriptorSet0.cp_c3)._m0[0].z, _184);
    float _196 = -_166;
    float _198 = fma(_196, (*spvDescriptorSet0.cp_c3)._m0[2].x, _188);
    float _200 = _192 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _202 = _194 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _204 = fma(_160, (*spvDescriptorSet0.cp_c3)._m0[2].z, _198);
    float _206 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _208 = _200 + _206;
    float _210 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _212 = _202 + _210;
    float _214 = _204 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _216 = _208 * _208;
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _220 = _214 + _218;
    float _222 = abs(_202);
    float _224 = abs(_214);
    float _226 = precise::max(_222, _224);
    float _228 = fma(_212, _212, _216);
    float _230 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _232 = _190 + _230;
    float _234 = fma(_220, _220, _228);
    float _236 = fma(_226, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _232 * 4.0;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _246 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _244;
    float _248 = sqrt(_234);
    float _250 = -_238;
    float _252 = _250 + 1.0;
    float _254 = _242 * 16.0;
    float _256 = precise::min(_252, _147);
    float _258 = 1.0 / _246;
    float _260 = _256 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _262 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _264 = _248 + _262;
    float _266 = trunc(_254);
    float _268 = precise::max(_266, 0.0);
    uint _270 = uint(_268);
    float _272 = _264 * _258;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = precise::min(_252, _274);
    float _278 = trunc(_260);
    float _280 = precise::max(_278, 0.0);
    uint _282 = uint(_280);
    uint _284 = max(_156, _270);
    float _286 = _276 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _288 = trunc(_286);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    uint _294 = max(_292, _282);
    uint _296 = max(_294, _284);
    uint _298 = min(_296, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_298), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

