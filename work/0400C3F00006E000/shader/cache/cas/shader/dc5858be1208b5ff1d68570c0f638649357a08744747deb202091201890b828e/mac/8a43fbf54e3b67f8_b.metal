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
    float4 m_39 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_41 [[attribute(1)]];
    float4 m_35 [[attribute(2)]];
    float4 m_26 [[attribute(3)]];
    float4 m_31 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _355 = false;
    bool _255 = false;
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
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_83);
        out.gl_Position.z = _1346;
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
        float _1416 = as_type<float>(_121);
        out.gl_Position.z = _1416;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_33.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _101 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _127 * _125;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    int _143 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _145 = _143 != 0;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _139 * 0.15915493667125701904296875;
    float _151 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _165 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _151);
    float _167 = _149 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_155;
    int _173 = _171 ? 0 : 1;
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    bool _177 = !_145;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    bool _183 = !_159;
    int _185 = _183 ? 0 : 1;
    float _187 = -_141;
    float _189 = _137 + _187;
    int _191 = abs(_173);
    int _193 = abs(_179);
    int _195 = abs(_185);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_191);
    float _203 = fma(_169, 0.5, 0.5);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = abs(_199);
    float _209 = _201 * _207;
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_193);
    float _221 = -_213;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_195);
    float _227 = fma(_219, _217, _209);
    float _229 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _231 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _227);
    bool _237 = !_205;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_67);
        float _259 = 1.0 / _257;
        float _261 = _101 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = _299 * _287;
    float _311 = -_299;
    float _313 = _311 + 1.0;
    float _315 = _267 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_303, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _321 * _309;
    float _327 = _323 * _309;
    float _329 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].x, _329);
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].y, _331);
    bool _337 = !_305;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_67);
        float _359 = 1.0 / _357;
        float _361 = _101 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _461 = fma(_457, _455, _453);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _461);
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = in.m_37.x;
    float _477 = in.m_37.y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _471;
    out.m_39.y = _467;
    out.m_39.z = _473;
    out.m_39.w = _479;
    float _481 = _335 * _477;
    float _483 = _333 * _475;
    bool _485 = !_423;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_67);
        float _507 = 1.0 / _505;
        float _509 = _101 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = in.m_33.z;
    float _515 = _123 * 2.0;
    float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _519 = log2(_517);
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = in.m_33.y;
    float _535 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = floor(_515);
    bool _539 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(1.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _519 * _101;
    float _551 = exp2(_549);
    float _553 = _513 * 2.0;
    bool _555 = _537 > 0.0;
    float _557 = _533 * 2.0;
    float _559 = _123 + _533;
    float _561 = floor(_553);
    float _563 = _533 + _513;
    bool _565 = _537 >= 0.0;
    bool _567 = isnan(_537);
    bool _569 = _565 || _567;
    bool _571 = isnan(0.0);
    bool _573 = _569 || _571;
    float _575 = _559 + (-1.0);
    float _577 = _563 + (-1.0);
    int _579 = _573 ? 0 : 1;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = floor(_557);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _587 = 1.0 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _591 = ~_579;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    float _597 = -_551;
    float _599 = _597 + 1.0;
    int _601 = _595;
    if (!_555)
    {
        int _603 = ~_579;
        int _605 = _603 + 1;
        _601 = _605;
    }
    int _607 = _601;
    bool _609 = !_523;
    int _611 = _609 ? 0 : 1;
    float _613 = 1.0 / _587;
    bool _615 = !_527;
    int _617 = _615 ? 0 : 1;
    bool _619 = _561 > 0.0;
    bool _621 = _561 >= 0.0;
    bool _623 = isnan(_561);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = in.m_41.x;
    float _633 = in.m_41.y;
    float _635 = in.m_41.z;
    int _637 = abs(_617);
    bool _639 = _583 > 0.0;
    bool _641 = _583 >= 0.0;
    bool _643 = isnan(_583);
    bool _645 = _641 || _643;
    bool _647 = isnan(0.0);
    bool _649 = _645 || _647;
    bool _651 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = float(_637);
    float _663 = float(_607);
    float _665 = _659 ? _599 : 0.0;
    int _667 = _629 ? 0 : 1;
    float _669 = _661 * _663;
    int _671 = abs(_611);
    if (_547)
    {
        float _673 = _665 * _613;
        _103 = _673;
    }
    float _675 = _103;
    int _677 = ~_667;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _669 * (-2.0);
    int _685 = _649 ? 0 : 1;
    float _687 = _533 + (-0.5);
    float _689 = fma(_683, _633, _633);
    int _691 = _681;
    if (!_619)
    {
        int _693 = ~_667;
        int _695 = _693 + 1;
        _691 = _695;
    }
    int _697 = _691;
    float _699 = fma(_589, _683, _589);
    int _701 = ~_685;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _709 = float(_671);
    float _711 = float(_697);
    float _713 = fma(_699, _675, _707);
    int _715 = _705;
    if (!_639)
    {
        int _717 = ~_685;
        int _719 = _717 + 1;
        _715 = _719;
    }
    int _721 = _715;
    float _723 = _709 * _711;
    bool _725 = !_531;
    int _727 = _725 ? 0 : 1;
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = float(_721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _737 = abs(_727);
    float _739 = _723 * (-2.0);
    float _741 = as_type<float>(int(gl_VertexIndex));
    float _743 = 1.0 / _735;
    bool _745 = _123 > 0.5;
    float _747 = fma(_581, _739, _581);
    float _749 = float(_737);
    float _751 = fma(_739, _631, _631);
    float _753 = _123 + (-0.5);
    float _755 = in.m_33.w;
    float _757 = _749 * _731;
    float _759 = _123 + _513;
    float _761 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _763 = _757 * (-2.0);
    float _765 = _759 + (-1.0);
    float _767 = fma(_747, _675, _761);
    float _769 = _729 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_763, _635, _635);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _777 = _513 + (-0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_775, _763, _775);
    float _783 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    int _785 = as_type<int>(_741) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_741) & 2;
    bool _791 = _789 != 0;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = cos(_793);
    bool _797 = _533 > 0.5;
    float _799 = fma(_781, _675, _783);
    float _801 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * 0.15915493667125701904296875;
    bool _805 = !_787;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _779 * 6.283185482025146484375;
    float _811 = sin(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _511 + _817;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _831 = _829 != 0;
    float _833 = _779 * 6.283185482025146484375;
    float _835 = cos(_833);
    bool _837 = !_791;
    float _839 = _837 ? (-0.5) : 0.5;
    bool _841 = _513 > 0.5;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _843;
    float _847 = -_807;
    int _849 = _745 ? as_type<int>(_847) : as_type<int>(_807);
    float _851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _839);
    bool _853 = _755 > 0.5;
    float _855 = _803 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _845 * _743;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _863 = _535 * _851;
    float _865 = _811 * _795;
    float _867 = fma(_859, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _869 = _801 * _861;
    float _871 = _811 * _771;
    float _873 = _803 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _835 * _771;
    float _879 = _835 * _795;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _887 = _857 * _863;
    float _889 = _795 * _857;
    float _891 = _835 * _887;
    float _893 = -_877;
    float _895 = fma(_875, _865, _893);
    float _897 = -_865;
    float _899 = fma(_875, _877, _897);
    float _901 = _771 * _857;
    float _903 = fma(_875, _879, _871);
    float _905 = _875 * _863;
    float _907 = fma(_875, _871, _879);
    float _909 = _811 * _887;
    float _911 = fma(_903, _869, _891);
    float _913 = -_905;
    float _915 = fma(_889, _869, _913);
    float _917 = fma(_895, _869, _909);
    float _919 = fma(_899, _881, _911);
    float _921 = fma(_901, _881, _915);
    float _923 = fma(_907, _881, _917);
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _929 = _919 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _931 = in.m_26.x;
    float _933 = in.m_26.y;
    float _935 = in.m_26.z;
    float _937 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _925);
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _927);
    float _941 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _929);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _937);
    bool _949 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _951 = isnan(_511);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _939);
    float _963 = 1.0 / _945;
    float _965 = _947 * _947;
    bool _967 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _969 = isnan(_511);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
    bool _981 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _983 = isnan(_511);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_961, _961, _965);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_979, _979, _993);
    float _1001 = -_991;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _997;
    float _1007 = -_977;
    float _1009 = _1007 + 1.0;
    float _1011 = _959 * _1003;
    float _1013 = _933 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _867 * _1005;
    float _1017 = _933 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1019 = sqrt(_999);
    float _1021 = _933 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1023 = _885 * _963;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1027 = _511 + _1025;
    float _1029 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1031 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1017);
    float _1033 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1021);
    float _1035 = -_807;
    int _1037 = _841 ? as_type<int>(_1035) : as_type<int>(_807);
    float _1039 = fma(_1023, _1027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1041 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1015);
    float _1043 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1029);
    float _1045 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1031);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1033);
    bool _1049 = !_815;
    float _1051 = _1049 ? _807 : as_type<float>(_849);
    float _1053 = fma(_1039, _1011, _1041);
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1057 = _1019 > 0.0;
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = _1045 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1063 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1065 = !_827;
    float _1067 = _1065 ? _807 : as_type<float>(_1037);
    float _1069 = _1059 + _961;
    float _1071 = -_839;
    int _1073 = _797 ? as_type<int>(_1071) : as_type<int>(_839);
    float _1075 = _1061 + _947;
    float _1077 = -_839;
    float _1079 = _853 ? _1077 : _839;
    float _1081 = _1063 + _979;
    bool _1083 = !_823;
    float _1085 = _1083 ? _839 : as_type<float>(_1073);
    bool _1087 = !_831;
    float _1089 = _1087 ? _839 : _1079;
    float _1091 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1053);
    float _1093 = _1061;
    float _1095 = _1053;
    float _1097 = _1079;
    if (!_1057)
    {
        _1093 = _1069;
    }
    float _1099 = _1093;
    float _1101 = _1099;
    float _1103 = _1099;
    if (!_1057)
    {
        _1095 = _1075;
    }
    float _1105 = _1095;
    float _1107 = _1105;
    if (!_1057)
    {
        _1097 = _1081;
    }
    float _1109 = _1097;
    bool _1111 = !_1057;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = _181 * _181;
        float _1117 = fma(_229, _229, _1115);
        float _1119 = fma(_231, _231, _1117);
        float _1121 = rsqrt(_999);
        float _1123 = sqrt(_1119);
        float _1125 = _961 * _1121;
        float _1127 = _947 * _1121;
        float _1129 = _979 * _1121;
        bool _1131 = _1123 > 0.0;
        float _1133 = _1123;
        float _1135 = _1121;
        if (!_1131)
        {
            _1101 = _1069;
        }
        float _1137 = _1101;
        _1103 = _1137;
        if (!_1131)
        {
            _1133 = _1075;
        }
        float _1139 = _1133;
        _1107 = _1139;
        if (!_1131)
        {
            _1135 = _1081;
        }
        float _1141 = _1135;
        bool _1143 = !_1131;
        _1113 = _1141;
        if (!_1143)
        {
            float _1145 = rsqrt(_1119);
            float _1147 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1149 = _181 * _1145;
            float _1151 = _229 * _1145;
            float _1153 = _1127 * _1149;
            float _1155 = _231 * _1145;
            float _1157 = fma(_1125, _1151, _1153);
            float _1159 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1161 = fma(_1129, _1155, _1157);
            float _1163 = _1161 * _1159;
            float _1165 = fma(_229, _1163, _1069);
            float _1167 = fma(_181, _1163, _1075);
            float _1169 = fma(_231, _1163, _1081);
            _1107 = _1167;
            _1103 = _1165;
            _1113 = _1169;
        }
    }
    float _1171 = _1107;
    float _1173 = _1103;
    float _1175 = _1113;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1179);
    float _1189 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    float _1191 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1183);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1195 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1197 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1199 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1205 = _1051 + 0.5;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1215);
    float _1227 = _1067 + 0.5;
    float _1229 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1233 = -_1089;
    float _1235 = _1233 + 0.5;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1239 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1217);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1243 = _1231 * _1055;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1247 = -_1085;
    float _1249 = _1247 + 0.5;
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1219);
    float _1253 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1221);
    float _1255 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1257 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = _235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1261 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1251);
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1275 = _1261 * _1207;
    float _1277 = _1237 * _1223;
    float _1279 = _1245 * _1241;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1255);
    out.m_29.x = _1259;
    out.m_46.x = _1243;
    out.m_46.y = _1275;
    out.m_46.z = _1277;
    out.m_46.w = _1279;
    out.m_48.x = _1281;
    out.m_48.y = _1283;
    out.m_48.z = _1285;
    out.m_48.w = _1287;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1289;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _355 = false;
    bool _255 = false;
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
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_83);
        out.gl_Position.z = _1346;
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
        float _1416 = as_type<float>(_121);
        out.gl_Position.z = _1416;
    }
    if (_113)
    {
        return out;
    }
    float _123 = in.m_33.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _101 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _127 * _125;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    int _143 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _145 = _143 != 0;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _139 * 0.15915493667125701904296875;
    float _151 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _165 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _151);
    float _167 = _149 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_155;
    int _173 = _171 ? 0 : 1;
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    bool _177 = !_145;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    bool _183 = !_159;
    int _185 = _183 ? 0 : 1;
    float _187 = -_141;
    float _189 = _137 + _187;
    int _191 = abs(_173);
    int _193 = abs(_179);
    int _195 = abs(_185);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_191);
    float _203 = fma(_169, 0.5, 0.5);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = abs(_199);
    float _209 = _201 * _207;
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_193);
    float _221 = -_213;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_195);
    float _227 = fma(_219, _217, _209);
    float _229 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _231 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _227);
    bool _237 = !_205;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_67);
        float _259 = 1.0 / _257;
        float _261 = _101 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = _299 * _287;
    float _311 = -_299;
    float _313 = _311 + 1.0;
    float _315 = _267 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_303, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _321 * _309;
    float _327 = _323 * _309;
    float _329 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].x, _329);
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].y, _331);
    bool _337 = !_305;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_67);
        float _359 = 1.0 / _357;
        float _361 = _101 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _461 = fma(_457, _455, _453);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _461);
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = in.m_37.x;
    float _477 = in.m_37.y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _471;
    out.m_39.y = _467;
    out.m_39.z = _473;
    out.m_39.w = _479;
    float _481 = _335 * _477;
    float _483 = _333 * _475;
    bool _485 = !_423;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_67);
        float _507 = 1.0 / _505;
        float _509 = _101 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = in.m_33.z;
    float _515 = _123 * 2.0;
    float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _519 = log2(_517);
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = in.m_33.y;
    float _535 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = floor(_515);
    bool _539 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(1.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _519 * _101;
    float _551 = exp2(_549);
    float _553 = _513 * 2.0;
    bool _555 = _537 > 0.0;
    float _557 = _533 * 2.0;
    float _559 = _123 + _533;
    float _561 = floor(_553);
    float _563 = _533 + _513;
    bool _565 = _537 >= 0.0;
    bool _567 = isnan(_537);
    bool _569 = _565 || _567;
    bool _571 = isnan(0.0);
    bool _573 = _569 || _571;
    float _575 = _559 + (-1.0);
    float _577 = _563 + (-1.0);
    int _579 = _573 ? 0 : 1;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = floor(_557);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _587 = 1.0 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _591 = ~_579;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    float _597 = -_551;
    float _599 = _597 + 1.0;
    int _601 = _595;
    if (!_555)
    {
        int _603 = ~_579;
        int _605 = _603 + 1;
        _601 = _605;
    }
    int _607 = _601;
    bool _609 = !_523;
    int _611 = _609 ? 0 : 1;
    float _613 = 1.0 / _587;
    bool _615 = !_527;
    int _617 = _615 ? 0 : 1;
    bool _619 = _561 > 0.0;
    bool _621 = _561 >= 0.0;
    bool _623 = isnan(_561);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = in.m_41.x;
    float _633 = in.m_41.y;
    float _635 = in.m_41.z;
    int _637 = abs(_617);
    bool _639 = _583 > 0.0;
    bool _641 = _583 >= 0.0;
    bool _643 = isnan(_583);
    bool _645 = _641 || _643;
    bool _647 = isnan(0.0);
    bool _649 = _645 || _647;
    bool _651 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = float(_637);
    float _663 = float(_607);
    float _665 = _659 ? _599 : 0.0;
    int _667 = _629 ? 0 : 1;
    float _669 = _661 * _663;
    int _671 = abs(_611);
    if (_547)
    {
        float _673 = _665 * _613;
        _103 = _673;
    }
    float _675 = _103;
    int _677 = ~_667;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _669 * (-2.0);
    int _685 = _649 ? 0 : 1;
    float _687 = _533 + (-0.5);
    float _689 = fma(_683, _633, _633);
    int _691 = _681;
    if (!_619)
    {
        int _693 = ~_667;
        int _695 = _693 + 1;
        _691 = _695;
    }
    int _697 = _691;
    float _699 = fma(_589, _683, _589);
    int _701 = ~_685;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _709 = float(_671);
    float _711 = float(_697);
    float _713 = fma(_699, _675, _707);
    int _715 = _705;
    if (!_639)
    {
        int _717 = ~_685;
        int _719 = _717 + 1;
        _715 = _719;
    }
    int _721 = _715;
    float _723 = _709 * _711;
    bool _725 = !_531;
    int _727 = _725 ? 0 : 1;
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = float(_721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _737 = abs(_727);
    float _739 = _723 * (-2.0);
    float _741 = as_type<float>(int(gl_VertexIndex));
    float _743 = 1.0 / _735;
    bool _745 = _123 > 0.5;
    float _747 = fma(_581, _739, _581);
    float _749 = float(_737);
    float _751 = fma(_739, _631, _631);
    float _753 = _123 + (-0.5);
    float _755 = in.m_33.w;
    float _757 = _749 * _731;
    float _759 = _123 + _513;
    float _761 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _763 = _757 * (-2.0);
    float _765 = _759 + (-1.0);
    float _767 = fma(_747, _675, _761);
    float _769 = _729 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_763, _635, _635);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _777 = _513 + (-0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_775, _763, _775);
    float _783 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    int _785 = as_type<int>(_741) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_741) & 2;
    bool _791 = _789 != 0;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = cos(_793);
    bool _797 = _533 > 0.5;
    float _799 = fma(_781, _675, _783);
    float _801 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * 0.15915493667125701904296875;
    bool _805 = !_787;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _779 * 6.283185482025146484375;
    float _811 = sin(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _511 + _817;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _831 = _829 != 0;
    float _833 = _779 * 6.283185482025146484375;
    float _835 = cos(_833);
    bool _837 = !_791;
    float _839 = _837 ? (-0.5) : 0.5;
    bool _841 = _513 > 0.5;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _843;
    float _847 = -_807;
    int _849 = _745 ? as_type<int>(_847) : as_type<int>(_807);
    float _851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _839);
    bool _853 = _755 > 0.5;
    float _855 = _803 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _845 * _743;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _863 = _535 * _851;
    float _865 = _811 * _795;
    float _867 = fma(_859, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _869 = _801 * _861;
    float _871 = _811 * _771;
    float _873 = _803 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _835 * _771;
    float _879 = _835 * _795;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _887 = _857 * _863;
    float _889 = _795 * _857;
    float _891 = _835 * _887;
    float _893 = -_877;
    float _895 = fma(_875, _865, _893);
    float _897 = -_865;
    float _899 = fma(_875, _877, _897);
    float _901 = _771 * _857;
    float _903 = fma(_875, _879, _871);
    float _905 = _875 * _863;
    float _907 = fma(_875, _871, _879);
    float _909 = _811 * _887;
    float _911 = fma(_903, _869, _891);
    float _913 = -_905;
    float _915 = fma(_889, _869, _913);
    float _917 = fma(_895, _869, _909);
    float _919 = fma(_899, _881, _911);
    float _921 = fma(_901, _881, _915);
    float _923 = fma(_907, _881, _917);
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _929 = _919 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _931 = in.m_26.x;
    float _933 = in.m_26.y;
    float _935 = in.m_26.z;
    float _937 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _925);
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _927);
    float _941 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _929);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _937);
    bool _949 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _951 = isnan(_511);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _939);
    float _963 = 1.0 / _945;
    float _965 = _947 * _947;
    bool _967 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _969 = isnan(_511);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
    bool _981 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _983 = isnan(_511);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_961, _961, _965);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_979, _979, _993);
    float _1001 = -_991;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _997;
    float _1007 = -_977;
    float _1009 = _1007 + 1.0;
    float _1011 = _959 * _1003;
    float _1013 = _933 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _867 * _1005;
    float _1017 = _933 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1019 = sqrt(_999);
    float _1021 = _933 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1023 = _885 * _963;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1027 = _511 + _1025;
    float _1029 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1031 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1017);
    float _1033 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1021);
    float _1035 = -_807;
    int _1037 = _841 ? as_type<int>(_1035) : as_type<int>(_807);
    float _1039 = fma(_1023, _1027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1041 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1015);
    float _1043 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1029);
    float _1045 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1031);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1033);
    bool _1049 = !_815;
    float _1051 = _1049 ? _807 : as_type<float>(_849);
    float _1053 = fma(_1039, _1011, _1041);
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1057 = _1019 > 0.0;
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = _1045 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1063 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1065 = !_827;
    float _1067 = _1065 ? _807 : as_type<float>(_1037);
    float _1069 = _1059 + _961;
    float _1071 = -_839;
    int _1073 = _797 ? as_type<int>(_1071) : as_type<int>(_839);
    float _1075 = _1061 + _947;
    float _1077 = -_839;
    float _1079 = _853 ? _1077 : _839;
    float _1081 = _1063 + _979;
    bool _1083 = !_823;
    float _1085 = _1083 ? _839 : as_type<float>(_1073);
    bool _1087 = !_831;
    float _1089 = _1087 ? _839 : _1079;
    float _1091 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1053);
    float _1093 = _1061;
    float _1095 = _1053;
    float _1097 = _1079;
    if (!_1057)
    {
        _1093 = _1069;
    }
    float _1099 = _1093;
    float _1101 = _1099;
    float _1103 = _1099;
    if (!_1057)
    {
        _1095 = _1075;
    }
    float _1105 = _1095;
    float _1107 = _1105;
    if (!_1057)
    {
        _1097 = _1081;
    }
    float _1109 = _1097;
    bool _1111 = !_1057;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = _181 * _181;
        float _1117 = fma(_229, _229, _1115);
        float _1119 = fma(_231, _231, _1117);
        float _1121 = rsqrt(_999);
        float _1123 = sqrt(_1119);
        float _1125 = _961 * _1121;
        float _1127 = _947 * _1121;
        float _1129 = _979 * _1121;
        bool _1131 = _1123 > 0.0;
        float _1133 = _1123;
        float _1135 = _1121;
        if (!_1131)
        {
            _1101 = _1069;
        }
        float _1137 = _1101;
        _1103 = _1137;
        if (!_1131)
        {
            _1133 = _1075;
        }
        float _1139 = _1133;
        _1107 = _1139;
        if (!_1131)
        {
            _1135 = _1081;
        }
        float _1141 = _1135;
        bool _1143 = !_1131;
        _1113 = _1141;
        if (!_1143)
        {
            float _1145 = rsqrt(_1119);
            float _1147 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1149 = _181 * _1145;
            float _1151 = _229 * _1145;
            float _1153 = _1127 * _1149;
            float _1155 = _231 * _1145;
            float _1157 = fma(_1125, _1151, _1153);
            float _1159 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1161 = fma(_1129, _1155, _1157);
            float _1163 = _1161 * _1159;
            float _1165 = fma(_229, _1163, _1069);
            float _1167 = fma(_181, _1163, _1075);
            float _1169 = fma(_231, _1163, _1081);
            _1107 = _1167;
            _1103 = _1165;
            _1113 = _1169;
        }
    }
    float _1171 = _1107;
    float _1173 = _1103;
    float _1175 = _1113;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1179);
    float _1189 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    float _1191 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1183);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1195 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1197 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1199 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1205 = _1051 + 0.5;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1215);
    float _1227 = _1067 + 0.5;
    float _1229 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1233 = -_1089;
    float _1235 = _1233 + 0.5;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1239 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1217);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1243 = _1231 * _1055;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1247 = -_1085;
    float _1249 = _1247 + 0.5;
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1219);
    float _1253 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1221);
    float _1255 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1257 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = _235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1261 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1251);
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1275 = _1261 * _1207;
    float _1277 = _1237 * _1223;
    float _1279 = _1245 * _1241;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1255);
    out.m_29.x = _1259;
    out.m_46.x = _1243;
    out.m_46.y = _1275;
    out.m_46.z = _1277;
    out.m_46.w = _1279;
    out.m_48.x = _1281;
    out.m_48.y = _1283;
    out.m_48.z = _1285;
    out.m_48.w = _1287;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1289;
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
    out.m_39 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _503 = false;
    bool _355 = false;
    bool _255 = false;
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
    int _85 = _83;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1346 = as_type<float>(_83);
        out.gl_Position.z = _1346;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1416 = as_type<float>(_121);
        out.gl_Position.z = _1416;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_33.x;
    float _125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _127 = _101 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _129 = in.m_35.x;
    float _131 = in.m_35.y;
    float _133 = in.m_35.z;
    float _135 = _127 * _125;
    float _137 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[20].x, _135);
    float _139 = _137 * 6.283185482025146484375;
    float _141 = floor(_137);
    int _143 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _145 = _143 != 0;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _149 = _139 * 0.15915493667125701904296875;
    float _151 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _155 = _153 != 0;
    int _157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _159 = _157 != 0;
    float _161 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _163 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _147);
    float _165 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _151);
    float _167 = _149 * 6.283185482025146484375;
    float _169 = cos(_167);
    bool _171 = !_155;
    int _173 = _171 ? 0 : 1;
    float _175 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _161);
    bool _177 = !_145;
    int _179 = _177 ? 0 : 1;
    float _181 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _165);
    bool _183 = !_159;
    int _185 = _183 ? 0 : 1;
    float _187 = -_141;
    float _189 = _137 + _187;
    int _191 = abs(_173);
    int _193 = abs(_179);
    int _195 = abs(_185);
    float _197 = -_189;
    float _199 = fma(_197, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _201 = float(_191);
    float _203 = fma(_169, 0.5, 0.5);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = abs(_199);
    float _209 = _201 * _207;
    bool _211 = _189 < 0.5;
    float _213 = float(_211);
    float _215 = -_203;
    float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _219 = float(_193);
    float _221 = -_213;
    float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _225 = float(_195);
    float _227 = fma(_219, _217, _209);
    float _229 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _163);
    float _231 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _175);
    float _233 = abs(_223);
    float _235 = fma(_225, _233, _227);
    bool _237 = !_205;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _101);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_67);
        float _259 = 1.0 / _257;
        float _261 = _101 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    bool _269 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _271 = isnan(_263);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -_279;
    float _287 = _285 + 1.0;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _283;
    float _309 = _299 * _287;
    float _311 = -_299;
    float _313 = _311 + 1.0;
    float _315 = _267 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _317;
    float _321 = fma(_303, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = fma(_319, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _325 = _321 * _309;
    float _327 = _323 * _309;
    float _329 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _331 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[143].y, _327);
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].x, _329);
    float _335 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[144].y, _331);
    bool _337 = !_305;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _341 = _123 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[11].y, _101);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_67);
        float _359 = 1.0 / _357;
        float _361 = _101 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _373 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _375 = isnan(_363);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _389 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _391 = isnan(_363);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _371;
    float _419 = -_383;
    float _421 = _419 + 1.0;
    bool _423 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _425 = _399 * _421;
    float _427 = -_399;
    float _429 = _427 + 1.0;
    float _431 = 1.0 / _387;
    float _433 = _403 * _417;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _439 = fma(_433, _367, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _441 = _437 * _431;
    float _443 = _439 * _425;
    float _445 = -_415;
    float _447 = _445 + 1.0;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _451 = _363 + _449;
    float _453 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _443);
    float _455 = _383 * _447;
    float _457 = fma(_441, _451, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _461 = fma(_457, _455, _453);
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _467 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[117].x, _461);
    float _471 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _473 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = in.m_37.x;
    float _477 = in.m_37.y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_39.x = _471;
    out.m_39.y = _467;
    out.m_39.z = _473;
    out.m_39.w = _479;
    float _481 = _335 * _477;
    float _483 = _333 * _475;
    bool _485 = !_423;
    float _501;
    if (!_485)
    {
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _489 = _123 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].w, _101);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_67);
        float _507 = 1.0 / _505;
        float _509 = _101 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = in.m_33.z;
    float _515 = _123 * 2.0;
    float _517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _519 = log2(_517);
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _523 = _521 != 0;
    int _525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _527 = _525 != 0;
    int _529 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _531 = _529 != 0;
    float _533 = in.m_33.y;
    float _535 = _481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _537 = floor(_515);
    bool _539 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _541 = isnan(1.0);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _547 = _543 || _545;
    float _549 = _519 * _101;
    float _551 = exp2(_549);
    float _553 = _513 * 2.0;
    bool _555 = _537 > 0.0;
    float _557 = _533 * 2.0;
    float _559 = _123 + _533;
    float _561 = floor(_553);
    float _563 = _533 + _513;
    bool _565 = _537 >= 0.0;
    bool _567 = isnan(_537);
    bool _569 = _565 || _567;
    bool _571 = isnan(0.0);
    bool _573 = _569 || _571;
    float _575 = _559 + (-1.0);
    float _577 = _563 + (-1.0);
    int _579 = _573 ? 0 : 1;
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = floor(_557);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _587 = 1.0 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _591 = ~_579;
    int _593 = _591 + 1;
    int _595 = _593 + 1;
    float _597 = -_551;
    float _599 = _597 + 1.0;
    int _601 = _595;
    if (!_555)
    {
        int _603 = ~_579;
        int _605 = _603 + 1;
        _601 = _605;
    }
    int _607 = _601;
    bool _609 = !_523;
    int _611 = _609 ? 0 : 1;
    float _613 = 1.0 / _587;
    bool _615 = !_527;
    int _617 = _615 ? 0 : 1;
    bool _619 = _561 > 0.0;
    bool _621 = _561 >= 0.0;
    bool _623 = isnan(_561);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = in.m_41.x;
    float _633 = in.m_41.y;
    float _635 = in.m_41.z;
    int _637 = abs(_617);
    bool _639 = _583 > 0.0;
    bool _641 = _583 >= 0.0;
    bool _643 = isnan(_583);
    bool _645 = _641 || _643;
    bool _647 = isnan(0.0);
    bool _649 = _645 || _647;
    bool _651 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _653 = isnan(0.0);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _659 = _655 || _657;
    float _661 = float(_637);
    float _663 = float(_607);
    float _665 = _659 ? _599 : 0.0;
    int _667 = _629 ? 0 : 1;
    float _669 = _661 * _663;
    int _671 = abs(_611);
    if (_547)
    {
        float _673 = _665 * _613;
        _103 = _673;
    }
    float _675 = _103;
    int _677 = ~_667;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = _669 * (-2.0);
    int _685 = _649 ? 0 : 1;
    float _687 = _533 + (-0.5);
    float _689 = fma(_683, _633, _633);
    int _691 = _681;
    if (!_619)
    {
        int _693 = ~_667;
        int _695 = _693 + 1;
        _691 = _695;
    }
    int _697 = _691;
    float _699 = fma(_589, _683, _589);
    int _701 = ~_685;
    int _703 = _701 + 1;
    int _705 = _703 + 1;
    float _707 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[196].y, _689);
    float _709 = float(_671);
    float _711 = float(_697);
    float _713 = fma(_699, _675, _707);
    int _715 = _705;
    if (!_639)
    {
        int _717 = ~_685;
        int _719 = _717 + 1;
        _715 = _719;
    }
    int _721 = _715;
    float _723 = _709 * _711;
    bool _725 = !_531;
    int _727 = _725 ? 0 : 1;
    float _729 = _713 * 0.15915493667125701904296875;
    float _731 = float(_721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _737 = abs(_727);
    float _739 = _723 * (-2.0);
    float _741 = as_type<float>(int(gl_VertexIndex));
    float _743 = 1.0 / _735;
    bool _745 = _123 > 0.5;
    float _747 = fma(_581, _739, _581);
    float _749 = float(_737);
    float _751 = fma(_739, _631, _631);
    float _753 = _123 + (-0.5);
    float _755 = in.m_33.w;
    float _757 = _749 * _731;
    float _759 = _123 + _513;
    float _761 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].x, _751);
    float _763 = _757 * (-2.0);
    float _765 = _759 + (-1.0);
    float _767 = fma(_747, _675, _761);
    float _769 = _729 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_763, _635, _635);
    float _775 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _777 = _513 + (-0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_775, _763, _775);
    float _783 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[196].z, _773);
    int _785 = as_type<int>(_741) & 1;
    bool _787 = _785 != 0;
    int _789 = as_type<int>(_741) & 2;
    bool _791 = _789 != 0;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = cos(_793);
    bool _797 = _533 > 0.5;
    float _799 = fma(_781, _675, _783);
    float _801 = _483 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _803 = _799 * 0.15915493667125701904296875;
    bool _805 = !_787;
    float _807 = _805 ? (-0.5) : 0.5;
    float _809 = _779 * 6.283185482025146484375;
    float _811 = sin(_809);
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _815 = _813 != 0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _819 = _511 + _817;
    int _821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _823 = _821 != 0;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _831 = _829 != 0;
    float _833 = _779 * 6.283185482025146484375;
    float _835 = cos(_833);
    bool _837 = !_791;
    float _839 = _837 ? (-0.5) : 0.5;
    bool _841 = _513 > 0.5;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _843;
    float _847 = -_807;
    int _849 = _745 ? as_type<int>(_847) : as_type<int>(_807);
    float _851 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _839);
    bool _853 = _755 > 0.5;
    float _855 = _803 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _845 * _743;
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _807);
    float _863 = _535 * _851;
    float _865 = _811 * _795;
    float _867 = fma(_859, _819, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _869 = _801 * _861;
    float _871 = _811 * _771;
    float _873 = _803 * 6.283185482025146484375;
    float _875 = sin(_873);
    float _877 = _835 * _771;
    float _879 = _835 * _795;
    float _881 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _887 = _857 * _863;
    float _889 = _795 * _857;
    float _891 = _835 * _887;
    float _893 = -_877;
    float _895 = fma(_875, _865, _893);
    float _897 = -_865;
    float _899 = fma(_875, _877, _897);
    float _901 = _771 * _857;
    float _903 = fma(_875, _879, _871);
    float _905 = _875 * _863;
    float _907 = fma(_875, _871, _879);
    float _909 = _811 * _887;
    float _911 = fma(_903, _869, _891);
    float _913 = -_905;
    float _915 = fma(_889, _869, _913);
    float _917 = fma(_895, _869, _909);
    float _919 = fma(_899, _881, _911);
    float _921 = fma(_901, _881, _915);
    float _923 = fma(_907, _881, _917);
    float _925 = _919 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _927 = _919 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _929 = _919 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _931 = in.m_26.x;
    float _933 = in.m_26.y;
    float _935 = in.m_26.z;
    float _937 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[9].x, _925);
    float _939 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[8].x, _927);
    float _941 = fma(_921, (*spvDescriptorSet0.vp_c10)._m0[10].x, _929);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _947 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[9].z, _937);
    bool _949 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _951 = isnan(_511);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[8].z, _939);
    float _963 = 1.0 / _945;
    float _965 = _947 * _947;
    bool _967 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _969 = isnan(_511);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    float _979 = fma(_923, (*spvDescriptorSet0.vp_c10)._m0[10].z, _941);
    bool _981 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _983 = isnan(_511);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = fma(_961, _961, _965);
    float _995 = -_959;
    float _997 = _995 + 1.0;
    float _999 = fma(_979, _979, _993);
    float _1001 = -_991;
    float _1003 = _1001 + 1.0;
    float _1005 = _977 * _997;
    float _1007 = -_977;
    float _1009 = _1007 + 1.0;
    float _1011 = _959 * _1003;
    float _1013 = _933 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1015 = _867 * _1005;
    float _1017 = _933 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1019 = sqrt(_999);
    float _1021 = _933 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1023 = _885 * _963;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1027 = _511 + _1025;
    float _1029 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1013);
    float _1031 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1017);
    float _1033 = fma(_931, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1021);
    float _1035 = -_807;
    int _1037 = _841 ? as_type<int>(_1035) : as_type<int>(_807);
    float _1039 = fma(_1023, _1027, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1041 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1015);
    float _1043 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1029);
    float _1045 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1031);
    float _1047 = fma(_935, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1033);
    bool _1049 = !_815;
    float _1051 = _1049 ? _807 : as_type<float>(_849);
    float _1053 = fma(_1039, _1011, _1041);
    float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1057 = _1019 > 0.0;
    float _1059 = _1043 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1061 = _1045 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1063 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1065 = !_827;
    float _1067 = _1065 ? _807 : as_type<float>(_1037);
    float _1069 = _1059 + _961;
    float _1071 = -_839;
    int _1073 = _797 ? as_type<int>(_1071) : as_type<int>(_839);
    float _1075 = _1061 + _947;
    float _1077 = -_839;
    float _1079 = _853 ? _1077 : _839;
    float _1081 = _1063 + _979;
    bool _1083 = !_823;
    float _1085 = _1083 ? _839 : as_type<float>(_1073);
    bool _1087 = !_831;
    float _1089 = _1087 ? _839 : _1079;
    float _1091 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1053);
    float _1093 = _1061;
    float _1095 = _1053;
    float _1097 = _1079;
    if (!_1057)
    {
        _1093 = _1069;
    }
    float _1099 = _1093;
    float _1101 = _1099;
    float _1103 = _1099;
    if (!_1057)
    {
        _1095 = _1075;
    }
    float _1105 = _1095;
    float _1107 = _1105;
    if (!_1057)
    {
        _1097 = _1081;
    }
    float _1109 = _1097;
    bool _1111 = !_1057;
    float _1113 = _1109;
    if (!_1111)
    {
        float _1115 = _181 * _181;
        float _1117 = fma(_229, _229, _1115);
        float _1119 = fma(_231, _231, _1117);
        float _1121 = rsqrt(_999);
        float _1123 = sqrt(_1119);
        float _1125 = _961 * _1121;
        float _1127 = _947 * _1121;
        float _1129 = _979 * _1121;
        bool _1131 = _1123 > 0.0;
        float _1133 = _1123;
        float _1135 = _1121;
        if (!_1131)
        {
            _1101 = _1069;
        }
        float _1137 = _1101;
        _1103 = _1137;
        if (!_1131)
        {
            _1133 = _1075;
        }
        float _1139 = _1133;
        _1107 = _1139;
        if (!_1131)
        {
            _1135 = _1081;
        }
        float _1141 = _1135;
        bool _1143 = !_1131;
        _1113 = _1141;
        if (!_1143)
        {
            float _1145 = rsqrt(_1119);
            float _1147 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1149 = _181 * _1145;
            float _1151 = _229 * _1145;
            float _1153 = _1127 * _1149;
            float _1155 = _231 * _1145;
            float _1157 = fma(_1125, _1151, _1153);
            float _1159 = _1147 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1161 = fma(_1129, _1155, _1157);
            float _1163 = _1161 * _1159;
            float _1165 = fma(_229, _1163, _1069);
            float _1167 = fma(_181, _1163, _1075);
            float _1169 = fma(_231, _1163, _1081);
            _1107 = _1167;
            _1103 = _1165;
            _1113 = _1169;
        }
    }
    float _1171 = _1107;
    float _1173 = _1103;
    float _1175 = _1113;
    float _1177 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1181 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1183 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1185 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1177);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1179);
    float _1189 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1181);
    float _1191 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1183);
    float _1193 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1185);
    float _1195 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1187);
    float _1197 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1189);
    float _1199 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1191);
    float _1201 = _1193 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1203 = _1195 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1205 = _1051 + 0.5;
    float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1211 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1213 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1215 = _1201 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1217 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1209);
    float _1219 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1211);
    float _1221 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1213);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1225 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1215);
    float _1227 = _1067 + 0.5;
    float _1229 = _1197 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1231 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1233 = -_1089;
    float _1235 = _1233 + 0.5;
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1239 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1217);
    float _1241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1243 = _1231 * _1055;
    float _1245 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1247 = -_1085;
    float _1249 = _1247 + 0.5;
    float _1251 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1219);
    float _1253 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1221);
    float _1255 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1225);
    float _1257 = _1199 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1259 = _235 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1261 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1269 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1239);
    float _1271 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1251);
    float _1273 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1253);
    float _1275 = _1261 * _1207;
    float _1277 = _1237 * _1223;
    float _1279 = _1245 * _1241;
    float _1281 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1289 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1255);
    out.m_29.x = _1259;
    out.m_46.x = _1243;
    out.m_46.y = _1275;
    out.m_46.z = _1277;
    out.m_46.w = _1279;
    out.m_48.x = _1281;
    out.m_48.y = _1283;
    out.m_48.z = _1285;
    out.m_48.w = _1287;
    out.gl_Position.x = _1269;
    out.gl_Position.y = _1271;
    out.gl_Position.z = _1273;
    out.gl_Position.w = _1289;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_39.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_39.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_39.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_39.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

