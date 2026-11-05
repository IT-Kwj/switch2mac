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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
    float4 m_37 [[user(locn1), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _203 = float2(_47, _49);
    float _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203))).x;
    float _53 = in.m_35.w;
    float _55 = in.m_35.x;
    float _57 = in.m_35.y;
    float _59 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _61 = -_59;
    float _63 = fma(_61, _53, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _65 = -_59;
    float _67 = fma(_65, _55, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _69 = -_59;
    float _71 = fma(_69, _57, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _73 = 1.0 / _63;
    float _75 = _67 * _73;
    float _77 = _71 * _73;
    float2 _263 = float2(_47, _49);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_263, float2(0.0), isnan(_263))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float2 _277 = float2(_75, _77);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_277, float2(0.0), isnan(_277))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = in.m_37.y;
    float _99 = in.m_37.x;
    float _101 = -_63;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _105 = in.m_37.z;
    bool _109 = _103 <= 1.0;
    bool _111 = isnan(_103);
    bool _113 = _109 || _111;
    bool _115 = isnan(1.0);
    bool _117 = _113 || _115;
    float _119 = float(_117);
    float _121 = _103 * _119;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = abs(_123);
    float _127 = log2(_125);
    float _129 = -_59;
    float _131 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _133 = fma(_129, _97, _131);
    float _135 = -_59;
    float _137 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _139 = fma(_135, _99, _137);
    float _141 = _133 * _133;
    float _143 = _127 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _145 = -_59;
    float _147 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _149 = fma(_145, _105, _147);
    float _151 = fma(_139, _139, _141);
    float _153 = exp2(_143);
    float _155 = fma(_149, _149, _151);
    float _157 = rsqrt(_155);
    float _159 = fma(_85, 2.0, -1.0);
    float _161 = fma(_83, 2.0, -1.0);
    float _163 = fma(_87, 2.0, -1.0);
    float _165 = _159 * _133;
    float _167 = fma(_161, _139, _165);
    float _169 = _153 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _171 = fma(_163, _149, _167);
    float _173 = -_157;
    float _175 = fma(_173, _171, 0.0);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _91 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _181 = _93 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _183 = _169 * _177;
    float _185 = _95 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _187 = _179 * _183;
    float _189 = _181 * _183;
    float _191 = _185 * _183;
    out.m_40.x = _187;
    out.m_40.y = _189;
    out.m_40.z = _191;
    out.m_40.w = 0.0;
    return out;
}

