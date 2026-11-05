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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_41 [[user(locn2), flat]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_33 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_50 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _690 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_690, float2(0.0), isnan(_690))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_690, float2(0.0), isnan(_690))).xw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_35.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _73 * _91;
    float _107 = _73 * _97;
    float _109 = in.m_41.x;
    float _111 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _113 = precise::max(_109, _111);
    float _115 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _117 = precise::max(_109, _115);
    float _119 = precise::min(_113, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _121 = precise::min(_117, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _123 = _119 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _125 = _121 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _127 = _85 * _105;
    float _129 = _127 * _107;
    float _131 = _73 * _103;
    float _133 = 0.0 + _129;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = _135 * _131;
    bool _141 = _137 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _143 = isnan(_137);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _149 = _145 || _147;
    if (!_149)
    {
        discard_fragment();
    }
    float _151 = (*spvDescriptorSet0.fp_c9)._m0[191].x + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _153 = (*spvDescriptorSet0.fp_c9)._m0[191].y + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _155 = 1.0 / _151;
    float _157 = 1.0 / _153;
    float _159 = _123 * _155;
    float _161 = -_159;
    float _163 = fma(_125, _157, _161);
    float _165 = in.m_43.x;
    float _167 = fma(_165, _163, _159);
    float _169 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _171 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _169;
    float _173 = in.m_45.x;
    float _175 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _177 = _175 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _179 = 1.0 / _171;
    float _181 = 1.0 / _177;
    float _183 = fma(_173, 0.100000001490116119384765625, _167);
    float _185 = floor(_183);
    float _187 = -_185;
    float _189 = _183 + _187;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _195 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _193;
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _199 = _191 + _197;
    float _201 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _203 = _191 + _201;
    float _205 = _199 * _181;
    float _207 = _203 * _179;
    float _209 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _211 = _209 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _213 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _215 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _213;
    float _217 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _219 = _217 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _221 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _223 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _221;
    bool _225 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _227 = isnan(_191);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _239 = _237 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _241 = fma(_195, _207, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _243 = fma(_223, _207, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _245 = fma(_215, _207, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _247 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _249 = isnan(_191);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -_235;
    float _261 = _259 + 1.0;
    float _263 = fma(_211, _205, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _265 = fma(_239, _205, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _267 = fma(_219, _205, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _269 = _257 * _261;
    float _271 = -_257;
    float _273 = _271 + 1.0;
    float _275 = _241 * _269;
    float _277 = _243 * _269;
    float _279 = _245 * _269;
    float _281 = fma(_273, (*spvDescriptorSet0.fp_c9)._m0[107].x, _275);
    float _283 = fma(_273, (*spvDescriptorSet0.fp_c9)._m0[107].y, _277);
    float _285 = fma(_273, (*spvDescriptorSet0.fp_c9)._m0[107].z, _279);
    bool _287 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _289 = isnan(_191);
    bool _291 = _287 || _289;
    bool _293 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _295 = _291 || _293;
    float _297 = float(_295);
    float _299 = -_297;
    float _301 = _299 + 1.0;
    float _303 = _235 * _301;
    float _305 = fma(_263, _303, _281);
    float _307 = fma(_265, _303, _283);
    float _309 = fma(_267, _303, _285);
    float _311 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _313 = _191 + _311;
    bool _315 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _317 = isnan(_191);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _329 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _327;
    float _331 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _333 = _331 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _335 = -_325;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _329;
    float _341 = _297 * _337;
    float _343 = 1.0 / _333;
    float _345 = _313 * _339;
    float _347 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _349 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _347;
    float _351 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _353 = _191 + _351;
    float _355 = fma(_349, _345, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _357 = _353 * _343;
    float _359 = fma(_355, _341, _305);
    float _361 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _363 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _361;
    bool _365 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _367 = isnan(_191);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _379 = _377 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _381 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _383 = _381 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _385 = fma(_363, _345, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _387 = -_375;
    float _389 = _387 + 1.0;
    float _391 = fma(_383, _357, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _393 = fma(_385, _341, _307);
    float _395 = _325 * _389;
    float _397 = fma(_379, _357, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    bool _399 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _401 = isnan(_191);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _413 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _411;
    float _415 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _417 = _415 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _419 = fma(_397, _395, _359);
    float _421 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _423 = _191 + _421;
    float _425 = fma(_413, _345, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _427 = fma(_417, _357, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _429 = fma(_391, _395, _393);
    float _431 = fma(_425, _341, _309);
    float _433 = fma(_427, _395, _431);
    float _435 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _437 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _435;
    float _439 = -_409;
    float _441 = _439 + 1.0;
    float _443 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _445 = _443 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _447 = _375 * _441;
    float _449 = 1.0 / _437;
    float _451 = 1.0 / _445;
    float _453 = _423 * _449;
    float _455 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _457 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _455;
    float _459 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _461 = _191 + _459;
    bool _463 = _191 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _465 = isnan(_191);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_457, _453, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _477 = _461 * _451;
    float _479 = fma(_475, _447, _419);
    float _481 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _483 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _481;
    float _485 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _487 = _485 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _489 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _491 = _489 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _493 = fma(_483, _453, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _495 = fma(_487, _477, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _497 = fma(_491, _477, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _499 = fma(_493, _447, _429);
    float _501 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _503 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _501;
    float _505 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _507 = _505 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _509 = fma(_503, _453, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _511 = fma(_507, _477, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _513 = fma(_509, _447, _433);
    float _515 = -_473;
    float _517 = _515 + 1.0;
    float _519 = _409 * _517;
    float _521 = fma(_495, _519, _479);
    float _523 = fma(_497, _519, _499);
    float _525 = fma(_511, _519, _513);
    float _527 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[113].x, _521);
    float _529 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[113].y, _523);
    float _531 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[113].z, _525);
    float _533 = (*spvDescriptorSet0.fp_c9)._m0[106].x * 0.5;
    float _535 = _527 * _533;
    float _537 = _529 * _533;
    float _539 = _531 * _533;
    float _541 = fma(_535, _83, _535);
    float _543 = fma(_537, _83, _537);
    float _545 = fma(_539, _83, _539);
    if (!_149)
    {
        out.m_48.x = _541;
        out.m_48.y = _543;
        out.m_48.z = _545;
        out.m_48.w = _129;
        return out;
    }
    float _547 = _543 * 0.715200006961822509765625;
    float _549 = in.m_50.w;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_50.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_50.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = fma(_541, 0.2125999927520751953125, _547);
    float _569 = in.m_50.y;
    float _571 = gl_FragCoord.w;
    float _573 = _569 * _571;
    float _575 = fma(_545, 0.072200000286102294921875, _567);
    bool _577 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _579 = 1.0 / _575;
    float _581 = _579 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _583 = precise::clamp(_581, 0.0, 1.0);
    float _585 = _73 * _553;
    float _587 = fma(_583, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _589 = _73 * _559;
    float _591 = _587 * _585;
    float _593 = 0.0 + _137;
    float _595 = precise::clamp(_593, 0.0, 1.0);
    float _597 = _73 * _565;
    float _599 = _73 * _573;
    float _601 = fma(_545, _591, _589);
    float _603 = fma(_541, _591, _597);
    float _605 = fma(_543, _591, _599);
    float _607 = _589;
    if (!_577)
    {
        _607 = _595;
    }
    float _609 = _607;
    bool _611 = !_577;
    float _613 = _609;
    if (!_611)
    {
        float _615 = in.m_52.w;
        float _617 = gl_FragCoord.w;
        float _619 = _615 * _617;
        float _621 = in.m_52.z;
        float _623 = gl_FragCoord.w;
        float _625 = _621 * _623;
        float _627 = _73 * _619;
        float _629 = _73 * _625;
        float _631 = 1.0 / _627;
        float _633 = _629 * _631;
        float _635 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _637 = fma(_633, (*spvDescriptorSet0.fp_c8)._m0[30].w, _635);
        float _639 = 1.0 / _637;
        float _641 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _643 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _645 = fma(_639, _641, _643);
        float _647 = _645 * 8.0;
        float _649 = precise::clamp(_647, 0.0, 1.0);
        float _651 = _595 * _649;
        _613 = _651;
    }
    float _653 = _613;
    float _655 = 0.0 + _653;
    float _657 = precise::clamp(_655, 0.0, 1.0);
    out.m_48.x = _603;
    out.m_48.y = _605;
    out.m_48.z = _601;
    out.m_48.w = _657;
    return out;
}

