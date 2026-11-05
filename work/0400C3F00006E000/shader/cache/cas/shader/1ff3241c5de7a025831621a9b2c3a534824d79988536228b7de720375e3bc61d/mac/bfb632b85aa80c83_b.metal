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
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _85);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _97 = fma(_89, -0.5, 0.5);
    float _99 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _101 = abs(_93);
    float _103 = log2(_101);
    float _105 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _95);
    float _107 = fma(_91, -0.5, 0.5);
    float _109 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _99);
    float _111 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _105);
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _109);
    float _115 = abs(_97);
    float _117 = log2(_115);
    float _119 = fma(_111, -0.5, 0.5);
    float _121 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _123 = fma(_113, -0.5, 0.5);
    float _125 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _121);
    float _127 = abs(_119);
    float _129 = log2(_127);
    float _131 = _103 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _133 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _125);
    float _135 = fma(_133, -0.5, 0.5);
    float _137 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _139 = _71 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _141 = _117 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _143 = exp2(_131);
    float _145 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _137);
    float _147 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _145);
    float _149 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[8].x, _139);
    float _151 = _129 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _153 = abs(_123);
    float _155 = log2(_153);
    float _157 = fma(_147, -0.5, 0.5);
    float _159 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[8].z, _149);
    float _161 = fma(_159, -0.5, 0.5);
    float _163 = exp2(_141);
    float2 _666 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _167 = abs(_135);
    float _169 = log2(_167);
    float _171 = _155 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _173 = exp2(_151);
    float2 _686 = float2(_163, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float _177 = abs(_107);
    float _179 = log2(_177);
    float _181 = _169 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _183 = exp2(_171);
    float2 _706 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
    float _187 = abs(_157);
    float _189 = log2(_187);
    float _191 = _179 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _193 = exp2(_181);
    float2 _726 = float2(_183, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float _197 = abs(_161);
    float _199 = log2(_197);
    float _201 = _189 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _203 = exp2(_191);
    float2 _746 = float2(_193, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float _207 = exp2(_201);
    float _209 = _199 * (*spvDescriptorSet0.fp_c5)._m0[7].x;
    float2 _762 = float2(_203, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float _213 = exp2(_209);
    float2 _774 = float2(_207, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_774, float2(0.0), isnan(_774))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_774, float2(0.0), isnan(_774))).x;
    float2 _784 = float2(_213, (*spvDescriptorSet0.fp_c5)._m0[15].x);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_784, float2(0.0), isnan(_784))).x;
    float _219 = _93 + _97;
    float _221 = abs(_73);
    float _223 = -_221;
    float _225 = _223 + 1.0;
    float _227 = _219 + _119;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _233 = _225 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _227 + _123;
    float _239 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _241 = _239 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _243 = _237 + _135;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _249 = abs(_235);
    float _251 = log2(_249);
    float _253 = _243 + _107;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _259 = _253 + _157;
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _265 = _161 + _259;
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _271 = fma(_165, _241, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _273 = fma(_165, _263, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _275 = fma(_165, _257, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _277 = fma(_175, _231, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _279 = fma(_175, _247, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _281 = fma(_175, _269, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _283 = _271 + _277;
    float _285 = _273 + _279;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _299 = _275 + _281;
    float _301 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _303 = _301 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _309 = fma(_185, _289, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _311 = fma(_185, _293, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _313 = fma(_185, _297, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _315 = _283 + _309;
    float _317 = _285 + _311;
    float _319 = _299 + _313;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _325 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _327 = _325 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _329 = fma(_195, _323, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _331 = fma(_195, _303, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _333 = fma(_195, _307, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _335 = _317 + _331;
    float _337 = _315 + _329;
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _343 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _345 = _343 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _347 = _319 + _333;
    float _349 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _351 = _349 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _353 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _355 = _353 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _357 = fma(_205, _341, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _359 = fma(_205, _345, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _361 = fma(_205, _351, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _363 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _367 = _335 + _357;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _373 = _337 + _359;
    float _375 = _347 + _361;
    float _377 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _379 = _377 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _381 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _383 = _381 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _385 = fma(_211, _355, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _387 = fma(_211, _365, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _389 = fma(_211, _371, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _391 = _373 + _385;
    float _393 = _251 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _395 = _375 + _389;
    float _397 = _367 + _387;
    float _399 = fma(_215, _379, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _401 = fma(_215, _383, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _403 = fma(_215, _327, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _405 = exp2(_393);
    float _407 = _391 + _399;
    float _409 = -(*spvDescriptorSet0.fp_c5)._m0[30].x;
    float _411 = _409 + (*spvDescriptorSet0.fp_c5)._m0[31].x;
    float _413 = _397 + _401;
    float _415 = -(*spvDescriptorSet0.fp_c5)._m0[30].y;
    float _417 = _415 + (*spvDescriptorSet0.fp_c5)._m0[31].y;
    float _419 = _395 + _403;
    float _421 = -(*spvDescriptorSet0.fp_c5)._m0[30].z;
    float _423 = _421 + (*spvDescriptorSet0.fp_c5)._m0[31].z;
    float _425 = fma(_217, _411, (*spvDescriptorSet0.fp_c5)._m0[30].x);
    float _427 = fma(_217, _417, (*spvDescriptorSet0.fp_c5)._m0[30].y);
    float _429 = fma(_217, _423, (*spvDescriptorSet0.fp_c5)._m0[30].z);
    float _431 = _425 + _407;
    float _433 = _427 + _413;
    float _435 = _429 + _419;
    float _437 = fma(_405, (*spvDescriptorSet0.fp_c4)._m0[0].w, _265);
    float _439 = fma(_405, (*spvDescriptorSet0.fp_c4)._m0[0].x, _431);
    float _441 = fma(_405, (*spvDescriptorSet0.fp_c4)._m0[0].y, _433);
    float _443 = fma(_405, (*spvDescriptorSet0.fp_c4)._m0[0].z, _435);
    out.m_38.x = _439;
    out.m_38.y = _441;
    out.m_38.z = _443;
    out.m_38.w = _437;
    return out;
}

