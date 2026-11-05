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
    float2 _275 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_275, float2(0.0), isnan(_275))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _81 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _83 = -_75;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _87 = fma(_81, -0.5, 0.5);
    float _89 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _91 = fma(_85, -0.5, 0.5);
    float _93 = abs(_87);
    float _95 = log2(_93);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _89);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _97);
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _97);
    float _105 = abs(_91);
    float _107 = log2(_105);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = abs(_109);
    float _115 = log2(_113);
    float _117 = _95 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _119 = abs(_111);
    float _121 = log2(_119);
    float _123 = _107 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _125 = _115 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _127 = exp2(_117);
    float _129 = _121 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _131 = exp2(_123);
    float _133 = exp2(_125);
    float _135 = exp2(_129);
    float2 _390 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float2 _399 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).x;
    float2 _409 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).x;
    float2 _418 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).x;
    float _145 = abs(_75);
    float _147 = -_145;
    float _149 = _147 + 1.0;
    float _151 = _111 + _91;
    float _153 = _149 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _109 + _87;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _163 = abs(_155);
    float _165 = log2(_163);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _187 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _189 = exp2(_187);
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].w, _157);
    float _193 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].w, _151);
    float _195 = fma(_137, _169, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _197 = fma(_137, _173, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _199 = fma(_137, _177, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _201 = fma(_169, _139, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _203 = fma(_173, _139, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _205 = fma(_177, _139, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _207 = fma(_141, _161, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _209 = fma(_141, _181, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _211 = fma(_141, _185, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _213 = _207 + _195;
    float _215 = _209 + _197;
    float _217 = fma(_161, _143, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _219 = fma(_181, _143, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _221 = fma(_185, _143, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _223 = _211 + _199;
    float _225 = _217 + _201;
    float _227 = _219 + _203;
    float _229 = _221 + _205;
    float _231 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].x, _213);
    float _233 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].y, _215);
    float _235 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].z, _223);
    float _237 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].x, _225);
    float _239 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].y, _227);
    float _241 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].z, _229);
    out.m_38.x = _231;
    out.m_38.y = _233;
    out.m_38.z = _235;
    out.m_38.w = _191;
    out.m_40.x = _237;
    out.m_40.y = _239;
    out.m_40.z = _241;
    out.m_40.w = _193;
    return out;
}

