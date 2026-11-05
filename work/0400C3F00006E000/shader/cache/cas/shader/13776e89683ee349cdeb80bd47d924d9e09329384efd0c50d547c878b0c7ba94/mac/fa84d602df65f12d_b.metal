#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0), flat]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _830 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_830, float2(0.0), isnan(_830))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_830, float2(0.0), isnan(_830))).x;
    float2 _841 = float2(_95, _99);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_841, float2(0.0), isnan(_841))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_841, float2(0.0), isnan(_841))).w;
    float _109 = in.m_35.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _123 = _87 * _113;
    float _125 = _87 * _119;
    float _127 = _123 * _97;
    float _129 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _131 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _129);
    float _133 = 1.0 / _131;
    float _135 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _137 = _133 * _135;
    float _139 = in.m_41.y;
    float _141 = in.m_41.x;
    float _143 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _145 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _143);
    float _147 = 1.0 / _145;
    float _149 = 0.0 + _107;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    float _153 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _155 = -_137;
    float _157 = fma(_147, _153, _155);
    float _159 = _157 * _121;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _151 * _161;
    float _165 = _163 * _125;
    bool _169 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _177 = _173 || _175;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = _137;
    if (!_177)
    {
        discard_fragment();
    }
    float _185 = 1.0 / _181;
    float _187 = fma(_103, 2.0, -1.0);
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _191 = _187 * _189;
    float _193 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _195 = _187 * _193;
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _199 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _197;
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _203 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _201;
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _207 = _185 * _205;
    float _209 = _207 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = fma(_207, (*spvDescriptorSet0.fp_c8)._m0[30].y, _211);
    float _215 = fma(_101, 2.0, -1.0);
    float _217 = 1.0 / _209;
    float _219 = fma(_215, (*spvDescriptorSet0.fp_c8)._m0[16].x, _191);
    float _221 = fma(_215, (*spvDescriptorSet0.fp_c8)._m0[19].x, _195);
    float _223 = _213 * _217;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _227 = _187 * _225;
    float _229 = fma(_223, 2.0, -1.0);
    float _231 = fma(_215, (*spvDescriptorSet0.fp_c8)._m0[17].x, _227);
    float _233 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _235 = _187 * _233;
    float _237 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[16].z, _219);
    float _239 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[17].z, _231);
    float _241 = fma(_215, (*spvDescriptorSet0.fp_c8)._m0[18].x, _235);
    float _243 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[19].z, _221);
    float _245 = _237 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _247 = _239 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _249 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[18].z, _241);
    float _251 = _243 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _253 = _247 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _255 = _249 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _257 = _247 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _259 = _247 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _261 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[15].x, _253);
    float _263 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[13].x, _257);
    float _265 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[14].x, _259);
    float _267 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[15].z, _261);
    float _269 = in.m_41.z;
    float _271 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[13].z, _263);
    float _273 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[14].z, _265);
    float _275 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[15].w, _267);
    float _277 = _247 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _279 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[13].w, _271);
    float _281 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[14].w, _273);
    float _283 = 1.0 / _275;
    float _285 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[12].x, _277);
    float _287 = _139 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _289 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[12].z, _285);
    float _291 = _139 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _293 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[0].x, _287);
    float _295 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[12].w, _289);
    float _297 = _139 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _299 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[2].x, _297);
    float _301 = _279 * _283;
    float _303 = _295 * _283;
    float _305 = _281 * _283;
    float _307 = _301 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _309 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[2].x, _307);
    float _311 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[2].z, _299);
    float _313 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[2].z, _309);
    float _315 = _311 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _317 = _313 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _319 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[1].x, _291);
    float _321 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[0].z, _293);
    float _323 = _301 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _325 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[1].z, _319);
    float _327 = 1.0 / _317;
    float _329 = in.m_43.y;
    float _331 = _301 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _333 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[1].x, _323);
    float _335 = _325 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _337 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[0].x, _331);
    float _339 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[1].z, _333);
    float _341 = _321 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _343 = fma(_305, (*spvDescriptorSet0.fp_c8)._m0[0].z, _337);
    float _345 = _339 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _347 = _343 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _349 = _315 * _327;
    float _351 = -_335;
    float _353 = fma(_345, _349, _351);
    float _355 = -_341;
    float _357 = fma(_347, _349, _355);
    float _359 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _361 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _359;
    float _363 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _365 = _363 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _367 = _353 * _353;
    float _369 = 1.0 / _365;
    float _371 = fma(_357, _357, _367);
    float _373 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _375 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _373;
    float _377 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _379 = _377 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _381 = _329 * 2.2000000476837158203125;
    float _383 = sqrt(_371);
    float _385 = spvFAdd(_381, -0.0500000007450580596923828125);
    float _387 = 1.0 / _385;
    float _389 = precise::max(_383, 0.0500000007450580596923828125);
    float _391 = 1.0 / _375;
    float _393 = precise::min(_381, _389);
    float _395 = _393 + (-0.0500000007450580596923828125);
    float _397 = 1.0 / _379;
    float _399 = -_395;
    float _401 = fma(_399, _387, 1.0);
    float _403 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _405 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _403;
    float _407 = _401 * _107;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = 1.0 / _361;
    float _413 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _415 = _409 + _413;
    float _417 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _419 = _409 + _417;
    float _421 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _423 = _409 + _421;
    float _425 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _427 = _409 + _425;
    float _429 = _415 * _391;
    float _431 = 1.0 / _405;
    float _433 = _419 * _397;
    float _435 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _437 = _409 + _435;
    float _439 = _427 * _369;
    float _441 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _443 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _441;
    float _445 = _423 * _411;
    float _447 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _449 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _447;
    float _451 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _453 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _451;
    float _455 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _457 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _455;
    bool _459 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _461 = isnan(_409);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = fma(_449, _429, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _473 = fma(_453, _429, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _475 = fma(_457, _429, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _477 = _437 * _431;
    float _479 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _481 = _479 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _483 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _485 = _483 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _487 = fma(_443, _445, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _489 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _491 = _489 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    bool _493 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _495 = isnan(_409);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_199, _445, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _507 = fma(_203, _445, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _509 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _511 = _509 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    bool _513 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _515 = isnan(_409);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    float _525 = fma(_491, _433, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _527 = fma(_481, _433, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _529 = fma(_485, _433, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _531 = -_469;
    float _533 = _531 + 1.0;
    bool _535 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _537 = isnan(_409);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = -_503;
    float _549 = _547 + 1.0;
    float _551 = _523 * _533;
    float _553 = -_523;
    float _555 = _553 + 1.0;
    float _557 = _469 * _549;
    float _559 = -_545;
    float _561 = _559 + 1.0;
    float _563 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _565 = _563 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _567 = fma(_511, _439, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _569 = _471 * _551;
    float _571 = _473 * _551;
    float _573 = _475 * _551;
    float _575 = _503 * _561;
    float _577 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _579 = _577 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    bool _581 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _583 = isnan(_409);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_555, (*spvDescriptorSet0.fp_c9)._m0[107].x, _569);
    float _595 = fma(_555, (*spvDescriptorSet0.fp_c9)._m0[107].y, _571);
    float _597 = fma(_555, (*spvDescriptorSet0.fp_c9)._m0[107].z, _573);
    float _599 = fma(_565, _439, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _601 = fma(_579, _439, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _603 = -_591;
    float _605 = _603 + 1.0;
    float _607 = fma(_525, _557, _593);
    bool _609 = _409 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _611 = isnan(_409);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = fma(_527, _557, _595);
    float _623 = fma(_529, _557, _597);
    float _625 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _627 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _625;
    float _629 = _545 * _605;
    float _631 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _633 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _631;
    float _635 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _637 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _635;
    float _639 = -_619;
    float _641 = _639 + 1.0;
    float _643 = fma(_487, _575, _607);
    float _645 = fma(_505, _575, _621);
    float _647 = fma(_507, _575, _623);
    float _649 = fma(_627, _477, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _651 = fma(_633, _477, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _653 = fma(_637, _477, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _655 = _591 * _641;
    float _657 = fma(_567, _629, _643);
    float _659 = fma(_599, _629, _645);
    float _661 = fma(_601, _629, _647);
    float _663 = fma(_649, _655, _657);
    float _665 = fma(_651, _655, _659);
    float _667 = fma(_653, _655, _661);
    float _669 = fma(_619, (*spvDescriptorSet0.fp_c9)._m0[112].x, _663);
    float _671 = fma(_619, (*spvDescriptorSet0.fp_c9)._m0[112].y, _665);
    float _673 = fma(_619, (*spvDescriptorSet0.fp_c9)._m0[112].z, _667);
    if (!_177)
    {
        out.m_46.x = _669;
        out.m_46.y = _671;
        out.m_46.z = _673;
        out.m_46.w = _107;
        return out;
    }
    float _675 = _671 * 0.715200006961822509765625;
    float _677 = in.m_48.w;
    float _679 = gl_FragCoord.w;
    float _681 = _677 * _679;
    float _683 = in.m_48.x;
    float _685 = gl_FragCoord.w;
    float _687 = _683 * _685;
    float _689 = in.m_48.y;
    float _691 = gl_FragCoord.w;
    float _693 = _689 * _691;
    float _695 = fma(_669, 0.2125999927520751953125, _675);
    float _697 = in.m_48.z;
    float _699 = gl_FragCoord.w;
    float _701 = _697 * _699;
    float _703 = fma(_673, 0.072200000286102294921875, _695);
    bool _705 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _707 = 1.0 / _703;
    float _709 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_705)
    {
        float _711 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _713 = _137 + _711;
        _183 = _713;
    }
    float _715 = _183;
    float _717 = _707 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = fma(_719, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _723 = _87 * _681;
    if (_705)
    {
        float _725 = _715 * 8.0;
        float _727 = precise::clamp(_725, 0.0, 1.0);
        _709 = _727;
    }
    float _729 = _709;
    float _731 = _87 * _687;
    float _733 = _721 * _723;
    float _735 = 0.0 + _165;
    float _737 = precise::clamp(_735, 0.0, 1.0);
    float _739 = _87 * _693;
    float _741 = _87 * _701;
    float _743 = fma(_669, _733, _731);
    float _745 = _737;
    if (_705)
    {
        float _747 = _737 * _729;
        _745 = _747;
    }
    float _749 = _745;
    float _751 = fma(_671, _733, _739);
    float _753 = fma(_673, _733, _741);
    float _755 = 0.0 + _749;
    float _757 = precise::clamp(_755, 0.0, 1.0);
    out.m_46.x = _743;
    out.m_46.y = _751;
    out.m_46.z = _753;
    out.m_46.w = _757;
    return out;
}

