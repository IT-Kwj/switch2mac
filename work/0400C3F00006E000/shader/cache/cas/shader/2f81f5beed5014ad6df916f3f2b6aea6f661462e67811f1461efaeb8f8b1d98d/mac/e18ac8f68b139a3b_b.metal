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
    float2 _423 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_423, float2(0.0), isnan(_423))).xyz;
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
    float _105 = fma(_93, -0.5, 0.5);
    float _107 = fma(_97, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = abs(_105);
    float _115 = log2(_113);
    float _117 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _119 = -_75;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _123 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _129 = fma(_117, -0.5, 0.5);
    float _131 = fma(_121, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = abs(_107);
    float _137 = log2(_135);
    float _139 = fma(_127, -0.5, 0.5);
    float _141 = abs(_109);
    float _143 = log2(_141);
    float _145 = _115 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _147 = abs(_111);
    float _149 = log2(_147);
    float _151 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _153 = abs(_129);
    float _155 = log2(_153);
    float _157 = _143 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _159 = exp2(_145);
    float _161 = _149 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _163 = exp2(_151);
    float _165 = _155 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _167 = abs(_131);
    float _169 = log2(_167);
    float _171 = exp2(_157);
    float _173 = exp2(_161);
    float2 _601 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float2 _610 = float2(_163, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).x;
    float _179 = _169 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _181 = abs(_133);
    float _183 = log2(_181);
    float2 _628 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float _187 = abs(_139);
    float _189 = log2(_187);
    float2 _641 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_641, float2(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_641, float2(0.0), isnan(_641))).x;
    float _193 = exp2(_165);
    float _195 = _183 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _197 = exp2(_179);
    float _199 = _189 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float2 _663 = float2(_193, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).x;
    float _203 = exp2(_195);
    float _205 = exp2(_199);
    float2 _676 = float2(_197, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float2 _686 = float2(_203, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float2 _695 = float2(_205, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _211 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float _213 = _105 + _109;
    float _215 = _107 + _111;
    float _217 = abs(_75);
    float _219 = -_217;
    float _221 = _219 + 1.0;
    float _223 = _213 + _129;
    float _225 = _215 + _131;
    float _227 = _133 + _223;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _241 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _243 = _241 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _245 = _221 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _251 = _249 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _253 = _139 + _225;
    float _255 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _257 = _255 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _259 = abs(_247);
    float _261 = log2(_259);
    float _263 = fma(_175, _231, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _265 = fma(_175, _235, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _267 = fma(_231, _177, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _269 = fma(_175, _243, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _271 = fma(_243, _177, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _273 = fma(_235, _177, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _275 = fma(_185, _239, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _277 = fma(_185, _251, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _279 = fma(_185, _257, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _281 = _263 + _275;
    float _283 = _265 + _277;
    float _285 = _269 + _279;
    float _287 = fma(_251, _191, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _289 = fma(_239, _191, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _291 = fma(_257, _191, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _293 = _273 + _287;
    float _295 = _267 + _289;
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _301 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _303 = _301 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _305 = _271 + _291;
    float _307 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _309 = _307 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _311 = fma(_201, _303, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _313 = fma(_201, _299, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _315 = fma(_201, _309, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _317 = _281 + _311;
    float _319 = _283 + _313;
    float _321 = _285 + _315;
    float _323 = fma(_303, _207, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _325 = fma(_299, _207, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _327 = fma(_309, _207, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _329 = _261 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _339 = _293 + _325;
    float _341 = _295 + _323;
    float _343 = exp2(_329);
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _349 = fma(_209, _333, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _351 = _305 + _327;
    float _353 = fma(_209, _347, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _355 = fma(_209, _337, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _357 = fma(_333, _211, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _359 = fma(_347, _211, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _361 = fma(_337, _211, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _363 = _355 + _321;
    float _365 = _357 + _341;
    float _367 = _349 + _317;
    float _369 = _353 + _319;
    float _371 = _359 + _339;
    float _373 = _361 + _351;
    float _375 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].w, _227);
    float _377 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].w, _253);
    float _379 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].x, _367);
    float _381 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].y, _369);
    float _383 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].z, _363);
    float _385 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].x, _365);
    float _387 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].y, _371);
    float _389 = fma(_343, (*spvDescriptorSet0.fp_c4)._m0[0].z, _373);
    out.m_38.x = _379;
    out.m_38.y = _381;
    out.m_38.z = _383;
    out.m_38.w = _375;
    out.m_40.x = _385;
    out.m_40.y = _387;
    out.m_40.z = _389;
    out.m_40.w = _377;
    return out;
}

