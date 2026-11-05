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
    float2 _399 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _85 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _75);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _95 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _83);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _85);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _105 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = fma(_101, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float2 _514 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_514, float2(0.0), isnan(_514))).x;
    float2 _524 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_524, float2(0.0), isnan(_524))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_524, float2(0.0), isnan(_524))).x;
    float _121 = fma(_115, -0.5, 0.5);
    float _123 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _97);
    float2 _541 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541))).x;
    float2 _551 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_551, float2(0.0), isnan(_551))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_551, float2(0.0), isnan(_551))).x;
    float _129 = fma(_123, -0.5, 0.5);
    float2 _563 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float2 _573 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
    float _135 = 0.0 + _109;
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = abs(_73);
    float _141 = -_139;
    float _143 = _141 + 1.0;
    float _145 = _137 + _113;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = _147 + _107;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _161 = _155 + _111;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _173 = _163 + _121;
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = abs(_151);
    float _179 = log2(_177);
    float _181 = _129 + _175;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _197 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _199 = _197 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _201 = fma(_117, _159, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = fma(_117, _167, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_119, _187, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _211 = fma(_119, _191, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _213 = fma(_119, _195, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _215 = _203 + _209;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = fma(_117, _171, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _207 + _211;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _231 = _221 + _213;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _239 = fma(_125, _229, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _245 = fma(_125, _237, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _247 = _217 + _239;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_125, _199, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _257 = _225 + _245;
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_127, _243, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _267 = _233 + _251;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_127, _265, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _273 = fma(_127, _255, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _275 = _259 + _261;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _283 = _249 + _271;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _269 + _273;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _295 = _179 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _297 = fma(_131, _281, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _299 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _301 = _299 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _303 = fma(_131, _293, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _305 = _277 + _297;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = fma(_131, _301, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _311 = exp2(_295);
    float _313 = _285 + _309;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _325 = _289 + _303;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    float _329 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _331 = _329 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _333 = fma(_133, _319, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _335 = fma(_133, _323, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _337 = fma(_133, _331, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _339 = _333 + _315;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = _335 + _307;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = _337 + _327;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].w, _183);
    float _353 = precise::clamp(_351, 0.0, 1.0);
    float _355 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].x, _341);
    float _357 = precise::clamp(_355, 0.0, 1.0);
    float _359 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].y, _345);
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = fma(_311, (*spvDescriptorSet0.fp_c4)._m0[0].z, _349);
    float _365 = precise::clamp(_363, 0.0, 1.0);
    out.m_38.x = _357;
    out.m_38.y = _361;
    out.m_38.z = _365;
    out.m_38.w = _353;
    return out;
}

