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
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(1)]];
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _247 = false;
    bool _145 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1190 = as_type<float>(_83);
        out.gl_Position.z = _1190;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_33.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_31.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1260 = as_type<float>(_121);
        out.gl_Position.z = _1260;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _123 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _125 = !_123;
    float _143;
    if (!_125)
    {
        float _127 = in.m_35.x;
        float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _131 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _133 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _135 = _133 * _129;
        float _137 = floor(_135);
        float _139 = -_137;
        float _141 = _135 + _139;
        _143 = _141;
        _145 = true;
    }
    else
    {
        float _147 = float(_67);
        float _149 = 1.0 / _147;
        float _151 = _101 * _149;
        _143 = _151;
    }
    _145 = false;
    float _153 = _143;
    float _155 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _157 = _153 + _155;
    bool _159 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _161 = isnan(_153);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _167 = _163 || _165;
    float _169 = float(_167);
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _171;
    float _175 = -_169;
    float _177 = _175 + 1.0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _181 = 1.0 / _173;
    float _183 = _157 * _181;
    bool _185 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _187 = isnan(_153);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _193 = _189 || _191;
    float _195 = float(_193);
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _201;
    float _205 = _195 * _177;
    float _207 = fma(_199, _183, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_203, _183, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = -_195;
    float _213 = _211 + 1.0;
    float _215 = _207 * _205;
    float _217 = _209 * _205;
    float _219 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].x, _215);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].y, _217);
    float _223 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].x, _219);
    float _225 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].y, _221);
    bool _227 = !_179;
    float _245;
    if (!_227)
    {
        float _229 = in.m_35.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_67);
        float _251 = 1.0 / _249;
        float _253 = _101 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = in.m_35.z;
    float _259 = in.m_35.x;
    float _261 = in.m_35.y;
    float _263 = as_type<float>(int(gl_VertexIndex));
    float _265 = in.m_40.x;
    float _267 = in.m_40.y;
    float _269 = _257 * 2.0;
    float _271 = _259 * 2.0;
    float _273 = _261 * 2.0;
    float _275 = floor(_269);
    int _277 = as_type<int>(_263) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_263) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    float _289 = _223 * _265;
    float _291 = floor(_271);
    float _293 = _225 * _267;
    float _295 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _297 = floor(_273);
    bool _299 = _275 > 0.0;
    bool _301 = _275 >= 0.0;
    bool _303 = isnan(_275);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _291 > 0.0;
    float _317 = 1.0 / _313;
    bool _319 = _291 >= 0.0;
    bool _321 = isnan(_291);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    int _329 = _309 ? 0 : 1;
    int _331 = _327 ? 0 : 1;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _335 = _333 != 0;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    int _341 = ~_329;
    int _343 = _341 + 1;
    int _345 = _343 + 1;
    bool _347 = _297 >= 0.0;
    bool _349 = isnan(_297);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    int _357 = _345;
    if (!_299)
    {
        int _359 = ~_329;
        int _361 = _359 + 1;
        _357 = _361;
    }
    int _363 = _357;
    int _365 = ~_331;
    int _367 = _365 + 1;
    int _369 = _367 + 1;
    int _371 = _369;
    if (!_315)
    {
        int _373 = ~_331;
        int _375 = _373 + 1;
        _371 = _375;
    }
    int _377 = _371;
    float _379 = _257 + _259;
    int _381 = _355 ? 0 : 1;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _397 = _395 != 0;
    float _399 = _261 + _257;
    float _401 = _379 + (-1.0);
    float _403 = _385 * _317;
    float _405 = float(_363);
    float _407 = _399 + (-1.0);
    float _409 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _411 = !_389;
    int _413 = _411 ? 0 : 1;
    float _415 = _257 + (-0.5);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _419 = _297 > 0.0;
    float _421 = _339 * _101;
    float _423 = _261 + _259;
    int _425 = abs(_413);
    float _427 = _423 + (-1.0);
    float _429 = exp2(_421);
    bool _431 = !_393;
    int _433 = _431 ? 0 : 1;
    float _435 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = in.m_42.x;
    float _449 = in.m_42.y;
    float _451 = in.m_42.z;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _455 = 1.0 + _453;
    int _457 = abs(_433);
    float _459 = 1.0 / _455;
    bool _461 = !_397;
    int _463 = _461 ? 0 : 1;
    float _465 = float(_425);
    int _467 = abs(_463);
    float _469 = -_429;
    float _471 = _469 + 1.0;
    int _473 = ~_381;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _465 * _405;
    float _481 = float(_457);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _255 + _483;
    float _487 = float(_377);
    int _489 = _477;
    if (!_419)
    {
        int _491 = ~_381;
        int _493 = _491 + 1;
        _489 = _493;
    }
    int _495 = _489;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _481 * _487;
    float _509 = float(_467);
    float _511 = _505 ? _471 : 0.0;
    float _513 = fma(_403, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = _479 * (-2.0);
    float _517 = _507 * (-2.0);
    float _519 = float(_495);
    if (_445)
    {
        float _521 = _511 * _459;
        _103 = _521;
    }
    float _523 = _103;
    float _525 = fma(_435, _515, _435);
    float _527 = fma(_515, _447, _447);
    float _529 = fma(_417, _517, _417);
    float _531 = fma(_517, _449, _449);
    bool _533 = _259 > 0.5;
    float _535 = _259 + (-0.5);
    bool _537 = _261 > 0.5;
    float _539 = _261 + (-0.5);
    float _541 = _509 * _519;
    float _543 = in.m_28.x;
    float _545 = in.m_28.y;
    float _547 = in.m_28.z;
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _527);
    float _551 = _541 * (-2.0);
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _531);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = fma(_409, _551, _409);
    bool _561 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_255);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = fma(_525, _523, _549);
    bool _575 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_255);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _557;
    float _589 = fma(_551, _451, _451);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    float _599 = _573 * 0.15915493667125701904296875;
    bool _601 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_255);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -_585;
    float _615 = _613 + 1.0;
    float _617 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _589);
    float _619 = 1.0 / _593;
    float _621 = _585 * _597;
    bool _623 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_255);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _611 * _615;
    float _637 = -_611;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _523, _553);
    float _643 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _647 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = _633 * _639;
    float _655 = _641 * 0.15915493667125701904296875;
    float _657 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    float _659 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _645);
    float _661 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _663 = fma(_559, _523, _617);
    float _665 = _651 * _587;
    float _667 = _513 * _653;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _255 + _669;
    float _673 = -_633;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _677;
    float _681 = _599 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _663 * 0.15915493667125701904296875;
    float _687 = fma(_665, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _691 = _679 * _619;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _255 + _693;
    float _697 = fma(_687, _635, _689);
    float _699 = _599 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = fma(_691, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _705 = !_279;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _657);
    bool _711 = !_283;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    float _717 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _661);
    float _719 = -_707;
    int _721 = _533 ? as_type<int>(_719) : as_type<int>(_707);
    float _723 = _655 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = -_713;
    int _731 = _537 ? as_type<int>(_729) : as_type<int>(_713);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _707);
    bool _735 = !_287;
    float _737 = _735 ? _707 : as_type<float>(_721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _741 = !_335;
    float _743 = _741 ? _713 : as_type<float>(_731);
    float _745 = _727 * _733;
    float _747 = _655 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_703, _621, _697);
    float _753 = _295 * _739;
    float _755 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _685 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _701 * _725;
    float _785 = _685 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _683 * _749;
    float _791 = -_783;
    float _793 = fma(_781, _789, _791);
    float _795 = -_789;
    float _797 = fma(_781, _783, _795);
    float _799 = _683 * _725;
    float _801 = _701 * _749;
    float _803 = _781 * _753;
    float _805 = _725 * _787;
    float _807 = _749 * _787;
    float _809 = _787 * _753;
    float _811 = fma(_781, _801, _799);
    float _813 = fma(_781, _799, _801);
    float _815 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _817 = _701 * _809;
    float _819 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _821 = -_803;
    float _823 = fma(_807, _745, _821);
    float _825 = _815 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = _683 * _809;
    float _829 = fma(_811, _745, _817);
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _835 = _815 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _837 = fma(_793, _745, _827);
    float _839 = fma(_797, _831, _829);
    float _841 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].z, _833);
    float _843 = fma(_805, _831, _823);
    float _845 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].x, _835);
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _851 = fma(_813, _831, _837);
    float _853 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].z, _845);
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[10].x, _847);
    float _857 = 1.0 / _849;
    float _859 = _839 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _855);
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[8].x, _859);
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = _863 + _849;
    float _873 = _755 + _865;
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    float _877 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _819 + _875;
    float _881 = _815 + _877;
    float _883 = _871 * _857;
    float _885 = _883 * 0.5;
    float _887 = _871;
    float _889 = _873;
    float _891 = _881;
    float _893 = _879;
    if (_765)
    {
        _887 = _873;
    }
    float _895 = _887;
    float _897 = _895;
    if (!_765)
    {
        float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _901 = _815 + _899;
        float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _905 = _819 + _903;
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _909 = _901 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _913 = _755 + _911;
        float _915 = fma(_905, _905, _909);
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _919 = fma(_913, _913, _915);
        float _921 = sqrt(_919);
        float _923 = _907 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _925 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _927 = _925 * _917;
        float _929 = _923 * _927;
        float _931 = fma(_875, _929, _819);
        float _933 = fma(_877, _929, _815);
        float _935 = fma(_865, _929, _755);
        _889 = _921;
        _891 = _933;
        _893 = _931;
        _897 = _935;
    }
    float _937 = _889;
    float _939 = _891;
    float _941 = _893;
    float _943 = _897;
    float _945 = _937;
    if (_777)
    {
        _945 = 1.0;
    }
    float _947 = _945;
    float _949 = _947;
    if (!_777)
    {
        float _951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _955 = _951 * 0.15915493667125701904296875;
        float _957 = _953 * 0.15915493667125701904296875;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _961 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _959);
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _955 * 6.283185482025146484375;
        float _969 = sin(_967);
        float _971 = 1.0 / _965;
        float _973 = _957 * 6.283185482025146484375;
        float _975 = cos(_973);
        float _977 = _969 * _971;
        float _979 = _957 * 6.283185482025146484375;
        float _981 = sin(_979);
        float _983 = _975 * _977;
        float _985 = 1.0 / _961;
        float _987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _987;
        float _991 = 1.0 / _983;
        float _993 = 1.0 / _989;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _997 = _985 * _995;
        float _999 = _981 * _991;
        float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1003 = fma(_999, _997, _1001);
        float _1005 = _1003 * _993;
        float _1007 = precise::clamp(_1005, 0.0, 1.0);
        _949 = _1007;
    }
    float _1009 = _949;
    float _1011 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1025 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1031 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1033 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1029);
    float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _737 + 0.5;
    float _1053 = -_743;
    float _1055 = _1053 + 0.5;
    float _1057 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1059 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1061 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    float _1065 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1061);
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1077 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1079 = _1067 * _1023;
    float _1081 = _1069 * _1039;
    float _1083 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1095 = _1009 > 0.0;
    bool _1097 = isnan(_1009);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1127 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    out.m_44.x = _1117;
    out.m_44.y = _1119;
    out.m_44.z = _1121;
    out.m_44.w = _1115;
    out.m_46.x = _1079;
    out.m_46.y = _1081;
    out.m_48.x = _1109;
    out.m_48.y = _1111;
    out.m_48.z = _1113;
    out.m_48.w = _1085;
    out.m_31.x = _1123;
    out.gl_Position.x = _1125;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1129;
    out.gl_Position.w = _1131;
    if (_1103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_31.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _247 = false;
    bool _145 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1190 = as_type<float>(_83);
        out.gl_Position.z = _1190;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_33.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_31.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1260 = as_type<float>(_121);
        out.gl_Position.z = _1260;
    }
    if (_113)
    {
        return out;
    }
    bool _123 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _125 = !_123;
    float _143;
    if (!_125)
    {
        float _127 = in.m_35.x;
        float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _131 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _133 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _135 = _133 * _129;
        float _137 = floor(_135);
        float _139 = -_137;
        float _141 = _135 + _139;
        _143 = _141;
        _145 = true;
    }
    else
    {
        float _147 = float(_67);
        float _149 = 1.0 / _147;
        float _151 = _101 * _149;
        _143 = _151;
    }
    _145 = false;
    float _153 = _143;
    float _155 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _157 = _153 + _155;
    bool _159 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _161 = isnan(_153);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _167 = _163 || _165;
    float _169 = float(_167);
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _171;
    float _175 = -_169;
    float _177 = _175 + 1.0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _181 = 1.0 / _173;
    float _183 = _157 * _181;
    bool _185 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _187 = isnan(_153);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _193 = _189 || _191;
    float _195 = float(_193);
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _201;
    float _205 = _195 * _177;
    float _207 = fma(_199, _183, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_203, _183, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = -_195;
    float _213 = _211 + 1.0;
    float _215 = _207 * _205;
    float _217 = _209 * _205;
    float _219 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].x, _215);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].y, _217);
    float _223 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].x, _219);
    float _225 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].y, _221);
    bool _227 = !_179;
    float _245;
    if (!_227)
    {
        float _229 = in.m_35.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_67);
        float _251 = 1.0 / _249;
        float _253 = _101 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = in.m_35.z;
    float _259 = in.m_35.x;
    float _261 = in.m_35.y;
    float _263 = as_type<float>(int(gl_VertexIndex));
    float _265 = in.m_40.x;
    float _267 = in.m_40.y;
    float _269 = _257 * 2.0;
    float _271 = _259 * 2.0;
    float _273 = _261 * 2.0;
    float _275 = floor(_269);
    int _277 = as_type<int>(_263) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_263) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    float _289 = _223 * _265;
    float _291 = floor(_271);
    float _293 = _225 * _267;
    float _295 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _297 = floor(_273);
    bool _299 = _275 > 0.0;
    bool _301 = _275 >= 0.0;
    bool _303 = isnan(_275);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _291 > 0.0;
    float _317 = 1.0 / _313;
    bool _319 = _291 >= 0.0;
    bool _321 = isnan(_291);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    int _329 = _309 ? 0 : 1;
    int _331 = _327 ? 0 : 1;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _335 = _333 != 0;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    int _341 = ~_329;
    int _343 = _341 + 1;
    int _345 = _343 + 1;
    bool _347 = _297 >= 0.0;
    bool _349 = isnan(_297);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    int _357 = _345;
    if (!_299)
    {
        int _359 = ~_329;
        int _361 = _359 + 1;
        _357 = _361;
    }
    int _363 = _357;
    int _365 = ~_331;
    int _367 = _365 + 1;
    int _369 = _367 + 1;
    int _371 = _369;
    if (!_315)
    {
        int _373 = ~_331;
        int _375 = _373 + 1;
        _371 = _375;
    }
    int _377 = _371;
    float _379 = _257 + _259;
    int _381 = _355 ? 0 : 1;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _397 = _395 != 0;
    float _399 = _261 + _257;
    float _401 = _379 + (-1.0);
    float _403 = _385 * _317;
    float _405 = float(_363);
    float _407 = _399 + (-1.0);
    float _409 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _411 = !_389;
    int _413 = _411 ? 0 : 1;
    float _415 = _257 + (-0.5);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _419 = _297 > 0.0;
    float _421 = _339 * _101;
    float _423 = _261 + _259;
    int _425 = abs(_413);
    float _427 = _423 + (-1.0);
    float _429 = exp2(_421);
    bool _431 = !_393;
    int _433 = _431 ? 0 : 1;
    float _435 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = in.m_42.x;
    float _449 = in.m_42.y;
    float _451 = in.m_42.z;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _455 = 1.0 + _453;
    int _457 = abs(_433);
    float _459 = 1.0 / _455;
    bool _461 = !_397;
    int _463 = _461 ? 0 : 1;
    float _465 = float(_425);
    int _467 = abs(_463);
    float _469 = -_429;
    float _471 = _469 + 1.0;
    int _473 = ~_381;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _465 * _405;
    float _481 = float(_457);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _255 + _483;
    float _487 = float(_377);
    int _489 = _477;
    if (!_419)
    {
        int _491 = ~_381;
        int _493 = _491 + 1;
        _489 = _493;
    }
    int _495 = _489;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _481 * _487;
    float _509 = float(_467);
    float _511 = _505 ? _471 : 0.0;
    float _513 = fma(_403, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = _479 * (-2.0);
    float _517 = _507 * (-2.0);
    float _519 = float(_495);
    if (_445)
    {
        float _521 = _511 * _459;
        _103 = _521;
    }
    float _523 = _103;
    float _525 = fma(_435, _515, _435);
    float _527 = fma(_515, _447, _447);
    float _529 = fma(_417, _517, _417);
    float _531 = fma(_517, _449, _449);
    bool _533 = _259 > 0.5;
    float _535 = _259 + (-0.5);
    bool _537 = _261 > 0.5;
    float _539 = _261 + (-0.5);
    float _541 = _509 * _519;
    float _543 = in.m_28.x;
    float _545 = in.m_28.y;
    float _547 = in.m_28.z;
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _527);
    float _551 = _541 * (-2.0);
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _531);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = fma(_409, _551, _409);
    bool _561 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_255);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = fma(_525, _523, _549);
    bool _575 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_255);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _557;
    float _589 = fma(_551, _451, _451);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    float _599 = _573 * 0.15915493667125701904296875;
    bool _601 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_255);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -_585;
    float _615 = _613 + 1.0;
    float _617 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _589);
    float _619 = 1.0 / _593;
    float _621 = _585 * _597;
    bool _623 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_255);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _611 * _615;
    float _637 = -_611;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _523, _553);
    float _643 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _647 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = _633 * _639;
    float _655 = _641 * 0.15915493667125701904296875;
    float _657 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    float _659 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _645);
    float _661 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _663 = fma(_559, _523, _617);
    float _665 = _651 * _587;
    float _667 = _513 * _653;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _255 + _669;
    float _673 = -_633;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _677;
    float _681 = _599 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _663 * 0.15915493667125701904296875;
    float _687 = fma(_665, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _691 = _679 * _619;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _255 + _693;
    float _697 = fma(_687, _635, _689);
    float _699 = _599 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = fma(_691, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _705 = !_279;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _657);
    bool _711 = !_283;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    float _717 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _661);
    float _719 = -_707;
    int _721 = _533 ? as_type<int>(_719) : as_type<int>(_707);
    float _723 = _655 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = -_713;
    int _731 = _537 ? as_type<int>(_729) : as_type<int>(_713);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _707);
    bool _735 = !_287;
    float _737 = _735 ? _707 : as_type<float>(_721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _741 = !_335;
    float _743 = _741 ? _713 : as_type<float>(_731);
    float _745 = _727 * _733;
    float _747 = _655 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_703, _621, _697);
    float _753 = _295 * _739;
    float _755 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _685 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _701 * _725;
    float _785 = _685 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _683 * _749;
    float _791 = -_783;
    float _793 = fma(_781, _789, _791);
    float _795 = -_789;
    float _797 = fma(_781, _783, _795);
    float _799 = _683 * _725;
    float _801 = _701 * _749;
    float _803 = _781 * _753;
    float _805 = _725 * _787;
    float _807 = _749 * _787;
    float _809 = _787 * _753;
    float _811 = fma(_781, _801, _799);
    float _813 = fma(_781, _799, _801);
    float _815 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _817 = _701 * _809;
    float _819 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _821 = -_803;
    float _823 = fma(_807, _745, _821);
    float _825 = _815 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = _683 * _809;
    float _829 = fma(_811, _745, _817);
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _835 = _815 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _837 = fma(_793, _745, _827);
    float _839 = fma(_797, _831, _829);
    float _841 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].z, _833);
    float _843 = fma(_805, _831, _823);
    float _845 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].x, _835);
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _851 = fma(_813, _831, _837);
    float _853 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].z, _845);
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[10].x, _847);
    float _857 = 1.0 / _849;
    float _859 = _839 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _855);
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[8].x, _859);
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = _863 + _849;
    float _873 = _755 + _865;
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    float _877 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _819 + _875;
    float _881 = _815 + _877;
    float _883 = _871 * _857;
    float _885 = _883 * 0.5;
    float _887 = _871;
    float _889 = _873;
    float _891 = _881;
    float _893 = _879;
    if (_765)
    {
        _887 = _873;
    }
    float _895 = _887;
    float _897 = _895;
    if (!_765)
    {
        float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _901 = _815 + _899;
        float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _905 = _819 + _903;
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _909 = _901 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _913 = _755 + _911;
        float _915 = fma(_905, _905, _909);
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _919 = fma(_913, _913, _915);
        float _921 = sqrt(_919);
        float _923 = _907 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _925 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _927 = _925 * _917;
        float _929 = _923 * _927;
        float _931 = fma(_875, _929, _819);
        float _933 = fma(_877, _929, _815);
        float _935 = fma(_865, _929, _755);
        _889 = _921;
        _891 = _933;
        _893 = _931;
        _897 = _935;
    }
    float _937 = _889;
    float _939 = _891;
    float _941 = _893;
    float _943 = _897;
    float _945 = _937;
    if (_777)
    {
        _945 = 1.0;
    }
    float _947 = _945;
    float _949 = _947;
    if (!_777)
    {
        float _951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _955 = _951 * 0.15915493667125701904296875;
        float _957 = _953 * 0.15915493667125701904296875;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _961 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _959);
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _955 * 6.283185482025146484375;
        float _969 = sin(_967);
        float _971 = 1.0 / _965;
        float _973 = _957 * 6.283185482025146484375;
        float _975 = cos(_973);
        float _977 = _969 * _971;
        float _979 = _957 * 6.283185482025146484375;
        float _981 = sin(_979);
        float _983 = _975 * _977;
        float _985 = 1.0 / _961;
        float _987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _987;
        float _991 = 1.0 / _983;
        float _993 = 1.0 / _989;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _997 = _985 * _995;
        float _999 = _981 * _991;
        float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1003 = fma(_999, _997, _1001);
        float _1005 = _1003 * _993;
        float _1007 = precise::clamp(_1005, 0.0, 1.0);
        _949 = _1007;
    }
    float _1009 = _949;
    float _1011 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1025 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1031 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1033 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1029);
    float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _737 + 0.5;
    float _1053 = -_743;
    float _1055 = _1053 + 0.5;
    float _1057 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1059 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1061 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    float _1065 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1061);
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1077 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1079 = _1067 * _1023;
    float _1081 = _1069 * _1039;
    float _1083 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1095 = _1009 > 0.0;
    bool _1097 = isnan(_1009);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1127 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    out.m_44.x = _1117;
    out.m_44.y = _1119;
    out.m_44.z = _1121;
    out.m_44.w = _1115;
    out.m_46.x = _1079;
    out.m_46.y = _1081;
    out.m_48.x = _1109;
    out.m_48.y = _1111;
    out.m_48.z = _1113;
    out.m_48.w = _1085;
    out.m_31.x = _1123;
    out.gl_Position.x = _1125;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1129;
    out.gl_Position.w = _1131;
    if (_1103)
    {
        return out;
    }
    out.m_31.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _247 = false;
    bool _145 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1190 = as_type<float>(_83);
        out.gl_Position.z = _1190;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_33.w;
    bool _89 = _87 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _91 = isnan(_87);
    bool _93 = _89 || _91;
    bool _95 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _97 = _93 || _95;
    float _99 = -_87;
    float _101 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _103 = _101;
    if (_97)
    {
        float _105 = float(_67);
        _77 = _105;
    }
    float _107 = _77;
    bool _109 = _101 >= _107;
    bool _111 = !_97;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_31.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _85 = as_type<int>(_119);
    }
    int _121 = _85;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1260 = as_type<float>(_121);
        out.gl_Position.z = _1260;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _123 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _125 = !_123;
    float _143;
    if (!_125)
    {
        float _127 = in.m_35.x;
        float _129 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _131 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _133 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _135 = _133 * _129;
        float _137 = floor(_135);
        float _139 = -_137;
        float _141 = _135 + _139;
        _143 = _141;
        _145 = true;
    }
    else
    {
        float _147 = float(_67);
        float _149 = 1.0 / _147;
        float _151 = _101 * _149;
        _143 = _151;
    }
    _145 = false;
    float _153 = _143;
    float _155 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _157 = _153 + _155;
    bool _159 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _161 = isnan(_153);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _167 = _163 || _165;
    float _169 = float(_167);
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _171;
    float _175 = -_169;
    float _177 = _175 + 1.0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _181 = 1.0 / _173;
    float _183 = _157 * _181;
    bool _185 = _153 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _187 = isnan(_153);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _193 = _189 || _191;
    float _195 = float(_193);
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _201;
    float _205 = _195 * _177;
    float _207 = fma(_199, _183, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _209 = fma(_203, _183, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _211 = -_195;
    float _213 = _211 + 1.0;
    float _215 = _207 * _205;
    float _217 = _209 * _205;
    float _219 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].x, _215);
    float _221 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[143].y, _217);
    float _223 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].x, _219);
    float _225 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[144].y, _221);
    bool _227 = !_179;
    float _245;
    if (!_227)
    {
        float _229 = in.m_35.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        float _249 = float(_67);
        float _251 = 1.0 / _249;
        float _253 = _101 * _251;
        _245 = _253;
    }
    _247 = false;
    float _255 = _245;
    float _257 = in.m_35.z;
    float _259 = in.m_35.x;
    float _261 = in.m_35.y;
    float _263 = as_type<float>(int(gl_VertexIndex));
    float _265 = in.m_40.x;
    float _267 = in.m_40.y;
    float _269 = _257 * 2.0;
    float _271 = _259 * 2.0;
    float _273 = _261 * 2.0;
    float _275 = floor(_269);
    int _277 = as_type<int>(_263) & 1;
    bool _279 = _277 != 0;
    int _281 = as_type<int>(_263) & 2;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _287 = _285 != 0;
    float _289 = _223 * _265;
    float _291 = floor(_271);
    float _293 = _225 * _267;
    float _295 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _297 = floor(_273);
    bool _299 = _275 > 0.0;
    bool _301 = _275 >= 0.0;
    bool _303 = isnan(_275);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _315 = _291 > 0.0;
    float _317 = 1.0 / _313;
    bool _319 = _291 >= 0.0;
    bool _321 = isnan(_291);
    bool _323 = _319 || _321;
    bool _325 = isnan(0.0);
    bool _327 = _323 || _325;
    int _329 = _309 ? 0 : 1;
    int _331 = _327 ? 0 : 1;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _335 = _333 != 0;
    float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _339 = log2(_337);
    int _341 = ~_329;
    int _343 = _341 + 1;
    int _345 = _343 + 1;
    bool _347 = _297 >= 0.0;
    bool _349 = isnan(_297);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    int _357 = _345;
    if (!_299)
    {
        int _359 = ~_329;
        int _361 = _359 + 1;
        _357 = _361;
    }
    int _363 = _357;
    int _365 = ~_331;
    int _367 = _365 + 1;
    int _369 = _367 + 1;
    int _371 = _369;
    if (!_315)
    {
        int _373 = ~_331;
        int _375 = _373 + 1;
        _371 = _375;
    }
    int _377 = _371;
    float _379 = _257 + _259;
    int _381 = _355 ? 0 : 1;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _383;
    int _387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _389 = _387 != 0;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _393 = _391 != 0;
    int _395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _397 = _395 != 0;
    float _399 = _261 + _257;
    float _401 = _379 + (-1.0);
    float _403 = _385 * _317;
    float _405 = float(_363);
    float _407 = _399 + (-1.0);
    float _409 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _411 = !_389;
    int _413 = _411 ? 0 : 1;
    float _415 = _257 + (-0.5);
    float _417 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _419 = _297 > 0.0;
    float _421 = _339 * _101;
    float _423 = _261 + _259;
    int _425 = abs(_413);
    float _427 = _423 + (-1.0);
    float _429 = exp2(_421);
    bool _431 = !_393;
    int _433 = _431 ? 0 : 1;
    float _435 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _437 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _445 = _441 || _443;
    float _447 = in.m_42.x;
    float _449 = in.m_42.y;
    float _451 = in.m_42.z;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _455 = 1.0 + _453;
    int _457 = abs(_433);
    float _459 = 1.0 / _455;
    bool _461 = !_397;
    int _463 = _461 ? 0 : 1;
    float _465 = float(_425);
    int _467 = abs(_463);
    float _469 = -_429;
    float _471 = _469 + 1.0;
    int _473 = ~_381;
    int _475 = _473 + 1;
    int _477 = _475 + 1;
    float _479 = _465 * _405;
    float _481 = float(_457);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _255 + _483;
    float _487 = float(_377);
    int _489 = _477;
    if (!_419)
    {
        int _491 = ~_381;
        int _493 = _491 + 1;
        _489 = _493;
    }
    int _495 = _489;
    bool _497 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _505 = _501 || _503;
    float _507 = _481 * _487;
    float _509 = float(_467);
    float _511 = _505 ? _471 : 0.0;
    float _513 = fma(_403, _485, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _515 = _479 * (-2.0);
    float _517 = _507 * (-2.0);
    float _519 = float(_495);
    if (_445)
    {
        float _521 = _511 * _459;
        _103 = _521;
    }
    float _523 = _103;
    float _525 = fma(_435, _515, _435);
    float _527 = fma(_515, _447, _447);
    float _529 = fma(_417, _517, _417);
    float _531 = fma(_517, _449, _449);
    bool _533 = _259 > 0.5;
    float _535 = _259 + (-0.5);
    bool _537 = _261 > 0.5;
    float _539 = _261 + (-0.5);
    float _541 = _509 * _519;
    float _543 = in.m_28.x;
    float _545 = in.m_28.y;
    float _547 = in.m_28.z;
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].x, _527);
    float _551 = _541 * (-2.0);
    float _553 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[196].y, _531);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _559 = fma(_409, _551, _409);
    bool _561 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = isnan(_255);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = fma(_525, _523, _549);
    bool _575 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _577 = isnan(_255);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _557;
    float _589 = fma(_551, _451, _451);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    float _599 = _573 * 0.15915493667125701904296875;
    bool _601 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _603 = isnan(_255);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -_585;
    float _615 = _613 + 1.0;
    float _617 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[196].z, _589);
    float _619 = 1.0 / _593;
    float _621 = _585 * _597;
    bool _623 = _255 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _625 = isnan(_255);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _611 * _615;
    float _637 = -_611;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _523, _553);
    float _643 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _645 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _647 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = _633 * _639;
    float _655 = _641 * 0.15915493667125701904296875;
    float _657 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _643);
    float _659 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _645);
    float _661 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _663 = fma(_559, _523, _617);
    float _665 = _651 * _587;
    float _667 = _513 * _653;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _255 + _669;
    float _673 = -_633;
    float _675 = _673 + 1.0;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _677;
    float _681 = _599 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _663 * 0.15915493667125701904296875;
    float _687 = fma(_665, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[115].x, _667);
    float _691 = _679 * _619;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _695 = _255 + _693;
    float _697 = fma(_687, _635, _689);
    float _699 = _599 * 6.283185482025146484375;
    float _701 = cos(_699);
    float _703 = fma(_691, _695, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _705 = !_279;
    float _707 = _705 ? (-0.5) : 0.5;
    float _709 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _657);
    bool _711 = !_283;
    float _713 = _711 ? (-0.5) : 0.5;
    float _715 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    float _717 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _661);
    float _719 = -_707;
    int _721 = _533 ? as_type<int>(_719) : as_type<int>(_707);
    float _723 = _655 * 6.283185482025146484375;
    float _725 = sin(_723);
    float _727 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = -_713;
    int _731 = _537 ? as_type<int>(_729) : as_type<int>(_713);
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _707);
    bool _735 = !_287;
    float _737 = _735 ? _707 : as_type<float>(_721);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _713);
    bool _741 = !_335;
    float _743 = _741 ? _713 : as_type<float>(_731);
    float _745 = _727 * _733;
    float _747 = _655 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = fma(_703, _621, _697);
    float _753 = _295 * _739;
    float _755 = _717 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _757 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _759 = isnan(0.5);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _765 = _761 || _763;
    float _767 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    bool _769 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _777 = _773 || _775;
    float _779 = _685 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _701 * _725;
    float _785 = _685 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _683 * _749;
    float _791 = -_783;
    float _793 = fma(_781, _789, _791);
    float _795 = -_789;
    float _797 = fma(_781, _783, _795);
    float _799 = _683 * _725;
    float _801 = _701 * _749;
    float _803 = _781 * _753;
    float _805 = _725 * _787;
    float _807 = _749 * _787;
    float _809 = _787 * _753;
    float _811 = fma(_781, _801, _799);
    float _813 = fma(_781, _799, _801);
    float _815 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _817 = _701 * _809;
    float _819 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _821 = -_803;
    float _823 = fma(_807, _745, _821);
    float _825 = _815 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _827 = _683 * _809;
    float _829 = fma(_811, _745, _817);
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[11].x, _825);
    float _835 = _815 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _837 = fma(_793, _745, _827);
    float _839 = fma(_797, _831, _829);
    float _841 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[11].z, _833);
    float _843 = fma(_805, _831, _823);
    float _845 = fma(_819, (*spvDescriptorSet0.vp_c8)._m0[10].x, _835);
    float _847 = _839 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _849 = _841 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _851 = fma(_813, _831, _837);
    float _853 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[10].z, _845);
    float _855 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[10].x, _847);
    float _857 = 1.0 / _849;
    float _859 = _839 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _861 = _839 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _865 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[10].z, _855);
    float _867 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[8].x, _859);
    float _869 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[9].x, _861);
    float _871 = _863 + _849;
    float _873 = _755 + _865;
    float _875 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[8].z, _867);
    float _877 = fma(_851, (*spvDescriptorSet0.vp_c10)._m0[9].z, _869);
    float _879 = _819 + _875;
    float _881 = _815 + _877;
    float _883 = _871 * _857;
    float _885 = _883 * 0.5;
    float _887 = _871;
    float _889 = _873;
    float _891 = _881;
    float _893 = _879;
    if (_765)
    {
        _887 = _873;
    }
    float _895 = _887;
    float _897 = _895;
    if (!_765)
    {
        float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _901 = _815 + _899;
        float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _905 = _819 + _903;
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _909 = _901 * _901;
        float _911 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _913 = _755 + _911;
        float _915 = fma(_905, _905, _909);
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _919 = fma(_913, _913, _915);
        float _921 = sqrt(_919);
        float _923 = _907 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _925 = precise::min(_921, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _927 = _925 * _917;
        float _929 = _923 * _927;
        float _931 = fma(_875, _929, _819);
        float _933 = fma(_877, _929, _815);
        float _935 = fma(_865, _929, _755);
        _889 = _921;
        _891 = _933;
        _893 = _931;
        _897 = _935;
    }
    float _937 = _889;
    float _939 = _891;
    float _941 = _893;
    float _943 = _897;
    float _945 = _937;
    if (_777)
    {
        _945 = 1.0;
    }
    float _947 = _945;
    float _949 = _947;
    if (!_777)
    {
        float _951 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _953 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _955 = _951 * 0.15915493667125701904296875;
        float _957 = _953 * 0.15915493667125701904296875;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _961 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[30].w, _959);
        float _963 = _955 * 6.283185482025146484375;
        float _965 = cos(_963);
        float _967 = _955 * 6.283185482025146484375;
        float _969 = sin(_967);
        float _971 = 1.0 / _965;
        float _973 = _957 * 6.283185482025146484375;
        float _975 = cos(_973);
        float _977 = _969 * _971;
        float _979 = _957 * 6.283185482025146484375;
        float _981 = sin(_979);
        float _983 = _975 * _977;
        float _985 = 1.0 / _961;
        float _987 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _989 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _987;
        float _991 = 1.0 / _983;
        float _993 = 1.0 / _989;
        float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _997 = _985 * _995;
        float _999 = _981 * _991;
        float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1003 = fma(_999, _997, _1001);
        float _1005 = _1003 * _993;
        float _1007 = precise::clamp(_1005, 0.0, 1.0);
        _949 = _1007;
    }
    float _1009 = _949;
    float _1011 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1013 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1015 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1017 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1019 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1011);
    float _1021 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1013);
    float _1023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1025 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1015);
    float _1027 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1019);
    float _1029 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1017);
    float _1031 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1021);
    float _1033 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1025);
    float _1035 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1037 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1029);
    float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1041 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = _737 + 0.5;
    float _1053 = -_743;
    float _1055 = _1053 + 0.5;
    float _1057 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1059 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1061 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1063 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    float _1065 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1067 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1069 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1071 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1059);
    float _1073 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1061);
    float _1075 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1063);
    float _1077 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1065);
    float _1079 = _1067 * _1023;
    float _1081 = _1069 * _1039;
    float _1083 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1085 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1087 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1089 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1095 = _1009 > 0.0;
    bool _1097 = isnan(_1009);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan(0.0);
    bool _1103 = _1099 || _1101;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1109 = _1087 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1111 = _1089 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1113 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1117 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1119 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1009 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1071);
    float _1127 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1073);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1075);
    float _1131 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1077);
    out.m_44.x = _1117;
    out.m_44.y = _1119;
    out.m_44.z = _1121;
    out.m_44.w = _1115;
    out.m_46.x = _1079;
    out.m_46.y = _1081;
    out.m_48.x = _1109;
    out.m_48.y = _1111;
    out.m_48.z = _1113;
    out.m_48.w = _1085;
    out.m_31.x = _1123;
    out.gl_Position.x = _1125;
    out.gl_Position.y = _1127;
    out.gl_Position.z = _1129;
    out.gl_Position.w = _1131;
    if (_1103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_31.x = 0.0;
    float _1133 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1133;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

