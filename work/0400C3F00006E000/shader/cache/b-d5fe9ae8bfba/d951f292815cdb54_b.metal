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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_58 [[user(locn5)]];
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _531 = false;
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
        float _1564 = as_type<float>(_93);
        out.gl_Position.z = _1564;
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
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_131);
        out.gl_Position.z = _1633;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_39.x;
    float _145 = in.m_39.y;
    float _147 = in.m_39.z;
    float _149 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = in.m_43.x;
    float _169 = _141 * _139;
    float _171 = 0.0;
    float _173 = _149;
    if (!_159)
    {
        float _175 = _149 * _149;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _135 * _135;
    float _183 = _137 * _137;
    float _185 = _133 * _133;
    float _187 = _179;
    float _189 = _135;
    if (!_159)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = fma(_145, _145, _181);
    float _197 = fma(_147, _147, _183);
    float _199 = fma(_143, _143, _185);
    float _201 = fma(_163, _163, _195);
    float _203 = fma(_165, _165, _197);
    float _205 = fma(_161, _161, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _211 = sqrt(_203);
    float _213 = sqrt(_205);
    bool _215 = _207 > 0.0;
    int _217 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _219 = _217 != 0;
    float _221 = floor(_209);
    bool _223 = _211 > 0.0;
    bool _225 = _213 > 0.0;
    float _227 = _213;
    float _229 = _205;
    float _231 = _193;
    float _233 = 1.4012984643248170709237295832899e-45;
    float _235 = _203;
    float _237 = _145;
    if (_215)
    {
        float _239 = rsqrt(_201);
        _227 = _239;
    }
    float _241 = _227;
    float _243 = -_221;
    float _245 = _209 + _243;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = 0.0;
    float _251 = _247;
    if (_223)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = 0.0;
    if (!_225)
    {
        _257 = 0.0;
        _259 = 0.0;
    }
    float _261 = _257;
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (_225)
    {
        float _271 = rsqrt(_205);
        _265 = _271;
    }
    float _273 = _265;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _275 = _229;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _149 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _149);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _309;
        _233 = _295;
        _235 = _297;
    }
    float _311 = _231;
    float _313 = _233;
    float _315 = _235;
    bool _317 = !_159;
    float _319 = _313;
    float _321 = _315;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _149 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _173 = _341;
    }
    float _343 = _173;
    float _345 = _247 * 0.15915493667125701904296875;
    float _347 = in.m_35.x;
    float _349 = in.m_35.y;
    float _351 = in.m_35.z;
    if (_225)
    {
        float _353 = _273 * _143;
        _267 = _353;
    }
    float _355 = _267;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _357 = _251;
    float _359 = _357;
    if (_225)
    {
        float _361 = _273 * _133;
        _279 = _361;
    }
    float _363 = _279;
    float _365 = _345 * 6.283185482025146484375;
    float _367 = cos(_365);
    if (!_215)
    {
        _319 = 0.0;
    }
    float _369 = _319;
    float _371 = _369;
    if (_225)
    {
        float _373 = _273 * _161;
        _269 = _373;
    }
    float _375 = _269;
    float _377 = 0.0;
    if (!_215)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_215)
    {
        float _383 = _241 * _145;
        _359 = _383;
    }
    float _385 = _359;
    if (_215)
    {
        float _387 = _241 * _135;
        _371 = _387;
    }
    float _389 = _371;
    if (_215)
    {
        float _391 = _241 * _163;
        _381 = _391;
    }
    float _393 = _381;
    float _395 = in.m_45.w;
    float _397 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _405 = _403 != 0;
    float _407 = in.m_30.x;
    float _409 = in.m_30.y;
    float _411 = in.m_30.z;
    bool _413 = _245 < 0.5;
    float _415 = float(_413);
    float _417 = -_245;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _421 = 0.0;
    float _423 = 0.0;
    if (!_223)
    {
        _421 = 0.0;
        _423 = 0.0;
    }
    float _425 = _421;
    float _427 = _423;
    float _429 = fma(_367, 0.5, 0.5);
    bool _431 = !_401;
    int _433 = _431 ? 0 : 1;
    float _435 = -_415;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _439 = _427;
    float _441 = _425;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _443 = _321;
    float _445 = -_429;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _449 = abs(_433);
    float _451 = _443;
    if (_223)
    {
        float _453 = _255 * _147;
        _439 = _453;
    }
    float _455 = _439;
    if (_223)
    {
        float _457 = _255 * _137;
        _451 = _457;
    }
    float _459 = _451;
    if (_223)
    {
        float _461 = _255 * _165;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = fma(_343, _347, _397);
    bool _467 = !_405;
    int _469 = _467 ? 0 : 1;
    float _471 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_219;
    int _475 = _473 ? 0 : 1;
    float _477 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_343, _349, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _483 = abs(_469);
    int _485 = abs(_475);
    float _487 = fma(_465, _395, _407);
    float _489 = float(_449);
    float _491 = fma(_479, _395, _409);
    float _493 = float(_485);
    float _495 = fma(_343, _351, _477);
    float _497 = abs(_419);
    float _499 = _489 * _497;
    float _501 = fma(_495, _395, _411);
    float _503 = float(_483);
    float _505 = fma(_493, _447, _499);
    float _507 = abs(_437);
    float _509 = fma(_503, _507, _505);
    bool _511 = !_481;
    float _513 = _491;
    float _529;
    if (!_511)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_77);
        float _535 = 1.0 / _533;
        float _537 = _111 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _557;
    float _561 = -_555;
    float _563 = _561 + 1.0;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _559;
    float _569 = _543 * _567;
    bool _571 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _573 = isnan(_539);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = _581 * _563;
    float _593 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_589, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = -_581;
    float _599 = _597 + 1.0;
    float _601 = _593 * _591;
    float _603 = _595 * _591;
    float _605 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _609 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].x, _605);
    float _611 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].y, _607);
    bool _613 = !_565;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_77);
        float _635 = 1.0 / _633;
        float _637 = _111 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_43.z;
    float _643 = in.m_43.w;
    float _645 = _167 * 2.0;
    float _647 = _491 * _135;
    float _649 = in.m_43.y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = _491 * _145;
    float _657 = floor(_645);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _669 = _667 != 0;
    float _671 = _491 * _163;
    float _673 = fma(_487, _143, _655);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = fma(_487, _133, _647);
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    bool _683 = !_665;
    int _685 = _683 ? 0 : 1;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_653)
    {
        float _689 = in.m_43.z;
        _687 = _689;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = fma(_501, _147, _673);
    int _697 = abs(_685);
    float _699 = fma(_501, _137, _677);
    float _701 = _641 * 2.0;
    bool _703 = _657 >= 0.0;
    bool _705 = isnan(_657);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _715 = _657 > 0.0;
    if (!_653)
    {
        _189 = _649;
    }
    float _717 = _189;
    float _719 = floor(_701);
    int _721 = _711 ? 0 : 1;
    float _723 = _713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _725 = _717;
    if (!_653)
    {
        _237 = _717;
    }
    float _727 = _237;
    float _729 = _727;
    if (_653)
    {
        _725 = _649;
    }
    float _731 = _725;
    out.m_33.x = _723;
    if (_653)
    {
        _729 = _167;
    }
    float _733 = _729;
    float _735 = _731 * 2.0;
    int _737 = ~_721;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _745 = _691;
    int _747 = _741;
    if (!_653)
    {
        _513 = _691;
    }
    float _749 = _513;
    float _751 = floor(_735);
    float _753 = _749;
    if (_653)
    {
        _745 = _731;
    }
    float _755 = _745;
    bool _757 = _719 > 0.0;
    bool _759 = _719 >= 0.0;
    bool _761 = isnan(_719);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = _767 ? 0 : 1;
    if (!_715)
    {
        int _771 = ~_721;
        int _773 = _771 + 1;
        _747 = _773;
    }
    int _775 = _747;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _779 = ~_769;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    int _785 = _783;
    if (_653)
    {
        _753 = _731;
    }
    float _787 = _753;
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[83].z, _777);
    float _791 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _743);
    float _795 = _167 + _731;
    if (!_757)
    {
        int _797 = ~_769;
        int _799 = _797 + 1;
        _785 = _799;
    }
    int _801 = _785;
    float _803 = -_675;
    float _805 = fma(_791, 2.0, _803);
    float _807 = _641 + _731;
    float _809 = _795 + (-1.0);
    float _811 = _681 * _111;
    float _813 = _807 + (-1.0);
    float _815 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _817 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _831 = !_661;
    int _833 = _831 ? 0 : 1;
    float _835 = exp2(_811);
    float _837 = fma(_815, -2.0, _693);
    float _839 = float(_775);
    float _841 = in.m_47.x;
    float _843 = in.m_47.y;
    float _845 = in.m_47.z;
    int _847 = abs(_833);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    float _853 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _789);
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = -_111;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    float _869 = float(_697);
    float _871 = 1.0 / _851;
    float _873 = float(_847);
    float _875 = in.m_39.w;
    float _877 = float(_801);
    float _879 = _869 * _839;
    float _881 = -_835;
    float _883 = _881 + 1.0;
    bool _885 = _751 > 0.0;
    bool _887 = _751 >= 0.0;
    bool _889 = isnan(_751);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _879 * (-2.0);
    float _899 = _863 ? _883 : 0.0;
    float _901 = _873 * _877;
    float _903 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _793);
    float _905 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    int _907 = _895 ? 0 : 1;
    if (_827)
    {
        float _909 = _899 * _871;
        _115 = _909;
    }
    float _911 = _115;
    float _913 = _731 + (-0.5);
    float _915 = fma(_897, _843, _843);
    float _917 = fma(_829, _897, _829);
    bool _919 = !_669;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _915);
    int _925 = ~_907;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _901 * (-2.0);
    int _933 = _929;
    if (!_885)
    {
        int _935 = ~_907;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = fma(_917, _911, _923);
    int _943 = abs(_921);
    float _945 = fma(_817, _931, _817);
    float _947 = fma(_931, _841, _841);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = _167 + (-0.5);
    float _953 = float(_943);
    float _955 = as_type<float>(int(gl_VertexIndex));
    float _957 = float(_939);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    bool _961 = _167 > 0.5;
    float _963 = _167 + _641;
    float _965 = _953 * _957;
    float _967 = fma(_945, _911, _959);
    float _969 = _963 + (-1.0);
    float _971 = _949 * 6.283185482025146484375;
    float _973 = sin(_971);
    float _975 = _965 * (-2.0);
    float _977 = _967 * 0.15915493667125701904296875;
    float _979 = in.m_45.x;
    float _981 = in.m_45.y;
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_975, _845, _845);
    float _987 = _641 + (-0.5);
    float _989 = fma(_983, _975, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _997 = fma(_487, _161, _671);
    float _999 = fma(_989, _911, _995);
    int _1001 = as_type<int>(_955) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_955) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = fma(_501, _165, _997);
    float _1011 = _977 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _999 * 0.15915493667125701904296875;
    bool _1017 = _643 > 0.5;
    float _1019 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1021 = !_1003;
    float _1023 = _1021 ? (-0.5) : 0.5;
    bool _1025 = !_1007;
    float _1027 = _1025 ? (-0.5) : 0.5;
    float _1029 = _977 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    bool _1033 = _641 > 0.5;
    float _1035 = _609 * _979;
    float _1037 = _611 * _981;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1023);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1027);
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = _1015 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = _1013 * _993;
    float _1053 = _1043 * _1039;
    float _1055 = _1045 * _1041;
    float _1057 = in.m_41.w;
    float _1059 = _1013 * _973;
    float _1061 = _1015 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1031 * _973;
    float _1067 = _1031 * _993;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1079 = _1077 != 0;
    float _1081 = _1049 * _1019;
    float _1083 = _973 * _1049;
    float _1085 = _993 * _1049;
    float _1087 = _1031 * _1081;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1091 = _1089 != 0;
    float _1093 = -_1065;
    float _1095 = fma(_1063, _1051, _1093);
    float _1097 = -_1051;
    float _1099 = fma(_1063, _1065, _1097);
    float _1101 = fma(_1063, _1067, _1059);
    float _1103 = _1063 * _1019;
    float _1105 = fma(_1063, _1059, _1067);
    float _1107 = _1013 * _1081;
    float _1109 = fma(_1101, _1053, _1087);
    float _1111 = -_1103;
    float _1113 = fma(_1085, _1053, _1111);
    float _1115 = fma(_1095, _1053, _1107);
    float _1117 = -_1055;
    float _1119 = fma(_1099, _1117, _1109);
    float _1121 = -_1055;
    float _1123 = fma(_1083, _1121, _1113);
    float _1125 = -_1055;
    float _1127 = fma(_1105, _1125, _1115);
    float _1129 = _1119 * _393;
    float _1131 = _1119 * _385;
    float _1133 = _1009 + _1057;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = fma(_1123, _375, _1129);
    float _1141 = fma(_1123, _355, _1131);
    float _1143 = _695 + _875;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1147 = fma(_1127, _463, _1139);
    float _1149 = fma(_1127, _455, _1141);
    float _1151 = _1133 + _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = in.m_37.w;
    float _1159 = 1.0 / _1137;
    float _1161 = _1143 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1151 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1177 = _1161 + _1175;
    float _1179 = _1165 * _1165;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1185 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1187 = isnan(_639);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    out.m_52.x = _1169;
    out.m_52.y = _1171;
    out.m_52.z = _1173;
    out.m_52.w = _1167;
    bool _1197 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1199 = isnan(_639);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = 1.0 / _1183;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1211;
    float _1215 = -_1195;
    float _1217 = _1215 + 1.0;
    float _1219 = _1119 * _389;
    float _1221 = _1213 * _1159;
    float _1223 = _1207 * _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1227 = _639 + _1225;
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1235 = isnan(_639);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1123, _363, _1219);
    float _1247 = fma(_1221, _1227, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1249 = fma(_1177, _1177, _1179);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1255 = _1243 * _1231;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1259 = _699 + _1157;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _639 + _1261;
    float _1265 = -_1023;
    int _1267 = _1033 ? as_type<int>(_1265) : as_type<int>(_1023);
    float _1269 = _1253 * _1209;
    float _1271 = _1247 * _1255;
    float _1273 = -_1023;
    int _1275 = _961 ? as_type<int>(_1273) : as_type<int>(_1023);
    float _1277 = -_1243;
    float _1279 = _1277 + 1.0;
    float _1281 = sqrt(_1249);
    bool _1283 = !_1071;
    float _1285 = _1283 ? _1023 : as_type<float>(_1267);
    float _1287 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1289 = !_1075;
    float _1291 = _1289 ? _1023 : as_type<float>(_1275);
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1271);
    bool _1295 = _731 > 0.5;
    float _1297 = _1285 + 0.5;
    float _1299 = -_1027;
    int _1301 = _1017 ? as_type<int>(_1299) : as_type<int>(_1027);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1305 = fma(_1287, _1223, _1293);
    float _1307 = fma(_1127, _459, _1245);
    float _1309 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = -_1027;
    int _1313 = _1295 ? as_type<int>(_1311) : as_type<int>(_1027);
    float _1315 = _1259 + _1307;
    bool _1317 = !_1079;
    float _1319 = _1317 ? _1027 : as_type<float>(_1301);
    float _1321 = fma(_1309, _1297, _867);
    bool _1323 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1091;
    float _1327 = _1325 ? _1027 : as_type<float>(_1313);
    float _1329 = _1309;
    float _1331 = _1297;
    float _1333 = _1151;
    if (!_1323)
    {
        _1329 = _1161;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (!_1323)
    {
        _1331 = _1315;
    }
    float _1339 = _1331;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1281 + _1347;
        float _1351 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1249);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1315, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1177, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1165, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1337 = _1377;
        _1333 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1337;
    float _1385 = _1333;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1391 = _1319 + (-0.5);
    float _1393 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1397 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1399 = -_1389;
    float _1401 = -_905;
    float _1403 = fma(_1399, _1391, _1401);
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1407 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1397);
    float _1411 = -_853;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = -_903;
    float _1423 = _1421 + 1.0;
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = -_1327;
    float _1437 = _1435 + 0.5;
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1305);
    float _1445 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1449 = -_1413;
    float _1451 = fma(_1285, _1449, _1321);
    float _1453 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1455 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1461 = fma(_1319, _1423, _1403);
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1467 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1469 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1471 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1455);
    float _1473 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1475 = _1463 * _1439;
    float _1477 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1465);
    float _1479 = _1291 + 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * _1457;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    float _1505 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1473);
    out.m_54.x = _1495;
    out.m_54.y = _1475;
    out.m_54.z = _1451;
    out.m_54.w = _1461;
    out.m_56.x = _1493;
    out.m_56.y = _1497;
    out.m_56.z = _1499;
    out.m_56.w = _1501;
    out.m_58.x = _1383;
    out.m_58.z = _1385;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1491;
    out.gl_Position.z = _1505;
    out.gl_Position.w = _1507;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _531 = false;
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
        float _1564 = as_type<float>(_93);
        out.gl_Position.z = _1564;
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
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_131);
        out.gl_Position.z = _1633;
    }
    if (_125)
    {
        return out;
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_39.x;
    float _145 = in.m_39.y;
    float _147 = in.m_39.z;
    float _149 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = in.m_43.x;
    float _169 = _141 * _139;
    float _171 = 0.0;
    float _173 = _149;
    if (!_159)
    {
        float _175 = _149 * _149;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _135 * _135;
    float _183 = _137 * _137;
    float _185 = _133 * _133;
    float _187 = _179;
    float _189 = _135;
    if (!_159)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = fma(_145, _145, _181);
    float _197 = fma(_147, _147, _183);
    float _199 = fma(_143, _143, _185);
    float _201 = fma(_163, _163, _195);
    float _203 = fma(_165, _165, _197);
    float _205 = fma(_161, _161, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _211 = sqrt(_203);
    float _213 = sqrt(_205);
    bool _215 = _207 > 0.0;
    int _217 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _219 = _217 != 0;
    float _221 = floor(_209);
    bool _223 = _211 > 0.0;
    bool _225 = _213 > 0.0;
    float _227 = _213;
    float _229 = _205;
    float _231 = _193;
    float _233 = 1.4012984643248170709237295832899e-45;
    float _235 = _203;
    float _237 = _145;
    if (_215)
    {
        float _239 = rsqrt(_201);
        _227 = _239;
    }
    float _241 = _227;
    float _243 = -_221;
    float _245 = _209 + _243;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = 0.0;
    float _251 = _247;
    if (_223)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = 0.0;
    if (!_225)
    {
        _257 = 0.0;
        _259 = 0.0;
    }
    float _261 = _257;
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (_225)
    {
        float _271 = rsqrt(_205);
        _265 = _271;
    }
    float _273 = _265;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _275 = _229;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _149 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _149);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _309;
        _233 = _295;
        _235 = _297;
    }
    float _311 = _231;
    float _313 = _233;
    float _315 = _235;
    bool _317 = !_159;
    float _319 = _313;
    float _321 = _315;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _149 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _173 = _341;
    }
    float _343 = _173;
    float _345 = _247 * 0.15915493667125701904296875;
    float _347 = in.m_35.x;
    float _349 = in.m_35.y;
    float _351 = in.m_35.z;
    if (_225)
    {
        float _353 = _273 * _143;
        _267 = _353;
    }
    float _355 = _267;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _357 = _251;
    float _359 = _357;
    if (_225)
    {
        float _361 = _273 * _133;
        _279 = _361;
    }
    float _363 = _279;
    float _365 = _345 * 6.283185482025146484375;
    float _367 = cos(_365);
    if (!_215)
    {
        _319 = 0.0;
    }
    float _369 = _319;
    float _371 = _369;
    if (_225)
    {
        float _373 = _273 * _161;
        _269 = _373;
    }
    float _375 = _269;
    float _377 = 0.0;
    if (!_215)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_215)
    {
        float _383 = _241 * _145;
        _359 = _383;
    }
    float _385 = _359;
    if (_215)
    {
        float _387 = _241 * _135;
        _371 = _387;
    }
    float _389 = _371;
    if (_215)
    {
        float _391 = _241 * _163;
        _381 = _391;
    }
    float _393 = _381;
    float _395 = in.m_45.w;
    float _397 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _405 = _403 != 0;
    float _407 = in.m_30.x;
    float _409 = in.m_30.y;
    float _411 = in.m_30.z;
    bool _413 = _245 < 0.5;
    float _415 = float(_413);
    float _417 = -_245;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _421 = 0.0;
    float _423 = 0.0;
    if (!_223)
    {
        _421 = 0.0;
        _423 = 0.0;
    }
    float _425 = _421;
    float _427 = _423;
    float _429 = fma(_367, 0.5, 0.5);
    bool _431 = !_401;
    int _433 = _431 ? 0 : 1;
    float _435 = -_415;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _439 = _427;
    float _441 = _425;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _443 = _321;
    float _445 = -_429;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _449 = abs(_433);
    float _451 = _443;
    if (_223)
    {
        float _453 = _255 * _147;
        _439 = _453;
    }
    float _455 = _439;
    if (_223)
    {
        float _457 = _255 * _137;
        _451 = _457;
    }
    float _459 = _451;
    if (_223)
    {
        float _461 = _255 * _165;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = fma(_343, _347, _397);
    bool _467 = !_405;
    int _469 = _467 ? 0 : 1;
    float _471 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_219;
    int _475 = _473 ? 0 : 1;
    float _477 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_343, _349, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _483 = abs(_469);
    int _485 = abs(_475);
    float _487 = fma(_465, _395, _407);
    float _489 = float(_449);
    float _491 = fma(_479, _395, _409);
    float _493 = float(_485);
    float _495 = fma(_343, _351, _477);
    float _497 = abs(_419);
    float _499 = _489 * _497;
    float _501 = fma(_495, _395, _411);
    float _503 = float(_483);
    float _505 = fma(_493, _447, _499);
    float _507 = abs(_437);
    float _509 = fma(_503, _507, _505);
    bool _511 = !_481;
    float _513 = _491;
    float _529;
    if (!_511)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_77);
        float _535 = 1.0 / _533;
        float _537 = _111 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _557;
    float _561 = -_555;
    float _563 = _561 + 1.0;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _559;
    float _569 = _543 * _567;
    bool _571 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _573 = isnan(_539);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = _581 * _563;
    float _593 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_589, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = -_581;
    float _599 = _597 + 1.0;
    float _601 = _593 * _591;
    float _603 = _595 * _591;
    float _605 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _609 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].x, _605);
    float _611 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].y, _607);
    bool _613 = !_565;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_77);
        float _635 = 1.0 / _633;
        float _637 = _111 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_43.z;
    float _643 = in.m_43.w;
    float _645 = _167 * 2.0;
    float _647 = _491 * _135;
    float _649 = in.m_43.y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = _491 * _145;
    float _657 = floor(_645);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _669 = _667 != 0;
    float _671 = _491 * _163;
    float _673 = fma(_487, _143, _655);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = fma(_487, _133, _647);
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    bool _683 = !_665;
    int _685 = _683 ? 0 : 1;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_653)
    {
        float _689 = in.m_43.z;
        _687 = _689;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = fma(_501, _147, _673);
    int _697 = abs(_685);
    float _699 = fma(_501, _137, _677);
    float _701 = _641 * 2.0;
    bool _703 = _657 >= 0.0;
    bool _705 = isnan(_657);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _715 = _657 > 0.0;
    if (!_653)
    {
        _189 = _649;
    }
    float _717 = _189;
    float _719 = floor(_701);
    int _721 = _711 ? 0 : 1;
    float _723 = _713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _725 = _717;
    if (!_653)
    {
        _237 = _717;
    }
    float _727 = _237;
    float _729 = _727;
    if (_653)
    {
        _725 = _649;
    }
    float _731 = _725;
    out.m_33.x = _723;
    if (_653)
    {
        _729 = _167;
    }
    float _733 = _729;
    float _735 = _731 * 2.0;
    int _737 = ~_721;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _745 = _691;
    int _747 = _741;
    if (!_653)
    {
        _513 = _691;
    }
    float _749 = _513;
    float _751 = floor(_735);
    float _753 = _749;
    if (_653)
    {
        _745 = _731;
    }
    float _755 = _745;
    bool _757 = _719 > 0.0;
    bool _759 = _719 >= 0.0;
    bool _761 = isnan(_719);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = _767 ? 0 : 1;
    if (!_715)
    {
        int _771 = ~_721;
        int _773 = _771 + 1;
        _747 = _773;
    }
    int _775 = _747;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _779 = ~_769;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    int _785 = _783;
    if (_653)
    {
        _753 = _731;
    }
    float _787 = _753;
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[83].z, _777);
    float _791 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _743);
    float _795 = _167 + _731;
    if (!_757)
    {
        int _797 = ~_769;
        int _799 = _797 + 1;
        _785 = _799;
    }
    int _801 = _785;
    float _803 = -_675;
    float _805 = fma(_791, 2.0, _803);
    float _807 = _641 + _731;
    float _809 = _795 + (-1.0);
    float _811 = _681 * _111;
    float _813 = _807 + (-1.0);
    float _815 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _817 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _831 = !_661;
    int _833 = _831 ? 0 : 1;
    float _835 = exp2(_811);
    float _837 = fma(_815, -2.0, _693);
    float _839 = float(_775);
    float _841 = in.m_47.x;
    float _843 = in.m_47.y;
    float _845 = in.m_47.z;
    int _847 = abs(_833);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    float _853 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _789);
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = -_111;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    float _869 = float(_697);
    float _871 = 1.0 / _851;
    float _873 = float(_847);
    float _875 = in.m_39.w;
    float _877 = float(_801);
    float _879 = _869 * _839;
    float _881 = -_835;
    float _883 = _881 + 1.0;
    bool _885 = _751 > 0.0;
    bool _887 = _751 >= 0.0;
    bool _889 = isnan(_751);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _879 * (-2.0);
    float _899 = _863 ? _883 : 0.0;
    float _901 = _873 * _877;
    float _903 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _793);
    float _905 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    int _907 = _895 ? 0 : 1;
    if (_827)
    {
        float _909 = _899 * _871;
        _115 = _909;
    }
    float _911 = _115;
    float _913 = _731 + (-0.5);
    float _915 = fma(_897, _843, _843);
    float _917 = fma(_829, _897, _829);
    bool _919 = !_669;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _915);
    int _925 = ~_907;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _901 * (-2.0);
    int _933 = _929;
    if (!_885)
    {
        int _935 = ~_907;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = fma(_917, _911, _923);
    int _943 = abs(_921);
    float _945 = fma(_817, _931, _817);
    float _947 = fma(_931, _841, _841);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = _167 + (-0.5);
    float _953 = float(_943);
    float _955 = as_type<float>(int(gl_VertexIndex));
    float _957 = float(_939);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    bool _961 = _167 > 0.5;
    float _963 = _167 + _641;
    float _965 = _953 * _957;
    float _967 = fma(_945, _911, _959);
    float _969 = _963 + (-1.0);
    float _971 = _949 * 6.283185482025146484375;
    float _973 = sin(_971);
    float _975 = _965 * (-2.0);
    float _977 = _967 * 0.15915493667125701904296875;
    float _979 = in.m_45.x;
    float _981 = in.m_45.y;
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_975, _845, _845);
    float _987 = _641 + (-0.5);
    float _989 = fma(_983, _975, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _997 = fma(_487, _161, _671);
    float _999 = fma(_989, _911, _995);
    int _1001 = as_type<int>(_955) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_955) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = fma(_501, _165, _997);
    float _1011 = _977 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _999 * 0.15915493667125701904296875;
    bool _1017 = _643 > 0.5;
    float _1019 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1021 = !_1003;
    float _1023 = _1021 ? (-0.5) : 0.5;
    bool _1025 = !_1007;
    float _1027 = _1025 ? (-0.5) : 0.5;
    float _1029 = _977 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    bool _1033 = _641 > 0.5;
    float _1035 = _609 * _979;
    float _1037 = _611 * _981;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1023);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1027);
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = _1015 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = _1013 * _993;
    float _1053 = _1043 * _1039;
    float _1055 = _1045 * _1041;
    float _1057 = in.m_41.w;
    float _1059 = _1013 * _973;
    float _1061 = _1015 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1031 * _973;
    float _1067 = _1031 * _993;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1079 = _1077 != 0;
    float _1081 = _1049 * _1019;
    float _1083 = _973 * _1049;
    float _1085 = _993 * _1049;
    float _1087 = _1031 * _1081;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1091 = _1089 != 0;
    float _1093 = -_1065;
    float _1095 = fma(_1063, _1051, _1093);
    float _1097 = -_1051;
    float _1099 = fma(_1063, _1065, _1097);
    float _1101 = fma(_1063, _1067, _1059);
    float _1103 = _1063 * _1019;
    float _1105 = fma(_1063, _1059, _1067);
    float _1107 = _1013 * _1081;
    float _1109 = fma(_1101, _1053, _1087);
    float _1111 = -_1103;
    float _1113 = fma(_1085, _1053, _1111);
    float _1115 = fma(_1095, _1053, _1107);
    float _1117 = -_1055;
    float _1119 = fma(_1099, _1117, _1109);
    float _1121 = -_1055;
    float _1123 = fma(_1083, _1121, _1113);
    float _1125 = -_1055;
    float _1127 = fma(_1105, _1125, _1115);
    float _1129 = _1119 * _393;
    float _1131 = _1119 * _385;
    float _1133 = _1009 + _1057;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = fma(_1123, _375, _1129);
    float _1141 = fma(_1123, _355, _1131);
    float _1143 = _695 + _875;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1147 = fma(_1127, _463, _1139);
    float _1149 = fma(_1127, _455, _1141);
    float _1151 = _1133 + _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = in.m_37.w;
    float _1159 = 1.0 / _1137;
    float _1161 = _1143 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1151 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1177 = _1161 + _1175;
    float _1179 = _1165 * _1165;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1185 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1187 = isnan(_639);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    out.m_52.x = _1169;
    out.m_52.y = _1171;
    out.m_52.z = _1173;
    out.m_52.w = _1167;
    bool _1197 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1199 = isnan(_639);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = 1.0 / _1183;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1211;
    float _1215 = -_1195;
    float _1217 = _1215 + 1.0;
    float _1219 = _1119 * _389;
    float _1221 = _1213 * _1159;
    float _1223 = _1207 * _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1227 = _639 + _1225;
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1235 = isnan(_639);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1123, _363, _1219);
    float _1247 = fma(_1221, _1227, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1249 = fma(_1177, _1177, _1179);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1255 = _1243 * _1231;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1259 = _699 + _1157;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _639 + _1261;
    float _1265 = -_1023;
    int _1267 = _1033 ? as_type<int>(_1265) : as_type<int>(_1023);
    float _1269 = _1253 * _1209;
    float _1271 = _1247 * _1255;
    float _1273 = -_1023;
    int _1275 = _961 ? as_type<int>(_1273) : as_type<int>(_1023);
    float _1277 = -_1243;
    float _1279 = _1277 + 1.0;
    float _1281 = sqrt(_1249);
    bool _1283 = !_1071;
    float _1285 = _1283 ? _1023 : as_type<float>(_1267);
    float _1287 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1289 = !_1075;
    float _1291 = _1289 ? _1023 : as_type<float>(_1275);
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1271);
    bool _1295 = _731 > 0.5;
    float _1297 = _1285 + 0.5;
    float _1299 = -_1027;
    int _1301 = _1017 ? as_type<int>(_1299) : as_type<int>(_1027);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1305 = fma(_1287, _1223, _1293);
    float _1307 = fma(_1127, _459, _1245);
    float _1309 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = -_1027;
    int _1313 = _1295 ? as_type<int>(_1311) : as_type<int>(_1027);
    float _1315 = _1259 + _1307;
    bool _1317 = !_1079;
    float _1319 = _1317 ? _1027 : as_type<float>(_1301);
    float _1321 = fma(_1309, _1297, _867);
    bool _1323 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1091;
    float _1327 = _1325 ? _1027 : as_type<float>(_1313);
    float _1329 = _1309;
    float _1331 = _1297;
    float _1333 = _1151;
    if (!_1323)
    {
        _1329 = _1161;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (!_1323)
    {
        _1331 = _1315;
    }
    float _1339 = _1331;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1281 + _1347;
        float _1351 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1249);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1315, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1177, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1165, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1337 = _1377;
        _1333 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1337;
    float _1385 = _1333;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1391 = _1319 + (-0.5);
    float _1393 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1397 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1399 = -_1389;
    float _1401 = -_905;
    float _1403 = fma(_1399, _1391, _1401);
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1407 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1397);
    float _1411 = -_853;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = -_903;
    float _1423 = _1421 + 1.0;
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = -_1327;
    float _1437 = _1435 + 0.5;
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1305);
    float _1445 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1449 = -_1413;
    float _1451 = fma(_1285, _1449, _1321);
    float _1453 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1455 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1461 = fma(_1319, _1423, _1403);
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1467 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1469 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1471 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1455);
    float _1473 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1475 = _1463 * _1439;
    float _1477 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1465);
    float _1479 = _1291 + 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * _1457;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    float _1505 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1473);
    out.m_54.x = _1495;
    out.m_54.y = _1475;
    out.m_54.z = _1451;
    out.m_54.w = _1461;
    out.m_56.x = _1493;
    out.m_56.y = _1497;
    out.m_56.z = _1499;
    out.m_56.w = _1501;
    out.m_58.x = _1383;
    out.m_58.z = _1385;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1491;
    out.gl_Position.z = _1505;
    out.gl_Position.w = _1507;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _531 = false;
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
        float _1564 = as_type<float>(_93);
        out.gl_Position.z = _1564;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_35.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    float _115 = _111;
    if (_107)
    {
        float _117 = float(_77);
        _113 = _117;
    }
    float _119 = _113;
    bool _121 = _111 >= _119;
    bool _123 = !_107;
    bool _125 = _121 || _123;
    if (_125)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _87;
    if (_125)
    {
        out.m_33.x = 0.0;
    }
    if (_125)
    {
        float _129 = _127 * 5.0;
        _95 = as_type<int>(_129);
    }
    int _131 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1633 = as_type<float>(_131);
        out.gl_Position.z = _1633;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_37.x;
    float _135 = in.m_37.y;
    float _137 = in.m_37.z;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_39.x;
    float _145 = in.m_39.y;
    float _147 = in.m_39.z;
    float _149 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_41.x;
    float _163 = in.m_41.y;
    float _165 = in.m_41.z;
    float _167 = in.m_43.x;
    float _169 = _141 * _139;
    float _171 = 0.0;
    float _173 = _149;
    if (!_159)
    {
        float _175 = _149 * _149;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _135 * _135;
    float _183 = _137 * _137;
    float _185 = _133 * _133;
    float _187 = _179;
    float _189 = _135;
    if (!_159)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _191;
    }
    float _193 = _187;
    float _195 = fma(_145, _145, _181);
    float _197 = fma(_147, _147, _183);
    float _199 = fma(_143, _143, _185);
    float _201 = fma(_163, _163, _195);
    float _203 = fma(_165, _165, _197);
    float _205 = fma(_161, _161, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _211 = sqrt(_203);
    float _213 = sqrt(_205);
    bool _215 = _207 > 0.0;
    int _217 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _219 = _217 != 0;
    float _221 = floor(_209);
    bool _223 = _211 > 0.0;
    bool _225 = _213 > 0.0;
    float _227 = _213;
    float _229 = _205;
    float _231 = _193;
    float _233 = 1.4012984643248170709237295832899e-45;
    float _235 = _203;
    float _237 = _145;
    if (_215)
    {
        float _239 = rsqrt(_201);
        _227 = _239;
    }
    float _241 = _227;
    float _243 = -_221;
    float _245 = _209 + _243;
    float _247 = _209 * 6.283185482025146484375;
    float _249 = 0.0;
    float _251 = _247;
    if (_223)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = 0.0;
    if (!_225)
    {
        _257 = 0.0;
        _259 = 0.0;
    }
    float _261 = _257;
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    float _269 = _261;
    if (_225)
    {
        float _271 = rsqrt(_205);
        _265 = _271;
    }
    float _273 = _265;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _275 = _229;
    bool _277 = !_159;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _149 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _149);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _309;
        _233 = _295;
        _235 = _297;
    }
    float _311 = _231;
    float _313 = _233;
    float _315 = _235;
    bool _317 = !_159;
    float _319 = _313;
    float _321 = _315;
    if (!_317)
    {
        float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _325 = log2(_323);
        float _327 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _329 = _327 + 1.0;
        float _331 = 1.0 / _329;
        float _333 = _149 * _325;
        float _335 = exp2(_333);
        float _337 = -_335;
        float _339 = _337 + 1.0;
        float _341 = _339 * _331;
        _173 = _341;
    }
    float _343 = _173;
    float _345 = _247 * 0.15915493667125701904296875;
    float _347 = in.m_35.x;
    float _349 = in.m_35.y;
    float _351 = in.m_35.z;
    if (_225)
    {
        float _353 = _273 * _143;
        _267 = _353;
    }
    float _355 = _267;
    if (!_215)
    {
        _251 = 0.0;
    }
    float _357 = _251;
    float _359 = _357;
    if (_225)
    {
        float _361 = _273 * _133;
        _279 = _361;
    }
    float _363 = _279;
    float _365 = _345 * 6.283185482025146484375;
    float _367 = cos(_365);
    if (!_215)
    {
        _319 = 0.0;
    }
    float _369 = _319;
    float _371 = _369;
    if (_225)
    {
        float _373 = _273 * _161;
        _269 = _373;
    }
    float _375 = _269;
    float _377 = 0.0;
    if (!_215)
    {
        _377 = 0.0;
    }
    float _379 = _377;
    float _381 = _379;
    if (_215)
    {
        float _383 = _241 * _145;
        _359 = _383;
    }
    float _385 = _359;
    if (_215)
    {
        float _387 = _241 * _135;
        _371 = _387;
    }
    float _389 = _371;
    if (_215)
    {
        float _391 = _241 * _163;
        _381 = _391;
    }
    float _393 = _381;
    float _395 = in.m_45.w;
    float _397 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _401 = _399 != 0;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _405 = _403 != 0;
    float _407 = in.m_30.x;
    float _409 = in.m_30.y;
    float _411 = in.m_30.z;
    bool _413 = _245 < 0.5;
    float _415 = float(_413);
    float _417 = -_245;
    float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _421 = 0.0;
    float _423 = 0.0;
    if (!_223)
    {
        _421 = 0.0;
        _423 = 0.0;
    }
    float _425 = _421;
    float _427 = _423;
    float _429 = fma(_367, 0.5, 0.5);
    bool _431 = !_401;
    int _433 = _431 ? 0 : 1;
    float _435 = -_415;
    float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _439 = _427;
    float _441 = _425;
    if (!_223)
    {
        _321 = 0.0;
    }
    float _443 = _321;
    float _445 = -_429;
    float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _449 = abs(_433);
    float _451 = _443;
    if (_223)
    {
        float _453 = _255 * _147;
        _439 = _453;
    }
    float _455 = _439;
    if (_223)
    {
        float _457 = _255 * _137;
        _451 = _457;
    }
    float _459 = _451;
    if (_223)
    {
        float _461 = _255 * _165;
        _441 = _461;
    }
    float _463 = _441;
    float _465 = fma(_343, _347, _397);
    bool _467 = !_405;
    int _469 = _467 ? 0 : 1;
    float _471 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _473 = !_219;
    int _475 = _473 ? 0 : 1;
    float _477 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _479 = fma(_343, _349, _471);
    bool _481 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _483 = abs(_469);
    int _485 = abs(_475);
    float _487 = fma(_465, _395, _407);
    float _489 = float(_449);
    float _491 = fma(_479, _395, _409);
    float _493 = float(_485);
    float _495 = fma(_343, _351, _477);
    float _497 = abs(_419);
    float _499 = _489 * _497;
    float _501 = fma(_495, _395, _411);
    float _503 = float(_483);
    float _505 = fma(_493, _447, _499);
    float _507 = abs(_437);
    float _509 = fma(_503, _507, _505);
    bool _511 = !_481;
    float _513 = _491;
    float _529;
    if (!_511)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _167 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_77);
        float _535 = 1.0 / _533;
        float _537 = _111 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = _539 + _541;
    bool _545 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _547 = isnan(_539);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _557;
    float _561 = -_555;
    float _563 = _561 + 1.0;
    bool _565 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _567 = 1.0 / _559;
    float _569 = _543 * _567;
    bool _571 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _573 = isnan(_539);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _587;
    float _591 = _581 * _563;
    float _593 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _595 = fma(_589, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _597 = -_581;
    float _599 = _597 + 1.0;
    float _601 = _593 * _591;
    float _603 = _595 * _591;
    float _605 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].x, _601);
    float _607 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[143].y, _603);
    float _609 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].x, _605);
    float _611 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[144].y, _607);
    bool _613 = !_565;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _167 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_77);
        float _635 = 1.0 / _633;
        float _637 = _111 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_43.z;
    float _643 = in.m_43.w;
    float _645 = _167 * 2.0;
    float _647 = _491 * _135;
    float _649 = in.m_43.y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _653 = _651 != 0;
    float _655 = _491 * _145;
    float _657 = floor(_645);
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _661 = _659 != 0;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _669 = _667 != 0;
    float _671 = _491 * _163;
    float _673 = fma(_487, _143, _655);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _677 = fma(_487, _133, _647);
    float _679 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _681 = log2(_679);
    bool _683 = !_665;
    int _685 = _683 ? 0 : 1;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_653)
    {
        float _689 = in.m_43.z;
        _687 = _689;
    }
    float _691 = _687;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _695 = fma(_501, _147, _673);
    int _697 = abs(_685);
    float _699 = fma(_501, _137, _677);
    float _701 = _641 * 2.0;
    bool _703 = _657 >= 0.0;
    bool _705 = isnan(_657);
    bool _707 = _703 || _705;
    bool _709 = isnan(0.0);
    bool _711 = _707 || _709;
    float _713 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _715 = _657 > 0.0;
    if (!_653)
    {
        _189 = _649;
    }
    float _717 = _189;
    float _719 = floor(_701);
    int _721 = _711 ? 0 : 1;
    float _723 = _713 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _725 = _717;
    if (!_653)
    {
        _237 = _717;
    }
    float _727 = _237;
    float _729 = _727;
    if (_653)
    {
        _725 = _649;
    }
    float _731 = _725;
    out.m_33.x = _723;
    if (_653)
    {
        _729 = _167;
    }
    float _733 = _729;
    float _735 = _731 * 2.0;
    int _737 = ~_721;
    int _739 = _737 + 1;
    int _741 = _739 + 1;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _745 = _691;
    int _747 = _741;
    if (!_653)
    {
        _513 = _691;
    }
    float _749 = _513;
    float _751 = floor(_735);
    float _753 = _749;
    if (_653)
    {
        _745 = _731;
    }
    float _755 = _745;
    bool _757 = _719 > 0.0;
    bool _759 = _719 >= 0.0;
    bool _761 = isnan(_719);
    bool _763 = _759 || _761;
    bool _765 = isnan(0.0);
    bool _767 = _763 || _765;
    int _769 = _767 ? 0 : 1;
    if (!_715)
    {
        int _771 = ~_721;
        int _773 = _771 + 1;
        _747 = _773;
    }
    int _775 = _747;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _779 = ~_769;
    int _781 = _779 + 1;
    int _783 = _781 + 1;
    int _785 = _783;
    if (_653)
    {
        _753 = _731;
    }
    float _787 = _753;
    float _789 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[83].z, _777);
    float _791 = _733 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _793 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[83].w, _743);
    float _795 = _167 + _731;
    if (!_757)
    {
        int _797 = ~_769;
        int _799 = _797 + 1;
        _785 = _799;
    }
    int _801 = _785;
    float _803 = -_675;
    float _805 = fma(_791, 2.0, _803);
    float _807 = _641 + _731;
    float _809 = _795 + (-1.0);
    float _811 = _681 * _111;
    float _813 = _807 + (-1.0);
    float _815 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _817 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(1.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _831 = !_661;
    int _833 = _831 ? 0 : 1;
    float _835 = exp2(_811);
    float _837 = fma(_815, -2.0, _693);
    float _839 = float(_775);
    float _841 = in.m_47.x;
    float _843 = in.m_47.y;
    float _845 = in.m_47.z;
    int _847 = abs(_833);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _851 = 1.0 + _849;
    float _853 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _789);
    bool _855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _863 = _859 || _861;
    float _865 = -_111;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[81].x, _805);
    float _869 = float(_697);
    float _871 = 1.0 / _851;
    float _873 = float(_847);
    float _875 = in.m_39.w;
    float _877 = float(_801);
    float _879 = _869 * _839;
    float _881 = -_835;
    float _883 = _881 + 1.0;
    bool _885 = _751 > 0.0;
    bool _887 = _751 >= 0.0;
    bool _889 = isnan(_751);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _879 * (-2.0);
    float _899 = _863 ? _883 : 0.0;
    float _901 = _873 * _877;
    float _903 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _793);
    float _905 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    int _907 = _895 ? 0 : 1;
    if (_827)
    {
        float _909 = _899 * _871;
        _115 = _909;
    }
    float _911 = _115;
    float _913 = _731 + (-0.5);
    float _915 = fma(_897, _843, _843);
    float _917 = fma(_829, _897, _829);
    bool _919 = !_669;
    int _921 = _919 ? 0 : 1;
    float _923 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _915);
    int _925 = ~_907;
    int _927 = _925 + 1;
    int _929 = _927 + 1;
    float _931 = _901 * (-2.0);
    int _933 = _929;
    if (!_885)
    {
        int _935 = ~_907;
        int _937 = _935 + 1;
        _933 = _937;
    }
    int _939 = _933;
    float _941 = fma(_917, _911, _923);
    int _943 = abs(_921);
    float _945 = fma(_817, _931, _817);
    float _947 = fma(_931, _841, _841);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = _167 + (-0.5);
    float _953 = float(_943);
    float _955 = as_type<float>(int(gl_VertexIndex));
    float _957 = float(_939);
    float _959 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[196].x, _947);
    bool _961 = _167 > 0.5;
    float _963 = _167 + _641;
    float _965 = _953 * _957;
    float _967 = fma(_945, _911, _959);
    float _969 = _963 + (-1.0);
    float _971 = _949 * 6.283185482025146484375;
    float _973 = sin(_971);
    float _975 = _965 * (-2.0);
    float _977 = _967 * 0.15915493667125701904296875;
    float _979 = in.m_45.x;
    float _981 = in.m_45.y;
    float _983 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _985 = fma(_975, _845, _845);
    float _987 = _641 + (-0.5);
    float _989 = fma(_983, _975, _983);
    float _991 = _949 * 6.283185482025146484375;
    float _993 = cos(_991);
    float _995 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].z, _985);
    float _997 = fma(_487, _161, _671);
    float _999 = fma(_989, _911, _995);
    int _1001 = as_type<int>(_955) & 1;
    bool _1003 = _1001 != 0;
    int _1005 = as_type<int>(_955) & 2;
    bool _1007 = _1005 != 0;
    float _1009 = fma(_501, _165, _997);
    float _1011 = _977 * 6.283185482025146484375;
    float _1013 = sin(_1011);
    float _1015 = _999 * 0.15915493667125701904296875;
    bool _1017 = _643 > 0.5;
    float _1019 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1021 = !_1003;
    float _1023 = _1021 ? (-0.5) : 0.5;
    bool _1025 = !_1007;
    float _1027 = _1025 ? (-0.5) : 0.5;
    float _1029 = _977 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    bool _1033 = _641 > 0.5;
    float _1035 = _609 * _979;
    float _1037 = _611 * _981;
    float _1039 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1023);
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1027);
    float _1043 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1047 = _1015 * 6.283185482025146484375;
    float _1049 = cos(_1047);
    float _1051 = _1013 * _993;
    float _1053 = _1043 * _1039;
    float _1055 = _1045 * _1041;
    float _1057 = in.m_41.w;
    float _1059 = _1013 * _973;
    float _1061 = _1015 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = _1031 * _973;
    float _1067 = _1031 * _993;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1071 = _1069 != 0;
    int _1073 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1075 = _1073 != 0;
    int _1077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1079 = _1077 != 0;
    float _1081 = _1049 * _1019;
    float _1083 = _973 * _1049;
    float _1085 = _993 * _1049;
    float _1087 = _1031 * _1081;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1091 = _1089 != 0;
    float _1093 = -_1065;
    float _1095 = fma(_1063, _1051, _1093);
    float _1097 = -_1051;
    float _1099 = fma(_1063, _1065, _1097);
    float _1101 = fma(_1063, _1067, _1059);
    float _1103 = _1063 * _1019;
    float _1105 = fma(_1063, _1059, _1067);
    float _1107 = _1013 * _1081;
    float _1109 = fma(_1101, _1053, _1087);
    float _1111 = -_1103;
    float _1113 = fma(_1085, _1053, _1111);
    float _1115 = fma(_1095, _1053, _1107);
    float _1117 = -_1055;
    float _1119 = fma(_1099, _1117, _1109);
    float _1121 = -_1055;
    float _1123 = fma(_1083, _1121, _1113);
    float _1125 = -_1055;
    float _1127 = fma(_1105, _1125, _1115);
    float _1129 = _1119 * _393;
    float _1131 = _1119 * _385;
    float _1133 = _1009 + _1057;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = fma(_1123, _375, _1129);
    float _1141 = fma(_1123, _355, _1131);
    float _1143 = _695 + _875;
    float _1145 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1147 = fma(_1127, _463, _1139);
    float _1149 = fma(_1127, _455, _1141);
    float _1151 = _1133 + _1147;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = in.m_37.w;
    float _1159 = 1.0 / _1137;
    float _1161 = _1143 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1151 + _1163;
    float _1167 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1169 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = _1153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1177 = _1161 + _1175;
    float _1179 = _1165 * _1165;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1185 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1187 = isnan(_639);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1193 = _1189 || _1191;
    float _1195 = float(_1193);
    out.m_52.x = _1169;
    out.m_52.y = _1171;
    out.m_52.z = _1173;
    out.m_52.w = _1167;
    bool _1197 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1199 = isnan(_639);
    bool _1201 = _1197 || _1199;
    bool _1203 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1205 = _1201 || _1203;
    float _1207 = float(_1205);
    float _1209 = 1.0 / _1183;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1213 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1211;
    float _1215 = -_1195;
    float _1217 = _1215 + 1.0;
    float _1219 = _1119 * _389;
    float _1221 = _1213 * _1159;
    float _1223 = _1207 * _1217;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1227 = _639 + _1225;
    float _1229 = -_1207;
    float _1231 = _1229 + 1.0;
    bool _1233 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1235 = isnan(_639);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1123, _363, _1219);
    float _1247 = fma(_1221, _1227, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1249 = fma(_1177, _1177, _1179);
    float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1253 = _1251 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1255 = _1243 * _1231;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1259 = _699 + _1157;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1263 = _639 + _1261;
    float _1265 = -_1023;
    int _1267 = _1033 ? as_type<int>(_1265) : as_type<int>(_1023);
    float _1269 = _1253 * _1209;
    float _1271 = _1247 * _1255;
    float _1273 = -_1023;
    int _1275 = _961 ? as_type<int>(_1273) : as_type<int>(_1023);
    float _1277 = -_1243;
    float _1279 = _1277 + 1.0;
    float _1281 = sqrt(_1249);
    bool _1283 = !_1071;
    float _1285 = _1283 ? _1023 : as_type<float>(_1267);
    float _1287 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1289 = !_1075;
    float _1291 = _1289 ? _1023 : as_type<float>(_1275);
    float _1293 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1271);
    bool _1295 = _731 > 0.5;
    float _1297 = _1285 + 0.5;
    float _1299 = -_1027;
    int _1301 = _1017 ? as_type<int>(_1299) : as_type<int>(_1027);
    float _1303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1305 = fma(_1287, _1223, _1293);
    float _1307 = fma(_1127, _459, _1245);
    float _1309 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1311 = -_1027;
    int _1313 = _1295 ? as_type<int>(_1311) : as_type<int>(_1027);
    float _1315 = _1259 + _1307;
    bool _1317 = !_1079;
    float _1319 = _1317 ? _1027 : as_type<float>(_1301);
    float _1321 = fma(_1309, _1297, _867);
    bool _1323 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1325 = !_1091;
    float _1327 = _1325 ? _1027 : as_type<float>(_1313);
    float _1329 = _1309;
    float _1331 = _1297;
    float _1333 = _1151;
    if (!_1323)
    {
        _1329 = _1161;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    if (!_1323)
    {
        _1331 = _1315;
    }
    float _1339 = _1331;
    bool _1341 = !_1323;
    float _1343 = _1339;
    if (!_1341)
    {
        float _1345 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1349 = _1281 + _1347;
        float _1351 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1353 = rsqrt(_1249);
        float _1355 = _1349 * _1345;
        float _1357 = _1355 * 0.15915493667125701904296875;
        float _1359 = _1357 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        float _1363 = _1357 * 6.283185482025146484375;
        float _1365 = sin(_1363);
        float _1367 = _1361 + (-1.0);
        float _1369 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = fma(_1365, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1373 = fma(_1315, _1361, _1369);
        float _1375 = _1353 * _1371;
        float _1377 = fma(_1177, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1379 = fma(_1165, _1375, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1343 = _1373;
        _1337 = _1377;
        _1333 = _1379;
    }
    float _1381 = _1343;
    float _1383 = _1337;
    float _1385 = _1333;
    float _1387 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1391 = _1319 + (-0.5);
    float _1393 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1397 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1399 = -_1389;
    float _1401 = -_905;
    float _1403 = fma(_1399, _1391, _1401);
    float _1405 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1393);
    float _1407 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1409 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1397);
    float _1411 = -_853;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = -_903;
    float _1423 = _1421 + 1.0;
    float _1425 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1429 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1433 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1435 = -_1327;
    float _1437 = _1435 + 0.5;
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1381 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1443 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1305);
    float _1445 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1427);
    float _1447 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1449 = -_1413;
    float _1451 = fma(_1285, _1449, _1321);
    float _1453 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1455 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1431);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1433);
    float _1461 = fma(_1319, _1423, _1403);
    float _1463 = _1437 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1465 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1441);
    float _1467 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1445);
    float _1469 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1471 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1455);
    float _1473 = fma(_1447, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1475 = _1463 * _1439;
    float _1477 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1465);
    float _1479 = _1291 + 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * _1457;
    float _1497 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1501 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1503 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1467);
    float _1505 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1507 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1473);
    out.m_54.x = _1495;
    out.m_54.y = _1475;
    out.m_54.z = _1451;
    out.m_54.w = _1461;
    out.m_56.x = _1493;
    out.m_56.y = _1497;
    out.m_56.z = _1499;
    out.m_56.w = _1501;
    out.m_58.x = _1383;
    out.m_58.z = _1385;
    out.gl_Position.x = _1503;
    out.gl_Position.y = _1491;
    out.gl_Position.z = _1505;
    out.gl_Position.w = _1507;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

