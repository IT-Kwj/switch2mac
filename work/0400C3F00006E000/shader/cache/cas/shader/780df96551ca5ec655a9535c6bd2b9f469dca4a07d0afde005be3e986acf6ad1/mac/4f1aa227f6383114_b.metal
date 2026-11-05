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
    float _75 = _73 + (-0.99989998340606689453125);
    float _77 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _79 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _85 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _79);
    float _89 = _69 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _91 = _69 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _93 = _69 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _95 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _81);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _99 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _83);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _95);
    float _103 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[6].x, _91);
    float _105 = fma(_97, -0.5, 0.5);
    float _107 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _99);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = _77 + (-0.99989998340606689453125);
    float _113 = _105 * _105;
    float _115 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _85);
    float _117 = _109 * _109;
    float _119 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].x, _89);
    float _121 = fma(_113, _75, 1.0);
    float _123 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[7].x, _93);
    float _125 = fma(_117, _111, 1.0);
    float _127 = _121 * _121;
    float _129 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _115);
    float _131 = fma(_107, -0.5, 0.5);
    float _133 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _135 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[6].z, _103);
    float _137 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[7].z, _123);
    float _139 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _141 = fma(_129, -0.5, 0.5);
    float _143 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].z, _119);
    float _145 = _133 + (-0.99989998340606689453125);
    float _147 = _131 * _131;
    float _149 = fma(_135, -0.5, 0.5);
    float _151 = _139 + (-0.99989998340606689453125);
    float _153 = _141 * _141;
    float _155 = _105 + _109;
    float _157 = fma(_143, -0.5, 0.5);
    float _159 = (*spvDescriptorSet0.fp_c5)._m0[4].x * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _161 = fma(_147, _145, 1.0);
    float _163 = _125 * _125;
    float _165 = fma(_153, _151, 1.0);
    float _167 = _159 + (-0.99989998340606689453125);
    float _169 = _157 * _157;
    float _171 = (*spvDescriptorSet0.fp_c5)._m0[5].x * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _173 = fma(_137, -0.5, 0.5);
    float _175 = _165 * _165;
    float _177 = (*spvDescriptorSet0.fp_c5)._m0[6].x * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _179 = fma(_169, _167, 1.0);
    float _181 = _171 + (-0.99989998340606689453125);
    float _183 = _149 * _149;
    float _185 = _161 * _161;
    float _187 = _179 * _179;
    float _189 = 1.0 / _127;
    float _191 = _177 + (-0.99989998340606689453125);
    float _193 = _173 * _173;
    float _195 = fma(_183, _181, 1.0);
    float _197 = _155 + _131;
    float _199 = fma(_193, _191, 1.0);
    float _201 = _195 * _195;
    float _203 = 1.0 / _185;
    float _205 = _197 + _141;
    float _207 = _199 * _199;
    float _209 = _73 + 9.9999997473787516355514526367188e-05;
    float _211 = _159 + 9.9999997473787516355514526367188e-05;
    float _213 = _205 + _157;
    float _215 = _133 + 9.9999997473787516355514526367188e-05;
    float _217 = _77 + 9.9999997473787516355514526367188e-05;
    float _219 = 1.0 / _187;
    float _221 = _209 * _189;
    float _223 = _139 + 9.9999997473787516355514526367188e-05;
    float _225 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _227 = fma(_159, 0.75, 7.4999996286351233720779418945312e-05);
    float _229 = 1.0 / _175;
    float _231 = _215 * _203;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _237 = 1.0 / _163;
    float _239 = _211 * _219;
    float _241 = fma(_133, 0.75, 7.4999996286351233720779418945312e-05);
    float _243 = _171 + 9.9999997473787516355514526367188e-05;
    float _245 = fma(_171, 0.75, 7.4999996286351233720779418945312e-05);
    float _247 = -_241;
    float _249 = _247 + 1.0;
    float _251 = 1.0 / _201;
    float _253 = _223 * _229;
    float _255 = fma(_77, 0.75, 7.4999996286351233720779418945312e-05);
    float _257 = fma(_177, 0.75, 7.4999996286351233720779418945312e-05);
    float _259 = _177 + 9.9999997473787516355514526367188e-05;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = -_255;
    float _267 = _265 + 1.0;
    float _269 = _231 * _249;
    float _271 = 1.0 / _207;
    float _273 = _217 * _237;
    float _275 = fma(_139, 0.75, 7.4999996286351233720779418945312e-05);
    float _277 = -_225;
    float _279 = _277 + 1.0;
    float _281 = _273 * _267;
    float _283 = -_275;
    float _285 = _283 + 1.0;
    float _287 = _221 * _279;
    float _289 = _243 * _251;
    float _291 = _213 + _149;
    float _293 = -_257;
    float _295 = _293 + 1.0;
    float _297 = -_227;
    float _299 = _297 + 1.0;
    float _301 = _289 * _263;
    float _303 = _259 * _271;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _309 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _311 = _309 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _313 = _239 * _299;
    float _315 = _303 * _295;
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _321 = fma(_287, _307, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _323 = fma(_287, _311, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _325 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _327 = _325 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _329 = fma(_287, _319, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _331 = _253 * _285;
    float _333 = fma(_281, _327, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _343 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _345 = _343 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _347 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _349 = _347 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _351 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _353 = _351 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _355 = fma(_281, _337, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _357 = fma(_281, _341, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _359 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _361 = _359 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _363 = fma(_269, _345, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _365 = fma(_331, _349, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _367 = fma(_331, _353, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _369 = fma(_331, _361, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _371 = abs(_71);
    float _373 = -_371;
    float _375 = _373 + 1.0;
    float _377 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _379 = _377 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _381 = _329 + _357;
    float _383 = _375 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _323 + _333;
    float _389 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _391 = _389 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _393 = _321 + _355;
    float _395 = abs(_385);
    float _397 = log2(_395);
    float _399 = fma(_269, _391, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _401 = fma(_269, _379, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _403 = _381 + _363;
    float _405 = _393 + _399;
    float _407 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _409 = _407 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _411 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _413 = _411 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _415 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _417 = _415 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _419 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _421 = _419 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _423 = _387 + _401;
    float _425 = fma(_313, _413, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _427 = _405 + _365;
    float _429 = fma(_301, _409, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _431 = fma(_301, _417, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _433 = fma(_301, _421, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _435 = _397 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _437 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _439 = _437 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _441 = fma(_313, _235, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _443 = _403 + _367;
    float _445 = _427 + _425;
    float _447 = fma(_313, _439, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _449 = _423 + _369;
    float _451 = exp2(_435);
    float _453 = _443 + _441;
    float _455 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _457 = _455 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _459 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _461 = _459 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _463 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _465 = _463 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _467 = _449 + _447;
    float _469 = fma(_315, _457, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _471 = fma(_315, _461, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _473 = fma(_315, _465, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _475 = _445 + _429;
    float _477 = _453 + _431;
    float _479 = _467 + _433;
    float _481 = _173 + _291;
    float _483 = _469 + _475;
    float _485 = _471 + _477;
    float _487 = _473 + _479;
    float _489 = fma(_451, (*spvDescriptorSet0.fp_c4)._m0[0].w, _481);
    float _491 = fma(_451, (*spvDescriptorSet0.fp_c4)._m0[0].x, _483);
    float _493 = fma(_451, (*spvDescriptorSet0.fp_c4)._m0[0].y, _485);
    float _495 = fma(_451, (*spvDescriptorSet0.fp_c4)._m0[0].z, _487);
    out.m_36.x = _491;
    out.m_36.y = _493;
    out.m_36.z = _495;
    out.m_36.w = _489;
    return out;
}

