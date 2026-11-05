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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_39 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _689 = float2(_71, _73);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).w;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = _69 * _81;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = _69 * _87;
    float _105 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _107 = _103 + _105;
    float _109 = _69 * _101;
    float _111 = 0.0 + _75;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _113 * _95;
    bool _119 = _115 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _121 = isnan(_115);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _127 = _123 || _125;
    if (!_127)
    {
        discard_fragment();
    }
    float _129 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _131 = _109 + _129;
    float _133 = _69 * _93;
    float _135 = _131 * (*spvDescriptorSet0.fp_c10)._m0[9].x;
    float _137 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _139 = _133 + _137;
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c10)._m0[8].x, _135);
    float _143 = fma(_139, (*spvDescriptorSet0.fp_c10)._m0[10].x, _141);
    float _145 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _147 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _145;
    float _149 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _151 = _149 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _153 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (-0.0199999995529651641845703125);
    float _155 = 1.0 / _147;
    float _157 = fma(_143, 0.07999999821186065673828125, _153);
    float _159 = floor(_157);
    float _161 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _163 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _161;
    float _165 = 1.0 / _151;
    float _167 = -_159;
    float _169 = _157 + _167;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _175 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _173;
    float _177 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _179 = _171 + _177;
    float _181 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _183 = _171 + _181;
    float _185 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _187 = _171 + _185;
    float _189 = _179 * _155;
    float _191 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _193 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _191;
    float _195 = _183 * _165;
    float _197 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _199 = _197 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _201 = fma(_175, _189, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _203 = fma(_163, _189, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _205 = fma(_193, _189, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _207 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _211 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _213 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _211;
    float _215 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _217 = _215 + (*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _219 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _221 = _219 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _223 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _225 = _171 + _223;
    float _227 = 1.0 / _213;
    float _229 = fma(_199, _195, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _231 = fma(_221, _195, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _233 = fma(_209, _195, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _235 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _237 = _171 + _235;
    float _239 = 1.0 / _217;
    float _241 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _243 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _241;
    float _245 = _225 * _227;
    float _247 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _249 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _247;
    float _251 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _253 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _251;
    float _255 = fma(_243, _245, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _257 = fma(_249, _245, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _259 = fma(_253, _245, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _261 = _237 * _239;
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[126].x;
    float _265 = _263 + (*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _267 = -(*spvDescriptorSet0.fp_c9)._m0[126].y;
    float _269 = _267 + (*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _271 = -(*spvDescriptorSet0.fp_c9)._m0[126].z;
    float _273 = _271 + (*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _277 = _171 + _275;
    float _279 = fma(_265, _261, (*spvDescriptorSet0.fp_c9)._m0[126].x);
    float _281 = fma(_269, _261, (*spvDescriptorSet0.fp_c9)._m0[126].y);
    float _283 = fma(_273, _261, (*spvDescriptorSet0.fp_c9)._m0[126].z);
    float _285 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _287 = (*spvDescriptorSet0.fp_c9)._m0[128].w + _285;
    float _289 = -(*spvDescriptorSet0.fp_c9)._m0[128].w;
    float _291 = _289 + (*spvDescriptorSet0.fp_c9)._m0[129].w;
    float _293 = 1.0 / _287;
    float _295 = 1.0 / _291;
    float _297 = -(*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _299 = (*spvDescriptorSet0.fp_c9)._m0[128].z + _297;
    float _301 = _277 * _293;
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _305 = (*spvDescriptorSet0.fp_c9)._m0[128].x + _303;
    float _307 = -(*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _309 = (*spvDescriptorSet0.fp_c9)._m0[128].y + _307;
    float _311 = fma(_299, _301, (*spvDescriptorSet0.fp_c9)._m0[127].z);
    float _313 = fma(_305, _301, (*spvDescriptorSet0.fp_c9)._m0[127].x);
    float _315 = fma(_309, _301, (*spvDescriptorSet0.fp_c9)._m0[127].y);
    float _317 = _187 * _295;
    float _319 = -(*spvDescriptorSet0.fp_c9)._m0[128].x;
    float _321 = _319 + (*spvDescriptorSet0.fp_c9)._m0[129].x;
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[128].z;
    float _325 = _323 + (*spvDescriptorSet0.fp_c9)._m0[129].z;
    bool _327 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _329 = isnan(_171);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.fp_c9)._m0[128].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c9)._m0[129].y;
    bool _343 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _345 = isnan(_171);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = fma(_321, _317, (*spvDescriptorSet0.fp_c9)._m0[128].x);
    float _357 = fma(_325, _317, (*spvDescriptorSet0.fp_c9)._m0[128].z);
    float _359 = -_337;
    float _361 = _359 + 1.0;
    float _363 = fma(_341, _317, (*spvDescriptorSet0.fp_c9)._m0[128].y);
    float _365 = _353 * _361;
    float _367 = -_353;
    float _369 = _367 + 1.0;
    float _371 = _201 * _365;
    float _373 = _203 * _365;
    float _375 = _205 * _365;
    float _377 = fma(_369, (*spvDescriptorSet0.fp_c9)._m0[123].x, _371);
    bool _379 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _381 = isnan(_171);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = fma(_369, (*spvDescriptorSet0.fp_c9)._m0[123].y, _373);
    float _393 = fma(_369, (*spvDescriptorSet0.fp_c9)._m0[123].z, _375);
    float _395 = -_389;
    float _397 = _395 + 1.0;
    float _399 = _337 * _397;
    float _401 = fma(_231, _399, _377);
    bool _403 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _405 = isnan(_171);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = fma(_229, _399, _391);
    float _417 = fma(_233, _399, _393);
    float _419 = -_413;
    float _421 = _419 + 1.0;
    float _423 = _389 * _421;
    bool _425 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[127].w;
    bool _427 = isnan(_171);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.fp_c9)._m0[127].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = fma(_257, _423, _401);
    float _439 = fma(_259, _423, _415);
    float _441 = -_435;
    float _443 = _441 + 1.0;
    float _445 = fma(_255, _423, _417);
    float _447 = in.m_41.z;
    float _449 = gl_FragCoord.w;
    float _451 = _447 * _449;
    float _453 = _413 * _443;
    bool _455 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[128].w;
    bool _457 = isnan(_171);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.fp_c9)._m0[128].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    bool _467 = _171 >= (*spvDescriptorSet0.fp_c9)._m0[129].w;
    bool _469 = isnan(_171);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.fp_c9)._m0[129].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = fma(_279, _453, _437);
    float _481 = fma(_281, _453, _439);
    float _483 = -_465;
    float _485 = _483 + 1.0;
    float _487 = fma(_283, _453, _445);
    float _489 = in.m_41.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = _435 * _485;
    float _497 = -_477;
    float _499 = _497 + 1.0;
    float _501 = fma(_313, _495, _479);
    float _503 = _465 * _499;
    float _505 = fma(_315, _495, _481);
    float _507 = fma(_311, _495, _487);
    float _509 = fma(_355, _503, _501);
    float _511 = fma(_363, _503, _505);
    float _513 = fma(_357, _503, _507);
    float _515 = in.m_41.y;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = fma(_477, (*spvDescriptorSet0.fp_c9)._m0[129].x, _509);
    float _523 = fma(_477, (*spvDescriptorSet0.fp_c9)._m0[129].y, _511);
    float _525 = fma(_477, (*spvDescriptorSet0.fp_c9)._m0[129].z, _513);
    float _527 = _521 + _75;
    float _529 = _69 * _451;
    float _531 = _69 * _493;
    float _533 = _69 * _519;
    float _535 = _523 + _75;
    float _537 = _525 + _75;
    float _539 = _527 * _531;
    float _541 = _535 * _533;
    float _543 = _537 * _529;
    if (!_127)
    {
        out.m_44.x = _539;
        out.m_44.y = _541;
        out.m_44.z = _543;
        out.m_44.w = _75;
        return out;
    }
    float _545 = _541 * 0.715200006961822509765625;
    float _547 = in.m_46.w;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float _553 = in.m_46.z;
    float _555 = gl_FragCoord.w;
    float _557 = _553 * _555;
    float _559 = in.m_46.x;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = fma(_539, 0.2125999927520751953125, _545);
    float _567 = in.m_46.y;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = fma(_543, 0.072200000286102294921875, _565);
    bool _575 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _577 = 1.0 / _573;
    float _579 = _577 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    float _583 = _69 * _551;
    float _585 = fma(_581, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _587 = _69 * _557;
    float _589 = _585 * _583;
    float _591 = 0.0 + _115;
    float _593 = precise::clamp(_591, 0.0, 1.0);
    float _595 = _69 * _563;
    float _597 = _69 * _571;
    float _599 = fma(_543, _589, _587);
    float _601 = fma(_539, _589, _595);
    float _603 = fma(_541, _589, _597);
    float _605 = _587;
    if (!_575)
    {
        _605 = _593;
    }
    float _607 = _605;
    bool _609 = !_575;
    float _611 = _607;
    if (!_609)
    {
        float _613 = in.m_48.w;
        float _615 = gl_FragCoord.w;
        float _617 = _613 * _615;
        float _619 = in.m_48.z;
        float _621 = gl_FragCoord.w;
        float _623 = _619 * _621;
        float _625 = _69 * _617;
        float _627 = _69 * _623;
        float _629 = 1.0 / _625;
        float _631 = _627 * _629;
        float _633 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _635 = fma(_631, (*spvDescriptorSet0.fp_c8)._m0[30].w, _633);
        float _637 = 1.0 / _635;
        float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _641 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _643 = fma(_637, _639, _641);
        float _645 = _643 * 8.0;
        float _647 = precise::clamp(_645, 0.0, 1.0);
        float _649 = _593 * _647;
        _611 = _649;
    }
    float _651 = _611;
    float _653 = 0.0 + _651;
    float _655 = precise::clamp(_653, 0.0, 1.0);
    out.m_44.x = _601;
    out.m_44.y = _603;
    out.m_44.z = _599;
    out.m_44.w = _655;
    return out;
}

