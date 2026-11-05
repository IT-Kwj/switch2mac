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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _683 = false;
    bool _531 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1425 = as_type<float>(_91);
        out.gl_Position.z = _1425;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1494 = as_type<float>(_127);
        out.gl_Position.z = _1494;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = _149 * 6.283185482025146484375;
    float _159 = floor(_149);
    int _161 = as_type<int>(_135) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_135) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = _157 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = 0.5;
    if (!_145)
    {
        float _183 = _169 * _169;
        float _185 = _183 * 0.5;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _171 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _187;
    if (!_145)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_159;
    float _205 = _149 + _203;
    bool _207 = !_167;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_145;
    float _213 = _201;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _169 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _169);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _169 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _179 = _267;
    }
    float _269 = _179;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_42.w;
    bool _283 = _205 < 0.5;
    float _285 = float(_283);
    bool _287 = !_273;
    int _289 = _287 ? 0 : 1;
    float _291 = -_205;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_30.x;
    float _297 = in.m_30.y;
    float _299 = in.m_30.z;
    float _301 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _303 = !_175;
    int _305 = _303 ? 0 : 1;
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_279;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_289);
    float _317 = fma(_269, _151, _301);
    int _319 = abs(_305);
    float _321 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = !_277;
    int _325 = _323 ? 0 : 1;
    float _327 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = fma(_269, _153, _321);
    int _333 = abs(_325);
    float _335 = float(_315);
    float _337 = fma(_269, _155, _327);
    float _339 = float(_319);
    float _341 = abs(_293);
    float _343 = _335 * _341;
    float _345 = float(_333);
    float _347 = fma(_339, _313, _343);
    float _349 = fma(_317, _281, _295);
    float _351 = fma(_331, _281, _297);
    float _353 = fma(_337, _281, _299);
    float _355 = abs(_309);
    float _357 = fma(_345, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_75);
        float _381 = 1.0 / _379;
        float _383 = _109 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = _385 + _387;
    bool _391 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_385);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _385 + _403;
    bool _407 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_385);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -_401;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _425;
    bool _433 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_385);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _417 * _429;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _453 = _443 * _449;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -_443;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _405 * _431;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = _389 * _455;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = fma(_459, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = fma(_483, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = _489 * _453;
    float _495 = _491 * _453;
    float _497 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _499 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _501 = fma(_477, _445, _497);
    float _503 = fma(_475, _445, _499);
    float _505 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].x, _501);
    float _507 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].y, _503);
    float _509 = _505 * _485;
    float _511 = _507 * _487;
    bool _513 = !_451;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_75);
        float _535 = 1.0 / _533;
        float _537 = _109 * _535;
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
    float _599 = -_591;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _563;
    float _605 = _559 * _601;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _579 * _593;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = fma(_619, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _575 * _597;
    float _631 = -_575;
    float _633 = _631 + 1.0;
    float _635 = _623 * _603;
    float _637 = _627 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _539 + _639;
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = fma(_635, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _649 = fma(_645, _605, _643);
    float _651 = _647 * _129;
    float _653 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _657 = trunc(_651);
    int _659 = int(_657);
    out.m_44.x = _615;
    out.m_44.y = _617;
    out.m_44.z = _625;
    out.m_44.w = _655;
    int _661 = _659 << 4;
    int _663 = _661 + 1968;
    bool _665 = !_613;
    float _681;
    if (!_665)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _669 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_75);
        float _687 = 1.0 / _685;
        float _689 = _109 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = in.m_37.z;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _697 = _129 > 0.5;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    float _709 = _357 * _509;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _727 = _725 != 0;
    float _729 = in.m_50.x;
    float _731 = in.m_50.y;
    float _733 = in.m_50.z;
    float _735 = in.m_37.y;
    float _737 = in.m_37.w;
    bool _739 = _693 > 0.5;
    float _741 = _351 * _701;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = _351 * _717;
    float _749 = fma(_349, _699, _741);
    float _751 = 1.0 / _745;
    float _753 = _351 * _731;
    float _755 = fma(_349, _715, _747);
    float _757 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = fma(_349, _729, _753);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _763 = fma(_353, _719, _755);
    float _765 = -_761;
    float _767 = fma(_757, 2.0, _765);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    uint _772 = uint(int(uint(_663) >> uint(2)));
    uint _774 = uint(int(uint(int(_772)) >> uint(2)));
    int _776 = int(_772) & 3;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[int(_774)][_776];
    int _780 = int(_772) + 1;
    uint _782 = uint(int(uint(_780) >> uint(2)));
    int _784 = _780 & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    float _788 = _735 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _796 = _737 > 0.5;
    float _798 = fma(_788, -2.0, _769);
    float _800 = _792 * _751;
    bool _802 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_691);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _794);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _818 = _691 + _816;
    bool _820 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _822 = isnan(_691);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    int _832 = _663 + 8;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _844 = -_812;
    float _846 = _844 + 1.0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _850 = -_191;
    int _852 = _697 ? as_type<int>(_850) : as_type<int>(_191);
    float _854 = fma(_800, _818, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _856 = _830 * _846;
    bool _858 = _735 > 0.5;
    float _860 = fma(_353, _703, _749);
    float _862 = _763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _864 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[78].w, _848);
    float _866 = fma(_353, _733, _759);
    float _868 = _854 * _856;
    float _870 = -_830;
    float _872 = _870 + 1.0;
    float _874 = _860 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _878 = _862 + _876;
    float _880 = -_209;
    int _882 = _858 ? as_type<int>(_880) : as_type<int>(_209);
    float _884 = -_109;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _767);
    float _888 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _890 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _798);
    float _892 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[131].x, _868);
    bool _896 = !_707;
    float _898 = _896 ? _191 : as_type<float>(_852);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _902 = _874 + _900;
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _906 = !_713;
    float _908 = _906 ? _209 : as_type<float>(_882);
    float _910 = _842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _912 = _898 + 0.5;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[28].x, _904);
    float _916 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _918 = _908 + (-0.5);
    float _920 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = fma(_910, _912, _886);
    float _924 = -_888;
    float _926 = _924 + 1.0;
    float _928 = -_916;
    float _930 = -_890;
    float _932 = fma(_928, _918, _930);
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = -_191;
    int _942 = _739 ? as_type<int>(_940) : as_type<int>(_191);
    float _944 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    float _946 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _878 * _878;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    bool _952 = !_723;
    float _954 = _952 ? _191 : as_type<float>(_942);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _958 = -_209;
    int _960 = _796 ? as_type<int>(_958) : as_type<int>(_209);
    float _962 = -_892;
    float _964 = _962 + 1.0;
    float _966 = fma(_902, _902, _948);
    float _968 = -_926;
    float _970 = fma(_898, _968, _922);
    bool _972 = _950 >= 0.0;
    float _974 = _954 + 0.5;
    bool _976 = !_727;
    float _978 = _976 ? _209 : as_type<float>(_960);
    float _980 = fma(_908, _964, _932);
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = fma(_936, _936, _966);
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _988 = -_978;
    float _990 = _988 + 0.5;
    float _992 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _994 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = _944 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = rsqrt(_984);
    float _1002 = _926;
    int _1004 = as_type<int>(_938);
    if (_972)
    {
        _1002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1002;
    float _1008 = _998 * _956;
    float _1010 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        float _1014 = _1006 * 5.0;
        _1004 = as_type<int>(_1014);
    }
    int _1016 = _1004;
    if (_972)
    {
        out.m_33.x = 0.0;
    }
    float _1018 = _986 * _982;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2914 = as_type<float>(_1016);
        out.gl_Position.z = _2914;
    }
    out.m_52.x = _970;
    out.m_52.y = _980;
    out.m_52.z = _1018;
    out.m_52.w = _1008;
    float _1024 = _1020 * _1000;
    out.m_54.x = _1012;
    out.m_54.y = _994;
    out.m_54.z = _1022;
    out.m_54.w = _996;
    float _1026 = _902 * _1024;
    float _1028 = _878 * _1024;
    if (_972)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1030 = -_1028;
    float _1032 = _862 + _1030;
    float _1034 = _936 * _1024;
    float _1036 = -_1026;
    float _1038 = _874 + _1036;
    float _1040 = -_1028;
    float _1042 = _878 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1032 + _1044;
    float _1048 = -_1034;
    float _1050 = _920 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = -_1026;
    float _1058 = _902 + _1056;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1050 + _1062;
    float _1066 = _1042 * _1042;
    float _1068 = -_1034;
    float _1070 = _936 + _1068;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1074 = _357 * _511;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1080 = fma(_1070, _1070, _1076);
    bool _1082 = _1078 >= 0.0;
    float _1084 = sqrt(_1080);
    float _1086 = _1078;
    if (_1082)
    {
        _1086 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1088 = _1086;
    int _1090 = as_type<int>(_1088);
    if (_1082)
    {
        out.m_33.x = 0.0;
    }
    float _1092 = _1000 * _1084;
    if (_1082)
    {
        float _1094 = _1088 * 5.0;
        _1090 = as_type<int>(_1094);
    }
    int _1096 = _1090;
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_1096);
        out.gl_Position.z = _3057;
    }
    if (_1082)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1098 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1106 = _1104 * 0.5;
    float _1108 = _1092 * _1098;
    float _1110 = _1010 * _1092;
    bool _1112 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1114 = isnan(0.5);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1120 = _1116 || _1118;
    float _1122 = _1100 * _1108;
    float _1124 = _1102 * _1110;
    float _1126 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1128);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1136 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1138 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1140 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _920 + _1138;
    float _1144 = _874 + _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1142 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1144 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1160 = sqrt(_1156);
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1158);
    float _1164 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1162);
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1168 = _862 + _1166;
    bool _1170 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = _1158;
    float _1174 = _1144;
    if (!_1170)
    {
        _181 = _1144;
    }
    float _1176 = _181;
    float _1178 = _1176;
    if (!_1170)
    {
        _1172 = _1142;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1170)
    {
        _1174 = _1168;
    }
    float _1184 = _1174;
    bool _1186 = !_1170;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1160 + _1192;
        float _1196 = rsqrt(_1156);
        float _1198 = _1194 * _1190;
        float _1200 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1198 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1196 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1152, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1148, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1168, _1210, _1222);
        _1178 = _1218;
        _1188 = _1224;
        _1182 = _1220;
    }
    float _1226 = _1178;
    float _1228 = _1188;
    float _1230 = _1182;
    float _1232 = -_1026;
    float _1234 = _1232 + _1226;
    float _1236 = -_1028;
    float _1238 = _1236 + _1228;
    float _1240 = -_1034;
    float _1242 = _1240 + _1230;
    float _1244 = _1238;
    float _1246 = _1234;
    float _1248 = _1242;
    if (!_1120)
    {
        float _1250 = _1046 * _1046;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1254 = -_920;
        float _1256 = _1254 + _1230;
        float _1258 = -_862;
        float _1260 = _1258 + _1228;
        float _1262 = fma(_1054, _1054, _1250);
        float _1264 = fma(_1064, _1064, _1262);
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = sqrt(_1264);
        float _1270 = 1.0 / _1092;
        float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1274 = precise::min(_1268, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1276 = _1274 * _1252;
        float _1278 = _1276 * _1270;
        float _1280 = -_874;
        float _1282 = _1280 + _1226;
        float _1284 = _1272 * _1278;
        float _1286 = _1256 * _1278;
        float _1288 = fma(_1282, _1284, _1038);
        float _1290 = fma(_1260, _1284, _1032);
        float _1292 = fma(_1272, _1286, _1050);
        _1244 = _1290;
        _1246 = _1288;
        _1248 = _1292;
    }
    float _1294 = _1244;
    float _1296 = _1246;
    float _1298 = _1248;
    float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1302);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1304);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1308);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1346);
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1348);
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1360 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1362 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1364 = _1356 + _1358;
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1364 * 0.5;
    out.m_33.x = _1366;
    out.gl_Position.x = _1360;
    out.gl_Position.y = _1362;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1358;
    out.m_56.z = _1368;
    out.m_56.w = _1358;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _683 = false;
    bool _531 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1425 = as_type<float>(_91);
        out.gl_Position.z = _1425;
    }
    if (!_79)
    {
        return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1494 = as_type<float>(_127);
        out.gl_Position.z = _1494;
    }
    if (_119)
    {
        return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = _149 * 6.283185482025146484375;
    float _159 = floor(_149);
    int _161 = as_type<int>(_135) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_135) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = _157 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = 0.5;
    if (!_145)
    {
        float _183 = _169 * _169;
        float _185 = _183 * 0.5;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _171 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _187;
    if (!_145)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_159;
    float _205 = _149 + _203;
    bool _207 = !_167;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_145;
    float _213 = _201;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _169 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _169);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _169 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _179 = _267;
    }
    float _269 = _179;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_42.w;
    bool _283 = _205 < 0.5;
    float _285 = float(_283);
    bool _287 = !_273;
    int _289 = _287 ? 0 : 1;
    float _291 = -_205;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_30.x;
    float _297 = in.m_30.y;
    float _299 = in.m_30.z;
    float _301 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _303 = !_175;
    int _305 = _303 ? 0 : 1;
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_279;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_289);
    float _317 = fma(_269, _151, _301);
    int _319 = abs(_305);
    float _321 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = !_277;
    int _325 = _323 ? 0 : 1;
    float _327 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = fma(_269, _153, _321);
    int _333 = abs(_325);
    float _335 = float(_315);
    float _337 = fma(_269, _155, _327);
    float _339 = float(_319);
    float _341 = abs(_293);
    float _343 = _335 * _341;
    float _345 = float(_333);
    float _347 = fma(_339, _313, _343);
    float _349 = fma(_317, _281, _295);
    float _351 = fma(_331, _281, _297);
    float _353 = fma(_337, _281, _299);
    float _355 = abs(_309);
    float _357 = fma(_345, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_75);
        float _381 = 1.0 / _379;
        float _383 = _109 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = _385 + _387;
    bool _391 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_385);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _385 + _403;
    bool _407 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_385);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -_401;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _425;
    bool _433 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_385);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _417 * _429;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _453 = _443 * _449;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -_443;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _405 * _431;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = _389 * _455;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = fma(_459, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = fma(_483, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = _489 * _453;
    float _495 = _491 * _453;
    float _497 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _499 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _501 = fma(_477, _445, _497);
    float _503 = fma(_475, _445, _499);
    float _505 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].x, _501);
    float _507 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].y, _503);
    float _509 = _505 * _485;
    float _511 = _507 * _487;
    bool _513 = !_451;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_75);
        float _535 = 1.0 / _533;
        float _537 = _109 * _535;
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
    float _599 = -_591;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _563;
    float _605 = _559 * _601;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _579 * _593;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = fma(_619, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _575 * _597;
    float _631 = -_575;
    float _633 = _631 + 1.0;
    float _635 = _623 * _603;
    float _637 = _627 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _539 + _639;
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = fma(_635, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _649 = fma(_645, _605, _643);
    float _651 = _647 * _129;
    float _653 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _657 = trunc(_651);
    int _659 = int(_657);
    out.m_44.x = _615;
    out.m_44.y = _617;
    out.m_44.z = _625;
    out.m_44.w = _655;
    int _661 = _659 << 4;
    int _663 = _661 + 1968;
    bool _665 = !_613;
    float _681;
    if (!_665)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _669 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_75);
        float _687 = 1.0 / _685;
        float _689 = _109 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = in.m_37.z;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _697 = _129 > 0.5;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    float _709 = _357 * _509;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _727 = _725 != 0;
    float _729 = in.m_50.x;
    float _731 = in.m_50.y;
    float _733 = in.m_50.z;
    float _735 = in.m_37.y;
    float _737 = in.m_37.w;
    bool _739 = _693 > 0.5;
    float _741 = _351 * _701;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = _351 * _717;
    float _749 = fma(_349, _699, _741);
    float _751 = 1.0 / _745;
    float _753 = _351 * _731;
    float _755 = fma(_349, _715, _747);
    float _757 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = fma(_349, _729, _753);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _763 = fma(_353, _719, _755);
    float _765 = -_761;
    float _767 = fma(_757, 2.0, _765);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    uint _772 = uint(int(uint(_663) >> uint(2)));
    uint _774 = uint(int(uint(int(_772)) >> uint(2)));
    int _776 = int(_772) & 3;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[int(_774)][_776];
    int _780 = int(_772) + 1;
    uint _782 = uint(int(uint(_780) >> uint(2)));
    int _784 = _780 & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    float _788 = _735 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _796 = _737 > 0.5;
    float _798 = fma(_788, -2.0, _769);
    float _800 = _792 * _751;
    bool _802 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_691);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _794);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _818 = _691 + _816;
    bool _820 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _822 = isnan(_691);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    int _832 = _663 + 8;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _844 = -_812;
    float _846 = _844 + 1.0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _850 = -_191;
    int _852 = _697 ? as_type<int>(_850) : as_type<int>(_191);
    float _854 = fma(_800, _818, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _856 = _830 * _846;
    bool _858 = _735 > 0.5;
    float _860 = fma(_353, _703, _749);
    float _862 = _763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _864 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[78].w, _848);
    float _866 = fma(_353, _733, _759);
    float _868 = _854 * _856;
    float _870 = -_830;
    float _872 = _870 + 1.0;
    float _874 = _860 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _878 = _862 + _876;
    float _880 = -_209;
    int _882 = _858 ? as_type<int>(_880) : as_type<int>(_209);
    float _884 = -_109;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _767);
    float _888 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _890 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _798);
    float _892 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[131].x, _868);
    bool _896 = !_707;
    float _898 = _896 ? _191 : as_type<float>(_852);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _902 = _874 + _900;
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _906 = !_713;
    float _908 = _906 ? _209 : as_type<float>(_882);
    float _910 = _842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _912 = _898 + 0.5;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[28].x, _904);
    float _916 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _918 = _908 + (-0.5);
    float _920 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = fma(_910, _912, _886);
    float _924 = -_888;
    float _926 = _924 + 1.0;
    float _928 = -_916;
    float _930 = -_890;
    float _932 = fma(_928, _918, _930);
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = -_191;
    int _942 = _739 ? as_type<int>(_940) : as_type<int>(_191);
    float _944 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    float _946 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _878 * _878;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    bool _952 = !_723;
    float _954 = _952 ? _191 : as_type<float>(_942);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _958 = -_209;
    int _960 = _796 ? as_type<int>(_958) : as_type<int>(_209);
    float _962 = -_892;
    float _964 = _962 + 1.0;
    float _966 = fma(_902, _902, _948);
    float _968 = -_926;
    float _970 = fma(_898, _968, _922);
    bool _972 = _950 >= 0.0;
    float _974 = _954 + 0.5;
    bool _976 = !_727;
    float _978 = _976 ? _209 : as_type<float>(_960);
    float _980 = fma(_908, _964, _932);
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = fma(_936, _936, _966);
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _988 = -_978;
    float _990 = _988 + 0.5;
    float _992 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _994 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = _944 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = rsqrt(_984);
    float _1002 = _926;
    int _1004 = as_type<int>(_938);
    if (_972)
    {
        _1002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1002;
    float _1008 = _998 * _956;
    float _1010 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        float _1014 = _1006 * 5.0;
        _1004 = as_type<int>(_1014);
    }
    int _1016 = _1004;
    if (_972)
    {
        out.m_33.x = 0.0;
    }
    float _1018 = _986 * _982;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2914 = as_type<float>(_1016);
        out.gl_Position.z = _2914;
    }
    out.m_52.x = _970;
    out.m_52.y = _980;
    out.m_52.z = _1018;
    out.m_52.w = _1008;
    float _1024 = _1020 * _1000;
    out.m_54.x = _1012;
    out.m_54.y = _994;
    out.m_54.z = _1022;
    out.m_54.w = _996;
    float _1026 = _902 * _1024;
    float _1028 = _878 * _1024;
    if (_972)
    {
        return out;
    }
    float _1030 = -_1028;
    float _1032 = _862 + _1030;
    float _1034 = _936 * _1024;
    float _1036 = -_1026;
    float _1038 = _874 + _1036;
    float _1040 = -_1028;
    float _1042 = _878 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1032 + _1044;
    float _1048 = -_1034;
    float _1050 = _920 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = -_1026;
    float _1058 = _902 + _1056;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1050 + _1062;
    float _1066 = _1042 * _1042;
    float _1068 = -_1034;
    float _1070 = _936 + _1068;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1074 = _357 * _511;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1080 = fma(_1070, _1070, _1076);
    bool _1082 = _1078 >= 0.0;
    float _1084 = sqrt(_1080);
    float _1086 = _1078;
    if (_1082)
    {
        _1086 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1088 = _1086;
    int _1090 = as_type<int>(_1088);
    if (_1082)
    {
        out.m_33.x = 0.0;
    }
    float _1092 = _1000 * _1084;
    if (_1082)
    {
        float _1094 = _1088 * 5.0;
        _1090 = as_type<int>(_1094);
    }
    int _1096 = _1090;
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_1096);
        out.gl_Position.z = _3057;
    }
    if (_1082)
    {
        return out;
    }
    float _1098 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1106 = _1104 * 0.5;
    float _1108 = _1092 * _1098;
    float _1110 = _1010 * _1092;
    bool _1112 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1114 = isnan(0.5);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1120 = _1116 || _1118;
    float _1122 = _1100 * _1108;
    float _1124 = _1102 * _1110;
    float _1126 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1128);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1136 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1138 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1140 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _920 + _1138;
    float _1144 = _874 + _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1142 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1144 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1160 = sqrt(_1156);
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1158);
    float _1164 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1162);
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1168 = _862 + _1166;
    bool _1170 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = _1158;
    float _1174 = _1144;
    if (!_1170)
    {
        _181 = _1144;
    }
    float _1176 = _181;
    float _1178 = _1176;
    if (!_1170)
    {
        _1172 = _1142;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1170)
    {
        _1174 = _1168;
    }
    float _1184 = _1174;
    bool _1186 = !_1170;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1160 + _1192;
        float _1196 = rsqrt(_1156);
        float _1198 = _1194 * _1190;
        float _1200 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1198 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1196 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1152, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1148, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1168, _1210, _1222);
        _1178 = _1218;
        _1188 = _1224;
        _1182 = _1220;
    }
    float _1226 = _1178;
    float _1228 = _1188;
    float _1230 = _1182;
    float _1232 = -_1026;
    float _1234 = _1232 + _1226;
    float _1236 = -_1028;
    float _1238 = _1236 + _1228;
    float _1240 = -_1034;
    float _1242 = _1240 + _1230;
    float _1244 = _1238;
    float _1246 = _1234;
    float _1248 = _1242;
    if (!_1120)
    {
        float _1250 = _1046 * _1046;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1254 = -_920;
        float _1256 = _1254 + _1230;
        float _1258 = -_862;
        float _1260 = _1258 + _1228;
        float _1262 = fma(_1054, _1054, _1250);
        float _1264 = fma(_1064, _1064, _1262);
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = sqrt(_1264);
        float _1270 = 1.0 / _1092;
        float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1274 = precise::min(_1268, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1276 = _1274 * _1252;
        float _1278 = _1276 * _1270;
        float _1280 = -_874;
        float _1282 = _1280 + _1226;
        float _1284 = _1272 * _1278;
        float _1286 = _1256 * _1278;
        float _1288 = fma(_1282, _1284, _1038);
        float _1290 = fma(_1260, _1284, _1032);
        float _1292 = fma(_1272, _1286, _1050);
        _1244 = _1290;
        _1246 = _1288;
        _1248 = _1292;
    }
    float _1294 = _1244;
    float _1296 = _1246;
    float _1298 = _1248;
    float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1302);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1304);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1308);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1346);
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1348);
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1360 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1362 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1364 = _1356 + _1358;
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1364 * 0.5;
    out.m_33.x = _1366;
    out.gl_Position.x = _1360;
    out.gl_Position.y = _1362;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1358;
    out.m_56.z = _1368;
    out.m_56.w = _1358;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _683 = false;
    bool _531 = false;
    bool _377 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1425 = as_type<float>(_91);
        out.gl_Position.z = _1425;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1494 = as_type<float>(_127);
        out.gl_Position.z = _1494;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = _133 * _131;
    float _149 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = in.m_35.x;
    float _153 = in.m_35.y;
    float _155 = in.m_35.z;
    float _157 = _149 * 6.283185482025146484375;
    float _159 = floor(_149);
    int _161 = as_type<int>(_135) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_135) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _171 = _157 * 0.15915493667125701904296875;
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = 0.0;
    float _179 = _169;
    float _181 = 0.5;
    if (!_145)
    {
        float _183 = _169 * _169;
        float _185 = _183 * 0.5;
        _177 = _185;
    }
    float _187 = _177;
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = _171 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = _187;
    if (!_145)
    {
        float _199 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_159;
    float _205 = _149 + _203;
    bool _207 = !_167;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_145;
    float _213 = _201;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _169 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _169);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_145;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _169 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _179 = _267;
    }
    float _269 = _179;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = fma(_195, 0.5, 0.5);
    float _281 = in.m_42.w;
    bool _283 = _205 < 0.5;
    float _285 = float(_283);
    bool _287 = !_273;
    int _289 = _287 ? 0 : 1;
    float _291 = -_205;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_30.x;
    float _297 = in.m_30.y;
    float _299 = in.m_30.z;
    float _301 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _303 = !_175;
    int _305 = _303 ? 0 : 1;
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _311 = -_279;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _315 = abs(_289);
    float _317 = fma(_269, _151, _301);
    int _319 = abs(_305);
    float _321 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _323 = !_277;
    int _325 = _323 ? 0 : 1;
    float _327 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _329 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _331 = fma(_269, _153, _321);
    int _333 = abs(_325);
    float _335 = float(_315);
    float _337 = fma(_269, _155, _327);
    float _339 = float(_319);
    float _341 = abs(_293);
    float _343 = _335 * _341;
    float _345 = float(_333);
    float _347 = fma(_339, _313, _343);
    float _349 = fma(_317, _281, _295);
    float _351 = fma(_331, _281, _297);
    float _353 = fma(_337, _281, _299);
    float _355 = abs(_309);
    float _357 = fma(_345, _355, _347);
    bool _359 = !_329;
    float _375;
    if (!_359)
    {
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _363 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _365 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _367 = _365 * _361;
        float _369 = floor(_367);
        float _371 = -_369;
        float _373 = _367 + _371;
        _375 = _373;
        _377 = true;
    }
    else
    {
        float _379 = float(_75);
        float _381 = 1.0 / _379;
        float _383 = _109 * _381;
        _375 = _383;
    }
    _377 = false;
    float _385 = _375;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _389 = _385 + _387;
    bool _391 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _393 = isnan(_385);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _405 = _385 + _403;
    bool _407 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _409 = isnan(_385);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _427 = -_401;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _425;
    bool _433 = _385 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_385);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _417 * _429;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    bool _451 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _453 = _443 * _449;
    float _455 = 1.0 / _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = -_443;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = _405 * _431;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _477 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = _389 * _455;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = in.m_42.x;
    float _487 = in.m_42.y;
    float _489 = fma(_459, _479, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _491 = fma(_483, _479, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _493 = _489 * _453;
    float _495 = _491 * _453;
    float _497 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _495);
    float _499 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _501 = fma(_477, _445, _497);
    float _503 = fma(_475, _445, _499);
    float _505 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].x, _501);
    float _507 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[145].y, _503);
    float _509 = _505 * _485;
    float _511 = _507 * _487;
    bool _513 = !_451;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _517 = _129 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_75);
        float _535 = 1.0 / _533;
        float _537 = _109 * _535;
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
    float _599 = -_591;
    float _601 = _599 + 1.0;
    float _603 = 1.0 / _563;
    float _605 = _559 * _601;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _613 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _619 = _579 * _593;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _627 = fma(_619, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _575 * _597;
    float _631 = -_575;
    float _633 = _631 + 1.0;
    float _635 = _623 * _603;
    float _637 = _627 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _641 = _539 + _639;
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = fma(_635, _641, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _649 = fma(_645, _605, _643);
    float _651 = _647 * _129;
    float _653 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _657 = trunc(_651);
    int _659 = int(_657);
    out.m_44.x = _615;
    out.m_44.y = _617;
    out.m_44.z = _625;
    out.m_44.w = _655;
    int _661 = _659 << 4;
    int _663 = _661 + 1968;
    bool _665 = !_613;
    float _681;
    if (!_665)
    {
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _669 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].w, _109);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_75);
        float _687 = 1.0 / _685;
        float _689 = _109 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = in.m_37.z;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _697 = _129 > 0.5;
    float _699 = in.m_46.x;
    float _701 = in.m_46.y;
    float _703 = in.m_46.z;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _707 = _705 != 0;
    float _709 = _357 * _509;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = in.m_48.x;
    float _717 = in.m_48.y;
    float _719 = in.m_48.z;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _727 = _725 != 0;
    float _729 = in.m_50.x;
    float _731 = in.m_50.y;
    float _733 = in.m_50.z;
    float _735 = in.m_37.y;
    float _737 = in.m_37.w;
    bool _739 = _693 > 0.5;
    float _741 = _351 * _701;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _745 = _743 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _747 = _351 * _717;
    float _749 = fma(_349, _699, _741);
    float _751 = 1.0 / _745;
    float _753 = _351 * _731;
    float _755 = fma(_349, _715, _747);
    float _757 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _759 = fma(_349, _729, _753);
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _763 = fma(_353, _719, _755);
    float _765 = -_761;
    float _767 = fma(_757, 2.0, _765);
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    uint _772 = uint(int(uint(_663) >> uint(2)));
    uint _774 = uint(int(uint(int(_772)) >> uint(2)));
    int _776 = int(_772) & 3;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[int(_774)][_776];
    int _780 = int(_772) + 1;
    uint _782 = uint(int(uint(_780) >> uint(2)));
    int _784 = _780 & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    float _788 = _735 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _790;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _796 = _737 > 0.5;
    float _798 = fma(_788, -2.0, _769);
    float _800 = _792 * _751;
    bool _802 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _804 = isnan(_691);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _794);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _818 = _691 + _816;
    bool _820 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _822 = isnan(_691);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    int _832 = _663 + 8;
    uint _834 = uint(int(uint(_832) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    float _842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _844 = -_812;
    float _846 = _844 + 1.0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _850 = -_191;
    int _852 = _697 ? as_type<int>(_850) : as_type<int>(_191);
    float _854 = fma(_800, _818, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _856 = _830 * _846;
    bool _858 = _735 > 0.5;
    float _860 = fma(_353, _703, _749);
    float _862 = _763 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _864 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[78].w, _848);
    float _866 = fma(_353, _733, _759);
    float _868 = _854 * _856;
    float _870 = -_830;
    float _872 = _870 + 1.0;
    float _874 = _860 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _878 = _862 + _876;
    float _880 = -_209;
    int _882 = _858 ? as_type<int>(_880) : as_type<int>(_209);
    float _884 = -_109;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[76].x, _767);
    float _888 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _890 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _798);
    float _892 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _894 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[131].x, _868);
    bool _896 = !_707;
    float _898 = _896 ? _191 : as_type<float>(_852);
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _902 = _874 + _900;
    float _904 = _878 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _906 = !_713;
    float _908 = _906 ? _209 : as_type<float>(_882);
    float _910 = _842 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _912 = _898 + 0.5;
    float _914 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[28].x, _904);
    float _916 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _918 = _908 + (-0.5);
    float _920 = _866 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _922 = fma(_910, _912, _886);
    float _924 = -_888;
    float _926 = _924 + 1.0;
    float _928 = -_916;
    float _930 = -_890;
    float _932 = fma(_928, _918, _930);
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _920 + _934;
    float _938 = _778 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _940 = -_191;
    int _942 = _739 ? as_type<int>(_940) : as_type<int>(_191);
    float _944 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[132].x, _894);
    float _946 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _948 = _878 * _878;
    float _950 = fma(_936, (*spvDescriptorSet0.vp_c8)._m0[28].z, _914);
    bool _952 = !_723;
    float _954 = _952 ? _191 : as_type<float>(_942);
    float _956 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _958 = -_209;
    int _960 = _796 ? as_type<int>(_958) : as_type<int>(_209);
    float _962 = -_892;
    float _964 = _962 + 1.0;
    float _966 = fma(_902, _902, _948);
    float _968 = -_926;
    float _970 = fma(_898, _968, _922);
    bool _972 = _950 >= 0.0;
    float _974 = _954 + 0.5;
    bool _976 = !_727;
    float _978 = _976 ? _209 : as_type<float>(_960);
    float _980 = fma(_908, _964, _932);
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _984 = fma(_936, _936, _966);
    float _986 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _988 = -_978;
    float _990 = _988 + 0.5;
    float _992 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _994 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = _944 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _998 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1000 = rsqrt(_984);
    float _1002 = _926;
    int _1004 = as_type<int>(_938);
    if (_972)
    {
        _1002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1006 = _1002;
    float _1008 = _998 * _956;
    float _1010 = _709 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1012 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        float _1014 = _1006 * 5.0;
        _1004 = as_type<int>(_1014);
    }
    int _1016 = _1004;
    if (_972)
    {
        out.m_33.x = 0.0;
    }
    float _1018 = _986 * _982;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_972)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2914 = as_type<float>(_1016);
        out.gl_Position.z = _2914;
    }
    out.m_52.x = _970;
    out.m_52.y = _980;
    out.m_52.z = _1018;
    out.m_52.w = _1008;
    float _1024 = _1020 * _1000;
    out.m_54.x = _1012;
    out.m_54.y = _994;
    out.m_54.z = _1022;
    out.m_54.w = _996;
    float _1026 = _902 * _1024;
    float _1028 = _878 * _1024;
    if (_972)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1030 = -_1028;
    float _1032 = _862 + _1030;
    float _1034 = _936 * _1024;
    float _1036 = -_1026;
    float _1038 = _874 + _1036;
    float _1040 = -_1028;
    float _1042 = _878 + _1040;
    float _1044 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1046 = _1032 + _1044;
    float _1048 = -_1034;
    float _1050 = _920 + _1048;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1054 = _1038 + _1052;
    float _1056 = -_1026;
    float _1058 = _902 + _1056;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1050 + _1062;
    float _1066 = _1042 * _1042;
    float _1068 = -_1034;
    float _1070 = _936 + _1068;
    float _1072 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1060);
    float _1074 = _357 * _511;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1072);
    float _1080 = fma(_1070, _1070, _1076);
    bool _1082 = _1078 >= 0.0;
    float _1084 = sqrt(_1080);
    float _1086 = _1078;
    if (_1082)
    {
        _1086 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1088 = _1086;
    int _1090 = as_type<int>(_1088);
    if (_1082)
    {
        out.m_33.x = 0.0;
    }
    float _1092 = _1000 * _1084;
    if (_1082)
    {
        float _1094 = _1088 * 5.0;
        _1090 = as_type<int>(_1094);
    }
    int _1096 = _1090;
    if (_1082)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3057 = as_type<float>(_1096);
        out.gl_Position.z = _3057;
    }
    if (_1082)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1098 = _1074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1106 = _1104 * 0.5;
    float _1108 = _1092 * _1098;
    float _1110 = _1010 * _1092;
    bool _1112 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1114 = isnan(0.5);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1120 = _1116 || _1118;
    float _1122 = _1100 * _1108;
    float _1124 = _1102 * _1110;
    float _1126 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1130 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1128);
    float _1134 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1136 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1138 = _1134 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1140 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1142 = _920 + _1138;
    float _1144 = _874 + _1140;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1148 = _1142 + _1146;
    float _1150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1152 = _1144 + _1150;
    float _1154 = _1148 * _1148;
    float _1156 = fma(_1152, _1152, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1160 = sqrt(_1156);
    float _1162 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1158);
    float _1164 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1162);
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1168 = _862 + _1166;
    bool _1170 = _1160 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = _1158;
    float _1174 = _1144;
    if (!_1170)
    {
        _181 = _1144;
    }
    float _1176 = _181;
    float _1178 = _1176;
    if (!_1170)
    {
        _1172 = _1142;
    }
    float _1180 = _1172;
    float _1182 = _1180;
    if (!_1170)
    {
        _1174 = _1168;
    }
    float _1184 = _1174;
    bool _1186 = !_1170;
    float _1188 = _1184;
    if (!_1186)
    {
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1194 = _1160 + _1192;
        float _1196 = rsqrt(_1156);
        float _1198 = _1194 * _1190;
        float _1200 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1202 = _1198 * 0.15915493667125701904296875;
        float _1204 = _1202 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1202 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = fma(_1206, _1200, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1214 = _1196 * _1212;
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1152, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1220 = fma(_1148, _1214, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1222 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1224 = fma(_1168, _1210, _1222);
        _1178 = _1218;
        _1188 = _1224;
        _1182 = _1220;
    }
    float _1226 = _1178;
    float _1228 = _1188;
    float _1230 = _1182;
    float _1232 = -_1026;
    float _1234 = _1232 + _1226;
    float _1236 = -_1028;
    float _1238 = _1236 + _1228;
    float _1240 = -_1034;
    float _1242 = _1240 + _1230;
    float _1244 = _1238;
    float _1246 = _1234;
    float _1248 = _1242;
    if (!_1120)
    {
        float _1250 = _1046 * _1046;
        float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1254 = -_920;
        float _1256 = _1254 + _1230;
        float _1258 = -_862;
        float _1260 = _1258 + _1228;
        float _1262 = fma(_1054, _1054, _1250);
        float _1264 = fma(_1064, _1064, _1262);
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1268 = sqrt(_1264);
        float _1270 = 1.0 / _1092;
        float _1272 = _1266 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1274 = precise::min(_1268, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1276 = _1274 * _1252;
        float _1278 = _1276 * _1270;
        float _1280 = -_874;
        float _1282 = _1280 + _1226;
        float _1284 = _1272 * _1278;
        float _1286 = _1256 * _1278;
        float _1288 = fma(_1282, _1284, _1038);
        float _1290 = fma(_1260, _1284, _1032);
        float _1292 = fma(_1272, _1286, _1050);
        _1244 = _1290;
        _1246 = _1288;
        _1248 = _1292;
    }
    float _1294 = _1244;
    float _1296 = _1246;
    float _1298 = _1248;
    float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1302 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1304 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1308 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1300);
    float _1310 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1302);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1304);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1306);
    float _1316 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1308);
    float _1318 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1310);
    float _1320 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1312);
    float _1322 = fma(_1298, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1314);
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1326 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1332 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1334 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1336 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1340 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1332);
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1338);
    float _1348 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1340);
    float _1350 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1342);
    float _1352 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1346);
    float _1356 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1348);
    float _1358 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1350);
    float _1360 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1362 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1354);
    float _1364 = _1356 + _1358;
    float _1366 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1368 = _1364 * 0.5;
    out.m_33.x = _1366;
    out.gl_Position.x = _1360;
    out.gl_Position.y = _1362;
    out.gl_Position.z = _1356;
    out.gl_Position.w = _1358;
    out.m_56.z = _1368;
    out.m_56.w = _1358;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

