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
    float2 _477 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_477, float2(0.0), isnan(_477))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _89 = _71 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _101 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _87);
    float _105 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[8].x, _89);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _91);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _93);
    float _111 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _103);
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _101);
    float _115 = fma(_107, -0.5, 0.5);
    float _117 = fma(_109, -0.5, 0.5);
    float _119 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _95);
    float _121 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _99);
    float2 _612 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float2 _622 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_622, float2(0.0), isnan(_622))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_622, float2(0.0), isnan(_622))).x;
    float _127 = fma(_119, -0.5, 0.5);
    float _129 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _97);
    float _131 = fma(_121, -0.5, 0.5);
    float2 _641 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float _135 = fma(_129, -0.5, 0.5);
    float _137 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[8].z, _105);
    float _139 = fma(_113, -0.5, 0.5);
    float _141 = fma(_111, -0.5, 0.5);
    float2 _662 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_662, float2(0.0), isnan(_662))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_662, float2(0.0), isnan(_662))).x;
    float2 _672 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_672, float2(0.0), isnan(_672))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_672, float2(0.0), isnan(_672))).x;
    float _147 = fma(_137, -0.5, 0.5);
    float2 _684 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_684, float2(0.0), isnan(_684))).x;
    float2 _694 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694))).x;
    float2 _704 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[15].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_704, float2(0.0), isnan(_704))).x;
    float _155 = _115 + _117;
    float _157 = abs(_73);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = _155 + _127;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _169 = _163 + _135;
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _183 = _161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _191 = abs(_185);
    float _193 = log2(_191);
    float _195 = abs(_123);
    float _197 = log2(_195);
    float _199 = abs(_125);
    float _201 = log2(_199);
    float _203 = _197 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _205 = abs(_133);
    float _207 = log2(_205);
    float _209 = _201 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _211 = exp2(_203);
    float _213 = exp2(_209);
    float _215 = fma(_211, _173, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _217 = fma(_211, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _219 = fma(_211, _181, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _221 = abs(_143);
    float _223 = log2(_221);
    float _225 = fma(_213, _167, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _227 = _169 + _131;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _233 = abs(_145);
    float _235 = log2(_233);
    float _237 = _215 + _225;
    float _239 = _227 + _139;
    float _241 = _207 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _243 = fma(_213, _231, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _245 = fma(_213, _189, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _247 = _239 + _141;
    float _249 = abs(_151);
    float _251 = log2(_249);
    float _253 = _219 + _245;
    float _255 = _223 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _257 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _259 = _257 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _261 = _217 + _243;
    float _263 = exp2(_241);
    float _265 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _267 = _265 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _273 = _147 + _247;
    float _275 = exp2(_255);
    float _277 = abs(_149);
    float _279 = log2(_277);
    float _281 = fma(_263, _259, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _283 = fma(_263, _267, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _285 = fma(_263, _271, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _287 = _235 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _289 = _237 + _281;
    float _291 = _261 + _283;
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _297 = exp2(_287);
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _303 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _305 = _303 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _307 = _253 + _285;
    float _309 = fma(_275, _295, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _311 = fma(_275, _301, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _313 = _279 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _315 = abs(_153);
    float _317 = log2(_315);
    float _319 = _289 + _311;
    float _321 = fma(_275, _305, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _327 = _307 + _309;
    float _329 = _251 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _331 = exp2(_313);
    float _333 = _291 + _321;
    float _335 = fma(_297, _325, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _337 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _339 = _337 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _345 = _319 + _335;
    float _347 = fma(_297, _339, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _349 = exp2(_329);
    float _351 = fma(_297, _343, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _353 = _317 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
    float _355 = _333 + _347;
    float _357 = _327 + _351;
    float _359 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _361 = _359 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _363 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _367 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _369 = _367 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _371 = exp2(_353);
    float _373 = fma(_331, _361, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _375 = fma(_331, _365, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _377 = fma(_331, _369, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _379 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _381 = _379 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _383 = _193 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _385 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _387 = _385 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _389 = _345 + _373;
    float _391 = _357 + _375;
    float _393 = _355 + _377;
    float _395 = fma(_349, _381, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _397 = fma(_349, _387, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _399 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _401 = _399 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _403 = exp2(_383);
    float _405 = _389 + _395;
    float _407 = _393 + _397;
    float _409 = -(*spvDescriptorSet0.fp_c5)._m0[30].y;
    float _411 = _409 + (*spvDescriptorSet0.fp_c5)._m0[31].y;
    float _413 = fma(_349, _401, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _415 = -(*spvDescriptorSet0.fp_c5)._m0[30].x;
    float _417 = _415 + (*spvDescriptorSet0.fp_c5)._m0[31].x;
    float _419 = -(*spvDescriptorSet0.fp_c5)._m0[30].z;
    float _421 = _419 + (*spvDescriptorSet0.fp_c5)._m0[31].z;
    float _423 = fma(_371, _411, (*spvDescriptorSet0.fp_c5)._m0[30].y);
    float _425 = _391 + _413;
    float _427 = fma(_371, _417, (*spvDescriptorSet0.fp_c5)._m0[30].x);
    float _429 = fma(_371, _421, (*spvDescriptorSet0.fp_c5)._m0[30].z);
    float _431 = _423 + _407;
    float _433 = _427 + _405;
    float _435 = _429 + _425;
    float _437 = fma(_403, (*spvDescriptorSet0.fp_c4)._m0[0].w, _273);
    float _439 = fma(_403, (*spvDescriptorSet0.fp_c4)._m0[0].x, _433);
    float _441 = fma(_403, (*spvDescriptorSet0.fp_c4)._m0[0].y, _431);
    float _443 = fma(_403, (*spvDescriptorSet0.fp_c4)._m0[0].z, _435);
    out.m_38.x = _439;
    out.m_38.y = _441;
    out.m_38.z = _443;
    out.m_38.w = _437;
    return out;
}

