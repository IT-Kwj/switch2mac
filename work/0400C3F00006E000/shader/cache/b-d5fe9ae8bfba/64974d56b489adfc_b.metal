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
    float2 _201 = float2(_47, _49);
    float _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_201, float2(0.0), isnan(_201))).x;
    float2 _212 = float2(_47, _49);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_212, float2(0.0), isnan(_212))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float _63 = in.m_35.w;
    float _65 = in.m_35.x;
    float _67 = in.m_35.y;
    float _69 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _71 = -_69;
    float _73 = fma(_71, _63, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _75 = -_69;
    float _77 = fma(_75, _65, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _79 = -_69;
    float _81 = fma(_79, _67, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _83 = 1.0 / _73;
    float _85 = _77 * _83;
    float _87 = _81 * _83;
    float2 _275 = float2(_85, _87);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_275, float2(0.0), isnan(_275))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = in.m_37.y;
    float _99 = in.m_37.x;
    float _101 = in.m_37.z;
    float _103 = -_73;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    bool _109 = _105 <= 1.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(1.0);
    bool _117 = _113 || _115;
    float _119 = float(_117);
    float _121 = _105 * _119;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = abs(_123);
    float _127 = log2(_125);
    float _129 = -_69;
    float _131 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _133 = fma(_129, _97, _131);
    float _135 = -_69;
    float _137 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _139 = fma(_135, _99, _137);
    float _141 = -_69;
    float _143 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _145 = fma(_141, _101, _143);
    float _147 = _133 * _133;
    float _149 = fma(_139, _139, _147);
    float _151 = _127 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _153 = fma(_145, _145, _149);
    float _155 = fma(_59, 2.0, -1.0);
    float _157 = fma(_57, 2.0, -1.0);
    float _159 = exp2(_151);
    float _161 = fma(_61, 2.0, -1.0);
    float _163 = _155 * _133;
    float _165 = fma(_157, _139, _163);
    float _167 = rsqrt(_153);
    float _169 = fma(_161, _145, _165);
    float _171 = -_167;
    float _173 = fma(_171, _169, 0.0);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _159 * _175;
    float _179 = _91 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _181 = _93 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _183 = _95 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _185 = _179 * _177;
    float _187 = _181 * _177;
    float _189 = _183 * _177;
    out.m_40.x = _185;
    out.m_40.y = _187;
    out.m_40.z = _189;
    return out;
}

