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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _703 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).w;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_37.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_39.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_39.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_41.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = _75 * _87;
    float _139 = _75 * _93;
    float _141 = _75 * _99;
    float _143 = _75 * _105;
    float _145 = _137 * _137;
    float _147 = _75 * _117;
    float _149 = _75 * _129;
    float _151 = fma(_139, _139, _145);
    float _153 = -_149;
    float _155 = _153 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _157 = fma(_141, _141, _151);
    float _159 = _155 * _155;
    float _161 = rsqrt(_157);
    float _163 = _143 * _143;
    float _165 = _137 * _161;
    float _167 = _139 * _161;
    float _169 = _141 * _161;
    float _171 = _165 * _165;
    float _173 = fma(_167, _167, _171);
    float _175 = _75 * _111;
    float _177 = fma(_169, _169, _173);
    float _179 = fma(_175, _175, _163);
    float _181 = rsqrt(_177);
    float _183 = fma(_147, _147, _179);
    float _185 = _75 * _123;
    float _187 = -_185;
    float _189 = _187 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _191 = rsqrt(_183);
    float _193 = fma(_189, _189, _159);
    float _195 = _167 * _181;
    float _197 = _165 * _181;
    float _199 = _169 * _181;
    float _201 = _75 * _135;
    float _203 = -_201;
    float _205 = _203 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _207 = _175 * _191;
    float _209 = _147 * _191;
    float _211 = _143 * _191;
    float _213 = fma(_205, _205, _193);
    float _215 = _199 * _207;
    float _217 = _197 * _209;
    float _219 = -_215;
    float _221 = fma(_195, _209, _219);
    float _223 = _195 * _211;
    float _225 = -_217;
    float _227 = fma(_199, _211, _225);
    float _229 = rsqrt(_213);
    float _231 = _221 * _221;
    float _233 = -_223;
    float _235 = fma(_197, _207, _233);
    float _237 = fma(_227, _227, _231);
    float _239 = fma(_235, _235, _237);
    float _241 = rsqrt(_239);
    float _243 = _155 * _229;
    float _245 = _189 * _229;
    float _247 = _205 * _229;
    float _249 = _221 * _241;
    float _251 = _227 * _241;
    float _253 = _235 * _241;
    float _255 = _249 * _243;
    float _257 = _211 * _243;
    float _259 = _197 * _243;
    float _261 = fma(_251, _245, _255);
    float _263 = fma(_207, _245, _257);
    float _265 = fma(_195, _245, _259);
    float _267 = in.m_35.w;
    float _269 = gl_FragCoord.w;
    float _271 = _267 * _269;
    float _273 = fma(_253, _247, _261);
    float _275 = fma(_209, _247, _263);
    float _277 = fma(_199, _247, _265);
    float _279 = _273 * _273;
    float _281 = fma(_275, _275, _279);
    float _283 = fma(_277, _277, _281);
    float _285 = in.m_35.z;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = rsqrt(_283);
    float _293 = _291 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _295 = _81 * _293;
    float _297 = _275 * _295;
    float _299 = _273 * _295;
    float _301 = _75 * _289;
    float _303 = _75 * _271;
    float _305 = fma(_77, 0.5, _297);
    float _307 = fma(_79, 0.5, _299);
    float2 _1050 = float2(_305, _307);
    float _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1050, float2(0.0), isnan(_1050))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1050, float2(0.0), isnan(_1050))).w;
    float2 _1058 = float2(_301, _303);
    float _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1058, float2(0.0), isnan(_1058))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1058, float2(0.0), isnan(_1058))).w;
    float _313 = in.m_43.w;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_45.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = _75 * _317;
    float _327 = _75 * _323;
    float _329 = in.m_47.x;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = fma(_309, 0.300000011920928955078125, 0.699999988079071044921875);
    float _337 = _335 * _325;
    float _339 = _311 * _337;
    float _341 = 0.0 + _339;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _343 * _327;
    bool _349 = _345 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _351 = isnan(_345);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _357 = _353 || _355;
    if (!_357)
    {
        discard_fragment();
    }
    float _359 = _75 * _333;
    float _361 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _363 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _361;
    float _365 = precise::max(_359, -27.0);
    float _367 = 1.0 / _363;
    float _369 = precise::min(_365, 27.0);
    float _371 = fma(_369, 0.0185185186564922332763671875, 0.5);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _377 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _375;
    float _379 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _381 = _373 + _379;
    bool _383 = _373 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _385 = isnan(_373);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = _381 * _367;
    float _397 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _399 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _397;
    float _401 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _403 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _401;
    bool _405 = _373 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _407 = isnan(_373);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -_393;
    float _419 = _417 + 1.0;
    float _421 = fma(_399, _395, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _423 = fma(_403, _395, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _425 = fma(_377, _395, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _427 = _415 * _419;
    float _429 = -_415;
    float _431 = _429 + 1.0;
    float _433 = _421 * _427;
    float _435 = _423 * _427;
    float _437 = _425 * _427;
    float _439 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _441 = _373 + _439;
    float _443 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[123].x, _433);
    float _445 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[123].y, _435);
    float _447 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[123].z, _437);
    float _449 = fma(_393, (*spvDescriptorSet0.fp_c9)._m0[124].x, _443);
    float _451 = fma(_393, (*spvDescriptorSet0.fp_c9)._m0[124].y, _445);
    float _453 = fma(_393, (*spvDescriptorSet0.fp_c9)._m0[124].z, _447);
    float _455 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _457 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _455;
    float _459 = 1.0 / _457;
    float _461 = _441 * _459;
    float _463 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _465 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _463;
    float _467 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _469 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _467;
    float _471 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _473 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _471;
    bool _475 = _373 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _477 = isnan(_373);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = fma(_465, _461, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _489 = fma(_469, _461, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _491 = fma(_473, _461, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _493 = _373 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _495 = isnan(_373);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _503 * _507;
    float _511 = -_503;
    float _513 = _511 + 1.0;
    float _515 = _487 * _509;
    float _517 = _489 * _509;
    float _519 = _491 * _509;
    float _521 = fma(_513, (*spvDescriptorSet0.fp_c9)._m0[107].x, _515);
    float _523 = fma(_513, (*spvDescriptorSet0.fp_c9)._m0[107].y, _517);
    float _525 = fma(_513, (*spvDescriptorSet0.fp_c9)._m0[107].z, _519);
    float _527 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[108].x, _521);
    float _529 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[108].y, _523);
    float _531 = fma(_485, (*spvDescriptorSet0.fp_c9)._m0[108].z, _525);
    float _533 = -_449;
    float _535 = _533 + _527;
    float _537 = -_451;
    float _539 = _537 + _529;
    float _541 = -_453;
    float _543 = _541 + _531;
    float _545 = fma(_309, _535, _449);
    float _547 = _309 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _549 = fma(_309, _539, _451);
    float _551 = fma(_309, _543, _453);
    float _553 = fma(_545, (*spvDescriptorSet0.fp_c9)._m0[106].x, _547);
    float _555 = fma(_549, (*spvDescriptorSet0.fp_c9)._m0[106].x, _547);
    float _557 = fma(_551, (*spvDescriptorSet0.fp_c9)._m0[106].x, _547);
    if (!_357)
    {
        out.m_50.x = _553;
        out.m_50.y = _555;
        out.m_50.z = _557;
        out.m_50.w = _339;
        return out;
    }
    float _559 = _555 * 0.715200006961822509765625;
    float _561 = in.m_52.w;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_52.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_52.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = fma(_553, 0.2125999927520751953125, _559);
    float _581 = in.m_52.y;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = fma(_557, 0.072200000286102294921875, _579);
    bool _589 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _591 = 1.0 / _587;
    float _593 = _591 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _595 = precise::clamp(_593, 0.0, 1.0);
    float _597 = _75 * _565;
    float _599 = fma(_595, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _601 = _75 * _571;
    float _603 = _599 * _597;
    float _605 = 0.0 + _345;
    float _607 = precise::clamp(_605, 0.0, 1.0);
    float _609 = _75 * _577;
    float _611 = _75 * _585;
    float _613 = fma(_557, _603, _601);
    float _615 = fma(_553, _603, _609);
    float _617 = fma(_555, _603, _611);
    float _619 = _601;
    if (!_589)
    {
        _619 = _607;
    }
    float _621 = _619;
    bool _623 = !_589;
    float _625 = _621;
    if (!_623)
    {
        float _627 = in.m_54.w;
        float _629 = gl_FragCoord.w;
        float _631 = _627 * _629;
        float _633 = in.m_54.z;
        float _635 = gl_FragCoord.w;
        float _637 = _633 * _635;
        float _639 = _75 * _631;
        float _641 = _75 * _637;
        float _643 = 1.0 / _639;
        float _645 = _641 * _643;
        float _647 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _649 = fma(_645, (*spvDescriptorSet0.fp_c8)._m0[30].w, _647);
        float _651 = 1.0 / _649;
        float _653 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _655 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _657 = fma(_651, _653, _655);
        float _659 = _657 * 8.0;
        float _661 = precise::clamp(_659, 0.0, 1.0);
        float _663 = _607 * _661;
        _625 = _663;
    }
    float _665 = _625;
    float _667 = 0.0 + _665;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    out.m_50.x = _615;
    out.m_50.y = _617;
    out.m_50.z = _613;
    out.m_50.w = _669;
    return out;
}

