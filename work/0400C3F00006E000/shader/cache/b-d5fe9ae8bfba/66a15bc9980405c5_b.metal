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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> fp_t_tcb_34 [[id(10)]];
    sampler fp_t_tcb_34Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texture2d<float> fp_t_tcb_36 [[id(14)]];
    sampler fp_t_tcb_36Smplr [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_34Smplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_36Smplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0), flat]];
    float4 m_57 [[user(locn1)]];
    float4 m_55 [[user(locn2), flat]];
    float4 m_45 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_49 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_45.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_45.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_45.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _67;
    float _89 = _87 * _73;
    float _91 = _87 * _79;
    float _93 = _87 * _85;
    float _95 = 1.0 / _89;
    float _97 = _91 * _95;
    float _99 = _93 * _95;
    float2 _1714 = float2(_97, _99);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1714, float2(0.0), isnan(_1714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1714, float2(0.0), isnan(_1714))).x;
    float _103 = in.m_45.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_47.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _87 * _107;
    float _117 = _115 * _95;
    float _119 = _87 * _113;
    float _121 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _123 = fma(_117, (*spvDescriptorSet0.fp_c8)._m0[30].w, _121);
    float _125 = 1.0 / _123;
    float _127 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _129 = _125 * _127;
    float _131 = in.m_49.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_49.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_51.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _87 * _141;
    float _151 = _87 * _147;
    float _153 = _151 + 0.5;
    float _155 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _157 = fma(_101, (*spvDescriptorSet0.fp_c8)._m0[30].w, _155);
    float _159 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _161 = 1.0 / _157;
    float _163 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _165 = -_129;
    float _167 = fma(_161, _163, _165);
    float _169 = _167 * _159;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _171 * _119;
    bool _177 = _173 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _179 = isnan(_173);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _185 = _181 || _183;
    float _187 = in.m_49.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = _129;
    if (!_185)
    {
        discard_fragment();
    }
    float _195 = _87 * _135;
    float _197 = -_195;
    float _199 = _197 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _201 = _199 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _203 = _199 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _205 = _199 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _207 = _87 * _191;
    float _209 = -_207;
    float _211 = _209 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _213 = fma(_211, (*spvDescriptorSet0.fp_c10)._m0[8].x, _201);
    float _215 = fma(_211, (*spvDescriptorSet0.fp_c10)._m0[8].y, _203);
    float _217 = fma(_211, (*spvDescriptorSet0.fp_c10)._m0[8].z, _205);
    float _219 = -_149;
    float _221 = _219 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _223 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].x, _213);
    float _225 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].y, _215);
    float _227 = fma(_221, (*spvDescriptorSet0.fp_c10)._m0[10].z, _217);
    float _229 = in.m_51.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = -_223;
    float _237 = _153 + _235;
    bool _239 = _153 >= _223;
    bool _241 = isnan(_153);
    bool _243 = _239 || _241;
    bool _245 = isnan(_223);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = 1.0 / _237;
    float _253 = -_153;
    float _255 = _253 + _249;
    float _257 = _255 * _251;
    float _259 = _87 * _233;
    float _261 = _259 + 0.5;
    float _263 = -_225;
    float _265 = _261 + _263;
    bool _267 = _261 >= _225;
    bool _269 = isnan(_261);
    bool _271 = _267 || _269;
    bool _273 = isnan(_225);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = 1.0 / _265;
    float _281 = -_261;
    float _283 = _281 + _277;
    float _285 = _283 * _279;
    float _287 = precise::min(_257, _285);
    float _289 = -_227;
    float _291 = _289 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _293 = -_227;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    bool _297 = _293 >= _295;
    bool _299 = isnan(_293);
    bool _301 = _297 || _299;
    bool _303 = isnan(_295);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _291;
    float _311 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _313 = _307 + _311;
    float _315 = _313 * _309;
    float _317 = precise::min(_315, _287);
    float _319 = fma(_237, _317, _153);
    float _321 = fma(_265, _317, _261);
    float _323 = fma(_291, _317, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _325 = fma(_319, -2.0, 1.0);
    float _327 = fma(_319, 2.0, -1.0);
    float _329 = fma(_321, -2.0, 1.0);
    float _331 = fma(_321, 2.0, -1.0);
    bool _333 = _325 >= 0.999000012874603271484375;
    bool _335 = isnan(_325);
    bool _337 = _333 || _335;
    bool _339 = isnan(0.999000012874603271484375);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -_321;
    float _347 = _345 + 1.0;
    bool _349 = _327 >= 0.999000012874603271484375;
    bool _351 = isnan(_327);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.999000012874603271484375);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _331 >= 0.999000012874603271484375;
    bool _363 = isnan(_331);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.999000012874603271484375);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _321 * _343;
    bool _375 = _329 >= 0.999000012874603271484375;
    bool _377 = isnan(_329);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.999000012874603271484375);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = fma(_347, _359, _373);
    float _389 = -_319;
    float _391 = _389 + 1.0;
    float _393 = _319 * _371;
    float _395 = _385 * 0.4000000059604644775390625;
    float _397 = _343 + _359;
    float _399 = fma(_385, _391, _393);
    float _401 = fma(_343, -0.25, _395);
    float _403 = _387 + _399;
    float _405 = fma(_371, -0.4000000059604644775390625, _401);
    float _407 = in.m_53.y;
    float _409 = _385 + _371;
    float _411 = _397 + _409;
    float _413 = fma(_407, (*spvDescriptorSet0.fp_c9)._m0[191].z, _405);
    float _415 = fma(_323, (*spvDescriptorSet0.fp_c9)._m0[191].y, _413);
    float _417 = _415 * _411;
    float2 _2180 = float2(_403, _417);
    float2 _421 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2180, float2(0.0), isnan(_2180))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2180, float2(0.0), isnan(_2180))).xw;
    float _423 = _421.x;
    float _425 = _421.y;
    float2 _2192 = float2(_403, _417);
    float2 _427 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2192, float2(0.0), isnan(_2192))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2192, float2(0.0), isnan(_2192))).xy;
    float _429 = _427.x;
    float _431 = _427.y;
    float _433 = _195 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _435 = _195 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _437 = _195 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _439 = fma(_207, (*spvDescriptorSet0.fp_c8)._m0[0].x, _433);
    float _441 = fma(_207, (*spvDescriptorSet0.fp_c8)._m0[1].x, _435);
    float _443 = fma(_207, (*spvDescriptorSet0.fp_c8)._m0[2].x, _437);
    float _445 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _447 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _449 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[0].z, _439);
    float _451 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[1].z, _441);
    float _453 = fma(_149, (*spvDescriptorSet0.fp_c8)._m0[2].z, _443);
    float _455 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _457 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _459 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _457;
    float _461 = _453 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _463 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _465 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _463;
    float _467 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _469 = _467 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _471 = _449 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _473 = _451 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _475 = 1.0 / _461;
    float _477 = fma(_407, 0.01200000010430812835693359375, _423);
    float _479 = floor(_477);
    float _481 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _483 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _481;
    float _485 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _487 = _485 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _489 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _491 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _489;
    float _493 = 1.0 / _483;
    float _495 = -_479;
    float _497 = _477 + _495;
    float _499 = 1.0 / _487;
    float _501 = 0.0 + _497;
    float _503 = precise::clamp(_501, 0.0, 1.0);
    float _505 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _445);
    float _507 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _447);
    float _509 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _511 = _503 + _509;
    float _513 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _455);
    float _515 = 1.0 / _491;
    float _517 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _519 = _503 + _517;
    float _521 = _511 * _493;
    float _523 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _505);
    bool _525 = _503 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _527 = isnan(_503);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = fma(_459, _521, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _539 = fma(_465, _521, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _541 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _541;
    float _545 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _547 = _545 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _549 = -_535;
    float _551 = _549 + 1.0;
    float _553 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _507);
    float _555 = fma(_543, _521, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    bool _557 = _503 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _513);
    float _571 = _519 * _499;
    float _573 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _575 = _503 + _573;
    float _577 = _523 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _579 = _567 * _551;
    bool _581 = _503 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_567;
    float _595 = _593 + 1.0;
    float _597 = _575 * _515;
    float _599 = _539 * _579;
    float _601 = _555 * _579;
    float _603 = _537 * _579;
    float _605 = -_591;
    float _607 = _605 + 1.0;
    float _609 = fma(_469, _571, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _611 = fma(_595, (*spvDescriptorSet0.fp_c9)._m0[107].x, _599);
    float _613 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _615 = _613 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _617 = _535 * _607;
    float _619 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _621 = _619 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _623 = fma(_547, _571, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _625 = fma(_595, (*spvDescriptorSet0.fp_c9)._m0[107].y, _601);
    float _627 = fma(_595, (*spvDescriptorSet0.fp_c9)._m0[107].z, _603);
    float _629 = 1.0 / _621;
    float _631 = fma(_609, _617, _611);
    float _633 = fma(_615, _571, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _635 = fma(_623, _617, _625);
    float _637 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _639 = _503 + _637;
    float _641 = fma(_633, _617, _627);
    float _643 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _645 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _643;
    float _647 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _649 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _647;
    float _651 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _653 = _651 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _655 = _569 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _657 = _553 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _659 = _639 * _629;
    float _661 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _663 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _661;
    float _665 = fma(_645, _597, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _667 = fma(_649, _597, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _669 = fma(_431, 0.5, 0.5);
    float _671 = fma(_663, _597, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _673 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _675 = _673 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    bool _677 = _503 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _679 = isnan(_503);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = _669 + _497;
    float _691 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _693 = _691 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _695 = fma(_653, _659, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _697 = -_687;
    float _699 = _697 + 1.0;
    float _701 = fma(_693, _659, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _703 = fma(_675, _659, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _705 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _707 = _591 * _699;
    float _709 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _711 = (*spvDescriptorSet0.fp_c10)._m0[9].z * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _713 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[0].x, _705);
    float _715 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[0].z, _713);
    float _717 = fma(_715, -7.0, _577);
    float _719 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[1].x, _709);
    float _721 = fma((*spvDescriptorSet0.fp_c10)._m0[8].z, (*spvDescriptorSet0.fp_c8)._m0[2].x, _711);
    float _723 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _719);
    float _725 = fma((*spvDescriptorSet0.fp_c10)._m0[10].z, (*spvDescriptorSet0.fp_c8)._m0[2].z, _721);
    float _727 = fma(_723, -7.0, _657);
    float _729 = fma(_725, -7.0, _655);
    float _731 = _729 * _475;
    float _733 = -_717;
    float _735 = fma(_471, _731, _733);
    float _737 = -_727;
    float _739 = fma(_473, _731, _737);
    float _741 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _743 = (*spvDescriptorSet0.fp_c10)._m0[9].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _745 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c8)._m0[0].x, _741);
    float _747 = fma((*spvDescriptorSet0.fp_c10)._m0[8].y, (*spvDescriptorSet0.fp_c8)._m0[1].x, _743);
    float _749 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c8)._m0[0].z, _745);
    float _751 = fma((*spvDescriptorSet0.fp_c10)._m0[10].y, (*spvDescriptorSet0.fp_c8)._m0[1].z, _747);
    float _753 = abs(_749);
    float _755 = abs(_751);
    float _757 = precise::max(_753, _755);
    bool _759 = _757 >= 16.0;
    float _761 = _749;
    float _763 = _751;
    int _766 = as_type<int>(_731);
    if (_759)
    {
        float _768 = _749 * 0.0625;
        _761 = _768;
    }
    float _770 = _761;
    if (_759)
    {
        float _772 = _751 * 0.0625;
        _763 = _772;
    }
    float _774 = _763;
    float _776 = abs(_770);
    bool _778 = _776 != 0.0;
    bool _780 = isnan(_776);
    bool _782 = _778 || _780;
    bool _784 = isnan(0.0);
    bool _786 = _782 || _784;
    float _788 = abs(_774);
    bool _790 = _788 == 0.0;
    float _792 = abs(_774);
    bool _794 = _792 == 0.0;
    bool _796 = !_786;
    bool _798 = _794 && _796;
    bool _800 = false;
    if (_798)
    {
        bool _802 = as_type<int>(_774) >= 0;
        _800 = _802;
    }
    bool _804 = _800;
    int _806 = _804 ? (-1) : 0;
    bool _808 = _804;
    if (_798)
    {
        int _810 = _804 ? 0 : 1078530011;
        _766 = _810;
    }
    int _812 = _766;
    int _814 = _812;
    if (_798)
    {
        int _816 = int(0x80000000) & as_type<int>(_770);
        int _818 = _812 | _816;
        _814 = _818;
    }
    int _820 = _814;
    bool _822 = !_786;
    bool _824 = _822 && _790;
    int _826 = _820;
    float _828 = as_type<float>(_820);
    if (!_824)
    {
        float _830 = abs(_770);
        bool _832 = _830 != as_type<float>(0x7f800000u /* inf */);
        bool _834 = isnan(_830);
        bool _836 = _832 || _834;
        bool _838 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _840 = _836 || _838;
        float _842 = abs(_774);
        bool _844 = _842 == as_type<float>(0x7f800000u /* inf */);
        float _846 = abs(_774);
        bool _848 = _846 == as_type<float>(0x7f800000u /* inf */);
        bool _850 = !_840;
        bool _852 = _848 && _850;
        if (_852)
        {
            bool _854 = as_type<int>(_774) >= 0;
            _806 = _854 ? (-1) : 0;
        }
        int _856 = _806;
        _808 = _856 != 0;
        if (_852)
        {
            _826 = 1075235812;
        }
        int _858 = _826;
        int _860 = _858;
        if (_852)
        {
            int _862 = ~_856;
            int _864 = (_862 != 0) ? _858 : 1061752795;
            _860 = _864;
        }
        int _866 = _860;
        float _868 = as_type<float>(_866);
        if (_852)
        {
            int _870 = int(0x80000000) & as_type<int>(_770);
            int _872 = _866 | _870;
            _868 = as_type<float>(_872);
        }
        float _874 = _868;
        bool _876 = !_840;
        bool _878 = _876 && _844;
        _828 = _874;
        if (!_878)
        {
            float _880 = abs(_770);
            float _882 = abs(_774);
            float _884 = precise::max(_880, _882);
            float _886 = abs(_770);
            float _888 = abs(_774);
            float _890 = precise::min(_886, _888);
            float _892 = 1.0 / _884;
            float _894 = abs(_770);
            float _896 = abs(_774);
            bool _898 = _894 > _896;
            bool _900 = as_type<int>(_774) >= 0;
            float _902 = _890 * _892;
            float _904 = _902 * _902;
            float _906 = _904 + 11.33538818359375;
            float _908 = fma(_904, _906, 28.84246826171875);
            float _910 = fma(_904, _908, 19.6966705322265625);
            float _912 = fma(_904, -0.82336294651031494140625, -5.674867153167724609375);
            float _914 = fma(_904, _912, -6.565555095672607421875);
            float _916 = 1.0 / _910;
            float _918 = _904 * _914;
            float _920 = abs(_770);
            float _922 = abs(_774);
            float _924 = _920 + _922;
            int _926 = as_type<int>(_770) & int(0x80000000);
            float _928 = _902 * _918;
            bool _930 = _924 > as_type<float>(0x7f800000u /* inf */);
            bool _932 = isnan(_924);
            bool _934 = _930 || _932;
            bool _936 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _938 = _934 || _936;
            float _940 = fma(_928, _916, _902);
            float _942 = _940;
            _828 = _924;
            _808 = _900;
            if (_898)
            {
                float _944 = -_940;
                float _946 = _944 + 1.57079637050628662109375;
                _942 = _946;
            }
            float _948 = _942;
            int _950 = as_type<int>(_948);
            if (!_900)
            {
                float _952 = -_948;
                float _954 = _952 + 3.1415927410125732421875;
                _950 = as_type<int>(_954);
            }
            int _956 = _950;
            if (!_938)
            {
                int _958 = _926 | _956;
                _828 = as_type<float>(_958);
            }
        }
    }
    float _960 = _828;
    bool _962 = _808;
    float _964 = _960 * (-0.15915493667125701904296875);
    float _966 = _739 * (-0.3300000131130218505859375);
    float _968 = _735 * 0.3300000131130218505859375;
    float _970 = fma(_429, 0.5, 0.5);
    float _972 = precise::clamp(_970, 0.0, 1.0);
    float _974 = _964 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = fma(_665, _707, _631);
    float _980 = _964 * 6.283185482025146484375;
    float _982 = cos(_980);
    float _984 = _966 * _976;
    float _986 = -_984;
    float _988 = fma(_968, _982, _986);
    float _990 = _966 * _982;
    float _992 = _407 * 0.1599999964237213134765625;
    float _994 = fma(_968, _976, _990);
    float _996 = _992 * 0.15915493667125701904296875;
    float _998 = _996 * 6.283185482025146484375;
    float _1000 = sin(_998);
    float _1002 = fma(_1000, 0.0500000007450580596923828125, 1.0);
    float _1004 = fma(_1000, -0.0500000007450580596923828125, 1.0);
    float _1006 = fma(_988, _1002, 0.5);
    float _1008 = fma(_994, _1004, 0.300000011920928955078125);
    float2 _3172;
    _3172.x = spvDescriptorSet0.fp_t_tcb_34.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_34Smplr, float2(_1006, _1008));
    _3172.y = spvDescriptorSet0.fp_t_tcb_34.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_34Smplr, float2(_1006, _1008));
    float _1010 = _3172.x;
    float _1012 = _1010 * 256.0;
    int _1014 = int(_1012);
    float2 _3183;
    _3183.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_972, _689));
    _3183.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_972, _689));
    float _1016 = _3183.x;
    float _1018 = _1016 * 256.0;
    int _1020 = int(_1018);
    float _1022 = _994 + (-0.1500000059604644775390625);
    float _1024 = _1022 * _1022;
    float _1026 = abs(_988);
    float _1028 = abs(_1022);
    float _1030 = precise::max(_1026, _1028);
    bool _1032 = _1030 >= 16.0;
    float _1034 = _1022;
    float _1036 = _988;
    bool _1038 = _962;
    int _1040 = as_type<int>(_1030);
    if (_1032)
    {
        float _1042 = fma(_994, 0.0625, -0.00937500037252902984619140625);
        _1034 = _1042;
    }
    float _1044 = _1034;
    float _1046 = fma(_988, _988, _1024);
    if (_1032)
    {
        float _1048 = _988 * 0.0625;
        _1036 = _1048;
    }
    float _1050 = _1036;
    float _1052 = abs(_1044);
    bool _1054 = _1052 != 0.0;
    bool _1056 = isnan(_1052);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(0.0);
    bool _1062 = _1058 || _1060;
    float _1064 = abs(_1050);
    bool _1066 = _1064 == 0.0;
    float _1068 = sqrt(_1046);
    float _1070 = abs(_1050);
    bool _1072 = _1070 == 0.0;
    bool _1074 = !_1062;
    bool _1076 = _1072 && _1074;
    if (_1076)
    {
        bool _1078 = as_type<int>(_1050) >= 0;
        _1038 = _1078;
    }
    bool _1080 = _1038;
    int _1082 = _1080 ? (-1) : 0;
    if (_1076)
    {
        int _1084 = _1080 ? 0 : 1078530011;
        _1040 = _1084;
    }
    int _1086 = _1040;
    int _1088 = _1086;
    if (_1076)
    {
        int _1090 = int(0x80000000) & as_type<int>(_1044);
        int _1092 = _1086 | _1090;
        _1088 = _1092;
    }
    int _1094 = _1088;
    bool _1096 = !_1062;
    bool _1098 = _1096 && _1066;
    int _1100 = _1094;
    float _1102 = as_type<float>(_1094);
    if (!_1098)
    {
        float _1104 = abs(_1044);
        bool _1106 = _1104 != as_type<float>(0x7f800000u /* inf */);
        bool _1108 = isnan(_1104);
        bool _1110 = _1106 || _1108;
        bool _1112 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1114 = _1110 || _1112;
        float _1116 = abs(_1050);
        bool _1118 = _1116 == as_type<float>(0x7f800000u /* inf */);
        float _1120 = abs(_1050);
        bool _1122 = _1120 == as_type<float>(0x7f800000u /* inf */);
        bool _1124 = !_1114;
        bool _1126 = _1122 && _1124;
        if (_1126)
        {
            bool _1128 = as_type<int>(_1050) >= 0;
            _1082 = _1128 ? (-1) : 0;
        }
        int _1130 = _1082;
        if (_1126)
        {
            _1100 = 1075235812;
        }
        int _1132 = _1100;
        int _1134 = _1132;
        if (_1126)
        {
            int _1136 = ~_1130;
            int _1138 = (_1136 != 0) ? _1132 : 1061752795;
            _1134 = _1138;
        }
        int _1140 = _1134;
        float _1142 = as_type<float>(_1140);
        if (_1126)
        {
            int _1144 = int(0x80000000) & as_type<int>(_1044);
            int _1146 = _1140 | _1144;
            _1142 = as_type<float>(_1146);
        }
        float _1148 = _1142;
        bool _1150 = !_1114;
        bool _1152 = _1150 && _1118;
        _1102 = _1148;
        if (!_1152)
        {
            float _1154 = abs(_1044);
            float _1156 = abs(_1050);
            float _1158 = precise::max(_1154, _1156);
            float _1160 = abs(_1044);
            float _1162 = abs(_1050);
            float _1164 = precise::min(_1160, _1162);
            float _1166 = 1.0 / _1158;
            float _1168 = abs(_1044);
            float _1170 = abs(_1050);
            bool _1172 = _1168 > _1170;
            bool _1174 = as_type<int>(_1050) >= 0;
            float _1176 = _1164 * _1166;
            float _1178 = _1176 * _1176;
            float _1180 = _1178 + 11.33538818359375;
            float _1182 = fma(_1178, -0.82336294651031494140625, -5.674867153167724609375);
            float _1184 = fma(_1178, _1180, 28.84246826171875);
            float _1186 = fma(_1178, _1182, -6.565555095672607421875);
            float _1188 = fma(_1178, _1184, 19.6966705322265625);
            float _1190 = _1178 * _1186;
            float _1192 = _1176 * _1190;
            float _1194 = 1.0 / _1188;
            float _1196 = fma(_1192, _1194, _1176);
            float _1198 = abs(_1044);
            float _1200 = abs(_1050);
            float _1202 = _1198 + _1200;
            int _1204 = as_type<int>(_1044) & int(0x80000000);
            float _1206 = _1196;
            _1102 = _1202;
            if (_1172)
            {
                float _1208 = -_1196;
                float _1210 = _1208 + 1.57079637050628662109375;
                _1206 = _1210;
            }
            float _1212 = _1206;
            bool _1214 = _1202 > as_type<float>(0x7f800000u /* inf */);
            bool _1216 = isnan(_1202);
            bool _1218 = _1214 || _1216;
            bool _1220 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1222 = _1218 || _1220;
            int _1224 = as_type<int>(_1212);
            if (!_1174)
            {
                float _1226 = -_1212;
                float _1228 = _1226 + 3.1415927410125732421875;
                _1224 = as_type<int>(_1228);
            }
            int _1230 = _1224;
            if (!_1222)
            {
                int _1232 = _1204 | _1230;
                _1102 = as_type<float>(_1232);
            }
        }
    }
    float _1234 = _1102;
    float _1236 = float(uint(_1020));
    float _1238 = _407 * (-0.00999999977648258209228515625);
    float _1240 = float(uint(_1014));
    float _1242 = _1236 * 0.00390625;
    float _1244 = _1240 * 0.00390625;
    float _1246 = fma(_1068, 0.300000011920928955078125, _1238);
    float _1248 = precise::min(_1242, 2.0);
    float _1250 = _1234 * 0.6366198062896728515625;
    float _1252 = precise::min(_1244, 2.0);
    float2 _3511 = float2(_972, _689);
    float3 _1256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3511, float2(0.0), isnan(_3511)), level(_1248)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3511, float2(0.0), isnan(_3511)), level(_1248)).xyz;
    float _1258 = _1256.x;
    float _1260 = _1256.y;
    float _1262 = _1256.z;
    float2 _3526 = float2(_1006, _1008);
    float4 _1265 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_3526, float2(0.0), isnan(_3526)), level(_1252)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_3526, float2(0.0), isnan(_3526)), level(_1252)).xyzw;
    float _1267 = _1265.x;
    float _1269 = _1265.y;
    float _1271 = _1265.z;
    float _1273 = _1265.w;
    float2 _3543 = float2(_1250, _1246);
    float _1275 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_3543, float2(0.0), isnan(_3543))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_3543, float2(0.0), isnan(_3543))).w;
    float _1277 = fma(_319, 2.0, -1.0);
    float _1279 = fma(_321, 2.0, -1.0);
    float _1281 = abs(_151);
    float _1283 = _1281 * 2.0;
    bool _1285 = _503 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _1287 = isnan(_503);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = fma(_323, -0.3333333432674407958984375, 1.0);
    float _1299 = precise::clamp(_1297, 0.0, 1.0);
    float _1301 = abs(_1277);
    float _1303 = precise::max(_1301, 0.699999988079071044921875);
    float _1305 = fma(_671, _707, _641);
    float _1307 = abs(_1279);
    float _1309 = precise::max(_1307, 0.699999988079071044921875);
    float _1311 = abs(_1283);
    float _1313 = log2(_1311);
    float _1315 = precise::min(_1303, 0.98500001430511474609375);
    float _1317 = fma(_667, _707, _635);
    float _1319 = precise::min(_1309, 0.98500001430511474609375);
    float _1321 = abs(_1277);
    bool _1323 = _1321 >= 0.98500001430511474609375;
    bool _1325 = isnan(_1321);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.98500001430511474609375);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = fma(_1315, 3.5087716579437255859375, -2.456140041351318359375);
    float _1337 = abs(_1279);
    bool _1339 = _1337 >= 0.98500001430511474609375;
    bool _1341 = isnan(_1337);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan(0.98500001430511474609375);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = fma(_1319, 3.5087716579437255859375, -2.456140041351318359375);
    float _1353 = _1335 * _1351;
    float _1355 = fma(_1299, -2.0, 3.0);
    float _1357 = _1299 * _1299;
    float _1359 = _1353 * _1353;
    float _1361 = _1355 * _1357;
    float _1363 = _1359 * 0.100000001490116119384765625;
    float _1365 = _1313 * 4.0;
    float _1367 = in.m_55.y;
    float _1369 = fma(_1333, _1349, _1363);
    float _1371 = abs(_259);
    float _1373 = _1371 * 2.0;
    float _1375 = exp2(_1365);
    float _1377 = _323 * 0.3333333432674407958984375;
    float _1379 = precise::clamp(_1377, 0.0, 1.0);
    float _1381 = -_1295;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_1379, -2.0, 3.0);
    float _1387 = _1379 * _1379;
    float _1389 = _687 * _1383;
    float _1391 = abs(_1373);
    float _1393 = log2(_1391);
    float _1395 = _1385 * _1387;
    float _1397 = fma(_701, _1389, _1317);
    float _1399 = fma(_695, _1389, _978);
    float _1401 = fma(_703, _1389, _1305);
    float _1403 = fma(_1295, (*spvDescriptorSet0.fp_c9)._m0[111].y, _1397);
    float _1405 = fma(_1295, (*spvDescriptorSet0.fp_c9)._m0[111].x, _1399);
    float _1407 = fma(_1295, (*spvDescriptorSet0.fp_c9)._m0[111].z, _1401);
    float _1409 = _1393 * 4.0;
    float _1411 = -_1367;
    float _1413 = _1411 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _1415 = exp2(_1409);
    float _1417 = _1413 * _1413;
    float _1419 = precise::max(_1375, _1415);
    float _1421 = in.m_57.z;
    float _1423 = gl_FragCoord.w;
    float _1425 = _1421 * _1423;
    float _1427 = -_1419;
    float _1429 = _1427 + 1.0;
    float _1431 = in.m_57.x;
    float _1433 = gl_FragCoord.w;
    float _1435 = _1431 * _1433;
    float _1437 = _1395 * _1429;
    float _1439 = in.m_55.x;
    float _1441 = _87 * _1425;
    float _1443 = -_1439;
    float _1445 = _1443 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _1447 = fma(_1445, _1445, _1417);
    float _1449 = in.m_55.z;
    float _1451 = -_1449;
    float _1453 = _1451 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _1455 = fma(_1453, _1453, _1447);
    float _1457 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _1459 = sqrt(_1455);
    float _1461 = _1457 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _1463 = _1459 * _1461;
    float _1465 = precise::max(_1459, 25.0);
    float _1467 = precise::max(_1463, 6.0);
    float _1469 = precise::min(_1465, 80.0);
    float _1471 = precise::min(_1467, 8.0);
    float _1473 = in.m_57.y;
    float _1475 = gl_FragCoord.w;
    float _1477 = _1473 * _1475;
    float _1479 = fma(_1469, 0.01818181760609149932861328125, -0.454545438289642333984375);
    float _1481 = fma(_1471, 0.5, -3.0);
    float _1483 = fma(_1479, 0.20000000298023223876953125, 1.60000002384185791015625);
    float _1485 = precise::max(_1068, 0.100000001490116119384765625);
    float _1487 = precise::max(0.0, _1068);
    float _1489 = 1.0 / _1483;
    float _1491 = precise::min(_1485, 0.89999997615814208984375);
    float _1493 = precise::min(_1483, _1487);
    float _1495 = fma(_1491, -1.25000011920928955078125, 1.125);
    float _1497 = _87 * _1435;
    float _1499 = fma(_1469, 0.001090909005142748355865478515625, -0.02727272547781467437744140625);
    float _1501 = _1495 * _1495;
    float _1503 = -_1493;
    float _1505 = fma(_1503, _1489, 1.0);
    float _1507 = _1505 * _1505;
    float _1509 = _87 * _1477;
    float _1511 = fma(_1469, 0.01818181760609149932861328125, -0.204545438289642333984375);
    float _1513 = _1495 * _1501;
    float _1515 = _1258 * _1258;
    float _1517 = _1260 * _1260;
    float _1519 = _1262 * _1262;
    float _1521 = _1271 * _1271;
    float _1523 = _425 * _1515;
    float _1525 = _425 * _1517;
    float _1527 = _425 * _1519;
    float _1529 = _1505 * _1507;
    float _1531 = _1523 * _1405;
    float _1533 = _1525 * _1403;
    float _1535 = -_1497;
    float _1537 = _1535 + 2.0;
    float _1539 = _1267 * _1267;
    float _1541 = -_1273;
    float _1543 = _1541 + 1.0;
    float _1545 = _1527 * _1407;
    float _1547 = -_1509;
    float _1549 = _1547 + 2.0;
    float _1551 = fma(_1539, _1537, _1497);
    float _1553 = _1543 * _1361;
    float _1555 = _1269 * _1269;
    float _1557 = _1497 * _1369;
    float _1559 = _1273 * _1551;
    float _1561 = _1509 * _1369;
    float _1563 = -_1441;
    float _1565 = _1563 + 2.0;
    float _1567 = _1441 * _1369;
    float _1569 = _1499 * _1553;
    float _1571 = fma(_1555, _1549, _1509);
    float _1573 = fma(_1531, _1543, _1557);
    float _1575 = fma(_1533, _1543, _1561);
    float _1577 = fma(_1275, _1529, _1513);
    float _1579 = fma(_1521, _1565, _1441);
    float _1581 = fma(_1545, _1543, _1567);
    float _1583 = _1497 * _1569;
    float _1585 = _1509 * _1569;
    float _1587 = _1441 * _1569;
    float _1589 = _1273 * _1571;
    float _1591 = _1273 * _1579;
    float _1593 = fma(_1573, _1437, _1583);
    float _1595 = _1577 * _1511;
    float _1597 = fma(_1575, _1437, _1585);
    float _1599 = fma(_1581, _1437, _1587);
    float _1601 = fma(_1593, _1481, _1559);
    float _1603 = _1543 * _1595;
    float _1605 = fma(_1597, _1481, _1589);
    float _1607 = fma(_1599, _1481, _1591);
    float _1609 = fma(_1497, _1603, _1601);
    float _1611 = fma(_1509, _1603, _1605);
    float _1613 = fma(_1441, _1603, _1607);
    float _1615 = _1599;
    if (!_185)
    {
        out.m_60.x = _1609;
        out.m_60.y = _1611;
        out.m_60.z = _1613;
        out.m_60.w = 1.0;
        return out;
    }
    float _1617 = _1611 * 0.715200006961822509765625;
    float _1619 = fma(_1609, 0.2125999927520751953125, _1617);
    float _1621 = fma(_1613, 0.072200000286102294921875, _1619);
    bool _1623 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1625 = 1.0 / _1621;
    float _1627 = 0.0 + _173;
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    float _1631 = _1629;
    if (_1623)
    {
        float _1633 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1635 = _129 + _1633;
        _193 = _1635;
    }
    float _1637 = _193;
    float _1639 = _1625 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1641 = precise::clamp(_1639, 0.0, 1.0);
    if (_1623)
    {
        float _1643 = _1637 * 8.0;
        float _1645 = precise::clamp(_1643, 0.0, 1.0);
        _1615 = _1645;
    }
    float _1647 = _1615;
    float _1649 = fma(_1641, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_1623)
    {
        float _1651 = _1629 * _1647;
        _1631 = _1651;
    }
    float _1653 = _1631;
    float _1655 = _1609 * _1649;
    float _1657 = _1611 * _1649;
    float _1659 = _1613 * _1649;
    float _1661 = 0.0 + _1653;
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    out.m_60.x = _1655;
    out.m_60.y = _1657;
    out.m_60.z = _1659;
    out.m_60.w = _1663;
    return out;
}

