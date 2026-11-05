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
    float2 _417 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = _73 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].x, _85);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _99 = -_75;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _103 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _105 = -_75;
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _89);
    float _109 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _111 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _113 = -_75;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[3].z, _91);
    float _117 = -_75;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[4].z, _93);
    float _121 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _123 = -_75;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c4)._m0[5].z, _95);
    float _127 = fma(_97, -0.5, 0.5);
    float _129 = fma(_101, -0.5, 0.5);
    float _131 = fma(_103, -0.5, 0.5);
    float _133 = fma(_107, -0.5, 0.5);
    float _135 = fma(_109, -0.5, 0.5);
    float _137 = fma(_115, -0.5, 0.5);
    float _139 = fma(_111, -0.5, 0.5);
    float _141 = fma(_119, -0.5, 0.5);
    float _143 = fma(_121, -0.5, 0.5);
    float _145 = fma(_125, -0.5, 0.5);
    float2 _569 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).x;
    float2 _578 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_578, float2(0.0), isnan(_578))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_578, float2(0.0), isnan(_578))).x;
    float2 _588 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_588, float2(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_588, float2(0.0), isnan(_588))).x;
    float2 _597 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _607 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_607, float2(0.0), isnan(_607))).x;
    float2 _616 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).x;
    float2 _626 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_626, float2(0.0), isnan(_626))).x;
    float2 _635 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_635, float2(0.0), isnan(_635))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_635, float2(0.0), isnan(_635))).x;
    float2 _645 = float2(_143, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_645, float2(0.0), isnan(_645))).x;
    float2 _654 = float2(_145, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_654, float2(0.0), isnan(_654))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_654, float2(0.0), isnan(_654))).x;
    float _167 = _127 + _131;
    float _169 = _129 + _133;
    float _171 = abs(_75);
    float _173 = -_171;
    float _175 = _173 + 1.0;
    float _177 = _167 + _135;
    float _179 = _169 + _137;
    float _181 = _175 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _177 + _139;
    float _187 = _179 + _141;
    float _189 = _143 + _185;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _207 = abs(_183);
    float _209 = log2(_207);
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _219 = _145 + _187;
    float _221 = fma(_147, _193, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _223 = fma(_147, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = fma(_151, _197, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _227 = fma(_147, _201, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _229 = fma(_205, _149, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _231 = fma(_193, _149, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _233 = _221 + _225;
    float _235 = fma(_201, _149, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _237 = fma(_213, _153, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _239 = fma(_197, _153, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _241 = fma(_151, _213, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _247 = _229 + _237;
    float _249 = fma(_151, _217, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _251 = _231 + _239;
    float _253 = _223 + _241;
    float _255 = fma(_217, _153, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _257 = fma(_155, _245, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _259 = _235 + _255;
    float _261 = _233 + _257;
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _271 = fma(_245, _157, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _277 = fma(_155, _269, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _283 = _227 + _249;
    float _285 = fma(_155, _265, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _287 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _289 = _287 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _291 = _251 + _271;
    float _293 = fma(_159, _281, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _295 = fma(_159, _275, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _297 = _283 + _285;
    float _299 = fma(_269, _157, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _301 = fma(_159, _289, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _303 = _253 + _277;
    float _305 = fma(_265, _157, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _307 = _261 + _295;
    float _309 = _247 + _299;
    float _311 = _297 + _301;
    float _313 = _303 + _293;
    float _315 = _209 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _317 = _259 + _305;
    float _319 = fma(_281, _161, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _321 = fma(_275, _161, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _323 = fma(_289, _161, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _325 = exp2(_315);
    float _327 = _291 + _321;
    float _329 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _331 = _329 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _333 = _309 + _319;
    float _335 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _337 = _335 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _339 = _317 + _323;
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _345 = fma(_163, _331, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _347 = fma(_163, _337, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _349 = fma(_331, _165, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _351 = fma(_163, _343, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _353 = fma(_337, _165, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _355 = fma(_343, _165, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _357 = _345 + _313;
    float _359 = _351 + _311;
    float _361 = _349 + _333;
    float _363 = _347 + _307;
    float _365 = _353 + _327;
    float _367 = _355 + _339;
    float _369 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].w, _189);
    float _371 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].w, _219);
    float _373 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].x, _357);
    float _375 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].y, _363);
    float _377 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].z, _359);
    float _379 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].x, _361);
    float _381 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].y, _365);
    float _383 = fma(_325, (*spvDescriptorSet0.fp_c4)._m0[0].z, _367);
    out.m_38.x = _373;
    out.m_38.y = _375;
    out.m_38.z = _377;
    out.m_38.w = _369;
    out.m_40.x = _379;
    out.m_40.y = _381;
    out.m_40.z = _383;
    out.m_40.w = _371;
    return out;
}

