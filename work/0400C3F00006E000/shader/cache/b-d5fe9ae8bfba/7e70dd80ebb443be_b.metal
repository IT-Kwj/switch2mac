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
    float2 _413 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _71 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _87 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].x, _77);
    float _89 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _95 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _97 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[5].z, _87);
    float _99 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _101 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _103 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = _71 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _113 = fma(_101, -0.5, 0.5);
    float2 _523 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).x;
    float2 _533 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_533, float2(0.0), isnan(_533))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_533, float2(0.0), isnan(_533))).x;
    float _119 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[6].x, _111);
    float _121 = fma(_103, -0.5, 0.5);
    float _123 = _71 * (*spvDescriptorSet0.fp_c4)._m0[7].y;
    float2 _555 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float _127 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[6].z, _119);
    float _129 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[7].x, _123);
    float _131 = _71 * (*spvDescriptorSet0.fp_c4)._m0[8].y;
    float _133 = fma(_127, -0.5, 0.5);
    float _135 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[7].z, _129);
    float _137 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[8].x, _131);
    float2 _591 = float2(_121, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_591, float2(0.0), isnan(_591))).x;
    float2 _601 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float _143 = fma(_135, -0.5, 0.5);
    float _145 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[8].z, _137);
    float2 _618 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _628 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[14].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float _151 = fma(_145, -0.5, 0.5);
    float2 _640 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[15].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_640, float2(0.0), isnan(_640))).x;
    float _155 = _105 + _109;
    float _157 = abs(_73);
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = _155 + _113;
    float _165 = _161 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _163 + _121;
    float _171 = _169 + _107;
    float _173 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _177 = abs(_167);
    float _179 = log2(_177);
    float _181 = _171 + _133;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _191 = _181 + _143;
    float _193 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _195 = _193 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _197 = _151 + _191;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _219 = fma(_115, _175, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _221 = fma(_117, _205, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _223 = fma(_117, _209, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _225 = fma(_117, _213, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _227 = fma(_115, _185, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = fma(_115, _201, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _231 = _219 + _225;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _237 = _227 + _223;
    float _239 = _229 + _221;
    float _241 = fma(_125, _235, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _243 = fma(_125, _217, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _245 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _247 = _245 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _249 = fma(_125, _195, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _251 = _239 + _241;
    float _253 = _237 + _243;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _259 = fma(_139, _247, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _261 = _231 + _249;
    float _263 = fma(_139, _257, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _265 = fma(_139, _189, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _267 = _253 + _259;
    float _269 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _271 = _269 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _277 = _261 + _265;
    float _279 = _251 + _263;
    float _281 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _283 = _281 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _285 = fma(_141, _271, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _291 = fma(_141, _275, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _293 = fma(_141, _283, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _295 = _279 + _285;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _301 = fma(_147, _289, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _303 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _305 = _303 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _307 = _277 + _293;
    float _309 = fma(_147, _299, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _311 = _295 + _301;
    float _313 = _267 + _291;
    float _315 = fma(_147, _305, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _317 = _313 + _309;
    float _319 = -(*spvDescriptorSet0.fp_c5)._m0[28].x;
    float _321 = _319 + (*spvDescriptorSet0.fp_c5)._m0[29].x;
    float _323 = _307 + _315;
    float _325 = -(*spvDescriptorSet0.fp_c5)._m0[28].y;
    float _327 = _325 + (*spvDescriptorSet0.fp_c5)._m0[29].y;
    float _329 = _179 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[28].z;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[29].z;
    float _335 = fma(_149, _321, (*spvDescriptorSet0.fp_c5)._m0[28].x);
    float _337 = fma(_149, _327, (*spvDescriptorSet0.fp_c5)._m0[28].y);
    float _339 = fma(_149, _333, (*spvDescriptorSet0.fp_c5)._m0[28].z);
    float _341 = exp2(_329);
    float _343 = _311 + _335;
    float _345 = _317 + _337;
    float _347 = -(*spvDescriptorSet0.fp_c5)._m0[30].x;
    float _349 = _347 + (*spvDescriptorSet0.fp_c5)._m0[31].x;
    float _351 = -(*spvDescriptorSet0.fp_c5)._m0[30].y;
    float _353 = _351 + (*spvDescriptorSet0.fp_c5)._m0[31].y;
    float _355 = -(*spvDescriptorSet0.fp_c5)._m0[30].z;
    float _357 = _355 + (*spvDescriptorSet0.fp_c5)._m0[31].z;
    float _359 = _323 + _339;
    float _361 = fma(_153, _349, (*spvDescriptorSet0.fp_c5)._m0[30].x);
    float _363 = fma(_153, _353, (*spvDescriptorSet0.fp_c5)._m0[30].y);
    float _365 = fma(_153, _357, (*spvDescriptorSet0.fp_c5)._m0[30].z);
    float _367 = _361 + _343;
    float _369 = _363 + _345;
    float _371 = _365 + _359;
    float _373 = fma(_341, (*spvDescriptorSet0.fp_c4)._m0[0].w, _197);
    float _375 = fma(_341, (*spvDescriptorSet0.fp_c4)._m0[0].x, _367);
    float _377 = fma(_341, (*spvDescriptorSet0.fp_c4)._m0[0].y, _369);
    float _379 = fma(_341, (*spvDescriptorSet0.fp_c4)._m0[0].z, _371);
    out.m_38.x = _375;
    out.m_38.y = _377;
    out.m_38.z = _379;
    out.m_38.w = _373;
    return out;
}

