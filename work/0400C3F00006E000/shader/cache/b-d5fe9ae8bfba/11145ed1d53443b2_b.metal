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
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _237 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_237, float2(0.0), isnan(_237))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _81 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _83 = -_75;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _87 = fma(_81, -0.5, 0.5);
    float _89 = fma(_85, -0.5, 0.5);
    float2 _287 = float2(_87, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).x;
    float2 _296 = float2(_89, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float _95 = abs(_75);
    float _97 = -_95;
    float _99 = _97 + 1.0;
    float _101 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _107 = _105 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _109 = abs(_103);
    float _111 = log2(_109);
    float _113 = 0.0 + _89;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _111 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _119 = exp2(_117);
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].w, _115);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = abs(_91);
    float _127 = log2(_125);
    float _129 = abs(_93);
    float _131 = log2(_129);
    float _133 = _127 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _135 = exp2(_133);
    float _137 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _139 = _137 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _141 = 0.0 + _87;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _131 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _151 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].w, _143);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = exp2(_145);
    float _157 = fma(_135, _149, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_135, _139, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_135, _107, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].x, _159);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].y, _163);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].z, _167);
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = fma(_149, _155, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_139, _155, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_107, _155, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].x, _183);
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].y, _187);
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[0].z, _191);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    out.m_38.x = _171;
    out.m_38.y = _175;
    out.m_38.z = _179;
    out.m_38.w = _153;
    out.m_40.x = _195;
    out.m_40.y = _199;
    out.m_40.z = _203;
    out.m_40.w = _123;
    return out;
}

