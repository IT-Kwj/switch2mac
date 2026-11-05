#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_52 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_40 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
    bool _173 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1484 = as_type<float>(_93);
        out.gl_Position.z = _1484;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1554 = as_type<float>(_131);
        out.gl_Position.z = _1554;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _137 = as_type<int>(_133) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_133) & 2;
    bool _143 = _141 != 0;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_135;
    float _171;
    if (!_153)
    {
        float _155 = in.m_40.x;
        float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _161 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _163 = _161 * _157;
        float _165 = floor(_163);
        float _167 = -_165;
        float _169 = _163 + _167;
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = float(_77);
        float _177 = 1.0 / _175;
        float _179 = _111 * _177;
        _171 = _179;
    }
    _173 = false;
    float _181 = _171;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _181 + _183;
    bool _187 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _189 = isnan(_181);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    bool _199 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _201 = isnan(_181);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -_197;
    float _221 = _219 + 1.0;
    float _223 = 1.0 / _213;
    bool _225 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_181);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = _209 * _221;
    float _239 = -_209;
    float _241 = _239 + 1.0;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = _235 * _241;
    float _247 = 1.0 / _217;
    float _249 = -_235;
    float _251 = _249 + 1.0;
    float _253 = _185 * _223;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _181 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_261, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _257 * _247;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _277 = _267 * _245;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _283 = _269 * _245;
    float _285 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _289 = fma(_281, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _291 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _293 = fma(_285, _237, _287);
    float _295 = fma(_289, _237, _291);
    float _297 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].x, _293);
    float _299 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].y, _295);
    bool _301 = !_243;
    float _319;
    if (!_301)
    {
        float _303 = in.m_40.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_77);
        float _325 = 1.0 / _323;
        float _327 = _111 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_40.z;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = in.m_40.x;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_40.w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _347 = in.m_30.x;
    float _349 = in.m_30.y;
    float _351 = in.m_30.z;
    float _353 = 1.0 / _345;
    float _355 = in.m_42.x;
    float _357 = in.m_42.y;
    float _359 = in.m_42.z;
    float _361 = in.m_42.w;
    float _363 = 0.0;
    if (!_339)
    {
        float _365 = in.m_40.y;
        _363 = _365;
    }
    float _367 = _363;
    float _369 = _331 * 2.0;
    float _371 = in.m_44.x;
    float _373 = in.m_44.y;
    float _375 = in.m_44.z;
    float _377 = in.m_44.w;
    float _379 = 0.0;
    if (!_339)
    {
        _379 = _331;
    }
    float _381 = _379;
    float _383 = _335 * 2.0;
    float _385 = 0.0;
    float _387 = _381;
    if (!_339)
    {
        _385 = _331;
    }
    float _389 = _385;
    float _391 = floor(_369);
    bool _393 = _341 > 0.5;
    float _395 = floor(_383);
    float _397 = _349 * _357;
    float _399 = 0.0;
    float _401 = _389;
    if (!_339)
    {
        _399 = _367;
    }
    float _403 = _399;
    float _405 = fma(_347, _355, _397);
    bool _407 = _391 > 0.0;
    bool _409 = _391 >= 0.0;
    bool _411 = isnan(_391);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = _349 * _373;
    float _421 = _403;
    float _423 = _367;
    if (_339)
    {
        float _425 = in.m_40.x;
        float _427 = in.m_40.y;
        _421 = _425;
        _423 = _427;
    }
    float _429 = _421;
    float _431 = _423;
    float _433 = fma(_351, _359, _405);
    int _435 = _417 ? 0 : 1;
    float _437 = fma(_347, _371, _419);
    bool _439 = _395 > 0.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _329 + _441;
    bool _445 = _395 >= 0.0;
    bool _447 = isnan(_395);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = fma(_351, _375, _437);
    float _457 = in.m_46.x;
    float _459 = in.m_46.y;
    float _461 = in.m_46.z;
    float _463 = in.m_46.w;
    int _465 = ~_435;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _433 + _361;
    int _473 = _453 ? 0 : 1;
    float _475 = _455 + _377;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    float _489 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _491 = log2(_489);
    int _493 = _469;
    if (!_407)
    {
        int _495 = ~_435;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    bool _501 = _331 > 0.5;
    int _503 = ~_473;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_439)
    {
        int _511 = ~_473;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = _431 * 2.0;
    float _519 = -_147;
    int _521 = _501 ? as_type<int>(_519) : as_type<int>(_147);
    if (_339)
    {
        _387 = _431;
    }
    float _523 = _387;
    if (_339)
    {
        _401 = _431;
    }
    float _525 = _401;
    float _527 = floor(_517);
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _349 * _459;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _537 = _535 != 0;
    float _539 = fma(_347, _457, _533);
    bool _541 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_329);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _553;
    bool _557 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_329);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = fma(_351, _461, _539);
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _573 = _571 != 0;
    float _575 = _555 * _353;
    float _577 = -_551;
    float _579 = _577 + 1.0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    float _585 = _569 + _463;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _589 = _587 != 0;
    float _591 = fma(_575, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _593 = _567 * _579;
    float _595 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = _591 * _593;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _617 = _429 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    out.m_48.x = _607;
    out.m_48.y = _609;
    out.m_48.z = _611;
    float _619 = -_615;
    float _621 = fma(_617, 2.0, _619);
    float _623 = _331 + _431;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _627 = !_537;
    float _629 = _627 ? _147 : as_type<float>(_521);
    float _631 = -_567;
    float _633 = _631 + 1.0;
    float _635 = _623 + (-1.0);
    float _637 = fma(_595, -2.0, _625);
    bool _639 = !_483;
    int _641 = _639 ? 0 : 1;
    float _643 = _335 + _431;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _649 = abs(_531);
    float _651 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    int _653 = abs(_641);
    float _655 = -_111;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _621);
    bool _659 = _527 > 0.0;
    float _661 = _643 + (-1.0);
    bool _663 = _527 >= 0.0;
    bool _665 = isnan(_527);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _491 * _111;
    float _675 = float(_653);
    float _677 = _629 + 0.5;
    float _679 = float(_515);
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _683 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[116].x, _651);
    float _685 = _647 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = _675 * _679;
    float _689 = -_151;
    int _691 = _393 ? as_type<int>(_689) : as_type<int>(_151);
    float _693 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _695 = exp2(_673);
    float _697 = fma(_685, _677, _657);
    bool _699 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(1.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = in.m_50.x;
    float _711 = in.m_50.y;
    float _713 = in.m_50.z;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _717 = 1.0 + _715;
    float _719 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = _687 * (-2.0);
    float _723 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _637);
    float _725 = 1.0 / _717;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _733 = float(_649);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = float(_499);
    float _739 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _741 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _733 * _737;
    bool _749 = !_573;
    float _751 = _749 ? _151 : as_type<float>(_691);
    float _753 = -_695;
    float _755 = _753 + 1.0;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _759 = _475 + _757;
    bool _761 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _769 = _765 || _767;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _693;
    float _771 = _681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _775 = _471 + _773;
    float _777 = _769 ? _755 : 0.0;
    float _779 = _747 * (-2.0);
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _585 + _781;
    float _785 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _787 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _739);
    bool _789 = _335 > 0.5;
    float _791 = _697;
    if (_707)
    {
        float _793 = _777 * _725;
        _113 = _793;
    }
    float _795 = _113;
    float _797 = fma(_779, _709, _709);
    float _799 = fma(_645, _721, _645);
    float _801 = fma(_721, _711, _711);
    float _803 = _759 * _759;
    float _805 = _759 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = _751 + (-0.5);
    bool _809 = _431 > 0.5;
    float _811 = fma(_775, _775, _803);
    float _813 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _815 = -_147;
    int _817 = _789 ? as_type<int>(_815) : as_type<int>(_147);
    float _819 = -_771;
    float _821 = -_723;
    float _823 = fma(_819, _807, _821);
    int _825 = _671 ? 0 : 1;
    float _827 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _813);
    bool _829 = !_583;
    float _831 = _829 ? _147 : as_type<float>(_817);
    float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _835 = -_151;
    int _837 = _809 ? as_type<int>(_835) : as_type<int>(_151);
    float _839 = fma(_719, _779, _719);
    bool _841 = _827 >= 0.0;
    float _843 = fma(_783, _783, _811);
    float _845 = _831 + 0.5;
    bool _847 = !_589;
    float _849 = _847 ? _151 : as_type<float>(_837);
    float _851 = _335 + (-0.5);
    int _853 = ~_825;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _861 = _857;
    float _863 = _713;
    if (!_659)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _861 = _867;
    }
    int _869 = _861;
    float _871 = -_785;
    float _873 = _871 + 1.0;
    float _875 = -_849;
    float _877 = _875 + 0.5;
    float _879 = rsqrt(_843);
    float _881 = -_787;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_629, _885, _697);
    bool _889 = !_487;
    int _891 = _889 ? 0 : 1;
    float _893 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _895 = _891;
    if (_841)
    {
        _791 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _791;
    float _899 = fma(_751, _883, _823);
    int _901 = abs(_891);
    float _903 = _859 * _833;
    float _905 = _893 * _333;
    if (_841)
    {
        float _907 = _897 * 5.0;
        _895 = as_type<int>(_907);
    }
    int _909 = _895;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].x, _797);
    float _913 = _431 + (-0.5);
    out.m_54.x = _903;
    out.m_54.y = _905;
    out.m_54.z = _887;
    out.m_54.w = _899;
    float _915 = fma(_839, _795, _911);
    float _917 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _919 = float(_901);
    if (_841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_909);
        out.gl_Position.z = _2778;
    }
    float _921 = _759 * _879;
    float _923 = _775 * _879;
    float _925 = _783 * _879;
    if (_841)
    {
        out.m_33.x = 0.0;
    }
    if (_841)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _927 = -_921;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _931 = -_923;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _935 = -_921;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _939 = _915 * 0.15915493667125701904296875;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _929 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _933 + _945;
    float _949 = -_925;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _953 = -_923;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _959 = _937 * _937;
    float _961 = float(_869);
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _965 = _951 + _963;
    float _967 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].x, _957);
    float _969 = fma(_955, _955, _959);
    float _971 = -_925;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _975 = _919 * _961;
    float _977 = _335 + _331;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[28].z, _967);
    float _981 = fma(_973, _973, _969);
    float _983 = fma(_799, _795, _917);
    float _985 = _977 + (-1.0);
    float _987 = _975 * (-2.0);
    float _989 = _983 * 0.15915493667125701904296875;
    float _991 = _331 + (-0.5);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _995 = fma(_987, _713, _713);
    bool _997 = _979 >= 0.0;
    float _999 = in.m_56.x;
    float _1001 = in.m_56.y;
    float _1003 = fma(_993, _987, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].z, _995);
    float _1007 = sqrt(_981);
    float _1009 = fma(_1003, _795, _1005);
    float _1011 = _1009 * 0.15915493667125701904296875;
    float _1013 = _939 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    int _1017 = as_type<int>(_981);
    if (_997)
    {
        _863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1019 = _863;
    if (_997)
    {
        out.m_33.x = 0.0;
    }
    if (_997)
    {
        float _1021 = _1019 * 5.0;
        _1017 = as_type<int>(_1021);
    }
    int _1023 = _1017;
    float _1025 = _939 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _879 * _1007;
    if (_997)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_1023);
        out.gl_Position.z = _2976;
    }
    float _1031 = _299 * _1001;
    float _1033 = _989 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _989 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    if (_997)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1045 = _1011 * 6.283185482025146484375;
    float _1047 = cos(_1045);
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _297 * _999;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _147);
    float _1057 = _1029 * _1049;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = _1015 * _1035;
    float _1063 = _1027 * _1035;
    float _1065 = _1053 * _1057;
    float _1067 = _1029 * _1059;
    float _1069 = _1027 * _1039;
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1073 = _1071 * 0.5;
    float _1075 = _1055 * _1067;
    float _1077 = fma(_1043, _1069, _1061);
    float _1079 = _1047 * _1065;
    float _1081 = _1015 * _1039;
    float _1083 = _1035 * _1047;
    float _1085 = _1039 * _1047;
    float _1087 = _1027 * _1079;
    float _1089 = -_1065;
    float _1091 = _1043 * _1089;
    float _1093 = -_1081;
    float _1095 = fma(_1043, _1063, _1093);
    float _1097 = -_1063;
    float _1099 = fma(_1043, _1081, _1097);
    float _1101 = fma(_1077, _1075, _1087);
    float _1103 = _1015 * _1079;
    float _1105 = fma(_1085, _1075, _1091);
    float _1107 = fma(_1043, _1061, _1069);
    float _1109 = fma(_1095, _1073, _1101);
    float _1111 = fma(_1099, _1075, _1103);
    float _1113 = fma(_1083, _1073, _1105);
    bool _1115 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1117 = isnan(0.5);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1123 = _1119 || _1121;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = fma(_1107, _1073, _1111);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1131 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1129);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1135);
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1149 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1151 = _585 + _1145;
    float _1153 = _929 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1155 = _471 + _1147;
    float _1157 = _929 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = _475 + _1149;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1155 + _1165;
    float _1169 = _1161 * _1161;
    float _1171 = fma(_1167, _1167, _1169);
    float _1173 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1153);
    float _1175 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1157);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1181 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1175);
    float _1183 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1185 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = 1.0 / _1183;
    float _1189 = _1185 + _1183;
    bool _1191 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1157;
    float _1195 = _1179;
    float _1197 = _1153;
    if (!_1191)
    {
        _1193 = _1155;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1191)
    {
        _1195 = _1151;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1191)
    {
        _1197 = _1163;
    }
    float _1207 = _1197;
    bool _1209 = !_1191;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1217 = _1177 + _1215;
        float _1219 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = rsqrt(_1171);
        float _1223 = _1217 * _1213;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1225 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = _1225 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = fma(_1229, _1219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1237 = _1221 * _1235;
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1167, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1243 = fma(_1161, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1245 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1163, _1233, _1245);
        _1211 = _1247;
        _1205 = _1243;
        _1201 = _1241;
    }
    float _1249 = _1211;
    float _1251 = _1205;
    float _1253 = _1201;
    float _1255 = -_921;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1263 = _1189 * _1187;
    float _1265 = _1263 * 0.5;
    float _1267 = -_923;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = _1251;
    if (_1123)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    float _1277 = _1275;
    if (!_1123)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1287);
        float _1291 = _1283 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1283 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = 1.0 / _1293;
        float _1301 = _1285 * 6.283185482025146484375;
        float _1303 = cos(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = _1285 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = 1.0 / _1289;
        float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1317 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1315;
        float _1319 = 1.0 / _1311;
        float _1321 = 1.0 / _1317;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1325 = _1313 * _1323;
        float _1327 = _1309 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = fma(_1327, _1325, _1329);
        float _1333 = _1331 * _1321;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        _1277 = _1335;
    }
    float _1337 = _1277;
    float _1339 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1343 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1345 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1349 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    float _1351 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1343);
    float _1353 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1355 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1359 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1351);
    float _1361 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1365);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1367);
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1369);
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1371);
    float _1383 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    bool _1393 = _1337 > 0.0;
    bool _1395 = isnan(_1337);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1385);
    float _1407 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1387);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1391);
    float _1411 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1415 = _1405 + _1409;
    float _1417 = _1411 + _1409;
    float _1419 = _1409 * 0.5;
    float _1421 = _1415 * 0.5;
    float _1423 = _1417 * 0.5;
    float _1425 = fma(_1407, -0.5, _1419);
    out.m_33.x = _1413;
    out.gl_Position.x = _1405;
    out.gl_Position.y = _1407;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1409;
    out.m_58.x = _1421;
    out.m_58.y = _1425;
    out.m_58.z = _1423;
    out.m_58.w = _1409;
    if (_1401)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1427;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
    bool _173 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1484 = as_type<float>(_93);
        out.gl_Position.z = _1484;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1554 = as_type<float>(_131);
        out.gl_Position.z = _1554;
    }
    if (_123)
    {
        return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _137 = as_type<int>(_133) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_133) & 2;
    bool _143 = _141 != 0;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_135;
    float _171;
    if (!_153)
    {
        float _155 = in.m_40.x;
        float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _161 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _163 = _161 * _157;
        float _165 = floor(_163);
        float _167 = -_165;
        float _169 = _163 + _167;
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = float(_77);
        float _177 = 1.0 / _175;
        float _179 = _111 * _177;
        _171 = _179;
    }
    _173 = false;
    float _181 = _171;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _181 + _183;
    bool _187 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _189 = isnan(_181);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    bool _199 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _201 = isnan(_181);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -_197;
    float _221 = _219 + 1.0;
    float _223 = 1.0 / _213;
    bool _225 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_181);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = _209 * _221;
    float _239 = -_209;
    float _241 = _239 + 1.0;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = _235 * _241;
    float _247 = 1.0 / _217;
    float _249 = -_235;
    float _251 = _249 + 1.0;
    float _253 = _185 * _223;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _181 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_261, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _257 * _247;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _277 = _267 * _245;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _283 = _269 * _245;
    float _285 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _289 = fma(_281, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _291 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _293 = fma(_285, _237, _287);
    float _295 = fma(_289, _237, _291);
    float _297 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].x, _293);
    float _299 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].y, _295);
    bool _301 = !_243;
    float _319;
    if (!_301)
    {
        float _303 = in.m_40.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_77);
        float _325 = 1.0 / _323;
        float _327 = _111 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_40.z;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = in.m_40.x;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_40.w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _347 = in.m_30.x;
    float _349 = in.m_30.y;
    float _351 = in.m_30.z;
    float _353 = 1.0 / _345;
    float _355 = in.m_42.x;
    float _357 = in.m_42.y;
    float _359 = in.m_42.z;
    float _361 = in.m_42.w;
    float _363 = 0.0;
    if (!_339)
    {
        float _365 = in.m_40.y;
        _363 = _365;
    }
    float _367 = _363;
    float _369 = _331 * 2.0;
    float _371 = in.m_44.x;
    float _373 = in.m_44.y;
    float _375 = in.m_44.z;
    float _377 = in.m_44.w;
    float _379 = 0.0;
    if (!_339)
    {
        _379 = _331;
    }
    float _381 = _379;
    float _383 = _335 * 2.0;
    float _385 = 0.0;
    float _387 = _381;
    if (!_339)
    {
        _385 = _331;
    }
    float _389 = _385;
    float _391 = floor(_369);
    bool _393 = _341 > 0.5;
    float _395 = floor(_383);
    float _397 = _349 * _357;
    float _399 = 0.0;
    float _401 = _389;
    if (!_339)
    {
        _399 = _367;
    }
    float _403 = _399;
    float _405 = fma(_347, _355, _397);
    bool _407 = _391 > 0.0;
    bool _409 = _391 >= 0.0;
    bool _411 = isnan(_391);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = _349 * _373;
    float _421 = _403;
    float _423 = _367;
    if (_339)
    {
        float _425 = in.m_40.x;
        float _427 = in.m_40.y;
        _421 = _425;
        _423 = _427;
    }
    float _429 = _421;
    float _431 = _423;
    float _433 = fma(_351, _359, _405);
    int _435 = _417 ? 0 : 1;
    float _437 = fma(_347, _371, _419);
    bool _439 = _395 > 0.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _329 + _441;
    bool _445 = _395 >= 0.0;
    bool _447 = isnan(_395);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = fma(_351, _375, _437);
    float _457 = in.m_46.x;
    float _459 = in.m_46.y;
    float _461 = in.m_46.z;
    float _463 = in.m_46.w;
    int _465 = ~_435;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _433 + _361;
    int _473 = _453 ? 0 : 1;
    float _475 = _455 + _377;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    float _489 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _491 = log2(_489);
    int _493 = _469;
    if (!_407)
    {
        int _495 = ~_435;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    bool _501 = _331 > 0.5;
    int _503 = ~_473;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_439)
    {
        int _511 = ~_473;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = _431 * 2.0;
    float _519 = -_147;
    int _521 = _501 ? as_type<int>(_519) : as_type<int>(_147);
    if (_339)
    {
        _387 = _431;
    }
    float _523 = _387;
    if (_339)
    {
        _401 = _431;
    }
    float _525 = _401;
    float _527 = floor(_517);
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _349 * _459;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _537 = _535 != 0;
    float _539 = fma(_347, _457, _533);
    bool _541 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_329);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _553;
    bool _557 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_329);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = fma(_351, _461, _539);
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _573 = _571 != 0;
    float _575 = _555 * _353;
    float _577 = -_551;
    float _579 = _577 + 1.0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    float _585 = _569 + _463;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _589 = _587 != 0;
    float _591 = fma(_575, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _593 = _567 * _579;
    float _595 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = _591 * _593;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _617 = _429 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    out.m_48.x = _607;
    out.m_48.y = _609;
    out.m_48.z = _611;
    float _619 = -_615;
    float _621 = fma(_617, 2.0, _619);
    float _623 = _331 + _431;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _627 = !_537;
    float _629 = _627 ? _147 : as_type<float>(_521);
    float _631 = -_567;
    float _633 = _631 + 1.0;
    float _635 = _623 + (-1.0);
    float _637 = fma(_595, -2.0, _625);
    bool _639 = !_483;
    int _641 = _639 ? 0 : 1;
    float _643 = _335 + _431;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _649 = abs(_531);
    float _651 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    int _653 = abs(_641);
    float _655 = -_111;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _621);
    bool _659 = _527 > 0.0;
    float _661 = _643 + (-1.0);
    bool _663 = _527 >= 0.0;
    bool _665 = isnan(_527);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _491 * _111;
    float _675 = float(_653);
    float _677 = _629 + 0.5;
    float _679 = float(_515);
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _683 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[116].x, _651);
    float _685 = _647 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = _675 * _679;
    float _689 = -_151;
    int _691 = _393 ? as_type<int>(_689) : as_type<int>(_151);
    float _693 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _695 = exp2(_673);
    float _697 = fma(_685, _677, _657);
    bool _699 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(1.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = in.m_50.x;
    float _711 = in.m_50.y;
    float _713 = in.m_50.z;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _717 = 1.0 + _715;
    float _719 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = _687 * (-2.0);
    float _723 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _637);
    float _725 = 1.0 / _717;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _733 = float(_649);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = float(_499);
    float _739 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _741 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _733 * _737;
    bool _749 = !_573;
    float _751 = _749 ? _151 : as_type<float>(_691);
    float _753 = -_695;
    float _755 = _753 + 1.0;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _759 = _475 + _757;
    bool _761 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _769 = _765 || _767;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _693;
    float _771 = _681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _775 = _471 + _773;
    float _777 = _769 ? _755 : 0.0;
    float _779 = _747 * (-2.0);
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _585 + _781;
    float _785 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _787 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _739);
    bool _789 = _335 > 0.5;
    float _791 = _697;
    if (_707)
    {
        float _793 = _777 * _725;
        _113 = _793;
    }
    float _795 = _113;
    float _797 = fma(_779, _709, _709);
    float _799 = fma(_645, _721, _645);
    float _801 = fma(_721, _711, _711);
    float _803 = _759 * _759;
    float _805 = _759 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = _751 + (-0.5);
    bool _809 = _431 > 0.5;
    float _811 = fma(_775, _775, _803);
    float _813 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _815 = -_147;
    int _817 = _789 ? as_type<int>(_815) : as_type<int>(_147);
    float _819 = -_771;
    float _821 = -_723;
    float _823 = fma(_819, _807, _821);
    int _825 = _671 ? 0 : 1;
    float _827 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _813);
    bool _829 = !_583;
    float _831 = _829 ? _147 : as_type<float>(_817);
    float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _835 = -_151;
    int _837 = _809 ? as_type<int>(_835) : as_type<int>(_151);
    float _839 = fma(_719, _779, _719);
    bool _841 = _827 >= 0.0;
    float _843 = fma(_783, _783, _811);
    float _845 = _831 + 0.5;
    bool _847 = !_589;
    float _849 = _847 ? _151 : as_type<float>(_837);
    float _851 = _335 + (-0.5);
    int _853 = ~_825;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _861 = _857;
    float _863 = _713;
    if (!_659)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _861 = _867;
    }
    int _869 = _861;
    float _871 = -_785;
    float _873 = _871 + 1.0;
    float _875 = -_849;
    float _877 = _875 + 0.5;
    float _879 = rsqrt(_843);
    float _881 = -_787;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_629, _885, _697);
    bool _889 = !_487;
    int _891 = _889 ? 0 : 1;
    float _893 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _895 = _891;
    if (_841)
    {
        _791 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _791;
    float _899 = fma(_751, _883, _823);
    int _901 = abs(_891);
    float _903 = _859 * _833;
    float _905 = _893 * _333;
    if (_841)
    {
        float _907 = _897 * 5.0;
        _895 = as_type<int>(_907);
    }
    int _909 = _895;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].x, _797);
    float _913 = _431 + (-0.5);
    out.m_54.x = _903;
    out.m_54.y = _905;
    out.m_54.z = _887;
    out.m_54.w = _899;
    float _915 = fma(_839, _795, _911);
    float _917 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _919 = float(_901);
    if (_841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_909);
        out.gl_Position.z = _2778;
    }
    float _921 = _759 * _879;
    float _923 = _775 * _879;
    float _925 = _783 * _879;
    if (_841)
    {
        out.m_33.x = 0.0;
    }
    if (_841)
    {
        return out;
    }
    float _927 = -_921;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _931 = -_923;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _935 = -_921;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _939 = _915 * 0.15915493667125701904296875;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _929 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _933 + _945;
    float _949 = -_925;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _953 = -_923;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _959 = _937 * _937;
    float _961 = float(_869);
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _965 = _951 + _963;
    float _967 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].x, _957);
    float _969 = fma(_955, _955, _959);
    float _971 = -_925;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _975 = _919 * _961;
    float _977 = _335 + _331;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[28].z, _967);
    float _981 = fma(_973, _973, _969);
    float _983 = fma(_799, _795, _917);
    float _985 = _977 + (-1.0);
    float _987 = _975 * (-2.0);
    float _989 = _983 * 0.15915493667125701904296875;
    float _991 = _331 + (-0.5);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _995 = fma(_987, _713, _713);
    bool _997 = _979 >= 0.0;
    float _999 = in.m_56.x;
    float _1001 = in.m_56.y;
    float _1003 = fma(_993, _987, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].z, _995);
    float _1007 = sqrt(_981);
    float _1009 = fma(_1003, _795, _1005);
    float _1011 = _1009 * 0.15915493667125701904296875;
    float _1013 = _939 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    int _1017 = as_type<int>(_981);
    if (_997)
    {
        _863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1019 = _863;
    if (_997)
    {
        out.m_33.x = 0.0;
    }
    if (_997)
    {
        float _1021 = _1019 * 5.0;
        _1017 = as_type<int>(_1021);
    }
    int _1023 = _1017;
    float _1025 = _939 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _879 * _1007;
    if (_997)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_1023);
        out.gl_Position.z = _2976;
    }
    float _1031 = _299 * _1001;
    float _1033 = _989 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _989 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    if (_997)
    {
        return out;
    }
    float _1045 = _1011 * 6.283185482025146484375;
    float _1047 = cos(_1045);
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _297 * _999;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _147);
    float _1057 = _1029 * _1049;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = _1015 * _1035;
    float _1063 = _1027 * _1035;
    float _1065 = _1053 * _1057;
    float _1067 = _1029 * _1059;
    float _1069 = _1027 * _1039;
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1073 = _1071 * 0.5;
    float _1075 = _1055 * _1067;
    float _1077 = fma(_1043, _1069, _1061);
    float _1079 = _1047 * _1065;
    float _1081 = _1015 * _1039;
    float _1083 = _1035 * _1047;
    float _1085 = _1039 * _1047;
    float _1087 = _1027 * _1079;
    float _1089 = -_1065;
    float _1091 = _1043 * _1089;
    float _1093 = -_1081;
    float _1095 = fma(_1043, _1063, _1093);
    float _1097 = -_1063;
    float _1099 = fma(_1043, _1081, _1097);
    float _1101 = fma(_1077, _1075, _1087);
    float _1103 = _1015 * _1079;
    float _1105 = fma(_1085, _1075, _1091);
    float _1107 = fma(_1043, _1061, _1069);
    float _1109 = fma(_1095, _1073, _1101);
    float _1111 = fma(_1099, _1075, _1103);
    float _1113 = fma(_1083, _1073, _1105);
    bool _1115 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1117 = isnan(0.5);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1123 = _1119 || _1121;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = fma(_1107, _1073, _1111);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1131 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1129);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1135);
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1149 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1151 = _585 + _1145;
    float _1153 = _929 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1155 = _471 + _1147;
    float _1157 = _929 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = _475 + _1149;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1155 + _1165;
    float _1169 = _1161 * _1161;
    float _1171 = fma(_1167, _1167, _1169);
    float _1173 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1153);
    float _1175 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1157);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1181 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1175);
    float _1183 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1185 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = 1.0 / _1183;
    float _1189 = _1185 + _1183;
    bool _1191 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1157;
    float _1195 = _1179;
    float _1197 = _1153;
    if (!_1191)
    {
        _1193 = _1155;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1191)
    {
        _1195 = _1151;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1191)
    {
        _1197 = _1163;
    }
    float _1207 = _1197;
    bool _1209 = !_1191;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1217 = _1177 + _1215;
        float _1219 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = rsqrt(_1171);
        float _1223 = _1217 * _1213;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1225 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = _1225 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = fma(_1229, _1219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1237 = _1221 * _1235;
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1167, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1243 = fma(_1161, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1245 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1163, _1233, _1245);
        _1211 = _1247;
        _1205 = _1243;
        _1201 = _1241;
    }
    float _1249 = _1211;
    float _1251 = _1205;
    float _1253 = _1201;
    float _1255 = -_921;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1263 = _1189 * _1187;
    float _1265 = _1263 * 0.5;
    float _1267 = -_923;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = _1251;
    if (_1123)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    float _1277 = _1275;
    if (!_1123)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1287);
        float _1291 = _1283 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1283 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = 1.0 / _1293;
        float _1301 = _1285 * 6.283185482025146484375;
        float _1303 = cos(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = _1285 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = 1.0 / _1289;
        float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1317 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1315;
        float _1319 = 1.0 / _1311;
        float _1321 = 1.0 / _1317;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1325 = _1313 * _1323;
        float _1327 = _1309 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = fma(_1327, _1325, _1329);
        float _1333 = _1331 * _1321;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        _1277 = _1335;
    }
    float _1337 = _1277;
    float _1339 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1343 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1345 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1349 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    float _1351 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1343);
    float _1353 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1355 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1359 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1351);
    float _1361 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1365);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1367);
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1369);
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1371);
    float _1383 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    bool _1393 = _1337 > 0.0;
    bool _1395 = isnan(_1337);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1385);
    float _1407 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1387);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1391);
    float _1411 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1415 = _1405 + _1409;
    float _1417 = _1411 + _1409;
    float _1419 = _1409 * 0.5;
    float _1421 = _1415 * 0.5;
    float _1423 = _1417 * 0.5;
    float _1425 = fma(_1407, -0.5, _1419);
    out.m_33.x = _1413;
    out.gl_Position.x = _1405;
    out.gl_Position.y = _1407;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1409;
    out.m_58.x = _1421;
    out.m_58.y = _1425;
    out.m_58.z = _1423;
    out.m_58.w = _1409;
    if (_1401)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1427;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _321 = false;
    bool _173 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_30.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_33.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1484 = as_type<float>(_93);
        out.gl_Position.z = _1484;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = _111;
    if (_107)
    {
        float _115 = float(_77);
        _87 = _115;
    }
    float _117 = _87;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    float _125 = _117;
    if (_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    if (_123)
    {
        out.m_33.x = 0.0;
    }
    if (_123)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1554 = as_type<float>(_131);
        out.gl_Position.z = _1554;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    bool _135 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _137 = as_type<int>(_133) & 1;
    bool _139 = _137 != 0;
    int _141 = as_type<int>(_133) & 2;
    bool _143 = _141 != 0;
    bool _145 = !_139;
    float _147 = _145 ? (-0.5) : 0.5;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_135;
    float _171;
    if (!_153)
    {
        float _155 = in.m_40.x;
        float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _159 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _161 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _163 = _161 * _157;
        float _165 = floor(_163);
        float _167 = -_165;
        float _169 = _163 + _167;
        _171 = _169;
        _173 = true;
    }
    else
    {
        float _175 = float(_77);
        float _177 = 1.0 / _175;
        float _179 = _111 * _177;
        _171 = _179;
    }
    _173 = false;
    float _181 = _171;
    float _183 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _185 = _181 + _183;
    bool _187 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _189 = isnan(_181);
    bool _191 = _187 || _189;
    bool _193 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    bool _199 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _201 = isnan(_181);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -_197;
    float _221 = _219 + 1.0;
    float _223 = 1.0 / _213;
    bool _225 = _181 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_181);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = _209 * _221;
    float _239 = -_209;
    float _241 = _239 + 1.0;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _245 = _235 * _241;
    float _247 = 1.0 / _217;
    float _249 = -_235;
    float _251 = _249 + 1.0;
    float _253 = _185 * _223;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _181 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = fma(_261, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _269 = fma(_265, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _271 = _257 * _247;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _275 = _273 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _277 = _267 * _245;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _283 = _269 * _245;
    float _285 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _287 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _289 = fma(_281, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _291 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _293 = fma(_285, _237, _287);
    float _295 = fma(_289, _237, _291);
    float _297 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].x, _293);
    float _299 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[145].y, _295);
    bool _301 = !_243;
    float _319;
    if (!_301)
    {
        float _303 = in.m_40.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_77);
        float _325 = 1.0 / _323;
        float _327 = _111 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = in.m_40.z;
    float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _335 = in.m_40.x;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _339 = _337 != 0;
    float _341 = in.m_40.w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _347 = in.m_30.x;
    float _349 = in.m_30.y;
    float _351 = in.m_30.z;
    float _353 = 1.0 / _345;
    float _355 = in.m_42.x;
    float _357 = in.m_42.y;
    float _359 = in.m_42.z;
    float _361 = in.m_42.w;
    float _363 = 0.0;
    if (!_339)
    {
        float _365 = in.m_40.y;
        _363 = _365;
    }
    float _367 = _363;
    float _369 = _331 * 2.0;
    float _371 = in.m_44.x;
    float _373 = in.m_44.y;
    float _375 = in.m_44.z;
    float _377 = in.m_44.w;
    float _379 = 0.0;
    if (!_339)
    {
        _379 = _331;
    }
    float _381 = _379;
    float _383 = _335 * 2.0;
    float _385 = 0.0;
    float _387 = _381;
    if (!_339)
    {
        _385 = _331;
    }
    float _389 = _385;
    float _391 = floor(_369);
    bool _393 = _341 > 0.5;
    float _395 = floor(_383);
    float _397 = _349 * _357;
    float _399 = 0.0;
    float _401 = _389;
    if (!_339)
    {
        _399 = _367;
    }
    float _403 = _399;
    float _405 = fma(_347, _355, _397);
    bool _407 = _391 > 0.0;
    bool _409 = _391 >= 0.0;
    bool _411 = isnan(_391);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = _349 * _373;
    float _421 = _403;
    float _423 = _367;
    if (_339)
    {
        float _425 = in.m_40.x;
        float _427 = in.m_40.y;
        _421 = _425;
        _423 = _427;
    }
    float _429 = _421;
    float _431 = _423;
    float _433 = fma(_351, _359, _405);
    int _435 = _417 ? 0 : 1;
    float _437 = fma(_347, _371, _419);
    bool _439 = _395 > 0.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _329 + _441;
    bool _445 = _395 >= 0.0;
    bool _447 = isnan(_395);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = fma(_351, _375, _437);
    float _457 = in.m_46.x;
    float _459 = in.m_46.y;
    float _461 = in.m_46.z;
    float _463 = in.m_46.w;
    int _465 = ~_435;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _433 + _361;
    int _473 = _453 ? 0 : 1;
    float _475 = _455 + _377;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    float _489 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _491 = log2(_489);
    int _493 = _469;
    if (!_407)
    {
        int _495 = ~_435;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    bool _501 = _331 > 0.5;
    int _503 = ~_473;
    int _505 = _503 + 1;
    int _507 = _505 + 1;
    int _509 = _507;
    if (!_439)
    {
        int _511 = ~_473;
        int _513 = _511 + 1;
        _509 = _513;
    }
    int _515 = _509;
    float _517 = _431 * 2.0;
    float _519 = -_147;
    int _521 = _501 ? as_type<int>(_519) : as_type<int>(_147);
    if (_339)
    {
        _387 = _431;
    }
    float _523 = _387;
    if (_339)
    {
        _401 = _431;
    }
    float _525 = _401;
    float _527 = floor(_517);
    bool _529 = !_479;
    int _531 = _529 ? 0 : 1;
    float _533 = _349 * _459;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _537 = _535 != 0;
    float _539 = fma(_347, _457, _533);
    bool _541 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _543 = isnan(_329);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _553;
    bool _557 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _559 = isnan(_329);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = fma(_351, _461, _539);
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _573 = _571 != 0;
    float _575 = _555 * _353;
    float _577 = -_551;
    float _579 = _577 + 1.0;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _583 = _581 != 0;
    float _585 = _569 + _463;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _589 = _587 != 0;
    float _591 = fma(_575, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _593 = _567 * _579;
    float _595 = _523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _597 = _591 * _593;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _607 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[83].z, _605);
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _617 = _429 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    out.m_48.x = _607;
    out.m_48.y = _609;
    out.m_48.z = _611;
    float _619 = -_615;
    float _621 = fma(_617, 2.0, _619);
    float _623 = _331 + _431;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _627 = !_537;
    float _629 = _627 ? _147 : as_type<float>(_521);
    float _631 = -_567;
    float _633 = _631 + 1.0;
    float _635 = _623 + (-1.0);
    float _637 = fma(_595, -2.0, _625);
    bool _639 = !_483;
    int _641 = _639 ? 0 : 1;
    float _643 = _335 + _431;
    float _645 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _649 = abs(_531);
    float _651 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _597);
    int _653 = abs(_641);
    float _655 = -_111;
    float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _621);
    bool _659 = _527 > 0.0;
    float _661 = _643 + (-1.0);
    bool _663 = _527 >= 0.0;
    bool _665 = isnan(_527);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _491 * _111;
    float _675 = float(_653);
    float _677 = _629 + 0.5;
    float _679 = float(_515);
    float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _683 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[116].x, _651);
    float _685 = _647 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = _675 * _679;
    float _689 = -_151;
    int _691 = _393 ? as_type<int>(_689) : as_type<int>(_151);
    float _693 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _695 = exp2(_673);
    float _697 = fma(_685, _677, _657);
    bool _699 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _701 = isnan(1.0);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _707 = _703 || _705;
    float _709 = in.m_50.x;
    float _711 = in.m_50.y;
    float _713 = in.m_50.z;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _717 = 1.0 + _715;
    float _719 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _721 = _687 * (-2.0);
    float _723 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _637);
    float _725 = 1.0 / _717;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _733 = float(_649);
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _737 = float(_499);
    float _739 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _741 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _743 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _745 = _735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _747 = _733 * _737;
    bool _749 = !_573;
    float _751 = _749 ? _151 : as_type<float>(_691);
    float _753 = -_695;
    float _755 = _753 + 1.0;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _759 = _475 + _757;
    bool _761 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _769 = _765 || _767;
    out.m_52.x = _741;
    out.m_52.y = _743;
    out.m_52.z = _745;
    out.m_52.w = _693;
    float _771 = _681 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _775 = _471 + _773;
    float _777 = _769 ? _755 : 0.0;
    float _779 = _747 * (-2.0);
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _585 + _781;
    float _785 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _787 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _739);
    bool _789 = _335 > 0.5;
    float _791 = _697;
    if (_707)
    {
        float _793 = _777 * _725;
        _113 = _793;
    }
    float _795 = _113;
    float _797 = fma(_779, _709, _709);
    float _799 = fma(_645, _721, _645);
    float _801 = fma(_721, _711, _711);
    float _803 = _759 * _759;
    float _805 = _759 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _807 = _751 + (-0.5);
    bool _809 = _431 > 0.5;
    float _811 = fma(_775, _775, _803);
    float _813 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[28].x, _805);
    float _815 = -_147;
    int _817 = _789 ? as_type<int>(_815) : as_type<int>(_147);
    float _819 = -_771;
    float _821 = -_723;
    float _823 = fma(_819, _807, _821);
    int _825 = _671 ? 0 : 1;
    float _827 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[28].z, _813);
    bool _829 = !_583;
    float _831 = _829 ? _147 : as_type<float>(_817);
    float _833 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _835 = -_151;
    int _837 = _809 ? as_type<int>(_835) : as_type<int>(_151);
    float _839 = fma(_719, _779, _719);
    bool _841 = _827 >= 0.0;
    float _843 = fma(_783, _783, _811);
    float _845 = _831 + 0.5;
    bool _847 = !_589;
    float _849 = _847 ? _151 : as_type<float>(_837);
    float _851 = _335 + (-0.5);
    int _853 = ~_825;
    int _855 = _853 + 1;
    int _857 = _855 + 1;
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _861 = _857;
    float _863 = _713;
    if (!_659)
    {
        int _865 = ~_825;
        int _867 = _865 + 1;
        _861 = _867;
    }
    int _869 = _861;
    float _871 = -_785;
    float _873 = _871 + 1.0;
    float _875 = -_849;
    float _877 = _875 + 0.5;
    float _879 = rsqrt(_843);
    float _881 = -_787;
    float _883 = _881 + 1.0;
    float _885 = -_873;
    float _887 = fma(_629, _885, _697);
    bool _889 = !_487;
    int _891 = _889 ? 0 : 1;
    float _893 = _877 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _895 = _891;
    if (_841)
    {
        _791 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _791;
    float _899 = fma(_751, _883, _823);
    int _901 = abs(_891);
    float _903 = _859 * _833;
    float _905 = _893 * _333;
    if (_841)
    {
        float _907 = _897 * 5.0;
        _895 = as_type<int>(_907);
    }
    int _909 = _895;
    float _911 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[196].x, _797);
    float _913 = _431 + (-0.5);
    out.m_54.x = _903;
    out.m_54.y = _905;
    out.m_54.z = _887;
    out.m_54.w = _899;
    float _915 = fma(_839, _795, _911);
    float _917 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _801);
    float _919 = float(_901);
    if (_841)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_909);
        out.gl_Position.z = _2778;
    }
    float _921 = _759 * _879;
    float _923 = _775 * _879;
    float _925 = _783 * _879;
    if (_841)
    {
        out.m_33.x = 0.0;
    }
    if (_841)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _927 = -_921;
    float _929 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[18].w, _475);
    float _931 = -_923;
    float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[18].w, _471);
    float _935 = -_921;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _759);
    float _939 = _915 * 0.15915493667125701904296875;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _943 = _929 + _941;
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _947 = _933 + _945;
    float _949 = -_925;
    float _951 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[18].w, _585);
    float _953 = -_923;
    float _955 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[18].w, _775);
    float _957 = _943 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _959 = _937 * _937;
    float _961 = float(_869);
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _965 = _951 + _963;
    float _967 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].x, _957);
    float _969 = fma(_955, _955, _959);
    float _971 = -_925;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _783);
    float _975 = _919 * _961;
    float _977 = _335 + _331;
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[28].z, _967);
    float _981 = fma(_973, _973, _969);
    float _983 = fma(_799, _795, _917);
    float _985 = _977 + (-1.0);
    float _987 = _975 * (-2.0);
    float _989 = _983 * 0.15915493667125701904296875;
    float _991 = _331 + (-0.5);
    float _993 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _995 = fma(_987, _713, _713);
    bool _997 = _979 >= 0.0;
    float _999 = in.m_56.x;
    float _1001 = in.m_56.y;
    float _1003 = fma(_993, _987, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].z, _995);
    float _1007 = sqrt(_981);
    float _1009 = fma(_1003, _795, _1005);
    float _1011 = _1009 * 0.15915493667125701904296875;
    float _1013 = _939 * 6.283185482025146484375;
    float _1015 = sin(_1013);
    int _1017 = as_type<int>(_981);
    if (_997)
    {
        _863 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1019 = _863;
    if (_997)
    {
        out.m_33.x = 0.0;
    }
    if (_997)
    {
        float _1021 = _1019 * 5.0;
        _1017 = as_type<int>(_1021);
    }
    int _1023 = _1017;
    float _1025 = _939 * 6.283185482025146484375;
    float _1027 = cos(_1025);
    float _1029 = _879 * _1007;
    if (_997)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2976 = as_type<float>(_1023);
        out.gl_Position.z = _2976;
    }
    float _1031 = _299 * _1001;
    float _1033 = _989 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _989 * 6.283185482025146484375;
    float _1039 = cos(_1037);
    float _1041 = _1011 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    if (_997)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1045 = _1011 * 6.283185482025146484375;
    float _1047 = cos(_1045);
    float _1049 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _297 * _999;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _151);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _147);
    float _1057 = _1029 * _1049;
    float _1059 = _1051 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1061 = _1015 * _1035;
    float _1063 = _1027 * _1035;
    float _1065 = _1053 * _1057;
    float _1067 = _1029 * _1059;
    float _1069 = _1027 * _1039;
    float _1071 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1073 = _1071 * 0.5;
    float _1075 = _1055 * _1067;
    float _1077 = fma(_1043, _1069, _1061);
    float _1079 = _1047 * _1065;
    float _1081 = _1015 * _1039;
    float _1083 = _1035 * _1047;
    float _1085 = _1039 * _1047;
    float _1087 = _1027 * _1079;
    float _1089 = -_1065;
    float _1091 = _1043 * _1089;
    float _1093 = -_1081;
    float _1095 = fma(_1043, _1063, _1093);
    float _1097 = -_1063;
    float _1099 = fma(_1043, _1081, _1097);
    float _1101 = fma(_1077, _1075, _1087);
    float _1103 = _1015 * _1079;
    float _1105 = fma(_1085, _1075, _1091);
    float _1107 = fma(_1043, _1061, _1069);
    float _1109 = fma(_1095, _1073, _1101);
    float _1111 = fma(_1099, _1075, _1103);
    float _1113 = fma(_1083, _1073, _1105);
    bool _1115 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1117 = isnan(0.5);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1123 = _1119 || _1121;
    float _1125 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = fma(_1107, _1073, _1111);
    float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1131 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1129);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1131);
    float _1139 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1141 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1135);
    float _1143 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1147 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1149 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1151 = _585 + _1145;
    float _1153 = _929 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1155 = _471 + _1147;
    float _1157 = _929 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1161 = _1151 + _1159;
    float _1163 = _475 + _1149;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1167 = _1155 + _1165;
    float _1169 = _1161 * _1161;
    float _1171 = fma(_1167, _1167, _1169);
    float _1173 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1153);
    float _1175 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1157);
    float _1177 = sqrt(_1171);
    float _1179 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1173);
    float _1181 = fma(_951, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1175);
    float _1183 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1185 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1187 = 1.0 / _1183;
    float _1189 = _1185 + _1183;
    bool _1191 = _1177 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1193 = _1157;
    float _1195 = _1179;
    float _1197 = _1153;
    if (!_1191)
    {
        _1193 = _1155;
    }
    float _1199 = _1193;
    float _1201 = _1199;
    if (!_1191)
    {
        _1195 = _1151;
    }
    float _1203 = _1195;
    float _1205 = _1203;
    if (!_1191)
    {
        _1197 = _1163;
    }
    float _1207 = _1197;
    bool _1209 = !_1191;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1217 = _1177 + _1215;
        float _1219 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1221 = rsqrt(_1171);
        float _1223 = _1217 * _1213;
        float _1225 = _1223 * 0.15915493667125701904296875;
        float _1227 = _1225 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = _1225 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = fma(_1229, _1219, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1237 = _1221 * _1235;
        float _1239 = _1233 + (-1.0);
        float _1241 = fma(_1167, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1243 = fma(_1161, _1237, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1245 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1247 = fma(_1163, _1233, _1245);
        _1211 = _1247;
        _1205 = _1243;
        _1201 = _1241;
    }
    float _1249 = _1211;
    float _1251 = _1205;
    float _1253 = _1201;
    float _1255 = -_921;
    float _1257 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1249);
    float _1259 = -_925;
    float _1261 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1251);
    float _1263 = _1189 * _1187;
    float _1265 = _1263 * 0.5;
    float _1267 = -_923;
    float _1269 = fma(_1267, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1253);
    float _1271 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = _1251;
    if (_1123)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    float _1277 = _1275;
    if (!_1123)
    {
        float _1279 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1281 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1281 * 0.15915493667125701904296875;
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1287);
        float _1291 = _1283 * 6.283185482025146484375;
        float _1293 = cos(_1291);
        float _1295 = _1283 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        float _1299 = 1.0 / _1293;
        float _1301 = _1285 * 6.283185482025146484375;
        float _1303 = cos(_1301);
        float _1305 = _1297 * _1299;
        float _1307 = _1285 * 6.283185482025146484375;
        float _1309 = sin(_1307);
        float _1311 = _1303 * _1305;
        float _1313 = 1.0 / _1289;
        float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1317 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1315;
        float _1319 = 1.0 / _1311;
        float _1321 = 1.0 / _1317;
        float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1325 = _1313 * _1323;
        float _1327 = _1309 * _1319;
        float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1331 = fma(_1327, _1325, _1329);
        float _1333 = _1331 * _1321;
        float _1335 = precise::clamp(_1333, 0.0, 1.0);
        _1277 = _1335;
    }
    float _1337 = _1277;
    float _1339 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1341 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1343 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1345 = _1257 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1347 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1339);
    float _1349 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1341);
    float _1351 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1343);
    float _1353 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1355 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1347);
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1359 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1351);
    float _1361 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1353);
    float _1363 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1365);
    float _1377 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1367);
    float _1379 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1369);
    float _1381 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1371);
    float _1383 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1381);
    bool _1393 = _1337 > 0.0;
    bool _1395 = isnan(_1337);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan(0.0);
    bool _1401 = _1397 || _1399;
    float _1403 = _1337 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1385);
    float _1407 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1387);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1391);
    float _1411 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1389);
    float _1413 = _1403 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1415 = _1405 + _1409;
    float _1417 = _1411 + _1409;
    float _1419 = _1409 * 0.5;
    float _1421 = _1415 * 0.5;
    float _1423 = _1417 * 0.5;
    float _1425 = fma(_1407, -0.5, _1419);
    out.m_33.x = _1413;
    out.gl_Position.x = _1405;
    out.gl_Position.y = _1407;
    out.gl_Position.z = _1411;
    out.gl_Position.w = _1409;
    out.m_58.x = _1421;
    out.m_58.y = _1425;
    out.m_58.z = _1423;
    out.m_58.w = _1409;
    if (_1401)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1427;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

