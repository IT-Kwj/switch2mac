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
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
    float4 m_31 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _45 = in.m_31.x;
    float _47 = in.m_31.y;
    float2 _209 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_209, float2(0.0), isnan(_209))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_209, float2(0.0), isnan(_209))).x;
    float2 _220 = float2(_45, _47);
    float3 _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_220, float2(0.0), isnan(_220))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_220, float2(0.0), isnan(_220))).xyz;
    float _55 = _53.x;
    float _57 = _53.y;
    float _59 = _53.z;
    float _61 = in.m_33.w;
    float _63 = in.m_35.y;
    float _65 = in.m_35.x;
    float _67 = in.m_35.z;
    float _69 = fma(_49, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _71 = in.m_33.x;
    float _73 = -_69;
    float _75 = fma(_73, _61, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _77 = -_69;
    float _79 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _81 = fma(_77, _63, _79);
    float _83 = in.m_33.y;
    float _85 = -_69;
    float _87 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _89 = fma(_85, _65, _87);
    float _91 = -_75;
    float _93 = fma(_91, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _95 = -_69;
    float _97 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _99 = fma(_95, _67, _97);
    float _101 = fma(_57, 2.0, -1.0);
    float _103 = fma(_55, 2.0, -1.0);
    float _105 = fma(_59, 2.0, -1.0);
    bool _109 = _93 <= 1.0;
    bool _111 = isnan(_93);
    bool _113 = _109 || _111;
    bool _115 = isnan(1.0);
    bool _117 = _113 || _115;
    float _119 = float(_117);
    float _121 = _101 * _81;
    float _123 = _93 * _119;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _81 * _81;
    float _129 = fma(_103, _89, _121);
    float _131 = fma(_89, _89, _127);
    float _133 = abs(_125);
    float _135 = log2(_133);
    float _137 = fma(_105, _99, _129);
    float _139 = fma(_99, _99, _131);
    float _141 = rsqrt(_139);
    float _143 = -_69;
    float _145 = fma(_143, _71, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _147 = -_69;
    float _149 = fma(_147, _83, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _151 = _135 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _153 = precise::min(_145, _149);
    float _155 = exp2(_151);
    float _157 = precise::max(_145, _149);
    bool _159 = _153 >= 0.0;
    bool _161 = isnan(_153);
    bool _163 = _159 || _161;
    bool _165 = isnan(0.0);
    bool _167 = _163 || _165;
    float _169 = -_141;
    float _171 = fma(_169, _137, 0.0);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    bool _175 = _75 >= _157;
    bool _177 = isnan(_75);
    bool _179 = _175 || _177;
    bool _181 = isnan(_157);
    bool _183 = _179 || _181;
    bool _185 = _183 && _167;
    float _187 = float(_185);
    float _189 = _187 * _155;
    float _191 = _189 * _173;
    float _193 = _191 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _195 = _191 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _197 = _191 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    out.m_38.x = _193;
    out.m_38.y = _195;
    out.m_38.z = _197;
    return out;
}

