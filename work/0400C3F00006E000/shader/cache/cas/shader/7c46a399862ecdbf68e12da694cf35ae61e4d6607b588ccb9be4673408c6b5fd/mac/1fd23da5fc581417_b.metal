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
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1075 = false;
    bool _271 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_89);
        out.gl_Position.z = _1250;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1320 = as_type<float>(_127);
        out.gl_Position.z = _1320;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_39.w;
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _131;
    if (!_141)
    {
        float _159 = _131 * _131;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = !_141;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _131 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _131);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _203;
    }
    float _205 = _173;
    bool _207 = !_141;
    if (!_207)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = 1.0 / _215;
        float _219 = _131 * _211;
        float _221 = exp2(_219);
        float _223 = -_221;
        float _225 = _223 + 1.0;
        float _227 = _225 * _217;
        _157 = _227;
    }
    float _229 = _157;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_229, _143, _233);
    float _241 = fma(_229, _145, _235);
    float _243 = fma(_229, _147, _237);
    float _245 = fma(_239, _129, _149);
    float _247 = fma(_241, _129, _151);
    float _249 = fma(_243, _129, _153);
    bool _251 = !_231;
    float _269;
    if (!_251)
    {
        float _253 = in.m_41.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_73);
        float _275 = 1.0 / _273;
        float _277 = _107 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = in.m_41.z;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    float _287 = in.m_41.x;
    float _289 = in.m_41.y;
    float _291 = as_type<float>(int(gl_VertexIndex));
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _303 = _301 != 0;
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _317 = 1.0 + _315;
    float _319 = 1.0 / _317;
    float _321 = _285 * _107;
    float _323 = _281 * 2.0;
    float _325 = exp2(_321);
    float _327 = _289 + _281;
    float _329 = _287 * 2.0;
    float _331 = _289 * 2.0;
    float _333 = _327 + (-1.0);
    float _335 = floor(_323);
    float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _339 = _289 + _287;
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = floor(_329);
    float _347 = _339 + (-1.0);
    int _349 = abs(_343);
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = float(_349);
    bool _357 = _335 > 0.0;
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _361 = _335 >= 0.0;
    bool _363 = isnan(_335);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = floor(_331);
    float _373 = in.m_46.x;
    float _375 = in.m_46.y;
    float _377 = in.m_46.z;
    int _379 = _369 ? 0 : 1;
    bool _381 = _345 > 0.0;
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    bool _389 = _345 >= 0.0;
    bool _391 = isnan(_345);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    int _399 = _387;
    if (!_357)
    {
        int _401 = ~_379;
        int _403 = _401 + 1;
        _399 = _403;
    }
    int _405 = _399;
    bool _407 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = float(_405);
    bool _419 = !_299;
    int _421 = _419 ? 0 : 1;
    float _423 = _415 ? _353 : 0.0;
    float _425 = _355 * _417;
    int _427 = _397 ? 0 : 1;
    int _429 = abs(_421);
    if (_313)
    {
        float _431 = _423 * _319;
        _109 = _431;
    }
    float _433 = _109;
    float _435 = _425 * (-2.0);
    int _437 = ~_427;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = fma(_359, _435, _359);
    int _445 = _441;
    if (!_381)
    {
        int _447 = ~_427;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_435, _373, _373);
    bool _455 = _371 > 0.0;
    float _457 = _287 + (-0.5);
    float _459 = float(_429);
    float _461 = float(_451);
    float _463 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    bool _465 = _371 >= 0.0;
    bool _467 = isnan(_371);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    bool _475 = !_303;
    int _477 = _475 ? 0 : 1;
    float _479 = _459 * _461;
    int _481 = _473 ? 0 : 1;
    float _483 = fma(_443, _433, _463);
    float _485 = _479 * (-2.0);
    int _487 = ~_481;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = _483 * 0.15915493667125701904296875;
    int _495 = _491;
    if (!_455)
    {
        int _497 = ~_481;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = fma(_337, _485, _337);
    int _505 = abs(_477);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = fma(_485, _375, _375);
    float _513 = _289 + (-0.5);
    float _515 = float(_505);
    float _517 = _493 * 6.283185482025146484375;
    float _519 = cos(_517);
    float _521 = float(_501);
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _281 + _287;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = _281 + (-0.5);
    float _533 = _515 * _521;
    float _535 = _525 + (-1.0);
    float _537 = fma(_503, _433, _523);
    int _539 = as_type<int>(_291) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_291) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * (-2.0);
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _551 = _537 * 0.15915493667125701904296875;
    float _553 = fma(_547, _377, _377);
    float _555 = fma(_549, _547, _549);
    float _557 = _493 * 6.283185482025146484375;
    float _559 = sin(_557);
    bool _561 = _287 > 0.5;
    float _563 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[196].z, _553);
    float _565 = _247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = _247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _573 = fma(_555, _433, _563);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _577 = _575 != 0;
    float _579 = 1.0 / _509;
    float _581 = _573 * 0.15915493667125701904296875;
    float _583 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _585 = _247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _587 = !_545;
    float _589 = _587 ? (-0.5) : 0.5;
    float _591 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _593 = !_541;
    float _595 = _593 ? (-0.5) : 0.5;
    float _597 = _551 * 6.283185482025146484375;
    float _599 = sin(_597);
    bool _601 = _289 > 0.5;
    float _603 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _605 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _607 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _617 = _551 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
    float _623 = _611 * _579;
    float _625 = _613 * _615;
    float _627 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _629 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _621);
    float _631 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _583);
    float _633 = _581 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _639 = _519 * _599;
    float _641 = _559 * _599;
    float _643 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _645 = _607 * _637;
    float _647 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _649 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = _581 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = _559 * _619;
    float _657 = _519 * _619;
    float _659 = _631 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _635 * _645;
    float _663 = _599 * _635;
    float _665 = _619 * _635;
    float _667 = _519 * _661;
    float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _671 = -_639;
    float _673 = fma(_653, _655, _671);
    float _675 = -_655;
    float _677 = fma(_653, _639, _675);
    float _679 = fma(_653, _657, _641);
    float _681 = -_645;
    float _683 = _653 * _681;
    float _685 = fma(_653, _641, _657);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _691 = fma(_679, _625, _667);
    float _693 = _559 * _661;
    float _695 = fma(_665, _625, _683);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_677, _647, _691);
    float _703 = fma(_673, _625, _693);
    float _705 = fma(_663, _647, _695);
    float _707 = 1.0 / _689;
    float _709 = _701 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _711 = _701 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = fma(_685, _647, _703);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[24].x, _709);
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    bool _719 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_279);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _279 + _731;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].z, _715);
    float _737 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].z, _717);
    float _739 = fma(_623, _733, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _737 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _747 = _279 + _745;
    float _749 = _699 * _707;
    float _751 = _643 + _741;
    float _753 = _649 + _743;
    float _755 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _751 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _763 = _753 + _761;
    bool _765 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _767 = isnan(_279);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _759 * _759;
    float _783 = _763 * _763;
    bool _785 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = isnan(_279);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_775;
    float _799 = _797 + 1.0;
    float _801 = 1.0 / _779;
    float _803 = _781 + _783;
    float _805 = -_795;
    float _807 = _805 + 1.0;
    float _809 = _795 * _799;
    bool _811 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _813 = isnan(_279);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _279 + _823;
    float _827 = _729 * _807;
    float _829 = sqrt(_803);
    float _831 = -_729;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _835;
    float _839 = _701 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = _821 * _833;
    float _843 = -_821;
    float _845 = _843 + 1.0;
    float _847 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _849 = _837 * _801;
    float _851 = _739 * _841;
    float _853 = -_589;
    float _855 = _601 ? _853 : _589;
    float _857 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[115].x, _851);
    float _863 = -_595;
    float _865 = _561 ? _863 : _595;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _873 = !_569;
    float _875 = _873 ? _595 : _865;
    float _877 = fma(_755, _827, _861);
    bool _879 = !_577;
    float _881 = _879 ? _589 : _855;
    float _883 = _659 + _871;
    float _885 = _855;
    float _887 = _659;
    float _889 = _589;
    float _891 = _865;
    float _893 = _595;
    if (!_869)
    {
        _885 = _783;
    }
    float _895 = _885;
    float _897 = _895;
    if (!_869)
    {
        _887 = _781;
    }
    float _899 = _887;
    float _901 = _899;
    if (!_869)
    {
        _889 = _751;
    }
    float _903 = _889;
    float _905 = _903;
    if (!_869)
    {
        _891 = _753;
    }
    float _907 = _891;
    float _909 = _907;
    if (!_869)
    {
        _893 = _883;
    }
    float _911 = _893;
    bool _913 = !_869;
    float _915 = _911;
    if (!_913)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _921 = _829 + _919;
        float _923 = rsqrt(_803);
        float _925 = _921 * _917;
        float _927 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = _925 * 0.15915493667125701904296875;
        float _931 = _929 * 6.283185482025146484375;
        float _933 = sin(_931);
        float _935 = _929 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = fma(_933, _927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _941 = _923 * _939;
        float _943 = _937 + (-1.0);
        float _945 = fma(_759, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _947 = fma(_763, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _949 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _953 = _945 + _951;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _957 = _947 + _955;
        float _959 = fma(_883, _937, _949);
        float _961 = _953 * _953;
        float _963 = _957 * _957;
        _915 = _959;
        _901 = _961;
        _897 = _963;
        _905 = _945;
        _909 = _947;
    }
    float _965 = _915;
    float _967 = _901;
    float _969 = _897;
    float _971 = _905;
    float _973 = _909;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _977 = _965 + _975;
    float _979 = _875 + 0.5;
    float _981 = fma(_859, _809, _877);
    float _983 = fma(_977, _977, _967);
    float _985 = _979 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _987 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    float _989 = -_881;
    float _991 = _989 + 0.5;
    float _993 = _983 + _969;
    float _995 = _985 * _669;
    float _997 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1001 = sqrt(_993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _997 * _867;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _987 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.x = _995;
    out.m_48.y = _1011;
    bool _1029 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1031 = isnan(_1001);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1037 = _1033 || _1035;
    out.m_50.x = _1023;
    out.m_50.y = _1015;
    out.m_50.z = _1017;
    out.m_52.x = _1019;
    out.m_52.y = _1021;
    out.m_52.z = _1025;
    out.m_52.w = _1027;
    float _1039 = _1005;
    if (!_1037)
    {
        _1039 = 1.0;
    }
    float _1041 = _1039;
    bool _1043 = !_1037;
    float _1045 = _1041;
    if (!_1043)
    {
        bool _1047 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1049 = isnan(_1001);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1055 = _1051 || _1053;
        if (!_1055)
        {
            float _1057 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1059 = _1001 + _1057;
            float _1061 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1063 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1061;
            float _1065 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1067 = _1065 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1069 = 1.0 / _1063;
            float _1071 = _1059 * _1069;
            float _1073 = fma(_1071, _1067, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1045 = _1073;
            _1075 = true;
        }
        else
        {
            bool _1077 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1079 = isnan(_1001);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1085 = _1081 || _1083;
            if (!_1085)
            {
                float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1089 = _1001 + _1087;
                float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1097 = _1095 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1099 = 1.0 / _1093;
                float _1101 = _1089 * _1099;
                float _1103 = fma(_1101, _1097, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1045 = _1103;
                _1075 = true;
            }
            else
            {
                _1045 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1075 = false;
    float _1105 = _1045;
    float _1107 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1109 = _965 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1113 = _971 + _1111;
    float _1115 = fma(_1109, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1119 = _973 + _1117;
    float _1121 = fma(_1113, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1131 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1123);
    float _1133 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1131);
    float _1141 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1161 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1155);
    float _1165 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1159);
    float _1169 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1163);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1177 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1167);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1175);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1177);
    float _1187 = _1179 + _1181;
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1183);
    float _1191 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1193 = _1187 * 0.5;
    out.m_35.x = _1191;
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1189;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_54.z = _1193;
    out.m_54.w = _1181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1075 = false;
    bool _271 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_89);
        out.gl_Position.z = _1250;
    }
    if (!_77)
    {
        return out;
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1320 = as_type<float>(_127);
        out.gl_Position.z = _1320;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_39.w;
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _131;
    if (!_141)
    {
        float _159 = _131 * _131;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = !_141;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _131 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _131);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _203;
    }
    float _205 = _173;
    bool _207 = !_141;
    if (!_207)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = 1.0 / _215;
        float _219 = _131 * _211;
        float _221 = exp2(_219);
        float _223 = -_221;
        float _225 = _223 + 1.0;
        float _227 = _225 * _217;
        _157 = _227;
    }
    float _229 = _157;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_229, _143, _233);
    float _241 = fma(_229, _145, _235);
    float _243 = fma(_229, _147, _237);
    float _245 = fma(_239, _129, _149);
    float _247 = fma(_241, _129, _151);
    float _249 = fma(_243, _129, _153);
    bool _251 = !_231;
    float _269;
    if (!_251)
    {
        float _253 = in.m_41.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_73);
        float _275 = 1.0 / _273;
        float _277 = _107 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = in.m_41.z;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    float _287 = in.m_41.x;
    float _289 = in.m_41.y;
    float _291 = as_type<float>(int(gl_VertexIndex));
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _303 = _301 != 0;
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _317 = 1.0 + _315;
    float _319 = 1.0 / _317;
    float _321 = _285 * _107;
    float _323 = _281 * 2.0;
    float _325 = exp2(_321);
    float _327 = _289 + _281;
    float _329 = _287 * 2.0;
    float _331 = _289 * 2.0;
    float _333 = _327 + (-1.0);
    float _335 = floor(_323);
    float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _339 = _289 + _287;
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = floor(_329);
    float _347 = _339 + (-1.0);
    int _349 = abs(_343);
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = float(_349);
    bool _357 = _335 > 0.0;
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _361 = _335 >= 0.0;
    bool _363 = isnan(_335);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = floor(_331);
    float _373 = in.m_46.x;
    float _375 = in.m_46.y;
    float _377 = in.m_46.z;
    int _379 = _369 ? 0 : 1;
    bool _381 = _345 > 0.0;
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    bool _389 = _345 >= 0.0;
    bool _391 = isnan(_345);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    int _399 = _387;
    if (!_357)
    {
        int _401 = ~_379;
        int _403 = _401 + 1;
        _399 = _403;
    }
    int _405 = _399;
    bool _407 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = float(_405);
    bool _419 = !_299;
    int _421 = _419 ? 0 : 1;
    float _423 = _415 ? _353 : 0.0;
    float _425 = _355 * _417;
    int _427 = _397 ? 0 : 1;
    int _429 = abs(_421);
    if (_313)
    {
        float _431 = _423 * _319;
        _109 = _431;
    }
    float _433 = _109;
    float _435 = _425 * (-2.0);
    int _437 = ~_427;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = fma(_359, _435, _359);
    int _445 = _441;
    if (!_381)
    {
        int _447 = ~_427;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_435, _373, _373);
    bool _455 = _371 > 0.0;
    float _457 = _287 + (-0.5);
    float _459 = float(_429);
    float _461 = float(_451);
    float _463 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    bool _465 = _371 >= 0.0;
    bool _467 = isnan(_371);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    bool _475 = !_303;
    int _477 = _475 ? 0 : 1;
    float _479 = _459 * _461;
    int _481 = _473 ? 0 : 1;
    float _483 = fma(_443, _433, _463);
    float _485 = _479 * (-2.0);
    int _487 = ~_481;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = _483 * 0.15915493667125701904296875;
    int _495 = _491;
    if (!_455)
    {
        int _497 = ~_481;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = fma(_337, _485, _337);
    int _505 = abs(_477);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = fma(_485, _375, _375);
    float _513 = _289 + (-0.5);
    float _515 = float(_505);
    float _517 = _493 * 6.283185482025146484375;
    float _519 = cos(_517);
    float _521 = float(_501);
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _281 + _287;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = _281 + (-0.5);
    float _533 = _515 * _521;
    float _535 = _525 + (-1.0);
    float _537 = fma(_503, _433, _523);
    int _539 = as_type<int>(_291) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_291) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * (-2.0);
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _551 = _537 * 0.15915493667125701904296875;
    float _553 = fma(_547, _377, _377);
    float _555 = fma(_549, _547, _549);
    float _557 = _493 * 6.283185482025146484375;
    float _559 = sin(_557);
    bool _561 = _287 > 0.5;
    float _563 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[196].z, _553);
    float _565 = _247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = _247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _573 = fma(_555, _433, _563);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _577 = _575 != 0;
    float _579 = 1.0 / _509;
    float _581 = _573 * 0.15915493667125701904296875;
    float _583 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _585 = _247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _587 = !_545;
    float _589 = _587 ? (-0.5) : 0.5;
    float _591 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _593 = !_541;
    float _595 = _593 ? (-0.5) : 0.5;
    float _597 = _551 * 6.283185482025146484375;
    float _599 = sin(_597);
    bool _601 = _289 > 0.5;
    float _603 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _605 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _607 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _617 = _551 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
    float _623 = _611 * _579;
    float _625 = _613 * _615;
    float _627 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _629 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _621);
    float _631 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _583);
    float _633 = _581 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _639 = _519 * _599;
    float _641 = _559 * _599;
    float _643 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _645 = _607 * _637;
    float _647 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _649 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = _581 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = _559 * _619;
    float _657 = _519 * _619;
    float _659 = _631 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _635 * _645;
    float _663 = _599 * _635;
    float _665 = _619 * _635;
    float _667 = _519 * _661;
    float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _671 = -_639;
    float _673 = fma(_653, _655, _671);
    float _675 = -_655;
    float _677 = fma(_653, _639, _675);
    float _679 = fma(_653, _657, _641);
    float _681 = -_645;
    float _683 = _653 * _681;
    float _685 = fma(_653, _641, _657);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _691 = fma(_679, _625, _667);
    float _693 = _559 * _661;
    float _695 = fma(_665, _625, _683);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_677, _647, _691);
    float _703 = fma(_673, _625, _693);
    float _705 = fma(_663, _647, _695);
    float _707 = 1.0 / _689;
    float _709 = _701 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _711 = _701 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = fma(_685, _647, _703);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[24].x, _709);
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    bool _719 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_279);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _279 + _731;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].z, _715);
    float _737 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].z, _717);
    float _739 = fma(_623, _733, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _737 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _747 = _279 + _745;
    float _749 = _699 * _707;
    float _751 = _643 + _741;
    float _753 = _649 + _743;
    float _755 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _751 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _763 = _753 + _761;
    bool _765 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _767 = isnan(_279);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _759 * _759;
    float _783 = _763 * _763;
    bool _785 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = isnan(_279);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_775;
    float _799 = _797 + 1.0;
    float _801 = 1.0 / _779;
    float _803 = _781 + _783;
    float _805 = -_795;
    float _807 = _805 + 1.0;
    float _809 = _795 * _799;
    bool _811 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _813 = isnan(_279);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _279 + _823;
    float _827 = _729 * _807;
    float _829 = sqrt(_803);
    float _831 = -_729;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _835;
    float _839 = _701 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = _821 * _833;
    float _843 = -_821;
    float _845 = _843 + 1.0;
    float _847 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _849 = _837 * _801;
    float _851 = _739 * _841;
    float _853 = -_589;
    float _855 = _601 ? _853 : _589;
    float _857 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[115].x, _851);
    float _863 = -_595;
    float _865 = _561 ? _863 : _595;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _873 = !_569;
    float _875 = _873 ? _595 : _865;
    float _877 = fma(_755, _827, _861);
    bool _879 = !_577;
    float _881 = _879 ? _589 : _855;
    float _883 = _659 + _871;
    float _885 = _855;
    float _887 = _659;
    float _889 = _589;
    float _891 = _865;
    float _893 = _595;
    if (!_869)
    {
        _885 = _783;
    }
    float _895 = _885;
    float _897 = _895;
    if (!_869)
    {
        _887 = _781;
    }
    float _899 = _887;
    float _901 = _899;
    if (!_869)
    {
        _889 = _751;
    }
    float _903 = _889;
    float _905 = _903;
    if (!_869)
    {
        _891 = _753;
    }
    float _907 = _891;
    float _909 = _907;
    if (!_869)
    {
        _893 = _883;
    }
    float _911 = _893;
    bool _913 = !_869;
    float _915 = _911;
    if (!_913)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _921 = _829 + _919;
        float _923 = rsqrt(_803);
        float _925 = _921 * _917;
        float _927 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = _925 * 0.15915493667125701904296875;
        float _931 = _929 * 6.283185482025146484375;
        float _933 = sin(_931);
        float _935 = _929 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = fma(_933, _927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _941 = _923 * _939;
        float _943 = _937 + (-1.0);
        float _945 = fma(_759, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _947 = fma(_763, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _949 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _953 = _945 + _951;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _957 = _947 + _955;
        float _959 = fma(_883, _937, _949);
        float _961 = _953 * _953;
        float _963 = _957 * _957;
        _915 = _959;
        _901 = _961;
        _897 = _963;
        _905 = _945;
        _909 = _947;
    }
    float _965 = _915;
    float _967 = _901;
    float _969 = _897;
    float _971 = _905;
    float _973 = _909;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _977 = _965 + _975;
    float _979 = _875 + 0.5;
    float _981 = fma(_859, _809, _877);
    float _983 = fma(_977, _977, _967);
    float _985 = _979 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _987 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    float _989 = -_881;
    float _991 = _989 + 0.5;
    float _993 = _983 + _969;
    float _995 = _985 * _669;
    float _997 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1001 = sqrt(_993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _997 * _867;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _987 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.x = _995;
    out.m_48.y = _1011;
    bool _1029 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1031 = isnan(_1001);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1037 = _1033 || _1035;
    out.m_50.x = _1023;
    out.m_50.y = _1015;
    out.m_50.z = _1017;
    out.m_52.x = _1019;
    out.m_52.y = _1021;
    out.m_52.z = _1025;
    out.m_52.w = _1027;
    float _1039 = _1005;
    if (!_1037)
    {
        _1039 = 1.0;
    }
    float _1041 = _1039;
    bool _1043 = !_1037;
    float _1045 = _1041;
    if (!_1043)
    {
        bool _1047 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1049 = isnan(_1001);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1055 = _1051 || _1053;
        if (!_1055)
        {
            float _1057 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1059 = _1001 + _1057;
            float _1061 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1063 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1061;
            float _1065 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1067 = _1065 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1069 = 1.0 / _1063;
            float _1071 = _1059 * _1069;
            float _1073 = fma(_1071, _1067, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1045 = _1073;
            _1075 = true;
        }
        else
        {
            bool _1077 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1079 = isnan(_1001);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1085 = _1081 || _1083;
            if (!_1085)
            {
                float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1089 = _1001 + _1087;
                float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1097 = _1095 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1099 = 1.0 / _1093;
                float _1101 = _1089 * _1099;
                float _1103 = fma(_1101, _1097, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1045 = _1103;
                _1075 = true;
            }
            else
            {
                _1045 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1075 = false;
    float _1105 = _1045;
    float _1107 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1109 = _965 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1113 = _971 + _1111;
    float _1115 = fma(_1109, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1119 = _973 + _1117;
    float _1121 = fma(_1113, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1131 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1123);
    float _1133 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1131);
    float _1141 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1161 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1155);
    float _1165 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1159);
    float _1169 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1163);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1177 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1167);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1175);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1177);
    float _1187 = _1179 + _1181;
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1183);
    float _1191 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1193 = _1187 * 0.5;
    out.m_35.x = _1191;
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1189;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_54.z = _1193;
    out.m_54.w = _1181;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1075 = false;
    bool _271 = false;
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
    int _91 = _89;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1250 = as_type<float>(_89);
        out.gl_Position.z = _1250;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = _107;
    if (_103)
    {
        float _111 = float(_73);
        _83 = _111;
    }
    float _113 = _83;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _91 = as_type<int>(_125);
    }
    int _127 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1320 = as_type<float>(_127);
        out.gl_Position.z = _1320;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_39.w;
    float _131 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _131;
    if (!_141)
    {
        float _159 = _131 * _131;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    bool _171 = !_141;
    float _173 = _169;
    if (!_171)
    {
        float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _177 = log2(_175);
        float _179 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _181 = _179 + 1.0;
        float _183 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = _131 * _177;
        float _187 = 1.0 / _181;
        float _189 = _183 * 0.693147182464599609375;
        float _191 = exp2(_185);
        float _193 = 1.0 / _189;
        float _195 = _191 + (-1.0);
        float _197 = -_195;
        float _199 = fma(_197, _193, _131);
        float _201 = _199 * _187;
        float _203 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _203;
    }
    float _205 = _173;
    bool _207 = !_141;
    if (!_207)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = 1.0 / _215;
        float _219 = _131 * _211;
        float _221 = exp2(_219);
        float _223 = -_221;
        float _225 = _223 + 1.0;
        float _227 = _225 * _217;
        _157 = _227;
    }
    float _229 = _157;
    bool _231 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _233 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _237 = _205 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _239 = fma(_229, _143, _233);
    float _241 = fma(_229, _145, _235);
    float _243 = fma(_229, _147, _237);
    float _245 = fma(_239, _129, _149);
    float _247 = fma(_241, _129, _151);
    float _249 = fma(_243, _129, _153);
    bool _251 = !_231;
    float _269;
    if (!_251)
    {
        float _253 = in.m_41.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        float _273 = float(_73);
        float _275 = 1.0 / _273;
        float _277 = _107 * _275;
        _269 = _277;
    }
    _271 = false;
    float _279 = _269;
    float _281 = in.m_41.z;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    float _287 = in.m_41.x;
    float _289 = in.m_41.y;
    float _291 = as_type<float>(int(gl_VertexIndex));
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _295 = _293 != 0;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _299 = _297 != 0;
    int _301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _303 = _301 != 0;
    bool _305 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _307 = isnan(1.0);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _313 = _309 || _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _317 = 1.0 + _315;
    float _319 = 1.0 / _317;
    float _321 = _285 * _107;
    float _323 = _281 * 2.0;
    float _325 = exp2(_321);
    float _327 = _289 + _281;
    float _329 = _287 * 2.0;
    float _331 = _289 * 2.0;
    float _333 = _327 + (-1.0);
    float _335 = floor(_323);
    float _337 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _339 = _289 + _287;
    bool _341 = !_295;
    int _343 = _341 ? 0 : 1;
    float _345 = floor(_329);
    float _347 = _339 + (-1.0);
    int _349 = abs(_343);
    float _351 = -_325;
    float _353 = _351 + 1.0;
    float _355 = float(_349);
    bool _357 = _335 > 0.0;
    float _359 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _361 = _335 >= 0.0;
    bool _363 = isnan(_335);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = floor(_331);
    float _373 = in.m_46.x;
    float _375 = in.m_46.y;
    float _377 = in.m_46.z;
    int _379 = _369 ? 0 : 1;
    bool _381 = _345 > 0.0;
    int _383 = ~_379;
    int _385 = _383 + 1;
    int _387 = _385 + 1;
    bool _389 = _345 >= 0.0;
    bool _391 = isnan(_345);
    bool _393 = _389 || _391;
    bool _395 = isnan(0.0);
    bool _397 = _393 || _395;
    int _399 = _387;
    if (!_357)
    {
        int _401 = ~_379;
        int _403 = _401 + 1;
        _399 = _403;
    }
    int _405 = _399;
    bool _407 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(0.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = float(_405);
    bool _419 = !_299;
    int _421 = _419 ? 0 : 1;
    float _423 = _415 ? _353 : 0.0;
    float _425 = _355 * _417;
    int _427 = _397 ? 0 : 1;
    int _429 = abs(_421);
    if (_313)
    {
        float _431 = _423 * _319;
        _109 = _431;
    }
    float _433 = _109;
    float _435 = _425 * (-2.0);
    int _437 = ~_427;
    int _439 = _437 + 1;
    int _441 = _439 + 1;
    float _443 = fma(_359, _435, _359);
    int _445 = _441;
    if (!_381)
    {
        int _447 = ~_427;
        int _449 = _447 + 1;
        _445 = _449;
    }
    int _451 = _445;
    float _453 = fma(_435, _373, _373);
    bool _455 = _371 > 0.0;
    float _457 = _287 + (-0.5);
    float _459 = float(_429);
    float _461 = float(_451);
    float _463 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    bool _465 = _371 >= 0.0;
    bool _467 = isnan(_371);
    bool _469 = _465 || _467;
    bool _471 = isnan(0.0);
    bool _473 = _469 || _471;
    bool _475 = !_303;
    int _477 = _475 ? 0 : 1;
    float _479 = _459 * _461;
    int _481 = _473 ? 0 : 1;
    float _483 = fma(_443, _433, _463);
    float _485 = _479 * (-2.0);
    int _487 = ~_481;
    int _489 = _487 + 1;
    int _491 = _489 + 1;
    float _493 = _483 * 0.15915493667125701904296875;
    int _495 = _491;
    if (!_455)
    {
        int _497 = ~_481;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = fma(_337, _485, _337);
    int _505 = abs(_477);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = fma(_485, _375, _375);
    float _513 = _289 + (-0.5);
    float _515 = float(_505);
    float _517 = _493 * 6.283185482025146484375;
    float _519 = cos(_517);
    float _521 = float(_501);
    float _523 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[196].y, _511);
    float _525 = _281 + _287;
    float _527 = in.m_39.x;
    float _529 = in.m_39.y;
    float _531 = _281 + (-0.5);
    float _533 = _515 * _521;
    float _535 = _525 + (-1.0);
    float _537 = fma(_503, _433, _523);
    int _539 = as_type<int>(_291) & 1;
    bool _541 = _539 != 0;
    int _543 = as_type<int>(_291) & 2;
    bool _545 = _543 != 0;
    float _547 = _533 * (-2.0);
    float _549 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _551 = _537 * 0.15915493667125701904296875;
    float _553 = fma(_547, _377, _377);
    float _555 = fma(_549, _547, _549);
    float _557 = _493 * 6.283185482025146484375;
    float _559 = sin(_557);
    bool _561 = _287 > 0.5;
    float _563 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[196].z, _553);
    float _565 = _247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _569 = _567 != 0;
    float _571 = _247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _573 = fma(_555, _433, _563);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _577 = _575 != 0;
    float _579 = 1.0 / _509;
    float _581 = _573 * 0.15915493667125701904296875;
    float _583 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _565);
    float _585 = _247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _587 = !_545;
    float _589 = _587 ? (-0.5) : 0.5;
    float _591 = _529 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _593 = !_541;
    float _595 = _593 ? (-0.5) : 0.5;
    float _597 = _551 * 6.283185482025146484375;
    float _599 = sin(_597);
    bool _601 = _289 > 0.5;
    float _603 = _527 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _605 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _607 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _609;
    float _613 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _615 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _595);
    float _617 = _551 * 6.283185482025146484375;
    float _619 = cos(_617);
    float _621 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _571);
    float _623 = _611 * _579;
    float _625 = _613 * _615;
    float _627 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _605);
    float _629 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _621);
    float _631 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _583);
    float _633 = _581 * 6.283185482025146484375;
    float _635 = cos(_633);
    float _637 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _589);
    float _639 = _519 * _599;
    float _641 = _559 * _599;
    float _643 = _627 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _645 = _607 * _637;
    float _647 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _649 = _629 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = _581 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = _559 * _619;
    float _657 = _519 * _619;
    float _659 = _631 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _661 = _635 * _645;
    float _663 = _599 * _635;
    float _665 = _619 * _635;
    float _667 = _519 * _661;
    float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _671 = -_639;
    float _673 = fma(_653, _655, _671);
    float _675 = -_655;
    float _677 = fma(_653, _639, _675);
    float _679 = fma(_653, _657, _641);
    float _681 = -_645;
    float _683 = _653 * _681;
    float _685 = fma(_653, _641, _657);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _691 = fma(_679, _625, _667);
    float _693 = _559 * _661;
    float _695 = fma(_665, _625, _683);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_677, _647, _691);
    float _703 = fma(_673, _625, _693);
    float _705 = fma(_663, _647, _695);
    float _707 = 1.0 / _689;
    float _709 = _701 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _711 = _701 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _713 = fma(_685, _647, _703);
    float _715 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[24].x, _709);
    float _717 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[26].x, _711);
    bool _719 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _721 = isnan(_279);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _733 = _279 + _731;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].z, _715);
    float _737 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].z, _717);
    float _739 = fma(_623, _733, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _743 = _737 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _747 = _279 + _745;
    float _749 = _699 * _707;
    float _751 = _643 + _741;
    float _753 = _649 + _743;
    float _755 = fma(_749, _747, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _757 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _759 = _751 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _763 = _753 + _761;
    bool _765 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _767 = isnan(_279);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _781 = _759 * _759;
    float _783 = _763 * _763;
    bool _785 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _787 = isnan(_279);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_775;
    float _799 = _797 + 1.0;
    float _801 = 1.0 / _779;
    float _803 = _781 + _783;
    float _805 = -_795;
    float _807 = _805 + 1.0;
    float _809 = _795 * _799;
    bool _811 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _813 = isnan(_279);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _825 = _279 + _823;
    float _827 = _729 * _807;
    float _829 = sqrt(_803);
    float _831 = -_729;
    float _833 = _831 + 1.0;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _835;
    float _839 = _701 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _841 = _821 * _833;
    float _843 = -_821;
    float _845 = _843 + 1.0;
    float _847 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _839);
    float _849 = _837 * _801;
    float _851 = _739 * _841;
    float _853 = -_589;
    float _855 = _601 ? _853 : _589;
    float _857 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].z, _847);
    float _859 = fma(_849, _825, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _861 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[115].x, _851);
    float _863 = -_595;
    float _865 = _561 ? _863 : _595;
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = _829 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _871 = _857 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _873 = !_569;
    float _875 = _873 ? _595 : _865;
    float _877 = fma(_755, _827, _861);
    bool _879 = !_577;
    float _881 = _879 ? _589 : _855;
    float _883 = _659 + _871;
    float _885 = _855;
    float _887 = _659;
    float _889 = _589;
    float _891 = _865;
    float _893 = _595;
    if (!_869)
    {
        _885 = _783;
    }
    float _895 = _885;
    float _897 = _895;
    if (!_869)
    {
        _887 = _781;
    }
    float _899 = _887;
    float _901 = _899;
    if (!_869)
    {
        _889 = _751;
    }
    float _903 = _889;
    float _905 = _903;
    if (!_869)
    {
        _891 = _753;
    }
    float _907 = _891;
    float _909 = _907;
    if (!_869)
    {
        _893 = _883;
    }
    float _911 = _893;
    bool _913 = !_869;
    float _915 = _911;
    if (!_913)
    {
        float _917 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _921 = _829 + _919;
        float _923 = rsqrt(_803);
        float _925 = _921 * _917;
        float _927 = _883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _929 = _925 * 0.15915493667125701904296875;
        float _931 = _929 * 6.283185482025146484375;
        float _933 = sin(_931);
        float _935 = _929 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = fma(_933, _927, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _941 = _923 * _939;
        float _943 = _937 + (-1.0);
        float _945 = fma(_759, _941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _947 = fma(_763, _941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _949 = _943 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _951 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _953 = _945 + _951;
        float _955 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _957 = _947 + _955;
        float _959 = fma(_883, _937, _949);
        float _961 = _953 * _953;
        float _963 = _957 * _957;
        _915 = _959;
        _901 = _961;
        _897 = _963;
        _905 = _945;
        _909 = _947;
    }
    float _965 = _915;
    float _967 = _901;
    float _969 = _897;
    float _971 = _905;
    float _973 = _909;
    float _975 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _977 = _965 + _975;
    float _979 = _875 + 0.5;
    float _981 = fma(_859, _809, _877);
    float _983 = fma(_977, _977, _967);
    float _985 = _979 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _987 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    float _989 = -_881;
    float _991 = _989 + 0.5;
    float _993 = _983 + _969;
    float _995 = _985 * _669;
    float _997 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1001 = sqrt(_993);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1007 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1011 = _997 * _867;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1025 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1027 = _987 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_48.x = _995;
    out.m_48.y = _1011;
    bool _1029 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1031 = isnan(_1001);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1037 = _1033 || _1035;
    out.m_50.x = _1023;
    out.m_50.y = _1015;
    out.m_50.z = _1017;
    out.m_52.x = _1019;
    out.m_52.y = _1021;
    out.m_52.z = _1025;
    out.m_52.w = _1027;
    float _1039 = _1005;
    if (!_1037)
    {
        _1039 = 1.0;
    }
    float _1041 = _1039;
    bool _1043 = !_1037;
    float _1045 = _1041;
    if (!_1043)
    {
        bool _1047 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1049 = isnan(_1001);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1055 = _1051 || _1053;
        if (!_1055)
        {
            float _1057 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1059 = _1001 + _1057;
            float _1061 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1063 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1061;
            float _1065 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1067 = _1065 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1069 = 1.0 / _1063;
            float _1071 = _1059 * _1069;
            float _1073 = fma(_1071, _1067, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1045 = _1073;
            _1075 = true;
        }
        else
        {
            bool _1077 = _1001 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1079 = isnan(_1001);
            bool _1081 = _1077 || _1079;
            bool _1083 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1085 = _1081 || _1083;
            if (!_1085)
            {
                float _1087 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1089 = _1001 + _1087;
                float _1091 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1093 = _1091 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1095 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1097 = _1095 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1099 = 1.0 / _1093;
                float _1101 = _1089 * _1099;
                float _1103 = fma(_1101, _1097, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1045 = _1103;
                _1075 = true;
            }
            else
            {
                _1045 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1075 = false;
    float _1105 = _1045;
    float _1107 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1109 = _965 + _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1113 = _971 + _1111;
    float _1115 = fma(_1109, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1117 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1119 = _973 + _1117;
    float _1121 = fma(_1113, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1125 = fma(_1119, _1105, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1127 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1131 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1123);
    float _1133 = _1115 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1135 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1127);
    float _1137 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1129);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1131);
    float _1141 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1133);
    float _1143 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1141);
    float _1151 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1157 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1159 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1161 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1155);
    float _1165 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1157);
    float _1167 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1159);
    float _1169 = _1149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1163);
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1175 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1177 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1167);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1175);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1177);
    float _1187 = _1179 + _1181;
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1183);
    float _1191 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1193 = _1187 * 0.5;
    out.m_35.x = _1191;
    out.gl_Position.x = _1185;
    out.gl_Position.y = _1189;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_54.z = _1193;
    out.m_54.w = _1181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

