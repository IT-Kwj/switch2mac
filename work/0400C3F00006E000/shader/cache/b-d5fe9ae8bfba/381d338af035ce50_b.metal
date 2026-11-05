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
    float2 _517 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_517, float2(0.0), isnan(_517))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_517, float2(0.0), isnan(_517))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = _73 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].x, _85);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _99 = -_75;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _103 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _105 = -_75;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _109 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _111 = -_75;
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _115 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _117 = -_75;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _121 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _123 = fma(_97, -0.5, 0.5);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _129 = fma(_101, -0.5, 0.5);
    float _131 = fma(_103, -0.5, 0.5);
    float _133 = fma(_113, -0.5, 0.5);
    float2 _657 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_657, float2(0.0), isnan(_657))).x;
    float2 _666 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _139 = fma(_107, -0.5, 0.5);
    float _141 = fma(_121, -0.5, 0.5);
    float _143 = fma(_127, -0.5, 0.5);
    float _145 = fma(_109, -0.5, 0.5);
    float _147 = fma(_115, -0.5, 0.5);
    float _149 = fma(_119, -0.5, 0.5);
    float2 _688 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_688, float2(0.0), isnan(_688))).x;
    float2 _697 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697))).x;
    float2 _707 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_707, float2(0.0), isnan(_707))).x;
    float2 _716 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_716, float2(0.0), isnan(_716))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_716, float2(0.0), isnan(_716))).x;
    float2 _726 = float2(_145, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float2 _735 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_735, float2(0.0), isnan(_735))).x;
    float2 _745 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_745, float2(0.0), isnan(_745))).x;
    float2 _754 = float2(_149, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float _167 = 0.0 + _123;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = 0.0 + _129;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = abs(_75);
    float _177 = -_175;
    float _179 = _177 + 1.0;
    float _181 = _169 + _131;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _173 + _139;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = _179 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _183 + _141;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = _187 + _143;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _203 = _201 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _205 = _195 + _145;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = _199 + _133;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _147 + _207;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _233 = abs(_191);
    float _235 = log2(_233);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _241 = _149 + _211;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = fma(_135, _219, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_135, _231, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_135, _227, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_231, _137, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_219, _137, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = fma(_227, _137, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = fma(_151, _223, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _271 = fma(_239, _153, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _273 = fma(_223, _153, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _275 = fma(_151, _239, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _277 = _247 + _269;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _259 + _271;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_151, _203, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _287 = _263 + _273;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = _251 + _275;
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _299 = fma(_203, _153, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _301 = _255 + _285;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = fma(_155, _297, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _307 = _267 + _299;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _315 = _279 + _305;
    float _317 = precise::clamp(_315, 0.0, 1.0);
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _323 = fma(_297, _157, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _325 = fma(_155, _321, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _327 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _329 = _327 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _335 = fma(_155, _313, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _337 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _339 = _337 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _341 = _289 + _323;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = fma(_159, _329, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _347 = fma(_159, _333, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _349 = _303 + _335;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_321, _157, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _355 = fma(_159, _339, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _357 = _293 + _325;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = fma(_313, _157, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _363 = _317 + _347;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _283 + _353;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _351 + _355;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _359 + _345;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = _235 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _381 = _309 + _361;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = fma(_329, _161, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _387 = fma(_333, _161, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _389 = fma(_339, _161, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _391 = exp2(_379);
    float _393 = _343 + _387;
    float _395 = precise::clamp(_393, 0.0, 1.0);
    float _397 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _399 = _397 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _401 = _369 + _385;
    float _403 = precise::clamp(_401, 0.0, 1.0);
    float _405 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _407 = _405 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _409 = _383 + _389;
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _415 = _413 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _417 = fma(_163, _399, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _419 = fma(_163, _407, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _421 = fma(_399, _165, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _423 = fma(_163, _415, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _425 = fma(_407, _165, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _427 = fma(_415, _165, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _429 = _417 + _377;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = _423 + _373;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _421 + _403;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _419 + _365;
    float _443 = precise::clamp(_441, 0.0, 1.0);
    float _445 = _425 + _395;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    float _449 = _427 + _411;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].w, _215);
    float _455 = precise::clamp(_453, 0.0, 1.0);
    float _457 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].w, _243);
    float _459 = precise::clamp(_457, 0.0, 1.0);
    float _461 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].x, _431);
    float _463 = precise::clamp(_461, 0.0, 1.0);
    float _465 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].y, _443);
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].z, _435);
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].x, _439);
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].y, _447);
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = fma(_391, (*spvDescriptorSet0.fp_c4)._m0[0].z, _451);
    float _483 = precise::clamp(_481, 0.0, 1.0);
    out.m_38.x = _463;
    out.m_38.y = _467;
    out.m_38.z = _471;
    out.m_38.w = _455;
    out.m_40.x = _475;
    out.m_40.y = _479;
    out.m_40.z = _483;
    out.m_40.w = _459;
    return out;
}

