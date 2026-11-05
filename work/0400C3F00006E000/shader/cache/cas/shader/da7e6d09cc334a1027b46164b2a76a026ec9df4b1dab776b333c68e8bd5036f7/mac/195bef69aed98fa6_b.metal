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
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _93 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _95 = fma(_87, -0.5, 0.5);
    float _97 = fma(_89, -0.5, 0.5);
    float _99 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _91);
    float _101 = fma(_93, -0.5, 0.5);
    float _103 = abs(_95);
    float _105 = log2(_103);
    float _107 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _109 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _99);
    float _111 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _113 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _107);
    float _117 = fma(_109, -0.5, 0.5);
    float _119 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _111);
    float _121 = abs(_97);
    float _123 = log2(_121);
    float _125 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _115);
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _119);
    float _129 = fma(_125, -0.5, 0.5);
    float _131 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _113);
    float _133 = fma(_127, -0.5, 0.5);
    float _135 = abs(_101);
    float _137 = log2(_135);
    float _139 = _105 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _141 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _131);
    float _143 = fma(_141, -0.5, 0.5);
    float _145 = _123 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _147 = exp2(_139);
    float _149 = _137 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _151 = abs(_117);
    float _153 = log2(_151);
    float _155 = exp2(_145);
    float _157 = abs(_129);
    float _159 = log2(_157);
    float2 _610 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float _163 = _153 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _165 = exp2(_149);
    float2 _626 = float2(_155, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float _169 = abs(_133);
    float _171 = log2(_169);
    float _173 = _159 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _175 = exp2(_163);
    float2 _646 = float2(_165, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _179 = exp2(_173);
    float _181 = _171 * (*spvDescriptorSet0.fp_c5)._m0[5].x;
    float _183 = abs(_143);
    float _185 = log2(_183);
    float2 _666 = float2(_175, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float _189 = exp2(_181);
    float2 _678 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float _193 = _185 * (*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _195 = exp2(_193);
    float2 _694 = float2(_189, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_694, float2(0.0), isnan(_694))).x;
    float2 _704 = float2(_195, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_704, float2(0.0), isnan(_704))).x;
    float _201 = _95 + _97;
    float _203 = abs(_73);
    float _205 = -_203;
    float _207 = _205 + 1.0;
    float _209 = _201 + _101;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _215 = _209 + _117;
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _225 = _215 + _129;
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _235 = _225 + _133;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _241 = _207 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _143 + _235;
    float _247 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _249 = _247 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _251 = abs(_243);
    float _253 = log2(_251);
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _259 = fma(_161, _213, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _261 = fma(_161, _229, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _263 = fma(_161, _239, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _265 = fma(_167, _219, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _267 = fma(_167, _249, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _269 = fma(_167, _257, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _271 = _259 + _265;
    float _273 = _261 + _267;
    float _275 = _263 + _269;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _281 = fma(_177, _279, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _283 = fma(_177, _223, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _285 = fma(_177, _233, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _287 = _271 + _281;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _293 = _275 + _285;
    float _295 = _273 + _283;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _301 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _303 = _301 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _309 = fma(_187, _291, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _311 = fma(_187, _299, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _313 = fma(_187, _303, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _315 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _317 = _315 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _319 = _287 + _309;
    float _321 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _323 = _321 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _325 = _293 + _313;
    float _327 = _295 + _311;
    float _329 = fma(_191, _307, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _331 = fma(_191, _317, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _333 = fma(_191, _323, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _335 = _319 + _329;
    float _337 = _327 + _331;
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _343 = _325 + _333;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _349 = _253 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _351 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _353 = _351 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _355 = fma(_197, _347, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _357 = fma(_197, _341, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _359 = fma(_197, _353, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _361 = exp2(_349);
    float _363 = _335 + _355;
    float _365 = _337 + _357;
    float _367 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _369 = _367 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _371 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _373 = _371 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _375 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _377 = _375 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _379 = _343 + _359;
    float _381 = fma(_199, _369, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _383 = fma(_199, _373, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _385 = fma(_199, _377, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _387 = _381 + _363;
    float _389 = _385 + _365;
    float _391 = _383 + _379;
    float _393 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].w, _245);
    float _395 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].x, _387);
    float _397 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].y, _389);
    float _399 = fma(_361, (*spvDescriptorSet0.fp_c4)._m0[0].z, _391);
    out.m_38.x = _395;
    out.m_38.y = _397;
    out.m_38.z = _399;
    out.m_38.w = _393;
    return out;
}

