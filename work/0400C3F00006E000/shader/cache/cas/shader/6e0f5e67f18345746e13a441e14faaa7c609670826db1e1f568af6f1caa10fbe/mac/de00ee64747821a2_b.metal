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
    float2 _499 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499))).xyz;
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
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _101 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _87);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float _109 = fma(_103, -0.5, 0.5);
    float _111 = fma(_105, -0.5, 0.5);
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _115 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float2 _620 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float2 _630 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_630, float2(0.0), isnan(_630))).x;
    float _121 = fma(_113, -0.5, 0.5);
    float _123 = fma(_115, -0.5, 0.5);
    float _125 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _97);
    float _127 = fma(_107, -0.5, 0.5);
    float _129 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _101);
    float2 _656 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_656, float2(0.0), isnan(_656))).x;
    float2 _666 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _135 = fma(_125, -0.5, 0.5);
    float _137 = fma(_129, -0.5, 0.5);
    float2 _680 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_680, float2(0.0), isnan(_680))).x;
    float2 _690 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).x;
    float2 _700 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700))).x;
    float _145 = 0.0 + _109;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = abs(_73);
    float _151 = -_149;
    float _153 = _151 + 1.0;
    float _155 = _147 + _111;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _163 = _153 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _157 + _123;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _173 = _171 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _179 = _169 + _121;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = abs(_165);
    float _185 = log2(_183);
    float _187 = _181 + _135;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _195 = _189 + _127;
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _203 = _185 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _205 = _137 + _197;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = abs(_117);
    float _211 = log2(_209);
    float _213 = abs(_119);
    float _215 = log2(_213);
    float _217 = _211 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _219 = abs(_131);
    float _221 = log2(_219);
    float _223 = _215 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _225 = exp2(_217);
    float _227 = exp2(_223);
    float _229 = abs(_133);
    float _231 = log2(_229);
    float _233 = fma(_225, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _221 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _239 = fma(_225, _173, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_225, _161, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = exp2(_237);
    float _249 = fma(_227, _201, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _251 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _253 = _251 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _255 = fma(_227, _193, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _257 = _241 + _249;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_227, _253, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _263 = abs(_139);
    float _265 = log2(_263);
    float _267 = _231 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _269 = _235 + _261;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _281 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _283 = _281 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _285 = _245 + _255;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = exp2(_267);
    float _291 = fma(_247, _279, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _293 = fma(_247, _275, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _295 = fma(_247, _283, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _297 = _259 + _291;
    float _299 = precise::clamp(_297, 0.0, 1.0);
    float _301 = _271 + _293;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = abs(_141);
    float _307 = log2(_305);
    float _309 = _265 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _323 = _287 + _295;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = exp2(_309);
    float _329 = fma(_289, _313, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _331 = fma(_289, _321, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _333 = _299 + _329;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = fma(_289, _317, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _343 = abs(_143);
    float _345 = log2(_343);
    float _347 = _307 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _349 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _351 = _349 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _353 = _325 + _331;
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _359 = _357 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _361 = _303 + _337;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = exp2(_347);
    float _367 = fma(_327, _341, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _369 = fma(_327, _351, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _371 = fma(_327, _359, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _373 = _335 + _367;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _379 = _377 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _381 = _345 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _383 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _385 = _383 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _387 = _355 + _369;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _393 = _391 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _395 = _363 + _371;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = exp2(_381);
    float _401 = fma(_365, _379, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _403 = fma(_365, _393, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _405 = fma(_365, _385, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _407 = _375 + _401;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = exp2(_203);
    float _413 = _397 + _403;
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _419 = _417 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _421 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _423 = _421 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _425 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _427 = _425 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _429 = _389 + _405;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = fma(_399, _419, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _435 = fma(_399, _423, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _437 = fma(_399, _427, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _439 = _433 + _409;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = _435 + _415;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _437 + _431;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_411, (*spvDescriptorSet0.fp_c4)._m0[0].w, _207);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_411, (*spvDescriptorSet0.fp_c4)._m0[0].x, _441);
    float _457 = precise::clamp(_455, 0.0, 1.0);
    float _459 = fma(_411, (*spvDescriptorSet0.fp_c4)._m0[0].y, _445);
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = fma(_411, (*spvDescriptorSet0.fp_c4)._m0[0].z, _449);
    float _465 = precise::clamp(_463, 0.0, 1.0);
    out.m_38.x = _457;
    out.m_38.y = _461;
    out.m_38.z = _465;
    out.m_38.w = _453;
    return out;
}

