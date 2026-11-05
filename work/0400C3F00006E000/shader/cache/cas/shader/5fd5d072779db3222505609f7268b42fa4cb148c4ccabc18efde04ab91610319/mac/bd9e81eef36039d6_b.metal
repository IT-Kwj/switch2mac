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
    float2 _433 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float2(0.0), isnan(_433))).xyz;
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
    float _107 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _97);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float _115 = fma(_107, -0.5, 0.5);
    float _117 = fma(_105, -0.5, 0.5);
    float _119 = fma(_109, -0.5, 0.5);
    float2 _558 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float _123 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _125 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _101);
    float _127 = fma(_113, -0.5, 0.5);
    float2 _580 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_580, float2(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_580, float2(0.0), isnan(_580))).x;
    float2 _590 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_590, float2(0.0), isnan(_590))).x;
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = fma(_125, -0.5, 0.5);
    float2 _604 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_604, float2(0.0), isnan(_604))).x;
    float2 _614 = float2(_119, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).x;
    float2 _624 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).x;
    float2 _634 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).x;
    float _145 = _111 + _117;
    float _147 = abs(_73);
    float _149 = -_147;
    float _151 = _149 + 1.0;
    float _153 = _145 + _115;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = _151 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _153 + _133;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _173 = _163 + _119;
    float _175 = abs(_161);
    float _177 = log2(_175);
    float _179 = _173 + _127;
    float _181 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _183 = _181 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _185 = _135 + _179;
    float _187 = abs(_121);
    float _189 = log2(_187);
    float _191 = abs(_129);
    float _193 = log2(_191);
    float _195 = _189 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _197 = abs(_131);
    float _199 = log2(_197);
    float _201 = _193 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _203 = exp2(_195);
    float _205 = exp2(_201);
    float _207 = _199 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _209 = abs(_137);
    float _211 = log2(_209);
    float _213 = fma(_203, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _215 = fma(_203, _167, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _217 = fma(_203, _171, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _219 = exp2(_207);
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _229 = fma(_205, _183, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _231 = fma(_205, _223, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _233 = fma(_205, _227, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _235 = _217 + _229;
    float _237 = abs(_139);
    float _239 = log2(_237);
    float _241 = _211 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _243 = _213 + _231;
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _249 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _251 = _249 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _253 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _255 = _253 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _257 = _215 + _233;
    float _259 = exp2(_241);
    float _261 = fma(_219, _247, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _263 = fma(_219, _255, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _265 = fma(_219, _251, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _267 = _243 + _261;
    float _269 = _235 + _263;
    float _271 = abs(_141);
    float _273 = log2(_271);
    float _275 = _239 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _281 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _283 = _281 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _285 = _257 + _265;
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _291 = exp2(_275);
    float _293 = fma(_259, _279, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _295 = fma(_259, _283, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _297 = fma(_259, _289, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _299 = _269 + _293;
    float _301 = _267 + _295;
    float _303 = abs(_143);
    float _305 = log2(_303);
    float _307 = _273 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _309 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _311 = _309 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _313 = _285 + _297;
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _323 = exp2(_307);
    float _325 = fma(_291, _311, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _327 = fma(_291, _317, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _329 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _331 = _329 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _333 = _299 + _325;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _339 = _305 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _341 = _177 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _343 = _301 + _327;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _349 = fma(_291, _321, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _351 = exp2(_339);
    float _353 = fma(_323, _337, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _355 = fma(_323, _347, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _357 = fma(_323, _331, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _359 = _333 + _353;
    float _361 = exp2(_341);
    float _363 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _365 = _363 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _367 = _343 + _355;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _373 = _313 + _349;
    float _375 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _377 = _375 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _379 = fma(_351, _371, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _381 = _373 + _357;
    float _383 = fma(_351, _365, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _385 = fma(_351, _377, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _387 = _379 + _367;
    float _389 = _383 + _359;
    float _391 = _385 + _381;
    float _393 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].w, _185);
    float _395 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].y, _387);
    float _397 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].x, _389);
    float _399 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].z, _391);
    out.m_38.x = _397;
    out.m_38.y = _395;
    out.m_38.z = _399;
    out.m_38.w = _393;
    return out;
}

