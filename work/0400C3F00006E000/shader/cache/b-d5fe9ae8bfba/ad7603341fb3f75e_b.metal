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
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1028 = as_type<float>(_87);
        out.gl_Position.z = _1028;
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
        _79 = _109;
    }
    float _111 = _79;
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
        float _1098 = as_type<float>(_125);
        out.gl_Position.z = _1098;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_37.x;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _131 * _105;
    float _155 = 0.0;
    float _157 = _137;
    if (!_147)
    {
        float _159 = _137 * _137;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = exp2(_153);
    float _167 = _163;
    if (!_147)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = _127 * 2.0;
    float _175 = _133 * _151;
    float _177 = _135 * 2.0;
    float _179 = floor(_173);
    float _181 = _149 * 2.0;
    float _183 = _127 + _149;
    float _185 = _183 + (-1.0);
    float _187 = floor(_177);
    float _189 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _191 = _179 > 0.0;
    float _193 = floor(_181);
    bool _195 = _179 >= 0.0;
    bool _197 = isnan(_179);
    bool _199 = _195 || _197;
    bool _201 = isnan(0.0);
    bool _203 = _199 || _201;
    int _205 = _203 ? 0 : 1;
    bool _207 = _187 > 0.0;
    bool _209 = _187 >= 0.0;
    bool _211 = isnan(_187);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _149 + _135;
    int _221 = ~_205;
    int _223 = _221 + 1;
    int _225 = _223 + 1;
    int _227 = _225;
    float _229 = _171;
    if (!_191)
    {
        int _231 = ~_205;
        int _233 = _231 + 1;
        _227 = _233;
    }
    int _235 = _227;
    float _237 = _219 + (-1.0);
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _241 = !_147;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _137 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _137);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _271;
    }
    float _273 = _229;
    bool _275 = !_147;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _137 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _157 = _295;
    }
    float _297 = _157;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    bool _303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _311 = _307 || _309;
    float _313 = -_165;
    float _315 = _313 + 1.0;
    bool _317 = _193 > 0.0;
    float _319 = 1.0 / _301;
    int _321 = _217 ? 0 : 1;
    float _323 = in.m_39.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    int _337 = ~_321;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    int _343 = _341;
    if (!_207)
    {
        int _345 = ~_321;
        int _347 = _345 + 1;
        _343 = _347;
    }
    int _349 = _343;
    float _351 = in.m_41.x;
    float _353 = in.m_41.y;
    float _355 = in.m_41.z;
    bool _357 = !_331;
    int _359 = _357 ? 0 : 1;
    bool _361 = _193 >= 0.0;
    bool _363 = isnan(_193);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    bool _371 = !_327;
    int _373 = _371 ? 0 : 1;
    int _375 = abs(_359);
    int _377 = abs(_373);
    float _379 = float(_349);
    bool _381 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _389 = _385 || _387;
    float _391 = float(_377);
    float _393 = float(_235);
    float _395 = float(_375);
    float _397 = _391 * _379;
    float _399 = _389 ? _315 : 0.0;
    bool _401 = !_335;
    int _403 = _401 ? 0 : 1;
    float _405 = _395 * _393;
    int _407 = _369 ? 0 : 1;
    if (_311)
    {
        float _409 = _399 * _319;
        _107 = _409;
    }
    float _411 = _107;
    int _413 = abs(_403);
    float _415 = _397 * (-2.0);
    int _417 = ~_407;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = _405 * (-2.0);
    int _425 = _421;
    if (!_317)
    {
        int _427 = ~_407;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    float _433 = fma(_415, _351, _351);
    float _435 = _149 + (-0.5);
    float _437 = fma(_423, _353, _353);
    float _439 = _127 + (-0.5);
    float _441 = float(_431);
    float _443 = fma(_189, _415, _189);
    float _445 = float(_413);
    float _447 = fma(_239, _423, _239);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _437);
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _433);
    float _453 = _127 + _135;
    float _455 = _445 * _441;
    float _457 = as_type<float>(int(gl_VertexIndex));
    float _459 = fma(_443, _411, _451);
    float _461 = _453 + (-1.0);
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = fma(_447, _411, _449);
    float _469 = _455 * (-2.0);
    float _471 = in.m_35.x;
    float _473 = in.m_35.y;
    float _475 = in.m_35.z;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _479 = _135 + (-0.5);
    float _481 = fma(_469, _355, _355);
    float _483 = in.m_39.w;
    float _485 = _467 * 0.15915493667125701904296875;
    float _487 = fma(_477, _469, _477);
    float _489 = in.m_30.x;
    float _491 = in.m_30.y;
    float _493 = in.m_30.z;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[196].z, _481);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = _459 * 0.15915493667125701904296875;
    float _503 = in.m_39.y;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = fma(_487, _411, _495);
    bool _511 = _149 > 0.5;
    float _513 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _515 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _517 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _519 = as_type<int>(_457) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>(_457) & 2;
    bool _525 = _523 != 0;
    float _527 = _509 * 0.15915493667125701904296875;
    float _529 = _501 * 6.283185482025146484375;
    float _531 = sin(_529);
    float _533 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _535 = fma(_297, _471, _513);
    float _537 = fma(_297, _473, _517);
    float _539 = fma(_297, _475, _533);
    float _541 = _501 * 6.283185482025146484375;
    float _543 = cos(_541);
    bool _545 = !_525;
    float _547 = _545 ? (-0.5) : 0.5;
    float _549 = fma(_535, _483, _489);
    bool _551 = !_521;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _323 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _559 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _561 = _485 * 6.283185482025146484375;
    float _563 = sin(_561);
    float _565 = fma(_537, _483, _491);
    float _567 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _569 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _553);
    float _573 = fma(_539, _483, _493);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _581 = _579 != 0;
    float _583 = _569 * _557;
    float _585 = _485 * 6.283185482025146484375;
    float _587 = cos(_585);
    float _589 = _567 * _571;
    float _591 = _527 * 6.283185482025146484375;
    float _593 = cos(_591);
    float _595 = _543 * _563;
    float _597 = _531 * _563;
    float _599 = _527 * 6.283185482025146484375;
    float _601 = sin(_599);
    float _603 = _531 * _587;
    float _605 = _543 * _587;
    float _607 = floor(_515);
    float _609 = _593 * _583;
    float _611 = _563 * _593;
    float _613 = _587 * _593;
    float _615 = _543 * _609;
    float _617 = _531 * _609;
    float _619 = -_583;
    float _621 = _601 * _619;
    float _623 = -_595;
    float _625 = fma(_601, _603, _623);
    float _627 = -_603;
    float _629 = fma(_601, _595, _627);
    float _631 = fma(_601, _605, _597);
    float _633 = fma(_601, _597, _605);
    float _635 = fma(_613, _589, _621);
    float _637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _639 = fma(_631, _589, _615);
    float _641 = _565 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_625, _589, _617);
    float _645 = -_607;
    float _647 = _515 + _645;
    float _649 = fma(_629, _637, _639);
    float _651 = fma(_611, _637, _635);
    float _653 = _515 * 6.283185482025146484375;
    float _655 = _565 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _657 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _661 = fma(_633, _637, _643);
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _655);
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _669 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _671 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[10].x, _659);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _665);
    float _679 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[8].x, _667);
    float _681 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _671);
    float _685 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _679);
    bool _689 = _647 < 0.5;
    float _691 = float(_689);
    float _693 = _681 + _683;
    float _695 = -_647;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _699 = _685 + _687;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _699 + _705;
    float _709 = _703 * _703;
    float _711 = fma(_675, 0.5, 0.5);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _715 = fma(_707, _707, _709);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _719 = sqrt(_715);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _723 = !_577;
    int _725 = _723 ? 0 : 1;
    float _727 = _565 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _735 = abs(_725);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = -_711;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _747 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    bool _749 = !_465;
    int _751 = _749 ? 0 : 1;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _729;
    out.m_46.y = _731;
    out.m_46.z = _733;
    float _761 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    int _763 = abs(_751);
    float _765 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_48.x = _755;
    out.m_48.y = _757;
    out.m_48.z = _759;
    out.m_48.w = _753;
    bool _767 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _761 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _771 = float(_735);
    float _773 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[9].x, _765);
    bool _775 = !_581;
    int _777 = _775 ? 0 : 1;
    float _779 = -_691;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _783 = _127 > 0.5;
    float _785 = abs(_697);
    float _787 = _771 * _785;
    float _789 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _773);
    float _791 = _769 + _789;
    int _793 = abs(_777);
    float _795 = float(_763);
    float _797 = float(_793);
    float _799 = -_553;
    int _801 = _783 ? as_type<int>(_799) : as_type<int>(_553);
    float _803 = fma(_795, _745, _787);
    float _805 = -_547;
    int _807 = _511 ? as_type<int>(_805) : as_type<int>(_547);
    bool _809 = !_499;
    float _811 = _809 ? _553 : as_type<float>(_801);
    float _813 = abs(_781);
    float _815 = fma(_797, _813, _803);
    bool _817 = !_507;
    float _819 = _817 ? _547 : as_type<float>(_807);
    float _821 = _803;
    float _823 = _699;
    float _825 = _693;
    if (!_767)
    {
        _821 = _791;
    }
    float _827 = _821;
    bool _829 = !_767;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _719 + _835;
        float _839 = _791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = rsqrt(_715);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = fma(_791, _849, _857);
        float _863 = _841 * _859;
        float _865 = fma(_707, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_703, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _831 = _861;
        _823 = _865;
        _825 = _867;
    }
    float _869 = _831;
    float _871 = _823;
    float _873 = _825;
    float _875 = _869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _879);
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _885);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _887);
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _901 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _913 = _899 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _907);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _909);
    float _921 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _911);
    float _923 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _925 = -_819;
    float _927 = _925 + 0.5;
    float _929 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[5].z, _917);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[4].z, _919);
    float _935 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[6].z, _921);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[7].z, _923);
    float _939 = _811 + 0.5;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _929);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _933);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _937);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _935);
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _953 = _941 * _897;
    float _955 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = _945 + _947;
    float _959 = _949 + _947;
    float _961 = _947 * 0.5;
    float _963 = _951 * _915;
    float _965 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _967 = _957 * 0.5;
    float _969 = _959 * 0.5;
    float _971 = fma(_943, -0.5, _961);
    out.m_50.x = _963;
    out.m_50.y = _953;
    out.m_33.x = _965;
    out.gl_Position.x = _945;
    out.gl_Position.y = _943;
    out.gl_Position.z = _949;
    out.gl_Position.w = _947;
    out.m_52.x = _967;
    out.m_52.y = _971;
    out.m_52.z = _969;
    out.m_52.w = _947;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1028 = as_type<float>(_87);
        out.gl_Position.z = _1028;
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
        _79 = _109;
    }
    float _111 = _79;
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
        float _1098 = as_type<float>(_125);
        out.gl_Position.z = _1098;
    }
    if (_117)
    {
        return out;
    }
    float _127 = in.m_37.x;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _131 * _105;
    float _155 = 0.0;
    float _157 = _137;
    if (!_147)
    {
        float _159 = _137 * _137;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = exp2(_153);
    float _167 = _163;
    if (!_147)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = _127 * 2.0;
    float _175 = _133 * _151;
    float _177 = _135 * 2.0;
    float _179 = floor(_173);
    float _181 = _149 * 2.0;
    float _183 = _127 + _149;
    float _185 = _183 + (-1.0);
    float _187 = floor(_177);
    float _189 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _191 = _179 > 0.0;
    float _193 = floor(_181);
    bool _195 = _179 >= 0.0;
    bool _197 = isnan(_179);
    bool _199 = _195 || _197;
    bool _201 = isnan(0.0);
    bool _203 = _199 || _201;
    int _205 = _203 ? 0 : 1;
    bool _207 = _187 > 0.0;
    bool _209 = _187 >= 0.0;
    bool _211 = isnan(_187);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _149 + _135;
    int _221 = ~_205;
    int _223 = _221 + 1;
    int _225 = _223 + 1;
    int _227 = _225;
    float _229 = _171;
    if (!_191)
    {
        int _231 = ~_205;
        int _233 = _231 + 1;
        _227 = _233;
    }
    int _235 = _227;
    float _237 = _219 + (-1.0);
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _241 = !_147;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _137 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _137);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _271;
    }
    float _273 = _229;
    bool _275 = !_147;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _137 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _157 = _295;
    }
    float _297 = _157;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    bool _303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _311 = _307 || _309;
    float _313 = -_165;
    float _315 = _313 + 1.0;
    bool _317 = _193 > 0.0;
    float _319 = 1.0 / _301;
    int _321 = _217 ? 0 : 1;
    float _323 = in.m_39.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    int _337 = ~_321;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    int _343 = _341;
    if (!_207)
    {
        int _345 = ~_321;
        int _347 = _345 + 1;
        _343 = _347;
    }
    int _349 = _343;
    float _351 = in.m_41.x;
    float _353 = in.m_41.y;
    float _355 = in.m_41.z;
    bool _357 = !_331;
    int _359 = _357 ? 0 : 1;
    bool _361 = _193 >= 0.0;
    bool _363 = isnan(_193);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    bool _371 = !_327;
    int _373 = _371 ? 0 : 1;
    int _375 = abs(_359);
    int _377 = abs(_373);
    float _379 = float(_349);
    bool _381 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _389 = _385 || _387;
    float _391 = float(_377);
    float _393 = float(_235);
    float _395 = float(_375);
    float _397 = _391 * _379;
    float _399 = _389 ? _315 : 0.0;
    bool _401 = !_335;
    int _403 = _401 ? 0 : 1;
    float _405 = _395 * _393;
    int _407 = _369 ? 0 : 1;
    if (_311)
    {
        float _409 = _399 * _319;
        _107 = _409;
    }
    float _411 = _107;
    int _413 = abs(_403);
    float _415 = _397 * (-2.0);
    int _417 = ~_407;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = _405 * (-2.0);
    int _425 = _421;
    if (!_317)
    {
        int _427 = ~_407;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    float _433 = fma(_415, _351, _351);
    float _435 = _149 + (-0.5);
    float _437 = fma(_423, _353, _353);
    float _439 = _127 + (-0.5);
    float _441 = float(_431);
    float _443 = fma(_189, _415, _189);
    float _445 = float(_413);
    float _447 = fma(_239, _423, _239);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _437);
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _433);
    float _453 = _127 + _135;
    float _455 = _445 * _441;
    float _457 = as_type<float>(int(gl_VertexIndex));
    float _459 = fma(_443, _411, _451);
    float _461 = _453 + (-1.0);
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = fma(_447, _411, _449);
    float _469 = _455 * (-2.0);
    float _471 = in.m_35.x;
    float _473 = in.m_35.y;
    float _475 = in.m_35.z;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _479 = _135 + (-0.5);
    float _481 = fma(_469, _355, _355);
    float _483 = in.m_39.w;
    float _485 = _467 * 0.15915493667125701904296875;
    float _487 = fma(_477, _469, _477);
    float _489 = in.m_30.x;
    float _491 = in.m_30.y;
    float _493 = in.m_30.z;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[196].z, _481);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = _459 * 0.15915493667125701904296875;
    float _503 = in.m_39.y;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = fma(_487, _411, _495);
    bool _511 = _149 > 0.5;
    float _513 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _515 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _517 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _519 = as_type<int>(_457) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>(_457) & 2;
    bool _525 = _523 != 0;
    float _527 = _509 * 0.15915493667125701904296875;
    float _529 = _501 * 6.283185482025146484375;
    float _531 = sin(_529);
    float _533 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _535 = fma(_297, _471, _513);
    float _537 = fma(_297, _473, _517);
    float _539 = fma(_297, _475, _533);
    float _541 = _501 * 6.283185482025146484375;
    float _543 = cos(_541);
    bool _545 = !_525;
    float _547 = _545 ? (-0.5) : 0.5;
    float _549 = fma(_535, _483, _489);
    bool _551 = !_521;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _323 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _559 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _561 = _485 * 6.283185482025146484375;
    float _563 = sin(_561);
    float _565 = fma(_537, _483, _491);
    float _567 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _569 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _553);
    float _573 = fma(_539, _483, _493);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _581 = _579 != 0;
    float _583 = _569 * _557;
    float _585 = _485 * 6.283185482025146484375;
    float _587 = cos(_585);
    float _589 = _567 * _571;
    float _591 = _527 * 6.283185482025146484375;
    float _593 = cos(_591);
    float _595 = _543 * _563;
    float _597 = _531 * _563;
    float _599 = _527 * 6.283185482025146484375;
    float _601 = sin(_599);
    float _603 = _531 * _587;
    float _605 = _543 * _587;
    float _607 = floor(_515);
    float _609 = _593 * _583;
    float _611 = _563 * _593;
    float _613 = _587 * _593;
    float _615 = _543 * _609;
    float _617 = _531 * _609;
    float _619 = -_583;
    float _621 = _601 * _619;
    float _623 = -_595;
    float _625 = fma(_601, _603, _623);
    float _627 = -_603;
    float _629 = fma(_601, _595, _627);
    float _631 = fma(_601, _605, _597);
    float _633 = fma(_601, _597, _605);
    float _635 = fma(_613, _589, _621);
    float _637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _639 = fma(_631, _589, _615);
    float _641 = _565 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_625, _589, _617);
    float _645 = -_607;
    float _647 = _515 + _645;
    float _649 = fma(_629, _637, _639);
    float _651 = fma(_611, _637, _635);
    float _653 = _515 * 6.283185482025146484375;
    float _655 = _565 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _657 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _661 = fma(_633, _637, _643);
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _655);
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _669 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _671 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[10].x, _659);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _665);
    float _679 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[8].x, _667);
    float _681 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _671);
    float _685 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _679);
    bool _689 = _647 < 0.5;
    float _691 = float(_689);
    float _693 = _681 + _683;
    float _695 = -_647;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _699 = _685 + _687;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _699 + _705;
    float _709 = _703 * _703;
    float _711 = fma(_675, 0.5, 0.5);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _715 = fma(_707, _707, _709);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _719 = sqrt(_715);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _723 = !_577;
    int _725 = _723 ? 0 : 1;
    float _727 = _565 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _735 = abs(_725);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = -_711;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _747 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    bool _749 = !_465;
    int _751 = _749 ? 0 : 1;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _729;
    out.m_46.y = _731;
    out.m_46.z = _733;
    float _761 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    int _763 = abs(_751);
    float _765 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_48.x = _755;
    out.m_48.y = _757;
    out.m_48.z = _759;
    out.m_48.w = _753;
    bool _767 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _761 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _771 = float(_735);
    float _773 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[9].x, _765);
    bool _775 = !_581;
    int _777 = _775 ? 0 : 1;
    float _779 = -_691;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _783 = _127 > 0.5;
    float _785 = abs(_697);
    float _787 = _771 * _785;
    float _789 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _773);
    float _791 = _769 + _789;
    int _793 = abs(_777);
    float _795 = float(_763);
    float _797 = float(_793);
    float _799 = -_553;
    int _801 = _783 ? as_type<int>(_799) : as_type<int>(_553);
    float _803 = fma(_795, _745, _787);
    float _805 = -_547;
    int _807 = _511 ? as_type<int>(_805) : as_type<int>(_547);
    bool _809 = !_499;
    float _811 = _809 ? _553 : as_type<float>(_801);
    float _813 = abs(_781);
    float _815 = fma(_797, _813, _803);
    bool _817 = !_507;
    float _819 = _817 ? _547 : as_type<float>(_807);
    float _821 = _803;
    float _823 = _699;
    float _825 = _693;
    if (!_767)
    {
        _821 = _791;
    }
    float _827 = _821;
    bool _829 = !_767;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _719 + _835;
        float _839 = _791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = rsqrt(_715);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = fma(_791, _849, _857);
        float _863 = _841 * _859;
        float _865 = fma(_707, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_703, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _831 = _861;
        _823 = _865;
        _825 = _867;
    }
    float _869 = _831;
    float _871 = _823;
    float _873 = _825;
    float _875 = _869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _879);
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _885);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _887);
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _901 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _913 = _899 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _907);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _909);
    float _921 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _911);
    float _923 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _925 = -_819;
    float _927 = _925 + 0.5;
    float _929 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[5].z, _917);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[4].z, _919);
    float _935 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[6].z, _921);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[7].z, _923);
    float _939 = _811 + 0.5;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _929);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _933);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _937);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _935);
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _953 = _941 * _897;
    float _955 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = _945 + _947;
    float _959 = _949 + _947;
    float _961 = _947 * 0.5;
    float _963 = _951 * _915;
    float _965 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _967 = _957 * 0.5;
    float _969 = _959 * 0.5;
    float _971 = fma(_943, -0.5, _961);
    out.m_50.x = _963;
    out.m_50.y = _953;
    out.m_33.x = _965;
    out.gl_Position.x = _945;
    out.gl_Position.y = _943;
    out.gl_Position.z = _949;
    out.gl_Position.w = _947;
    out.m_52.x = _967;
    out.m_52.y = _971;
    out.m_52.z = _969;
    out.m_52.w = _947;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _79 = as_type<float>(_71);
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _77;
    if (!_75)
    {
        out.m_33.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1028 = as_type<float>(_87);
        out.gl_Position.z = _1028;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _79 = _109;
    }
    float _111 = _79;
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
        float _1098 = as_type<float>(_125);
        out.gl_Position.z = _1098;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_37.x;
    float _129 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _131 = log2(_129);
    float _133 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = in.m_37.z;
    float _137 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _139 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _141 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _143 = _139 || _141;
    bool _145 = isnan(1.0);
    bool _147 = _143 || _145;
    float _149 = in.m_37.y;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _131 * _105;
    float _155 = 0.0;
    float _157 = _137;
    if (!_147)
    {
        float _159 = _137 * _137;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = exp2(_153);
    float _167 = _163;
    if (!_147)
    {
        float _169 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _167 = _169;
    }
    float _171 = _167;
    float _173 = _127 * 2.0;
    float _175 = _133 * _151;
    float _177 = _135 * 2.0;
    float _179 = floor(_173);
    float _181 = _149 * 2.0;
    float _183 = _127 + _149;
    float _185 = _183 + (-1.0);
    float _187 = floor(_177);
    float _189 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _191 = _179 > 0.0;
    float _193 = floor(_181);
    bool _195 = _179 >= 0.0;
    bool _197 = isnan(_179);
    bool _199 = _195 || _197;
    bool _201 = isnan(0.0);
    bool _203 = _199 || _201;
    int _205 = _203 ? 0 : 1;
    bool _207 = _187 > 0.0;
    bool _209 = _187 >= 0.0;
    bool _211 = isnan(_187);
    bool _213 = _209 || _211;
    bool _215 = isnan(0.0);
    bool _217 = _213 || _215;
    float _219 = _149 + _135;
    int _221 = ~_205;
    int _223 = _221 + 1;
    int _225 = _223 + 1;
    int _227 = _225;
    float _229 = _171;
    if (!_191)
    {
        int _231 = ~_205;
        int _233 = _231 + 1;
        _227 = _233;
    }
    int _235 = _227;
    float _237 = _219 + (-1.0);
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _241 = !_147;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = _137 * _245;
        float _255 = 1.0 / _249;
        float _257 = _251 * 0.693147182464599609375;
        float _259 = exp2(_253);
        float _261 = 1.0 / _257;
        float _263 = _259 + (-1.0);
        float _265 = -_263;
        float _267 = fma(_265, _261, _137);
        float _269 = _267 * _255;
        float _271 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _271;
    }
    float _273 = _229;
    bool _275 = !_147;
    if (!_275)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _137 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _157 = _295;
    }
    float _297 = _157;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _301 = 1.0 + _299;
    bool _303 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _305 = isnan(1.0);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _311 = _307 || _309;
    float _313 = -_165;
    float _315 = _313 + 1.0;
    bool _317 = _193 > 0.0;
    float _319 = 1.0 / _301;
    int _321 = _217 ? 0 : 1;
    float _323 = in.m_39.x;
    int _325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _327 = _325 != 0;
    int _329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _331 = _329 != 0;
    int _333 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _335 = _333 != 0;
    int _337 = ~_321;
    int _339 = _337 + 1;
    int _341 = _339 + 1;
    int _343 = _341;
    if (!_207)
    {
        int _345 = ~_321;
        int _347 = _345 + 1;
        _343 = _347;
    }
    int _349 = _343;
    float _351 = in.m_41.x;
    float _353 = in.m_41.y;
    float _355 = in.m_41.z;
    bool _357 = !_331;
    int _359 = _357 ? 0 : 1;
    bool _361 = _193 >= 0.0;
    bool _363 = isnan(_193);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    bool _371 = !_327;
    int _373 = _371 ? 0 : 1;
    int _375 = abs(_359);
    int _377 = abs(_373);
    float _379 = float(_349);
    bool _381 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _383 = isnan(0.0);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _389 = _385 || _387;
    float _391 = float(_377);
    float _393 = float(_235);
    float _395 = float(_375);
    float _397 = _391 * _379;
    float _399 = _389 ? _315 : 0.0;
    bool _401 = !_335;
    int _403 = _401 ? 0 : 1;
    float _405 = _395 * _393;
    int _407 = _369 ? 0 : 1;
    if (_311)
    {
        float _409 = _399 * _319;
        _107 = _409;
    }
    float _411 = _107;
    int _413 = abs(_403);
    float _415 = _397 * (-2.0);
    int _417 = ~_407;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    float _423 = _405 * (-2.0);
    int _425 = _421;
    if (!_317)
    {
        int _427 = ~_407;
        int _429 = _427 + 1;
        _425 = _429;
    }
    int _431 = _425;
    float _433 = fma(_415, _351, _351);
    float _435 = _149 + (-0.5);
    float _437 = fma(_423, _353, _353);
    float _439 = _127 + (-0.5);
    float _441 = float(_431);
    float _443 = fma(_189, _415, _189);
    float _445 = float(_413);
    float _447 = fma(_239, _423, _239);
    float _449 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[196].y, _437);
    float _451 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[196].x, _433);
    float _453 = _127 + _135;
    float _455 = _445 * _441;
    float _457 = as_type<float>(int(gl_VertexIndex));
    float _459 = fma(_443, _411, _451);
    float _461 = _453 + (-1.0);
    int _463 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _465 = _463 != 0;
    float _467 = fma(_447, _411, _449);
    float _469 = _455 * (-2.0);
    float _471 = in.m_35.x;
    float _473 = in.m_35.y;
    float _475 = in.m_35.z;
    float _477 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _479 = _135 + (-0.5);
    float _481 = fma(_469, _355, _355);
    float _483 = in.m_39.w;
    float _485 = _467 * 0.15915493667125701904296875;
    float _487 = fma(_477, _469, _477);
    float _489 = in.m_30.x;
    float _491 = in.m_30.y;
    float _493 = in.m_30.z;
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[196].z, _481);
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _499 = _497 != 0;
    float _501 = _459 * 0.15915493667125701904296875;
    float _503 = in.m_39.y;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _507 = _505 != 0;
    float _509 = fma(_487, _411, _495);
    bool _511 = _149 > 0.5;
    float _513 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _515 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    float _517 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _519 = as_type<int>(_457) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>(_457) & 2;
    bool _525 = _523 != 0;
    float _527 = _509 * 0.15915493667125701904296875;
    float _529 = _501 * 6.283185482025146484375;
    float _531 = sin(_529);
    float _533 = _273 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _535 = fma(_297, _471, _513);
    float _537 = fma(_297, _473, _517);
    float _539 = fma(_297, _475, _533);
    float _541 = _501 * 6.283185482025146484375;
    float _543 = cos(_541);
    bool _545 = !_525;
    float _547 = _545 ? (-0.5) : 0.5;
    float _549 = fma(_535, _483, _489);
    bool _551 = !_521;
    float _553 = _551 ? (-0.5) : 0.5;
    float _555 = _323 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _547);
    float _559 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _561 = _485 * 6.283185482025146484375;
    float _563 = sin(_561);
    float _565 = fma(_537, _483, _491);
    float _567 = _555 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _569 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _553);
    float _573 = fma(_539, _483, _493);
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _577 = _575 != 0;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _581 = _579 != 0;
    float _583 = _569 * _557;
    float _585 = _485 * 6.283185482025146484375;
    float _587 = cos(_585);
    float _589 = _567 * _571;
    float _591 = _527 * 6.283185482025146484375;
    float _593 = cos(_591);
    float _595 = _543 * _563;
    float _597 = _531 * _563;
    float _599 = _527 * 6.283185482025146484375;
    float _601 = sin(_599);
    float _603 = _531 * _587;
    float _605 = _543 * _587;
    float _607 = floor(_515);
    float _609 = _593 * _583;
    float _611 = _563 * _593;
    float _613 = _587 * _593;
    float _615 = _543 * _609;
    float _617 = _531 * _609;
    float _619 = -_583;
    float _621 = _601 * _619;
    float _623 = -_595;
    float _625 = fma(_601, _603, _623);
    float _627 = -_603;
    float _629 = fma(_601, _595, _627);
    float _631 = fma(_601, _605, _597);
    float _633 = fma(_601, _597, _605);
    float _635 = fma(_613, _589, _621);
    float _637 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _639 = fma(_631, _589, _615);
    float _641 = _565 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _643 = fma(_625, _589, _617);
    float _645 = -_607;
    float _647 = _515 + _645;
    float _649 = fma(_629, _637, _639);
    float _651 = fma(_611, _637, _635);
    float _653 = _515 * 6.283185482025146484375;
    float _655 = _565 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _657 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[6].x, _641);
    float _659 = _649 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _661 = fma(_633, _637, _643);
    float _663 = _653 * 0.15915493667125701904296875;
    float _665 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[4].x, _655);
    float _667 = _649 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _669 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _671 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[10].x, _659);
    float _673 = _663 * 6.283185482025146484375;
    float _675 = cos(_673);
    float _677 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[4].z, _665);
    float _679 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[8].x, _667);
    float _681 = _669 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[10].z, _671);
    float _685 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _687 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[8].z, _679);
    bool _689 = _647 < 0.5;
    float _691 = float(_689);
    float _693 = _681 + _683;
    float _695 = -_647;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _699 = _685 + _687;
    float _701 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _703 = _693 + _701;
    float _705 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _707 = _699 + _705;
    float _709 = _703 * _703;
    float _711 = fma(_675, 0.5, 0.5);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _715 = fma(_707, _707, _709);
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _719 = sqrt(_715);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _723 = !_577;
    int _725 = _723 ? 0 : 1;
    float _727 = _565 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _735 = abs(_725);
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _743 = -_711;
    float _745 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _747 = fma(_549, (*spvDescriptorSet0.vp_c10)._m0[5].x, _727);
    bool _749 = !_465;
    int _751 = _749 ? 0 : 1;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _755 = _737 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_46.x = _729;
    out.m_46.y = _731;
    out.m_46.z = _733;
    float _761 = fma(_573, (*spvDescriptorSet0.vp_c10)._m0[5].z, _747);
    int _763 = abs(_751);
    float _765 = _649 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.m_48.x = _755;
    out.m_48.y = _757;
    out.m_48.z = _759;
    out.m_48.w = _753;
    bool _767 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _769 = _761 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _771 = float(_735);
    float _773 = fma(_651, (*spvDescriptorSet0.vp_c10)._m0[9].x, _765);
    bool _775 = !_581;
    int _777 = _775 ? 0 : 1;
    float _779 = -_691;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _783 = _127 > 0.5;
    float _785 = abs(_697);
    float _787 = _771 * _785;
    float _789 = fma(_661, (*spvDescriptorSet0.vp_c10)._m0[9].z, _773);
    float _791 = _769 + _789;
    int _793 = abs(_777);
    float _795 = float(_763);
    float _797 = float(_793);
    float _799 = -_553;
    int _801 = _783 ? as_type<int>(_799) : as_type<int>(_553);
    float _803 = fma(_795, _745, _787);
    float _805 = -_547;
    int _807 = _511 ? as_type<int>(_805) : as_type<int>(_547);
    bool _809 = !_499;
    float _811 = _809 ? _553 : as_type<float>(_801);
    float _813 = abs(_781);
    float _815 = fma(_797, _813, _803);
    bool _817 = !_507;
    float _819 = _817 ? _547 : as_type<float>(_807);
    float _821 = _803;
    float _823 = _699;
    float _825 = _693;
    if (!_767)
    {
        _821 = _791;
    }
    float _827 = _821;
    bool _829 = !_767;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _719 + _835;
        float _839 = _791 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _841 = rsqrt(_715);
        float _843 = _837 * _833;
        float _845 = _843 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = cos(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 + (-1.0);
        float _857 = _855 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = fma(_853, _839, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = fma(_791, _849, _857);
        float _863 = _841 * _859;
        float _865 = fma(_707, _863, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_703, _863, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _831 = _861;
        _823 = _865;
        _825 = _867;
    }
    float _869 = _831;
    float _871 = _823;
    float _873 = _825;
    float _875 = _869 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _877 = _869 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _879 = _869 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _881 = _869 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _883 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[1].x, _875);
    float _885 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[0].x, _877);
    float _887 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[2].x, _879);
    float _889 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[3].x, _881);
    float _891 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[1].z, _883);
    float _893 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[0].z, _885);
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[2].z, _887);
    float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _901 = _893 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[3].z, _889);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _907 = _899 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _909 = _899 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _911 = _899 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _913 = _899 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _917 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].x, _907);
    float _919 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].x, _909);
    float _921 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].x, _911);
    float _923 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _925 = -_819;
    float _927 = _925 + 0.5;
    float _929 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[5].z, _917);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[4].z, _919);
    float _935 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[6].z, _921);
    float _937 = fma(_905, (*spvDescriptorSet0.vp_c8)._m0[7].z, _923);
    float _939 = _811 + 0.5;
    float _941 = _927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _929);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _933);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _937);
    float _949 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _935);
    float _951 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _953 = _941 * _897;
    float _955 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _957 = _945 + _947;
    float _959 = _949 + _947;
    float _961 = _947 * 0.5;
    float _963 = _951 * _915;
    float _965 = _955 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _967 = _957 * 0.5;
    float _969 = _959 * 0.5;
    float _971 = fma(_943, -0.5, _961);
    out.m_50.x = _963;
    out.m_50.y = _953;
    out.m_33.x = _965;
    out.gl_Position.x = _945;
    out.gl_Position.y = _943;
    out.gl_Position.z = _949;
    out.gl_Position.w = _947;
    out.m_52.x = _967;
    out.m_52.y = _971;
    out.m_52.z = _969;
    out.m_52.w = _947;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

