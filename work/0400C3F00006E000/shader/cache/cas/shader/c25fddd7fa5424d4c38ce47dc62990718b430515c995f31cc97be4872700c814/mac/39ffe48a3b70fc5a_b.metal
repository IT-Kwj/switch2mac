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
    float2 _497 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_497, float2(0.0), isnan(_497))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _81);
    float _89 = _73 * (*spvDescriptorSet0.fp_c4)._m0[5].y;
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = -_75;
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _99 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = -_75;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _107 = fma(_93, -0.5, 0.5);
    float _109 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _99);
    float _111 = fma(_97, -0.5, 0.5);
    float _113 = fma(_105, -0.5, 0.5);
    float _115 = abs(_107);
    float _117 = log2(_115);
    float _119 = -_75;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[3].z, _109);
    float _123 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _109);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[4].z, _87);
    float _129 = fma(_121, -0.5, 0.5);
    float _131 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _87);
    float _133 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[5].x, _89);
    float _135 = abs(_111);
    float _137 = log2(_135);
    float _139 = fma(_127, -0.5, 0.5);
    float _141 = fma(_123, -0.5, 0.5);
    float _143 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[5].z, _133);
    float _145 = fma(_131, -0.5, 0.5);
    float _147 = fma(_143, -0.5, 0.5);
    float _149 = abs(_101);
    float _151 = log2(_149);
    float _153 = -_75;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c4)._m0[5].z, _133);
    float _157 = _117 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _159 = fma(_155, -0.5, 0.5);
    float _161 = abs(_113);
    float _163 = log2(_161);
    float _165 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _167 = abs(_139);
    float _169 = log2(_167);
    float _171 = _151 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _173 = abs(_141);
    float _175 = log2(_173);
    float _177 = _163 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _179 = exp2(_157);
    float _181 = _169 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _183 = exp2(_165);
    float _185 = _175 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _187 = abs(_129);
    float _189 = log2(_187);
    float _191 = abs(_159);
    float _193 = log2(_191);
    float _195 = exp2(_171);
    float2 _711 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float _199 = _189 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _201 = exp2(_177);
    float _203 = _193 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _205 = abs(_145);
    float _207 = log2(_205);
    float _209 = exp2(_181);
    float _211 = exp2(_185);
    float2 _738 = float2(_183, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_738, float2(0.0), isnan(_738))).x;
    float2 _748 = float2(_195, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _215 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_748, float2(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_748, float2(0.0), isnan(_748))).x;
    float2 _757 = float2(_201, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_757, float2(0.0), isnan(_757))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_757, float2(0.0), isnan(_757))).x;
    float _219 = _207 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _221 = exp2(_199);
    float _223 = abs(_147);
    float _225 = log2(_223);
    float2 _777 = float2(_211, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float _229 = exp2(_219);
    float2 _788 = float2(_221, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_788, float2(0.0), isnan(_788))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_788, float2(0.0), isnan(_788))).x;
    float _233 = _225 * (*spvDescriptorSet0.fp_c5)._m0[4].x;
    float _235 = exp2(_203);
    float _237 = exp2(_233);
    float2 _806 = float2(_229, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_806, float2(0.0), isnan(_806))).x;
    float2 _815 = float2(_209, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_815, float2(0.0), isnan(_815))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_815, float2(0.0), isnan(_815))).x;
    float2 _825 = float2(_237, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_825, float2(0.0), isnan(_825))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_825, float2(0.0), isnan(_825))).x;
    float2 _834 = float2(_235, (*spvDescriptorSet0.fp_c5)._m0[12].x);
    float _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_834, float2(0.0), isnan(_834))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_834, float2(0.0), isnan(_834))).x;
    float _247 = _107 + _101;
    float _249 = _111 + _113;
    float _251 = abs(_75);
    float _253 = -_251;
    float _255 = _253 + 1.0;
    float _257 = _247 + _141;
    float _259 = _249 + _129;
    float _261 = _257 + _145;
    float _263 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _265 = _263 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _267 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _269 = _267 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _271 = _259 + _139;
    float _273 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _275 = _273 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _277 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _279 = _277 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _281 = _147 + _261;
    float _283 = _255 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _159 + _271;
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _293 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _295 = _293 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _297 = abs(_285);
    float _299 = log2(_297);
    float _301 = fma(_197, _279, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _303 = fma(_197, _265, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _305 = fma(_197, _291, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _307 = fma(_279, _213, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _309 = fma(_265, _213, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _311 = fma(_215, _269, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _313 = fma(_215, _275, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _315 = fma(_215, _295, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _317 = fma(_291, _213, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _319 = _301 + _311;
    float _321 = _303 + _313;
    float _323 = fma(_269, _217, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _325 = fma(_275, _217, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _327 = fma(_295, _217, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _329 = _305 + _315;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _335 = _309 + _325;
    float _337 = _317 + _327;
    float _339 = fma(_227, _333, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _341 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _343 = _341 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _349 = _307 + _323;
    float _351 = _319 + _339;
    float _353 = fma(_227, _343, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _355 = fma(_333, _231, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _357 = fma(_227, _347, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _359 = fma(_343, _231, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _361 = fma(_347, _231, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _363 = _349 + _355;
    float _365 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _367 = _365 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _369 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _371 = _369 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _373 = _335 + _359;
    float _375 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _377 = _375 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _379 = _337 + _361;
    float _381 = _321 + _353;
    float _383 = _329 + _357;
    float _385 = fma(_239, _367, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _387 = fma(_239, _371, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _389 = fma(_367, _241, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _391 = _299 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _393 = fma(_239, _377, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _395 = _351 + _385;
    float _397 = _381 + _387;
    float _399 = _383 + _393;
    float _401 = exp2(_391);
    float _403 = fma(_371, _241, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _405 = fma(_377, _241, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _407 = -(*spvDescriptorSet0.fp_c5)._m0[24].x;
    float _409 = _407 + (*spvDescriptorSet0.fp_c5)._m0[25].x;
    float _411 = -(*spvDescriptorSet0.fp_c5)._m0[24].y;
    float _413 = _411 + (*spvDescriptorSet0.fp_c5)._m0[25].y;
    float _415 = -(*spvDescriptorSet0.fp_c5)._m0[24].z;
    float _417 = _415 + (*spvDescriptorSet0.fp_c5)._m0[25].z;
    float _419 = _363 + _389;
    float _421 = _379 + _405;
    float _423 = fma(_243, _409, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _425 = fma(_243, _413, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _427 = fma(_409, _245, (*spvDescriptorSet0.fp_c5)._m0[24].x);
    float _429 = fma(_413, _245, (*spvDescriptorSet0.fp_c5)._m0[24].y);
    float _431 = _373 + _403;
    float _433 = fma(_243, _417, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _435 = fma(_417, _245, (*spvDescriptorSet0.fp_c5)._m0[24].z);
    float _437 = _427 + _419;
    float _439 = _423 + _395;
    float _441 = _425 + _397;
    float _443 = _433 + _399;
    float _445 = _429 + _431;
    float _447 = _435 + _421;
    float _449 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _281);
    float _451 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].w, _287);
    float _453 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _439);
    float _455 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].y, _441);
    float _457 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].z, _443);
    float _459 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].x, _437);
    float _461 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].y, _445);
    float _463 = fma(_401, (*spvDescriptorSet0.fp_c4)._m0[0].z, _447);
    out.m_38.x = _453;
    out.m_38.y = _455;
    out.m_38.z = _457;
    out.m_38.w = _449;
    out.m_40.x = _459;
    out.m_40.y = _461;
    out.m_40.z = _463;
    out.m_40.w = _451;
    return out;
}

