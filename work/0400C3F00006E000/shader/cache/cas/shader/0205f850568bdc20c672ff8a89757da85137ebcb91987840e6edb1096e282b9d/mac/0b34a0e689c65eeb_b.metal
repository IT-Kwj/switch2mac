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
    float2 _375 = float2(_95, _93);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375)), level(0.0)).x;
    float2 _386 = float2(_95, _93);
    float _99 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_386, float2(0.0), isnan(_386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_386, float2(0.0), isnan(_386)), level(0.0)).w;
    float3 _396 = float3(_95, _93, float(0));
    float3 _400 = select(_396, float3(0.0), isnan(_396));
    float _101 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _400.xy, uint(rint(_400.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _400.xy, uint(rint(_400.z)), level(0.0)).y;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    float _107 = _105 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _109 = _95 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _111 = fma(_107, 2.0, -1.0);
    float _113 = fma(_109, 2.0, -1.0);
    float _115 = _111 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _117 = _113 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _119 = -_97;
    float _121 = fma(_119, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _123 = 1.0 / _121;
    float _125 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _127 = _123 * _125;
    float _129 = _127 * _115;
    float _131 = _127 * _117;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _135 = _129 * _133;
    float _137 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _139 = _129 * _137;
    float _141 = -_101;
    float _143 = _141 + 1.0;
    float _145 = -_131;
    float _147 = fma(_145, (*spvDescriptorSet0.cp_c3)._m0[1].x, _135);
    float _149 = -_131;
    float _151 = fma(_149, (*spvDescriptorSet0.cp_c3)._m0[0].x, _139);
    float _153 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _155 = _129 * _153;
    float _157 = _143 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _159 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[1].z, _147);
    float _161 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[0].z, _151);
    float _163 = -_131;
    float _165 = fma(_163, (*spvDescriptorSet0.cp_c3)._m0[2].x, _155);
    float _167 = _159 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _169 = _161 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _171 = fma(_127, (*spvDescriptorSet0.cp_c3)._m0[2].z, _165);
    float _173 = trunc(_157);
    float _175 = precise::max(_173, 0.0);
    uint _178 = uint(_175);
    float _180 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _182 = _167 + _180;
    float _184 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _186 = _169 + _184;
    float _188 = _171 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _190 = _182 * _182;
    float _192 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _194 = _188 + _192;
    float _196 = abs(_169);
    float _198 = abs(_188);
    float _200 = precise::max(_196, _198);
    float _202 = fma(_186, _186, _190);
    float _204 = fma(_194, _194, _202);
    float _206 = fma(_200, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = sqrt(_204);
    float _212 = -_208;
    float _214 = _212 + 1.0;
    float _216 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _218 = fma(_210, (*spvDescriptorSet0.cp_c3)._m0[8].y, _216);
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _224 = _210 + _222;
    float _226 = -_220;
    float _228 = _226 + 1.0;
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _236 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _234;
    float _238 = 1.0 / _236;
    float _240 = _232 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _242 = exp2(_240);
    float _244 = _224 * _238;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = precise::min(_214, _246);
    float _250 = _248 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = trunc(_250);
    float _258 = precise::max(_256, 0.0);
    uint _260 = uint(_258);
    float _262 = -_254;
    float _264 = fma(_262, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _266 = _264 * _99;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::min(_214, _272);
    float _276 = _274 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _278 = trunc(_276);
    float _280 = precise::max(_278, 0.0);
    uint _282 = uint(_280);
    uint _284 = max(_260, _282);
    uint _286 = max(_178, _284);
    uint _288 = min(_286, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_288), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

