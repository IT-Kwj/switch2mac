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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _529 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _77 = _73 + (-0.99989998340606689453125);
    float _79 = _75 + (-0.99989998340606689453125);
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _87 = _69 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _93 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _85);
    float _95 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].x, _87);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _103 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = _105 * _105;
    float _111 = _107 * _107;
    float _113 = fma(_109, _77, 1.0);
    float _115 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _117 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _119 = fma(_101, -0.5, 0.5);
    float _121 = fma(_111, _79, 1.0);
    float _123 = _113 * _113;
    float _125 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _117);
    float _127 = _115 + (-0.99989998340606689453125);
    float _129 = _119 * _119;
    float _131 = _69 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _133 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _125);
    float _135 = _121 * _121;
    float _137 = fma(_129, _127, 1.0);
    float _139 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _141 = fma(_133, -0.5, 0.5);
    float _143 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[6].x, _131);
    float _145 = _139 + (-0.99989998340606689453125);
    float _147 = _141 * _141;
    float _149 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[6].z, _143);
    float _151 = fma(_103, -0.5, 0.5);
    float _153 = (*spvDescriptorSet0.fp_c5)._m0[4].x * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _155 = fma(_147, _145, 1.0);
    float _157 = 0.0 + _105;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = 1.0 / _123;
    float _163 = fma(_149, -0.5, 0.5);
    float _165 = _153 + (-0.99989998340606689453125);
    float _167 = _159 + _107;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = (*spvDescriptorSet0.fp_c5)._m0[5].x * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _173 = _151 * _151;
    float _175 = _155 * _155;
    float _177 = _169 + _119;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _137 * _137;
    float _183 = _171 + (-0.99989998340606689453125);
    float _185 = _163 * _163;
    float _187 = fma(_173, _165, 1.0);
    float _189 = 1.0 / _175;
    float _191 = _73 + 9.9999997473787516355514526367188e-05;
    float _193 = fma(_185, _183, 1.0);
    float _195 = _187 * _187;
    float _197 = _139 + 9.9999997473787516355514526367188e-05;
    float _199 = _191 * _161;
    float _201 = _193 * _193;
    float _203 = _179 + _141;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = 1.0 / _181;
    float _209 = _115 + 9.9999997473787516355514526367188e-05;
    float _211 = _75 + 9.9999997473787516355514526367188e-05;
    float _213 = _153 + 9.9999997473787516355514526367188e-05;
    float _215 = fma(_153, 0.75, 7.4999996286351233720779418945312e-05);
    float _217 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _219 = fma(_139, 0.75, 7.4999996286351233720779418945312e-05);
    float _221 = abs(_71);
    float _223 = -_221;
    float _225 = _223 + 1.0;
    float _227 = 1.0 / _135;
    float _229 = _197 * _189;
    float _231 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _233 = fma(_171, 0.75, 7.4999996286351233720779418945312e-05);
    float _235 = _171 + 9.9999997473787516355514526367188e-05;
    float _237 = -_215;
    float _239 = _237 + 1.0;
    float _241 = -_231;
    float _243 = _241 + 1.0;
    float _245 = _205 + _151;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = 1.0 / _195;
    float _251 = _209 * _207;
    float _253 = fma(_115, 0.75, 7.4999996286351233720779418945312e-05);
    float _255 = -_217;
    float _257 = _255 + 1.0;
    float _259 = _163 + _247;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = _199 * _257;
    float _269 = 1.0 / _201;
    float _271 = _211 * _227;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _277 = _271 * _243;
    float _279 = -_219;
    float _281 = _279 + 1.0;
    float _283 = _213 * _249;
    float _285 = _251 * _265;
    float _287 = _229 * _281;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _301 = _235 * _269;
    float _303 = -_233;
    float _305 = _303 + 1.0;
    float _307 = _283 * _239;
    float _309 = fma(_267, _291, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = _301 * _305;
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _327 = fma(_267, _317, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _335 = fma(_267, _321, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = fma(_277, _299, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _341 = _225 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = fma(_277, _325, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _347 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _349 = _347 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _351 = fma(_285, _333, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _353 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _355 = _353 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _357 = abs(_343);
    float _359 = log2(_357);
    float _361 = _329 + _345;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_285, _355, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _367 = fma(_285, _349, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _369 = fma(_277, _295, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _371 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _373 = _371 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _375 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _377 = _375 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _379 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _381 = _379 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _383 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _385 = _383 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _387 = _311 + _339;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _337 + _369;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = fma(_287, _373, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _397 = _363 + _365;
    float _399 = precise::clamp(_397, 0.0, 1.0);
    float _401 = fma(_307, _377, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _403 = fma(_307, _381, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _405 = fma(_307, _385, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _407 = _389 + _351;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _359 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _413 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _415 = _413 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _417 = _393 + _367;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = _409 + _395;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_287, _415, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _427 = fma(_287, _275, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _429 = exp2(_411);
    float _431 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _433 = _431 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _435 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _437 = _435 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _439 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _441 = _439 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _443 = _399 + _425;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _419 + _427;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_313, _433, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _453 = fma(_313, _437, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _455 = fma(_313, _441, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _457 = _445 + _401;
    float _459 = precise::clamp(_457, 0.0, 1.0);
    float _461 = _423 + _403;
    float _463 = precise::clamp(_461, 0.0, 1.0);
    float _465 = _449 + _405;
    float _467 = precise::clamp(_465, 0.0, 1.0);
    float _469 = _451 + _459;
    float _471 = precise::clamp(_469, 0.0, 1.0);
    float _473 = _453 + _463;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = _455 + _467;
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = fma(_429, (*spvDescriptorSet0.fp_c4)._m0[0].w, _261);
    float _483 = precise::clamp(_481, 0.0, 1.0);
    float _485 = fma(_429, (*spvDescriptorSet0.fp_c4)._m0[0].x, _471);
    float _487 = precise::clamp(_485, 0.0, 1.0);
    float _489 = fma(_429, (*spvDescriptorSet0.fp_c4)._m0[0].y, _475);
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = fma(_429, (*spvDescriptorSet0.fp_c4)._m0[0].z, _479);
    float _495 = precise::clamp(_493, 0.0, 1.0);
    out.m_36.x = _487;
    out.m_36.y = _491;
    out.m_36.z = _495;
    out.m_36.w = _483;
    return out;
}

