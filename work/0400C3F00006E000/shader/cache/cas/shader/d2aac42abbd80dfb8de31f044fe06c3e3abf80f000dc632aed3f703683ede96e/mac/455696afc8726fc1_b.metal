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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1309 = false;
    bool _747 = false;
    bool _619 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1741 = as_type<float>(_89);
        out.gl_Position.z = _1741;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.x;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _93;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1814 = as_type<float>(_127);
        out.gl_Position.z = _1814;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = 0.0;
    float _153 = _135;
    if (!_145)
    {
        float _155 = _135 * _135;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = in.m_37.x;
    float _163 = in.m_37.y;
    float _165 = in.m_37.z;
    float _167 = _149 * 6.283185482025146484375;
    float _169 = floor(_149);
    int _171 = as_type<int>(_133) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_133) & 2;
    bool _177 = _175 != 0;
    float _179 = _159;
    if (!_145)
    {
        float _181 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _167 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _185 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_169;
    float _201 = _149 + _199;
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_145;
    float _209 = _183;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _135 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _135);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_145;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _135 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _153 = _263;
    }
    float _265 = _153;
    float _267 = in.m_46.w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _271 = _269 != 0;
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _275 = _273 != 0;
    float _277 = fma(_193, 0.5, 0.5);
    bool _279 = _201 < 0.5;
    float _281 = float(_279);
    float _283 = -_201;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_271;
    int _295 = _293 ? 0 : 1;
    float _297 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _299 = !_189;
    int _301 = _299 ? 0 : 1;
    float _303 = -_281;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_277;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_295);
    float _313 = fma(_265, _161, _297);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_275;
    int _321 = _319 ? 0 : 1;
    float _323 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = fma(_265, _163, _317);
    float _331 = float(_311);
    float _333 = fma(_265, _165, _323);
    float _335 = float(_315);
    float _337 = abs(_285);
    float _339 = _331 * _337;
    float _341 = fma(_329, _267, _289);
    float _343 = fma(_333, _267, _291);
    float _345 = float(_327);
    float _347 = fma(_335, _309, _339);
    float _349 = fma(_313, _267, _287);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_73);
        float _377 = 1.0 / _375;
        float _379 = _107 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _381 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _381 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = 1.0 / _393;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _401;
    float _413 = 1.0 / _405;
    float _415 = _385 * _407;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _381 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _381 + _421;
    float _425 = 1.0 / _397;
    float _427 = _419 * _411;
    bool _429 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _431 = isnan(_381);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_381);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _423 * _413;
    bool _459 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _461 = isnan(_381);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = _469 * _455;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = _389 * _425;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = fma(_473, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _489 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_381);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = fma(_485, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -_451;
    float _513 = _511 + 1.0;
    float _515 = _451 * _479;
    float _517 = fma(_503, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _521 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_381);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = in.m_46.x;
    float _541 = in.m_46.y;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = _531 * _537;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = fma(_545, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _487 * _547;
    float _561 = _505 * _547;
    float _563 = fma(_555, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _577 = fma(_567, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _579 = fma(_517, _533, _569);
    float _581 = fma(_519, _533, _571);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _585 = fma(_563, _515, _579);
    float _587 = fma(_557, _515, _581);
    float _589 = fma(_583, _475, _585);
    float _591 = fma(_577, _475, _587);
    float _593 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].x, _589);
    float _595 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].y, _591);
    float _597 = _593 * _539;
    float _599 = _595 * _541;
    bool _601 = !_409;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _93 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        float _621 = float(_73);
        float _623 = 1.0 / _621;
        float _625 = _107 * _623;
        _617 = _625;
    }
    _619 = false;
    float _627 = _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_627);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_627);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _631;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_627);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = _659 * _669;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _647;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _665 * _661;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _627 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _627 + _703;
    float _707 = fma(_697, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = _695 * _691;
    float _715 = _707 * _685;
    float _717 = _643 * _711;
    float _719 = fma(_713, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    float _723 = fma(_719, _717, _721);
    float _725 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _727 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.w = _727;
    bool _729 = !_683;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_73);
        float _751 = 1.0 / _749;
        float _753 = _107 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = in.m_39.z;
    float _759 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = in.m_39.w;
    float _763 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _771 = in.m_39.y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _787 = _785 != 0;
    float _789 = _93 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _791 = _93 > 0.5;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _795 = _757 > 0.5;
    bool _797 = _761 > 0.5;
    float _799 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _809 = 1.0 / _805;
    float _811 = -_801;
    float _813 = fma(_789, 2.0, _811);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _819;
    float _823 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _755 + _825;
    float _829 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _833 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = -_107;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[76].x, _813);
    float _839 = fma(_829, -2.0, _817);
    float _841 = -_205;
    int _843 = _791 ? as_type<int>(_841) : as_type<int>(_205);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = _821 * _809;
    bool _849 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_755);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    bool _863 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _865 = isnan(_755);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _877 = _771 > 0.5;
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].w, _831);
    float _885 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    float _887 = -_197;
    int _889 = _877 ? as_type<int>(_887) : as_type<int>(_197);
    float _891 = _873 * _881;
    float _893 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _895 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _897 = !_767;
    float _899 = _897 ? _205 : as_type<float>(_843);
    float _901 = _875 * _891;
    float _903 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = _885 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _907 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _777);
    bool _909 = !_775;
    float _911 = _909 ? _197 : as_type<float>(_889);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _905 + _917;
    float _921 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _923 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = _911 + (-0.5);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _921 + _929;
    float _933 = -_873;
    float _935 = _933 + 1.0;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _939 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _839);
    float _941 = _899 + 0.5;
    float _943 = -_205;
    int _945 = _795 ? as_type<int>(_943) : as_type<int>(_205);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[28].z, _937);
    float _949 = -_833;
    float _951 = -_939;
    float _953 = fma(_949, _927, _951);
    float _955 = _915 * _915;
    float _957 = fma(_895, _941, _837);
    float _959 = -_197;
    int _961 = _797 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _965 = _947 >= 0.0;
    float _967 = fma(_919, _919, _955);
    bool _969 = !_781;
    float _971 = _969 ? _205 : as_type<float>(_945);
    float _973 = -_861;
    float _975 = _973 + 1.0;
    bool _977 = !_787;
    float _979 = _977 ? _197 : as_type<float>(_961);
    float _981 = fma(_931, _931, _967);
    float _983 = -_923;
    float _985 = _983 + 1.0;
    float _987 = _971 + 0.5;
    float _989 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _991 = -_975;
    float _993 = fma(_899, _991, _957);
    float _995 = -_979;
    float _997 = _995 + 0.5;
    float _999 = rsqrt(_981);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1003 = fma(_911, _985, _953);
    float _1005 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1007 = _953;
    int _1009 = as_type<int>(_1005);
    if (_965)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1007;
    float _1013 = _997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1015 = _1001 * _845;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1019 = _1013 * _963;
    if (_965)
    {
        float _1021 = _1011 * 5.0;
        _1009 = as_type<int>(_1021);
    }
    int _1023 = _1009;
    if (_965)
    {
        out.m_35.x = 0.0;
    }
    out.m_50.x = _993;
    out.m_50.y = _1003;
    out.m_50.z = _1015;
    out.m_50.w = _1019;
    float _1025 = _915 * _999;
    float _1027 = _919 * _999;
    out.m_52.w = _1017;
    if (_965)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3257 = as_type<float>(_1023);
        out.gl_Position.z = _3257;
    }
    if (_965)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1029 = -_1025;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1033 = _931 * _999;
    float _1035 = -_1027;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1039 = -_1025;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _1031 + _1043;
    float _1047 = -_1033;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _1037 + _1051;
    float _1055 = -_1027;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _1049 + _1061;
    float _1065 = _1041 * _1041;
    float _1067 = -_1033;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1059);
    float _1073 = _353 * _597;
    float _1075 = fma(_1057, _1057, _1065);
    float _1077 = _353 * _599;
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    float _1081 = fma(_1069, _1069, _1075);
    bool _1083 = _1079 >= 0.0;
    float _1085 = sqrt(_1081);
    float _1087 = _1079;
    if (_1083)
    {
        _1087 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _1087;
    int _1091 = as_type<int>(_1089);
    if (_1083)
    {
        out.m_35.x = 0.0;
    }
    if (_1083)
    {
        float _1093 = _1089 * 5.0;
        _1091 = as_type<int>(_1093);
    }
    int _1095 = _1091;
    float _1097 = _999 * _1085;
    if (_1083)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3391 = as_type<float>(_1095);
        out.gl_Position.z = _3391;
    }
    if (_1083)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1107 = _1097 * _1099;
    float _1109 = _1097 * _1101;
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = _1111 * 0.5;
    float _1115 = _1103 * _1107;
    float _1117 = _1105 * _1109;
    float _1119 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1123 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1119);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1121);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1123);
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _905 + _1131;
    float _1137 = _921 + _1133;
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1135 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1137 + _1145;
    float _1149 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1139);
    float _1151 = _1143 * _1143;
    float _1153 = _1147 * _1147;
    float _1155 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1157 = _1151 + _1153;
    float _1159 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = sqrt(_1157);
    float _1163 = _903 + _1159;
    bool _1165 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1139;
    float _1169 = _1159;
    float _1171 = _1113;
    float _1173 = _1135;
    float _1175 = _1153;
    if (!_1165)
    {
        _1167 = _1135;
    }
    float _1177 = _1167;
    float _1179 = _1177;
    if (!_1165)
    {
        _1169 = _1151;
    }
    float _1181 = _1169;
    float _1183 = _1181;
    if (!_1165)
    {
        _1171 = _1137;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (!_1165)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    bool _1191 = !_1165;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1161 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1143, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1235 = _1225 + _1233;
        float _1237 = fma(_1163, _1215, _1227);
        float _1239 = _1231 * _1231;
        float _1241 = _1235 * _1235;
        _1193 = _1237;
        _1183 = _1239;
        _1175 = _1241;
        _1179 = _1223;
        _1187 = _1225;
    }
    float _1243 = _1193;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1179;
    float _1251 = _1187;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1255, _1255, _1245);
    float _1259 = _1257 + _1247;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1261);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    float _1273 = _1245;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    bool _1277 = !_1271;
    float _1279 = _1275;
    if (!_1277)
    {
        bool _1281 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1283 = isnan(_1261);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1289 = _1285 || _1287;
        if (!_1289)
        {
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = _1261 + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1297 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1295;
            float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1301 = _1299 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1303 = 1.0 / _1297;
            float _1305 = _1293 * _1303;
            float _1307 = fma(_1305, _1301, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1279 = _1307;
            _1309 = true;
        }
        else
        {
            bool _1311 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1313 = isnan(_1261);
            bool _1315 = _1311 || _1313;
            bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1319 = _1315 || _1317;
            if (!_1319)
            {
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1261 + _1321;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1333 = 1.0 / _1327;
                float _1335 = _1323 * _1333;
                float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1279 = _1337;
                _1309 = true;
            }
            else
            {
                _1279 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1309 = false;
    float _1339 = _1279;
    float _1341 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1343 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1347 = _1249 + _1345;
    float _1349 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1341);
    bool _1351 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    float _1361 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1343);
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1243 + _1363;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1251 + _1369;
    float _1373 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1361);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1377 = fma(_1347, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1365, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1381 = fma(_1371, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1383 = 1.0 / _1375;
    float _1385 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = -_1027;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1401 = -_1025;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1405 = -_1033;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1381);
    float _1409 = _1385 + _1375;
    float _1411 = _1403;
    float _1413 = _1399;
    float _1415 = _1407;
    if (!_1359)
    {
        float _1417 = _1045 * _1045;
        float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1421 = -_903;
        float _1423 = _1421 + _1379;
        float _1425 = -_921;
        float _1427 = _1425 + _1381;
        float _1429 = fma(_1053, _1053, _1417);
        float _1431 = -_905;
        float _1433 = _1431 + _1377;
        float _1435 = fma(_1063, _1063, _1429);
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = sqrt(_1435);
        float _1441 = 1.0 / _1097;
        bool _1443 = _1439 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1445 = isnan(_1439);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1451 = _1447 || _1449;
        float _1453 = precise::min(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1455 = _1453 * _1419;
        float _1457 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1459 = _1423 * _1441;
        float _1461 = _1427 * _1441;
        float _1463 = _1433 * _1441;
        float _1465 = _1457 * _1455;
        float _1467 = _1063;
        float _1469 = _1439;
        float _1471 = _1427;
        float _1473 = _1457;
        if (_1451)
        {
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1467 = _1475;
        }
        float _1477 = _1467;
        if (_1451)
        {
            float _1479 = precise::max(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1469 = _1479;
        }
        float _1481 = _1469;
        float _1483 = fma(_1459, _1465, _1031);
        float _1485 = fma(_1461, _1465, _1049);
        float _1487 = fma(_1463, _1465, _1037);
        float _1489 = _1481;
        float _1491 = _1487;
        if (_1451)
        {
            float _1493 = _1481 * _1477;
            _1489 = _1493;
        }
        float _1495 = _1489;
        float _1497 = _1495;
        if (_1451)
        {
            float _1499 = _1457 * _1495;
            _1471 = _1499;
        }
        float _1501 = _1471;
        if (!_1451)
        {
            _1497 = _1483;
        }
        float _1503 = _1497;
        float _1505 = _1503;
        if (!_1451)
        {
            _1473 = _1485;
        }
        float _1507 = _1473;
        _1415 = _1507;
        if (_1451)
        {
            float _1509 = fma(_1463, _1501, _1037);
            _1491 = _1509;
        }
        float _1511 = _1491;
        _1413 = _1511;
        if (_1451)
        {
            float _1513 = fma(_1459, _1501, _1031);
            _1505 = _1513;
        }
        float _1515 = _1505;
        _1411 = _1515;
        if (_1451)
        {
            float _1517 = fma(_1461, _1501, _1049);
            _1415 = _1517;
        }
    }
    float _1519 = _1411;
    float _1521 = _1413;
    float _1523 = _1415;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1525);
    float _1535 = _1409 * _1383;
    float _1537 = _1535 * 0.5;
    float _1539 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1541 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1543 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1531);
    float _1545 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1533);
    float _1547 = _1533;
    if (_1395)
    {
        _1547 = 1.0;
    }
    float _1549 = _1547;
    float _1551 = _1549;
    if (!_1395)
    {
        float _1553 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
        float _1559 = _1553 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1557;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = _1577 * _1579;
        float _1589 = _1567 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1587;
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1597 = _1581 * _1595;
        float _1599 = 1.0 / _1585;
        float _1601 = _1591 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1597, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _1551 = _1609;
    }
    float _1611 = _1551;
    float _1613 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1539);
    float _1615 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1541);
    float _1619 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1543);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1625);
    float _1637 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1649 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1639);
    bool _1651 = _1611 > 0.0;
    bool _1653 = isnan(_1611);
    bool _1655 = _1651 || _1653;
    bool _1657 = isnan(0.0);
    bool _1659 = _1655 || _1657;
    float _1661 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1643);
    float _1665 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1645);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1669 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1673 = _1663 + _1667;
    float _1675 = _1669 + _1667;
    float _1677 = _1667 * 0.5;
    float _1679 = _1673 * 0.5;
    float _1681 = _1675 * 0.5;
    float _1683 = fma(_1665, -0.5, _1677);
    out.m_35.x = _1671;
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1665;
    out.gl_Position.z = _1669;
    out.gl_Position.w = _1667;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1667;
    if (_1659)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1309 = false;
    bool _747 = false;
    bool _619 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1741 = as_type<float>(_89);
        out.gl_Position.z = _1741;
    }
    if (!_77)
    {
        return out;
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.x;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _93;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1814 = as_type<float>(_127);
        out.gl_Position.z = _1814;
    }
    if (_117)
    {
        return out;
    }
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = 0.0;
    float _153 = _135;
    if (!_145)
    {
        float _155 = _135 * _135;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = in.m_37.x;
    float _163 = in.m_37.y;
    float _165 = in.m_37.z;
    float _167 = _149 * 6.283185482025146484375;
    float _169 = floor(_149);
    int _171 = as_type<int>(_133) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_133) & 2;
    bool _177 = _175 != 0;
    float _179 = _159;
    if (!_145)
    {
        float _181 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _167 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _185 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_169;
    float _201 = _149 + _199;
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_145;
    float _209 = _183;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _135 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _135);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_145;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _135 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _153 = _263;
    }
    float _265 = _153;
    float _267 = in.m_46.w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _271 = _269 != 0;
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _275 = _273 != 0;
    float _277 = fma(_193, 0.5, 0.5);
    bool _279 = _201 < 0.5;
    float _281 = float(_279);
    float _283 = -_201;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_271;
    int _295 = _293 ? 0 : 1;
    float _297 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _299 = !_189;
    int _301 = _299 ? 0 : 1;
    float _303 = -_281;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_277;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_295);
    float _313 = fma(_265, _161, _297);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_275;
    int _321 = _319 ? 0 : 1;
    float _323 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = fma(_265, _163, _317);
    float _331 = float(_311);
    float _333 = fma(_265, _165, _323);
    float _335 = float(_315);
    float _337 = abs(_285);
    float _339 = _331 * _337;
    float _341 = fma(_329, _267, _289);
    float _343 = fma(_333, _267, _291);
    float _345 = float(_327);
    float _347 = fma(_335, _309, _339);
    float _349 = fma(_313, _267, _287);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_73);
        float _377 = 1.0 / _375;
        float _379 = _107 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _381 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _381 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = 1.0 / _393;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _401;
    float _413 = 1.0 / _405;
    float _415 = _385 * _407;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _381 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _381 + _421;
    float _425 = 1.0 / _397;
    float _427 = _419 * _411;
    bool _429 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _431 = isnan(_381);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_381);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _423 * _413;
    bool _459 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _461 = isnan(_381);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = _469 * _455;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = _389 * _425;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = fma(_473, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _489 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_381);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = fma(_485, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -_451;
    float _513 = _511 + 1.0;
    float _515 = _451 * _479;
    float _517 = fma(_503, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _521 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_381);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = in.m_46.x;
    float _541 = in.m_46.y;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = _531 * _537;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = fma(_545, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _487 * _547;
    float _561 = _505 * _547;
    float _563 = fma(_555, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _577 = fma(_567, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _579 = fma(_517, _533, _569);
    float _581 = fma(_519, _533, _571);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _585 = fma(_563, _515, _579);
    float _587 = fma(_557, _515, _581);
    float _589 = fma(_583, _475, _585);
    float _591 = fma(_577, _475, _587);
    float _593 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].x, _589);
    float _595 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].y, _591);
    float _597 = _593 * _539;
    float _599 = _595 * _541;
    bool _601 = !_409;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _93 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        float _621 = float(_73);
        float _623 = 1.0 / _621;
        float _625 = _107 * _623;
        _617 = _625;
    }
    _619 = false;
    float _627 = _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_627);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_627);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _631;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_627);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = _659 * _669;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _647;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _665 * _661;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _627 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _627 + _703;
    float _707 = fma(_697, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = _695 * _691;
    float _715 = _707 * _685;
    float _717 = _643 * _711;
    float _719 = fma(_713, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    float _723 = fma(_719, _717, _721);
    float _725 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _727 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.w = _727;
    bool _729 = !_683;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_73);
        float _751 = 1.0 / _749;
        float _753 = _107 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = in.m_39.z;
    float _759 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = in.m_39.w;
    float _763 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _771 = in.m_39.y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _787 = _785 != 0;
    float _789 = _93 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _791 = _93 > 0.5;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _795 = _757 > 0.5;
    bool _797 = _761 > 0.5;
    float _799 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _809 = 1.0 / _805;
    float _811 = -_801;
    float _813 = fma(_789, 2.0, _811);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _819;
    float _823 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _755 + _825;
    float _829 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _833 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = -_107;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[76].x, _813);
    float _839 = fma(_829, -2.0, _817);
    float _841 = -_205;
    int _843 = _791 ? as_type<int>(_841) : as_type<int>(_205);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = _821 * _809;
    bool _849 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_755);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    bool _863 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _865 = isnan(_755);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _877 = _771 > 0.5;
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].w, _831);
    float _885 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    float _887 = -_197;
    int _889 = _877 ? as_type<int>(_887) : as_type<int>(_197);
    float _891 = _873 * _881;
    float _893 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _895 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _897 = !_767;
    float _899 = _897 ? _205 : as_type<float>(_843);
    float _901 = _875 * _891;
    float _903 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = _885 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _907 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _777);
    bool _909 = !_775;
    float _911 = _909 ? _197 : as_type<float>(_889);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _905 + _917;
    float _921 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _923 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = _911 + (-0.5);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _921 + _929;
    float _933 = -_873;
    float _935 = _933 + 1.0;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _939 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _839);
    float _941 = _899 + 0.5;
    float _943 = -_205;
    int _945 = _795 ? as_type<int>(_943) : as_type<int>(_205);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[28].z, _937);
    float _949 = -_833;
    float _951 = -_939;
    float _953 = fma(_949, _927, _951);
    float _955 = _915 * _915;
    float _957 = fma(_895, _941, _837);
    float _959 = -_197;
    int _961 = _797 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _965 = _947 >= 0.0;
    float _967 = fma(_919, _919, _955);
    bool _969 = !_781;
    float _971 = _969 ? _205 : as_type<float>(_945);
    float _973 = -_861;
    float _975 = _973 + 1.0;
    bool _977 = !_787;
    float _979 = _977 ? _197 : as_type<float>(_961);
    float _981 = fma(_931, _931, _967);
    float _983 = -_923;
    float _985 = _983 + 1.0;
    float _987 = _971 + 0.5;
    float _989 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _991 = -_975;
    float _993 = fma(_899, _991, _957);
    float _995 = -_979;
    float _997 = _995 + 0.5;
    float _999 = rsqrt(_981);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1003 = fma(_911, _985, _953);
    float _1005 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1007 = _953;
    int _1009 = as_type<int>(_1005);
    if (_965)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1007;
    float _1013 = _997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1015 = _1001 * _845;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1019 = _1013 * _963;
    if (_965)
    {
        float _1021 = _1011 * 5.0;
        _1009 = as_type<int>(_1021);
    }
    int _1023 = _1009;
    if (_965)
    {
        out.m_35.x = 0.0;
    }
    out.m_50.x = _993;
    out.m_50.y = _1003;
    out.m_50.z = _1015;
    out.m_50.w = _1019;
    float _1025 = _915 * _999;
    float _1027 = _919 * _999;
    out.m_52.w = _1017;
    if (_965)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3257 = as_type<float>(_1023);
        out.gl_Position.z = _3257;
    }
    if (_965)
    {
        return out;
    }
    float _1029 = -_1025;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1033 = _931 * _999;
    float _1035 = -_1027;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1039 = -_1025;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _1031 + _1043;
    float _1047 = -_1033;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _1037 + _1051;
    float _1055 = -_1027;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _1049 + _1061;
    float _1065 = _1041 * _1041;
    float _1067 = -_1033;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1059);
    float _1073 = _353 * _597;
    float _1075 = fma(_1057, _1057, _1065);
    float _1077 = _353 * _599;
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    float _1081 = fma(_1069, _1069, _1075);
    bool _1083 = _1079 >= 0.0;
    float _1085 = sqrt(_1081);
    float _1087 = _1079;
    if (_1083)
    {
        _1087 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _1087;
    int _1091 = as_type<int>(_1089);
    if (_1083)
    {
        out.m_35.x = 0.0;
    }
    if (_1083)
    {
        float _1093 = _1089 * 5.0;
        _1091 = as_type<int>(_1093);
    }
    int _1095 = _1091;
    float _1097 = _999 * _1085;
    if (_1083)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3391 = as_type<float>(_1095);
        out.gl_Position.z = _3391;
    }
    if (_1083)
    {
        return out;
    }
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1107 = _1097 * _1099;
    float _1109 = _1097 * _1101;
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = _1111 * 0.5;
    float _1115 = _1103 * _1107;
    float _1117 = _1105 * _1109;
    float _1119 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1123 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1119);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1121);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1123);
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _905 + _1131;
    float _1137 = _921 + _1133;
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1135 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1137 + _1145;
    float _1149 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1139);
    float _1151 = _1143 * _1143;
    float _1153 = _1147 * _1147;
    float _1155 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1157 = _1151 + _1153;
    float _1159 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = sqrt(_1157);
    float _1163 = _903 + _1159;
    bool _1165 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1139;
    float _1169 = _1159;
    float _1171 = _1113;
    float _1173 = _1135;
    float _1175 = _1153;
    if (!_1165)
    {
        _1167 = _1135;
    }
    float _1177 = _1167;
    float _1179 = _1177;
    if (!_1165)
    {
        _1169 = _1151;
    }
    float _1181 = _1169;
    float _1183 = _1181;
    if (!_1165)
    {
        _1171 = _1137;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (!_1165)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    bool _1191 = !_1165;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1161 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1143, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1235 = _1225 + _1233;
        float _1237 = fma(_1163, _1215, _1227);
        float _1239 = _1231 * _1231;
        float _1241 = _1235 * _1235;
        _1193 = _1237;
        _1183 = _1239;
        _1175 = _1241;
        _1179 = _1223;
        _1187 = _1225;
    }
    float _1243 = _1193;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1179;
    float _1251 = _1187;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1255, _1255, _1245);
    float _1259 = _1257 + _1247;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1261);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    float _1273 = _1245;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    bool _1277 = !_1271;
    float _1279 = _1275;
    if (!_1277)
    {
        bool _1281 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1283 = isnan(_1261);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1289 = _1285 || _1287;
        if (!_1289)
        {
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = _1261 + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1297 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1295;
            float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1301 = _1299 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1303 = 1.0 / _1297;
            float _1305 = _1293 * _1303;
            float _1307 = fma(_1305, _1301, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1279 = _1307;
            _1309 = true;
        }
        else
        {
            bool _1311 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1313 = isnan(_1261);
            bool _1315 = _1311 || _1313;
            bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1319 = _1315 || _1317;
            if (!_1319)
            {
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1261 + _1321;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1333 = 1.0 / _1327;
                float _1335 = _1323 * _1333;
                float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1279 = _1337;
                _1309 = true;
            }
            else
            {
                _1279 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1309 = false;
    float _1339 = _1279;
    float _1341 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1343 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1347 = _1249 + _1345;
    float _1349 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1341);
    bool _1351 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    float _1361 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1343);
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1243 + _1363;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1251 + _1369;
    float _1373 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1361);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1377 = fma(_1347, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1365, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1381 = fma(_1371, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1383 = 1.0 / _1375;
    float _1385 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = -_1027;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1401 = -_1025;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1405 = -_1033;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1381);
    float _1409 = _1385 + _1375;
    float _1411 = _1403;
    float _1413 = _1399;
    float _1415 = _1407;
    if (!_1359)
    {
        float _1417 = _1045 * _1045;
        float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1421 = -_903;
        float _1423 = _1421 + _1379;
        float _1425 = -_921;
        float _1427 = _1425 + _1381;
        float _1429 = fma(_1053, _1053, _1417);
        float _1431 = -_905;
        float _1433 = _1431 + _1377;
        float _1435 = fma(_1063, _1063, _1429);
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = sqrt(_1435);
        float _1441 = 1.0 / _1097;
        bool _1443 = _1439 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1445 = isnan(_1439);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1451 = _1447 || _1449;
        float _1453 = precise::min(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1455 = _1453 * _1419;
        float _1457 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1459 = _1423 * _1441;
        float _1461 = _1427 * _1441;
        float _1463 = _1433 * _1441;
        float _1465 = _1457 * _1455;
        float _1467 = _1063;
        float _1469 = _1439;
        float _1471 = _1427;
        float _1473 = _1457;
        if (_1451)
        {
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1467 = _1475;
        }
        float _1477 = _1467;
        if (_1451)
        {
            float _1479 = precise::max(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1469 = _1479;
        }
        float _1481 = _1469;
        float _1483 = fma(_1459, _1465, _1031);
        float _1485 = fma(_1461, _1465, _1049);
        float _1487 = fma(_1463, _1465, _1037);
        float _1489 = _1481;
        float _1491 = _1487;
        if (_1451)
        {
            float _1493 = _1481 * _1477;
            _1489 = _1493;
        }
        float _1495 = _1489;
        float _1497 = _1495;
        if (_1451)
        {
            float _1499 = _1457 * _1495;
            _1471 = _1499;
        }
        float _1501 = _1471;
        if (!_1451)
        {
            _1497 = _1483;
        }
        float _1503 = _1497;
        float _1505 = _1503;
        if (!_1451)
        {
            _1473 = _1485;
        }
        float _1507 = _1473;
        _1415 = _1507;
        if (_1451)
        {
            float _1509 = fma(_1463, _1501, _1037);
            _1491 = _1509;
        }
        float _1511 = _1491;
        _1413 = _1511;
        if (_1451)
        {
            float _1513 = fma(_1459, _1501, _1031);
            _1505 = _1513;
        }
        float _1515 = _1505;
        _1411 = _1515;
        if (_1451)
        {
            float _1517 = fma(_1461, _1501, _1049);
            _1415 = _1517;
        }
    }
    float _1519 = _1411;
    float _1521 = _1413;
    float _1523 = _1415;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1525);
    float _1535 = _1409 * _1383;
    float _1537 = _1535 * 0.5;
    float _1539 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1541 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1543 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1531);
    float _1545 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1533);
    float _1547 = _1533;
    if (_1395)
    {
        _1547 = 1.0;
    }
    float _1549 = _1547;
    float _1551 = _1549;
    if (!_1395)
    {
        float _1553 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
        float _1559 = _1553 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1557;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = _1577 * _1579;
        float _1589 = _1567 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1587;
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1597 = _1581 * _1595;
        float _1599 = 1.0 / _1585;
        float _1601 = _1591 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1597, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _1551 = _1609;
    }
    float _1611 = _1551;
    float _1613 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1539);
    float _1615 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1541);
    float _1619 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1543);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1625);
    float _1637 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1649 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1639);
    bool _1651 = _1611 > 0.0;
    bool _1653 = isnan(_1611);
    bool _1655 = _1651 || _1653;
    bool _1657 = isnan(0.0);
    bool _1659 = _1655 || _1657;
    float _1661 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1643);
    float _1665 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1645);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1669 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1673 = _1663 + _1667;
    float _1675 = _1669 + _1667;
    float _1677 = _1667 * 0.5;
    float _1679 = _1673 * 0.5;
    float _1681 = _1675 * 0.5;
    float _1683 = fma(_1665, -0.5, _1677);
    out.m_35.x = _1671;
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1665;
    out.gl_Position.z = _1669;
    out.gl_Position.w = _1667;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1667;
    if (_1659)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1309 = false;
    bool _747 = false;
    bool _619 = false;
    bool _373 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    float _83 = _81;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _85 = 0;
    if (!_77)
    {
        float _87 = _81 * 5.0;
        _85 = as_type<int>(_87);
    }
    int _89 = _85;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1741 = as_type<float>(_89);
        out.gl_Position.z = _1741;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    float _93 = in.m_39.x;
    bool _95 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_91;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.x = _93;
    if (_103)
    {
        float _109 = float(_73);
        _83 = _109;
    }
    float _111 = _83;
    bool _113 = _107 >= _111;
    bool _115 = !_103;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    int _123 = 0;
    if (_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1814 = as_type<float>(_127);
        out.gl_Position.z = _1814;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _131 = _107 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _131 * _129;
    float _149 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = 0.0;
    float _153 = _135;
    if (!_145)
    {
        float _155 = _135 * _135;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = in.m_37.x;
    float _163 = in.m_37.y;
    float _165 = in.m_37.z;
    float _167 = _149 * 6.283185482025146484375;
    float _169 = floor(_149);
    int _171 = as_type<int>(_133) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_133) & 2;
    bool _177 = _175 != 0;
    float _179 = _159;
    if (!_145)
    {
        float _181 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _167 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    float _191 = _185 * 6.283185482025146484375;
    float _193 = cos(_191);
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = -_169;
    float _201 = _149 + _199;
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_145;
    float _209 = _183;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _135 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _135);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_145;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _135 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _153 = _263;
    }
    float _265 = _153;
    float _267 = in.m_46.w;
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _271 = _269 != 0;
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _275 = _273 != 0;
    float _277 = fma(_193, 0.5, 0.5);
    bool _279 = _201 < 0.5;
    float _281 = float(_279);
    float _283 = -_201;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_271;
    int _295 = _293 ? 0 : 1;
    float _297 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _299 = !_189;
    int _301 = _299 ? 0 : 1;
    float _303 = -_281;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = -_277;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _311 = abs(_295);
    float _313 = fma(_265, _161, _297);
    int _315 = abs(_301);
    float _317 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = !_275;
    int _321 = _319 ? 0 : 1;
    float _323 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _327 = abs(_321);
    float _329 = fma(_265, _163, _317);
    float _331 = float(_311);
    float _333 = fma(_265, _165, _323);
    float _335 = float(_315);
    float _337 = abs(_285);
    float _339 = _331 * _337;
    float _341 = fma(_329, _267, _289);
    float _343 = fma(_333, _267, _291);
    float _345 = float(_327);
    float _347 = fma(_335, _309, _339);
    float _349 = fma(_313, _267, _287);
    float _351 = abs(_305);
    float _353 = fma(_345, _351, _347);
    bool _355 = !_325;
    float _371;
    if (!_355)
    {
        float _357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _359 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _361 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _363 = _361 * _357;
        float _365 = floor(_363);
        float _367 = -_365;
        float _369 = _363 + _367;
        _371 = _369;
        _373 = true;
    }
    else
    {
        float _375 = float(_73);
        float _377 = 1.0 / _375;
        float _379 = _107 * _377;
        _371 = _379;
    }
    _373 = false;
    float _381 = _371;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _385 = _381 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _389 = _381 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _407 = 1.0 / _393;
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = 1.0 / _401;
    float _413 = 1.0 / _405;
    float _415 = _385 * _407;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _419 = _381 + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _423 = _381 + _421;
    float _425 = 1.0 / _397;
    float _427 = _419 * _411;
    bool _429 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _431 = isnan(_381);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    bool _441 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _443 = isnan(_381);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_439;
    float _455 = _453 + 1.0;
    float _457 = _423 * _413;
    bool _459 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _461 = isnan(_381);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = _469 * _455;
    float _477 = -_469;
    float _479 = _477 + 1.0;
    float _481 = _389 * _425;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _483;
    float _487 = fma(_473, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _489 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_381);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _505 = fma(_485, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -_451;
    float _513 = _511 + 1.0;
    float _515 = _451 * _479;
    float _517 = fma(_503, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _521 = _381 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_381);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = in.m_46.x;
    float _541 = in.m_46.y;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = _531 * _537;
    float _549 = -_531;
    float _551 = _549 + 1.0;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _553;
    float _557 = fma(_545, _427, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _559 = _487 * _547;
    float _561 = _505 * _547;
    float _563 = fma(_555, _427, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _571 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _577 = fma(_567, _457, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _579 = fma(_517, _533, _569);
    float _581 = fma(_519, _533, _571);
    float _583 = fma(_575, _457, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _585 = fma(_563, _515, _579);
    float _587 = fma(_557, _515, _581);
    float _589 = fma(_583, _475, _585);
    float _591 = fma(_577, _475, _587);
    float _593 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].x, _589);
    float _595 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[147].y, _591);
    float _597 = _593 * _539;
    float _599 = _595 * _541;
    bool _601 = !_409;
    float _617;
    if (!_601)
    {
        float _603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _605 = _93 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _607 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _609 = _607 * _603;
        float _611 = floor(_609);
        float _613 = -_611;
        float _615 = _609 + _613;
        _617 = _615;
        _619 = true;
    }
    else
    {
        float _621 = float(_73);
        float _623 = 1.0 / _621;
        float _625 = _107 * _623;
        _617 = _625;
    }
    _619 = false;
    float _627 = _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = isnan(_627);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _649 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_627);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = 1.0 / _631;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    float _667 = -_643;
    float _669 = _667 + 1.0;
    bool _671 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_627);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _685 = _659 * _669;
    float _687 = -_659;
    float _689 = _687 + 1.0;
    float _691 = 1.0 / _647;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _665 * _661;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _701 = _627 + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _627 + _703;
    float _707 = fma(_697, _701, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _709 = -_681;
    float _711 = _709 + 1.0;
    float _713 = _695 * _691;
    float _715 = _707 * _685;
    float _717 = _643 * _711;
    float _719 = fma(_713, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    float _723 = fma(_719, _717, _721);
    float _725 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _727 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.w = _727;
    bool _729 = !_683;
    float _745;
    if (!_729)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _733 = _93 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[11].w, _107);
        float _737 = _735 * _731;
        float _739 = floor(_737);
        float _741 = -_739;
        float _743 = _737 + _741;
        _745 = _743;
        _747 = true;
    }
    else
    {
        float _749 = float(_73);
        float _751 = 1.0 / _749;
        float _753 = _107 * _751;
        _745 = _753;
    }
    _747 = false;
    float _755 = _745;
    float _757 = in.m_39.z;
    float _759 = _341 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _761 = in.m_39.w;
    float _763 = _341 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _767 = _765 != 0;
    float _769 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[5].x, _759);
    float _771 = in.m_39.y;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _775 = _773 != 0;
    float _777 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[6].x, _763);
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _781 = _779 != 0;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _787 = _785 != 0;
    float _789 = _93 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _791 = _93 > 0.5;
    float _793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _795 = _757 > 0.5;
    bool _797 = _761 > 0.5;
    float _799 = _341 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _807 = fma(_349, (*spvDescriptorSet0.vp_c10)._m0[4].x, _799);
    float _809 = 1.0 / _805;
    float _811 = -_801;
    float _813 = fma(_789, 2.0, _811);
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _819;
    float _823 = fma(_93, (*spvDescriptorSet0.vp_c9)._m0[78].z, _815);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _827 = _755 + _825;
    float _829 = _771 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _833 = _793 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _835 = -_107;
    float _837 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[76].x, _813);
    float _839 = fma(_829, -2.0, _817);
    float _841 = -_205;
    int _843 = _791 ? as_type<int>(_841) : as_type<int>(_205);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _847 = _821 * _809;
    bool _849 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _851 = isnan(_755);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    bool _863 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _865 = isnan(_755);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = fma(_847, _827, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _877 = _771 > 0.5;
    float _879 = -_859;
    float _881 = _879 + 1.0;
    float _883 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[78].w, _831);
    float _885 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _807);
    float _887 = -_197;
    int _889 = _877 ? as_type<int>(_887) : as_type<int>(_197);
    float _891 = _873 * _881;
    float _893 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _769);
    float _895 = _783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _897 = !_767;
    float _899 = _897 ? _205 : as_type<float>(_843);
    float _901 = _875 * _891;
    float _903 = _893 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _905 = _885 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _907 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _777);
    bool _909 = !_775;
    float _911 = _909 ? _197 : as_type<float>(_889);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _905 + _917;
    float _921 = _907 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _923 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[77].w, _883);
    float _925 = _915 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _927 = _911 + (-0.5);
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _921 + _929;
    float _933 = -_873;
    float _935 = _933 + 1.0;
    float _937 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[28].x, _925);
    float _939 = fma(_107, (*spvDescriptorSet0.vp_c9)._m0[76].y, _839);
    float _941 = _899 + 0.5;
    float _943 = -_205;
    int _945 = _795 ? as_type<int>(_943) : as_type<int>(_205);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[28].z, _937);
    float _949 = -_833;
    float _951 = -_939;
    float _953 = fma(_949, _927, _951);
    float _955 = _915 * _915;
    float _957 = fma(_895, _941, _837);
    float _959 = -_197;
    int _961 = _797 ? as_type<int>(_959) : as_type<int>(_197);
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _965 = _947 >= 0.0;
    float _967 = fma(_919, _919, _955);
    bool _969 = !_781;
    float _971 = _969 ? _205 : as_type<float>(_945);
    float _973 = -_861;
    float _975 = _973 + 1.0;
    bool _977 = !_787;
    float _979 = _977 ? _197 : as_type<float>(_961);
    float _981 = fma(_931, _931, _967);
    float _983 = -_923;
    float _985 = _983 + 1.0;
    float _987 = _971 + 0.5;
    float _989 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[131].x, _901);
    float _991 = -_975;
    float _993 = fma(_899, _991, _957);
    float _995 = -_979;
    float _997 = _995 + 0.5;
    float _999 = rsqrt(_981);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1003 = fma(_911, _985, _953);
    float _1005 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[132].x, _989);
    float _1007 = _953;
    int _1009 = as_type<int>(_1005);
    if (_965)
    {
        _1007 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1007;
    float _1013 = _997 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1015 = _1001 * _845;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1019 = _1013 * _963;
    if (_965)
    {
        float _1021 = _1011 * 5.0;
        _1009 = as_type<int>(_1021);
    }
    int _1023 = _1009;
    if (_965)
    {
        out.m_35.x = 0.0;
    }
    out.m_50.x = _993;
    out.m_50.y = _1003;
    out.m_50.z = _1015;
    out.m_50.w = _1019;
    float _1025 = _915 * _999;
    float _1027 = _919 * _999;
    out.m_52.w = _1017;
    if (_965)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3257 = as_type<float>(_1023);
        out.gl_Position.z = _3257;
    }
    if (_965)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1029 = -_1025;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _1033 = _931 * _999;
    float _1035 = -_1027;
    float _1037 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _1039 = -_1025;
    float _1041 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[18].w, _915);
    float _1043 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1045 = _1031 + _1043;
    float _1047 = -_1033;
    float _1049 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _1037 + _1051;
    float _1055 = -_1027;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _919);
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1063 = _1049 + _1061;
    float _1065 = _1041 * _1041;
    float _1067 = -_1033;
    float _1069 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[18].w, _931);
    float _1071 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1059);
    float _1073 = _353 * _597;
    float _1075 = fma(_1057, _1057, _1065);
    float _1077 = _353 * _599;
    float _1079 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1071);
    float _1081 = fma(_1069, _1069, _1075);
    bool _1083 = _1079 >= 0.0;
    float _1085 = sqrt(_1081);
    float _1087 = _1079;
    if (_1083)
    {
        _1087 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _1087;
    int _1091 = as_type<int>(_1089);
    if (_1083)
    {
        out.m_35.x = 0.0;
    }
    if (_1083)
    {
        float _1093 = _1089 * 5.0;
        _1091 = as_type<int>(_1093);
    }
    int _1095 = _1091;
    float _1097 = _999 * _1085;
    if (_1083)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3391 = as_type<float>(_1095);
        out.gl_Position.z = _3391;
    }
    if (_1083)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1099 = _1077 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1101 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1105 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _205);
    float _1107 = _1097 * _1099;
    float _1109 = _1097 * _1101;
    float _1111 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1113 = _1111 * 0.5;
    float _1115 = _1103 * _1107;
    float _1117 = _1105 * _1109;
    float _1119 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1123 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1119);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1121);
    float _1127 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1123);
    float _1129 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1125);
    float _1131 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1133 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1135 = _905 + _1131;
    float _1137 = _921 + _1133;
    float _1139 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1143 = _1135 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1147 = _1137 + _1145;
    float _1149 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1139);
    float _1151 = _1143 * _1143;
    float _1153 = _1147 * _1147;
    float _1155 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1149);
    float _1157 = _1151 + _1153;
    float _1159 = _1155 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1161 = sqrt(_1157);
    float _1163 = _903 + _1159;
    bool _1165 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1139;
    float _1169 = _1159;
    float _1171 = _1113;
    float _1173 = _1135;
    float _1175 = _1153;
    if (!_1165)
    {
        _1167 = _1135;
    }
    float _1177 = _1167;
    float _1179 = _1177;
    if (!_1165)
    {
        _1169 = _1151;
    }
    float _1181 = _1169;
    float _1183 = _1181;
    if (!_1165)
    {
        _1171 = _1137;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (!_1165)
    {
        _1173 = _1163;
    }
    float _1189 = _1173;
    bool _1191 = !_1165;
    float _1193 = _1189;
    if (!_1191)
    {
        float _1195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1199 = _1161 + _1197;
        float _1201 = rsqrt(_1157);
        float _1203 = _1199 * _1195;
        float _1205 = _1163 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = _1203 * 0.15915493667125701904296875;
        float _1209 = _1207 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        float _1213 = _1207 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = fma(_1211, _1205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1219 = _1201 * _1217;
        float _1221 = _1215 + (-1.0);
        float _1223 = fma(_1143, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1225 = fma(_1147, _1219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1227 = _1221 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1231 = _1223 + _1229;
        float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1235 = _1225 + _1233;
        float _1237 = fma(_1163, _1215, _1227);
        float _1239 = _1231 * _1231;
        float _1241 = _1235 * _1235;
        _1193 = _1237;
        _1183 = _1239;
        _1175 = _1241;
        _1179 = _1223;
        _1187 = _1225;
    }
    float _1243 = _1193;
    float _1245 = _1183;
    float _1247 = _1175;
    float _1249 = _1179;
    float _1251 = _1187;
    float _1253 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1255 = _1243 + _1253;
    float _1257 = fma(_1255, _1255, _1245);
    float _1259 = _1257 + _1247;
    float _1261 = sqrt(_1259);
    bool _1263 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1265 = isnan(_1261);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1271 = _1267 || _1269;
    float _1273 = _1245;
    if (!_1271)
    {
        _1273 = 1.0;
    }
    float _1275 = _1273;
    bool _1277 = !_1271;
    float _1279 = _1275;
    if (!_1277)
    {
        bool _1281 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1283 = isnan(_1261);
        bool _1285 = _1281 || _1283;
        bool _1287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1289 = _1285 || _1287;
        if (!_1289)
        {
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = _1261 + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1297 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1295;
            float _1299 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1301 = _1299 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1303 = 1.0 / _1297;
            float _1305 = _1293 * _1303;
            float _1307 = fma(_1305, _1301, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1279 = _1307;
            _1309 = true;
        }
        else
        {
            bool _1311 = _1261 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1313 = isnan(_1261);
            bool _1315 = _1311 || _1313;
            bool _1317 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1319 = _1315 || _1317;
            if (!_1319)
            {
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1261 + _1321;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1329 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1331 = _1329 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1333 = 1.0 / _1327;
                float _1335 = _1323 * _1333;
                float _1337 = fma(_1335, _1331, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1279 = _1337;
                _1309 = true;
            }
            else
            {
                _1279 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1309 = false;
    float _1339 = _1279;
    float _1341 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1343 = _1031 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1345 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1347 = _1249 + _1345;
    float _1349 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1341);
    bool _1351 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1355 = _1351 || _1353;
    bool _1357 = isnan(0.5);
    bool _1359 = _1355 || _1357;
    float _1361 = fma(_1037, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1343);
    float _1363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1365 = _1243 + _1363;
    float _1367 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1369 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1371 = _1251 + _1369;
    float _1373 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1361);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1377 = fma(_1347, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1379 = fma(_1365, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1381 = fma(_1371, _1339, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1383 = 1.0 / _1375;
    float _1385 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1387 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.5);
    bool _1395 = _1391 || _1393;
    float _1397 = -_1027;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1377);
    float _1401 = -_1025;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1379);
    float _1405 = -_1033;
    float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1381);
    float _1409 = _1385 + _1375;
    float _1411 = _1403;
    float _1413 = _1399;
    float _1415 = _1407;
    if (!_1359)
    {
        float _1417 = _1045 * _1045;
        float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1421 = -_903;
        float _1423 = _1421 + _1379;
        float _1425 = -_921;
        float _1427 = _1425 + _1381;
        float _1429 = fma(_1053, _1053, _1417);
        float _1431 = -_905;
        float _1433 = _1431 + _1377;
        float _1435 = fma(_1063, _1063, _1429);
        float _1437 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1439 = sqrt(_1435);
        float _1441 = 1.0 / _1097;
        bool _1443 = _1439 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1445 = isnan(_1439);
        bool _1447 = _1443 || _1445;
        bool _1449 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1451 = _1447 || _1449;
        float _1453 = precise::min(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1455 = _1453 * _1419;
        float _1457 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1459 = _1423 * _1441;
        float _1461 = _1427 * _1441;
        float _1463 = _1433 * _1441;
        float _1465 = _1457 * _1455;
        float _1467 = _1063;
        float _1469 = _1439;
        float _1471 = _1427;
        float _1473 = _1457;
        if (_1451)
        {
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1467 = _1475;
        }
        float _1477 = _1467;
        if (_1451)
        {
            float _1479 = precise::max(_1439, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1469 = _1479;
        }
        float _1481 = _1469;
        float _1483 = fma(_1459, _1465, _1031);
        float _1485 = fma(_1461, _1465, _1049);
        float _1487 = fma(_1463, _1465, _1037);
        float _1489 = _1481;
        float _1491 = _1487;
        if (_1451)
        {
            float _1493 = _1481 * _1477;
            _1489 = _1493;
        }
        float _1495 = _1489;
        float _1497 = _1495;
        if (_1451)
        {
            float _1499 = _1457 * _1495;
            _1471 = _1499;
        }
        float _1501 = _1471;
        if (!_1451)
        {
            _1497 = _1483;
        }
        float _1503 = _1497;
        float _1505 = _1503;
        if (!_1451)
        {
            _1473 = _1485;
        }
        float _1507 = _1473;
        _1415 = _1507;
        if (_1451)
        {
            float _1509 = fma(_1463, _1501, _1037);
            _1491 = _1509;
        }
        float _1511 = _1491;
        _1413 = _1511;
        if (_1451)
        {
            float _1513 = fma(_1459, _1501, _1031);
            _1505 = _1513;
        }
        float _1515 = _1505;
        _1411 = _1515;
        if (_1451)
        {
            float _1517 = fma(_1461, _1501, _1049);
            _1415 = _1517;
        }
    }
    float _1519 = _1411;
    float _1521 = _1413;
    float _1523 = _1415;
    float _1525 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1527 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1529 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1533 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1525);
    float _1535 = _1409 * _1383;
    float _1537 = _1535 * 0.5;
    float _1539 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1527);
    float _1541 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1543 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1531);
    float _1545 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1533);
    float _1547 = _1533;
    if (_1395)
    {
        _1547 = 1.0;
    }
    float _1549 = _1547;
    float _1551 = _1549;
    if (!_1395)
    {
        float _1553 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1557 = fma(_1537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
        float _1559 = _1553 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        float _1565 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1567 = _1565 * 0.15915493667125701904296875;
        float _1569 = _1559 * 6.283185482025146484375;
        float _1571 = sin(_1569);
        float _1573 = 1.0 / _1563;
        float _1575 = _1567 * 6.283185482025146484375;
        float _1577 = cos(_1575);
        float _1579 = _1571 * _1573;
        float _1581 = 1.0 / _1557;
        float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1585 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1583;
        float _1587 = _1577 * _1579;
        float _1589 = _1567 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1587;
        float _1595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1597 = _1581 * _1595;
        float _1599 = 1.0 / _1585;
        float _1601 = _1591 * _1593;
        float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1605 = fma(_1601, _1597, _1603);
        float _1607 = _1605 * _1599;
        float _1609 = precise::clamp(_1607, 0.0, 1.0);
        _1551 = _1609;
    }
    float _1611 = _1551;
    float _1613 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1539);
    float _1615 = _1545 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1617 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1541);
    float _1619 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1543);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1625 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1627 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1629 = _1615 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1623);
    float _1635 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1625);
    float _1637 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1627);
    float _1639 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1641 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1637);
    float _1649 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1639);
    bool _1651 = _1611 > 0.0;
    bool _1653 = isnan(_1611);
    bool _1655 = _1651 || _1653;
    bool _1657 = isnan(0.0);
    bool _1659 = _1655 || _1657;
    float _1661 = _1611 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1663 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1643);
    float _1665 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1645);
    float _1667 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1669 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1647);
    float _1671 = _1661 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1673 = _1663 + _1667;
    float _1675 = _1669 + _1667;
    float _1677 = _1667 * 0.5;
    float _1679 = _1673 * 0.5;
    float _1681 = _1675 * 0.5;
    float _1683 = fma(_1665, -0.5, _1677);
    out.m_35.x = _1671;
    out.gl_Position.x = _1663;
    out.gl_Position.y = _1665;
    out.gl_Position.z = _1669;
    out.gl_Position.w = _1667;
    out.m_54.x = _1679;
    out.m_54.y = _1683;
    out.m_54.z = _1681;
    out.m_54.w = _1667;
    if (_1659)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1685 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1685;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

