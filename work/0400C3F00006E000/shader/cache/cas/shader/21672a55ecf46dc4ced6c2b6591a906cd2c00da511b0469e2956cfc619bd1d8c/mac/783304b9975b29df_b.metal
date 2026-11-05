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
    float2 _443 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_443, float2(0.0), isnan(_443))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _105 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _107 = -_75;
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _111 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _113 = -_75;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _117 = fma(_93, -0.5, 0.5);
    float _119 = fma(_97, -0.5, 0.5);
    float _121 = fma(_99, -0.5, 0.5);
    float _123 = fma(_103, -0.5, 0.5);
    float _125 = fma(_105, -0.5, 0.5);
    float _127 = fma(_109, -0.5, 0.5);
    float _129 = fma(_111, -0.5, 0.5);
    float _131 = fma(_115, -0.5, 0.5);
    float2 _569 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).x;
    float2 _578 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float2 _588 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_588, float2(0.0), isnan(_588))).x;
    float2 _597 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _607 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float2 _616 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).x;
    float2 _626 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _635 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float _149 = 0.0 + _117;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = 0.0 + _119;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = abs(_75);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = _151 + _121;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = _155 + _123;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _165 + _125;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _177 = _175 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _179 = _129 + _173;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _191 = _169 + _127;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _203 = _161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _211 = abs(_205);
    float _213 = log2(_211);
    float _215 = _131 + _193;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = fma(_133, _197, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_133, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_133, _185, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_197, _135, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_177, _135, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_185, _135, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_137, _189, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _245 = fma(_137, _201, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _247 = fma(_137, _209, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _249 = fma(_209, _139, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _251 = _221 + _243;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _225 + _245;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = fma(_189, _139, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _261 = fma(_201, _139, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _263 = _229 + _247;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _233 + _259;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _273 = _271 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _275 = _237 + _261;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _283 = _241 + _249;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _291 = fma(_141, _273, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _293 = fma(_141, _281, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _295 = fma(_273, _143, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _297 = fma(_141, _289, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _299 = _213 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _301 = _257 + _293;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = _253 + _291;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = _265 + _297;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = fma(_281, _143, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _315 = fma(_289, _143, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _317 = _269 + _295;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    float _321 = exp2(_299);
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _327 = _277 + _313;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _335 = _285 + _315;
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _343 = fma(_145, _325, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _345 = fma(_145, _333, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _347 = fma(_325, _147, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _349 = fma(_145, _341, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _351 = fma(_333, _147, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _353 = fma(_341, _147, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _355 = _343 + _307;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = _349 + _311;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = _347 + _319;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = _345 + _303;
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = _351 + _329;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _353 + _337;
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].w, _181);
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].w, _217);
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].x, _357);
    float _389 = precise::clamp(_387, 0.0, 1.0);
    float _391 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].y, _369);
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].z, _361);
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].x, _365);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].y, _373);
    float _405 = precise::clamp(_403, 0.0, 1.0);
    float _407 = fma(_321, (*spvDescriptorSet0.fp_c4)._m0[0].z, _377);
    float _409 = precise::clamp(_407, 0.0, 1.0);
    out.m_38.x = _389;
    out.m_38.y = _393;
    out.m_38.z = _397;
    out.m_38.w = _381;
    out.m_40.x = _401;
    out.m_40.y = _405;
    out.m_40.z = _409;
    out.m_40.w = _385;
    return out;
}

