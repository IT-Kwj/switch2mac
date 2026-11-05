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
    float2 _447 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_447, float2(0.0), isnan(_447))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _97);
    float _111 = fma(_99, -0.5, 0.5);
    float _113 = fma(_101, -0.5, 0.5);
    float _115 = fma(_103, -0.5, 0.5);
    float _117 = fma(_105, -0.5, 0.5);
    float _119 = fma(_107, -0.5, 0.5);
    float _121 = fma(_109, -0.5, 0.5);
    float2 _571 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).x;
    float2 _581 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float2 _591 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_591, float2(0.0), isnan(_591))).x;
    float2 _601 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float2 _611 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_611, float2(0.0), isnan(_611))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_611, float2(0.0), isnan(_611))).x;
    float2 _621 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_621, float2(0.0), isnan(_621))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_621, float2(0.0), isnan(_621))).x;
    float _135 = 0.0 + _113;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = abs(_73);
    float _141 = -_139;
    float _143 = _141 + 1.0;
    float _145 = _137 + _115;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _147 + _117;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = abs(_151);
    float _159 = log2(_157);
    float _161 = _155 + _111;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 + _119;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _121 + _167;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _189 = abs(_123);
    float _191 = log2(_189);
    float _193 = abs(_125);
    float _195 = log2(_193);
    float _197 = abs(_127);
    float _199 = log2(_197);
    float _201 = _191 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _207 = _195 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _209 = exp2(_201);
    float _211 = _199 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _213 = exp2(_207);
    float _215 = abs(_129);
    float _217 = log2(_215);
    float _219 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _221 = _219 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _223 = fma(_209, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_209, _179, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_209, _221, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = exp2(_211);
    float _237 = fma(_213, _175, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _239 = fma(_213, _183, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _241 = fma(_213, _187, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _243 = _225 + _237;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _229 + _239;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = abs(_131);
    float _253 = log2(_251);
    float _255 = _217 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _261 = _233 + _241;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _273 = exp2(_255);
    float _275 = fma(_235, _259, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _277 = fma(_235, _267, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _279 = fma(_235, _271, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _281 = _245 + _275;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _249 + _277;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = abs(_133);
    float _291 = log2(_289);
    float _293 = _253 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _303 = _263 + _279;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = exp2(_293);
    float _309 = fma(_273, _301, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _315 = fma(_273, _297, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _317 = _287 + _309;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_273, _313, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _323 = _291 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _325 = _283 + _315;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = _159 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _339 = exp2(_323);
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _345 = fma(_307, _333, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _347 = fma(_307, _337, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _349 = fma(_307, _343, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _351 = _327 + _345;
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = exp2(_329);
    float _357 = _319 + _347;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _363 = _361 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _365 = _305 + _321;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _373 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _375 = _373 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _377 = _367 + _349;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_339, _363, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _383 = fma(_339, _371, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _385 = fma(_339, _375, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _387 = _381 + _353;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _383 + _359;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _385 + _379;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].w, _171);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].x, _389);
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].y, _393);
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].z, _397);
    float _413 = precise::clamp(_411, 0.0, 1.0);
    out.m_38.x = _405;
    out.m_38.y = _409;
    out.m_38.z = _413;
    out.m_38.w = _401;
    return out;
}

