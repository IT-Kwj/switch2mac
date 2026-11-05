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
    float2 _497 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_497, float2(0.0), isnan(_497))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = _73 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].x, _87);
    float _103 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _105 = fma(_93, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = -_75;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _113 = fma(_103, -0.5, 0.5);
    float2 _599 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_599, float2(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_599, float2(0.0), isnan(_599))).x;
    float2 _608 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_608, float2(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_608, float2(0.0), isnan(_608))).x;
    float _119 = fma(_111, -0.5, 0.5);
    float2 _620 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float _123 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float2 _641 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float _131 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _99);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = fma(_127, -0.5, 0.5);
    float _137 = -_75;
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c4)._m0[4].z, _99);
    float _141 = fma(_131, -0.5, 0.5);
    float2 _669 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_669, float2(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_669, float2(0.0), isnan(_669))).x;
    float2 _678 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float _147 = fma(_139, -0.5, 0.5);
    float _149 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[5].z, _101);
    float2 _695 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float _153 = -_75;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[5].z, _101);
    float2 _711 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float _159 = fma(_149, -0.5, 0.5);
    float _161 = fma(_155, -0.5, 0.5);
    float2 _725 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_725, float2(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_725, float2(0.0), isnan(_725))).x;
    float2 _734 = float2(_161, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_734, float2(0.0), isnan(_734))).x;
    float _167 = _105 + _113;
    float _169 = _107 + _119;
    float _171 = abs(_75);
    float _173 = -_171;
    float _175 = _173 + 1.0;
    float _177 = _169 + _135;
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _183 = _167 + _133;
    float _185 = _175 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _193 = _183 + _141;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _199 = _159 + _193;
    float _201 = abs(_187);
    float _203 = log2(_201);
    float _205 = abs(_115);
    float _207 = log2(_205);
    float _209 = abs(_117);
    float _211 = log2(_209);
    float _213 = abs(_121);
    float _215 = log2(_213);
    float _217 = _207 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _219 = abs(_129);
    float _221 = log2(_219);
    float _223 = _211 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _225 = _215 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _227 = exp2(_217);
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _233 = _221 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _235 = exp2(_223);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _245 = exp2(_225);
    float _247 = fma(_227, _239, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _249 = exp2(_233);
    float _251 = fma(_227, _181, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _253 = fma(_181, _235, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _255 = fma(_227, _243, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _257 = fma(_239, _235, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _259 = fma(_243, _235, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _261 = abs(_143);
    float _263 = log2(_261);
    float _265 = fma(_245, _231, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _267 = fma(_245, _191, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _269 = fma(_245, _197, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _271 = _251 + _265;
    float _273 = _247 + _267;
    float _275 = abs(_145);
    float _277 = log2(_275);
    float _279 = fma(_231, _249, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _281 = fma(_191, _249, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _283 = fma(_197, _249, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _285 = _255 + _269;
    float _287 = _253 + _279;
    float _289 = _177 + _147;
    float _291 = _263 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _293 = abs(_151);
    float _295 = log2(_293);
    float _297 = _257 + _281;
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _303 = _259 + _283;
    float _305 = _161 + _289;
    float _307 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _309 = _307 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _311 = _277 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _313 = exp2(_291);
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _319 = abs(_157);
    float _321 = log2(_319);
    float _323 = _295 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _325 = exp2(_311);
    float _327 = fma(_313, _301, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _329 = fma(_313, _309, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _331 = fma(_313, _317, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _333 = _271 + _327;
    float _335 = _273 + _329;
    float _337 = _285 + _331;
    float _339 = exp2(_323);
    float _341 = _321 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _343 = abs(_163);
    float _345 = log2(_343);
    float _347 = fma(_301, _325, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _349 = fma(_309, _325, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _351 = fma(_317, _325, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _353 = _297 + _349;
    float _355 = abs(_165);
    float _357 = log2(_355);
    float _359 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _361 = _359 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _363 = _287 + _347;
    float _365 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _367 = _365 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _373 = fma(_339, _361, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _375 = _303 + _351;
    float _377 = fma(_339, _367, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _379 = exp2(_341);
    float _381 = _345 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _383 = fma(_339, _371, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _385 = _333 + _373;
    float _387 = _337 + _377;
    float _389 = _335 + _383;
    float _391 = _357 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _393 = exp2(_381);
    float _395 = fma(_361, _379, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _397 = exp2(_391);
    float _399 = _203 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _401 = fma(_371, _379, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _403 = fma(_367, _379, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _405 = _363 + _395;
    float _407 = exp2(_399);
    float _409 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _411 = _409 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _413 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _415 = _413 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _417 = _353 + _401;
    float _419 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _421 = _419 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _423 = fma(_393, _411, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _425 = fma(_393, _415, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _427 = _375 + _403;
    float _429 = fma(_411, _397, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _431 = fma(_393, _421, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _433 = fma(_415, _397, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _435 = fma(_421, _397, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _437 = _429 + _405;
    float _439 = _423 + _385;
    float _441 = _425 + _389;
    float _443 = _431 + _387;
    float _445 = _433 + _417;
    float _447 = _435 + _427;
    float _449 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].w, _199);
    float _451 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].w, _305);
    float _453 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].x, _439);
    float _455 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].y, _441);
    float _457 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].z, _443);
    float _459 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].x, _437);
    float _461 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].y, _445);
    float _463 = fma(_407, (*spvDescriptorSet0.fp_c4)._m0[0].z, _447);
    out.m_38.x = _453;
    out.m_38.y = _455;
    out.m_38.z = _457;
    out.m_38.w = _449;
    out.m_40.x = _459;
    out.m_40.y = _461;
    out.m_40.z = _463;
    out.m_40.w = _451;
    return out;
}

