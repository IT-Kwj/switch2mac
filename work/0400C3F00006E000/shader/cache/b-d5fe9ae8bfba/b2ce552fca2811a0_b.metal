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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_10Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0), flat]];
    float4 m_39 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _784 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_784, float2(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_784, float2(0.0), isnan(_784))).w;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _67 * _79;
    float _89 = in.m_39.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _67 * _85;
    float _97 = 1.0 / _95;
    float _99 = _67 * _93;
    float _101 = _99 * _97;
    float _103 = 0.0 + _73;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _105 * _87;
    bool _111 = _107 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _113 = isnan(_107);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _119 = _115 || _117;
    if (!_119)
    {
        discard_fragment();
    }
    float _121 = in.m_39.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _67 * _125;
    float _129 = _127 * _97;
    float2 _874 = float2(_129, _101);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_874, float2(0.0), isnan(_874))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_874, float2(0.0), isnan(_874))).x;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.y;
    float _141 = in.m_41.x;
    float _143 = fma(_101, 2.0, -1.0);
    float _145 = fma(_129, 2.0, -1.0);
    float _147 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _149 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _147;
    float _151 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _153 = _151 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _157 = _143 * _155;
    float _159 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[17].x, _157);
    float _161 = _67 * _137;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _165 = fma(_131, (*spvDescriptorSet0.fp_c8)._m0[30].w, _163);
    float _167 = 1.0 / _165;
    float _169 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _171 = _167 * _169;
    float _173 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _175 = _143 * _173;
    float _177 = _171 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _181 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[30].y, _179);
    float _183 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[16].x, _175);
    float _185 = 1.0 / _177;
    float _187 = _181 * _185;
    float _189 = fma(_187, 2.0, -1.0);
    float _191 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _193 = _143 * _191;
    float _195 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _197 = _143 * _195;
    float _199 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[17].z, _159);
    float _201 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[18].x, _193);
    float _203 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[16].z, _183);
    float _205 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[19].x, _197);
    float _207 = _199 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _209 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[18].z, _201);
    float _211 = _203 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _213 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[19].z, _205);
    float _215 = _207 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _217 = _209 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _219 = _207 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _221 = _213 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _223 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[15].x, _215);
    float _225 = _207 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _227 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[12].x, _219);
    float _229 = in.m_41.z;
    float _231 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[15].z, _223);
    float _233 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[14].x, _225);
    float _235 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[12].z, _227);
    float _237 = fma(_221, (*spvDescriptorSet0.fp_c8)._m0[15].w, _231);
    float _239 = _207 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _241 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[14].z, _233);
    float _243 = fma(_221, (*spvDescriptorSet0.fp_c8)._m0[12].w, _235);
    float _245 = 1.0 / _237;
    float _247 = fma(_211, (*spvDescriptorSet0.fp_c8)._m0[13].x, _239);
    float _249 = fma(_221, (*spvDescriptorSet0.fp_c8)._m0[14].w, _241);
    float _251 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[13].z, _247);
    float _253 = _139 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _255 = fma(_221, (*spvDescriptorSet0.fp_c8)._m0[13].w, _251);
    float _257 = _139 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _259 = _139 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _261 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[1].x, _253);
    float _263 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[0].x, _257);
    float _265 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[2].x, _259);
    float _267 = _255 * _245;
    float _269 = _243 * _245;
    float _271 = _249 * _245;
    float _273 = _267 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _275 = _267 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _277 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[0].z, _263);
    float _279 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[2].x, _273);
    float _281 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[1].z, _261);
    float _283 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[2].z, _265);
    float _285 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[1].x, _275);
    float _287 = fma(_271, (*spvDescriptorSet0.fp_c8)._m0[2].z, _279);
    float _289 = in.m_43.y;
    float _291 = _283 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _293 = fma(_271, (*spvDescriptorSet0.fp_c8)._m0[1].z, _285);
    float _295 = _287 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _297 = _267 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _299 = _281 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _301 = _293 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _303 = _277 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _305 = fma(_269, (*spvDescriptorSet0.fp_c8)._m0[0].x, _297);
    float _307 = 1.0 / _295;
    float _309 = fma(_271, (*spvDescriptorSet0.fp_c8)._m0[0].z, _305);
    float _311 = _309 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _313 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _315 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _313;
    float _317 = 1.0 / _315;
    float _319 = _291 * _307;
    float _321 = -_299;
    float _323 = fma(_301, _319, _321);
    float _325 = -_303;
    float _327 = fma(_311, _319, _325);
    float _329 = _289 * 2.2000000476837158203125;
    float _331 = _323 * _323;
    float _333 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _335 = _333 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _337 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _339 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _337;
    float _341 = fma(_327, _327, _331);
    float _343 = spvFAdd(_329, -0.0500000007450580596923828125);
    float _345 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _347 = _345 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _349 = 1.0 / _335;
    float _351 = sqrt(_341);
    float _353 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _355 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _353;
    float _357 = 1.0 / _343;
    float _359 = precise::max(_351, 0.0500000007450580596923828125);
    float _361 = 1.0 / _347;
    float _363 = precise::min(_329, _359);
    float _365 = _363 + (-0.0500000007450580596923828125);
    float _367 = 1.0 / _339;
    float _369 = -_365;
    float _371 = fma(_369, _357, 1.0);
    float _373 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _375 = _373 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _377 = _371 * _73;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = 1.0 / _355;
    float _383 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _385 = _379 + _383;
    float _387 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _389 = _379 + _387;
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _393 = _379 + _391;
    float _395 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _397 = _379 + _395;
    float _399 = _385 * _317;
    float _401 = 1.0 / _375;
    float _403 = _389 * _361;
    float _405 = _393 * _349;
    float _407 = _397 * _367;
    float _409 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _411 = _379 + _409;
    float _413 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _415 = _379 + _413;
    float _417 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _419 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _417;
    float _421 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _423 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _421;
    float _425 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _427 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _425;
    float _429 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _431 = _429 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _433 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _435 = _433 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _437 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _439 = _437 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _441 = fma(_419, _399, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _443 = fma(_423, _399, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _445 = fma(_427, _399, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _447 = fma(_431, _405, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _449 = fma(_435, _405, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _451 = fma(_439, _405, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _453 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _455 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _453;
    bool _457 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _459 = isnan(_379);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _411 * _381;
    float _471 = _415 * _401;
    float _473 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _475 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _473;
    float _477 = fma(_455, _407, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    bool _479 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _481 = isnan(_379);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_467;
    float _493 = _491 + 1.0;
    float _495 = fma(_475, _407, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _497 = fma(_149, _407, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    bool _499 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _501 = isnan(_379);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _489 * _493;
    float _513 = -_489;
    float _515 = _513 + 1.0;
    bool _517 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _519 = isnan(_379);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _531 = _529 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _533 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _535 = _533 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _537 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _539 = isnan(_379);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -_509;
    float _551 = _549 + 1.0;
    bool _553 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _555 = isnan(_379);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -_527;
    float _567 = _565 + 1.0;
    float _569 = fma(_531, _403, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _571 = fma(_535, _403, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _573 = fma(_153, _403, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _575 = _509 * _515;
    float _577 = _547 * _567;
    float _579 = -_547;
    float _581 = _579 + 1.0;
    float _583 = _563 * _551;
    float _585 = -_563;
    float _587 = _585 + 1.0;
    float _589 = _467 * _581;
    float _591 = _441 * _583;
    float _593 = _443 * _583;
    float _595 = _445 * _583;
    float _597 = fma(_587, (*spvDescriptorSet0.fp_c9)._m0[107].x, _591);
    float _599 = fma(_587, (*spvDescriptorSet0.fp_c9)._m0[107].y, _593);
    float _601 = fma(_587, (*spvDescriptorSet0.fp_c9)._m0[107].z, _595);
    float _603 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _605 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _603;
    float _607 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _609 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _607;
    float _611 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _613 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _611;
    float _615 = fma(_447, _575, _597);
    float _617 = fma(_449, _575, _599);
    float _619 = fma(_451, _575, _601);
    float _621 = fma(_605, _469, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _623 = fma(_609, _469, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _625 = fma(_613, _469, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    bool _627 = _379 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _629 = isnan(_379);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = fma(_495, _511, _615);
    float _641 = fma(_477, _511, _617);
    float _643 = fma(_497, _511, _619);
    float _645 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _647 = _645 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _649 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _651 = _649 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _653 = -_637;
    float _655 = _653 + 1.0;
    float _657 = fma(_569, _589, _639);
    float _659 = fma(_571, _589, _641);
    float _661 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _663 = _661 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _665 = fma(_573, _589, _643);
    float _667 = fma(_647, _471, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _669 = fma(_651, _471, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _671 = _527 * _655;
    float _673 = fma(_621, _577, _657);
    float _675 = fma(_623, _577, _659);
    float _677 = fma(_663, _471, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _679 = fma(_625, _577, _665);
    float _681 = fma(_667, _671, _673);
    float _683 = fma(_669, _671, _675);
    float _685 = fma(_677, _671, _679);
    float _687 = fma(_637, (*spvDescriptorSet0.fp_c9)._m0[113].x, _681);
    float _689 = fma(_637, (*spvDescriptorSet0.fp_c9)._m0[113].y, _683);
    float _691 = fma(_637, (*spvDescriptorSet0.fp_c9)._m0[113].z, _685);
    if (!_119)
    {
        out.m_46.x = _687;
        out.m_46.y = _689;
        out.m_46.z = _691;
        out.m_46.w = _73;
        return out;
    }
    float _693 = _689 * 0.715200006961822509765625;
    float _695 = 0.0 + _107;
    float _697 = precise::clamp(_695, 0.0, 1.0);
    float _699 = fma(_687, 0.2125999927520751953125, _693);
    bool _701 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _703 = fma(_691, 0.072200000286102294921875, _699);
    float _705 = 1.0 / _703;
    float _707 = _705 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _709 = precise::clamp(_707, 0.0, 1.0);
    float _711 = fma(_709, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _713 = _687 * _711;
    float _715 = _689 * _711;
    float _717 = _691 * _711;
    float _719 = _711;
    if (!_701)
    {
        _719 = _697;
    }
    float _721 = _719;
    bool _723 = !_701;
    float _725 = _721;
    if (!_723)
    {
        float _727 = _161 * _97;
        float _729 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _731 = fma(_727, (*spvDescriptorSet0.fp_c8)._m0[30].w, _729);
        float _733 = 1.0 / _731;
        float _735 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _737 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _739 = fma(_733, _735, _737);
        float _741 = _739 * 8.0;
        float _743 = precise::clamp(_741, 0.0, 1.0);
        float _745 = _697 * _743;
        _725 = _745;
    }
    float _747 = _725;
    float _749 = 0.0 + _747;
    float _751 = precise::clamp(_749, 0.0, 1.0);
    out.m_46.x = _713;
    out.m_46.y = _715;
    out.m_46.z = _717;
    out.m_46.w = _751;
    return out;
}

