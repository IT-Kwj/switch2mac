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
    float2 _447 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_447, float2(0.0), isnan(_447))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _89);
    float _99 = fma(_91, -0.5, 0.5);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float _105 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _107 = abs(_99);
    float _109 = log2(_107);
    float _111 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _113 = fma(_97, -0.5, 0.5);
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _105);
    float _117 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _115);
    float _119 = abs(_101);
    float _121 = log2(_119);
    float _123 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _111);
    float _125 = fma(_117, -0.5, 0.5);
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _123);
    float _129 = abs(_103);
    float _131 = log2(_129);
    float _133 = _109 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _135 = fma(_127, -0.5, 0.5);
    float _137 = _121 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _139 = exp2(_133);
    float _141 = _131 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _143 = exp2(_137);
    float _145 = abs(_113);
    float _147 = log2(_145);
    float2 _603 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_603, float2(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_603, float2(0.0), isnan(_603))).x;
    float _151 = exp2(_141);
    float2 _615 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float _155 = abs(_125);
    float _157 = log2(_155);
    float _159 = _147 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _161 = exp2(_159);
    float2 _635 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float _165 = abs(_135);
    float _167 = log2(_165);
    float _169 = _157 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _171 = exp2(_169);
    float2 _655 = float2(_161, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655))).x;
    float _175 = _167 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _177 = exp2(_175);
    float2 _671 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_671, float2(0.0), isnan(_671))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_671, float2(0.0), isnan(_671))).x;
    float2 _681 = float2(_177, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_681, float2(0.0), isnan(_681))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_681, float2(0.0), isnan(_681))).x;
    float _183 = 0.0 + _99;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = abs(_73);
    float _189 = -_187;
    float _191 = _189 + 1.0;
    float _193 = _185 + _101;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _201 = _191 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _195 + _103;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _211 = _209 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _213 = _207 + _113;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _221 = _215 + _125;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _229 = abs(_203);
    float _231 = log2(_229);
    float _233 = _135 + _223;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _249 = fma(_149, _211, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_149, _239, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_149, _247, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_153, _219, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _263 = fma(_153, _227, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _265 = fma(_153, _199, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _267 = _251 + _261;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _255 + _263;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = _259 + _265;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _283 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _285 = _283 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _295 = fma(_163, _281, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _297 = fma(_163, _285, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _299 = fma(_163, _243, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _301 = _269 + _295;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = _273 + _297;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _277 + _299;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _315 = _313 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _317 = fma(_173, _315, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _319 = fma(_173, _293, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _321 = fma(_173, _289, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _323 = _303 + _317;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = _307 + _319;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _335 = _311 + _321;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _343 = _231 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _349 = fma(_179, _333, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _351 = fma(_179, _341, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _353 = fma(_179, _347, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _355 = exp2(_343);
    float _357 = _325 + _349;
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = _329 + _351;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _367 = _365 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _373 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _375 = _373 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _377 = _337 + _353;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_181, _367, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _383 = fma(_181, _371, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _385 = fma(_181, _375, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _387 = _381 + _359;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = _383 + _363;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _385 + _379;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].w, _235);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].x, _389);
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].y, _393);
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = fma(_355, (*spvDescriptorSet0.fp_c4)._m0[0].z, _397);
    float _413 = precise::clamp(_411, 0.0, 1.0);
    out.m_38.x = _405;
    out.m_38.y = _409;
    out.m_38.z = _413;
    out.m_38.w = _401;
    return out;
}

