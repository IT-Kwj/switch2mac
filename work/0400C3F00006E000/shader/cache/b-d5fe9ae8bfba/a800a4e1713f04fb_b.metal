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
    float2 _463 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _75 = _73 + (-0.99989998340606689453125);
    float _77 = _69 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _69 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _69 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = _69 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _93 = _69 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].z, _87);
    float _97 = fma(_89, -0.5, 0.5);
    float _99 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[2].x, _91);
    float _101 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].x, _93);
    float _103 = _97 * _97;
    float _105 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].z, _99);
    float _107 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _109 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _111 = fma(_103, _75, 1.0);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _117 = fma(_109, -0.5, 0.5);
    float _119 = _107 + (-0.99989998340606689453125);
    float _121 = _113 * _113;
    float _123 = _111 * _111;
    float _125 = _115 + (-0.99989998340606689453125);
    float _127 = _117 * _117;
    float _129 = fma(_121, _119, 1.0);
    float _131 = fma(_95, -0.5, 0.5);
    float _133 = fma(_127, _125, 1.0);
    float _135 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _137 = _129 * _129;
    float _139 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].z, _101);
    float _141 = _131 * _131;
    float _143 = _135 + (-0.99989998340606689453125);
    float _145 = (*spvDescriptorSet0.fp_c5)._m0[4].x * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _147 = fma(_139, -0.5, 0.5);
    float _149 = 1.0 / _137;
    float _151 = fma(_141, _143, 1.0);
    float _153 = 0.0 + _97;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _145 + (-0.99989998340606689453125);
    float _159 = _147 * _147;
    float _161 = _151 * _151;
    float _163 = _155 + _113;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _133 * _133;
    float _169 = fma(_159, _157, 1.0);
    float _171 = 1.0 / _123;
    float _173 = _165 + _117;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = _107 + 9.9999997473787516355514526367188e-05;
    float _179 = _169 * _169;
    float _181 = _73 + 9.9999997473787516355514526367188e-05;
    float _183 = _175 + _131;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_73, 0.75, 7.4999996286351233720779418945312e-05);
    float _189 = _177 * _149;
    float _191 = 1.0 / _179;
    float _193 = fma(_115, 0.75, 7.4999996286351233720779418945312e-05);
    float _195 = _135 + 9.9999997473787516355514526367188e-05;
    float _197 = fma(_135, 0.75, 7.4999996286351233720779418945312e-05);
    float _199 = abs(_71);
    float _201 = -_199;
    float _203 = _201 + 1.0;
    float _205 = -_193;
    float _207 = _205 + 1.0;
    float _209 = _147 + _185;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = 1.0 / _161;
    float _215 = _181 * _171;
    float _217 = fma(_107, 0.75, 7.4999996286351233720779418945312e-05);
    float _219 = -_187;
    float _221 = _219 + 1.0;
    float _223 = _203 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _215 * _221;
    float _229 = 1.0 / _167;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _235 = _195 * _213;
    float _237 = _115 + 9.9999997473787516355514526367188e-05;
    float _239 = fma(_145, 0.75, 7.4999996286351233720779418945312e-05);
    float _241 = _145 + 9.9999997473787516355514526367188e-05;
    float _243 = abs(_225);
    float _245 = log2(_243);
    float _247 = _241 * _191;
    float _249 = -_197;
    float _251 = _249 + 1.0;
    float _253 = _237 * _229;
    float _255 = -_239;
    float _257 = _255 + 1.0;
    float _259 = -_217;
    float _261 = _259 + 1.0;
    float _263 = _235 * _251;
    float _265 = _253 * _207;
    float _267 = _189 * _261;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _277 = _247 * _257;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _283 = fma(_227, _271, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _291 = fma(_227, _233, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_227, _275, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_267, _281, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _301 = fma(_267, _289, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _303 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _305 = _303 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _307 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _309 = _307 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _315 = fma(_267, _305, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _321 = fma(_265, _309, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _323 = fma(_265, _313, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _325 = _285 + _299;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = fma(_265, _319, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _343 = _327 + _321;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = fma(_263, _333, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _349 = fma(_263, _337, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _351 = fma(_263, _341, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _353 = _245 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _355 = _293 + _301;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = _297 + _315;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _357 + _323;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = exp2(_353);
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _373 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _375 = _373 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _377 = _361 + _329;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _383 = _381 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _385 = fma(_277, _371, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _387 = fma(_277, _375, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _389 = _345 + _347;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = fma(_277, _383, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _395 = _365 + _349;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _379 + _351;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = _385 + _391;
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = _387 + _397;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _393 + _401;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = fma(_367, (*spvDescriptorSet0.fp_c4)._m0[0].w, _211);
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = fma(_367, (*spvDescriptorSet0.fp_c4)._m0[0].x, _405);
    float _421 = precise::clamp(_419, 0.0, 1.0);
    float _423 = fma(_367, (*spvDescriptorSet0.fp_c4)._m0[0].y, _409);
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = fma(_367, (*spvDescriptorSet0.fp_c4)._m0[0].z, _413);
    float _429 = precise::clamp(_427, 0.0, 1.0);
    out.m_36.x = _421;
    out.m_36.y = _425;
    out.m_36.z = _429;
    out.m_36.w = _417;
    return out;
}

