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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _239 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_239, float2(0.0), isnan(_239))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _83 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _85 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _81);
    float _87 = fma(_83, -0.5, 0.5);
    float _89 = fma(_85, -0.5, 0.5);
    float2 _296 = float2(_87, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float2 _306 = float2(_89, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_306, float2(0.0), isnan(_306))).x;
    float _95 = abs(_73);
    float _97 = -_95;
    float _99 = _97 + 1.0;
    float _101 = 0.0 + _87;
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = _89 + _103;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _115 = _113 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _117 = abs(_107);
    float _119 = log2(_117);
    float _121 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _123 = _121 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _125 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _127 = _125 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _129 = _119 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _131 = exp2(_129);
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[0].w, _111);
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = abs(_91);
    float _139 = log2(_137);
    float _141 = abs(_93);
    float _143 = log2(_141);
    float _145 = _139 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _147 = exp2(_145);
    float _149 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _151 = _149 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _153 = _143 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _163 = exp2(_153);
    float _165 = fma(_147, _127, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_147, _115, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_147, _123, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = fma(_163, _151, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _179 = fma(_163, _157, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _181 = fma(_163, _161, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _183 = _177 + _171;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _179 + _167;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _181 + _175;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[0].y, _185);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[0].x, _189);
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[0].z, _193);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    out.m_38.x = _201;
    out.m_38.y = _197;
    out.m_38.z = _205;
    out.m_38.w = _135;
    return out;
}

