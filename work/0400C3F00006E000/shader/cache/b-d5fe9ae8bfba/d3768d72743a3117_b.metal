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
    float2 _443 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_443, float2(0.0), isnan(_443))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _75);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _101 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _87);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _93);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _97);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = fma(_107, -0.5, 0.5);
    float _117 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _95);
    float _119 = fma(_109, -0.5, 0.5);
    float2 _568 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).x;
    float2 _578 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float _125 = fma(_117, -0.5, 0.5);
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float _129 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _101);
    float2 _600 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_600, float2(0.0), isnan(_600))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_600, float2(0.0), isnan(_600))).x;
    float _133 = fma(_127, -0.5, 0.5);
    float2 _612 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float _137 = fma(_129, -0.5, 0.5);
    float2 _624 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).x;
    float2 _634 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float2 _644 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644))).x;
    float _145 = 0.0 + _115;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = abs(_73);
    float _151 = -_149;
    float _153 = _151 + 1.0;
    float _155 = _147 + _111;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _163 = _157 + _125;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _171 = _165 + _113;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _153 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _173 + _119;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _187 = _181 + _133;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _195 = abs(_177);
    float _197 = log2(_195);
    float _199 = _137 + _189;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _219 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _221 = _219 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _223 = fma(_121, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_123, _209, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _229 = fma(_123, _213, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _231 = fma(_123, _217, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _233 = fma(_121, _161, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_121, _169, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = _225 + _227;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = fma(_131, _221, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _247 = _235 + _229;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _253 = _251 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _255 = _239 + _231;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = fma(_131, _253, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _261 = fma(_131, _185, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _263 = _249 + _245;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _275 = _257 + _261;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _243 + _259;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_135, _269, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _289 = fma(_135, _273, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _291 = fma(_135, _193, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _293 = _281 + _283;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _301 = fma(_139, _287, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _303 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _305 = _303 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _307 = _277 + _291;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = fma(_139, _299, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _313 = _295 + _301;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _265 + _289;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = fma(_139, _305, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _323 = _319 + _311;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _329 = _327 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _331 = _309 + _321;
    float _333 = precise::clamp(_331, 0.0, 1.0);
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _339 = _197 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _345 = fma(_141, _329, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _347 = fma(_141, _337, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _349 = fma(_141, _343, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _351 = exp2(_339);
    float _353 = _315 + _345;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = _325 + _347;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _363 = _361 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _365 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _367 = _365 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _373 = _333 + _349;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = fma(_143, _363, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _379 = fma(_143, _367, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _381 = fma(_143, _371, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _383 = _377 + _355;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _379 + _359;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _381 + _375;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = fma(_351, (*spvDescriptorSet0.fp_c4)._m0[0].w, _201);
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = fma(_351, (*spvDescriptorSet0.fp_c4)._m0[0].x, _385);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_351, (*spvDescriptorSet0.fp_c4)._m0[0].y, _389);
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_351, (*spvDescriptorSet0.fp_c4)._m0[0].z, _393);
    float _409 = precise::clamp(_407, 0.0, 1.0);
    out.m_38.x = _401;
    out.m_38.y = _405;
    out.m_38.z = _409;
    out.m_38.w = _397;
    return out;
}

