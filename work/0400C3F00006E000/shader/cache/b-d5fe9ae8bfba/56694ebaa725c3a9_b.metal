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
    float4 m_52 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_37 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _255 = false;
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
        float _962 = as_type<float>(_91);
        out.gl_Position.z = _962;
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
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1030 = as_type<float>(_127);
        out.gl_Position.z = _1030;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = _149 * 0.15915493667125701904296875;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    bool _167 = !_143;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    bool _195 = !_165;
    int _197 = _195 ? 0 : 1;
    float _199 = -_189;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _203 = float(_191);
    float _205 = fma(_173, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_197);
    float _211 = abs(_201);
    float _213 = _203 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_205;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _109 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _275;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = in.m_44.x;
    float _323 = in.m_44.y;
    float _325 = in.m_44.z;
    float _327 = in.m_44.w;
    bool _329 = _129 > 0.5;
    float _331 = 1.0 / _279;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _341 = _337 || _339;
    bool _343 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _345 = isnan(0.5);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _351 = _347 || _349;
    float _353 = _267 * _301;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    float _359 = 1.0 / _283;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _271 * _331;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _263 + _387;
    bool _391 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_263);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_299;
    float _405 = _403 + 1.0;
    float _407 = fma(_367, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = _317 * _323;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = _381 * _405;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = _389 * _359;
    float _423 = _313 * _413;
    float _425 = -_313;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = _401 * _419;
    float _435 = _383 * _423;
    float _437 = in.m_46.x;
    float _439 = in.m_46.y;
    float _441 = in.m_46.z;
    float _443 = in.m_46.w;
    float _445 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _369 * _423;
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = in.m_48.x;
    float _453 = in.m_48.y;
    float _455 = in.m_48.z;
    float _457 = in.m_48.w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _469 = fma(_445, _433, _449);
    float _471 = fma(_461, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = fma(_465, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_407, _433, _467);
    float _477 = fma(_315, _321, _409);
    float _479 = fma(_471, _415, _469);
    float _481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _483 = fma(_473, _415, _475);
    float _485 = fma(_319, _325, _477);
    float _487 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _479);
    float _489 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _493 = _485 + _327;
    float _495 = _487 * _287;
    float _497 = _491 * _285;
    float _499 = _317 * _439;
    float _501 = _235 * _495;
    float _503 = in.m_37.y;
    float _505 = _235 * _497;
    float _507 = _317 * _453;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _511 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = fma(_315, _451, _507);
    float _517 = fma(_315, _437, _499);
    float _519 = _511 * _509;
    float _521 = _513 * _489;
    float _523 = fma(_319, _455, _515);
    float _525 = fma(_319, _441, _517);
    float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _531 = _523 + _457;
    float _533 = _525 + _443;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _529);
    float _539 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _541 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _543 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].z, _537);
    float _545 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _549 = _543 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _553 = _531 + _547;
    float _555 = _493 + _549;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _563 = _553 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _567 = _555 + _565;
    float _569 = _533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _571 = _563 * _563;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _569);
    float _577 = _533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _579 = fma(_567, _567, _571);
    float _581 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[11].z, _575);
    float _583 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _577);
    float _585 = sqrt(_579);
    float _587 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _593 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].z, _545);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[10].z, _583);
    float _599 = 1.0 / _589;
    out.m_50.x = _587;
    out.m_50.y = _591;
    out.m_50.z = _593;
    out.m_50.w = _573;
    bool _601 = _503 > 0.5;
    float _603 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    float _613 = _603 + _589;
    bool _615 = _585 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _617 = -_169;
    float _619 = _329 ? _617 : _169;
    bool _621 = !_607;
    float _623 = _621 ? _169 : _619;
    float _625 = _595 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = -_155;
    float _629 = _601 ? _627 : _155;
    float _631 = _613 * _599;
    float _633 = _631 * 0.5;
    float _635 = _533 + _625;
    bool _637 = !_611;
    float _639 = _637 ? _155 : _629;
    float _641 = _591;
    float _643 = _629;
    float _645 = _619;
    if (!_615)
    {
        _641 = _555;
    }
    float _647 = _641;
    float _649 = _647;
    if (!_615)
    {
        _643 = _553;
    }
    float _651 = _643;
    float _653 = _651;
    if (!_615)
    {
        _645 = _635;
    }
    float _655 = _645;
    bool _657 = !_615;
    float _659 = _655;
    if (!_657)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _665 = _585 + _663;
        float _667 = rsqrt(_579);
        float _669 = _665 * _661;
        float _671 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _673 = _669 * 0.15915493667125701904296875;
        float _675 = _673 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = _673 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _677 + (-1.0);
        float _685 = fma(_681, _671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = _667 * _685;
        float _691 = fma(_635, _677, _687);
        float _693 = fma(_567, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _695 = fma(_563, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _693;
        _659 = _691;
        _653 = _695;
    }
    float _697 = _649;
    float _699 = _659;
    float _701 = _653;
    float _703 = _699;
    float _705 = _697;
    float _707 = _701;
    if (!_341)
    {
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _711 = _533 + _709;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _715 = _493 + _713;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _719 = -_493;
        float _721 = _719 + _697;
        float _723 = _711 * _711;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _727 = _531 + _725;
        float _729 = -_533;
        float _731 = _729 + _699;
        float _733 = fma(_715, _715, _723);
        float _735 = fma(_727, _727, _733);
        float _737 = sqrt(_735);
        float _739 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _741 = _739 * _717;
        float _743 = -_531;
        float _745 = _743 + _701;
        float _747 = fma(_721, _741, _493);
        float _749 = fma(_731, _741, _533);
        float _751 = fma(_745, _741, _531);
        _703 = _749;
        _705 = _747;
        _707 = _751;
    }
    float _753 = _703;
    float _755 = _705;
    float _757 = _707;
    float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].x, _761);
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].x, _765);
    float _775 = _765;
    if (_351)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = _777;
    if (!_351)
    {
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _783 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _781);
        float _785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _789 = 1.0 / _783;
        float _791 = 1.0 / _787;
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _797 = fma(_789, _793, _795);
        float _799 = _797 * _791;
        float _801 = precise::clamp(_799, 0.0, 1.0);
        _779 = _801;
    }
    float _803 = _779;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].z, _769);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].z, _767);
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _815 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[2].z, _771);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _819 = _235 * _811;
    float _821 = _813 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[3].z, _773);
    float _827 = _623 + 0.5;
    float _829 = _813 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = _813 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _833 = _803 > 0.0;
    bool _835 = isnan(_803);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = -_639;
    float _845 = _843 + 0.5;
    float _847 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _851 = _813 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _855 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _851);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _853);
    float _867 = _855 * _807;
    float _869 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _857);
    float _873 = _859 * _823;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _863);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _865);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _875);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _879 + _883;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _901 = _819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _903 = _893 * 0.5;
    out.m_52.x = _895;
    out.m_52.y = _891;
    out.m_52.z = _897;
    out.m_52.w = _899;
    out.m_54.x = _867;
    out.m_54.y = _873;
    out.m_33.x = _901;
    out.gl_Position.x = _885;
    out.gl_Position.y = _877;
    out.gl_Position.z = _879;
    out.gl_Position.w = _883;
    out.m_56.z = _903;
    out.m_56.w = _883;
    if (_841)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _905;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _255 = false;
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
        float _962 = as_type<float>(_91);
        out.gl_Position.z = _962;
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
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1030 = as_type<float>(_127);
        out.gl_Position.z = _1030;
    }
    if (_121)
    {
        return out;
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = _149 * 0.15915493667125701904296875;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    bool _167 = !_143;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    bool _195 = !_165;
    int _197 = _195 ? 0 : 1;
    float _199 = -_189;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _203 = float(_191);
    float _205 = fma(_173, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_197);
    float _211 = abs(_201);
    float _213 = _203 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_205;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _109 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _275;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = in.m_44.x;
    float _323 = in.m_44.y;
    float _325 = in.m_44.z;
    float _327 = in.m_44.w;
    bool _329 = _129 > 0.5;
    float _331 = 1.0 / _279;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _341 = _337 || _339;
    bool _343 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _345 = isnan(0.5);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _351 = _347 || _349;
    float _353 = _267 * _301;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    float _359 = 1.0 / _283;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _271 * _331;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _263 + _387;
    bool _391 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_263);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_299;
    float _405 = _403 + 1.0;
    float _407 = fma(_367, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = _317 * _323;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = _381 * _405;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = _389 * _359;
    float _423 = _313 * _413;
    float _425 = -_313;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = _401 * _419;
    float _435 = _383 * _423;
    float _437 = in.m_46.x;
    float _439 = in.m_46.y;
    float _441 = in.m_46.z;
    float _443 = in.m_46.w;
    float _445 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _369 * _423;
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = in.m_48.x;
    float _453 = in.m_48.y;
    float _455 = in.m_48.z;
    float _457 = in.m_48.w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _469 = fma(_445, _433, _449);
    float _471 = fma(_461, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = fma(_465, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_407, _433, _467);
    float _477 = fma(_315, _321, _409);
    float _479 = fma(_471, _415, _469);
    float _481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _483 = fma(_473, _415, _475);
    float _485 = fma(_319, _325, _477);
    float _487 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _479);
    float _489 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _493 = _485 + _327;
    float _495 = _487 * _287;
    float _497 = _491 * _285;
    float _499 = _317 * _439;
    float _501 = _235 * _495;
    float _503 = in.m_37.y;
    float _505 = _235 * _497;
    float _507 = _317 * _453;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _511 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = fma(_315, _451, _507);
    float _517 = fma(_315, _437, _499);
    float _519 = _511 * _509;
    float _521 = _513 * _489;
    float _523 = fma(_319, _455, _515);
    float _525 = fma(_319, _441, _517);
    float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _531 = _523 + _457;
    float _533 = _525 + _443;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _529);
    float _539 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _541 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _543 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].z, _537);
    float _545 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _549 = _543 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _553 = _531 + _547;
    float _555 = _493 + _549;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _563 = _553 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _567 = _555 + _565;
    float _569 = _533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _571 = _563 * _563;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _569);
    float _577 = _533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _579 = fma(_567, _567, _571);
    float _581 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[11].z, _575);
    float _583 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _577);
    float _585 = sqrt(_579);
    float _587 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _593 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].z, _545);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[10].z, _583);
    float _599 = 1.0 / _589;
    out.m_50.x = _587;
    out.m_50.y = _591;
    out.m_50.z = _593;
    out.m_50.w = _573;
    bool _601 = _503 > 0.5;
    float _603 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    float _613 = _603 + _589;
    bool _615 = _585 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _617 = -_169;
    float _619 = _329 ? _617 : _169;
    bool _621 = !_607;
    float _623 = _621 ? _169 : _619;
    float _625 = _595 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = -_155;
    float _629 = _601 ? _627 : _155;
    float _631 = _613 * _599;
    float _633 = _631 * 0.5;
    float _635 = _533 + _625;
    bool _637 = !_611;
    float _639 = _637 ? _155 : _629;
    float _641 = _591;
    float _643 = _629;
    float _645 = _619;
    if (!_615)
    {
        _641 = _555;
    }
    float _647 = _641;
    float _649 = _647;
    if (!_615)
    {
        _643 = _553;
    }
    float _651 = _643;
    float _653 = _651;
    if (!_615)
    {
        _645 = _635;
    }
    float _655 = _645;
    bool _657 = !_615;
    float _659 = _655;
    if (!_657)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _665 = _585 + _663;
        float _667 = rsqrt(_579);
        float _669 = _665 * _661;
        float _671 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _673 = _669 * 0.15915493667125701904296875;
        float _675 = _673 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = _673 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _677 + (-1.0);
        float _685 = fma(_681, _671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = _667 * _685;
        float _691 = fma(_635, _677, _687);
        float _693 = fma(_567, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _695 = fma(_563, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _693;
        _659 = _691;
        _653 = _695;
    }
    float _697 = _649;
    float _699 = _659;
    float _701 = _653;
    float _703 = _699;
    float _705 = _697;
    float _707 = _701;
    if (!_341)
    {
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _711 = _533 + _709;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _715 = _493 + _713;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _719 = -_493;
        float _721 = _719 + _697;
        float _723 = _711 * _711;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _727 = _531 + _725;
        float _729 = -_533;
        float _731 = _729 + _699;
        float _733 = fma(_715, _715, _723);
        float _735 = fma(_727, _727, _733);
        float _737 = sqrt(_735);
        float _739 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _741 = _739 * _717;
        float _743 = -_531;
        float _745 = _743 + _701;
        float _747 = fma(_721, _741, _493);
        float _749 = fma(_731, _741, _533);
        float _751 = fma(_745, _741, _531);
        _703 = _749;
        _705 = _747;
        _707 = _751;
    }
    float _753 = _703;
    float _755 = _705;
    float _757 = _707;
    float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].x, _761);
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].x, _765);
    float _775 = _765;
    if (_351)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = _777;
    if (!_351)
    {
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _783 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _781);
        float _785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _789 = 1.0 / _783;
        float _791 = 1.0 / _787;
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _797 = fma(_789, _793, _795);
        float _799 = _797 * _791;
        float _801 = precise::clamp(_799, 0.0, 1.0);
        _779 = _801;
    }
    float _803 = _779;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].z, _769);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].z, _767);
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _815 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[2].z, _771);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _819 = _235 * _811;
    float _821 = _813 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[3].z, _773);
    float _827 = _623 + 0.5;
    float _829 = _813 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = _813 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _833 = _803 > 0.0;
    bool _835 = isnan(_803);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = -_639;
    float _845 = _843 + 0.5;
    float _847 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _851 = _813 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _855 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _851);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _853);
    float _867 = _855 * _807;
    float _869 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _857);
    float _873 = _859 * _823;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _863);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _865);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _875);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _879 + _883;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _901 = _819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _903 = _893 * 0.5;
    out.m_52.x = _895;
    out.m_52.y = _891;
    out.m_52.z = _897;
    out.m_52.w = _899;
    out.m_54.x = _867;
    out.m_54.y = _873;
    out.m_33.x = _901;
    out.gl_Position.x = _885;
    out.gl_Position.y = _877;
    out.gl_Position.z = _879;
    out.gl_Position.w = _883;
    out.m_56.z = _903;
    out.m_56.w = _883;
    if (_841)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _905;
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
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _255 = false;
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
        float _962 = as_type<float>(_91);
        out.gl_Position.z = _962;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _111 = 0.0;
    if (_105)
    {
        float _113 = float(_75);
        _111 = _113;
    }
    float _115 = _111;
    bool _117 = _109 >= _115;
    bool _119 = !_105;
    bool _121 = _117 || _119;
    if (_121)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _85;
    if (_121)
    {
        out.m_33.x = 0.0;
    }
    if (_121)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1030 = as_type<float>(_127);
        out.gl_Position.z = _1030;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_37.x;
    float _131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _133 = _109 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _135 = as_type<float>(int(gl_VertexIndex));
    float _137 = _133 * _131;
    float _139 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    int _141 = as_type<int>(_135) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_135) & 2;
    bool _147 = _145 != 0;
    float _149 = _139 * 6.283185482025146484375;
    float _151 = floor(_139);
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    float _157 = _149 * 0.15915493667125701904296875;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    bool _167 = !_143;
    float _169 = _167 ? (-0.5) : 0.5;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = cos(_171);
    int _175 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _177 = _175 != 0;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    bool _183 = !_177;
    int _185 = _183 ? 0 : 1;
    float _187 = -_151;
    float _189 = _139 + _187;
    int _191 = abs(_181);
    int _193 = abs(_185);
    bool _195 = !_165;
    int _197 = _195 ? 0 : 1;
    float _199 = -_189;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _203 = float(_191);
    float _205 = fma(_173, 0.5, 0.5);
    bool _207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _209 = abs(_197);
    float _211 = abs(_201);
    float _213 = _203 * _211;
    bool _215 = _189 < 0.5;
    float _217 = float(_215);
    float _219 = -_205;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_193);
    float _225 = -_217;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_209);
    float _231 = fma(_223, _221, _213);
    float _233 = abs(_227);
    float _235 = fma(_229, _233, _231);
    bool _237 = !_207;
    float _253;
    if (!_237)
    {
        float _239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _241 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _245 = _243 * _239;
        float _247 = floor(_245);
        float _249 = -_247;
        float _251 = _245 + _249;
        _253 = _251;
        _255 = true;
    }
    else
    {
        float _257 = float(_75);
        float _259 = 1.0 / _257;
        float _261 = _109 * _259;
        _253 = _261;
    }
    _255 = false;
    float _263 = _253;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = _263 + _265;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _263 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _277 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _281;
    float _285 = in.m_42.x;
    float _287 = in.m_42.y;
    bool _289 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_263);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _275;
    bool _303 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_263);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = in.m_30.x;
    float _317 = in.m_30.y;
    float _319 = in.m_30.z;
    float _321 = in.m_44.x;
    float _323 = in.m_44.y;
    float _325 = in.m_44.z;
    float _327 = in.m_44.w;
    bool _329 = _129 > 0.5;
    float _331 = 1.0 / _279;
    bool _333 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _335 = isnan(0.5);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _341 = _337 || _339;
    bool _343 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _345 = isnan(0.5);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _351 = _347 || _349;
    float _353 = _267 * _301;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    float _359 = 1.0 / _283;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = fma(_357, _353, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _371 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _373 = isnan(_263);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = fma(_363, _353, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _385 = _271 * _331;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _263 + _387;
    bool _391 = _263 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_263);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = -_299;
    float _405 = _403 + 1.0;
    float _407 = fma(_367, _385, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _409 = _317 * _323;
    float _411 = -_401;
    float _413 = _411 + 1.0;
    float _415 = _381 * _405;
    float _417 = -_381;
    float _419 = _417 + 1.0;
    float _421 = _389 * _359;
    float _423 = _313 * _413;
    float _425 = -_313;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _433 = _401 * _419;
    float _435 = _383 * _423;
    float _437 = in.m_46.x;
    float _439 = in.m_46.y;
    float _441 = in.m_46.z;
    float _443 = in.m_46.w;
    float _445 = fma(_431, _385, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _369 * _423;
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = in.m_48.x;
    float _453 = in.m_48.y;
    float _455 = in.m_48.z;
    float _457 = in.m_48.w;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _469 = fma(_445, _433, _449);
    float _471 = fma(_461, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _473 = fma(_465, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _475 = fma(_407, _433, _467);
    float _477 = fma(_315, _321, _409);
    float _479 = fma(_471, _415, _469);
    float _481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _483 = fma(_473, _415, _475);
    float _485 = fma(_319, _325, _477);
    float _487 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _479);
    float _489 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _169);
    float _491 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _483);
    float _493 = _485 + _327;
    float _495 = _487 * _287;
    float _497 = _491 * _285;
    float _499 = _317 * _439;
    float _501 = _235 * _495;
    float _503 = in.m_37.y;
    float _505 = _235 * _497;
    float _507 = _317 * _453;
    float _509 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _511 = _501 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _513 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _515 = fma(_315, _451, _507);
    float _517 = fma(_315, _437, _499);
    float _519 = _511 * _509;
    float _521 = _513 * _489;
    float _523 = fma(_319, _455, _515);
    float _525 = fma(_319, _441, _517);
    float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _529 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _531 = _523 + _457;
    float _533 = _525 + _443;
    float _535 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[26].x, _527);
    float _537 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[24].x, _529);
    float _539 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _541 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[26].z, _535);
    float _543 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[24].z, _537);
    float _545 = fma(_521, (*spvDescriptorSet0.vp_c8)._m0[25].x, _539);
    float _547 = _541 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _549 = _543 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _553 = _531 + _547;
    float _555 = _493 + _549;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _561 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _563 = _553 + _561;
    float _565 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _567 = _555 + _565;
    float _569 = _533 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _571 = _563 * _563;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _575 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[11].x, _569);
    float _577 = _533 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _579 = fma(_567, _567, _571);
    float _581 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[11].z, _575);
    float _583 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[10].x, _577);
    float _585 = sqrt(_579);
    float _587 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _589 = _581 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _591 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _593 = _559 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = fma(_481, (*spvDescriptorSet0.vp_c8)._m0[25].z, _545);
    float _597 = fma(_531, (*spvDescriptorSet0.vp_c8)._m0[10].z, _583);
    float _599 = 1.0 / _589;
    out.m_50.x = _587;
    out.m_50.y = _591;
    out.m_50.z = _593;
    out.m_50.w = _573;
    bool _601 = _503 > 0.5;
    float _603 = _597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _611 = _609 != 0;
    float _613 = _603 + _589;
    bool _615 = _585 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _617 = -_169;
    float _619 = _329 ? _617 : _169;
    bool _621 = !_607;
    float _623 = _621 ? _169 : _619;
    float _625 = _595 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = -_155;
    float _629 = _601 ? _627 : _155;
    float _631 = _613 * _599;
    float _633 = _631 * 0.5;
    float _635 = _533 + _625;
    bool _637 = !_611;
    float _639 = _637 ? _155 : _629;
    float _641 = _591;
    float _643 = _629;
    float _645 = _619;
    if (!_615)
    {
        _641 = _555;
    }
    float _647 = _641;
    float _649 = _647;
    if (!_615)
    {
        _643 = _553;
    }
    float _651 = _643;
    float _653 = _651;
    if (!_615)
    {
        _645 = _635;
    }
    float _655 = _645;
    bool _657 = !_615;
    float _659 = _655;
    if (!_657)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _663 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _665 = _585 + _663;
        float _667 = rsqrt(_579);
        float _669 = _665 * _661;
        float _671 = _635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _673 = _669 * 0.15915493667125701904296875;
        float _675 = _673 * 6.283185482025146484375;
        float _677 = cos(_675);
        float _679 = _673 * 6.283185482025146484375;
        float _681 = sin(_679);
        float _683 = _677 + (-1.0);
        float _685 = fma(_681, _671, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _687 = _683 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _689 = _667 * _685;
        float _691 = fma(_635, _677, _687);
        float _693 = fma(_567, _689, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _695 = fma(_563, _689, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _649 = _693;
        _659 = _691;
        _653 = _695;
    }
    float _697 = _649;
    float _699 = _659;
    float _701 = _653;
    float _703 = _699;
    float _705 = _697;
    float _707 = _701;
    if (!_341)
    {
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _711 = _533 + _709;
        float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _715 = _493 + _713;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _719 = -_493;
        float _721 = _719 + _697;
        float _723 = _711 * _711;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _727 = _531 + _725;
        float _729 = -_533;
        float _731 = _729 + _699;
        float _733 = fma(_715, _715, _723);
        float _735 = fma(_727, _727, _733);
        float _737 = sqrt(_735);
        float _739 = precise::min(_737, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _741 = _739 * _717;
        float _743 = -_531;
        float _745 = _743 + _701;
        float _747 = fma(_721, _741, _493);
        float _749 = fma(_731, _741, _533);
        float _751 = fma(_745, _741, _531);
        _703 = _749;
        _705 = _747;
        _707 = _751;
    }
    float _753 = _703;
    float _755 = _705;
    float _757 = _707;
    float _759 = _753 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _761 = _753 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _763 = _753 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _765 = _753 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _767 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[0].x, _759);
    float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[1].x, _761);
    float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[2].x, _763);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[3].x, _765);
    float _775 = _765;
    if (_351)
    {
        _775 = 1.0;
    }
    float _777 = _775;
    float _779 = _777;
    if (!_351)
    {
        float _781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _783 = fma(_633, (*spvDescriptorSet0.vp_c8)._m0[30].w, _781);
        float _785 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _789 = 1.0 / _783;
        float _791 = 1.0 / _787;
        float _793 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _797 = fma(_789, _793, _795);
        float _799 = _797 * _791;
        float _801 = precise::clamp(_799, 0.0, 1.0);
        _779 = _801;
    }
    float _803 = _779;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[1].z, _769);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[0].z, _767);
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _813 = _805 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _815 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[2].z, _771);
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _819 = _235 * _811;
    float _821 = _813 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[3].z, _773);
    float _827 = _623 + 0.5;
    float _829 = _813 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _831 = _813 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _833 = _803 > 0.0;
    bool _835 = isnan(_803);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = -_639;
    float _845 = _843 + 0.5;
    float _847 = _815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[7].x, _821);
    float _851 = _813 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _853 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[5].x, _829);
    float _855 = _827 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _857 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[6].x, _831);
    float _859 = _845 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _861 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[7].z, _849);
    float _863 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[4].x, _851);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[5].z, _853);
    float _867 = _855 * _807;
    float _869 = _825 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _871 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[6].z, _857);
    float _873 = _859 * _823;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[4].z, _863);
    float _877 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _865);
    float _879 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _871);
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _861);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _875);
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _891 = _881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _879 + _883;
    float _895 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _897 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _901 = _819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _903 = _893 * 0.5;
    out.m_52.x = _895;
    out.m_52.y = _891;
    out.m_52.z = _897;
    out.m_52.w = _899;
    out.m_54.x = _867;
    out.m_54.y = _873;
    out.m_33.x = _901;
    out.gl_Position.x = _885;
    out.gl_Position.y = _877;
    out.gl_Position.z = _879;
    out.gl_Position.w = _883;
    out.m_56.z = _903;
    out.m_56.w = _883;
    if (_841)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _905 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _905;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

