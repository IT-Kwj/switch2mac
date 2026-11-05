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
    float4 m_54 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_40 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _405 = false;
    bool _293 = false;
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
        float _1296 = as_type<float>(_93);
        out.gl_Position.z = _1296;
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
        float _1366 = as_type<float>(_131);
        out.gl_Position.z = _1366;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_40.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_35.x;
    float _151 = in.m_35.y;
    float _153 = in.m_35.z;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_42.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_77);
        float _297 = 1.0 / _295;
        float _299 = _111 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    float _307 = in.m_40.x;
    float _309 = in.m_40.y;
    bool _311 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    bool _327 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_301);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_321;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = 1.0 / _325;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = _337 * _341;
    float _353 = -_337;
    float _355 = _353 + 1.0;
    float _357 = _305 * _347;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_345, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _363 * _351;
    float _369 = _365 * _351;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _369);
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].x, _371);
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    float _379 = _375 * _307;
    float _381 = _377 * _309;
    bool _383 = !_349;
    float _385 = _307;
    float _403;
    if (!_383)
    {
        float _387 = in.m_42.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_77);
        float _409 = 1.0 / _407;
        float _411 = _111 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_42.z;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = in.m_42.x;
    float _427 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _429 = in.m_42.w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _435 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _437 = _309;
    if (!_423)
    {
        float _439 = in.m_42.y;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = _419 * _111;
    float _445 = _415 * 2.0;
    float _447 = exp2(_443);
    float _449 = _425 * 2.0;
    float _451 = floor(_445);
    if (!_423)
    {
        _385 = _441;
    }
    float _453 = _385;
    float _455 = floor(_449);
    float _457 = -_447;
    float _459 = _457 + 1.0;
    float _461 = _453;
    float _463 = _441;
    if (_423)
    {
        float _465 = in.m_42.x;
        float _467 = in.m_42.y;
        _461 = _465;
        _463 = _467;
    }
    float _469 = _461;
    float _471 = _463;
    bool _473 = _451 >= 0.0;
    bool _475 = isnan(_451);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _451 > 0.0;
    int _497 = _481 ? 0 : 1;
    float _499 = _451;
    if (!_423)
    {
        _499 = _415;
    }
    float _501 = _499;
    bool _503 = _455 > 0.0;
    bool _505 = _455 >= 0.0;
    bool _507 = isnan(_455);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _517 = ~_497;
    int _519 = _517 + 1;
    int _521 = _519 + 1;
    float _523 = _501;
    int _525 = _521;
    if (_423)
    {
        _523 = _471;
    }
    float _527 = _523;
    float _529 = _469 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _531 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _433);
    float _533 = _527;
    if (!_495)
    {
        int _535 = ~_497;
        int _537 = _535 + 1;
        _525 = _537;
    }
    int _539 = _525;
    float _541 = _471 * 2.0;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _431);
    float _545 = -_515;
    float _547 = fma(_529, 2.0, _545);
    if (!_423)
    {
        _533 = _415;
    }
    float _549 = _533;
    float _551 = _415 + _471;
    float _553 = floor(_541);
    float _555 = _549;
    if (_423)
    {
        _555 = _471;
    }
    float _557 = _555;
    float _559 = _551 + (-1.0);
    int _561 = _513 ? 0 : 1;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _567 = ~_561;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    float _573 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _531);
    int _575 = _571;
    if (!_503)
    {
        int _577 = ~_561;
        int _579 = _577 + 1;
        _575 = _579;
    }
    int _581 = _575;
    float _583 = fma(_565, -2.0, _563);
    float _585 = _425 + _471;
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _543);
    float _591 = _585 + (-1.0);
    bool _593 = !_485;
    int _595 = _593 ? 0 : 1;
    float _597 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _583);
    bool _599 = !_489;
    int _601 = _599 ? 0 : 1;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = abs(_595);
    int _621 = abs(_601);
    float _623 = 1.0 / _617;
    float _625 = in.m_44.x;
    float _627 = in.m_44.y;
    float _629 = in.m_44.z;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = float(_619);
    float _643 = float(_539);
    float _645 = _639 ? _459 : 0.0;
    float _647 = -_111;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _547);
    bool _651 = _553 > 0.0;
    float _653 = _641 * _643;
    float _655 = float(_621);
    float _657 = _425 + (-0.5);
    float _659 = float(_581);
    float _661 = _653 * (-2.0);
    if (_613)
    {
        float _663 = _645 * _623;
        _113 = _663;
    }
    float _665 = _113;
    bool _667 = !_493;
    int _669 = _667 ? 0 : 1;
    bool _671 = _553 >= 0.0;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = _655 * _659;
    int _683 = abs(_669);
    int _685 = _679 ? 0 : 1;
    float _687 = fma(_661, _625, _625);
    float _689 = fma(_603, _661, _603);
    int _691 = ~_685;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _687);
    float _699 = _681 * (-2.0);
    int _701 = _695;
    if (!_651)
    {
        int _703 = ~_685;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    float _709 = fma(_689, _665, _697);
    float _711 = _471 + (-0.5);
    float _713 = fma(_699, _627, _627);
    float _715 = float(_683);
    float _717 = fma(_587, _699, _587);
    float _719 = float(_707);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _723 = _425 + _415;
    float _725 = _709 * 0.15915493667125701904296875;
    float _727 = _715 * _719;
    float _729 = fma(_717, _665, _721);
    float _731 = _723 + (-1.0);
    float _733 = _415 + (-0.5);
    float _735 = _727 * (-2.0);
    float _737 = _729 * 0.15915493667125701904296875;
    float _739 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _725 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = fma(_735, _629, _629);
    bool _747 = _415 > 0.5;
    float _749 = fma(_739, _735, _739);
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = in.m_46.w;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    bool _761 = _429 > 0.5;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _765 = _725 * 6.283185482025146484375;
    float _767 = cos(_765);
    float _769 = fma(_749, _665, _759);
    bool _771 = _425 > 0.5;
    float _773 = in.m_48.x;
    float _775 = in.m_48.y;
    float _777 = in.m_48.z;
    float _779 = in.m_48.w;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = _769 * 0.15915493667125701904296875;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _789 = _787 != 0;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _793 = _737 * 6.283185482025146484375;
    float _795 = sin(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = _427 * _763;
    float _807 = _737 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _269 * _753;
    float _813 = _785 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = fma(_267, _751, _811);
    float _819 = _743 * _795;
    float _821 = _269 * _775;
    float _823 = _435 * _791;
    float _825 = _767 * _795;
    float _827 = fma(_271, _755, _817);
    float _829 = fma(_267, _773, _821);
    float _831 = _785 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _767 * _809;
    float _837 = _743 * _809;
    float _839 = fma(_271, _777, _829);
    float _841 = _827 + _757;
    float _843 = _839 + _779;
    float _845 = _815 * _805;
    float _847 = _809 * _815;
    float _849 = _767 * _845;
    float _851 = fma(_833, _835, _819);
    float _853 = -_825;
    float _855 = fma(_833, _837, _853);
    float _857 = -_837;
    float _859 = fma(_833, _825, _857);
    float _861 = _795 * _815;
    float _863 = -_805;
    float _865 = _833 * _863;
    float _867 = fma(_851, _823, _849);
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _871 = _743 * _845;
    float _873 = in.m_50.x;
    float _875 = in.m_50.y;
    float _877 = in.m_50.z;
    float _879 = in.m_50.w;
    float _881 = fma(_847, _823, _865);
    float _883 = fma(_859, _869, _867);
    float _885 = fma(_833, _819, _835);
    float _887 = fma(_855, _823, _871);
    float _889 = fma(_861, _869, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _893 = fma(_885, _869, _887);
    float _895 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].x, _891);
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].z, _897);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _915 = 1.0 / _909;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _843 + _913;
    float _921 = _269 * _875;
    float _923 = _841 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _919 + _925;
    float _929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _923 + _935;
    float _939 = _927 * _927;
    float _941 = fma(_267, _873, _921);
    bool _943 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_413);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_937, _937, _939);
    float _957 = _933 * _915;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _413 + _959;
    bool _963 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_413);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_953;
    float _977 = _975 + 1.0;
    float _979 = sqrt(_955);
    float _981 = fma(_957, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _983 = fma(_271, _877, _941);
    float _985 = _973 * _977;
    out.m_33.x = _929;
    float _987 = -_187;
    int _989 = _747 ? as_type<int>(_987) : as_type<int>(_187);
    float _991 = _983 + _879;
    float _993 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _997 = -_191;
    int _999 = _761 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _981 * _985;
    float _1003 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].z, _993);
    bool _1005 = !_783;
    float _1007 = _1005 ? _187 : as_type<float>(_989);
    float _1009 = -_973;
    float _1011 = _1009 + 1.0;
    bool _1013 = !_789;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _899 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1001);
    bool _1023 = _471 > 0.5;
    float _1025 = _1015 + (-0.5);
    float _1027 = -_187;
    int _1029 = _771 ? as_type<int>(_1027) : as_type<int>(_187);
    float _1031 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1021);
    float _1033 = -_191;
    int _1035 = _1023 ? as_type<int>(_1033) : as_type<int>(_191);
    float _1037 = _995 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1039 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = _1007 + 0.5;
    bool _1043 = !_799;
    float _1045 = _1043 ? _187 : as_type<float>(_1029);
    float _1047 = -_1037;
    float _1049 = -_597;
    float _1051 = fma(_1047, _1025, _1049);
    float _1053 = _991 + _1039;
    float _1055 = fma(_1017, _1041, _649);
    bool _1057 = !_803;
    float _1059 = _1057 ? _191 : as_type<float>(_1035);
    float _1061 = _1017;
    float _1063 = _923;
    float _1065 = _919;
    if (!_1019)
    {
        _1061 = _1053;
    }
    float _1067 = _1061;
    bool _1069 = !_1019;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _979 + _1075;
        float _1079 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_955);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = _1089 + (-1.0);
        float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = fma(_1093, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1101 = fma(_1053, _1089, _1097);
        float _1103 = _1081 * _1099;
        float _1105 = fma(_937, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1107 = fma(_927, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1071 = _1101;
        _1063 = _1105;
        _1065 = _1107;
    }
    float _1109 = _1071;
    float _1111 = _1063;
    float _1113 = _1065;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1123);
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1125);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = _1045 + 0.5;
    float _1145 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1153 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1151);
    float _1163 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1177 = _1163 * _1121;
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1183 = -_573;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1179);
    float _1191 = -_1185;
    float _1193 = fma(_1007, _1191, _1055);
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1175);
    float _1197 = -_1059;
    float _1199 = _1197 + 0.5;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1203 = -_589;
    float _1205 = _1203 + 1.0;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = _1195 + _1189;
    float _1223 = fma(_1015, _1205, _1051);
    float _1225 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * _1171;
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1221 * 0.5;
    out.m_52.x = _1213;
    out.m_52.y = _1233;
    out.m_52.z = _1235;
    out.m_52.w = _1231;
    out.m_54.x = _1229;
    out.m_54.y = _1225;
    out.m_54.z = _1237;
    out.m_56.x = _1177;
    out.m_56.y = _1227;
    out.m_56.z = _1193;
    out.m_56.w = _1223;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _1195;
    out.gl_Position.w = _1189;
    out.m_58.z = _1239;
    out.m_58.w = _1189;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _405 = false;
    bool _293 = false;
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
        float _1296 = as_type<float>(_93);
        out.gl_Position.z = _1296;
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
        float _1366 = as_type<float>(_131);
        out.gl_Position.z = _1366;
    }
    if (_123)
    {
        return out;
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_40.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_35.x;
    float _151 = in.m_35.y;
    float _153 = in.m_35.z;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_42.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_77);
        float _297 = 1.0 / _295;
        float _299 = _111 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    float _307 = in.m_40.x;
    float _309 = in.m_40.y;
    bool _311 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    bool _327 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_301);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_321;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = 1.0 / _325;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = _337 * _341;
    float _353 = -_337;
    float _355 = _353 + 1.0;
    float _357 = _305 * _347;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_345, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _363 * _351;
    float _369 = _365 * _351;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _369);
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].x, _371);
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    float _379 = _375 * _307;
    float _381 = _377 * _309;
    bool _383 = !_349;
    float _385 = _307;
    float _403;
    if (!_383)
    {
        float _387 = in.m_42.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_77);
        float _409 = 1.0 / _407;
        float _411 = _111 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_42.z;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = in.m_42.x;
    float _427 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _429 = in.m_42.w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _435 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _437 = _309;
    if (!_423)
    {
        float _439 = in.m_42.y;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = _419 * _111;
    float _445 = _415 * 2.0;
    float _447 = exp2(_443);
    float _449 = _425 * 2.0;
    float _451 = floor(_445);
    if (!_423)
    {
        _385 = _441;
    }
    float _453 = _385;
    float _455 = floor(_449);
    float _457 = -_447;
    float _459 = _457 + 1.0;
    float _461 = _453;
    float _463 = _441;
    if (_423)
    {
        float _465 = in.m_42.x;
        float _467 = in.m_42.y;
        _461 = _465;
        _463 = _467;
    }
    float _469 = _461;
    float _471 = _463;
    bool _473 = _451 >= 0.0;
    bool _475 = isnan(_451);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _451 > 0.0;
    int _497 = _481 ? 0 : 1;
    float _499 = _451;
    if (!_423)
    {
        _499 = _415;
    }
    float _501 = _499;
    bool _503 = _455 > 0.0;
    bool _505 = _455 >= 0.0;
    bool _507 = isnan(_455);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _517 = ~_497;
    int _519 = _517 + 1;
    int _521 = _519 + 1;
    float _523 = _501;
    int _525 = _521;
    if (_423)
    {
        _523 = _471;
    }
    float _527 = _523;
    float _529 = _469 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _531 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _433);
    float _533 = _527;
    if (!_495)
    {
        int _535 = ~_497;
        int _537 = _535 + 1;
        _525 = _537;
    }
    int _539 = _525;
    float _541 = _471 * 2.0;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _431);
    float _545 = -_515;
    float _547 = fma(_529, 2.0, _545);
    if (!_423)
    {
        _533 = _415;
    }
    float _549 = _533;
    float _551 = _415 + _471;
    float _553 = floor(_541);
    float _555 = _549;
    if (_423)
    {
        _555 = _471;
    }
    float _557 = _555;
    float _559 = _551 + (-1.0);
    int _561 = _513 ? 0 : 1;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _567 = ~_561;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    float _573 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _531);
    int _575 = _571;
    if (!_503)
    {
        int _577 = ~_561;
        int _579 = _577 + 1;
        _575 = _579;
    }
    int _581 = _575;
    float _583 = fma(_565, -2.0, _563);
    float _585 = _425 + _471;
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _543);
    float _591 = _585 + (-1.0);
    bool _593 = !_485;
    int _595 = _593 ? 0 : 1;
    float _597 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _583);
    bool _599 = !_489;
    int _601 = _599 ? 0 : 1;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = abs(_595);
    int _621 = abs(_601);
    float _623 = 1.0 / _617;
    float _625 = in.m_44.x;
    float _627 = in.m_44.y;
    float _629 = in.m_44.z;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = float(_619);
    float _643 = float(_539);
    float _645 = _639 ? _459 : 0.0;
    float _647 = -_111;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _547);
    bool _651 = _553 > 0.0;
    float _653 = _641 * _643;
    float _655 = float(_621);
    float _657 = _425 + (-0.5);
    float _659 = float(_581);
    float _661 = _653 * (-2.0);
    if (_613)
    {
        float _663 = _645 * _623;
        _113 = _663;
    }
    float _665 = _113;
    bool _667 = !_493;
    int _669 = _667 ? 0 : 1;
    bool _671 = _553 >= 0.0;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = _655 * _659;
    int _683 = abs(_669);
    int _685 = _679 ? 0 : 1;
    float _687 = fma(_661, _625, _625);
    float _689 = fma(_603, _661, _603);
    int _691 = ~_685;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _687);
    float _699 = _681 * (-2.0);
    int _701 = _695;
    if (!_651)
    {
        int _703 = ~_685;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    float _709 = fma(_689, _665, _697);
    float _711 = _471 + (-0.5);
    float _713 = fma(_699, _627, _627);
    float _715 = float(_683);
    float _717 = fma(_587, _699, _587);
    float _719 = float(_707);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _723 = _425 + _415;
    float _725 = _709 * 0.15915493667125701904296875;
    float _727 = _715 * _719;
    float _729 = fma(_717, _665, _721);
    float _731 = _723 + (-1.0);
    float _733 = _415 + (-0.5);
    float _735 = _727 * (-2.0);
    float _737 = _729 * 0.15915493667125701904296875;
    float _739 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _725 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = fma(_735, _629, _629);
    bool _747 = _415 > 0.5;
    float _749 = fma(_739, _735, _739);
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = in.m_46.w;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    bool _761 = _429 > 0.5;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _765 = _725 * 6.283185482025146484375;
    float _767 = cos(_765);
    float _769 = fma(_749, _665, _759);
    bool _771 = _425 > 0.5;
    float _773 = in.m_48.x;
    float _775 = in.m_48.y;
    float _777 = in.m_48.z;
    float _779 = in.m_48.w;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = _769 * 0.15915493667125701904296875;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _789 = _787 != 0;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _793 = _737 * 6.283185482025146484375;
    float _795 = sin(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = _427 * _763;
    float _807 = _737 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _269 * _753;
    float _813 = _785 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = fma(_267, _751, _811);
    float _819 = _743 * _795;
    float _821 = _269 * _775;
    float _823 = _435 * _791;
    float _825 = _767 * _795;
    float _827 = fma(_271, _755, _817);
    float _829 = fma(_267, _773, _821);
    float _831 = _785 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _767 * _809;
    float _837 = _743 * _809;
    float _839 = fma(_271, _777, _829);
    float _841 = _827 + _757;
    float _843 = _839 + _779;
    float _845 = _815 * _805;
    float _847 = _809 * _815;
    float _849 = _767 * _845;
    float _851 = fma(_833, _835, _819);
    float _853 = -_825;
    float _855 = fma(_833, _837, _853);
    float _857 = -_837;
    float _859 = fma(_833, _825, _857);
    float _861 = _795 * _815;
    float _863 = -_805;
    float _865 = _833 * _863;
    float _867 = fma(_851, _823, _849);
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _871 = _743 * _845;
    float _873 = in.m_50.x;
    float _875 = in.m_50.y;
    float _877 = in.m_50.z;
    float _879 = in.m_50.w;
    float _881 = fma(_847, _823, _865);
    float _883 = fma(_859, _869, _867);
    float _885 = fma(_833, _819, _835);
    float _887 = fma(_855, _823, _871);
    float _889 = fma(_861, _869, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _893 = fma(_885, _869, _887);
    float _895 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].x, _891);
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].z, _897);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _915 = 1.0 / _909;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _843 + _913;
    float _921 = _269 * _875;
    float _923 = _841 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _919 + _925;
    float _929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _923 + _935;
    float _939 = _927 * _927;
    float _941 = fma(_267, _873, _921);
    bool _943 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_413);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_937, _937, _939);
    float _957 = _933 * _915;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _413 + _959;
    bool _963 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_413);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_953;
    float _977 = _975 + 1.0;
    float _979 = sqrt(_955);
    float _981 = fma(_957, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _983 = fma(_271, _877, _941);
    float _985 = _973 * _977;
    out.m_33.x = _929;
    float _987 = -_187;
    int _989 = _747 ? as_type<int>(_987) : as_type<int>(_187);
    float _991 = _983 + _879;
    float _993 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _997 = -_191;
    int _999 = _761 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _981 * _985;
    float _1003 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].z, _993);
    bool _1005 = !_783;
    float _1007 = _1005 ? _187 : as_type<float>(_989);
    float _1009 = -_973;
    float _1011 = _1009 + 1.0;
    bool _1013 = !_789;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _899 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1001);
    bool _1023 = _471 > 0.5;
    float _1025 = _1015 + (-0.5);
    float _1027 = -_187;
    int _1029 = _771 ? as_type<int>(_1027) : as_type<int>(_187);
    float _1031 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1021);
    float _1033 = -_191;
    int _1035 = _1023 ? as_type<int>(_1033) : as_type<int>(_191);
    float _1037 = _995 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1039 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = _1007 + 0.5;
    bool _1043 = !_799;
    float _1045 = _1043 ? _187 : as_type<float>(_1029);
    float _1047 = -_1037;
    float _1049 = -_597;
    float _1051 = fma(_1047, _1025, _1049);
    float _1053 = _991 + _1039;
    float _1055 = fma(_1017, _1041, _649);
    bool _1057 = !_803;
    float _1059 = _1057 ? _191 : as_type<float>(_1035);
    float _1061 = _1017;
    float _1063 = _923;
    float _1065 = _919;
    if (!_1019)
    {
        _1061 = _1053;
    }
    float _1067 = _1061;
    bool _1069 = !_1019;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _979 + _1075;
        float _1079 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_955);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = _1089 + (-1.0);
        float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = fma(_1093, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1101 = fma(_1053, _1089, _1097);
        float _1103 = _1081 * _1099;
        float _1105 = fma(_937, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1107 = fma(_927, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1071 = _1101;
        _1063 = _1105;
        _1065 = _1107;
    }
    float _1109 = _1071;
    float _1111 = _1063;
    float _1113 = _1065;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1123);
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1125);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = _1045 + 0.5;
    float _1145 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1153 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1151);
    float _1163 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1177 = _1163 * _1121;
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1183 = -_573;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1179);
    float _1191 = -_1185;
    float _1193 = fma(_1007, _1191, _1055);
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1175);
    float _1197 = -_1059;
    float _1199 = _1197 + 0.5;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1203 = -_589;
    float _1205 = _1203 + 1.0;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = _1195 + _1189;
    float _1223 = fma(_1015, _1205, _1051);
    float _1225 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * _1171;
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1221 * 0.5;
    out.m_52.x = _1213;
    out.m_52.y = _1233;
    out.m_52.z = _1235;
    out.m_52.w = _1231;
    out.m_54.x = _1229;
    out.m_54.y = _1225;
    out.m_54.z = _1237;
    out.m_56.x = _1177;
    out.m_56.y = _1227;
    out.m_56.z = _1193;
    out.m_56.w = _1223;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _1195;
    out.gl_Position.w = _1189;
    out.m_58.z = _1239;
    out.m_58.w = _1189;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    bool _405 = false;
    bool _293 = false;
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
        float _1296 = as_type<float>(_93);
        out.gl_Position.z = _1296;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1366 = as_type<float>(_131);
        out.gl_Position.z = _1366;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = as_type<float>(int(gl_VertexIndex));
    float _135 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _137 = in.m_40.w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_35.x;
    float _151 = in.m_35.y;
    float _153 = in.m_35.z;
    float _155 = in.m_30.x;
    float _157 = in.m_30.y;
    float _159 = in.m_30.z;
    float _161 = 0.0;
    float _163 = _135;
    if (!_147)
    {
        float _165 = _135 * _135;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = _169;
    if (!_147)
    {
        float _173 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    int _177 = as_type<int>(_133) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_133) & 2;
    bool _183 = _181 != 0;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_147;
    float _195 = _175;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _135 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _135);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_147;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _135 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _163 = _249;
    }
    float _251 = _163;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _149, _255);
    float _263 = fma(_251, _151, _257);
    float _265 = fma(_251, _153, _259);
    float _267 = fma(_261, _137, _155);
    float _269 = fma(_263, _137, _157);
    float _271 = fma(_265, _137, _159);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_42.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_77);
        float _297 = 1.0 / _295;
        float _299 = _111 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _301 + _303;
    float _307 = in.m_40.x;
    float _309 = in.m_40.y;
    bool _311 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _313 = isnan(_301);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _323;
    bool _327 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_301);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_321;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = 1.0 / _325;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = _337 * _341;
    float _353 = -_337;
    float _355 = _353 + 1.0;
    float _357 = _305 * _347;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _359;
    float _363 = fma(_345, _357, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = fma(_361, _357, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = _363 * _351;
    float _369 = _365 * _351;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _367);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _369);
    float _375 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].x, _371);
    float _377 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    float _379 = _375 * _307;
    float _381 = _377 * _309;
    bool _383 = !_349;
    float _385 = _307;
    float _403;
    if (!_383)
    {
        float _387 = in.m_42.x;
        float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _391 = _387 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _393 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _395 = _393 * _389;
        float _397 = floor(_395);
        float _399 = -_397;
        float _401 = _395 + _399;
        _403 = _401;
        _405 = true;
    }
    else
    {
        float _407 = float(_77);
        float _409 = 1.0 / _407;
        float _411 = _111 * _409;
        _403 = _411;
    }
    _405 = false;
    float _413 = _403;
    float _415 = in.m_42.z;
    float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _419 = log2(_417);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = in.m_42.x;
    float _427 = _381 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _429 = in.m_42.w;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _435 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _437 = _309;
    if (!_423)
    {
        float _439 = in.m_42.y;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = _419 * _111;
    float _445 = _415 * 2.0;
    float _447 = exp2(_443);
    float _449 = _425 * 2.0;
    float _451 = floor(_445);
    if (!_423)
    {
        _385 = _441;
    }
    float _453 = _385;
    float _455 = floor(_449);
    float _457 = -_447;
    float _459 = _457 + 1.0;
    float _461 = _453;
    float _463 = _441;
    if (_423)
    {
        float _465 = in.m_42.x;
        float _467 = in.m_42.y;
        _461 = _465;
        _463 = _467;
    }
    float _469 = _461;
    float _471 = _463;
    bool _473 = _451 >= 0.0;
    bool _475 = isnan(_451);
    bool _477 = _473 || _475;
    bool _479 = isnan(0.0);
    bool _481 = _477 || _479;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _451 > 0.0;
    int _497 = _481 ? 0 : 1;
    float _499 = _451;
    if (!_423)
    {
        _499 = _415;
    }
    float _501 = _499;
    bool _503 = _455 > 0.0;
    bool _505 = _455 >= 0.0;
    bool _507 = isnan(_455);
    bool _509 = _505 || _507;
    bool _511 = isnan(0.0);
    bool _513 = _509 || _511;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _517 = ~_497;
    int _519 = _517 + 1;
    int _521 = _519 + 1;
    float _523 = _501;
    int _525 = _521;
    if (_423)
    {
        _523 = _471;
    }
    float _527 = _523;
    float _529 = _469 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _531 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[83].z, _433);
    float _533 = _527;
    if (!_495)
    {
        int _535 = ~_497;
        int _537 = _535 + 1;
        _525 = _537;
    }
    int _539 = _525;
    float _541 = _471 * 2.0;
    float _543 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _431);
    float _545 = -_515;
    float _547 = fma(_529, 2.0, _545);
    if (!_423)
    {
        _533 = _415;
    }
    float _549 = _533;
    float _551 = _415 + _471;
    float _553 = floor(_541);
    float _555 = _549;
    if (_423)
    {
        _555 = _471;
    }
    float _557 = _555;
    float _559 = _551 + (-1.0);
    int _561 = _513 ? 0 : 1;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _567 = ~_561;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    float _573 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _531);
    int _575 = _571;
    if (!_503)
    {
        int _577 = ~_561;
        int _579 = _577 + 1;
        _575 = _579;
    }
    int _581 = _575;
    float _583 = fma(_565, -2.0, _563);
    float _585 = _425 + _471;
    float _587 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _589 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _543);
    float _591 = _585 + (-1.0);
    bool _593 = !_485;
    int _595 = _593 ? 0 : 1;
    float _597 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _583);
    bool _599 = !_489;
    int _601 = _599 ? 0 : 1;
    float _603 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _607 = isnan(1.0);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _617 = 1.0 + _615;
    int _619 = abs(_595);
    int _621 = abs(_601);
    float _623 = 1.0 / _617;
    float _625 = in.m_44.x;
    float _627 = in.m_44.y;
    float _629 = in.m_44.z;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = float(_619);
    float _643 = float(_539);
    float _645 = _639 ? _459 : 0.0;
    float _647 = -_111;
    float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[81].x, _547);
    bool _651 = _553 > 0.0;
    float _653 = _641 * _643;
    float _655 = float(_621);
    float _657 = _425 + (-0.5);
    float _659 = float(_581);
    float _661 = _653 * (-2.0);
    if (_613)
    {
        float _663 = _645 * _623;
        _113 = _663;
    }
    float _665 = _113;
    bool _667 = !_493;
    int _669 = _667 ? 0 : 1;
    bool _671 = _553 >= 0.0;
    bool _673 = isnan(_553);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = _655 * _659;
    int _683 = abs(_669);
    int _685 = _679 ? 0 : 1;
    float _687 = fma(_661, _625, _625);
    float _689 = fma(_603, _661, _603);
    int _691 = ~_685;
    int _693 = _691 + 1;
    int _695 = _693 + 1;
    float _697 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _687);
    float _699 = _681 * (-2.0);
    int _701 = _695;
    if (!_651)
    {
        int _703 = ~_685;
        int _705 = _703 + 1;
        _701 = _705;
    }
    int _707 = _701;
    float _709 = fma(_689, _665, _697);
    float _711 = _471 + (-0.5);
    float _713 = fma(_699, _627, _627);
    float _715 = float(_683);
    float _717 = fma(_587, _699, _587);
    float _719 = float(_707);
    float _721 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[196].y, _713);
    float _723 = _425 + _415;
    float _725 = _709 * 0.15915493667125701904296875;
    float _727 = _715 * _719;
    float _729 = fma(_717, _665, _721);
    float _731 = _723 + (-1.0);
    float _733 = _415 + (-0.5);
    float _735 = _727 * (-2.0);
    float _737 = _729 * 0.15915493667125701904296875;
    float _739 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _741 = _725 * 6.283185482025146484375;
    float _743 = sin(_741);
    float _745 = fma(_735, _629, _629);
    bool _747 = _415 > 0.5;
    float _749 = fma(_739, _735, _739);
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = in.m_46.w;
    float _759 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _745);
    bool _761 = _429 > 0.5;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _765 = _725 * 6.283185482025146484375;
    float _767 = cos(_765);
    float _769 = fma(_749, _665, _759);
    bool _771 = _425 > 0.5;
    float _773 = in.m_48.x;
    float _775 = in.m_48.y;
    float _777 = in.m_48.z;
    float _779 = in.m_48.w;
    int _781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _783 = _781 != 0;
    float _785 = _769 * 0.15915493667125701904296875;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _789 = _787 != 0;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    float _793 = _737 * 6.283185482025146484375;
    float _795 = sin(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = _427 * _763;
    float _807 = _737 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _269 * _753;
    float _813 = _785 * 6.283185482025146484375;
    float _815 = cos(_813);
    float _817 = fma(_267, _751, _811);
    float _819 = _743 * _795;
    float _821 = _269 * _775;
    float _823 = _435 * _791;
    float _825 = _767 * _795;
    float _827 = fma(_271, _755, _817);
    float _829 = fma(_267, _773, _821);
    float _831 = _785 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _767 * _809;
    float _837 = _743 * _809;
    float _839 = fma(_271, _777, _829);
    float _841 = _827 + _757;
    float _843 = _839 + _779;
    float _845 = _815 * _805;
    float _847 = _809 * _815;
    float _849 = _767 * _845;
    float _851 = fma(_833, _835, _819);
    float _853 = -_825;
    float _855 = fma(_833, _837, _853);
    float _857 = -_837;
    float _859 = fma(_833, _825, _857);
    float _861 = _795 * _815;
    float _863 = -_805;
    float _865 = _833 * _863;
    float _867 = fma(_851, _823, _849);
    float _869 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _871 = _743 * _845;
    float _873 = in.m_50.x;
    float _875 = in.m_50.y;
    float _877 = in.m_50.z;
    float _879 = in.m_50.w;
    float _881 = fma(_847, _823, _865);
    float _883 = fma(_859, _869, _867);
    float _885 = fma(_833, _819, _835);
    float _887 = fma(_855, _823, _871);
    float _889 = fma(_861, _869, _881);
    float _891 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _893 = fma(_885, _869, _887);
    float _895 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _897 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].x, _891);
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _895);
    float _905 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[26].z, _897);
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _911 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[24].z, _903);
    float _913 = _905 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _915 = 1.0 / _909;
    float _917 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _919 = _843 + _913;
    float _921 = _269 * _875;
    float _923 = _841 + _917;
    float _925 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _927 = _919 + _925;
    float _929 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _931;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _937 = _923 + _935;
    float _939 = _927 * _927;
    float _941 = fma(_267, _873, _921);
    bool _943 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _945 = isnan(_413);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_937, _937, _939);
    float _957 = _933 * _915;
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _413 + _959;
    bool _963 = _413 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _965 = isnan(_413);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = -_953;
    float _977 = _975 + 1.0;
    float _979 = sqrt(_955);
    float _981 = fma(_957, _961, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _983 = fma(_271, _877, _941);
    float _985 = _973 * _977;
    out.m_33.x = _929;
    float _987 = -_187;
    int _989 = _747 ? as_type<int>(_987) : as_type<int>(_187);
    float _991 = _983 + _879;
    float _993 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].x, _901);
    float _995 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _997 = -_191;
    int _999 = _761 ? as_type<int>(_997) : as_type<int>(_191);
    float _1001 = _981 * _985;
    float _1003 = fma(_893, (*spvDescriptorSet0.vp_c8)._m0[25].z, _993);
    bool _1005 = !_783;
    float _1007 = _1005 ? _187 : as_type<float>(_989);
    float _1009 = -_973;
    float _1011 = _1009 + 1.0;
    bool _1013 = !_789;
    float _1015 = _1013 ? _191 : as_type<float>(_999);
    float _1017 = _899 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1019 = _979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1001);
    bool _1023 = _471 > 0.5;
    float _1025 = _1015 + (-0.5);
    float _1027 = -_187;
    int _1029 = _771 ? as_type<int>(_1027) : as_type<int>(_187);
    float _1031 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1021);
    float _1033 = -_191;
    int _1035 = _1023 ? as_type<int>(_1033) : as_type<int>(_191);
    float _1037 = _995 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1039 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1041 = _1007 + 0.5;
    bool _1043 = !_799;
    float _1045 = _1043 ? _187 : as_type<float>(_1029);
    float _1047 = -_1037;
    float _1049 = -_597;
    float _1051 = fma(_1047, _1025, _1049);
    float _1053 = _991 + _1039;
    float _1055 = fma(_1017, _1041, _649);
    bool _1057 = !_803;
    float _1059 = _1057 ? _191 : as_type<float>(_1035);
    float _1061 = _1017;
    float _1063 = _923;
    float _1065 = _919;
    if (!_1019)
    {
        _1061 = _1053;
    }
    float _1067 = _1061;
    bool _1069 = !_1019;
    float _1071 = _1067;
    if (!_1069)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _979 + _1075;
        float _1079 = _1053 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_955);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = _1089 + (-1.0);
        float _1097 = _1095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1099 = fma(_1093, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1101 = fma(_1053, _1089, _1097);
        float _1103 = _1081 * _1099;
        float _1105 = fma(_937, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1107 = fma(_927, _1103, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1071 = _1101;
        _1063 = _1105;
        _1065 = _1107;
    }
    float _1109 = _1071;
    float _1111 = _1063;
    float _1113 = _1065;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1123 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1115);
    float _1125 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1119);
    float _1131 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1123);
    float _1133 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1125);
    float _1135 = fma(_1111, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1143 = _1045 + 0.5;
    float _1145 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1149 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1153 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1155 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1147);
    float _1159 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1149);
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1151);
    float _1163 = _1143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1165 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1167 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1173 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1175 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1177 = _1163 * _1121;
    float _1179 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1165);
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1183 = -_573;
    float _1185 = _1183 + 1.0;
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1173);
    float _1189 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1179);
    float _1191 = -_1185;
    float _1193 = fma(_1007, _1191, _1055);
    float _1195 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1175);
    float _1197 = -_1059;
    float _1199 = _1197 + 0.5;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1203 = -_589;
    float _1205 = _1203 + 1.0;
    float _1207 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1209 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1221 = _1195 + _1189;
    float _1223 = fma(_1015, _1205, _1051);
    float _1225 = _1207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1227 = _1209 * _1171;
    float _1229 = _1211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1233 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1235 = _1217 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1239 = _1221 * 0.5;
    out.m_52.x = _1213;
    out.m_52.y = _1233;
    out.m_52.z = _1235;
    out.m_52.w = _1231;
    out.m_54.x = _1229;
    out.m_54.y = _1225;
    out.m_54.z = _1237;
    out.m_56.x = _1177;
    out.m_56.y = _1227;
    out.m_56.z = _1193;
    out.m_56.w = _1223;
    out.gl_Position.x = _1181;
    out.gl_Position.y = _1187;
    out.gl_Position.z = _1195;
    out.gl_Position.w = _1189;
    out.m_58.z = _1239;
    out.m_58.w = _1189;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

