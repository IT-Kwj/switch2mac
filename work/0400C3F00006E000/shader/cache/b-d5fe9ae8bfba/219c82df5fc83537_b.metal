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
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _477 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _77 = (*spvDescriptorSet0.fp_c5)._m0[1].x * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _79 = fma(_75, 0.75, 7.4999996286351233720779418945312e-05);
    float _81 = _75 + 9.9999997473787516355514526367188e-05;
    float _83 = fma(_77, 0.75, 7.4999996286351233720779418945312e-05);
    float _85 = (*spvDescriptorSet0.fp_c5)._m0[2].x * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _87 = -_79;
    float _89 = _87 + 1.0;
    float _91 = _75 + (-0.99989998340606689453125);
    float _93 = -_83;
    float _95 = _93 + 1.0;
    float _97 = fma(_85, 0.75, 7.4999996286351233720779418945312e-05);
    float _99 = _81 * _89;
    float _101 = _77 + 9.9999997473787516355514526367188e-05;
    float _103 = _77 + (-0.99989998340606689453125);
    float _105 = -_97;
    float _107 = _105 + 1.0;
    float _109 = _101 * _95;
    float _111 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _113 = _111 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _115 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _117 = _115 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _119 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _121 = _119 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _123 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _125 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _127 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _129 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _123);
    float _131 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _125);
    float _133 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _127);
    float _135 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _129);
    float _137 = -_73;
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[1].z, _129);
    float _141 = _85 + 9.9999997473787516355514526367188e-05;
    float _143 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _131);
    float _145 = fma(_135, -0.5, 0.5);
    float _147 = fma(_139, -0.5, 0.5);
    float _149 = -_73;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c4)._m0[2].z, _131);
    float _153 = _141 * _107;
    float _155 = _145 * _145;
    float _157 = _147 * _147;
    float _159 = fma(_151, -0.5, 0.5);
    float _161 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _133);
    float _163 = fma(_155, _91, 1.0);
    float _165 = fma(_91, _157, 1.0);
    float _167 = _163 * _163;
    float _169 = fma(_143, -0.5, 0.5);
    float _171 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _173 = _165 * _165;
    float _175 = _159 * _159;
    float _177 = _169 * _169;
    float _179 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _171);
    float _181 = fma(_161, -0.5, 0.5);
    float _183 = fma(_103, _175, 1.0);
    float _185 = fma(_177, _103, 1.0);
    float _187 = (*spvDescriptorSet0.fp_c5)._m0[3].x * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _189 = -_73;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[3].z, _133);
    float _193 = _85 + (-0.99989998340606689453125);
    float _195 = _181 * _181;
    float _197 = fma(_187, 0.75, 7.4999996286351233720779418945312e-05);
    float _199 = fma(_191, -0.5, 0.5);
    float _201 = _187 + 9.9999997473787516355514526367188e-05;
    float _203 = fma(_195, _193, 1.0);
    float _205 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _179);
    float _207 = _199 * _199;
    float _209 = _187 + (-0.99989998340606689453125);
    float _211 = _203 * _203;
    float _213 = -_73;
    float _215 = fma(_213, (*spvDescriptorSet0.fp_c4)._m0[4].z, _179);
    float _217 = fma(_193, _207, 1.0);
    float _219 = fma(_205, -0.5, 0.5);
    float _221 = -_197;
    float _223 = _221 + 1.0;
    float _225 = fma(_215, -0.5, 0.5);
    float _227 = _217 * _217;
    float _229 = _219 * _219;
    float _231 = _183 * _183;
    float _233 = _225 * _225;
    float _235 = _201 * _223;
    float _237 = fma(_229, _209, 1.0);
    float _239 = 1.0 / _211;
    float _241 = fma(_209, _233, 1.0);
    float _243 = _145 + _169;
    float _245 = _237 * _237;
    float _247 = _185 * _185;
    float _249 = _241 * _241;
    float _251 = abs(_73);
    float _253 = -_251;
    float _255 = _253 + 1.0;
    float _257 = _147 + _159;
    float _259 = 1.0 / _227;
    float _261 = _243 + _181;
    float _263 = _255 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _257 + _199;
    float _269 = _219 + _261;
    float _271 = _225 + _267;
    float _273 = 1.0 / _231;
    float _275 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _277 = _275 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _283 = 1.0 / _245;
    float _285 = _259 * _153;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _291 = 1.0 / _249;
    float _293 = _239 * _153;
    float _295 = _273 * _109;
    float _297 = fma(_293, _281, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _299 = fma(_281, _285, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _301 = 1.0 / _167;
    float _303 = _283 * _235;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _309 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _311 = _309 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _313 = fma(_303, _113, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _315 = 1.0 / _173;
    float _317 = _291 * _235;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _323 = fma(_113, _317, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _325 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _327 = _325 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _329 = 1.0 / _247;
    float _331 = _301 * _99;
    float _333 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _335 = _333 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _337 = fma(_331, _327, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _339 = abs(_265);
    float _341 = log2(_339);
    float _343 = _315 * _99;
    float _345 = fma(_331, _307, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _347 = fma(_307, _343, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _349 = fma(_331, _311, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _351 = fma(_327, _343, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _353 = _329 * _109;
    float _355 = fma(_311, _343, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _357 = fma(_335, _295, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _359 = fma(_353, _335, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _361 = fma(_353, _289, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _363 = fma(_353, _277, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _365 = fma(_289, _295, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _367 = _341 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _369 = _347 + _357;
    float _371 = fma(_277, _295, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _373 = _345 + _359;
    float _375 = exp2(_367);
    float _377 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _379 = _377 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _381 = _337 + _361;
    float _383 = _349 + _363;
    float _385 = _351 + _365;
    float _387 = fma(_293, _379, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _389 = fma(_379, _285, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _391 = fma(_293, _321, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _393 = fma(_321, _285, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _395 = _355 + _371;
    float _397 = _373 + _297;
    float _399 = fma(_303, _117, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _401 = fma(_303, _121, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _403 = _381 + _387;
    float _405 = fma(_117, _317, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _407 = _383 + _391;
    float _409 = _369 + _299;
    float _411 = _385 + _389;
    float _413 = fma(_121, _317, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _415 = _395 + _393;
    float _417 = _313 + _397;
    float _419 = _399 + _403;
    float _421 = _323 + _409;
    float _423 = _401 + _407;
    float _425 = _405 + _411;
    float _427 = _413 + _415;
    float _429 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].x, _417);
    float _431 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].y, _419);
    float _433 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].w, _269);
    float _435 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].w, _271);
    float _437 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].x, _421);
    float _439 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].z, _423);
    float _441 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].y, _425);
    float _443 = fma(_375, (*spvDescriptorSet0.fp_c4)._m0[0].z, _427);
    out.m_36.x = _429;
    out.m_36.y = _431;
    out.m_36.z = _439;
    out.m_36.w = _433;
    out.m_38.x = _437;
    out.m_38.y = _441;
    out.m_38.z = _443;
    out.m_38.w = _435;
    return out;
}

