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
    float2 _325 = float2(_93, _91);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_325, float2(0.0), isnan(_325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_325, float2(0.0), isnan(_325)), level(0.0)).x;
    float3 _338 = float3(_93, _91, float(0));
    float3 _342 = select(_338, float3(0.0), isnan(_338));
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _342.xy, uint(rint(_342.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _342.xy, uint(rint(_342.z)), level(0.0)).y;
    float _99 = -_91;
    float _101 = _99 + 1.0;
    float _103 = _93 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _105 = _101 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _107 = fma(_103, 2.0, -1.0);
    float _109 = fma(_105, 2.0, -1.0);
    float _111 = _107 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _113 = _109 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _115 = -_95;
    float _117 = fma(_115, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _119 = 1.0 / _117;
    float _121 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _123 = _119 * _121;
    float _125 = _123 * _113;
    float _127 = _123 * _111;
    float _129 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _131 = _125 * _129;
    float _133 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _135 = _125 * _133;
    float _137 = -_127;
    float _139 = fma(_137, (*spvDescriptorSet0.cp_c3)._m0[1].x, _131);
    float _141 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _143 = _125 * _141;
    float _145 = -_127;
    float _147 = fma(_145, (*spvDescriptorSet0.cp_c3)._m0[0].x, _135);
    float _149 = -_97;
    float _151 = _149 + 1.0;
    float _153 = fma(_123, (*spvDescriptorSet0.cp_c3)._m0[1].z, _139);
    float _155 = -_127;
    float _157 = fma(_155, (*spvDescriptorSet0.cp_c3)._m0[2].x, _143);
    float _159 = fma(_123, (*spvDescriptorSet0.cp_c3)._m0[0].z, _147);
    float _161 = _151 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _163 = _153 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _165 = fma(_123, (*spvDescriptorSet0.cp_c3)._m0[2].z, _157);
    float _167 = _159 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _169 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _171 = _163 + _169;
    float _173 = _165 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _175 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _177 = _167 + _175;
    float _179 = trunc(_161);
    float _181 = precise::max(_179, 0.0);
    uint _184 = uint(_181);
    float _186 = _171 * _171;
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _190 = _173 + _188;
    float _192 = fma(_177, _177, _186);
    float _194 = abs(_167);
    float _196 = abs(_173);
    float _198 = precise::max(_194, _196);
    float _200 = fma(_190, _190, _192);
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _204 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _202;
    float _206 = fma(_198, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = 1.0 / _204;
    float _212 = -_208;
    float _214 = _212 + 1.0;
    float _216 = sqrt(_200);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _220 = _216 + _218;
    float _222 = _220 * _210;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = precise::min(_214, _224);
    float _228 = _226 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _230 = trunc(_228);
    float _232 = precise::max(_230, 0.0);
    uint _234 = uint(_232);
    uint _236 = max(_234, _184);
    uint _238 = min(_236, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_238), 0.0, 0.0, 0.0), uint2(int2(_59, _67)));
}

