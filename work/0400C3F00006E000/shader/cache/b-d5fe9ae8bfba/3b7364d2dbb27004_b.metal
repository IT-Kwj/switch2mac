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
    float4 m_42 [[user(locn0)]];
    float4 m_29 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_33 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _920 = as_type<float>(_79);
        out.gl_Position.z = _920;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _989 = as_type<float>(_117);
        out.gl_Position.z = _989;
    }
    if (_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _167 = _149 + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _169;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _175 = _173 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _177;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _183 = _181 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _185 = 1.0 / _171;
    float _187 = _159 * _97;
    float _189 = 1.0 / _175;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _201 = _199 != 0;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _149 + _203;
    float _207 = _155 * 2.0;
    float _209 = _153 + _155;
    float _211 = _155 + _151;
    float _213 = exp2(_187);
    float _215 = _155 + (-0.5);
    float _217 = _153 + _151;
    float _219 = _151 * 2.0;
    bool _221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _223 = isnan(1.0);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _229 = _225 || _227;
    float _231 = _205 * _185;
    bool _233 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _235 = isnan(0.0);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _241 = _237 || _239;
    float _243 = floor(_207);
    float _245 = _211 + (-1.0);
    float _247 = _163 * _189;
    float _249 = _209 + (-1.0);
    float _251 = _217 + (-1.0);
    float _253 = 1.0 / _183;
    float _255 = -_213;
    float _257 = _255 + 1.0;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _261 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _263 = _241 ? _257 : 0.0;
    float _265 = 1.0 / _179;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _269 = 1.0 + _267;
    bool _271 = _243 > 0.0;
    float _273 = _151 + (-0.5);
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _149 + _275;
    bool _279 = _243 >= 0.0;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    float _289 = 1.0 / _269;
    float _291 = _153 + (-0.5);
    float _293 = _153 * 2.0;
    float _295 = _167 * _253;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _297;
    float _301 = floor(_293);
    float _303 = _277 * _265;
    int _305 = _287 ? 0 : 1;
    float _307 = fma(_299, _303, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _309 = ~_305;
    int _311 = _309 + 1;
    int _313 = _311 + 1;
    float _315 = floor(_219);
    int _317 = _313;
    if (_229)
    {
        float _319 = _263 * _289;
        _101 = _319;
    }
    float _321 = _101;
    float _323 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (!_271)
    {
        int _325 = ~_305;
        int _327 = _325 + 1;
        _317 = _327;
    }
    int _329 = _317;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_149);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _351 = _301 > 0.0;
    float _353 = fma(_333, _231, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _355 = _301 >= 0.0;
    bool _357 = isnan(_301);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _373 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_149);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_345;
    float _387 = _385 + 1.0;
    float _389 = fma(_367, _231, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _391 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_149);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_349, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _405 = _315 > 0.0;
    float _407 = fma(_371, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _409 = _315 >= 0.0;
    bool _411 = isnan(_315);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = -_401;
    float _425 = _423 + 1.0;
    bool _427 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_149);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_383;
    float _441 = _439 + 1.0;
    float _443 = fma(_421, _303, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _445 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_149);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _401 * _387;
    float _459 = _383 * _425;
    bool _461 = !_193;
    int _463 = _461 ? 0 : 1;
    float _465 = in.m_35.x;
    float _467 = in.m_35.y;
    float _469 = in.m_35.z;
    float _471 = _437 * _441;
    float _473 = -_437;
    float _475 = _473 + 1.0;
    int _477 = abs(_463);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = _455 * _475;
    float _489 = fma(_481, _295, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = float(_329);
    float _493 = fma(_485, _295, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = float(_477);
    float _497 = _353 * _487;
    bool _499 = !_201;
    int _501 = _499 ? 0 : 1;
    float _503 = -_455;
    float _505 = _503 + 1.0;
    int _507 = _363 ? 0 : 1;
    float _509 = _495 * _491;
    int _511 = abs(_501);
    float _513 = _389 * _487;
    int _515 = ~_507;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _523 = _509 * (-2.0);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    int _527 = _519;
    if (!_351)
    {
        int _529 = ~_507;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = fma(_523, _465, _465);
    bool _537 = !_197;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_403, _471, _521);
    float _543 = float(_511);
    float _545 = fma(_261, _523, _261);
    float _547 = float(_533);
    float _549 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[196].x, _535);
    int _551 = abs(_539);
    float _553 = fma(_307, _459, _541);
    int _555 = _417 ? 0 : 1;
    float _557 = _543 * _547;
    float _559 = fma(_545, _321, _549);
    float _561 = fma(_407, _471, _525);
    int _563 = ~_555;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * (-2.0);
    int _571 = _567;
    if (!_405)
    {
        int _573 = ~_555;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _559 * 0.15915493667125701904296875;
    float _581 = float(_551);
    float _583 = fma(_569, _469, _469);
    float _585 = float(_577);
    float _587 = as_type<float>(int(gl_VertexIndex));
    float _589 = fma(_323, _569, _323);
    float _591 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[196].z, _583);
    float _593 = fma(_489, _457, _553);
    float _595 = _581 * _585;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = fma(_589, _321, _591);
    float _603 = fma(_443, _459, _561);
    float _605 = _595 * (-2.0);
    float _607 = in.m_26.x;
    float _609 = in.m_26.y;
    float _611 = in.m_26.z;
    float _613 = _601 * 0.15915493667125701904296875;
    float _615 = _579 * 6.283185482025146484375;
    float _617 = sin(_615);
    float _619 = fma(_605, _467, _467);
    float _621 = fma(_259, _605, _259);
    float _623 = fma(_493, _457, _603);
    float _625 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _627 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _623);
    float _629 = _579 * 6.283185482025146484375;
    float _631 = cos(_629);
    float _633 = fma(_621, _321, _625);
    float _635 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _593);
    float _637 = _633 * 0.15915493667125701904296875;
    int _639 = as_type<int>(_587) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_587) & 2;
    bool _645 = _643 != 0;
    float _647 = _613 * 6.283185482025146484375;
    float _649 = sin(_647);
    float _651 = _635 * _597;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _627 * _599;
    bool _659 = !_645;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = _609 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _609 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _613 * 6.283185482025146484375;
    float _669 = cos(_667);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _609 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _679 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = _673 * _671;
    float _683 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _685 = _637 * 6.283185482025146484375;
    float _687 = sin(_685);
    float _689 = _617 * _649;
    float _691 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _693 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _695 = _679 * _677;
    float _697 = _631 * _649;
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _703 = _637 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _631 * _669;
    float _709 = _617 * _669;
    float _711 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[6].z, _693);
    float _713 = _701 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _715 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _719 = fma(_687, _689, _707);
    float _721 = -_697;
    float _723 = fma(_687, _709, _721);
    float _725 = -_709;
    float _727 = fma(_687, _697, _725);
    float _729 = _719 * _695;
    float _731 = _723 * _695;
    float _733 = _705 * _681;
    float _735 = _617 * _705;
    float _737 = _631 * _705;
    float _739 = fma(_649, _733, _729);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _687 * _681;
    float _745 = fma(_687, _707, _689);
    float _747 = fma(_669, _733, _731);
    float _749 = fma(_727, _741, _739);
    float _751 = -_743;
    float _753 = fma(_735, _695, _751);
    float _755 = fma(_745, _741, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _759 = _749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _761 = fma(_737, _741, _753);
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _765 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[9].x, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[8].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[10].x, _763);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[9].z, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[8].z, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[10].z, _769);
    float _777 = _713 + _771;
    float _779 = _715 + _773;
    float _781 = _717 + _775;
    float _783 = _777 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _785 = _777 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _787 = _777 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _789 = _777 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _783);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _785);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _787);
    float _797 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[1].z, _791);
    float _801 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[0].z, _793);
    float _803 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _805 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[3].z, _797);
    float _807 = _799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _809 = _801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _817 = _807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _819 = _807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[5].x, _815);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[6].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _825);
    float _835 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _827);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _829);
    float _839 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _831);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _835);
    float _845 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _841 + _845;
    float _859 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _857 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _859;
    out.m_42.y = _855;
    out.m_42.z = _861;
    out.m_42.w = _851;
    out.gl_Position.x = _843;
    out.gl_Position.y = _839;
    out.gl_Position.z = _841;
    out.gl_Position.w = _845;
    out.m_44.z = _863;
    out.m_44.w = _845;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _920 = as_type<float>(_79);
        out.gl_Position.z = _920;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _989 = as_type<float>(_117);
        out.gl_Position.z = _989;
    }
    if (_111)
    {
        return out;
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _167 = _149 + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _169;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _175 = _173 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _177;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _183 = _181 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _185 = 1.0 / _171;
    float _187 = _159 * _97;
    float _189 = 1.0 / _175;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _201 = _199 != 0;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _149 + _203;
    float _207 = _155 * 2.0;
    float _209 = _153 + _155;
    float _211 = _155 + _151;
    float _213 = exp2(_187);
    float _215 = _155 + (-0.5);
    float _217 = _153 + _151;
    float _219 = _151 * 2.0;
    bool _221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _223 = isnan(1.0);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _229 = _225 || _227;
    float _231 = _205 * _185;
    bool _233 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _235 = isnan(0.0);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _241 = _237 || _239;
    float _243 = floor(_207);
    float _245 = _211 + (-1.0);
    float _247 = _163 * _189;
    float _249 = _209 + (-1.0);
    float _251 = _217 + (-1.0);
    float _253 = 1.0 / _183;
    float _255 = -_213;
    float _257 = _255 + 1.0;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _261 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _263 = _241 ? _257 : 0.0;
    float _265 = 1.0 / _179;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _269 = 1.0 + _267;
    bool _271 = _243 > 0.0;
    float _273 = _151 + (-0.5);
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _149 + _275;
    bool _279 = _243 >= 0.0;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    float _289 = 1.0 / _269;
    float _291 = _153 + (-0.5);
    float _293 = _153 * 2.0;
    float _295 = _167 * _253;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _297;
    float _301 = floor(_293);
    float _303 = _277 * _265;
    int _305 = _287 ? 0 : 1;
    float _307 = fma(_299, _303, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _309 = ~_305;
    int _311 = _309 + 1;
    int _313 = _311 + 1;
    float _315 = floor(_219);
    int _317 = _313;
    if (_229)
    {
        float _319 = _263 * _289;
        _101 = _319;
    }
    float _321 = _101;
    float _323 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (!_271)
    {
        int _325 = ~_305;
        int _327 = _325 + 1;
        _317 = _327;
    }
    int _329 = _317;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_149);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _351 = _301 > 0.0;
    float _353 = fma(_333, _231, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _355 = _301 >= 0.0;
    bool _357 = isnan(_301);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _373 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_149);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_345;
    float _387 = _385 + 1.0;
    float _389 = fma(_367, _231, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _391 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_149);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_349, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _405 = _315 > 0.0;
    float _407 = fma(_371, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _409 = _315 >= 0.0;
    bool _411 = isnan(_315);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = -_401;
    float _425 = _423 + 1.0;
    bool _427 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_149);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_383;
    float _441 = _439 + 1.0;
    float _443 = fma(_421, _303, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _445 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_149);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _401 * _387;
    float _459 = _383 * _425;
    bool _461 = !_193;
    int _463 = _461 ? 0 : 1;
    float _465 = in.m_35.x;
    float _467 = in.m_35.y;
    float _469 = in.m_35.z;
    float _471 = _437 * _441;
    float _473 = -_437;
    float _475 = _473 + 1.0;
    int _477 = abs(_463);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = _455 * _475;
    float _489 = fma(_481, _295, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = float(_329);
    float _493 = fma(_485, _295, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = float(_477);
    float _497 = _353 * _487;
    bool _499 = !_201;
    int _501 = _499 ? 0 : 1;
    float _503 = -_455;
    float _505 = _503 + 1.0;
    int _507 = _363 ? 0 : 1;
    float _509 = _495 * _491;
    int _511 = abs(_501);
    float _513 = _389 * _487;
    int _515 = ~_507;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _523 = _509 * (-2.0);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    int _527 = _519;
    if (!_351)
    {
        int _529 = ~_507;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = fma(_523, _465, _465);
    bool _537 = !_197;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_403, _471, _521);
    float _543 = float(_511);
    float _545 = fma(_261, _523, _261);
    float _547 = float(_533);
    float _549 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[196].x, _535);
    int _551 = abs(_539);
    float _553 = fma(_307, _459, _541);
    int _555 = _417 ? 0 : 1;
    float _557 = _543 * _547;
    float _559 = fma(_545, _321, _549);
    float _561 = fma(_407, _471, _525);
    int _563 = ~_555;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * (-2.0);
    int _571 = _567;
    if (!_405)
    {
        int _573 = ~_555;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _559 * 0.15915493667125701904296875;
    float _581 = float(_551);
    float _583 = fma(_569, _469, _469);
    float _585 = float(_577);
    float _587 = as_type<float>(int(gl_VertexIndex));
    float _589 = fma(_323, _569, _323);
    float _591 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[196].z, _583);
    float _593 = fma(_489, _457, _553);
    float _595 = _581 * _585;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = fma(_589, _321, _591);
    float _603 = fma(_443, _459, _561);
    float _605 = _595 * (-2.0);
    float _607 = in.m_26.x;
    float _609 = in.m_26.y;
    float _611 = in.m_26.z;
    float _613 = _601 * 0.15915493667125701904296875;
    float _615 = _579 * 6.283185482025146484375;
    float _617 = sin(_615);
    float _619 = fma(_605, _467, _467);
    float _621 = fma(_259, _605, _259);
    float _623 = fma(_493, _457, _603);
    float _625 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _627 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _623);
    float _629 = _579 * 6.283185482025146484375;
    float _631 = cos(_629);
    float _633 = fma(_621, _321, _625);
    float _635 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _593);
    float _637 = _633 * 0.15915493667125701904296875;
    int _639 = as_type<int>(_587) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_587) & 2;
    bool _645 = _643 != 0;
    float _647 = _613 * 6.283185482025146484375;
    float _649 = sin(_647);
    float _651 = _635 * _597;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _627 * _599;
    bool _659 = !_645;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = _609 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _609 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _613 * 6.283185482025146484375;
    float _669 = cos(_667);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _609 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _679 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = _673 * _671;
    float _683 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _685 = _637 * 6.283185482025146484375;
    float _687 = sin(_685);
    float _689 = _617 * _649;
    float _691 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _693 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _695 = _679 * _677;
    float _697 = _631 * _649;
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _703 = _637 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _631 * _669;
    float _709 = _617 * _669;
    float _711 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[6].z, _693);
    float _713 = _701 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _715 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _719 = fma(_687, _689, _707);
    float _721 = -_697;
    float _723 = fma(_687, _709, _721);
    float _725 = -_709;
    float _727 = fma(_687, _697, _725);
    float _729 = _719 * _695;
    float _731 = _723 * _695;
    float _733 = _705 * _681;
    float _735 = _617 * _705;
    float _737 = _631 * _705;
    float _739 = fma(_649, _733, _729);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _687 * _681;
    float _745 = fma(_687, _707, _689);
    float _747 = fma(_669, _733, _731);
    float _749 = fma(_727, _741, _739);
    float _751 = -_743;
    float _753 = fma(_735, _695, _751);
    float _755 = fma(_745, _741, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _759 = _749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _761 = fma(_737, _741, _753);
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _765 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[9].x, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[8].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[10].x, _763);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[9].z, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[8].z, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[10].z, _769);
    float _777 = _713 + _771;
    float _779 = _715 + _773;
    float _781 = _717 + _775;
    float _783 = _777 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _785 = _777 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _787 = _777 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _789 = _777 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _783);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _785);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _787);
    float _797 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[1].z, _791);
    float _801 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[0].z, _793);
    float _803 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _805 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[3].z, _797);
    float _807 = _799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _809 = _801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _817 = _807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _819 = _807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[5].x, _815);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[6].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _825);
    float _835 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _827);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _829);
    float _839 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _831);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _835);
    float _845 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _841 + _845;
    float _859 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _857 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _859;
    out.m_42.y = _855;
    out.m_42.z = _861;
    out.m_42.w = _851;
    out.gl_Position.x = _843;
    out.gl_Position.y = _839;
    out.gl_Position.z = _841;
    out.gl_Position.w = _845;
    out.m_44.z = _863;
    out.m_44.w = _845;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _141 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _920 = as_type<float>(_79);
        out.gl_Position.z = _920;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _99 = 0.0;
    float _101 = _97;
    if (_93)
    {
        float _103 = float(_63);
        _99 = _103;
    }
    float _105 = _99;
    bool _107 = _97 >= _105;
    bool _109 = !_93;
    bool _111 = _107 || _109;
    if (_111)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _73;
    if (_111)
    {
        out.m_29.x = 0.0;
    }
    if (_111)
    {
        float _115 = _113 * 5.0;
        _81 = as_type<int>(_115);
    }
    int _117 = _81;
    if (_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _989 = as_type<float>(_117);
        out.gl_Position.z = _989;
    }
    if (_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _119 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _121 = !_119;
    float _139;
    if (!_121)
    {
        float _123 = in.m_33.x;
        float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _127 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _129 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _131 = _129 * _125;
        float _133 = floor(_131);
        float _135 = -_133;
        float _137 = _131 + _135;
        _139 = _137;
        _141 = true;
    }
    else
    {
        float _143 = float(_63);
        float _145 = 1.0 / _143;
        float _147 = _97 * _145;
        _139 = _147;
    }
    _141 = false;
    float _149 = _139;
    float _151 = in.m_33.x;
    float _153 = in.m_33.y;
    float _155 = in.m_33.z;
    float _157 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _159 = log2(_157);
    float _161 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _163 = _149 + _161;
    float _165 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _167 = _149 + _165;
    float _169 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _171 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _169;
    float _173 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _175 = _173 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _177 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _179 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _177;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _183 = _181 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _185 = 1.0 / _171;
    float _187 = _159 * _97;
    float _189 = 1.0 / _175;
    int _191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _193 = _191 != 0;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _201 = _199 != 0;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _149 + _203;
    float _207 = _155 * 2.0;
    float _209 = _153 + _155;
    float _211 = _155 + _151;
    float _213 = exp2(_187);
    float _215 = _155 + (-0.5);
    float _217 = _153 + _151;
    float _219 = _151 * 2.0;
    bool _221 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _223 = isnan(1.0);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _229 = _225 || _227;
    float _231 = _205 * _185;
    bool _233 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _235 = isnan(0.0);
    bool _237 = _233 || _235;
    bool _239 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _241 = _237 || _239;
    float _243 = floor(_207);
    float _245 = _211 + (-1.0);
    float _247 = _163 * _189;
    float _249 = _209 + (-1.0);
    float _251 = _217 + (-1.0);
    float _253 = 1.0 / _183;
    float _255 = -_213;
    float _257 = _255 + 1.0;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _261 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _263 = _241 ? _257 : 0.0;
    float _265 = 1.0 / _179;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _269 = 1.0 + _267;
    bool _271 = _243 > 0.0;
    float _273 = _151 + (-0.5);
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _149 + _275;
    bool _279 = _243 >= 0.0;
    bool _281 = isnan(_243);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    float _289 = 1.0 / _269;
    float _291 = _153 + (-0.5);
    float _293 = _153 * 2.0;
    float _295 = _167 * _253;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _297;
    float _301 = floor(_293);
    float _303 = _277 * _265;
    int _305 = _287 ? 0 : 1;
    float _307 = fma(_299, _303, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _309 = ~_305;
    int _311 = _309 + 1;
    int _313 = _311 + 1;
    float _315 = floor(_219);
    int _317 = _313;
    if (_229)
    {
        float _319 = _263 * _289;
        _101 = _319;
    }
    float _321 = _101;
    float _323 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    if (!_271)
    {
        int _325 = ~_305;
        int _327 = _325 + 1;
        _317 = _327;
    }
    int _329 = _317;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _331;
    bool _335 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _337 = isnan(_149);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _351 = _301 > 0.0;
    float _353 = fma(_333, _231, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _355 = _301 >= 0.0;
    bool _357 = isnan(_301);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _373 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _375 = isnan(_149);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -_345;
    float _387 = _385 + 1.0;
    float _389 = fma(_367, _231, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _391 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _393 = isnan(_149);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = fma(_349, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _405 = _315 > 0.0;
    float _407 = fma(_371, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _409 = _315 >= 0.0;
    bool _411 = isnan(_315);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _419;
    float _423 = -_401;
    float _425 = _423 + 1.0;
    bool _427 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_149);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -_383;
    float _441 = _439 + 1.0;
    float _443 = fma(_421, _303, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _445 = _149 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_149);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = _401 * _387;
    float _459 = _383 * _425;
    bool _461 = !_193;
    int _463 = _461 ? 0 : 1;
    float _465 = in.m_35.x;
    float _467 = in.m_35.y;
    float _469 = in.m_35.z;
    float _471 = _437 * _441;
    float _473 = -_437;
    float _475 = _473 + 1.0;
    int _477 = abs(_463);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = _455 * _475;
    float _489 = fma(_481, _295, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = float(_329);
    float _493 = fma(_485, _295, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = float(_477);
    float _497 = _353 * _487;
    bool _499 = !_201;
    int _501 = _499 ? 0 : 1;
    float _503 = -_455;
    float _505 = _503 + 1.0;
    int _507 = _363 ? 0 : 1;
    float _509 = _495 * _491;
    int _511 = abs(_501);
    float _513 = _389 * _487;
    int _515 = ~_507;
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].x, _497);
    float _523 = _509 * (-2.0);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[143].y, _513);
    int _527 = _519;
    if (!_351)
    {
        int _529 = ~_507;
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = fma(_523, _465, _465);
    bool _537 = !_197;
    int _539 = _537 ? 0 : 1;
    float _541 = fma(_403, _471, _521);
    float _543 = float(_511);
    float _545 = fma(_261, _523, _261);
    float _547 = float(_533);
    float _549 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[196].x, _535);
    int _551 = abs(_539);
    float _553 = fma(_307, _459, _541);
    int _555 = _417 ? 0 : 1;
    float _557 = _543 * _547;
    float _559 = fma(_545, _321, _549);
    float _561 = fma(_407, _471, _525);
    int _563 = ~_555;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * (-2.0);
    int _571 = _567;
    if (!_405)
    {
        int _573 = ~_555;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _559 * 0.15915493667125701904296875;
    float _581 = float(_551);
    float _583 = fma(_569, _469, _469);
    float _585 = float(_577);
    float _587 = as_type<float>(int(gl_VertexIndex));
    float _589 = fma(_323, _569, _323);
    float _591 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[196].z, _583);
    float _593 = fma(_489, _457, _553);
    float _595 = _581 * _585;
    float _597 = in.m_40.x;
    float _599 = in.m_40.y;
    float _601 = fma(_589, _321, _591);
    float _603 = fma(_443, _459, _561);
    float _605 = _595 * (-2.0);
    float _607 = in.m_26.x;
    float _609 = in.m_26.y;
    float _611 = in.m_26.z;
    float _613 = _601 * 0.15915493667125701904296875;
    float _615 = _579 * 6.283185482025146484375;
    float _617 = sin(_615);
    float _619 = fma(_605, _467, _467);
    float _621 = fma(_259, _605, _259);
    float _623 = fma(_493, _457, _603);
    float _625 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _627 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].y, _623);
    float _629 = _579 * 6.283185482025146484375;
    float _631 = cos(_629);
    float _633 = fma(_621, _321, _625);
    float _635 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[147].x, _593);
    float _637 = _633 * 0.15915493667125701904296875;
    int _639 = as_type<int>(_587) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_587) & 2;
    bool _645 = _643 != 0;
    float _647 = _613 * 6.283185482025146484375;
    float _649 = sin(_647);
    float _651 = _635 * _597;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _627 * _599;
    bool _659 = !_645;
    float _661 = _659 ? (-0.5) : 0.5;
    float _663 = _609 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _665 = _609 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = _613 * 6.283185482025146484375;
    float _669 = cos(_667);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _673 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _609 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _677 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _661);
    float _679 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = _673 * _671;
    float _683 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[4].x, _663);
    float _685 = _637 * 6.283185482025146484375;
    float _687 = sin(_685);
    float _689 = _617 * _649;
    float _691 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _693 = fma(_607, (*spvDescriptorSet0.vp_c10)._m0[6].x, _675);
    float _695 = _679 * _677;
    float _697 = _631 * _649;
    float _699 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _701 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[5].z, _691);
    float _703 = _637 * 6.283185482025146484375;
    float _705 = cos(_703);
    float _707 = _631 * _669;
    float _709 = _617 * _669;
    float _711 = fma(_611, (*spvDescriptorSet0.vp_c10)._m0[6].z, _693);
    float _713 = _701 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _715 = _699 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _717 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _719 = fma(_687, _689, _707);
    float _721 = -_697;
    float _723 = fma(_687, _709, _721);
    float _725 = -_709;
    float _727 = fma(_687, _697, _725);
    float _729 = _719 * _695;
    float _731 = _723 * _695;
    float _733 = _705 * _681;
    float _735 = _617 * _705;
    float _737 = _631 * _705;
    float _739 = fma(_649, _733, _729);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _687 * _681;
    float _745 = fma(_687, _707, _689);
    float _747 = fma(_669, _733, _731);
    float _749 = fma(_727, _741, _739);
    float _751 = -_743;
    float _753 = fma(_735, _695, _751);
    float _755 = fma(_745, _741, _747);
    float _757 = _749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _759 = _749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _761 = fma(_737, _741, _753);
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _765 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[9].x, _757);
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[8].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[10].x, _763);
    float _771 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[9].z, _765);
    float _773 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[8].z, _767);
    float _775 = fma(_761, (*spvDescriptorSet0.vp_c10)._m0[10].z, _769);
    float _777 = _713 + _771;
    float _779 = _715 + _773;
    float _781 = _717 + _775;
    float _783 = _777 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _785 = _777 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _787 = _777 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _789 = _777 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _791 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _783);
    float _793 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _785);
    float _795 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _787);
    float _797 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _789);
    float _799 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[1].z, _791);
    float _801 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[0].z, _793);
    float _803 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[2].z, _795);
    float _805 = fma(_781, (*spvDescriptorSet0.vp_c8)._m0[3].z, _797);
    float _807 = _799 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _809 = _801 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _811 = _803 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _817 = _807 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _819 = _807 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _821 = _807 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[5].x, _815);
    float _825 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[6].x, _817);
    float _827 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[4].x, _819);
    float _829 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _831 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _823);
    float _833 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[6].z, _825);
    float _835 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _827);
    float _837 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _829);
    float _839 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[5].w, _831);
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[6].w, _833);
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[4].w, _835);
    float _845 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[7].w, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _855 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _857 = _841 + _845;
    float _859 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _863 = _857 * 0.5;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _859;
    out.m_42.y = _855;
    out.m_42.z = _861;
    out.m_42.w = _851;
    out.gl_Position.x = _843;
    out.gl_Position.y = _839;
    out.gl_Position.z = _841;
    out.gl_Position.w = _845;
    out.m_44.z = _863;
    out.m_44.w = _845;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

