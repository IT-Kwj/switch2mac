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
    float2 _389 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = fma(_89, -0.5, 0.5);
    float _97 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _99 = abs(_93);
    float _101 = log2(_99);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _97);
    float _105 = fma(_91, -0.5, 0.5);
    float _107 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _109 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _111 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _103);
    float _113 = abs(_95);
    float _115 = log2(_113);
    float _117 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _107);
    float _119 = fma(_111, -0.5, 0.5);
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _117);
    float _123 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _109);
    float _125 = abs(_105);
    float _127 = log2(_125);
    float _129 = _101 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _131 = fma(_121, -0.5, 0.5);
    float _133 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _123);
    float _135 = fma(_133, -0.5, 0.5);
    float _137 = abs(_119);
    float _139 = log2(_137);
    float _141 = _115 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _143 = exp2(_129);
    float _145 = _127 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _147 = exp2(_141);
    float _149 = _139 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _151 = abs(_131);
    float _153 = log2(_151);
    float2 _553 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_553, float2(0.0), isnan(_553))).x;
    float _157 = exp2(_145);
    float2 _565 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
    float _161 = exp2(_149);
    float _163 = _153 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _165 = abs(_135);
    float _167 = log2(_165);
    float2 _585 = float2(_157, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_585, float2(0.0), isnan(_585))).x;
    float _171 = exp2(_163);
    float2 _597 = float2(_161, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float _175 = _167 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _177 = exp2(_175);
    float2 _613 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float2 _623 = float2(_177, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_623, float2(0.0), isnan(_623))).x;
    float _183 = _93 + _95;
    float _185 = abs(_73);
    float _187 = -_185;
    float _189 = _187 + 1.0;
    float _191 = _183 + _105;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _197 = _191 + _119;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _207 = _197 + _131;
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _213 = _135 + _207;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _219 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _221 = _219 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _223 = _189 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _235 = abs(_225);
    float _237 = log2(_235);
    float _239 = fma(_155, _217, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _241 = fma(_155, _233, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _243 = fma(_155, _195, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _245 = fma(_159, _201, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _251 = fma(_159, _205, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _253 = fma(_159, _211, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _255 = _239 + _245;
    float _257 = _241 + _251;
    float _259 = _243 + _253;
    float _261 = fma(_169, _249, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _263 = fma(_169, _221, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _265 = fma(_169, _229, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _267 = _255 + _261;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _273 = _257 + _263;
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _279 = _259 + _265;
    float _281 = fma(_173, _271, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _287 = fma(_173, _277, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _289 = _267 + _281;
    float _291 = fma(_173, _285, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _297 = _237 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _303 = _279 + _291;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _309 = fma(_179, _295, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _311 = fma(_179, _301, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _313 = _273 + _287;
    float _315 = fma(_179, _307, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _317 = exp2(_297);
    float _319 = _289 + _309;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _325 = _313 + _311;
    float _327 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _329 = _327 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _331 = _303 + _315;
    float _333 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _335 = _333 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _337 = fma(_181, _323, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _339 = fma(_181, _329, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _341 = fma(_181, _335, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _343 = _337 + _319;
    float _345 = _339 + _325;
    float _347 = _341 + _331;
    float _349 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].w, _213);
    float _351 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].x, _343);
    float _353 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].y, _345);
    float _355 = fma(_317, (*spvDescriptorSet0.fp_c4)._m0[0].z, _347);
    out.m_38.x = _351;
    out.m_38.y = _353;
    out.m_38.z = _355;
    out.m_38.w = _349;
    return out;
}

