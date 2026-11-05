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
    float2 _475 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_475, float2(0.0), isnan(_475))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = _73 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _87 = _73 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _95 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].x, _85);
    float _99 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[6].x, _87);
    float _101 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _103 = -_75;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[1].z, _89);
    float _107 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _109 = -_75;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[2].z, _91);
    float _113 = fma(_101, -0.5, 0.5);
    float _115 = fma(_105, -0.5, 0.5);
    float _117 = fma(_107, -0.5, 0.5);
    float _119 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[5].z, _97);
    float2 _592 = float2(_113, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_592, float2(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_592, float2(0.0), isnan(_592))).x;
    float2 _601 = float2(_115, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[5].z, _97);
    float _129 = fma(_111, -0.5, 0.5);
    float2 _620 = float2(_117, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float _133 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _135 = -_75;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c4)._m0[4].z, _95);
    float _139 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float2 _646 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646))).x;
    float _143 = -_75;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c4)._m0[3].z, _93);
    float _147 = fma(_133, -0.5, 0.5);
    float _149 = fma(_139, -0.5, 0.5);
    float _151 = fma(_137, -0.5, 0.5);
    float _153 = fma(_145, -0.5, 0.5);
    float _155 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float2 _676 = float2(_149, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_676, float2(0.0), isnan(_676))).x;
    float _159 = fma(_119, -0.5, 0.5);
    float2 _687 = float2(_153, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).x;
    float2 _697 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697))).x;
    float2 _706 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).x;
    float _167 = -_75;
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c4)._m0[6].z, _99);
    float _171 = fma(_155, -0.5, 0.5);
    float _173 = fma(_127, -0.5, 0.5);
    float2 _727 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_727, float2(0.0), isnan(_727))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_727, float2(0.0), isnan(_727))).x;
    float _177 = fma(_169, -0.5, 0.5);
    float2 _738 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float2 _748 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_748, float2(0.0), isnan(_748))).x;
    float2 _757 = float2(_177, (*spvDescriptorSet0.fp_c5)._m0[13].x);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_757, float2(0.0), isnan(_757))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_757, float2(0.0), isnan(_757))).x;
    float _185 = _113 + _117;
    float _187 = _115 + _129;
    float _189 = abs(_75);
    float _191 = -_189;
    float _193 = _191 + 1.0;
    float _195 = _185 + _149;
    float _197 = _187 + _153;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _203 = _195 + _147;
    float _205 = _197 + _151;
    float _207 = _193 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _203 + _159;
    float _213 = _205 + _173;
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _219 = abs(_209);
    float _221 = log2(_219);
    float _223 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _225 = _223 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _227 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _229 = _227 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _231 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _233 = _231 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _235 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _237 = _235 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _239 = _171 + _211;
    float _241 = _177 + _213;
    float _243 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _245 = _243 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _247 = fma(_121, _225, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _249 = fma(_121, _229, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _251 = fma(_121, _237, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _253 = fma(_225, _123, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _255 = fma(_131, _217, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _257 = fma(_131, _233, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _259 = fma(_131, _201, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _261 = fma(_229, _123, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _263 = _247 + _255;
    float _265 = fma(_237, _123, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _267 = fma(_217, _141, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _269 = fma(_233, _141, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _271 = fma(_201, _141, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _273 = _249 + _257;
    float _275 = _253 + _267;
    float _277 = _251 + _259;
    float _279 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _281 = _279 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _283 = _265 + _271;
    float _285 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _287 = _285 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _289 = _261 + _269;
    float _291 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _293 = _291 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _295 = fma(_157, _281, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _297 = fma(_157, _287, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _299 = fma(_281, _161, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _301 = fma(_157, _293, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _303 = fma(_287, _161, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _305 = fma(_293, _161, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _307 = _277 + _301;
    float _309 = _275 + _299;
    float _311 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _313 = _311 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _315 = _283 + _305;
    float _317 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _319 = _317 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _321 = _263 + _295;
    float _323 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _325 = _323 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _327 = fma(_163, _313, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _329 = _273 + _297;
    float _331 = fma(_163, _319, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _333 = fma(_163, _325, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _335 = _289 + _303;
    float _337 = fma(_319, _165, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _339 = _321 + _327;
    float _341 = fma(_313, _165, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _343 = _335 + _337;
    float _345 = fma(_175, _245, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _347 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _349 = _347 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _351 = fma(_325, _165, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _353 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _355 = _353 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _357 = _339 + _345;
    float _359 = _309 + _341;
    float _361 = fma(_245, _179, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _363 = _221 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _365 = _329 + _331;
    float _367 = fma(_175, _349, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _369 = fma(_349, _179, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _371 = fma(_355, _179, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _373 = _315 + _351;
    float _375 = _359 + _361;
    float _377 = exp2(_363);
    float _379 = _307 + _333;
    float _381 = fma(_175, _355, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _383 = -(*spvDescriptorSet0.fp_c5)._m0[26].x;
    float _385 = _383 + (*spvDescriptorSet0.fp_c5)._m0[27].x;
    float _387 = -(*spvDescriptorSet0.fp_c5)._m0[26].y;
    float _389 = _387 + (*spvDescriptorSet0.fp_c5)._m0[27].y;
    float _391 = -(*spvDescriptorSet0.fp_c5)._m0[26].z;
    float _393 = _391 + (*spvDescriptorSet0.fp_c5)._m0[27].z;
    float _395 = _365 + _367;
    float _397 = _379 + _381;
    float _399 = fma(_181, _385, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _401 = fma(_181, _389, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _403 = _373 + _371;
    float _405 = fma(_385, _183, (*spvDescriptorSet0.fp_c5)._m0[26].x);
    float _407 = _343 + _369;
    float _409 = fma(_181, _393, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _411 = fma(_389, _183, (*spvDescriptorSet0.fp_c5)._m0[26].y);
    float _413 = fma(_393, _183, (*spvDescriptorSet0.fp_c5)._m0[26].z);
    float _415 = _405 + _375;
    float _417 = _399 + _357;
    float _419 = _401 + _395;
    float _421 = _409 + _397;
    float _423 = _411 + _407;
    float _425 = _413 + _403;
    float _427 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].w, _239);
    float _429 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].w, _241);
    float _431 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].x, _417);
    float _433 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].y, _419);
    float _435 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].z, _421);
    float _437 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].x, _415);
    float _439 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].y, _423);
    float _441 = fma(_377, (*spvDescriptorSet0.fp_c4)._m0[0].z, _425);
    out.m_38.x = _431;
    out.m_38.y = _433;
    out.m_38.z = _435;
    out.m_38.w = _427;
    out.m_40.x = _437;
    out.m_40.y = _439;
    out.m_40.z = _441;
    out.m_40.w = _429;
    return out;
}

