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
    float4 m_40 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(1)]];
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_38 [[attribute(4)]];
    float4 m_36 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _531 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    float _85 = as_type<float>(_83);
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_83);
        out.gl_Position.z = _1551;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _87 = in.m_31.w;
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
        out.m_29.x = 0.0;
    }
    int _119 = 0;
    if (_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1621 = as_type<float>(_123);
        out.gl_Position.z = _1621;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_36.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_31.x;
    float _143 = in.m_31.y;
    float _145 = in.m_31.z;
    float _147 = in.m_26.x;
    float _149 = in.m_26.y;
    float _151 = in.m_26.z;
    float _153 = _127;
    if (!_139)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _85 = _157;
    }
    float _159 = _85;
    float _161 = _159;
    if (!_139)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_125) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_125) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_139;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _127 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _127);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_139;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _127 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _141, _245);
    float _253 = fma(_241, _143, _247);
    float _255 = fma(_241, _145, _249);
    float _257 = fma(_251, _129, _147);
    float _259 = fma(_253, _129, _149);
    float _261 = fma(_255, _129, _151);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_67);
        float _287 = 1.0 / _285;
        float _289 = _101 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _307;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _299 * _317;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _315;
    float _341 = _295 * _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _291 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _291 + _347;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _345 * _323;
    bool _365 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_291);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -_375;
    float _387 = _385 + 1.0;
    float _389 = fma(_379, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _349 * _339;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _337 * _387;
    bool _399 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _401 = isnan(_291);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = fma(_395, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _421 = _361 * _383;
    bool _423 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_291);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _409 * _417;
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_413, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = _433 * _439;
    float _453 = fma(_443, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = in.m_36.x;
    float _457 = in.m_36.y;
    float _459 = _389 * _451;
    float _461 = _419 * _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_445, _435, _471);
    float _489 = fma(_453, _435, _473);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_477, _421, _487);
    float _497 = fma(_475, _421, _489);
    float _499 = fma(_491, _397, _495);
    float _501 = fma(_493, _397, _497);
    float _503 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _455;
    float _509 = _505 * _457;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_67);
        float _535 = 1.0 / _533;
        float _537 = _101 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_539);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_539);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _547;
    float _595 = -_559;
    float _597 = _595 + 1.0;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _601 = _575 * _597;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _563;
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = fma(_609, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _617 = _613 * _607;
    float _619 = _615 * _601;
    float _621 = -_591;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _539 + _625;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _619);
    float _631 = _559 * _623;
    float _633 = fma(_617, _627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _635 = fma(_633, _631, _629);
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.w = _639;
    bool _641 = !_599;
    float _659;
    if (!_641)
    {
        float _643 = in.m_38.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_67);
        float _665 = 1.0 / _663;
        float _667 = _101 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = in.m_38.x;
    float _673 = in.m_38.y;
    float _675 = in.m_38.z;
    float _677 = in.m_38.w;
    float _679 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _705 = _703 != 0;
    float _707 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = _675 * 2.0;
    bool _715 = _677 > 0.5;
    float _717 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _721 = _673 > 0.5;
    float _723 = _673 * 2.0;
    float _725 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _727;
    float _731 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _719);
    float _733 = -_181;
    int _735 = _715 ? as_type<int>(_733) : as_type<int>(_181);
    float _737 = floor(_713);
    bool _739 = _671 > 0.5;
    float _741 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _743 = -_181;
    int _745 = _721 ? as_type<int>(_743) : as_type<int>(_181);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _749 = -_177;
    int _751 = _739 ? as_type<int>(_749) : as_type<int>(_177);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _755 = !_697;
    float _757 = _755 ? _181 : as_type<float>(_745);
    float _759 = 1.0 / _729;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _741 * _747;
    float _779 = _679 * _681;
    float _781 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _725);
    float _783 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = 1.0 / _775;
    float _787 = _671 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _791 = fma(_783, -2.0, _753);
    float _793 = -_711;
    float _795 = fma(_787, 2.0, _793);
    bool _797 = !_705;
    float _799 = _797 ? _181 : as_type<float>(_735);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    bool _803 = _675 > 0.5;
    float _805 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _709);
    bool _807 = !_693;
    float _809 = _807 ? _177 : as_type<float>(_751);
    float _811 = floor(_723);
    float _813 = -_177;
    int _815 = _803 ? as_type<int>(_813) : as_type<int>(_177);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _669 + _817;
    bool _821 = _737 > 0.0;
    float _823 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[78].z, _789);
    bool _825 = !_701;
    float _827 = _825 ? _177 : as_type<float>(_815);
    float _829 = _673 + _675;
    bool _831 = _737 >= 0.0;
    bool _833 = isnan(_737);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _671 * 2.0;
    float _843 = _819 * _785;
    float _845 = _783;
    float _847 = _671;
    float _849 = _675;
    if (!_685)
    {
        _845 = _673;
    }
    float _851 = _845;
    float _853 = _675 + _671;
    float _855 = floor(_841);
    float _857 = _673 + _671;
    float _859 = _851;
    if (_685)
    {
        _859 = _671;
    }
    float _861 = _859;
    float _863 = _671 + (-0.5);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = _669 + _865;
    if (!_685)
    {
        _847 = _675;
    }
    float _869 = _847;
    float _871 = _829 + (-1.0);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _875 = _839 ? 0 : 1;
    float _877 = _867 * _759;
    float _879 = _869;
    if (_685)
    {
        _879 = _673;
    }
    float _881 = _879;
    float _883 = _675 + (-0.5);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _673 + (-0.5);
    float _889 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    if (_685)
    {
        _849 = _673;
    }
    float _891 = _849;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _895 = ~_875;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = _689 * _101;
    float _903 = _857 + (-1.0);
    float _905 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _907 = _899;
    if (!_821)
    {
        int _909 = ~_875;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _917 = _855 > 0.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _811 > 0.0;
    float _923 = fma(_893, -2.0, _915);
    bool _925 = !_763;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = exp2(_901);
    bool _943 = _811 >= 0.0;
    bool _945 = isnan(_811);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    int _955 = abs(_927);
    float _957 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _923);
    float _959 = _781 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _961 = _939 ? 0 : 1;
    int _963 = _951 ? 0 : 1;
    float _965 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = float(_955);
    float _969 = float(_913);
    float _971 = -_941;
    float _973 = _971 + 1.0;
    int _975 = ~_961;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    float _981 = _967 * _969;
    int _983 = ~_963;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = -_101;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    int _993 = _979;
    int _995 = _987;
    if (!_917)
    {
        int _997 = ~_961;
        int _999 = _997 + 1;
        _993 = _999;
    }
    int _1001 = _993;
    float _1003 = _981 * (-2.0);
    if (!_921)
    {
        int _1005 = ~_963;
        int _1007 = _1005 + 1;
        _995 = _1007;
    }
    int _1009 = _995;
    float _1011 = in.m_42.x;
    float _1013 = in.m_42.y;
    float _1015 = in.m_42.z;
    bool _1017 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1019 = isnan(1.0);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1025 = _1021 || _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1029 = 1.0 + _1027;
    float _1031 = fma(_965, _1003, _965);
    bool _1033 = !_767;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = 1.0 / _1029;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1041 = abs(_1035);
    float _1043 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    bool _1045 = !_771;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1039);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1053 = _861 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1055 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _1067 = -_1051;
    float _1069 = fma(_1053, 2.0, _1067);
    int _1071 = abs(_1047);
    float _1073 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1075 = _1063 ? _973 : 0.0;
    float _1077 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    float _1079 = float(_1041);
    float _1081 = -_101;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1069);
    float _1085 = float(_1001);
    if (_1025)
    {
        float _1087 = _1075 * _1037;
        _103 = _1087;
    }
    float _1089 = _103;
    float _1091 = float(_1071);
    float _1093 = fma(_1003, _1011, _1011);
    float _1095 = float(_1009);
    float _1097 = _1079 * _1085;
    float _1099 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1093);
    float _1101 = _853 + (-1.0);
    float _1103 = _1091 * _1095;
    float _1105 = _1097 * (-2.0);
    float _1107 = fma(_1031, _1089, _1099);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = _1103 * (-2.0);
    float _1113 = fma(_1105, _1013, _1013);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1117 = fma(_885, _1105, _885);
    float _1119 = fma(_1111, _1015, _1015);
    float _1121 = _1107 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1111, _1115);
    float _1125 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1119);
    float _1127 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1113);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1129;
    bool _1133 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1135 = isnan(_669);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1145;
    float _1149 = fma(_1123, _1089, _1125);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1117, _1089, _1127);
    bool _1159 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_669);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1143;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1179 = fma(_1131, _877, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1181 = fma(_1147, _877, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1183 = fma(_1153, _877, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1185 = _1149 * 0.15915493667125701904296875;
    float _1187 = _1157 * 0.15915493667125701904296875;
    bool _1189 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1191 = isnan(_669);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1213 = _1121 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1203, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1219 = _1199 * _1209;
    float _1221 = -_1199;
    float _1223 = _1221 + 1.0;
    float _1225 = fma(_1177, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _809 + 0.5;
    float _1229 = _1179 * _1219;
    float _1231 = -_1077;
    float _1233 = _1231 + 1.0;
    float _1235 = _1185 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = fma(_1211, _1227, _991);
    float _1241 = -_1233;
    float _1243 = fma(_809, _1241, _1239);
    float _1245 = _1121 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1187 * 6.283185482025146484375;
    float _1251 = sin(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1257 = _1181 * _1219;
    float _1259 = _1183 * _1219;
    float _1261 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = fma(_1255, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1265 = _757 + (-0.5);
    float _1267 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1229);
    float _1269 = _1187 * 6.283185482025146484375;
    float _1271 = cos(_1269);
    float _1273 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1275 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1259);
    float _1277 = -_1261;
    float _1279 = -_953;
    float _1281 = fma(_1277, _1265, _1279);
    float _1283 = fma(_1217, _1205, _1267);
    float _1285 = fma(_1225, _1205, _1273);
    float _1287 = fma(_1263, _1205, _1275);
    float _1289 = _1237 * _779;
    float _1291 = _1185 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1215 * _1251;
    float _1297 = _1247 * _1251;
    float _1299 = _1247 * _1289;
    float _1301 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1303 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1305 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1287);
    float _1307 = _1247 * _1271;
    float _1309 = _1251 * _1237;
    float _1311 = _1271 * _1237;
    float _1313 = _1215 * _1271;
    float _1315 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1323 = fma(_1293, _1307, _1295);
    float _1325 = -_1313;
    float _1327 = fma(_1293, _1297, _1325);
    float _1329 = -_1297;
    float _1331 = fma(_1293, _1313, _1329);
    float _1333 = _1215 * _1289;
    float _1335 = fma(_1323, _777, _1299);
    float _1337 = _1293 * _779;
    float _1339 = fma(_1293, _1295, _1307);
    float _1341 = fma(_1331, _777, _1333);
    float _1343 = fma(_1327, _1315, _1335);
    float _1345 = -_1337;
    float _1347 = fma(_1311, _777, _1345);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = fma(_1339, _1315, _1341);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1355 = fma(_1309, _1315, _1347);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1359 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _827 + 0.5;
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1353);
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1367 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1359, _1361, _1083);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1365);
    float _1375 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1357);
    float _1377 = _799 + (-0.5);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1375);
    float _1385 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1387 = _905 + _1379;
    float _1389 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1391 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1393 = -_1385;
    float _1395 = -_957;
    float _1397 = fma(_1393, _1377, _1395);
    float _1399 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1401 = _959 + _1389;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1407 = _1391 + _1399;
    float _1409 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1413 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1405);
    float _1415 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1417 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1411);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1413);
    out.m_44.x = _1401;
    out.m_44.y = _1387;
    out.m_44.z = _1407;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    float _1423 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1439 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1433);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1435);
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1437);
    float _1449 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1439);
    float _1451 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1443);
    float _1457 = -_1065;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1043;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1467 = -_1073;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_799, _1459, _1397);
    float _1473 = fma(_757, _1463, _1281);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = -_1469;
    float _1479 = fma(_827, _1477, _1369);
    float _1481 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1485 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1493 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1243;
    out.m_46.y = _1473;
    out.m_46.z = _1479;
    out.m_46.w = _1471;
    out.m_48.x = _1481;
    out.m_48.y = _1485;
    out.m_48.z = _1487;
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1493;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _531 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    float _85 = as_type<float>(_83);
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_83);
        out.gl_Position.z = _1551;
    }
    if (!_71)
    {
        return out;
    }
    float _87 = in.m_31.w;
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
        out.m_29.x = 0.0;
    }
    int _119 = 0;
    if (_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1621 = as_type<float>(_123);
        out.gl_Position.z = _1621;
    }
    if (_113)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_36.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_31.x;
    float _143 = in.m_31.y;
    float _145 = in.m_31.z;
    float _147 = in.m_26.x;
    float _149 = in.m_26.y;
    float _151 = in.m_26.z;
    float _153 = _127;
    if (!_139)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _85 = _157;
    }
    float _159 = _85;
    float _161 = _159;
    if (!_139)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_125) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_125) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_139;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _127 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _127);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_139;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _127 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _141, _245);
    float _253 = fma(_241, _143, _247);
    float _255 = fma(_241, _145, _249);
    float _257 = fma(_251, _129, _147);
    float _259 = fma(_253, _129, _149);
    float _261 = fma(_255, _129, _151);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_67);
        float _287 = 1.0 / _285;
        float _289 = _101 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _307;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _299 * _317;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _315;
    float _341 = _295 * _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _291 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _291 + _347;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _345 * _323;
    bool _365 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_291);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -_375;
    float _387 = _385 + 1.0;
    float _389 = fma(_379, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _349 * _339;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _337 * _387;
    bool _399 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _401 = isnan(_291);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = fma(_395, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _421 = _361 * _383;
    bool _423 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_291);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _409 * _417;
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_413, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = _433 * _439;
    float _453 = fma(_443, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = in.m_36.x;
    float _457 = in.m_36.y;
    float _459 = _389 * _451;
    float _461 = _419 * _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_445, _435, _471);
    float _489 = fma(_453, _435, _473);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_477, _421, _487);
    float _497 = fma(_475, _421, _489);
    float _499 = fma(_491, _397, _495);
    float _501 = fma(_493, _397, _497);
    float _503 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _455;
    float _509 = _505 * _457;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_67);
        float _535 = 1.0 / _533;
        float _537 = _101 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_539);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_539);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _547;
    float _595 = -_559;
    float _597 = _595 + 1.0;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _601 = _575 * _597;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _563;
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = fma(_609, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _617 = _613 * _607;
    float _619 = _615 * _601;
    float _621 = -_591;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _539 + _625;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _619);
    float _631 = _559 * _623;
    float _633 = fma(_617, _627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _635 = fma(_633, _631, _629);
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.w = _639;
    bool _641 = !_599;
    float _659;
    if (!_641)
    {
        float _643 = in.m_38.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_67);
        float _665 = 1.0 / _663;
        float _667 = _101 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = in.m_38.x;
    float _673 = in.m_38.y;
    float _675 = in.m_38.z;
    float _677 = in.m_38.w;
    float _679 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _705 = _703 != 0;
    float _707 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = _675 * 2.0;
    bool _715 = _677 > 0.5;
    float _717 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _721 = _673 > 0.5;
    float _723 = _673 * 2.0;
    float _725 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _727;
    float _731 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _719);
    float _733 = -_181;
    int _735 = _715 ? as_type<int>(_733) : as_type<int>(_181);
    float _737 = floor(_713);
    bool _739 = _671 > 0.5;
    float _741 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _743 = -_181;
    int _745 = _721 ? as_type<int>(_743) : as_type<int>(_181);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _749 = -_177;
    int _751 = _739 ? as_type<int>(_749) : as_type<int>(_177);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _755 = !_697;
    float _757 = _755 ? _181 : as_type<float>(_745);
    float _759 = 1.0 / _729;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _741 * _747;
    float _779 = _679 * _681;
    float _781 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _725);
    float _783 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = 1.0 / _775;
    float _787 = _671 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _791 = fma(_783, -2.0, _753);
    float _793 = -_711;
    float _795 = fma(_787, 2.0, _793);
    bool _797 = !_705;
    float _799 = _797 ? _181 : as_type<float>(_735);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    bool _803 = _675 > 0.5;
    float _805 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _709);
    bool _807 = !_693;
    float _809 = _807 ? _177 : as_type<float>(_751);
    float _811 = floor(_723);
    float _813 = -_177;
    int _815 = _803 ? as_type<int>(_813) : as_type<int>(_177);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _669 + _817;
    bool _821 = _737 > 0.0;
    float _823 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[78].z, _789);
    bool _825 = !_701;
    float _827 = _825 ? _177 : as_type<float>(_815);
    float _829 = _673 + _675;
    bool _831 = _737 >= 0.0;
    bool _833 = isnan(_737);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _671 * 2.0;
    float _843 = _819 * _785;
    float _845 = _783;
    float _847 = _671;
    float _849 = _675;
    if (!_685)
    {
        _845 = _673;
    }
    float _851 = _845;
    float _853 = _675 + _671;
    float _855 = floor(_841);
    float _857 = _673 + _671;
    float _859 = _851;
    if (_685)
    {
        _859 = _671;
    }
    float _861 = _859;
    float _863 = _671 + (-0.5);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = _669 + _865;
    if (!_685)
    {
        _847 = _675;
    }
    float _869 = _847;
    float _871 = _829 + (-1.0);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _875 = _839 ? 0 : 1;
    float _877 = _867 * _759;
    float _879 = _869;
    if (_685)
    {
        _879 = _673;
    }
    float _881 = _879;
    float _883 = _675 + (-0.5);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _673 + (-0.5);
    float _889 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    if (_685)
    {
        _849 = _673;
    }
    float _891 = _849;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _895 = ~_875;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = _689 * _101;
    float _903 = _857 + (-1.0);
    float _905 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _907 = _899;
    if (!_821)
    {
        int _909 = ~_875;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _917 = _855 > 0.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _811 > 0.0;
    float _923 = fma(_893, -2.0, _915);
    bool _925 = !_763;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = exp2(_901);
    bool _943 = _811 >= 0.0;
    bool _945 = isnan(_811);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    int _955 = abs(_927);
    float _957 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _923);
    float _959 = _781 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _961 = _939 ? 0 : 1;
    int _963 = _951 ? 0 : 1;
    float _965 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = float(_955);
    float _969 = float(_913);
    float _971 = -_941;
    float _973 = _971 + 1.0;
    int _975 = ~_961;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    float _981 = _967 * _969;
    int _983 = ~_963;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = -_101;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    int _993 = _979;
    int _995 = _987;
    if (!_917)
    {
        int _997 = ~_961;
        int _999 = _997 + 1;
        _993 = _999;
    }
    int _1001 = _993;
    float _1003 = _981 * (-2.0);
    if (!_921)
    {
        int _1005 = ~_963;
        int _1007 = _1005 + 1;
        _995 = _1007;
    }
    int _1009 = _995;
    float _1011 = in.m_42.x;
    float _1013 = in.m_42.y;
    float _1015 = in.m_42.z;
    bool _1017 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1019 = isnan(1.0);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1025 = _1021 || _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1029 = 1.0 + _1027;
    float _1031 = fma(_965, _1003, _965);
    bool _1033 = !_767;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = 1.0 / _1029;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1041 = abs(_1035);
    float _1043 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    bool _1045 = !_771;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1039);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1053 = _861 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1055 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _1067 = -_1051;
    float _1069 = fma(_1053, 2.0, _1067);
    int _1071 = abs(_1047);
    float _1073 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1075 = _1063 ? _973 : 0.0;
    float _1077 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    float _1079 = float(_1041);
    float _1081 = -_101;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1069);
    float _1085 = float(_1001);
    if (_1025)
    {
        float _1087 = _1075 * _1037;
        _103 = _1087;
    }
    float _1089 = _103;
    float _1091 = float(_1071);
    float _1093 = fma(_1003, _1011, _1011);
    float _1095 = float(_1009);
    float _1097 = _1079 * _1085;
    float _1099 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1093);
    float _1101 = _853 + (-1.0);
    float _1103 = _1091 * _1095;
    float _1105 = _1097 * (-2.0);
    float _1107 = fma(_1031, _1089, _1099);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = _1103 * (-2.0);
    float _1113 = fma(_1105, _1013, _1013);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1117 = fma(_885, _1105, _885);
    float _1119 = fma(_1111, _1015, _1015);
    float _1121 = _1107 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1111, _1115);
    float _1125 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1119);
    float _1127 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1113);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1129;
    bool _1133 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1135 = isnan(_669);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1145;
    float _1149 = fma(_1123, _1089, _1125);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1117, _1089, _1127);
    bool _1159 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_669);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1143;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1179 = fma(_1131, _877, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1181 = fma(_1147, _877, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1183 = fma(_1153, _877, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1185 = _1149 * 0.15915493667125701904296875;
    float _1187 = _1157 * 0.15915493667125701904296875;
    bool _1189 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1191 = isnan(_669);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1213 = _1121 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1203, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1219 = _1199 * _1209;
    float _1221 = -_1199;
    float _1223 = _1221 + 1.0;
    float _1225 = fma(_1177, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _809 + 0.5;
    float _1229 = _1179 * _1219;
    float _1231 = -_1077;
    float _1233 = _1231 + 1.0;
    float _1235 = _1185 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = fma(_1211, _1227, _991);
    float _1241 = -_1233;
    float _1243 = fma(_809, _1241, _1239);
    float _1245 = _1121 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1187 * 6.283185482025146484375;
    float _1251 = sin(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1257 = _1181 * _1219;
    float _1259 = _1183 * _1219;
    float _1261 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = fma(_1255, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1265 = _757 + (-0.5);
    float _1267 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1229);
    float _1269 = _1187 * 6.283185482025146484375;
    float _1271 = cos(_1269);
    float _1273 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1275 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1259);
    float _1277 = -_1261;
    float _1279 = -_953;
    float _1281 = fma(_1277, _1265, _1279);
    float _1283 = fma(_1217, _1205, _1267);
    float _1285 = fma(_1225, _1205, _1273);
    float _1287 = fma(_1263, _1205, _1275);
    float _1289 = _1237 * _779;
    float _1291 = _1185 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1215 * _1251;
    float _1297 = _1247 * _1251;
    float _1299 = _1247 * _1289;
    float _1301 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1303 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1305 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1287);
    float _1307 = _1247 * _1271;
    float _1309 = _1251 * _1237;
    float _1311 = _1271 * _1237;
    float _1313 = _1215 * _1271;
    float _1315 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1323 = fma(_1293, _1307, _1295);
    float _1325 = -_1313;
    float _1327 = fma(_1293, _1297, _1325);
    float _1329 = -_1297;
    float _1331 = fma(_1293, _1313, _1329);
    float _1333 = _1215 * _1289;
    float _1335 = fma(_1323, _777, _1299);
    float _1337 = _1293 * _779;
    float _1339 = fma(_1293, _1295, _1307);
    float _1341 = fma(_1331, _777, _1333);
    float _1343 = fma(_1327, _1315, _1335);
    float _1345 = -_1337;
    float _1347 = fma(_1311, _777, _1345);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = fma(_1339, _1315, _1341);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1355 = fma(_1309, _1315, _1347);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1359 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _827 + 0.5;
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1353);
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1367 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1359, _1361, _1083);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1365);
    float _1375 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1357);
    float _1377 = _799 + (-0.5);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1375);
    float _1385 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1387 = _905 + _1379;
    float _1389 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1391 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1393 = -_1385;
    float _1395 = -_957;
    float _1397 = fma(_1393, _1377, _1395);
    float _1399 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1401 = _959 + _1389;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1407 = _1391 + _1399;
    float _1409 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1413 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1405);
    float _1415 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1417 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1411);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1413);
    out.m_44.x = _1401;
    out.m_44.y = _1387;
    out.m_44.z = _1407;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    float _1423 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1439 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1433);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1435);
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1437);
    float _1449 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1439);
    float _1451 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1443);
    float _1457 = -_1065;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1043;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1467 = -_1073;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_799, _1459, _1397);
    float _1473 = fma(_757, _1463, _1281);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = -_1469;
    float _1479 = fma(_827, _1477, _1369);
    float _1481 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1485 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1493 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1243;
    out.m_46.y = _1473;
    out.m_46.z = _1479;
    out.m_46.w = _1471;
    out.m_48.x = _1481;
    out.m_48.y = _1485;
    out.m_48.z = _1487;
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1493;
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
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _661 = false;
    bool _531 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_26.w;
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
        out.m_29.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    float _85 = as_type<float>(_83);
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1551 = as_type<float>(_83);
        out.gl_Position.z = _1551;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _87 = in.m_31.w;
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
        out.m_29.x = 0.0;
    }
    int _119 = 0;
    if (_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1621 = as_type<float>(_123);
        out.gl_Position.z = _1621;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    float _127 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _129 = in.m_36.w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = in.m_31.x;
    float _143 = in.m_31.y;
    float _145 = in.m_31.z;
    float _147 = in.m_26.x;
    float _149 = in.m_26.y;
    float _151 = in.m_26.z;
    float _153 = _127;
    if (!_139)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _85 = _157;
    }
    float _159 = _85;
    float _161 = _159;
    if (!_139)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    int _167 = as_type<int>(_125) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_125) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_139;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _127 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _127);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_139;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _127 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _141, _245);
    float _253 = fma(_241, _143, _247);
    float _255 = fma(_241, _145, _249);
    float _257 = fma(_251, _129, _147);
    float _259 = fma(_253, _129, _149);
    float _261 = fma(_255, _129, _151);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_38.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_67);
        float _287 = 1.0 / _285;
        float _289 = _101 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _291 + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = 1.0 / _307;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _303;
    float _323 = 1.0 / _311;
    float _325 = _299 * _317;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = 1.0 / _315;
    float _341 = _295 * _321;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = _291 + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _291 + _347;
    bool _351 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_291);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _345 * _323;
    bool _365 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _367 = isnan(_291);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = -_337;
    float _383 = _381 + 1.0;
    float _385 = -_375;
    float _387 = _385 + 1.0;
    float _389 = fma(_379, _341, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _349 * _339;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _393;
    float _397 = _337 * _387;
    bool _399 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _401 = isnan(_291);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = -_361;
    float _417 = _415 + 1.0;
    float _419 = fma(_395, _341, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _421 = _361 * _383;
    bool _423 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_291);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _409 * _417;
    float _437 = -_409;
    float _439 = _437 + 1.0;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _443 = _441 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _445 = fma(_413, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = -_433;
    float _449 = _447 + 1.0;
    float _451 = _433 * _439;
    float _453 = fma(_443, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _455 = in.m_36.x;
    float _457 = in.m_36.y;
    float _459 = _389 * _451;
    float _461 = _419 * _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _473 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _475 = fma(_465, _363, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _477 = fma(_469, _363, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _487 = fma(_445, _435, _471);
    float _489 = fma(_453, _435, _473);
    float _491 = fma(_481, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_485, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _495 = fma(_477, _421, _487);
    float _497 = fma(_475, _421, _489);
    float _499 = fma(_491, _397, _495);
    float _501 = fma(_493, _397, _497);
    float _503 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].x, _499);
    float _505 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[147].y, _501);
    float _507 = _503 * _455;
    float _509 = _505 * _457;
    bool _511 = !_319;
    float _529;
    if (!_511)
    {
        float _513 = in.m_38.x;
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _513 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_67);
        float _535 = 1.0 / _533;
        float _537 = _101 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _539 + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _549 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _551 = isnan(_539);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _567 = isnan(_539);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _577;
    bool _581 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_539);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = 1.0 / _547;
    float _595 = -_559;
    float _597 = _595 + 1.0;
    bool _599 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _601 = _575 * _597;
    float _603 = -_575;
    float _605 = _603 + 1.0;
    float _607 = 1.0 / _563;
    float _609 = _579 * _593;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = fma(_609, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _617 = _613 * _607;
    float _619 = _615 * _601;
    float _621 = -_591;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = _539 + _625;
    float _629 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _619);
    float _631 = _559 * _623;
    float _633 = fma(_617, _627, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _635 = fma(_633, _631, _629);
    float _637 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _635);
    float _639 = _637 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_40.w = _639;
    bool _641 = !_599;
    float _659;
    if (!_641)
    {
        float _643 = in.m_38.x;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _647 = _643 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _649 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[11].z, _101);
        float _651 = _649 * _645;
        float _653 = floor(_651);
        float _655 = -_653;
        float _657 = _651 + _655;
        _659 = _657;
        _661 = true;
    }
    else
    {
        float _663 = float(_67);
        float _665 = 1.0 / _663;
        float _667 = _101 * _665;
        _659 = _667;
    }
    _661 = false;
    float _669 = _659;
    float _671 = in.m_38.x;
    float _673 = in.m_38.y;
    float _675 = in.m_38.z;
    float _677 = in.m_38.w;
    float _679 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _685 = _683 != 0;
    float _687 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _689 = log2(_687);
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _697 = _695 != 0;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _705 = _703 != 0;
    float _707 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _709 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _707);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _713 = _675 * 2.0;
    bool _715 = _677 > 0.5;
    float _717 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _721 = _673 > 0.5;
    float _723 = _673 * 2.0;
    float _725 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _727;
    float _731 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _719);
    float _733 = -_181;
    int _735 = _715 ? as_type<int>(_733) : as_type<int>(_181);
    float _737 = floor(_713);
    bool _739 = _671 > 0.5;
    float _741 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _743 = -_181;
    int _745 = _721 ? as_type<int>(_743) : as_type<int>(_181);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _749 = -_177;
    int _751 = _739 ? as_type<int>(_749) : as_type<int>(_177);
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _755 = !_697;
    float _757 = _755 ? _181 : as_type<float>(_745);
    float _759 = 1.0 / _729;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _763 = _761 != 0;
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _771 = _769 != 0;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _775 = _773 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _777 = _741 * _747;
    float _779 = _679 * _681;
    float _781 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _725);
    float _783 = _673 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _785 = 1.0 / _775;
    float _787 = _671 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _791 = fma(_783, -2.0, _753);
    float _793 = -_711;
    float _795 = fma(_787, 2.0, _793);
    bool _797 = !_705;
    float _799 = _797 ? _181 : as_type<float>(_735);
    float _801 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    bool _803 = _675 > 0.5;
    float _805 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _709);
    bool _807 = !_693;
    float _809 = _807 ? _177 : as_type<float>(_751);
    float _811 = floor(_723);
    float _813 = -_177;
    int _815 = _803 ? as_type<int>(_813) : as_type<int>(_177);
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _819 = _669 + _817;
    bool _821 = _737 > 0.0;
    float _823 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[78].z, _789);
    bool _825 = !_701;
    float _827 = _825 ? _177 : as_type<float>(_815);
    float _829 = _673 + _675;
    bool _831 = _737 >= 0.0;
    bool _833 = isnan(_737);
    bool _835 = _831 || _833;
    bool _837 = isnan(0.0);
    bool _839 = _835 || _837;
    float _841 = _671 * 2.0;
    float _843 = _819 * _785;
    float _845 = _783;
    float _847 = _671;
    float _849 = _675;
    if (!_685)
    {
        _845 = _673;
    }
    float _851 = _845;
    float _853 = _675 + _671;
    float _855 = floor(_841);
    float _857 = _673 + _671;
    float _859 = _851;
    if (_685)
    {
        _859 = _671;
    }
    float _861 = _859;
    float _863 = _671 + (-0.5);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = _669 + _865;
    if (!_685)
    {
        _847 = _675;
    }
    float _869 = _847;
    float _871 = _829 + (-1.0);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _875 = _839 ? 0 : 1;
    float _877 = _867 * _759;
    float _879 = _869;
    if (_685)
    {
        _879 = _673;
    }
    float _881 = _879;
    float _883 = _675 + (-0.5);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _887 = _673 + (-0.5);
    float _889 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[78].w, _873);
    if (_685)
    {
        _849 = _673;
    }
    float _891 = _849;
    float _893 = _881 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _895 = ~_875;
    int _897 = _895 + 1;
    int _899 = _897 + 1;
    float _901 = _689 * _101;
    float _903 = _857 + (-1.0);
    float _905 = _805 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _907 = _899;
    if (!_821)
    {
        int _909 = ~_875;
        int _911 = _909 + 1;
        _907 = _911;
    }
    int _913 = _907;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _917 = _855 > 0.0;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _921 = _811 > 0.0;
    float _923 = fma(_893, -2.0, _915);
    bool _925 = !_763;
    int _927 = _925 ? 0 : 1;
    float _929 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _919);
    bool _931 = _855 >= 0.0;
    bool _933 = isnan(_855);
    bool _935 = _931 || _933;
    bool _937 = isnan(0.0);
    bool _939 = _935 || _937;
    float _941 = exp2(_901);
    bool _943 = _811 >= 0.0;
    bool _945 = isnan(_811);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    int _955 = abs(_927);
    float _957 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[81].y, _923);
    float _959 = _781 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _961 = _939 ? 0 : 1;
    int _963 = _951 ? 0 : 1;
    float _965 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _967 = float(_955);
    float _969 = float(_913);
    float _971 = -_941;
    float _973 = _971 + 1.0;
    int _975 = ~_961;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    float _981 = _967 * _969;
    int _983 = ~_963;
    int _985 = _983 + 1;
    int _987 = _985 + 1;
    float _989 = -_101;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    int _993 = _979;
    int _995 = _987;
    if (!_917)
    {
        int _997 = ~_961;
        int _999 = _997 + 1;
        _993 = _999;
    }
    int _1001 = _993;
    float _1003 = _981 * (-2.0);
    if (!_921)
    {
        int _1005 = ~_963;
        int _1007 = _1005 + 1;
        _995 = _1007;
    }
    int _1009 = _995;
    float _1011 = in.m_42.x;
    float _1013 = in.m_42.y;
    float _1015 = in.m_42.z;
    bool _1017 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1019 = isnan(1.0);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1025 = _1021 || _1023;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1029 = 1.0 + _1027;
    float _1031 = fma(_965, _1003, _965);
    bool _1033 = !_767;
    int _1035 = _1033 ? 0 : 1;
    float _1037 = 1.0 / _1029;
    float _1039 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1041 = abs(_1035);
    float _1043 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].w, _889);
    bool _1045 = !_771;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1039);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1053 = _861 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1055 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1057 = isnan(0.0);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1063 = _1059 || _1061;
    float _1065 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].w, _929);
    float _1067 = -_1051;
    float _1069 = fma(_1053, 2.0, _1067);
    int _1071 = abs(_1047);
    float _1073 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1049);
    float _1075 = _1063 ? _973 : 0.0;
    float _1077 = fma(_101, (*spvDescriptorSet0.vp_c9)._m0[77].z, _823);
    float _1079 = float(_1041);
    float _1081 = -_101;
    float _1083 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1069);
    float _1085 = float(_1001);
    if (_1025)
    {
        float _1087 = _1075 * _1037;
        _103 = _1087;
    }
    float _1089 = _103;
    float _1091 = float(_1071);
    float _1093 = fma(_1003, _1011, _1011);
    float _1095 = float(_1009);
    float _1097 = _1079 * _1085;
    float _1099 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1093);
    float _1101 = _853 + (-1.0);
    float _1103 = _1091 * _1095;
    float _1105 = _1097 * (-2.0);
    float _1107 = fma(_1031, _1089, _1099);
    float _1109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1111 = _1103 * (-2.0);
    float _1113 = fma(_1105, _1013, _1013);
    float _1115 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1117 = fma(_885, _1105, _885);
    float _1119 = fma(_1111, _1015, _1015);
    float _1121 = _1107 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1111, _1115);
    float _1125 = fma(_883, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1119);
    float _1127 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1113);
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1129;
    bool _1133 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1135 = isnan(_669);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1145;
    float _1149 = fma(_1123, _1089, _1125);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1153 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1151;
    float _1155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1157 = fma(_1117, _1089, _1127);
    bool _1159 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1161 = isnan(_669);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1143;
    float _1173 = _1171 + 1.0;
    float _1175 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1177 = _1175 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1179 = fma(_1131, _877, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1181 = fma(_1147, _877, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1183 = fma(_1153, _877, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1185 = _1149 * 0.15915493667125701904296875;
    float _1187 = _1157 * 0.15915493667125701904296875;
    bool _1189 = _669 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1191 = isnan(_669);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1213 = _1121 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    float _1217 = fma(_1203, _843, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1219 = _1199 * _1209;
    float _1221 = -_1199;
    float _1223 = _1221 + 1.0;
    float _1225 = fma(_1177, _843, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1227 = _809 + 0.5;
    float _1229 = _1179 * _1219;
    float _1231 = -_1077;
    float _1233 = _1231 + 1.0;
    float _1235 = _1185 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = fma(_1211, _1227, _991);
    float _1241 = -_1233;
    float _1243 = fma(_809, _1241, _1239);
    float _1245 = _1121 * 6.283185482025146484375;
    float _1247 = cos(_1245);
    float _1249 = _1187 * 6.283185482025146484375;
    float _1251 = sin(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1257 = _1181 * _1219;
    float _1259 = _1183 * _1219;
    float _1261 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = fma(_1255, _843, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1265 = _757 + (-0.5);
    float _1267 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1229);
    float _1269 = _1187 * 6.283185482025146484375;
    float _1271 = cos(_1269);
    float _1273 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1257);
    float _1275 = fma(_1223, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1259);
    float _1277 = -_1261;
    float _1279 = -_953;
    float _1281 = fma(_1277, _1265, _1279);
    float _1283 = fma(_1217, _1205, _1267);
    float _1285 = fma(_1225, _1205, _1273);
    float _1287 = fma(_1263, _1205, _1275);
    float _1289 = _1237 * _779;
    float _1291 = _1185 * 6.283185482025146484375;
    float _1293 = sin(_1291);
    float _1295 = _1215 * _1251;
    float _1297 = _1247 * _1251;
    float _1299 = _1247 * _1289;
    float _1301 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1283);
    float _1303 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1285);
    float _1305 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1287);
    float _1307 = _1247 * _1271;
    float _1309 = _1251 * _1237;
    float _1311 = _1271 * _1237;
    float _1313 = _1215 * _1271;
    float _1315 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1319 = _1301 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1321 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1323 = fma(_1293, _1307, _1295);
    float _1325 = -_1313;
    float _1327 = fma(_1293, _1297, _1325);
    float _1329 = -_1297;
    float _1331 = fma(_1293, _1313, _1329);
    float _1333 = _1215 * _1289;
    float _1335 = fma(_1323, _777, _1299);
    float _1337 = _1293 * _779;
    float _1339 = fma(_1293, _1295, _1307);
    float _1341 = fma(_1331, _777, _1333);
    float _1343 = fma(_1327, _1315, _1335);
    float _1345 = -_1337;
    float _1347 = fma(_1311, _777, _1345);
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = fma(_1339, _1315, _1341);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1355 = fma(_1309, _1315, _1347);
    float _1357 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1359 = _1317 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1361 = _827 + 0.5;
    float _1363 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1353);
    float _1365 = _1343 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1367 = _1305 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1359, _1361, _1083);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1363);
    float _1373 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1365);
    float _1375 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1357);
    float _1377 = _799 + (-0.5);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1381 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1375);
    float _1385 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1387 = _905 + _1379;
    float _1389 = _1381 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1391 = _801 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1393 = -_1385;
    float _1395 = -_957;
    float _1397 = fma(_1393, _1377, _1395);
    float _1399 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1401 = _959 + _1389;
    float _1403 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1407 = _1391 + _1399;
    float _1409 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1411 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1403);
    float _1413 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1405);
    float _1415 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1409);
    float _1417 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1411);
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1413);
    out.m_44.x = _1401;
    out.m_44.y = _1387;
    out.m_44.z = _1407;
    float _1421 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1415);
    float _1423 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1425 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1433 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1435 = _1423 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1429);
    float _1439 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1431);
    float _1441 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1433);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1435);
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1447 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1437);
    float _1449 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1439);
    float _1451 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1441);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1445);
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1443);
    float _1457 = -_1065;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1043;
    float _1463 = _1461 + 1.0;
    float _1465 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1453);
    float _1467 = -_1073;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_799, _1459, _1397);
    float _1473 = fma(_757, _1463, _1281);
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1477 = -_1469;
    float _1479 = fma(_827, _1477, _1369);
    float _1481 = _1319 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1449);
    float _1485 = _1321 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1489 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1447);
    float _1491 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1451);
    float _1493 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1455);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_46.x = _1243;
    out.m_46.y = _1473;
    out.m_46.z = _1479;
    out.m_46.w = _1471;
    out.m_48.x = _1481;
    out.m_48.y = _1485;
    out.m_48.z = _1487;
    out.gl_Position.x = _1489;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _1491;
    out.gl_Position.w = _1493;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

