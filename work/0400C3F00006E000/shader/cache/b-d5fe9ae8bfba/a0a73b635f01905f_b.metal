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
    float4 m_50 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_37 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_87);
        out.gl_Position.z = _1116;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1186 = as_type<float>(_125);
        out.gl_Position.z = _1186;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.w;
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_71);
        float _273 = 1.0 / _271;
        float _275 = _105 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = in.m_39.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_39.x;
    float _287 = in.m_39.y;
    bool _289 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _297 = _293 || _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    float _303 = as_type<float>(int(gl_VertexIndex));
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = 1.0 / _301;
    float _317 = _283 * _105;
    float _319 = exp2(_317);
    float _321 = _279 * 2.0;
    float _323 = _285 * 2.0;
    float _325 = _287 * 2.0;
    float _327 = floor(_321);
    float _329 = floor(_323);
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _297 ? _333 : 0.0;
    bool _337 = _327 >= 0.0;
    bool _339 = isnan(_327);
    bool _341 = _337 || _339;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    float _347 = floor(_325);
    bool _349 = _327 > 0.0;
    if (_313)
    {
        float _351 = _335 * _315;
        _107 = _351;
    }
    float _353 = _107;
    int _355 = _345 ? 0 : 1;
    bool _357 = _329 > 0.0;
    bool _359 = _329 >= 0.0;
    bool _361 = isnan(_329);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    int _369 = as_type<int>(_303) & 1;
    bool _371 = _369 != 0;
    int _373 = as_type<int>(_303) & 2;
    bool _375 = _373 != 0;
    int _377 = _367 ? 0 : 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    int _383 = _381 + 1;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _395 = _393 != 0;
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    int _403 = _383;
    int _405 = _401;
    if (!_349)
    {
        int _407 = ~_355;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    bool _413 = !_387;
    int _415 = _413 ? 0 : 1;
    if (!_357)
    {
        int _417 = ~_377;
        int _419 = _417 + 1;
        _405 = _419;
    }
    int _421 = _405;
    bool _423 = _347 > 0.0;
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    bool _431 = _347 >= 0.0;
    bool _433 = isnan(_347);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = _287 + _279;
    int _443 = abs(_415);
    float _445 = _287 + _285;
    float _447 = float(_411);
    float _449 = _441 + (-1.0);
    float _451 = float(_443);
    float _453 = _445 + (-1.0);
    int _455 = _439 ? 0 : 1;
    float _457 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _461 = _459 != 0;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _465 = !_391;
    int _467 = _465 ? 0 : 1;
    float _469 = _451 * _447;
    bool _471 = !_395;
    int _473 = _471 ? 0 : 1;
    int _475 = abs(_467);
    float _477 = _279 + _285;
    int _479 = ~_455;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _279 + (-0.5);
    int _487 = _483;
    if (!_423)
    {
        int _489 = ~_455;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = _477 + (-1.0);
    int _497 = abs(_473);
    float _499 = _469 * (-2.0);
    float _501 = float(_421);
    float _503 = float(_475);
    float _505 = fma(_499, _425, _425);
    float _507 = fma(_463, _499, _463);
    bool _509 = _285 > 0.5;
    float _511 = _503 * _501;
    float _513 = _285 + (-0.5);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _517 = float(_497);
    float _519 = _511 * (-2.0);
    float _521 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].x, _505);
    float _523 = float(_493);
    float _525 = _287 + (-0.5);
    float _527 = fma(_519, _427, _427);
    float _529 = fma(_507, _353, _521);
    float _531 = fma(_457, _519, _457);
    float _533 = _517 * _523;
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _527);
    float _537 = _529 * 0.15915493667125701904296875;
    float _539 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _541 = in.m_37.x;
    float _543 = in.m_37.y;
    float _545 = _533 * (-2.0);
    float _547 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _549 = fma(_531, _353, _535);
    float _551 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _557 = _555 != 0;
    float _559 = fma(_545, _429, _429);
    float _561 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
    float _563 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _567 = fma(_515, _545, _515);
    float _569 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].z, _559);
    float _571 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _561);
    float _573 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = fma(_567, _353, _569);
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _581 = _549 * 0.15915493667125701904296875;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _587 = _577 * 0.15915493667125701904296875;
    float _589 = _573 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[9].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[8].x, _585);
    float _595 = _537 * 6.283185482025146484375;
    float _597 = sin(_595);
    float _599 = _543 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[9].z, _591);
    bool _603 = !_375;
    float _605 = _603 ? (-0.5) : 0.5;
    float _607 = _541 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _609 = !_371;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _601 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _615 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _617 = _537 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _623 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    bool _627 = _287 > 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _581 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = _613 * _613;
    float _639 = _623 * _625;
    float _641 = _587 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = _581 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _619 * _635;
    float _651 = 1.0 / _631;
    float _653 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[8].z, _593);
    float _655 = _653 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _657 = _615 * _621;
    float _659 = _597 * _635;
    float _661 = _587 * 6.283185482025146484375;
    float _663 = sin(_661);
    float _665 = _635 * _643;
    float _667 = _643 * _657;
    float _669 = _597 * _647;
    float _671 = _619 * _647;
    float _673 = fma(_655, _655, _637);
    float _675 = _647 * _643;
    float _677 = _619 * _667;
    float _679 = sqrt(_673);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -_649;
    float _687 = fma(_663, _669, _685);
    float _689 = fma(_663, _671, _659);
    float _691 = -_669;
    float _693 = fma(_663, _649, _691);
    float _695 = -_657;
    float _697 = _663 * _695;
    float _699 = fma(_663, _659, _671);
    float _701 = _597 * _667;
    float _703 = fma(_689, _639, _677);
    float _705 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _707 = fma(_675, _639, _697);
    float _709 = fma(_687, _639, _701);
    float _711 = _683 * _651;
    float _713 = fma(_693, _705, _703);
    float _715 = fma(_665, _705, _707);
    float _717 = fma(_699, _705, _709);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _721 = _277 + _719;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _727 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _729 = isnan(_277);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_711, _721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _723);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _745 = -_737;
    float _747 = _745 + 1.0;
    float _749 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = _679 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _755 = precise::clamp(_753, 0.0, 1.0);
    bool _757 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _759 = isnan(_277);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _773 = fma(_769, _755, _589);
    float _775 = fma(_771, _755, _579);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _773 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _775 + _785;
    float _789 = 1.0 / _779;
    float _791 = _783 * _783;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _797 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _799 = isnan(_277);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _767 * _747;
    float _811 = fma(_787, _787, _791);
    float _813 = -_767;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _795;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _821 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _827 = _807 * _815;
    float _829 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = sqrt(_811);
    out.m_46.w = _819;
    float _833 = _825 * _789;
    float _835 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _837;
    out.m_33.x = _821;
    float _841 = -_807;
    float _843 = _841 + 1.0;
    float _845 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].z, _835);
    float _847 = _839 * _817;
    float _849 = -_611;
    int _851 = _509 ? as_type<int>(_849) : as_type<int>(_611);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_461;
    float _857 = _855 ? _611 : as_type<float>(_851);
    float _859 = fma(_853, _755, _575);
    bool _861 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = _739 * _827;
    bool _865 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _867 = isnan(_277);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _879 = _277 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _883 = _277 + _881;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[115].x, _863);
    float _887 = fma(_833, _879, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = fma(_847, _883, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _895 = -_605;
    int _897 = _627 ? as_type<int>(_895) : as_type<int>(_605);
    float _899 = fma(_887, _809, _885);
    float _901 = _737 * _891;
    float _903 = _575;
    float _905 = _611;
    float _907 = _775;
    if (!_861)
    {
        _903 = _773;
    }
    float _909 = _903;
    bool _911 = !_557;
    float _913 = _911 ? _605 : as_type<float>(_897);
    float _915 = fma(_893, _901, _899);
    float _917 = _909;
    if (!_861)
    {
        _905 = _859;
    }
    float _919 = _905;
    float _921 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[118].x, _915);
    bool _923 = !_861;
    float _925 = _919;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _831 + _929;
        float _933 = _859 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = rsqrt(_811);
        float _937 = _931 * _927;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _935 * _951;
        float _957 = fma(_859, _943, _953);
        float _959 = fma(_787, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_783, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _907 = _959;
        _917 = _961;
    }
    float _963 = _925;
    float _965 = _907;
    float _967 = _917;
    float _969 = _963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _969);
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _971);
    float _981 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _977);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _983);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1005 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1007 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1007);
    float _1021 = _991 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1011);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    float _1027 = _857 + 0.5;
    float _1029 = -_913;
    float _1031 = _1029 + 0.5;
    float _1033 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1019);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1023);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1033);
    float _1045 = _1035 + _1037;
    float _1047 = _1037 * 0.5;
    float _1049 = _1039 * _999;
    float _1051 = _1041 * _1015;
    float _1053 = _921 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1017);
    float _1057 = _1045 * 0.5;
    float _1059 = fma(_1043, -0.5, _1047);
    out.m_48.x = _1049;
    out.m_48.y = _1051;
    out.m_50.w = _1053;
    out.gl_Position.x = _1035;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1055;
    out.gl_Position.w = _1037;
    out.m_52.w = _1037;
    out.m_52.x = _1057;
    out.m_52.y = _1059;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_87);
        out.gl_Position.z = _1116;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1186 = as_type<float>(_125);
        out.gl_Position.z = _1186;
    }
    if (_117)
    {
        return out;
    }
    float _127 = in.m_37.w;
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_71);
        float _273 = 1.0 / _271;
        float _275 = _105 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = in.m_39.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_39.x;
    float _287 = in.m_39.y;
    bool _289 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _297 = _293 || _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    float _303 = as_type<float>(int(gl_VertexIndex));
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = 1.0 / _301;
    float _317 = _283 * _105;
    float _319 = exp2(_317);
    float _321 = _279 * 2.0;
    float _323 = _285 * 2.0;
    float _325 = _287 * 2.0;
    float _327 = floor(_321);
    float _329 = floor(_323);
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _297 ? _333 : 0.0;
    bool _337 = _327 >= 0.0;
    bool _339 = isnan(_327);
    bool _341 = _337 || _339;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    float _347 = floor(_325);
    bool _349 = _327 > 0.0;
    if (_313)
    {
        float _351 = _335 * _315;
        _107 = _351;
    }
    float _353 = _107;
    int _355 = _345 ? 0 : 1;
    bool _357 = _329 > 0.0;
    bool _359 = _329 >= 0.0;
    bool _361 = isnan(_329);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    int _369 = as_type<int>(_303) & 1;
    bool _371 = _369 != 0;
    int _373 = as_type<int>(_303) & 2;
    bool _375 = _373 != 0;
    int _377 = _367 ? 0 : 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    int _383 = _381 + 1;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _395 = _393 != 0;
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    int _403 = _383;
    int _405 = _401;
    if (!_349)
    {
        int _407 = ~_355;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    bool _413 = !_387;
    int _415 = _413 ? 0 : 1;
    if (!_357)
    {
        int _417 = ~_377;
        int _419 = _417 + 1;
        _405 = _419;
    }
    int _421 = _405;
    bool _423 = _347 > 0.0;
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    bool _431 = _347 >= 0.0;
    bool _433 = isnan(_347);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = _287 + _279;
    int _443 = abs(_415);
    float _445 = _287 + _285;
    float _447 = float(_411);
    float _449 = _441 + (-1.0);
    float _451 = float(_443);
    float _453 = _445 + (-1.0);
    int _455 = _439 ? 0 : 1;
    float _457 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _461 = _459 != 0;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _465 = !_391;
    int _467 = _465 ? 0 : 1;
    float _469 = _451 * _447;
    bool _471 = !_395;
    int _473 = _471 ? 0 : 1;
    int _475 = abs(_467);
    float _477 = _279 + _285;
    int _479 = ~_455;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _279 + (-0.5);
    int _487 = _483;
    if (!_423)
    {
        int _489 = ~_455;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = _477 + (-1.0);
    int _497 = abs(_473);
    float _499 = _469 * (-2.0);
    float _501 = float(_421);
    float _503 = float(_475);
    float _505 = fma(_499, _425, _425);
    float _507 = fma(_463, _499, _463);
    bool _509 = _285 > 0.5;
    float _511 = _503 * _501;
    float _513 = _285 + (-0.5);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _517 = float(_497);
    float _519 = _511 * (-2.0);
    float _521 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].x, _505);
    float _523 = float(_493);
    float _525 = _287 + (-0.5);
    float _527 = fma(_519, _427, _427);
    float _529 = fma(_507, _353, _521);
    float _531 = fma(_457, _519, _457);
    float _533 = _517 * _523;
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _527);
    float _537 = _529 * 0.15915493667125701904296875;
    float _539 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _541 = in.m_37.x;
    float _543 = in.m_37.y;
    float _545 = _533 * (-2.0);
    float _547 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _549 = fma(_531, _353, _535);
    float _551 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _557 = _555 != 0;
    float _559 = fma(_545, _429, _429);
    float _561 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
    float _563 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _567 = fma(_515, _545, _515);
    float _569 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].z, _559);
    float _571 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _561);
    float _573 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = fma(_567, _353, _569);
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _581 = _549 * 0.15915493667125701904296875;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _587 = _577 * 0.15915493667125701904296875;
    float _589 = _573 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[9].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[8].x, _585);
    float _595 = _537 * 6.283185482025146484375;
    float _597 = sin(_595);
    float _599 = _543 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[9].z, _591);
    bool _603 = !_375;
    float _605 = _603 ? (-0.5) : 0.5;
    float _607 = _541 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _609 = !_371;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _601 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _615 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _617 = _537 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _623 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    bool _627 = _287 > 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _581 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = _613 * _613;
    float _639 = _623 * _625;
    float _641 = _587 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = _581 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _619 * _635;
    float _651 = 1.0 / _631;
    float _653 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[8].z, _593);
    float _655 = _653 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _657 = _615 * _621;
    float _659 = _597 * _635;
    float _661 = _587 * 6.283185482025146484375;
    float _663 = sin(_661);
    float _665 = _635 * _643;
    float _667 = _643 * _657;
    float _669 = _597 * _647;
    float _671 = _619 * _647;
    float _673 = fma(_655, _655, _637);
    float _675 = _647 * _643;
    float _677 = _619 * _667;
    float _679 = sqrt(_673);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -_649;
    float _687 = fma(_663, _669, _685);
    float _689 = fma(_663, _671, _659);
    float _691 = -_669;
    float _693 = fma(_663, _649, _691);
    float _695 = -_657;
    float _697 = _663 * _695;
    float _699 = fma(_663, _659, _671);
    float _701 = _597 * _667;
    float _703 = fma(_689, _639, _677);
    float _705 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _707 = fma(_675, _639, _697);
    float _709 = fma(_687, _639, _701);
    float _711 = _683 * _651;
    float _713 = fma(_693, _705, _703);
    float _715 = fma(_665, _705, _707);
    float _717 = fma(_699, _705, _709);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _721 = _277 + _719;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _727 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _729 = isnan(_277);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_711, _721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _723);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _745 = -_737;
    float _747 = _745 + 1.0;
    float _749 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = _679 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _755 = precise::clamp(_753, 0.0, 1.0);
    bool _757 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _759 = isnan(_277);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _773 = fma(_769, _755, _589);
    float _775 = fma(_771, _755, _579);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _773 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _775 + _785;
    float _789 = 1.0 / _779;
    float _791 = _783 * _783;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _797 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _799 = isnan(_277);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _767 * _747;
    float _811 = fma(_787, _787, _791);
    float _813 = -_767;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _795;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _821 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _827 = _807 * _815;
    float _829 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = sqrt(_811);
    out.m_46.w = _819;
    float _833 = _825 * _789;
    float _835 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _837;
    out.m_33.x = _821;
    float _841 = -_807;
    float _843 = _841 + 1.0;
    float _845 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].z, _835);
    float _847 = _839 * _817;
    float _849 = -_611;
    int _851 = _509 ? as_type<int>(_849) : as_type<int>(_611);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_461;
    float _857 = _855 ? _611 : as_type<float>(_851);
    float _859 = fma(_853, _755, _575);
    bool _861 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = _739 * _827;
    bool _865 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _867 = isnan(_277);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _879 = _277 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _883 = _277 + _881;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[115].x, _863);
    float _887 = fma(_833, _879, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = fma(_847, _883, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _895 = -_605;
    int _897 = _627 ? as_type<int>(_895) : as_type<int>(_605);
    float _899 = fma(_887, _809, _885);
    float _901 = _737 * _891;
    float _903 = _575;
    float _905 = _611;
    float _907 = _775;
    if (!_861)
    {
        _903 = _773;
    }
    float _909 = _903;
    bool _911 = !_557;
    float _913 = _911 ? _605 : as_type<float>(_897);
    float _915 = fma(_893, _901, _899);
    float _917 = _909;
    if (!_861)
    {
        _905 = _859;
    }
    float _919 = _905;
    float _921 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[118].x, _915);
    bool _923 = !_861;
    float _925 = _919;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _831 + _929;
        float _933 = _859 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = rsqrt(_811);
        float _937 = _931 * _927;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _935 * _951;
        float _957 = fma(_859, _943, _953);
        float _959 = fma(_787, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_783, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _907 = _959;
        _917 = _961;
    }
    float _963 = _925;
    float _965 = _907;
    float _967 = _917;
    float _969 = _963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _969);
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _971);
    float _981 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _977);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _983);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1005 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1007 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1007);
    float _1021 = _991 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1011);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    float _1027 = _857 + 0.5;
    float _1029 = -_913;
    float _1031 = _1029 + 0.5;
    float _1033 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1019);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1023);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1033);
    float _1045 = _1035 + _1037;
    float _1047 = _1037 * 0.5;
    float _1049 = _1039 * _999;
    float _1051 = _1041 * _1015;
    float _1053 = _921 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1017);
    float _1057 = _1045 * 0.5;
    float _1059 = fma(_1043, -0.5, _1047);
    out.m_48.x = _1049;
    out.m_48.y = _1051;
    out.m_50.w = _1053;
    out.gl_Position.x = _1035;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1055;
    out.gl_Position.w = _1037;
    out.m_52.w = _1037;
    out.m_52.x = _1057;
    out.m_52.y = _1059;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_30.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1116 = as_type<float>(_87);
        out.gl_Position.z = _1116;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_35.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = _105;
    if (_101)
    {
        float _109 = float(_71);
        _81 = _109;
    }
    float _111 = _81;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_33.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1186 = as_type<float>(_125);
        out.gl_Position.z = _1186;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.w;
    float _129 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_35.x;
    float _143 = in.m_35.y;
    float _145 = in.m_35.z;
    float _147 = in.m_30.x;
    float _149 = in.m_30.y;
    float _151 = in.m_30.z;
    float _153 = 0.0;
    float _155 = _129;
    if (!_139)
    {
        float _157 = _129 * _129;
        float _159 = _157 * 0.5;
        _153 = _159;
    }
    float _161 = _153;
    float _163 = _161;
    if (!_139)
    {
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _163 = _165;
    }
    float _167 = _163;
    bool _169 = !_139;
    float _171 = _167;
    if (!_169)
    {
        float _173 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _175 = log2(_173);
        float _177 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _179 = _177 + 1.0;
        float _181 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _183 = _129 * _175;
        float _185 = 1.0 / _179;
        float _187 = _181 * 0.693147182464599609375;
        float _189 = exp2(_183);
        float _191 = 1.0 / _187;
        float _193 = _189 + (-1.0);
        float _195 = -_193;
        float _197 = fma(_195, _191, _129);
        float _199 = _197 * _185;
        float _201 = _199 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _201;
    }
    float _203 = _171;
    bool _205 = !_139;
    if (!_205)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = 1.0 / _213;
        float _217 = _129 * _209;
        float _219 = exp2(_217);
        float _221 = -_219;
        float _223 = _221 + 1.0;
        float _225 = _223 * _215;
        _155 = _225;
    }
    float _227 = _155;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _141, _231);
    float _239 = fma(_227, _143, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _147);
    float _245 = fma(_239, _127, _149);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_71);
        float _273 = 1.0 / _271;
        float _275 = _105 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = in.m_39.z;
    float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _283 = log2(_281);
    float _285 = in.m_39.x;
    float _287 = in.m_39.y;
    bool _289 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _297 = _293 || _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    float _303 = as_type<float>(int(gl_VertexIndex));
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = 1.0 / _301;
    float _317 = _283 * _105;
    float _319 = exp2(_317);
    float _321 = _279 * 2.0;
    float _323 = _285 * 2.0;
    float _325 = _287 * 2.0;
    float _327 = floor(_321);
    float _329 = floor(_323);
    float _331 = -_319;
    float _333 = _331 + 1.0;
    float _335 = _297 ? _333 : 0.0;
    bool _337 = _327 >= 0.0;
    bool _339 = isnan(_327);
    bool _341 = _337 || _339;
    bool _343 = isnan(0.0);
    bool _345 = _341 || _343;
    float _347 = floor(_325);
    bool _349 = _327 > 0.0;
    if (_313)
    {
        float _351 = _335 * _315;
        _107 = _351;
    }
    float _353 = _107;
    int _355 = _345 ? 0 : 1;
    bool _357 = _329 > 0.0;
    bool _359 = _329 >= 0.0;
    bool _361 = isnan(_329);
    bool _363 = _359 || _361;
    bool _365 = isnan(0.0);
    bool _367 = _363 || _365;
    int _369 = as_type<int>(_303) & 1;
    bool _371 = _369 != 0;
    int _373 = as_type<int>(_303) & 2;
    bool _375 = _373 != 0;
    int _377 = _367 ? 0 : 1;
    int _379 = ~_355;
    int _381 = _379 + 1;
    int _383 = _381 + 1;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _387 = _385 != 0;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _395 = _393 != 0;
    int _397 = ~_377;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    int _403 = _383;
    int _405 = _401;
    if (!_349)
    {
        int _407 = ~_355;
        int _409 = _407 + 1;
        _403 = _409;
    }
    int _411 = _403;
    bool _413 = !_387;
    int _415 = _413 ? 0 : 1;
    if (!_357)
    {
        int _417 = ~_377;
        int _419 = _417 + 1;
        _405 = _419;
    }
    int _421 = _405;
    bool _423 = _347 > 0.0;
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    bool _431 = _347 >= 0.0;
    bool _433 = isnan(_347);
    bool _435 = _431 || _433;
    bool _437 = isnan(0.0);
    bool _439 = _435 || _437;
    float _441 = _287 + _279;
    int _443 = abs(_415);
    float _445 = _287 + _285;
    float _447 = float(_411);
    float _449 = _441 + (-1.0);
    float _451 = float(_443);
    float _453 = _445 + (-1.0);
    int _455 = _439 ? 0 : 1;
    float _457 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _461 = _459 != 0;
    float _463 = fma(_453, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _465 = !_391;
    int _467 = _465 ? 0 : 1;
    float _469 = _451 * _447;
    bool _471 = !_395;
    int _473 = _471 ? 0 : 1;
    int _475 = abs(_467);
    float _477 = _279 + _285;
    int _479 = ~_455;
    int _481 = _479 + 1;
    int _483 = _481 + 1;
    float _485 = _279 + (-0.5);
    int _487 = _483;
    if (!_423)
    {
        int _489 = ~_455;
        int _491 = _489 + 1;
        _487 = _491;
    }
    int _493 = _487;
    float _495 = _477 + (-1.0);
    int _497 = abs(_473);
    float _499 = _469 * (-2.0);
    float _501 = float(_421);
    float _503 = float(_475);
    float _505 = fma(_499, _425, _425);
    float _507 = fma(_463, _499, _463);
    bool _509 = _285 > 0.5;
    float _511 = _503 * _501;
    float _513 = _285 + (-0.5);
    float _515 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _517 = float(_497);
    float _519 = _511 * (-2.0);
    float _521 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].x, _505);
    float _523 = float(_493);
    float _525 = _287 + (-0.5);
    float _527 = fma(_519, _427, _427);
    float _529 = fma(_507, _353, _521);
    float _531 = fma(_457, _519, _457);
    float _533 = _517 * _523;
    float _535 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[196].y, _527);
    float _537 = _529 * 0.15915493667125701904296875;
    float _539 = _245 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _541 = in.m_37.x;
    float _543 = in.m_37.y;
    float _545 = _533 * (-2.0);
    float _547 = _245 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _549 = fma(_531, _353, _535);
    float _551 = _245 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[5].x, _539);
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _557 = _555 != 0;
    float _559 = fma(_545, _429, _429);
    float _561 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
    float _563 = fma(_243, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _553);
    float _567 = fma(_515, _545, _515);
    float _569 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[196].z, _559);
    float _571 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _561);
    float _573 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _563);
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = fma(_567, _353, _569);
    float _579 = _571 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _581 = _549 * 0.15915493667125701904296875;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _587 = _577 * 0.15915493667125701904296875;
    float _589 = _573 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[9].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[8].x, _585);
    float _595 = _537 * 6.283185482025146484375;
    float _597 = sin(_595);
    float _599 = _543 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[9].z, _591);
    bool _603 = !_375;
    float _605 = _603 ? (-0.5) : 0.5;
    float _607 = _541 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _609 = !_371;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _601 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _615 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _617 = _537 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _605);
    float _623 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _625 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    bool _627 = _287 > 0.5;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _633 = _581 * 6.283185482025146484375;
    float _635 = sin(_633);
    float _637 = _613 * _613;
    float _639 = _623 * _625;
    float _641 = _587 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = _581 * 6.283185482025146484375;
    float _647 = cos(_645);
    float _649 = _619 * _635;
    float _651 = 1.0 / _631;
    float _653 = fma(_589, (*spvDescriptorSet0.vp_c8)._m0[8].z, _593);
    float _655 = _653 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _657 = _615 * _621;
    float _659 = _597 * _635;
    float _661 = _587 * 6.283185482025146484375;
    float _663 = sin(_661);
    float _665 = _635 * _643;
    float _667 = _643 * _657;
    float _669 = _597 * _647;
    float _671 = _619 * _647;
    float _673 = fma(_655, _655, _637);
    float _675 = _647 * _643;
    float _677 = _619 * _667;
    float _679 = sqrt(_673);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _681;
    float _685 = -_649;
    float _687 = fma(_663, _669, _685);
    float _689 = fma(_663, _671, _659);
    float _691 = -_669;
    float _693 = fma(_663, _649, _691);
    float _695 = -_657;
    float _697 = _663 * _695;
    float _699 = fma(_663, _659, _671);
    float _701 = _597 * _667;
    float _703 = fma(_689, _639, _677);
    float _705 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _707 = fma(_675, _639, _697);
    float _709 = fma(_687, _639, _701);
    float _711 = _683 * _651;
    float _713 = fma(_693, _705, _703);
    float _715 = fma(_665, _705, _707);
    float _717 = fma(_699, _705, _709);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _721 = _277 + _719;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _727 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _729 = isnan(_277);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_711, _721, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].x, _723);
    float _743 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].x, _725);
    float _745 = -_737;
    float _747 = _745 + 1.0;
    float _749 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].z, _741);
    float _751 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].z, _743);
    float _753 = _679 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _755 = precise::clamp(_753, 0.0, 1.0);
    bool _757 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _759 = isnan(_277);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = _749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _771 = _751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _773 = fma(_769, _755, _589);
    float _775 = fma(_771, _755, _579);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _781 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _783 = _773 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _775 + _785;
    float _789 = 1.0 / _779;
    float _791 = _783 * _783;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _797 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _799 = isnan(_277);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = _767 * _747;
    float _811 = fma(_787, _787, _791);
    float _813 = -_767;
    float _815 = _813 + 1.0;
    float _817 = 1.0 / _795;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _821 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _827 = _807 * _815;
    float _829 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _831 = sqrt(_811);
    out.m_46.w = _819;
    float _833 = _825 * _789;
    float _835 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _829);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _837;
    out.m_33.x = _821;
    float _841 = -_807;
    float _843 = _841 + 1.0;
    float _845 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].z, _835);
    float _847 = _839 * _817;
    float _849 = -_611;
    int _851 = _509 ? as_type<int>(_849) : as_type<int>(_611);
    float _853 = _845 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _855 = !_461;
    float _857 = _855 ? _611 : as_type<float>(_851);
    float _859 = fma(_853, _755, _575);
    bool _861 = _831 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _863 = _739 * _827;
    bool _865 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _867 = isnan(_277);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _879 = _277 + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _883 = _277 + _881;
    float _885 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[115].x, _863);
    float _887 = fma(_833, _879, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _889 = -_875;
    float _891 = _889 + 1.0;
    float _893 = fma(_847, _883, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _895 = -_605;
    int _897 = _627 ? as_type<int>(_895) : as_type<int>(_605);
    float _899 = fma(_887, _809, _885);
    float _901 = _737 * _891;
    float _903 = _575;
    float _905 = _611;
    float _907 = _775;
    if (!_861)
    {
        _903 = _773;
    }
    float _909 = _903;
    bool _911 = !_557;
    float _913 = _911 ? _605 : as_type<float>(_897);
    float _915 = fma(_893, _901, _899);
    float _917 = _909;
    if (!_861)
    {
        _905 = _859;
    }
    float _919 = _905;
    float _921 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[118].x, _915);
    bool _923 = !_861;
    float _925 = _919;
    if (!_923)
    {
        float _927 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _931 = _831 + _929;
        float _933 = _859 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _935 = rsqrt(_811);
        float _937 = _931 * _927;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = _939 * 6.283185482025146484375;
        float _943 = cos(_941);
        float _945 = _939 * 6.283185482025146484375;
        float _947 = sin(_945);
        float _949 = _943 + (-1.0);
        float _951 = fma(_947, _933, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _955 = _935 * _951;
        float _957 = fma(_859, _943, _953);
        float _959 = fma(_787, _955, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _961 = fma(_783, _955, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _925 = _957;
        _907 = _959;
        _917 = _961;
    }
    float _963 = _925;
    float _965 = _907;
    float _967 = _917;
    float _969 = _963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _973 = _963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _975 = _963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _977 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[1].x, _969);
    float _979 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[0].x, _971);
    float _981 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[2].x, _973);
    float _983 = fma(_965, (*spvDescriptorSet0.vp_c8)._m0[3].x, _975);
    float _985 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[1].z, _977);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[0].z, _979);
    float _989 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[2].z, _981);
    float _991 = fma(_967, (*spvDescriptorSet0.vp_c8)._m0[3].z, _983);
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _999 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1005 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1007 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1009 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1001);
    float _1011 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1003);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1005);
    float _1015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1017 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1009);
    float _1019 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1007);
    float _1021 = _991 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1023 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1011);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1013);
    float _1027 = _857 + 0.5;
    float _1029 = -_913;
    float _1031 = _1029 + 0.5;
    float _1033 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1019);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1023);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    float _1039 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1041 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1043 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1033);
    float _1045 = _1035 + _1037;
    float _1047 = _1037 * 0.5;
    float _1049 = _1039 * _999;
    float _1051 = _1041 * _1015;
    float _1053 = _921 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1055 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1017);
    float _1057 = _1045 * 0.5;
    float _1059 = fma(_1043, -0.5, _1047);
    out.m_48.x = _1049;
    out.m_48.y = _1051;
    out.m_50.w = _1053;
    out.gl_Position.x = _1035;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1055;
    out.gl_Position.w = _1037;
    out.m_52.w = _1037;
    out.m_52.x = _1057;
    out.m_52.y = _1059;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

