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
    bool _371 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
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
        float _1288 = as_type<float>(_125);
        out.gl_Position.z = _1288;
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
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _143, _231);
    float _239 = fma(_227, _141, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _149);
    float _245 = fma(_239, _127, _147);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
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
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _369;
    if (!_351)
    {
        float _353 = in.m_39.x;
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_39.z;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = in.m_39.x;
    float _389 = in.m_39.y;
    float _391 = as_type<float>(int(gl_VertexIndex));
    float _393 = _385 * _105;
    float _395 = exp2(_393);
    float _397 = _381 * 2.0;
    float _399 = _387 * 2.0;
    float _401 = _389 * 2.0;
    float _403 = floor(_397);
    float _405 = floor(_399);
    float _407 = -_395;
    float _409 = _407 + 1.0;
    bool _411 = _403 > 0.0;
    float _413 = floor(_401);
    bool _415 = _403 >= 0.0;
    bool _417 = isnan(_403);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    int _425 = _423 ? 0 : 1;
    bool _427 = _405 > 0.0;
    bool _429 = _405 >= 0.0;
    bool _431 = isnan(_405);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    int _439 = ~_425;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = as_type<int>(_391) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_391) & 2;
    bool _451 = _449 != 0;
    int _453 = _437 ? 0 : 1;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    int _465 = _443;
    if (!_411)
    {
        int _467 = ~_425;
        int _469 = _467 + 1;
        _465 = _469;
    }
    int _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    int _485 = ~_453;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    int _495 = _489;
    if (!_427)
    {
        int _497 = ~_453;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = _463 ? _409 : 0.0;
    bool _505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(1.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = in.m_44.x;
    float _517 = in.m_44.y;
    float _519 = in.m_44.z;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _523 = 1.0 + _521;
    bool _525 = _413 > 0.0;
    bool _527 = _413 >= 0.0;
    bool _529 = isnan(_413);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _389 + _381;
    float _539 = 1.0 / _523;
    int _541 = abs(_493);
    bool _543 = !_479;
    int _545 = _543 ? 0 : 1;
    float _547 = _537 + (-1.0);
    float _549 = float(_471);
    int _551 = abs(_545);
    float _553 = float(_541);
    float _555 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _557 = _389 + _387;
    float _559 = _553 * _549;
    float _561 = _557 + (-1.0);
    float _563 = float(_551);
    if (_513)
    {
        float _565 = _503 * _539;
        _107 = _565;
    }
    float _567 = _107;
    int _569 = _535 ? 0 : 1;
    float _571 = _559 * (-2.0);
    float _573 = float(_501);
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = !_483;
    int _579 = _577 ? 0 : 1;
    float _581 = _387 + (-0.5);
    int _583 = ~_569;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = fma(_571, _515, _515);
    int _591 = _587;
    if (!_525)
    {
        int _593 = ~_569;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _563 * _573;
    float _601 = fma(_575, _571, _575);
    int _603 = abs(_579);
    float _605 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _609 = _607 != 0;
    float _611 = in.m_37.x;
    float _613 = in.m_37.y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _617 = _615 != 0;
    float _619 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].x, _589);
    float _621 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _623 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _625 = float(_597);
    float _627 = _599 * (-2.0);
    float _629 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = float(_603);
    float _633 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _605);
    float _635 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _623);
    float _637 = fma(_627, _517, _517);
    float _639 = _389 + (-0.5);
    float _641 = _631 * _625;
    float _643 = _381 + _387;
    float _645 = fma(_601, _567, _619);
    float _647 = fma(_555, _627, _555);
    float _649 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].y, _637);
    float _651 = _641 * (-2.0);
    float _653 = _643 + (-1.0);
    float _655 = fma(_647, _567, _649);
    float _657 = _381 + (-0.5);
    float _659 = fma(_651, _519, _519);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _663 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _629);
    float _665 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _667 = _347 * _611;
    float _669 = fma(_661, _651, _661);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].z, _659);
    float _673 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _675 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _635);
    float _677 = _645 * 0.15915493667125701904296875;
    float _679 = fma(_669, _567, _671);
    float _681 = _663 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _687 = _655 * 0.15915493667125701904296875;
    float _689 = _679 * 0.15915493667125701904296875;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _683);
    float _693 = _673 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    bool _695 = _387 > 0.5;
    float _697 = _677 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[9].z, _691);
    float _703 = _349 * _613;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _693);
    bool _707 = !_451;
    float _709 = _707 ? (-0.5) : 0.5;
    float _711 = _701 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    bool _713 = !_447;
    float _715 = _713 ? (-0.5) : 0.5;
    float _717 = _677 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[8].z, _705);
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _709);
    float _727 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _715);
    float _731 = _721 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _733 = _711 * _711;
    float _735 = _687 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = _723 * _725;
    float _741 = _727 * _729;
    bool _743 = _389 > 0.5;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _749 = _689 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _687 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _699 * _737;
    float _759 = _719 * _737;
    float _761 = _689 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = fma(_731, _731, _733);
    float _767 = _737 * _751;
    float _769 = _751 * _739;
    float _771 = _699 * _769;
    float _773 = _699 * _755;
    float _775 = _719 * _755;
    float _777 = _755 * _751;
    float _779 = 1.0 / _747;
    float _781 = fma(_763, _773, _759);
    float _783 = -_757;
    float _785 = fma(_763, _775, _783);
    float _787 = -_775;
    float _789 = fma(_763, _757, _787);
    float _791 = -_739;
    float _793 = _763 * _791;
    float _795 = fma(_781, _741, _771);
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_763, _759, _773);
    float _801 = _719 * _769;
    float _803 = fma(_777, _741, _793);
    float _805 = sqrt(_765);
    float _807 = fma(_789, _797, _795);
    float _809 = fma(_785, _741, _801);
    float _811 = fma(_767, _797, _803);
    float _813 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _817;
    float _821 = fma(_799, _797, _809);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _813);
    float _825 = _819 * _779;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _815);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _823);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _833 = _379 + _831;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _827);
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = _829 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _843 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _845 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _847 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_379);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_841, _839, _685);
    float _861 = fma(_845, _839, _681);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _861 + _871;
    float _875 = 1.0 / _865;
    float _877 = _869 * _869;
    bool _879 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_379);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _895 = fma(_873, _873, _877);
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = 1.0 / _893;
    bool _903 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _905 = isnan(_379);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _917 = _889 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = sqrt(_895);
    float _931 = _913 * _921;
    float _933 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_46.w = _915;
    float _935 = _927 * _875;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _843 * _931;
    out.m_33.x = _923;
    bool _943 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _945 = isnan(_379);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _959 = _379 + _957;
    float _961 = -_913;
    float _963 = _961 + 1.0;
    float _965 = _939 * _901;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _969 = _379 + _967;
    float _971 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _973 = fma(_935, _959, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _975 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _941);
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = fma(_965, _969, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = fma(_973, _917, _977);
    float _989 = _857 * _981;
    float _991 = -_715;
    int _993 = _695 ? as_type<int>(_991) : as_type<int>(_715);
    float _995 = fma(_985, _839, _673);
    float _997 = -_709;
    int _999 = _743 ? as_type<int>(_997) : as_type<int>(_709);
    float _1001 = fma(_983, _989, _987);
    bool _1003 = !_609;
    float _1005 = _1003 ? _715 : as_type<float>(_993);
    bool _1007 = !_617;
    float _1009 = _1007 ? _709 : as_type<float>(_999);
    float _1011 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1001);
    float _1013 = _715;
    float _1015 = _709;
    float _1017 = _861;
    if (!_975)
    {
        _1013 = _859;
    }
    float _1019 = _1013;
    float _1021 = _1019;
    if (!_975)
    {
        _1015 = _995;
    }
    float _1023 = _1015;
    bool _1025 = !_975;
    float _1027 = _1023;
    if (!_1025)
    {
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1033 = _929 + _1031;
        float _1035 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = rsqrt(_895);
        float _1039 = _1033 * _1029;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1041 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 + (-1.0);
        float _1053 = fma(_1049, _1035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = _1037 * _1053;
        float _1059 = fma(_995, _1045, _1055);
        float _1061 = fma(_873, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_869, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1059;
        _1017 = _1061;
        _1021 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1017;
    float _1069 = _1021;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1081 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1081);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1085);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1109 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1117 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1119 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1125 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1109);
    float _1127 = _1005 + 0.5;
    float _1129 = -_1009;
    float _1131 = _1129 + 0.5;
    float _1133 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1117);
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1123);
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1125);
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1133);
    float _1147 = _1135 + _1137;
    float _1149 = _1137 * 0.5;
    float _1151 = _1141 * _1099;
    float _1153 = _1143 * _1115;
    float _1155 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1139);
    float _1159 = _1147 * 0.5;
    float _1161 = fma(_1145, -0.5, _1149);
    out.m_48.x = _1151;
    out.m_48.y = _1153;
    out.m_50.w = _1155;
    out.gl_Position.x = _1135;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1137;
    out.m_52.w = _1137;
    out.m_52.x = _1159;
    out.m_52.y = _1161;
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
    bool _371 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
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
        float _1288 = as_type<float>(_125);
        out.gl_Position.z = _1288;
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
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _143, _231);
    float _239 = fma(_227, _141, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _149);
    float _245 = fma(_239, _127, _147);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
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
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _369;
    if (!_351)
    {
        float _353 = in.m_39.x;
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_39.z;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = in.m_39.x;
    float _389 = in.m_39.y;
    float _391 = as_type<float>(int(gl_VertexIndex));
    float _393 = _385 * _105;
    float _395 = exp2(_393);
    float _397 = _381 * 2.0;
    float _399 = _387 * 2.0;
    float _401 = _389 * 2.0;
    float _403 = floor(_397);
    float _405 = floor(_399);
    float _407 = -_395;
    float _409 = _407 + 1.0;
    bool _411 = _403 > 0.0;
    float _413 = floor(_401);
    bool _415 = _403 >= 0.0;
    bool _417 = isnan(_403);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    int _425 = _423 ? 0 : 1;
    bool _427 = _405 > 0.0;
    bool _429 = _405 >= 0.0;
    bool _431 = isnan(_405);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    int _439 = ~_425;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = as_type<int>(_391) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_391) & 2;
    bool _451 = _449 != 0;
    int _453 = _437 ? 0 : 1;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    int _465 = _443;
    if (!_411)
    {
        int _467 = ~_425;
        int _469 = _467 + 1;
        _465 = _469;
    }
    int _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    int _485 = ~_453;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    int _495 = _489;
    if (!_427)
    {
        int _497 = ~_453;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = _463 ? _409 : 0.0;
    bool _505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(1.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = in.m_44.x;
    float _517 = in.m_44.y;
    float _519 = in.m_44.z;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _523 = 1.0 + _521;
    bool _525 = _413 > 0.0;
    bool _527 = _413 >= 0.0;
    bool _529 = isnan(_413);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _389 + _381;
    float _539 = 1.0 / _523;
    int _541 = abs(_493);
    bool _543 = !_479;
    int _545 = _543 ? 0 : 1;
    float _547 = _537 + (-1.0);
    float _549 = float(_471);
    int _551 = abs(_545);
    float _553 = float(_541);
    float _555 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _557 = _389 + _387;
    float _559 = _553 * _549;
    float _561 = _557 + (-1.0);
    float _563 = float(_551);
    if (_513)
    {
        float _565 = _503 * _539;
        _107 = _565;
    }
    float _567 = _107;
    int _569 = _535 ? 0 : 1;
    float _571 = _559 * (-2.0);
    float _573 = float(_501);
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = !_483;
    int _579 = _577 ? 0 : 1;
    float _581 = _387 + (-0.5);
    int _583 = ~_569;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = fma(_571, _515, _515);
    int _591 = _587;
    if (!_525)
    {
        int _593 = ~_569;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _563 * _573;
    float _601 = fma(_575, _571, _575);
    int _603 = abs(_579);
    float _605 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _609 = _607 != 0;
    float _611 = in.m_37.x;
    float _613 = in.m_37.y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _617 = _615 != 0;
    float _619 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].x, _589);
    float _621 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _623 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _625 = float(_597);
    float _627 = _599 * (-2.0);
    float _629 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = float(_603);
    float _633 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _605);
    float _635 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _623);
    float _637 = fma(_627, _517, _517);
    float _639 = _389 + (-0.5);
    float _641 = _631 * _625;
    float _643 = _381 + _387;
    float _645 = fma(_601, _567, _619);
    float _647 = fma(_555, _627, _555);
    float _649 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].y, _637);
    float _651 = _641 * (-2.0);
    float _653 = _643 + (-1.0);
    float _655 = fma(_647, _567, _649);
    float _657 = _381 + (-0.5);
    float _659 = fma(_651, _519, _519);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _663 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _629);
    float _665 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _667 = _347 * _611;
    float _669 = fma(_661, _651, _661);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].z, _659);
    float _673 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _675 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _635);
    float _677 = _645 * 0.15915493667125701904296875;
    float _679 = fma(_669, _567, _671);
    float _681 = _663 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _687 = _655 * 0.15915493667125701904296875;
    float _689 = _679 * 0.15915493667125701904296875;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _683);
    float _693 = _673 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    bool _695 = _387 > 0.5;
    float _697 = _677 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[9].z, _691);
    float _703 = _349 * _613;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _693);
    bool _707 = !_451;
    float _709 = _707 ? (-0.5) : 0.5;
    float _711 = _701 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    bool _713 = !_447;
    float _715 = _713 ? (-0.5) : 0.5;
    float _717 = _677 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[8].z, _705);
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _709);
    float _727 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _715);
    float _731 = _721 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _733 = _711 * _711;
    float _735 = _687 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = _723 * _725;
    float _741 = _727 * _729;
    bool _743 = _389 > 0.5;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _749 = _689 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _687 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _699 * _737;
    float _759 = _719 * _737;
    float _761 = _689 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = fma(_731, _731, _733);
    float _767 = _737 * _751;
    float _769 = _751 * _739;
    float _771 = _699 * _769;
    float _773 = _699 * _755;
    float _775 = _719 * _755;
    float _777 = _755 * _751;
    float _779 = 1.0 / _747;
    float _781 = fma(_763, _773, _759);
    float _783 = -_757;
    float _785 = fma(_763, _775, _783);
    float _787 = -_775;
    float _789 = fma(_763, _757, _787);
    float _791 = -_739;
    float _793 = _763 * _791;
    float _795 = fma(_781, _741, _771);
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_763, _759, _773);
    float _801 = _719 * _769;
    float _803 = fma(_777, _741, _793);
    float _805 = sqrt(_765);
    float _807 = fma(_789, _797, _795);
    float _809 = fma(_785, _741, _801);
    float _811 = fma(_767, _797, _803);
    float _813 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _817;
    float _821 = fma(_799, _797, _809);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _813);
    float _825 = _819 * _779;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _815);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _823);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _833 = _379 + _831;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _827);
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = _829 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _843 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _845 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _847 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_379);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_841, _839, _685);
    float _861 = fma(_845, _839, _681);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _861 + _871;
    float _875 = 1.0 / _865;
    float _877 = _869 * _869;
    bool _879 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_379);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _895 = fma(_873, _873, _877);
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = 1.0 / _893;
    bool _903 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _905 = isnan(_379);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _917 = _889 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = sqrt(_895);
    float _931 = _913 * _921;
    float _933 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_46.w = _915;
    float _935 = _927 * _875;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _843 * _931;
    out.m_33.x = _923;
    bool _943 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _945 = isnan(_379);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _959 = _379 + _957;
    float _961 = -_913;
    float _963 = _961 + 1.0;
    float _965 = _939 * _901;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _969 = _379 + _967;
    float _971 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _973 = fma(_935, _959, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _975 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _941);
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = fma(_965, _969, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = fma(_973, _917, _977);
    float _989 = _857 * _981;
    float _991 = -_715;
    int _993 = _695 ? as_type<int>(_991) : as_type<int>(_715);
    float _995 = fma(_985, _839, _673);
    float _997 = -_709;
    int _999 = _743 ? as_type<int>(_997) : as_type<int>(_709);
    float _1001 = fma(_983, _989, _987);
    bool _1003 = !_609;
    float _1005 = _1003 ? _715 : as_type<float>(_993);
    bool _1007 = !_617;
    float _1009 = _1007 ? _709 : as_type<float>(_999);
    float _1011 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1001);
    float _1013 = _715;
    float _1015 = _709;
    float _1017 = _861;
    if (!_975)
    {
        _1013 = _859;
    }
    float _1019 = _1013;
    float _1021 = _1019;
    if (!_975)
    {
        _1015 = _995;
    }
    float _1023 = _1015;
    bool _1025 = !_975;
    float _1027 = _1023;
    if (!_1025)
    {
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1033 = _929 + _1031;
        float _1035 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = rsqrt(_895);
        float _1039 = _1033 * _1029;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1041 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 + (-1.0);
        float _1053 = fma(_1049, _1035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = _1037 * _1053;
        float _1059 = fma(_995, _1045, _1055);
        float _1061 = fma(_873, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_869, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1059;
        _1017 = _1061;
        _1021 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1017;
    float _1069 = _1021;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1081 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1081);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1085);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1109 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1117 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1119 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1125 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1109);
    float _1127 = _1005 + 0.5;
    float _1129 = -_1009;
    float _1131 = _1129 + 0.5;
    float _1133 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1117);
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1123);
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1125);
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1133);
    float _1147 = _1135 + _1137;
    float _1149 = _1137 * 0.5;
    float _1151 = _1141 * _1099;
    float _1153 = _1143 * _1115;
    float _1155 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1139);
    float _1159 = _1147 * 0.5;
    float _1161 = fma(_1145, -0.5, _1149);
    out.m_48.x = _1151;
    out.m_48.y = _1153;
    out.m_50.w = _1155;
    out.gl_Position.x = _1135;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1137;
    out.m_52.w = _1137;
    out.m_52.x = _1159;
    out.m_52.y = _1161;
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
    bool _371 = false;
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
        float _1218 = as_type<float>(_87);
        out.gl_Position.z = _1218;
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
        float _1288 = as_type<float>(_125);
        out.gl_Position.z = _1288;
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
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _231 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = fma(_227, _143, _231);
    float _239 = fma(_227, _141, _233);
    float _241 = fma(_227, _145, _235);
    float _243 = fma(_237, _127, _149);
    float _245 = fma(_239, _127, _147);
    float _247 = fma(_241, _127, _151);
    bool _249 = !_229;
    float _267;
    if (!_249)
    {
        float _251 = in.m_39.x;
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _251 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
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
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = _277 + _279;
    bool _283 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _285 = isnan(_277);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -_293;
    float _301 = _299 + 1.0;
    bool _303 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_277);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _315;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _321 = 1.0 / _297;
    float _323 = _313 * _301;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = _281 * _321;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_317, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _335 * _323;
    float _341 = _337 * _323;
    float _343 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _345 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _347 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].x, _343);
    float _349 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[144].y, _345);
    bool _351 = !_319;
    float _369;
    if (!_351)
    {
        float _353 = in.m_39.x;
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _357 = _353 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = in.m_39.z;
    float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _385 = log2(_383);
    float _387 = in.m_39.x;
    float _389 = in.m_39.y;
    float _391 = as_type<float>(int(gl_VertexIndex));
    float _393 = _385 * _105;
    float _395 = exp2(_393);
    float _397 = _381 * 2.0;
    float _399 = _387 * 2.0;
    float _401 = _389 * 2.0;
    float _403 = floor(_397);
    float _405 = floor(_399);
    float _407 = -_395;
    float _409 = _407 + 1.0;
    bool _411 = _403 > 0.0;
    float _413 = floor(_401);
    bool _415 = _403 >= 0.0;
    bool _417 = isnan(_403);
    bool _419 = _415 || _417;
    bool _421 = isnan(0.0);
    bool _423 = _419 || _421;
    int _425 = _423 ? 0 : 1;
    bool _427 = _405 > 0.0;
    bool _429 = _405 >= 0.0;
    bool _431 = isnan(_405);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    int _439 = ~_425;
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    int _445 = as_type<int>(_391) & 1;
    bool _447 = _445 != 0;
    int _449 = as_type<int>(_391) & 2;
    bool _451 = _449 != 0;
    int _453 = _437 ? 0 : 1;
    bool _455 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _463 = _459 || _461;
    int _465 = _443;
    if (!_411)
    {
        int _467 = ~_425;
        int _469 = _467 + 1;
        _465 = _469;
    }
    int _471 = _465;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _483 = _481 != 0;
    int _485 = ~_453;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    int _495 = _489;
    if (!_427)
    {
        int _497 = ~_453;
        int _499 = _497 + 1;
        _495 = _499;
    }
    int _501 = _495;
    float _503 = _463 ? _409 : 0.0;
    bool _505 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _507 = isnan(1.0);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _513 = _509 || _511;
    float _515 = in.m_44.x;
    float _517 = in.m_44.y;
    float _519 = in.m_44.z;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _523 = 1.0 + _521;
    bool _525 = _413 > 0.0;
    bool _527 = _413 >= 0.0;
    bool _529 = isnan(_413);
    bool _531 = _527 || _529;
    bool _533 = isnan(0.0);
    bool _535 = _531 || _533;
    float _537 = _389 + _381;
    float _539 = 1.0 / _523;
    int _541 = abs(_493);
    bool _543 = !_479;
    int _545 = _543 ? 0 : 1;
    float _547 = _537 + (-1.0);
    float _549 = float(_471);
    int _551 = abs(_545);
    float _553 = float(_541);
    float _555 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _557 = _389 + _387;
    float _559 = _553 * _549;
    float _561 = _557 + (-1.0);
    float _563 = float(_551);
    if (_513)
    {
        float _565 = _503 * _539;
        _107 = _565;
    }
    float _567 = _107;
    int _569 = _535 ? 0 : 1;
    float _571 = _559 * (-2.0);
    float _573 = float(_501);
    float _575 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _577 = !_483;
    int _579 = _577 ? 0 : 1;
    float _581 = _387 + (-0.5);
    int _583 = ~_569;
    int _585 = _583 + 1;
    int _587 = _585 + 1;
    float _589 = fma(_571, _515, _515);
    int _591 = _587;
    if (!_525)
    {
        int _593 = ~_569;
        int _595 = _593 + 1;
        _591 = _595;
    }
    int _597 = _591;
    float _599 = _563 * _573;
    float _601 = fma(_575, _571, _575);
    int _603 = abs(_579);
    float _605 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _609 = _607 != 0;
    float _611 = in.m_37.x;
    float _613 = in.m_37.y;
    int _615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _617 = _615 != 0;
    float _619 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[196].x, _589);
    float _621 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _623 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _625 = float(_597);
    float _627 = _599 * (-2.0);
    float _629 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = float(_603);
    float _633 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _605);
    float _635 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _623);
    float _637 = fma(_627, _517, _517);
    float _639 = _389 + (-0.5);
    float _641 = _631 * _625;
    float _643 = _381 + _387;
    float _645 = fma(_601, _567, _619);
    float _647 = fma(_555, _627, _555);
    float _649 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[196].y, _637);
    float _651 = _641 * (-2.0);
    float _653 = _643 + (-1.0);
    float _655 = fma(_647, _567, _649);
    float _657 = _381 + (-0.5);
    float _659 = fma(_651, _519, _519);
    float _661 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _663 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[4].z, _629);
    float _665 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _667 = _347 * _611;
    float _669 = fma(_661, _651, _661);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[196].z, _659);
    float _673 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _675 = fma(_247, (*spvDescriptorSet0.vp_c10)._m0[6].z, _635);
    float _677 = _645 * 0.15915493667125701904296875;
    float _679 = fma(_669, _567, _671);
    float _681 = _663 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _683 = _673 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _685 = _675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _687 = _655 * 0.15915493667125701904296875;
    float _689 = _679 * 0.15915493667125701904296875;
    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[9].x, _683);
    float _693 = _673 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    bool _695 = _387 > 0.5;
    float _697 = _677 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[9].z, _691);
    float _703 = _349 * _613;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[8].x, _693);
    bool _707 = !_451;
    float _709 = _707 ? (-0.5) : 0.5;
    float _711 = _701 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    bool _713 = !_447;
    float _715 = _713 ? (-0.5) : 0.5;
    float _717 = _677 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[8].z, _705);
    float _723 = _703 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _709);
    float _727 = _667 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _715);
    float _731 = _721 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _733 = _711 * _711;
    float _735 = _687 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = _723 * _725;
    float _741 = _727 * _729;
    bool _743 = _389 > 0.5;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _749 = _689 * 6.283185482025146484375;
    float _751 = cos(_749);
    float _753 = _687 * 6.283185482025146484375;
    float _755 = cos(_753);
    float _757 = _699 * _737;
    float _759 = _719 * _737;
    float _761 = _689 * 6.283185482025146484375;
    float _763 = sin(_761);
    float _765 = fma(_731, _731, _733);
    float _767 = _737 * _751;
    float _769 = _751 * _739;
    float _771 = _699 * _769;
    float _773 = _699 * _755;
    float _775 = _719 * _755;
    float _777 = _755 * _751;
    float _779 = 1.0 / _747;
    float _781 = fma(_763, _773, _759);
    float _783 = -_757;
    float _785 = fma(_763, _775, _783);
    float _787 = -_775;
    float _789 = fma(_763, _757, _787);
    float _791 = -_739;
    float _793 = _763 * _791;
    float _795 = fma(_781, _741, _771);
    float _797 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _799 = fma(_763, _759, _773);
    float _801 = _719 * _769;
    float _803 = fma(_777, _741, _793);
    float _805 = sqrt(_765);
    float _807 = fma(_789, _797, _795);
    float _809 = fma(_785, _741, _801);
    float _811 = fma(_767, _797, _803);
    float _813 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _815 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _817;
    float _821 = fma(_799, _797, _809);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _813);
    float _825 = _819 * _779;
    float _827 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _815);
    float _829 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _823);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _833 = _379 + _831;
    float _835 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _827);
    float _837 = _805 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = _829 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _843 = fma(_825, _833, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _845 = _835 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _847 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _849 = isnan(_379);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = fma(_841, _839, _685);
    float _861 = fma(_845, _839, _681);
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _873 = _861 + _871;
    float _875 = 1.0 / _865;
    float _877 = _869 * _869;
    bool _879 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_379);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _895 = fma(_873, _873, _877);
    float _897 = -_857;
    float _899 = _897 + 1.0;
    float _901 = 1.0 / _893;
    bool _903 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _905 = isnan(_379);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _917 = _889 * _899;
    float _919 = -_889;
    float _921 = _919 + 1.0;
    float _923 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _929 = sqrt(_895);
    float _931 = _913 * _921;
    float _933 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_46.w = _915;
    float _935 = _927 * _875;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _937;
    float _941 = _843 * _931;
    out.m_33.x = _923;
    bool _943 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _945 = isnan(_379);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _951 = _947 || _949;
    float _953 = float(_951);
    float _955 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _933);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _959 = _379 + _957;
    float _961 = -_913;
    float _963 = _961 + 1.0;
    float _965 = _939 * _901;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _969 = _379 + _967;
    float _971 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _955);
    float _973 = fma(_935, _959, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _975 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _977 = fma(_963, (*spvDescriptorSet0.vp_c9)._m0[115].x, _941);
    float _979 = -_953;
    float _981 = _979 + 1.0;
    float _983 = fma(_965, _969, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _985 = _971 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _987 = fma(_973, _917, _977);
    float _989 = _857 * _981;
    float _991 = -_715;
    int _993 = _695 ? as_type<int>(_991) : as_type<int>(_715);
    float _995 = fma(_985, _839, _673);
    float _997 = -_709;
    int _999 = _743 ? as_type<int>(_997) : as_type<int>(_709);
    float _1001 = fma(_983, _989, _987);
    bool _1003 = !_609;
    float _1005 = _1003 ? _715 : as_type<float>(_993);
    bool _1007 = !_617;
    float _1009 = _1007 ? _709 : as_type<float>(_999);
    float _1011 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1001);
    float _1013 = _715;
    float _1015 = _709;
    float _1017 = _861;
    if (!_975)
    {
        _1013 = _859;
    }
    float _1019 = _1013;
    float _1021 = _1019;
    if (!_975)
    {
        _1015 = _995;
    }
    float _1023 = _1015;
    bool _1025 = !_975;
    float _1027 = _1023;
    if (!_1025)
    {
        float _1029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1033 = _929 + _1031;
        float _1035 = _995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1037 = rsqrt(_895);
        float _1039 = _1033 * _1029;
        float _1041 = _1039 * 0.15915493667125701904296875;
        float _1043 = _1041 * 6.283185482025146484375;
        float _1045 = cos(_1043);
        float _1047 = _1041 * 6.283185482025146484375;
        float _1049 = sin(_1047);
        float _1051 = _1045 + (-1.0);
        float _1053 = fma(_1049, _1035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1055 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = _1037 * _1053;
        float _1059 = fma(_995, _1045, _1055);
        float _1061 = fma(_873, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1063 = fma(_869, _1057, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1059;
        _1017 = _1061;
        _1021 = _1063;
    }
    float _1065 = _1027;
    float _1067 = _1017;
    float _1069 = _1021;
    float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1073 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1075 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1079 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1071);
    float _1081 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1073);
    float _1083 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1075);
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1077);
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1079);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1081);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1083);
    float _1093 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1085);
    float _1095 = _1087 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1097 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1101 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1103 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1105 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1107 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1109 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1111 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1103);
    float _1113 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1105);
    float _1115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1117 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1107);
    float _1119 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1121 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1111);
    float _1123 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1113);
    float _1125 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1109);
    float _1127 = _1005 + 0.5;
    float _1129 = -_1009;
    float _1131 = _1129 + 0.5;
    float _1133 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1117);
    float _1135 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1121);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1123);
    float _1139 = fma(_1101, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1125);
    float _1141 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1145 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1133);
    float _1147 = _1135 + _1137;
    float _1149 = _1137 * 0.5;
    float _1151 = _1141 * _1099;
    float _1153 = _1143 * _1115;
    float _1155 = _1011 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1157 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1139);
    float _1159 = _1147 * 0.5;
    float _1161 = fma(_1145, -0.5, _1149);
    out.m_48.x = _1151;
    out.m_48.y = _1153;
    out.m_50.w = _1155;
    out.gl_Position.x = _1135;
    out.gl_Position.y = _1145;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1137;
    out.m_52.w = _1137;
    out.m_52.x = _1159;
    out.m_52.y = _1161;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

