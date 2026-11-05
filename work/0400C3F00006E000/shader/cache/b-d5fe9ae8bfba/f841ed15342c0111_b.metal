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
    float2 _295 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_295, float2(0.0), isnan(_295))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _87 = -_75;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _97 = fma(_85, -0.5, 0.5);
    float _99 = fma(_89, -0.5, 0.5);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float2 _370 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370))).x;
    float2 _379 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).x;
    float2 _389 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float2 _398 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float _113 = abs(_75);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = 0.0 + _99;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = 0.0 + _97;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _103 + _121;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _139 = abs(_125);
    float _141 = log2(_139);
    float _143 = _101 + _129;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _163 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _165 = _163 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _167 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _169 = exp2(_167);
    float _171 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].w, _145);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].w, _133);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_105, _149, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = fma(_105, _153, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_105, _137, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = fma(_149, _107, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_109, _157, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _197 = fma(_109, _161, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _199 = fma(_109, _165, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _201 = fma(_157, _111, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _203 = fma(_153, _107, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_137, _107, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = fma(_161, _111, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _213 = fma(_165, _111, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _215 = _199 + _189;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _201 + _193;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _195 + _181;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _197 + _185;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _211 + _205;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _213 + _209;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].x, _225);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].y, _229);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].z, _217);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].x, _221);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].y, _233);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].z, _237);
    float _261 = precise::clamp(_259, 0.0, 1.0);
    out.m_38.x = _241;
    out.m_38.y = _245;
    out.m_38.z = _249;
    out.m_38.w = _173;
    out.m_40.x = _253;
    out.m_40.y = _257;
    out.m_40.z = _261;
    out.m_40.w = _177;
    return out;
}

