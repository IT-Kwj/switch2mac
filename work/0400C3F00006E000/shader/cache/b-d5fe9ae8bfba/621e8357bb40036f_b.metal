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
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(1)]];
    float4 m_33 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_26 [[attribute(5)]];
    float4 m_31 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_46 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1134 = as_type<float>(_85);
        out.gl_Position.z = _1134;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1204 = as_type<float>(_123);
        out.gl_Position.z = _1204;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_33.x;
    float _127 = in.m_33.y;
    float _129 = in.m_33.z;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = in.m_37.x;
    float _139 = in.m_37.y;
    float _141 = in.m_37.z;
    float _143 = _125 * _125;
    float _145 = _127 * _127;
    float _147 = _129 * _129;
    float _149 = fma(_131, _131, _143);
    float _151 = fma(_133, _133, _145);
    float _153 = fma(_135, _135, _147);
    float _155 = fma(_137, _137, _149);
    float _157 = fma(_139, _139, _151);
    float _159 = fma(_141, _141, _153);
    float _161 = sqrt(_155);
    float _163 = sqrt(_157);
    float _165 = sqrt(_159);
    bool _167 = _161 > 0.0;
    bool _169 = _163 > 0.0;
    float _171 = _163;
    float _173 = _159;
    if (_167)
    {
        float _175 = rsqrt(_155);
        _171 = _175;
    }
    float _177 = _171;
    float _179 = 0.0;
    float _181 = 0.0;
    if (!_167)
    {
        _179 = 0.0;
        _181 = 0.0;
    }
    float _183 = _179;
    float _185 = _181;
    bool _187 = _165 > 0.0;
    float _189 = 0.0;
    float _191 = _165;
    float _193 = _185;
    float _195 = _183;
    if (!_167)
    {
        _189 = 0.0;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_169)
    {
        _191 = 0.0;
    }
    float _201 = _191;
    float _203 = _161;
    float _205 = _201;
    if (_169)
    {
        float _207 = rsqrt(_157);
        _203 = _207;
    }
    float _209 = _203;
    float _211 = 0.0;
    if (!_169)
    {
        _211 = 0.0;
    }
    float _213 = _211;
    float _215 = 0.0;
    float _217 = _213;
    if (!_187)
    {
        _215 = 0.0;
    }
    float _219 = _215;
    float _221 = 0.0;
    float _223 = _219;
    if (_187)
    {
        float _225 = rsqrt(_159);
        _221 = _225;
    }
    float _227 = _221;
    float _229 = _177;
    if (_167)
    {
        float _231 = _177 * _131;
        _193 = _231;
    }
    float _233 = _193;
    if (_167)
    {
        float _235 = _177 * _125;
        _195 = _235;
    }
    float _237 = _195;
    if (_167)
    {
        float _239 = _177 * _137;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_169)
    {
        _229 = 0.0;
    }
    float _245 = _229;
    float _247 = 0.0;
    float _249 = _245;
    if (!_187)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (_169)
    {
        float _255 = _209 * _133;
        _205 = _255;
    }
    float _257 = _205;
    if (!_187)
    {
        _173 = 0.0;
    }
    float _259 = _173;
    float _261 = _259;
    if (_169)
    {
        float _263 = _209 * _127;
        _217 = _263;
    }
    float _265 = _217;
    if (_169)
    {
        float _267 = _209 * _139;
        _249 = _267;
    }
    float _269 = _249;
    if (_187)
    {
        float _271 = _227 * _135;
        _223 = _271;
    }
    float _273 = _223;
    if (_187)
    {
        float _275 = _227 * _129;
        _253 = _275;
    }
    float _277 = _253;
    if (_187)
    {
        float _279 = _227 * _141;
        _261 = _279;
    }
    float _281 = _261;
    bool _283 = !_243;
    float _301;
    if (!_283)
    {
        float _285 = in.m_39.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_69);
        float _307 = 1.0 / _305;
        float _309 = _103 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_39.x;
    float _315 = in.m_39.y;
    float _317 = in.m_39.z;
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _311 + _323;
    float _327 = in.m_26.x;
    float _329 = in.m_26.y;
    float _331 = in.m_26.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _311 + _333;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _339 = _337 != 0;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _347 = _345 != 0;
    float _349 = as_type<float>(int(gl_VertexIndex));
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _353;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = _321 * _103;
    bool _367 = !_339;
    int _369 = _367 ? 0 : 1;
    float _371 = 1.0 / _357;
    float _373 = _317 * 2.0;
    float _375 = _317 + _313;
    int _377 = abs(_369);
    float _379 = _133 * _329;
    float _381 = _127 * _329;
    float _383 = exp2(_365);
    float _385 = _139 * _329;
    float _387 = fma(_131, _327, _379);
    float _389 = fma(_125, _327, _381);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = fma(_137, _327, _385);
    float _397 = _315 + _317;
    float _399 = floor(_373);
    float _401 = _317 + (-0.5);
    float _403 = _315 + _313;
    float _405 = _313 + (-0.5);
    float _407 = _313 * 2.0;
    int _409 = as_type<int>(_349) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_349) & 2;
    bool _415 = _413 != 0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _419 = 1.0 + _417;
    float _421 = _315 * 2.0;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    bool _427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _429 = isnan(1.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _435 = _431 || _433;
    float _437 = _315 + (-0.5);
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _419;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _453 = _311 + _451;
    float _455 = _375 + (-1.0);
    float _457 = _447 ? _425 : 0.0;
    float _459 = fma(_135, _331, _387);
    bool _461 = _399 >= 0.0;
    bool _463 = isnan(_399);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _453 * _371;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _311 + _473;
    float _477 = floor(_421);
    int _479 = _469 ? 0 : 1;
    float _481 = _403 + (-1.0);
    bool _483 = _399 > 0.0;
    float _485 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _487 = _335 * _359;
    float _489 = _397 + (-1.0);
    float _491 = 1.0 / _393;
    if (_435)
    {
        float _493 = _457 * _449;
        _105 = _493;
    }
    float _495 = _105;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    bool _503 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_311);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_129, _331, _389);
    float _517 = fma(_141, _331, _395);
    float _519 = in.m_37.w;
    float _521 = floor(_407);
    float _523 = -_513;
    float _525 = _523 + 1.0;
    bool _527 = _477 >= 0.0;
    bool _529 = isnan(_477);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = _477 > 0.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _539;
    float _543 = 1.0 / _363;
    float _545 = _325 * _491;
    int _547 = ~_479;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    int _553 = _551;
    if (!_483)
    {
        int _555 = ~_479;
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    int _561 = _535 ? 0 : 1;
    bool _563 = _521 > 0.0;
    float _565 = 1.0 / _541;
    bool _567 = _521 >= 0.0;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _517 + _519;
    float _579 = _475 * _543;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _593 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _595 = isnan(_311);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_583, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_587, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _609 = fma(_591, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _611 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _613 = isnan(_311);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = -_603;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _631 = _311 + _629;
    float _633 = fma(_501, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _635 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_311);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _621 * _627;
    float _649 = _631 * _565;
    float _651 = -_621;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    bool _659 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_311);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_645;
    float _677 = _675 + 1.0;
    float _679 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _681 = _645 * _653;
    float _683 = fma(_673, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _669 * _677;
    float _687 = -_669;
    float _689 = _687 + 1.0;
    bool _691 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_311);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = in.m_44.x;
    float _705 = in.m_44.y;
    float _707 = in.m_44.z;
    float _709 = _513 * _689;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = float(_559);
    float _721 = _701 * _525;
    float _723 = fma(_713, _545, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _725 = fma(_717, _545, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = float(_377);
    float _729 = _605 * _721;
    bool _731 = !_347;
    int _733 = _731 ? 0 : 1;
    float _735 = _633 * _721;
    int _737 = ~_561;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _727 * _719;
    int _745 = abs(_733);
    int _747 = _741;
    if (!_537)
    {
        int _749 = ~_561;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _743 * (-2.0);
    float _757 = float(_745);
    float _759 = float(_753);
    int _761 = _575 ? 0 : 1;
    float _763 = fma(_755, _703, _703);
    bool _765 = !_343;
    int _767 = _765 ? 0 : 1;
    float _769 = _757 * _759;
    int _771 = ~_761;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    int _779 = abs(_767);
    float _781 = _769 * (-2.0);
    int _783 = _775;
    if (!_563)
    {
        int _785 = ~_761;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = fma(_497, _755, _497);
    float _793 = float(_779);
    float _795 = fma(_781, _707, _707);
    float _797 = float(_789);
    float _799 = fma(_485, _781, _485);
    float _801 = -_701;
    float _803 = _801 + 1.0;
    float _805 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].z, _795);
    float _807 = _793 * _797;
    float _809 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _811 = fma(_799, _495, _805);
    float _813 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _815 = _807 * (-2.0);
    float _817 = fma(_607, _709, _809);
    float _819 = _811 * 0.15915493667125701904296875;
    float _821 = fma(_609, _709, _813);
    float _823 = fma(_815, _705, _705);
    float _825 = in.m_46.x;
    float _827 = in.m_46.y;
    float _829 = fma(_791, _495, _777);
    float _831 = fma(_623, _815, _623);
    float _833 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _835;
    float _839 = fma(_679, _685, _817);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _841;
    float _845 = _829 * 0.15915493667125701904296875;
    float _847 = fma(_683, _685, _821);
    float _849 = fma(_831, _495, _833);
    float _851 = fma(_837, _649, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _853 = fma(_843, _649, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _855 = fma(_723, _681, _839);
    float _857 = _845 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _849 * 0.15915493667125701904296875;
    float _863 = fma(_725, _681, _847);
    float _865 = fma(_851, _647, _855);
    float _867 = in.m_35.w;
    float _869 = fma(_853, _647, _863);
    float _871 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].x, _865);
    float _873 = _845 * 6.283185482025146484375;
    float _875 = cos(_873);
    bool _877 = !_411;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].y, _869);
    bool _883 = !_415;
    float _885 = _883 ? (-0.5) : 0.5;
    float _887 = _871 * _825;
    float _889 = _881 * _827;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _893 = _819 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _901 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = in.m_33.w;
    float _905 = _899 * _891;
    float _907 = _901 * _897;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _459 + _867;
    float _915 = _861 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _859 * _895;
    float _921 = _875 * _895;
    float _923 = _861 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _875 * _911;
    float _929 = _859 * _911;
    float _931 = _515 + _903;
    float _933 = fma(_917, _919, _927);
    float _935 = _933 * _907;
    float _937 = -_921;
    float _939 = fma(_917, _929, _937);
    float _941 = -_929;
    float _943 = fma(_917, _921, _941);
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = _925 * _905;
    float _949 = _939 * _907;
    float _951 = _917 * _905;
    float _953 = fma(_917, _927, _919);
    float _955 = fma(_895, _947, _935);
    float _957 = _859 * _925;
    float _959 = fma(_911, _947, _949);
    float _961 = _875 * _925;
    float _963 = fma(_943, _945, _955);
    float _965 = -_951;
    float _967 = fma(_957, _907, _965);
    float _969 = fma(_953, _945, _959);
    float _971 = _963 * _265;
    float _973 = fma(_961, _945, _967);
    float _975 = _963 * _257;
    float _977 = _963 * _269;
    float _979 = fma(_969, _237, _971);
    float _981 = fma(_969, _233, _975);
    float _983 = fma(_969, _241, _977);
    float _985 = fma(_973, _277, _979);
    float _987 = fma(_973, _273, _981);
    float _989 = fma(_973, _281, _983);
    float _991 = _931 + _985;
    float _993 = _913 + _987;
    float _995 = _577 + _989;
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = _991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _997);
    float _1007 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _999);
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1011);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1033);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1041);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1045);
    float _1055 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    float _1059 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1057 + _1059;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_48.x = _1073;
    out.m_48.y = _1067;
    out.m_48.z = _1075;
    out.m_48.w = _1063;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _1059;
    out.m_50.z = _1077;
    out.m_50.w = _1059;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1134 = as_type<float>(_85);
        out.gl_Position.z = _1134;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1204 = as_type<float>(_123);
        out.gl_Position.z = _1204;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_33.x;
    float _127 = in.m_33.y;
    float _129 = in.m_33.z;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = in.m_37.x;
    float _139 = in.m_37.y;
    float _141 = in.m_37.z;
    float _143 = _125 * _125;
    float _145 = _127 * _127;
    float _147 = _129 * _129;
    float _149 = fma(_131, _131, _143);
    float _151 = fma(_133, _133, _145);
    float _153 = fma(_135, _135, _147);
    float _155 = fma(_137, _137, _149);
    float _157 = fma(_139, _139, _151);
    float _159 = fma(_141, _141, _153);
    float _161 = sqrt(_155);
    float _163 = sqrt(_157);
    float _165 = sqrt(_159);
    bool _167 = _161 > 0.0;
    bool _169 = _163 > 0.0;
    float _171 = _163;
    float _173 = _159;
    if (_167)
    {
        float _175 = rsqrt(_155);
        _171 = _175;
    }
    float _177 = _171;
    float _179 = 0.0;
    float _181 = 0.0;
    if (!_167)
    {
        _179 = 0.0;
        _181 = 0.0;
    }
    float _183 = _179;
    float _185 = _181;
    bool _187 = _165 > 0.0;
    float _189 = 0.0;
    float _191 = _165;
    float _193 = _185;
    float _195 = _183;
    if (!_167)
    {
        _189 = 0.0;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_169)
    {
        _191 = 0.0;
    }
    float _201 = _191;
    float _203 = _161;
    float _205 = _201;
    if (_169)
    {
        float _207 = rsqrt(_157);
        _203 = _207;
    }
    float _209 = _203;
    float _211 = 0.0;
    if (!_169)
    {
        _211 = 0.0;
    }
    float _213 = _211;
    float _215 = 0.0;
    float _217 = _213;
    if (!_187)
    {
        _215 = 0.0;
    }
    float _219 = _215;
    float _221 = 0.0;
    float _223 = _219;
    if (_187)
    {
        float _225 = rsqrt(_159);
        _221 = _225;
    }
    float _227 = _221;
    float _229 = _177;
    if (_167)
    {
        float _231 = _177 * _131;
        _193 = _231;
    }
    float _233 = _193;
    if (_167)
    {
        float _235 = _177 * _125;
        _195 = _235;
    }
    float _237 = _195;
    if (_167)
    {
        float _239 = _177 * _137;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_169)
    {
        _229 = 0.0;
    }
    float _245 = _229;
    float _247 = 0.0;
    float _249 = _245;
    if (!_187)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (_169)
    {
        float _255 = _209 * _133;
        _205 = _255;
    }
    float _257 = _205;
    if (!_187)
    {
        _173 = 0.0;
    }
    float _259 = _173;
    float _261 = _259;
    if (_169)
    {
        float _263 = _209 * _127;
        _217 = _263;
    }
    float _265 = _217;
    if (_169)
    {
        float _267 = _209 * _139;
        _249 = _267;
    }
    float _269 = _249;
    if (_187)
    {
        float _271 = _227 * _135;
        _223 = _271;
    }
    float _273 = _223;
    if (_187)
    {
        float _275 = _227 * _129;
        _253 = _275;
    }
    float _277 = _253;
    if (_187)
    {
        float _279 = _227 * _141;
        _261 = _279;
    }
    float _281 = _261;
    bool _283 = !_243;
    float _301;
    if (!_283)
    {
        float _285 = in.m_39.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_69);
        float _307 = 1.0 / _305;
        float _309 = _103 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_39.x;
    float _315 = in.m_39.y;
    float _317 = in.m_39.z;
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _311 + _323;
    float _327 = in.m_26.x;
    float _329 = in.m_26.y;
    float _331 = in.m_26.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _311 + _333;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _339 = _337 != 0;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _347 = _345 != 0;
    float _349 = as_type<float>(int(gl_VertexIndex));
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _353;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = _321 * _103;
    bool _367 = !_339;
    int _369 = _367 ? 0 : 1;
    float _371 = 1.0 / _357;
    float _373 = _317 * 2.0;
    float _375 = _317 + _313;
    int _377 = abs(_369);
    float _379 = _133 * _329;
    float _381 = _127 * _329;
    float _383 = exp2(_365);
    float _385 = _139 * _329;
    float _387 = fma(_131, _327, _379);
    float _389 = fma(_125, _327, _381);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = fma(_137, _327, _385);
    float _397 = _315 + _317;
    float _399 = floor(_373);
    float _401 = _317 + (-0.5);
    float _403 = _315 + _313;
    float _405 = _313 + (-0.5);
    float _407 = _313 * 2.0;
    int _409 = as_type<int>(_349) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_349) & 2;
    bool _415 = _413 != 0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _419 = 1.0 + _417;
    float _421 = _315 * 2.0;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    bool _427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _429 = isnan(1.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _435 = _431 || _433;
    float _437 = _315 + (-0.5);
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _419;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _453 = _311 + _451;
    float _455 = _375 + (-1.0);
    float _457 = _447 ? _425 : 0.0;
    float _459 = fma(_135, _331, _387);
    bool _461 = _399 >= 0.0;
    bool _463 = isnan(_399);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _453 * _371;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _311 + _473;
    float _477 = floor(_421);
    int _479 = _469 ? 0 : 1;
    float _481 = _403 + (-1.0);
    bool _483 = _399 > 0.0;
    float _485 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _487 = _335 * _359;
    float _489 = _397 + (-1.0);
    float _491 = 1.0 / _393;
    if (_435)
    {
        float _493 = _457 * _449;
        _105 = _493;
    }
    float _495 = _105;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    bool _503 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_311);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_129, _331, _389);
    float _517 = fma(_141, _331, _395);
    float _519 = in.m_37.w;
    float _521 = floor(_407);
    float _523 = -_513;
    float _525 = _523 + 1.0;
    bool _527 = _477 >= 0.0;
    bool _529 = isnan(_477);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = _477 > 0.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _539;
    float _543 = 1.0 / _363;
    float _545 = _325 * _491;
    int _547 = ~_479;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    int _553 = _551;
    if (!_483)
    {
        int _555 = ~_479;
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    int _561 = _535 ? 0 : 1;
    bool _563 = _521 > 0.0;
    float _565 = 1.0 / _541;
    bool _567 = _521 >= 0.0;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _517 + _519;
    float _579 = _475 * _543;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _593 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _595 = isnan(_311);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_583, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_587, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _609 = fma(_591, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _611 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _613 = isnan(_311);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = -_603;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _631 = _311 + _629;
    float _633 = fma(_501, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _635 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_311);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _621 * _627;
    float _649 = _631 * _565;
    float _651 = -_621;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    bool _659 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_311);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_645;
    float _677 = _675 + 1.0;
    float _679 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _681 = _645 * _653;
    float _683 = fma(_673, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _669 * _677;
    float _687 = -_669;
    float _689 = _687 + 1.0;
    bool _691 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_311);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = in.m_44.x;
    float _705 = in.m_44.y;
    float _707 = in.m_44.z;
    float _709 = _513 * _689;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = float(_559);
    float _721 = _701 * _525;
    float _723 = fma(_713, _545, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _725 = fma(_717, _545, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = float(_377);
    float _729 = _605 * _721;
    bool _731 = !_347;
    int _733 = _731 ? 0 : 1;
    float _735 = _633 * _721;
    int _737 = ~_561;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _727 * _719;
    int _745 = abs(_733);
    int _747 = _741;
    if (!_537)
    {
        int _749 = ~_561;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _743 * (-2.0);
    float _757 = float(_745);
    float _759 = float(_753);
    int _761 = _575 ? 0 : 1;
    float _763 = fma(_755, _703, _703);
    bool _765 = !_343;
    int _767 = _765 ? 0 : 1;
    float _769 = _757 * _759;
    int _771 = ~_761;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    int _779 = abs(_767);
    float _781 = _769 * (-2.0);
    int _783 = _775;
    if (!_563)
    {
        int _785 = ~_761;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = fma(_497, _755, _497);
    float _793 = float(_779);
    float _795 = fma(_781, _707, _707);
    float _797 = float(_789);
    float _799 = fma(_485, _781, _485);
    float _801 = -_701;
    float _803 = _801 + 1.0;
    float _805 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].z, _795);
    float _807 = _793 * _797;
    float _809 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _811 = fma(_799, _495, _805);
    float _813 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _815 = _807 * (-2.0);
    float _817 = fma(_607, _709, _809);
    float _819 = _811 * 0.15915493667125701904296875;
    float _821 = fma(_609, _709, _813);
    float _823 = fma(_815, _705, _705);
    float _825 = in.m_46.x;
    float _827 = in.m_46.y;
    float _829 = fma(_791, _495, _777);
    float _831 = fma(_623, _815, _623);
    float _833 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _835;
    float _839 = fma(_679, _685, _817);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _841;
    float _845 = _829 * 0.15915493667125701904296875;
    float _847 = fma(_683, _685, _821);
    float _849 = fma(_831, _495, _833);
    float _851 = fma(_837, _649, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _853 = fma(_843, _649, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _855 = fma(_723, _681, _839);
    float _857 = _845 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _849 * 0.15915493667125701904296875;
    float _863 = fma(_725, _681, _847);
    float _865 = fma(_851, _647, _855);
    float _867 = in.m_35.w;
    float _869 = fma(_853, _647, _863);
    float _871 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].x, _865);
    float _873 = _845 * 6.283185482025146484375;
    float _875 = cos(_873);
    bool _877 = !_411;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].y, _869);
    bool _883 = !_415;
    float _885 = _883 ? (-0.5) : 0.5;
    float _887 = _871 * _825;
    float _889 = _881 * _827;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _893 = _819 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _901 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = in.m_33.w;
    float _905 = _899 * _891;
    float _907 = _901 * _897;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _459 + _867;
    float _915 = _861 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _859 * _895;
    float _921 = _875 * _895;
    float _923 = _861 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _875 * _911;
    float _929 = _859 * _911;
    float _931 = _515 + _903;
    float _933 = fma(_917, _919, _927);
    float _935 = _933 * _907;
    float _937 = -_921;
    float _939 = fma(_917, _929, _937);
    float _941 = -_929;
    float _943 = fma(_917, _921, _941);
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = _925 * _905;
    float _949 = _939 * _907;
    float _951 = _917 * _905;
    float _953 = fma(_917, _927, _919);
    float _955 = fma(_895, _947, _935);
    float _957 = _859 * _925;
    float _959 = fma(_911, _947, _949);
    float _961 = _875 * _925;
    float _963 = fma(_943, _945, _955);
    float _965 = -_951;
    float _967 = fma(_957, _907, _965);
    float _969 = fma(_953, _945, _959);
    float _971 = _963 * _265;
    float _973 = fma(_961, _945, _967);
    float _975 = _963 * _257;
    float _977 = _963 * _269;
    float _979 = fma(_969, _237, _971);
    float _981 = fma(_969, _233, _975);
    float _983 = fma(_969, _241, _977);
    float _985 = fma(_973, _277, _979);
    float _987 = fma(_973, _273, _981);
    float _989 = fma(_973, _281, _983);
    float _991 = _931 + _985;
    float _993 = _913 + _987;
    float _995 = _577 + _989;
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = _991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _997);
    float _1007 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _999);
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1011);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1033);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1041);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1045);
    float _1055 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    float _1059 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1057 + _1059;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_48.x = _1073;
    out.m_48.y = _1067;
    out.m_48.z = _1075;
    out.m_48.w = _1063;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _1059;
    out.m_50.z = _1077;
    out.m_50.w = _1059;
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
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_26.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_29.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1134 = as_type<float>(_85);
        out.gl_Position.z = _1134;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_31.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = _103;
    if (_99)
    {
        float _107 = float(_69);
        _79 = _107;
    }
    float _109 = _79;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_29.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _87 = as_type<int>(_121);
    }
    int _123 = _87;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1204 = as_type<float>(_123);
        out.gl_Position.z = _1204;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_33.x;
    float _127 = in.m_33.y;
    float _129 = in.m_33.z;
    float _131 = in.m_35.x;
    float _133 = in.m_35.y;
    float _135 = in.m_35.z;
    float _137 = in.m_37.x;
    float _139 = in.m_37.y;
    float _141 = in.m_37.z;
    float _143 = _125 * _125;
    float _145 = _127 * _127;
    float _147 = _129 * _129;
    float _149 = fma(_131, _131, _143);
    float _151 = fma(_133, _133, _145);
    float _153 = fma(_135, _135, _147);
    float _155 = fma(_137, _137, _149);
    float _157 = fma(_139, _139, _151);
    float _159 = fma(_141, _141, _153);
    float _161 = sqrt(_155);
    float _163 = sqrt(_157);
    float _165 = sqrt(_159);
    bool _167 = _161 > 0.0;
    bool _169 = _163 > 0.0;
    float _171 = _163;
    float _173 = _159;
    if (_167)
    {
        float _175 = rsqrt(_155);
        _171 = _175;
    }
    float _177 = _171;
    float _179 = 0.0;
    float _181 = 0.0;
    if (!_167)
    {
        _179 = 0.0;
        _181 = 0.0;
    }
    float _183 = _179;
    float _185 = _181;
    bool _187 = _165 > 0.0;
    float _189 = 0.0;
    float _191 = _165;
    float _193 = _185;
    float _195 = _183;
    if (!_167)
    {
        _189 = 0.0;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_169)
    {
        _191 = 0.0;
    }
    float _201 = _191;
    float _203 = _161;
    float _205 = _201;
    if (_169)
    {
        float _207 = rsqrt(_157);
        _203 = _207;
    }
    float _209 = _203;
    float _211 = 0.0;
    if (!_169)
    {
        _211 = 0.0;
    }
    float _213 = _211;
    float _215 = 0.0;
    float _217 = _213;
    if (!_187)
    {
        _215 = 0.0;
    }
    float _219 = _215;
    float _221 = 0.0;
    float _223 = _219;
    if (_187)
    {
        float _225 = rsqrt(_159);
        _221 = _225;
    }
    float _227 = _221;
    float _229 = _177;
    if (_167)
    {
        float _231 = _177 * _131;
        _193 = _231;
    }
    float _233 = _193;
    if (_167)
    {
        float _235 = _177 * _125;
        _195 = _235;
    }
    float _237 = _195;
    if (_167)
    {
        float _239 = _177 * _137;
        _199 = _239;
    }
    float _241 = _199;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_169)
    {
        _229 = 0.0;
    }
    float _245 = _229;
    float _247 = 0.0;
    float _249 = _245;
    if (!_187)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (_169)
    {
        float _255 = _209 * _133;
        _205 = _255;
    }
    float _257 = _205;
    if (!_187)
    {
        _173 = 0.0;
    }
    float _259 = _173;
    float _261 = _259;
    if (_169)
    {
        float _263 = _209 * _127;
        _217 = _263;
    }
    float _265 = _217;
    if (_169)
    {
        float _267 = _209 * _139;
        _249 = _267;
    }
    float _269 = _249;
    if (_187)
    {
        float _271 = _227 * _135;
        _223 = _271;
    }
    float _273 = _223;
    if (_187)
    {
        float _275 = _227 * _129;
        _253 = _275;
    }
    float _277 = _253;
    if (_187)
    {
        float _279 = _227 * _141;
        _261 = _279;
    }
    float _281 = _261;
    bool _283 = !_243;
    float _301;
    if (!_283)
    {
        float _285 = in.m_39.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_69);
        float _307 = 1.0 / _305;
        float _309 = _103 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = in.m_39.x;
    float _315 = in.m_39.y;
    float _317 = in.m_39.z;
    float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _321 = log2(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _311 + _323;
    float _327 = in.m_26.x;
    float _329 = in.m_26.y;
    float _331 = in.m_26.z;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = _311 + _333;
    int _337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _339 = _337 != 0;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _343 = _341 != 0;
    int _345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _347 = _345 != 0;
    float _349 = as_type<float>(int(gl_VertexIndex));
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = 1.0 / _353;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = _321 * _103;
    bool _367 = !_339;
    int _369 = _367 ? 0 : 1;
    float _371 = 1.0 / _357;
    float _373 = _317 * 2.0;
    float _375 = _317 + _313;
    int _377 = abs(_369);
    float _379 = _133 * _329;
    float _381 = _127 * _329;
    float _383 = exp2(_365);
    float _385 = _139 * _329;
    float _387 = fma(_131, _327, _379);
    float _389 = fma(_125, _327, _381);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _395 = fma(_137, _327, _385);
    float _397 = _315 + _317;
    float _399 = floor(_373);
    float _401 = _317 + (-0.5);
    float _403 = _315 + _313;
    float _405 = _313 + (-0.5);
    float _407 = _313 * 2.0;
    int _409 = as_type<int>(_349) & 1;
    bool _411 = _409 != 0;
    int _413 = as_type<int>(_349) & 2;
    bool _415 = _413 != 0;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _419 = 1.0 + _417;
    float _421 = _315 * 2.0;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    bool _427 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _429 = isnan(1.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _435 = _431 || _433;
    float _437 = _315 + (-0.5);
    bool _439 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _447 = _443 || _445;
    float _449 = 1.0 / _419;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _453 = _311 + _451;
    float _455 = _375 + (-1.0);
    float _457 = _447 ? _425 : 0.0;
    float _459 = fma(_135, _331, _387);
    bool _461 = _399 >= 0.0;
    bool _463 = isnan(_399);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = _453 * _371;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _475 = _311 + _473;
    float _477 = floor(_421);
    int _479 = _469 ? 0 : 1;
    float _481 = _403 + (-1.0);
    bool _483 = _399 > 0.0;
    float _485 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _487 = _335 * _359;
    float _489 = _397 + (-1.0);
    float _491 = 1.0 / _393;
    if (_435)
    {
        float _493 = _457 * _449;
        _105 = _493;
    }
    float _495 = _105;
    float _497 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _499;
    bool _503 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _505 = isnan(_311);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = fma(_129, _331, _389);
    float _517 = fma(_141, _331, _395);
    float _519 = in.m_37.w;
    float _521 = floor(_407);
    float _523 = -_513;
    float _525 = _523 + 1.0;
    bool _527 = _477 >= 0.0;
    bool _529 = isnan(_477);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    bool _537 = _477 > 0.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _539;
    float _543 = 1.0 / _363;
    float _545 = _325 * _491;
    int _547 = ~_479;
    int _549 = _547 + 1;
    int _551 = _549 + 1;
    int _553 = _551;
    if (!_483)
    {
        int _555 = ~_479;
        int _557 = _555 + 1;
        _553 = _557;
    }
    int _559 = _553;
    int _561 = _535 ? 0 : 1;
    bool _563 = _521 > 0.0;
    float _565 = 1.0 / _541;
    bool _567 = _521 >= 0.0;
    bool _569 = isnan(_521);
    bool _571 = _567 || _569;
    bool _573 = isnan(0.0);
    bool _575 = _571 || _573;
    float _577 = _517 + _519;
    float _579 = _475 * _543;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _593 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _595 = isnan(_311);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = fma(_583, _487, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _607 = fma(_587, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _609 = fma(_591, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _611 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _613 = isnan(_311);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = -_603;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _631 = _311 + _629;
    float _633 = fma(_501, _487, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _635 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _637 = isnan(_311);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _621 * _627;
    float _649 = _631 * _565;
    float _651 = -_621;
    float _653 = _651 + 1.0;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _655;
    bool _659 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _661 = isnan(_311);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_645;
    float _677 = _675 + 1.0;
    float _679 = fma(_657, _579, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _681 = _645 * _653;
    float _683 = fma(_673, _579, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _685 = _669 * _677;
    float _687 = -_669;
    float _689 = _687 + 1.0;
    bool _691 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _693 = isnan(_311);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = in.m_44.x;
    float _705 = in.m_44.y;
    float _707 = in.m_44.z;
    float _709 = _513 * _689;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _719 = float(_559);
    float _721 = _701 * _525;
    float _723 = fma(_713, _545, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _725 = fma(_717, _545, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _727 = float(_377);
    float _729 = _605 * _721;
    bool _731 = !_347;
    int _733 = _731 ? 0 : 1;
    float _735 = _633 * _721;
    int _737 = ~_561;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = _727 * _719;
    int _745 = abs(_733);
    int _747 = _741;
    if (!_537)
    {
        int _749 = ~_561;
        int _751 = _749 + 1;
        _747 = _751;
    }
    int _753 = _747;
    float _755 = _743 * (-2.0);
    float _757 = float(_745);
    float _759 = float(_753);
    int _761 = _575 ? 0 : 1;
    float _763 = fma(_755, _703, _703);
    bool _765 = !_343;
    int _767 = _765 ? 0 : 1;
    float _769 = _757 * _759;
    int _771 = ~_761;
    int _773 = _771 + 1;
    int _775 = _773 + 1;
    float _777 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[196].x, _763);
    int _779 = abs(_767);
    float _781 = _769 * (-2.0);
    int _783 = _775;
    if (!_563)
    {
        int _785 = ~_761;
        int _787 = _785 + 1;
        _783 = _787;
    }
    int _789 = _783;
    float _791 = fma(_497, _755, _497);
    float _793 = float(_779);
    float _795 = fma(_781, _707, _707);
    float _797 = float(_789);
    float _799 = fma(_485, _781, _485);
    float _801 = -_701;
    float _803 = _801 + 1.0;
    float _805 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[196].z, _795);
    float _807 = _793 * _797;
    float _809 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _729);
    float _811 = fma(_799, _495, _805);
    float _813 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _735);
    float _815 = _807 * (-2.0);
    float _817 = fma(_607, _709, _809);
    float _819 = _811 * 0.15915493667125701904296875;
    float _821 = fma(_609, _709, _813);
    float _823 = fma(_815, _705, _705);
    float _825 = in.m_46.x;
    float _827 = in.m_46.y;
    float _829 = fma(_791, _495, _777);
    float _831 = fma(_623, _815, _623);
    float _833 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[196].y, _823);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _835;
    float _839 = fma(_679, _685, _817);
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _841;
    float _845 = _829 * 0.15915493667125701904296875;
    float _847 = fma(_683, _685, _821);
    float _849 = fma(_831, _495, _833);
    float _851 = fma(_837, _649, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _853 = fma(_843, _649, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _855 = fma(_723, _681, _839);
    float _857 = _845 * 6.283185482025146484375;
    float _859 = sin(_857);
    float _861 = _849 * 0.15915493667125701904296875;
    float _863 = fma(_725, _681, _847);
    float _865 = fma(_851, _647, _855);
    float _867 = in.m_35.w;
    float _869 = fma(_853, _647, _863);
    float _871 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].x, _865);
    float _873 = _845 * 6.283185482025146484375;
    float _875 = cos(_873);
    bool _877 = !_411;
    float _879 = _877 ? (-0.5) : 0.5;
    float _881 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[148].y, _869);
    bool _883 = !_415;
    float _885 = _883 ? (-0.5) : 0.5;
    float _887 = _871 * _825;
    float _889 = _881 * _827;
    float _891 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _879);
    float _893 = _819 * 6.283185482025146484375;
    float _895 = sin(_893);
    float _897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _885);
    float _899 = _887 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _901 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = in.m_33.w;
    float _905 = _899 * _891;
    float _907 = _901 * _897;
    float _909 = _819 * 6.283185482025146484375;
    float _911 = cos(_909);
    float _913 = _459 + _867;
    float _915 = _861 * 6.283185482025146484375;
    float _917 = sin(_915);
    float _919 = _859 * _895;
    float _921 = _875 * _895;
    float _923 = _861 * 6.283185482025146484375;
    float _925 = cos(_923);
    float _927 = _875 * _911;
    float _929 = _859 * _911;
    float _931 = _515 + _903;
    float _933 = fma(_917, _919, _927);
    float _935 = _933 * _907;
    float _937 = -_921;
    float _939 = fma(_917, _929, _937);
    float _941 = -_929;
    float _943 = fma(_917, _921, _941);
    float _945 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _947 = _925 * _905;
    float _949 = _939 * _907;
    float _951 = _917 * _905;
    float _953 = fma(_917, _927, _919);
    float _955 = fma(_895, _947, _935);
    float _957 = _859 * _925;
    float _959 = fma(_911, _947, _949);
    float _961 = _875 * _925;
    float _963 = fma(_943, _945, _955);
    float _965 = -_951;
    float _967 = fma(_957, _907, _965);
    float _969 = fma(_953, _945, _959);
    float _971 = _963 * _265;
    float _973 = fma(_961, _945, _967);
    float _975 = _963 * _257;
    float _977 = _963 * _269;
    float _979 = fma(_969, _237, _971);
    float _981 = fma(_969, _233, _975);
    float _983 = fma(_969, _241, _977);
    float _985 = fma(_973, _277, _979);
    float _987 = fma(_973, _273, _981);
    float _989 = fma(_973, _281, _983);
    float _991 = _931 + _985;
    float _993 = _913 + _987;
    float _995 = _577 + _989;
    float _997 = _991 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = _991 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[1].x, _997);
    float _1007 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[0].x, _999);
    float _1009 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1001);
    float _1011 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1005);
    float _1015 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1007);
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1011);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1023 = _1015 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1025 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1027 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1033 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1035 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1037 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1039 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1031);
    float _1041 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1033);
    float _1043 = fma(_1023, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1035);
    float _1045 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1037);
    float _1047 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1039);
    float _1049 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1041);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1043);
    float _1053 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1045);
    float _1055 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1047);
    float _1057 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1049);
    float _1059 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1067 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1071 = _1057 + _1059;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1075 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1077 = _1071 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_48.x = _1073;
    out.m_48.y = _1067;
    out.m_48.z = _1075;
    out.m_48.w = _1063;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1057;
    out.gl_Position.w = _1059;
    out.m_50.z = _1077;
    out.m_50.w = _1059;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

