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
    float2 _471 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _75 = _73 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _77 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _69 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _91 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _89);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = _95 + (-0.99989998340606689453125);
    float _105 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].z, _91);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = _101 * _101;
    float _111 = fma(_105, -0.5, 0.5);
    float _113 = fma(_109, _103, 1.0);
    float _115 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _117 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _121 = fma(_97, -0.5, 0.5);
    float _123 = _69 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _125 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _127 = _119 + (-0.99989998340606689453125);
    float _129 = _121 * _121;
    float _131 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[6].x, _123);
    float _133 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _125);
    float _135 = _107 * _107;
    float _137 = fma(_129, _127, 1.0);
    float _139 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[6].z, _131);
    float _141 = fma(_133, -0.5, 0.5);
    float _143 = _113 * _113;
    float _145 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _147 = _115 + (-0.99989998340606689453125);
    float _149 = _141 * _141;
    float _151 = _101 + _141;
    float _153 = _145 + (-0.99989998340606689453125);
    float _155 = fma(_139, -0.5, 0.5);
    float _157 = (*spvDescriptorSet0.fp_c5)._m0[5].x * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _159 = fma(_135, _153, 1.0);
    float _161 = fma(_149, _147, 1.0);
    float _163 = _137 * _137;
    float _165 = _151 + _121;
    float _167 = _159 * _159;
    float _169 = _157 + (-0.99989998340606689453125);
    float _171 = _155 * _155;
    float _173 = (*spvDescriptorSet0.fp_c5)._m0[4].x * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _175 = _161 * _161;
    float _177 = _111 * _111;
    float _179 = fma(_171, _169, 1.0);
    float _181 = _173 + (-0.99989998340606689453125);
    float _183 = 1.0 / _143;
    float _185 = _165 + _107;
    float _187 = _179 * _179;
    float _189 = fma(_177, _181, 1.0);
    float _191 = _145 + 9.9999997473787516355514526367188e-05;
    float _193 = _185 + _111;
    float _195 = _95 + 9.9999997473787516355514526367188e-05;
    float _197 = _189 * _189;
    float _199 = 1.0 / _175;
    float _201 = fma(_95, 0.75, 7.4999996286351233720779418945312e-05);
    float _203 = _119 + 9.9999997473787516355514526367188e-05;
    float _205 = fma(_119, 0.75, 7.4999996286351233720779418945312e-05);
    float _207 = fma(_145, 0.75, 7.4999996286351233720779418945312e-05);
    float _209 = abs(_71);
    float _211 = -_209;
    float _213 = _211 + 1.0;
    float _215 = _155 + _193;
    float _217 = 1.0 / _187;
    float _219 = _195 * _183;
    float _221 = fma(_115, 0.75, 7.4999996286351233720779418945312e-05);
    float _223 = 1.0 / _163;
    float _225 = 1.0 / _197;
    float _227 = 1.0 / _167;
    float _229 = fma(_173, 0.75, 7.4999996286351233720779418945312e-05);
    float _231 = _203 * _223;
    float _233 = -_221;
    float _235 = _233 + 1.0;
    float _237 = _115 + 9.9999997473787516355514526367188e-05;
    float _239 = fma(_157, 0.75, 7.4999996286351233720779418945312e-05);
    float _241 = _157 + 9.9999997473787516355514526367188e-05;
    float _243 = _237 * _199;
    float _245 = _173 + 9.9999997473787516355514526367188e-05;
    float _247 = -_201;
    float _249 = _247 + 1.0;
    float _251 = _241 * _217;
    float _253 = -_205;
    float _255 = _253 + 1.0;
    float _257 = -_207;
    float _259 = _257 + 1.0;
    float _261 = _245 * _225;
    float _263 = -_229;
    float _265 = _263 + 1.0;
    float _267 = _219 * _249;
    float _269 = _243 * _235;
    float _271 = -_239;
    float _273 = _271 + 1.0;
    float _275 = _261 * _265;
    float _277 = _231 * _255;
    float _279 = _251 * _273;
    float _281 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _283 = _281 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _293 = fma(_269, _283, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _295 = fma(_269, _287, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _297 = _213 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = fma(_267, _291, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _303 = _191 * _227;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _309 = _303 * _259;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _323 = abs(_299);
    float _325 = log2(_323);
    float _327 = fma(_267, _307, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _329 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _331 = _329 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _333 = fma(_267, _313, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _335 = fma(_277, _317, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _337 = fma(_277, _321, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _343 = fma(_277, _331, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _345 = _327 + _293;
    float _347 = fma(_269, _341, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _349 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _351 = _349 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _353 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _355 = _353 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _357 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _359 = _357 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _361 = _333 + _295;
    float _363 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _367 = _301 + _347;
    float _369 = fma(_309, _351, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _371 = _345 + _335;
    float _373 = fma(_275, _355, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _375 = fma(_275, _359, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _377 = fma(_275, _365, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _379 = _361 + _337;
    float _381 = _325 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _383 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _385 = _383 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _387 = _367 + _343;
    float _389 = _379 + _369;
    float _391 = fma(_309, _385, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _393 = fma(_309, _75, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _395 = exp2(_381);
    float _397 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _399 = _397 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _401 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _403 = _401 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _405 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _407 = _405 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _409 = _371 + _391;
    float _411 = _387 + _393;
    float _413 = fma(_279, _399, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _415 = fma(_279, _403, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _417 = fma(_279, _407, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _419 = _409 + _373;
    float _421 = _389 + _375;
    float _423 = _411 + _377;
    float _425 = _413 + _419;
    float _427 = _415 + _421;
    float _429 = _417 + _423;
    float _431 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].w, _215);
    float _433 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].x, _425);
    float _435 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].y, _427);
    float _437 = fma(_395, (*spvDescriptorSet0.fp_c4)._m0[0].z, _429);
    out.m_36.x = _433;
    out.m_36.y = _435;
    out.m_36.z = _437;
    out.m_36.w = _431;
    return out;
}

