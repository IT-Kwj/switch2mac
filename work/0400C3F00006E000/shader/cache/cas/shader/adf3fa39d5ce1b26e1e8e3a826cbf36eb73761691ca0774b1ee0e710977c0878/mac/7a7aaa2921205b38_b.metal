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
    float4 m_56 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_43 [[attribute(7)]];
    float4 m_45 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _527 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_91);
        out.gl_Position.z = _1436;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = _109;
    if (_105)
    {
        float _113 = float(_75);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _93 = as_type<int>(_127);
    }
    int _129 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_129);
        out.gl_Position.z = _1506;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_39.x;
    float _143 = in.m_39.y;
    float _145 = in.m_39.z;
    float _147 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_41.x;
    float _161 = in.m_41.y;
    float _163 = in.m_41.z;
    float _165 = _139 * _137;
    float _167 = 0.0;
    float _169 = _147;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_157)
    {
        float _173 = _147 * _147;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _131 * _131;
    float _181 = _133 * _133;
    float _183 = _135 * _135;
    float _185 = _177;
    if (!_157)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = fma(_141, _141, _179);
    float _193 = fma(_143, _143, _181);
    float _195 = fma(_145, _145, _183);
    float _197 = fma(_159, _159, _191);
    float _199 = fma(_161, _161, _193);
    float _201 = in.m_43.x;
    float _203 = fma(_163, _163, _195);
    float _205 = sqrt(_197);
    float _207 = sqrt(_199);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    bool _215 = _207 > 0.0;
    float _217 = floor(_213);
    float _219 = 0.0;
    float _221 = _197;
    float _223 = _189;
    if (!_211)
    {
        _219 = 0.0;
    }
    float _225 = _219;
    bool _227 = _209 > 0.0;
    float _229 = 0.0;
    float _231 = _209;
    float _233 = _225;
    if (_211)
    {
        float _235 = rsqrt(_197);
        _229 = _235;
    }
    float _237 = _229;
    int _239 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _241 = _239 != 0;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _243 = _231;
    float _245 = _205;
    float _247 = _243;
    if (_215)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = -_217;
    float _255 = _213 + _253;
    float _257 = _213 * 6.283185482025146484375;
    if (!_211)
    {
        _221 = 0.0;
    }
    float _259 = _221;
    float _261 = 0.0;
    float _263 = _259;
    if (_227)
    {
        float _265 = rsqrt(_203);
        _261 = _265;
    }
    float _267 = _261;
    bool _269 = !_157;
    float _271 = 0.0;
    float _273 = 0.0;
    float _275 = _237;
    if (!_269)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _147 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _147);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _305;
        _271 = _295;
        _273 = _289;
    }
    float _307 = _223;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_157;
    float _315 = _311;
    float _317 = _309;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _147 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _169 = _337;
        _171 = _327;
    }
    float _339 = _169;
    float _341 = _171;
    float _343 = _257 * 0.15915493667125701904296875;
    float _345 = in.m_35.x;
    float _347 = in.m_35.y;
    float _349 = in.m_35.z;
    float _351 = _341;
    if (!_227)
    {
        _315 = 0.0;
        _351 = 0.0;
    }
    float _353 = _315;
    float _355 = _351;
    float _357 = _343 * 6.283185482025146484375;
    float _359 = cos(_357);
    float _361 = _353;
    float _363 = _355;
    if (_211)
    {
        float _365 = _237 * _141;
        _247 = _365;
    }
    float _367 = _247;
    if (_211)
    {
        float _369 = _237 * _131;
        _263 = _369;
    }
    float _371 = _263;
    if (_211)
    {
        float _373 = _237 * _159;
        _233 = _373;
    }
    float _375 = _233;
    float _377 = 0.0;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_227)
    {
        float _383 = _267 * _145;
        _361 = _383;
    }
    float _385 = _361;
    if (!_215)
    {
        _317 = 0.0;
    }
    float _387 = _317;
    float _389 = _387;
    if (_227)
    {
        float _391 = _267 * _135;
        _363 = _391;
    }
    float _393 = _363;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _395 = _275;
    float _397 = _395;
    if (_227)
    {
        float _399 = _267 * _163;
        _381 = _399;
    }
    float _401 = _381;
    float _403 = 0.0;
    if (!_215)
    {
        _403 = 0.0;
    }
    float _405 = _403;
    float _407 = _405;
    if (_215)
    {
        float _409 = _251 * _143;
        _389 = _409;
    }
    float _411 = _389;
    if (_215)
    {
        float _413 = _251 * _133;
        _397 = _413;
    }
    float _415 = _397;
    if (_215)
    {
        float _417 = _251 * _161;
        _407 = _417;
    }
    float _419 = _407;
    float _421 = in.m_45.w;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    float _431 = fma(_359, 0.5, 0.5);
    bool _433 = _255 < 0.5;
    float _435 = float(_433);
    float _437 = in.m_30.x;
    float _439 = in.m_30.y;
    float _441 = in.m_30.z;
    bool _443 = !_425;
    int _445 = _443 ? 0 : 1;
    float _447 = -_255;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _451 = !_241;
    int _453 = _451 ? 0 : 1;
    float _455 = -_435;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = -_431;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _465 = abs(_445);
    float _467 = fma(_339, _345, _459);
    int _469 = abs(_453);
    float _471 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_429;
    int _475 = _473 ? 0 : 1;
    float _477 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_339, _347, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _483 = fma(_339, _349, _477);
    int _485 = abs(_475);
    float _487 = float(_465);
    float _489 = float(_469);
    float _491 = abs(_449);
    float _493 = _487 * _491;
    float _495 = fma(_467, _421, _437);
    float _497 = fma(_479, _421, _439);
    float _499 = float(_485);
    float _501 = fma(_489, _463, _493);
    float _503 = fma(_483, _421, _441);
    float _505 = abs(_457);
    float _507 = fma(_499, _505, _501);
    bool _509 = !_481;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _513 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_75);
        float _531 = 1.0 / _529;
        float _533 = _109 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = _535 + _537;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _553;
    float _557 = -_551;
    float _559 = _557 + 1.0;
    bool _561 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_535);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _579 = 1.0 / _555;
    float _581 = _571 * _559;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = _539 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _589;
    float _593 = fma(_575, _587, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = _593 * _581;
    float _599 = _595 * _581;
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _599);
    float _605 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].x, _601);
    float _607 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].y, _603);
    bool _609 = !_577;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _201 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_75);
        float _631 = 1.0 / _629;
        float _633 = _109 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_43.z;
    float _639 = _201 * 2.0;
    float _641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _643 = log2(_641);
    float _645 = in.m_43.y;
    float _647 = _497 * _133;
    float _649 = floor(_639);
    float _651 = _637 * 2.0;
    bool _653 = _649 > 0.0;
    float _655 = _645 * 2.0;
    float _657 = _645 + _637;
    float _659 = floor(_651);
    bool _661 = _649 >= 0.0;
    bool _663 = isnan(_649);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _657 + (-1.0);
    int _673 = _669 ? 0 : 1;
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _677 = floor(_655);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _689 = _687 != 0;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    if (!_653)
    {
        int _699 = ~_673;
        int _701 = _699 + 1;
        _697 = _701;
    }
    int _703 = _697;
    float _705 = _643 * _109;
    bool _707 = _659 > 0.0;
    bool _709 = _659 >= 0.0;
    bool _711 = isnan(_659);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = in.m_47.x;
    float _721 = in.m_47.y;
    float _723 = in.m_47.z;
    float _725 = exp2(_705);
    bool _727 = _677 > 0.0;
    bool _729 = _677 >= 0.0;
    bool _731 = isnan(_677);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = !_685;
    int _741 = _739 ? 0 : 1;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _755 = 1.0 + _753;
    bool _757 = !_681;
    int _759 = _757 ? 0 : 1;
    int _761 = abs(_741);
    float _763 = 1.0 / _755;
    int _765 = _717 ? 0 : 1;
    int _767 = abs(_759);
    float _769 = -_725;
    float _771 = _769 + 1.0;
    float _773 = float(_761);
    float _775 = float(_703);
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_707)
    {
        int _785 = ~_765;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = _773 * _775;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = _791 * (-2.0);
    float _805 = float(_767);
    float _807 = float(_789);
    float _809 = _801 ? _771 : 0.0;
    int _811 = _737 ? 0 : 1;
    float _813 = _805 * _807;
    float _815 = fma(_675, _803, _675);
    float _817 = fma(_803, _721, _721);
    if (_751)
    {
        float _819 = _809 * _763;
        _111 = _819;
    }
    float _821 = _111;
    float _823 = _201 + _645;
    int _825 = ~_811;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    float _831 = _645 + (-0.5);
    bool _833 = !_689;
    int _835 = _833 ? 0 : 1;
    float _837 = _823 + (-1.0);
    int _839 = _829;
    if (!_727)
    {
        int _841 = ~_811;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].y, _817);
    float _849 = _813 * (-2.0);
    int _851 = abs(_835);
    float _853 = fma(_815, _821, _847);
    float _855 = as_type<float>(int(gl_VertexIndex));
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _859 = float(_851);
    float _861 = _853 * 0.15915493667125701904296875;
    float _863 = float(_845);
    float _865 = fma(_857, _849, _857);
    float _867 = fma(_849, _719, _719);
    float _869 = _201 + (-0.5);
    float _871 = _859 * _863;
    float _873 = _201 + _637;
    float _875 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[196].x, _867);
    bool _877 = _201 > 0.5;
    float _879 = _871 * (-2.0);
    float _881 = _873 + (-1.0);
    float _883 = fma(_865, _821, _875);
    float _885 = in.m_45.x;
    float _887 = in.m_45.y;
    float _889 = fma(_879, _723, _723);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _893 = _637 + (-0.5);
    float _895 = _883 * 0.15915493667125701904296875;
    float _897 = _861 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = fma(_891, _879, _891);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].z, _889);
    float _905 = _497 * _143;
    int _907 = as_type<int>(_855) & 1;
    bool _909 = _907 != 0;
    int _911 = as_type<int>(_855) & 2;
    bool _913 = _911 != 0;
    float _915 = in.m_39.w;
    float _917 = fma(_901, _821, _903);
    float _919 = _497 * _161;
    float _921 = _895 * 6.283185482025146484375;
    float _923 = sin(_921);
    float _925 = fma(_495, _141, _905);
    float _927 = _917 * 0.15915493667125701904296875;
    float _929 = fma(_495, _131, _647);
    float _931 = fma(_495, _159, _919);
    bool _933 = !_909;
    float _935 = _933 ? (-0.5) : 0.5;
    float _937 = fma(_503, _145, _925);
    bool _939 = !_913;
    float _941 = _939 ? (-0.5) : 0.5;
    float _943 = _895 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = in.m_41.w;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _951 = _605 * _885;
    float _953 = _607 * _887;
    float _955 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _941);
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _927 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = fma(_503, _163, _931);
    float _969 = _959 * _949;
    float _971 = _923 * _899;
    float _973 = _965 * _955;
    float _975 = _937 + _915;
    bool _977 = _645 > 0.5;
    float _979 = _861 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _945 * _899;
    float _985 = fma(_503, _135, _929);
    float _987 = _927 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _899 * _963;
    float _993 = _963 * _957;
    float _995 = _967 + _947;
    float _997 = _945 * _993;
    float _999 = _945 * _981;
    float _1001 = _981 * _963;
    float _1003 = _923 * _981;
    float _1005 = _923 * _993;
    float _1007 = fma(_989, _999, _971);
    float _1009 = -_983;
    float _1011 = fma(_989, _1003, _1009);
    float _1013 = _989 * _957;
    float _1015 = -_1003;
    float _1017 = fma(_989, _983, _1015);
    float _1019 = fma(_1007, _969, _997);
    float _1021 = fma(_989, _971, _999);
    float _1023 = -_1013;
    float _1025 = fma(_1001, _969, _1023);
    float _1027 = fma(_1011, _969, _1005);
    float _1029 = -_973;
    float _1031 = fma(_1017, _1029, _1019);
    float _1033 = -_973;
    float _1035 = fma(_991, _1033, _1025);
    float _1037 = -_973;
    float _1039 = fma(_1021, _1037, _1027);
    float _1041 = _1031 * _419;
    float _1043 = _1031 * _411;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1049 = fma(_1035, _375, _1041);
    float _1051 = fma(_1035, _367, _1043);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = fma(_1039, _401, _1049);
    float _1059 = fma(_1039, _385, _1051);
    float _1061 = 1.0 / _1055;
    float _1063 = _995 + _1057;
    float _1065 = _975 + _1059;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1069 = _1067 != 0;
    float _1071 = in.m_37.w;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1075 = _1073 != 0;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1079 = _1063 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    float _1085 = 1.0 / _1047;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1065 + _1087;
    float _1091 = _1079 * _1079;
    bool _1093 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1095 = isnan(_635);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1031 * _415;
    bool _1107 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1109 = isnan(_635);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = fma(_1089, _1089, _1091);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1123 = _635 + _1121;
    float _1125 = _1083 * _1061;
    float _1127 = sqrt(_1119);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_1125, _1123, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1135 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_635);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = _1117 * _1131;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1153 = -_1117;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1035, _371, _1105);
    float _1159 = _1133 * _1147;
    float _1161 = -_1145;
    float _1163 = _1161 + 1.0;
    float _1165 = _1151 * _1085;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1169 = _635 + _1167;
    float _1171 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1159);
    float _1173 = _985 + _1071;
    float _1175 = fma(_1039, _393, _1157);
    bool _1177 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1103 * _1163;
    float _1181 = fma(_1165, _1169, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1183 = -_935;
    float _1185 = _877 ? _1183 : _935;
    float _1187 = _1173 + _1175;
    float _1189 = -_941;
    float _1191 = _977 ? _1189 : _941;
    float _1193 = fma(_1181, _1179, _1171);
    bool _1195 = !_1069;
    float _1197 = _1195 ? _935 : _1185;
    bool _1199 = !_1075;
    float _1201 = _1199 ? _941 : _1191;
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1193);
    float _1205 = _1185;
    float _1207 = _1031;
    float _1209 = _1191;
    if (!_1177)
    {
        _1205 = _1065;
    }
    float _1211 = _1205;
    float _1213 = _1211;
    if (!_1177)
    {
        _1207 = _1063;
    }
    float _1215 = _1207;
    float _1217 = _1215;
    if (!_1177)
    {
        _1209 = _1187;
    }
    float _1219 = _1209;
    bool _1221 = !_1177;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1127 + _1227;
        float _1231 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1233 = rsqrt(_1119);
        float _1235 = _1229 * _1225;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 + (-1.0);
        float _1249 = fma(_1245, _1231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1251 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = _1233 * _1249;
        float _1255 = fma(_1187, _1241, _1251);
        float _1257 = fma(_1089, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1079, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1223 = _1255;
        _1213 = _1257;
        _1217 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1273 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1267);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1269);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1271);
    float _1283 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1275);
    float _1285 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1277);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1281);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1293 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = -_1201;
    float _1299 = _1297 + 0.5;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1305 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1309 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1311 = _1197 + 0.5;
    float _1313 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1303);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1305);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1327 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1329 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1317);
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1319);
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _1323 * _1279;
    float _1337 = _1325 * _1295;
    float _1339 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1341 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1357 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1327);
    float _1377 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1331);
    float _1379 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    out.m_33.x = _1357;
    out.m_52.x = _1367;
    out.m_52.y = _1369;
    out.m_52.z = _1371;
    out.m_52.w = _1359;
    out.m_54.x = _1335;
    out.m_54.y = _1337;
    out.m_56.x = _1361;
    out.m_56.y = _1363;
    out.m_56.z = _1365;
    out.m_56.w = _1373;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1377;
    out.gl_Position.w = _1379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _527 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_91);
        out.gl_Position.z = _1436;
    }
    if (!_79)
    {
        return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = _109;
    if (_105)
    {
        float _113 = float(_75);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _93 = as_type<int>(_127);
    }
    int _129 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_129);
        out.gl_Position.z = _1506;
    }
    if (_121)
    {
        return out;
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_39.x;
    float _143 = in.m_39.y;
    float _145 = in.m_39.z;
    float _147 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_41.x;
    float _161 = in.m_41.y;
    float _163 = in.m_41.z;
    float _165 = _139 * _137;
    float _167 = 0.0;
    float _169 = _147;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_157)
    {
        float _173 = _147 * _147;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _131 * _131;
    float _181 = _133 * _133;
    float _183 = _135 * _135;
    float _185 = _177;
    if (!_157)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = fma(_141, _141, _179);
    float _193 = fma(_143, _143, _181);
    float _195 = fma(_145, _145, _183);
    float _197 = fma(_159, _159, _191);
    float _199 = fma(_161, _161, _193);
    float _201 = in.m_43.x;
    float _203 = fma(_163, _163, _195);
    float _205 = sqrt(_197);
    float _207 = sqrt(_199);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    bool _215 = _207 > 0.0;
    float _217 = floor(_213);
    float _219 = 0.0;
    float _221 = _197;
    float _223 = _189;
    if (!_211)
    {
        _219 = 0.0;
    }
    float _225 = _219;
    bool _227 = _209 > 0.0;
    float _229 = 0.0;
    float _231 = _209;
    float _233 = _225;
    if (_211)
    {
        float _235 = rsqrt(_197);
        _229 = _235;
    }
    float _237 = _229;
    int _239 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _241 = _239 != 0;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _243 = _231;
    float _245 = _205;
    float _247 = _243;
    if (_215)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = -_217;
    float _255 = _213 + _253;
    float _257 = _213 * 6.283185482025146484375;
    if (!_211)
    {
        _221 = 0.0;
    }
    float _259 = _221;
    float _261 = 0.0;
    float _263 = _259;
    if (_227)
    {
        float _265 = rsqrt(_203);
        _261 = _265;
    }
    float _267 = _261;
    bool _269 = !_157;
    float _271 = 0.0;
    float _273 = 0.0;
    float _275 = _237;
    if (!_269)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _147 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _147);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _305;
        _271 = _295;
        _273 = _289;
    }
    float _307 = _223;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_157;
    float _315 = _311;
    float _317 = _309;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _147 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _169 = _337;
        _171 = _327;
    }
    float _339 = _169;
    float _341 = _171;
    float _343 = _257 * 0.15915493667125701904296875;
    float _345 = in.m_35.x;
    float _347 = in.m_35.y;
    float _349 = in.m_35.z;
    float _351 = _341;
    if (!_227)
    {
        _315 = 0.0;
        _351 = 0.0;
    }
    float _353 = _315;
    float _355 = _351;
    float _357 = _343 * 6.283185482025146484375;
    float _359 = cos(_357);
    float _361 = _353;
    float _363 = _355;
    if (_211)
    {
        float _365 = _237 * _141;
        _247 = _365;
    }
    float _367 = _247;
    if (_211)
    {
        float _369 = _237 * _131;
        _263 = _369;
    }
    float _371 = _263;
    if (_211)
    {
        float _373 = _237 * _159;
        _233 = _373;
    }
    float _375 = _233;
    float _377 = 0.0;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_227)
    {
        float _383 = _267 * _145;
        _361 = _383;
    }
    float _385 = _361;
    if (!_215)
    {
        _317 = 0.0;
    }
    float _387 = _317;
    float _389 = _387;
    if (_227)
    {
        float _391 = _267 * _135;
        _363 = _391;
    }
    float _393 = _363;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _395 = _275;
    float _397 = _395;
    if (_227)
    {
        float _399 = _267 * _163;
        _381 = _399;
    }
    float _401 = _381;
    float _403 = 0.0;
    if (!_215)
    {
        _403 = 0.0;
    }
    float _405 = _403;
    float _407 = _405;
    if (_215)
    {
        float _409 = _251 * _143;
        _389 = _409;
    }
    float _411 = _389;
    if (_215)
    {
        float _413 = _251 * _133;
        _397 = _413;
    }
    float _415 = _397;
    if (_215)
    {
        float _417 = _251 * _161;
        _407 = _417;
    }
    float _419 = _407;
    float _421 = in.m_45.w;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    float _431 = fma(_359, 0.5, 0.5);
    bool _433 = _255 < 0.5;
    float _435 = float(_433);
    float _437 = in.m_30.x;
    float _439 = in.m_30.y;
    float _441 = in.m_30.z;
    bool _443 = !_425;
    int _445 = _443 ? 0 : 1;
    float _447 = -_255;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _451 = !_241;
    int _453 = _451 ? 0 : 1;
    float _455 = -_435;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = -_431;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _465 = abs(_445);
    float _467 = fma(_339, _345, _459);
    int _469 = abs(_453);
    float _471 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_429;
    int _475 = _473 ? 0 : 1;
    float _477 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_339, _347, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _483 = fma(_339, _349, _477);
    int _485 = abs(_475);
    float _487 = float(_465);
    float _489 = float(_469);
    float _491 = abs(_449);
    float _493 = _487 * _491;
    float _495 = fma(_467, _421, _437);
    float _497 = fma(_479, _421, _439);
    float _499 = float(_485);
    float _501 = fma(_489, _463, _493);
    float _503 = fma(_483, _421, _441);
    float _505 = abs(_457);
    float _507 = fma(_499, _505, _501);
    bool _509 = !_481;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _513 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_75);
        float _531 = 1.0 / _529;
        float _533 = _109 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = _535 + _537;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _553;
    float _557 = -_551;
    float _559 = _557 + 1.0;
    bool _561 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_535);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _579 = 1.0 / _555;
    float _581 = _571 * _559;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = _539 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _589;
    float _593 = fma(_575, _587, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = _593 * _581;
    float _599 = _595 * _581;
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _599);
    float _605 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].x, _601);
    float _607 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].y, _603);
    bool _609 = !_577;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _201 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_75);
        float _631 = 1.0 / _629;
        float _633 = _109 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_43.z;
    float _639 = _201 * 2.0;
    float _641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _643 = log2(_641);
    float _645 = in.m_43.y;
    float _647 = _497 * _133;
    float _649 = floor(_639);
    float _651 = _637 * 2.0;
    bool _653 = _649 > 0.0;
    float _655 = _645 * 2.0;
    float _657 = _645 + _637;
    float _659 = floor(_651);
    bool _661 = _649 >= 0.0;
    bool _663 = isnan(_649);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _657 + (-1.0);
    int _673 = _669 ? 0 : 1;
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _677 = floor(_655);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _689 = _687 != 0;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    if (!_653)
    {
        int _699 = ~_673;
        int _701 = _699 + 1;
        _697 = _701;
    }
    int _703 = _697;
    float _705 = _643 * _109;
    bool _707 = _659 > 0.0;
    bool _709 = _659 >= 0.0;
    bool _711 = isnan(_659);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = in.m_47.x;
    float _721 = in.m_47.y;
    float _723 = in.m_47.z;
    float _725 = exp2(_705);
    bool _727 = _677 > 0.0;
    bool _729 = _677 >= 0.0;
    bool _731 = isnan(_677);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = !_685;
    int _741 = _739 ? 0 : 1;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _755 = 1.0 + _753;
    bool _757 = !_681;
    int _759 = _757 ? 0 : 1;
    int _761 = abs(_741);
    float _763 = 1.0 / _755;
    int _765 = _717 ? 0 : 1;
    int _767 = abs(_759);
    float _769 = -_725;
    float _771 = _769 + 1.0;
    float _773 = float(_761);
    float _775 = float(_703);
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_707)
    {
        int _785 = ~_765;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = _773 * _775;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = _791 * (-2.0);
    float _805 = float(_767);
    float _807 = float(_789);
    float _809 = _801 ? _771 : 0.0;
    int _811 = _737 ? 0 : 1;
    float _813 = _805 * _807;
    float _815 = fma(_675, _803, _675);
    float _817 = fma(_803, _721, _721);
    if (_751)
    {
        float _819 = _809 * _763;
        _111 = _819;
    }
    float _821 = _111;
    float _823 = _201 + _645;
    int _825 = ~_811;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    float _831 = _645 + (-0.5);
    bool _833 = !_689;
    int _835 = _833 ? 0 : 1;
    float _837 = _823 + (-1.0);
    int _839 = _829;
    if (!_727)
    {
        int _841 = ~_811;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].y, _817);
    float _849 = _813 * (-2.0);
    int _851 = abs(_835);
    float _853 = fma(_815, _821, _847);
    float _855 = as_type<float>(int(gl_VertexIndex));
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _859 = float(_851);
    float _861 = _853 * 0.15915493667125701904296875;
    float _863 = float(_845);
    float _865 = fma(_857, _849, _857);
    float _867 = fma(_849, _719, _719);
    float _869 = _201 + (-0.5);
    float _871 = _859 * _863;
    float _873 = _201 + _637;
    float _875 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[196].x, _867);
    bool _877 = _201 > 0.5;
    float _879 = _871 * (-2.0);
    float _881 = _873 + (-1.0);
    float _883 = fma(_865, _821, _875);
    float _885 = in.m_45.x;
    float _887 = in.m_45.y;
    float _889 = fma(_879, _723, _723);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _893 = _637 + (-0.5);
    float _895 = _883 * 0.15915493667125701904296875;
    float _897 = _861 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = fma(_891, _879, _891);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].z, _889);
    float _905 = _497 * _143;
    int _907 = as_type<int>(_855) & 1;
    bool _909 = _907 != 0;
    int _911 = as_type<int>(_855) & 2;
    bool _913 = _911 != 0;
    float _915 = in.m_39.w;
    float _917 = fma(_901, _821, _903);
    float _919 = _497 * _161;
    float _921 = _895 * 6.283185482025146484375;
    float _923 = sin(_921);
    float _925 = fma(_495, _141, _905);
    float _927 = _917 * 0.15915493667125701904296875;
    float _929 = fma(_495, _131, _647);
    float _931 = fma(_495, _159, _919);
    bool _933 = !_909;
    float _935 = _933 ? (-0.5) : 0.5;
    float _937 = fma(_503, _145, _925);
    bool _939 = !_913;
    float _941 = _939 ? (-0.5) : 0.5;
    float _943 = _895 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = in.m_41.w;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _951 = _605 * _885;
    float _953 = _607 * _887;
    float _955 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _941);
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _927 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = fma(_503, _163, _931);
    float _969 = _959 * _949;
    float _971 = _923 * _899;
    float _973 = _965 * _955;
    float _975 = _937 + _915;
    bool _977 = _645 > 0.5;
    float _979 = _861 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _945 * _899;
    float _985 = fma(_503, _135, _929);
    float _987 = _927 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _899 * _963;
    float _993 = _963 * _957;
    float _995 = _967 + _947;
    float _997 = _945 * _993;
    float _999 = _945 * _981;
    float _1001 = _981 * _963;
    float _1003 = _923 * _981;
    float _1005 = _923 * _993;
    float _1007 = fma(_989, _999, _971);
    float _1009 = -_983;
    float _1011 = fma(_989, _1003, _1009);
    float _1013 = _989 * _957;
    float _1015 = -_1003;
    float _1017 = fma(_989, _983, _1015);
    float _1019 = fma(_1007, _969, _997);
    float _1021 = fma(_989, _971, _999);
    float _1023 = -_1013;
    float _1025 = fma(_1001, _969, _1023);
    float _1027 = fma(_1011, _969, _1005);
    float _1029 = -_973;
    float _1031 = fma(_1017, _1029, _1019);
    float _1033 = -_973;
    float _1035 = fma(_991, _1033, _1025);
    float _1037 = -_973;
    float _1039 = fma(_1021, _1037, _1027);
    float _1041 = _1031 * _419;
    float _1043 = _1031 * _411;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1049 = fma(_1035, _375, _1041);
    float _1051 = fma(_1035, _367, _1043);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = fma(_1039, _401, _1049);
    float _1059 = fma(_1039, _385, _1051);
    float _1061 = 1.0 / _1055;
    float _1063 = _995 + _1057;
    float _1065 = _975 + _1059;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1069 = _1067 != 0;
    float _1071 = in.m_37.w;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1075 = _1073 != 0;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1079 = _1063 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    float _1085 = 1.0 / _1047;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1065 + _1087;
    float _1091 = _1079 * _1079;
    bool _1093 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1095 = isnan(_635);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1031 * _415;
    bool _1107 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1109 = isnan(_635);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = fma(_1089, _1089, _1091);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1123 = _635 + _1121;
    float _1125 = _1083 * _1061;
    float _1127 = sqrt(_1119);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_1125, _1123, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1135 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_635);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = _1117 * _1131;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1153 = -_1117;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1035, _371, _1105);
    float _1159 = _1133 * _1147;
    float _1161 = -_1145;
    float _1163 = _1161 + 1.0;
    float _1165 = _1151 * _1085;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1169 = _635 + _1167;
    float _1171 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1159);
    float _1173 = _985 + _1071;
    float _1175 = fma(_1039, _393, _1157);
    bool _1177 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1103 * _1163;
    float _1181 = fma(_1165, _1169, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1183 = -_935;
    float _1185 = _877 ? _1183 : _935;
    float _1187 = _1173 + _1175;
    float _1189 = -_941;
    float _1191 = _977 ? _1189 : _941;
    float _1193 = fma(_1181, _1179, _1171);
    bool _1195 = !_1069;
    float _1197 = _1195 ? _935 : _1185;
    bool _1199 = !_1075;
    float _1201 = _1199 ? _941 : _1191;
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1193);
    float _1205 = _1185;
    float _1207 = _1031;
    float _1209 = _1191;
    if (!_1177)
    {
        _1205 = _1065;
    }
    float _1211 = _1205;
    float _1213 = _1211;
    if (!_1177)
    {
        _1207 = _1063;
    }
    float _1215 = _1207;
    float _1217 = _1215;
    if (!_1177)
    {
        _1209 = _1187;
    }
    float _1219 = _1209;
    bool _1221 = !_1177;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1127 + _1227;
        float _1231 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1233 = rsqrt(_1119);
        float _1235 = _1229 * _1225;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 + (-1.0);
        float _1249 = fma(_1245, _1231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1251 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = _1233 * _1249;
        float _1255 = fma(_1187, _1241, _1251);
        float _1257 = fma(_1089, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1079, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1223 = _1255;
        _1213 = _1257;
        _1217 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1273 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1267);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1269);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1271);
    float _1283 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1275);
    float _1285 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1277);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1281);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1293 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = -_1201;
    float _1299 = _1297 + 0.5;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1305 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1309 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1311 = _1197 + 0.5;
    float _1313 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1303);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1305);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1327 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1329 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1317);
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1319);
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _1323 * _1279;
    float _1337 = _1325 * _1295;
    float _1339 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1341 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1357 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1327);
    float _1377 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1331);
    float _1379 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    out.m_33.x = _1357;
    out.m_52.x = _1367;
    out.m_52.y = _1369;
    out.m_52.z = _1371;
    out.m_52.w = _1359;
    out.m_54.x = _1335;
    out.m_54.y = _1337;
    out.m_56.x = _1361;
    out.m_56.y = _1363;
    out.m_56.z = _1365;
    out.m_56.w = _1373;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1377;
    out.gl_Position.w = _1379;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _527 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1436 = as_type<float>(_91);
        out.gl_Position.z = _1436;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = _109;
    if (_105)
    {
        float _113 = float(_75);
        _85 = _113;
    }
    float _115 = _85;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _93 = as_type<int>(_127);
    }
    int _129 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1506 = as_type<float>(_129);
        out.gl_Position.z = _1506;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_37.x;
    float _133 = in.m_37.y;
    float _135 = in.m_37.z;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_39.x;
    float _143 = in.m_39.y;
    float _145 = in.m_39.z;
    float _147 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_41.x;
    float _161 = in.m_41.y;
    float _163 = in.m_41.z;
    float _165 = _139 * _137;
    float _167 = 0.0;
    float _169 = _147;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    if (!_157)
    {
        float _173 = _147 * _147;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _131 * _131;
    float _181 = _133 * _133;
    float _183 = _135 * _135;
    float _185 = _177;
    if (!_157)
    {
        float _187 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    float _191 = fma(_141, _141, _179);
    float _193 = fma(_143, _143, _181);
    float _195 = fma(_145, _145, _183);
    float _197 = fma(_159, _159, _191);
    float _199 = fma(_161, _161, _193);
    float _201 = in.m_43.x;
    float _203 = fma(_163, _163, _195);
    float _205 = sqrt(_197);
    float _207 = sqrt(_199);
    float _209 = sqrt(_203);
    bool _211 = _205 > 0.0;
    float _213 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    bool _215 = _207 > 0.0;
    float _217 = floor(_213);
    float _219 = 0.0;
    float _221 = _197;
    float _223 = _189;
    if (!_211)
    {
        _219 = 0.0;
    }
    float _225 = _219;
    bool _227 = _209 > 0.0;
    float _229 = 0.0;
    float _231 = _209;
    float _233 = _225;
    if (_211)
    {
        float _235 = rsqrt(_197);
        _229 = _235;
    }
    float _237 = _229;
    int _239 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _241 = _239 != 0;
    if (!_211)
    {
        _231 = 0.0;
    }
    float _243 = _231;
    float _245 = _205;
    float _247 = _243;
    if (_215)
    {
        float _249 = rsqrt(_199);
        _245 = _249;
    }
    float _251 = _245;
    float _253 = -_217;
    float _255 = _213 + _253;
    float _257 = _213 * 6.283185482025146484375;
    if (!_211)
    {
        _221 = 0.0;
    }
    float _259 = _221;
    float _261 = 0.0;
    float _263 = _259;
    if (_227)
    {
        float _265 = rsqrt(_203);
        _261 = _265;
    }
    float _267 = _261;
    bool _269 = !_157;
    float _271 = 0.0;
    float _273 = 0.0;
    float _275 = _237;
    if (!_269)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = _147 * _279;
        float _289 = 1.0 / _283;
        float _291 = _285 * 0.693147182464599609375;
        float _293 = exp2(_287);
        float _295 = 1.0 / _291;
        float _297 = _293 + (-1.0);
        float _299 = -_297;
        float _301 = fma(_299, _295, _147);
        float _303 = _301 * _289;
        float _305 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _305;
        _271 = _295;
        _273 = _289;
    }
    float _307 = _223;
    float _309 = _271;
    float _311 = _273;
    bool _313 = !_157;
    float _315 = _311;
    float _317 = _309;
    if (!_313)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _147 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _169 = _337;
        _171 = _327;
    }
    float _339 = _169;
    float _341 = _171;
    float _343 = _257 * 0.15915493667125701904296875;
    float _345 = in.m_35.x;
    float _347 = in.m_35.y;
    float _349 = in.m_35.z;
    float _351 = _341;
    if (!_227)
    {
        _315 = 0.0;
        _351 = 0.0;
    }
    float _353 = _315;
    float _355 = _351;
    float _357 = _343 * 6.283185482025146484375;
    float _359 = cos(_357);
    float _361 = _353;
    float _363 = _355;
    if (_211)
    {
        float _365 = _237 * _141;
        _247 = _365;
    }
    float _367 = _247;
    if (_211)
    {
        float _369 = _237 * _131;
        _263 = _369;
    }
    float _371 = _263;
    if (_211)
    {
        float _373 = _237 * _159;
        _233 = _373;
    }
    float _375 = _233;
    float _377 = 0.0;
    if (!_227)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_227)
    {
        float _383 = _267 * _145;
        _361 = _383;
    }
    float _385 = _361;
    if (!_215)
    {
        _317 = 0.0;
    }
    float _387 = _317;
    float _389 = _387;
    if (_227)
    {
        float _391 = _267 * _135;
        _363 = _391;
    }
    float _393 = _363;
    if (!_215)
    {
        _275 = 0.0;
    }
    float _395 = _275;
    float _397 = _395;
    if (_227)
    {
        float _399 = _267 * _163;
        _381 = _399;
    }
    float _401 = _381;
    float _403 = 0.0;
    if (!_215)
    {
        _403 = 0.0;
    }
    float _405 = _403;
    float _407 = _405;
    if (_215)
    {
        float _409 = _251 * _143;
        _389 = _409;
    }
    float _411 = _389;
    if (_215)
    {
        float _413 = _251 * _133;
        _397 = _413;
    }
    float _415 = _397;
    if (_215)
    {
        float _417 = _251 * _161;
        _407 = _417;
    }
    float _419 = _407;
    float _421 = in.m_45.w;
    int _423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _425 = _423 != 0;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _429 = _427 != 0;
    float _431 = fma(_359, 0.5, 0.5);
    bool _433 = _255 < 0.5;
    float _435 = float(_433);
    float _437 = in.m_30.x;
    float _439 = in.m_30.y;
    float _441 = in.m_30.z;
    bool _443 = !_425;
    int _445 = _443 ? 0 : 1;
    float _447 = -_255;
    float _449 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _451 = !_241;
    int _453 = _451 ? 0 : 1;
    float _455 = -_435;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _459 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _461 = -_431;
    float _463 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _465 = abs(_445);
    float _467 = fma(_339, _345, _459);
    int _469 = abs(_453);
    float _471 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_429;
    int _475 = _473 ? 0 : 1;
    float _477 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_339, _347, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _483 = fma(_339, _349, _477);
    int _485 = abs(_475);
    float _487 = float(_465);
    float _489 = float(_469);
    float _491 = abs(_449);
    float _493 = _487 * _491;
    float _495 = fma(_467, _421, _437);
    float _497 = fma(_479, _421, _439);
    float _499 = float(_485);
    float _501 = fma(_489, _463, _493);
    float _503 = fma(_483, _421, _441);
    float _505 = abs(_457);
    float _507 = fma(_499, _505, _501);
    bool _509 = !_481;
    float _525;
    if (!_509)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _513 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_75);
        float _531 = 1.0 / _529;
        float _533 = _109 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = _535 + _537;
    bool _541 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_535);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _553;
    float _557 = -_551;
    float _559 = _557 + 1.0;
    bool _561 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_535);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _573;
    bool _577 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _579 = 1.0 / _555;
    float _581 = _571 * _559;
    float _583 = -_571;
    float _585 = _583 + 1.0;
    float _587 = _539 * _579;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _589;
    float _593 = fma(_575, _587, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_591, _587, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = _593 * _581;
    float _599 = _595 * _581;
    float _601 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _597);
    float _603 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _599);
    float _605 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].x, _601);
    float _607 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[144].y, _603);
    bool _609 = !_577;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _613 = _201 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_75);
        float _631 = 1.0 / _629;
        float _633 = _109 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_43.z;
    float _639 = _201 * 2.0;
    float _641 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _643 = log2(_641);
    float _645 = in.m_43.y;
    float _647 = _497 * _133;
    float _649 = floor(_639);
    float _651 = _637 * 2.0;
    bool _653 = _649 > 0.0;
    float _655 = _645 * 2.0;
    float _657 = _645 + _637;
    float _659 = floor(_651);
    bool _661 = _649 >= 0.0;
    bool _663 = isnan(_649);
    bool _665 = _661 || _663;
    bool _667 = isnan(0.0);
    bool _669 = _665 || _667;
    float _671 = _657 + (-1.0);
    int _673 = _669 ? 0 : 1;
    float _675 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _677 = floor(_655);
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _681 = _679 != 0;
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _685 = _683 != 0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _689 = _687 != 0;
    int _691 = ~_673;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    int _697 = _695;
    if (!_653)
    {
        int _699 = ~_673;
        int _701 = _699 + 1;
        _697 = _701;
    }
    int _703 = _697;
    float _705 = _643 * _109;
    bool _707 = _659 > 0.0;
    bool _709 = _659 >= 0.0;
    bool _711 = isnan(_659);
    bool _713 = _709 || _711;
    bool _715 = isnan(0.0);
    bool _717 = _713 || _715;
    float _719 = in.m_47.x;
    float _721 = in.m_47.y;
    float _723 = in.m_47.z;
    float _725 = exp2(_705);
    bool _727 = _677 > 0.0;
    bool _729 = _677 >= 0.0;
    bool _731 = isnan(_677);
    bool _733 = _729 || _731;
    bool _735 = isnan(0.0);
    bool _737 = _733 || _735;
    bool _739 = !_685;
    int _741 = _739 ? 0 : 1;
    bool _743 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(1.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _755 = 1.0 + _753;
    bool _757 = !_681;
    int _759 = _757 ? 0 : 1;
    int _761 = abs(_741);
    float _763 = 1.0 / _755;
    int _765 = _717 ? 0 : 1;
    int _767 = abs(_759);
    float _769 = -_725;
    float _771 = _769 + 1.0;
    float _773 = float(_761);
    float _775 = float(_703);
    int _777 = ~_765;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    int _783 = _781;
    if (!_707)
    {
        int _785 = ~_765;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = _773 * _775;
    bool _793 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _795 = isnan(0.0);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _801 = _797 || _799;
    float _803 = _791 * (-2.0);
    float _805 = float(_767);
    float _807 = float(_789);
    float _809 = _801 ? _771 : 0.0;
    int _811 = _737 ? 0 : 1;
    float _813 = _805 * _807;
    float _815 = fma(_675, _803, _675);
    float _817 = fma(_803, _721, _721);
    if (_751)
    {
        float _819 = _809 * _763;
        _111 = _819;
    }
    float _821 = _111;
    float _823 = _201 + _645;
    int _825 = ~_811;
    int _827 = _825 + 1;
    int _829 = _827 + 1;
    float _831 = _645 + (-0.5);
    bool _833 = !_689;
    int _835 = _833 ? 0 : 1;
    float _837 = _823 + (-1.0);
    int _839 = _829;
    if (!_727)
    {
        int _841 = ~_811;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[196].y, _817);
    float _849 = _813 * (-2.0);
    int _851 = abs(_835);
    float _853 = fma(_815, _821, _847);
    float _855 = as_type<float>(int(gl_VertexIndex));
    float _857 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _859 = float(_851);
    float _861 = _853 * 0.15915493667125701904296875;
    float _863 = float(_845);
    float _865 = fma(_857, _849, _857);
    float _867 = fma(_849, _719, _719);
    float _869 = _201 + (-0.5);
    float _871 = _859 * _863;
    float _873 = _201 + _637;
    float _875 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[196].x, _867);
    bool _877 = _201 > 0.5;
    float _879 = _871 * (-2.0);
    float _881 = _873 + (-1.0);
    float _883 = fma(_865, _821, _875);
    float _885 = in.m_45.x;
    float _887 = in.m_45.y;
    float _889 = fma(_879, _723, _723);
    float _891 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _893 = _637 + (-0.5);
    float _895 = _883 * 0.15915493667125701904296875;
    float _897 = _861 * 6.283185482025146484375;
    float _899 = sin(_897);
    float _901 = fma(_891, _879, _891);
    float _903 = fma(_893, (*spvDescriptorSet0.vp_c9)._m0[196].z, _889);
    float _905 = _497 * _143;
    int _907 = as_type<int>(_855) & 1;
    bool _909 = _907 != 0;
    int _911 = as_type<int>(_855) & 2;
    bool _913 = _911 != 0;
    float _915 = in.m_39.w;
    float _917 = fma(_901, _821, _903);
    float _919 = _497 * _161;
    float _921 = _895 * 6.283185482025146484375;
    float _923 = sin(_921);
    float _925 = fma(_495, _141, _905);
    float _927 = _917 * 0.15915493667125701904296875;
    float _929 = fma(_495, _131, _647);
    float _931 = fma(_495, _159, _919);
    bool _933 = !_909;
    float _935 = _933 ? (-0.5) : 0.5;
    float _937 = fma(_503, _145, _925);
    bool _939 = !_913;
    float _941 = _939 ? (-0.5) : 0.5;
    float _943 = _895 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = in.m_41.w;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _935);
    float _951 = _605 * _885;
    float _953 = _607 * _887;
    float _955 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _941);
    float _957 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _959 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _927 * 6.283185482025146484375;
    float _963 = cos(_961);
    float _965 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _967 = fma(_503, _163, _931);
    float _969 = _959 * _949;
    float _971 = _923 * _899;
    float _973 = _965 * _955;
    float _975 = _937 + _915;
    bool _977 = _645 > 0.5;
    float _979 = _861 * 6.283185482025146484375;
    float _981 = cos(_979);
    float _983 = _945 * _899;
    float _985 = fma(_503, _135, _929);
    float _987 = _927 * 6.283185482025146484375;
    float _989 = sin(_987);
    float _991 = _899 * _963;
    float _993 = _963 * _957;
    float _995 = _967 + _947;
    float _997 = _945 * _993;
    float _999 = _945 * _981;
    float _1001 = _981 * _963;
    float _1003 = _923 * _981;
    float _1005 = _923 * _993;
    float _1007 = fma(_989, _999, _971);
    float _1009 = -_983;
    float _1011 = fma(_989, _1003, _1009);
    float _1013 = _989 * _957;
    float _1015 = -_1003;
    float _1017 = fma(_989, _983, _1015);
    float _1019 = fma(_1007, _969, _997);
    float _1021 = fma(_989, _971, _999);
    float _1023 = -_1013;
    float _1025 = fma(_1001, _969, _1023);
    float _1027 = fma(_1011, _969, _1005);
    float _1029 = -_973;
    float _1031 = fma(_1017, _1029, _1019);
    float _1033 = -_973;
    float _1035 = fma(_991, _1033, _1025);
    float _1037 = -_973;
    float _1039 = fma(_1021, _1037, _1027);
    float _1041 = _1031 * _419;
    float _1043 = _1031 * _411;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1049 = fma(_1035, _375, _1041);
    float _1051 = fma(_1035, _367, _1043);
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1057 = fma(_1039, _401, _1049);
    float _1059 = fma(_1039, _385, _1051);
    float _1061 = 1.0 / _1055;
    float _1063 = _995 + _1057;
    float _1065 = _975 + _1059;
    int _1067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1069 = _1067 != 0;
    float _1071 = in.m_37.w;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1075 = _1073 != 0;
    float _1077 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1079 = _1063 + _1077;
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1083 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1081;
    float _1085 = 1.0 / _1047;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1089 = _1065 + _1087;
    float _1091 = _1079 * _1079;
    bool _1093 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1095 = isnan(_635);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1101 = _1097 || _1099;
    float _1103 = float(_1101);
    float _1105 = _1031 * _415;
    bool _1107 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1109 = isnan(_635);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = fma(_1089, _1089, _1091);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1123 = _635 + _1121;
    float _1125 = _1083 * _1061;
    float _1127 = sqrt(_1119);
    float _1129 = -_1103;
    float _1131 = _1129 + 1.0;
    float _1133 = fma(_1125, _1123, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1135 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_635);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = _1117 * _1131;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1151 = _1149 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1153 = -_1117;
    float _1155 = _1153 + 1.0;
    float _1157 = fma(_1035, _371, _1105);
    float _1159 = _1133 * _1147;
    float _1161 = -_1145;
    float _1163 = _1161 + 1.0;
    float _1165 = _1151 * _1085;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1169 = _635 + _1167;
    float _1171 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1159);
    float _1173 = _985 + _1071;
    float _1175 = fma(_1039, _393, _1157);
    bool _1177 = _1127 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1103 * _1163;
    float _1181 = fma(_1165, _1169, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1183 = -_935;
    float _1185 = _877 ? _1183 : _935;
    float _1187 = _1173 + _1175;
    float _1189 = -_941;
    float _1191 = _977 ? _1189 : _941;
    float _1193 = fma(_1181, _1179, _1171);
    bool _1195 = !_1069;
    float _1197 = _1195 ? _935 : _1185;
    bool _1199 = !_1075;
    float _1201 = _1199 ? _941 : _1191;
    float _1203 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1193);
    float _1205 = _1185;
    float _1207 = _1031;
    float _1209 = _1191;
    if (!_1177)
    {
        _1205 = _1065;
    }
    float _1211 = _1205;
    float _1213 = _1211;
    if (!_1177)
    {
        _1207 = _1063;
    }
    float _1215 = _1207;
    float _1217 = _1215;
    if (!_1177)
    {
        _1209 = _1187;
    }
    float _1219 = _1209;
    bool _1221 = !_1177;
    float _1223 = _1219;
    if (!_1221)
    {
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1229 = _1127 + _1227;
        float _1231 = _1187 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1233 = rsqrt(_1119);
        float _1235 = _1229 * _1225;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1237 * 6.283185482025146484375;
        float _1241 = cos(_1239);
        float _1243 = _1237 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 + (-1.0);
        float _1249 = fma(_1245, _1231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1251 = _1247 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1253 = _1233 * _1249;
        float _1255 = fma(_1187, _1241, _1251);
        float _1257 = fma(_1089, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1079, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1223 = _1255;
        _1213 = _1257;
        _1217 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1213;
    float _1265 = _1217;
    float _1267 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1269 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1273 = _1261 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1267);
    float _1277 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1269);
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1281 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1271);
    float _1283 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1275);
    float _1285 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1287 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1277);
    float _1289 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1281);
    float _1291 = _1283 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1293 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1297 = -_1201;
    float _1299 = _1297 + 0.5;
    float _1301 = _1287 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1303 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1305 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1307 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1309 = _1291 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1311 = _1197 + 0.5;
    float _1313 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1303);
    float _1317 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1305);
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1307);
    float _1321 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1309);
    float _1323 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1327 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1315);
    float _1329 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1317);
    float _1331 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1319);
    float _1333 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = _1323 * _1279;
    float _1337 = _1325 * _1295;
    float _1339 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1341 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1349 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1355 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1357 = _1341 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1363 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1367 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1369 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1203 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1375 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1327);
    float _1377 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1331);
    float _1379 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    out.m_33.x = _1357;
    out.m_52.x = _1367;
    out.m_52.y = _1369;
    out.m_52.z = _1371;
    out.m_52.w = _1359;
    out.m_54.x = _1335;
    out.m_54.y = _1337;
    out.m_56.x = _1361;
    out.m_56.y = _1363;
    out.m_56.z = _1365;
    out.m_56.w = _1373;
    out.gl_Position.x = _1375;
    out.gl_Position.y = _1353;
    out.gl_Position.z = _1377;
    out.gl_Position.w = _1379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

