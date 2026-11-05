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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_42 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _693 = false;
    bool _539 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1447 = as_type<float>(_93);
        out.gl_Position.z = _1447;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_129);
        out.gl_Position.z = _1515;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    int _157 = as_type<int>(_131) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_131) & 2;
    bool _163 = _161 != 0;
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = 0.0;
    float _169 = _165;
    if (!_143)
    {
        float _171 = _165 * _165;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    bool _177 = !_159;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _175;
    if (!_143)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _165 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _165);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _165 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _169 = _247;
    }
    float _249 = _169;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _145, _253);
    float _261 = fma(_249, _147, _255);
    float _263 = fma(_249, _149, _257);
    float _265 = fma(_259, _133, _151);
    float _267 = fma(_261, _133, _153);
    float _269 = fma(_263, _133, _155);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_44.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_77);
        float _295 = 1.0 / _293;
        float _297 = _111 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _299 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _299 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_299);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _311;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _315;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _319;
    float _349 = _303 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _299 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _357 = _299 + _355;
    float _359 = 1.0 / _323;
    float _361 = _307 * _343;
    bool _363 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_299);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _373 * _341;
    float _377 = _353 * _347;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_299);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    bool _395 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_299);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_381, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = _357 * _359;
    float _415 = -_373;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -_393;
    float _429 = _427 + 1.0;
    float _431 = _393 * _417;
    float _433 = fma(_411, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _437 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_299);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _405 * _429;
    float _451 = -_405;
    float _453 = _451 + 1.0;
    float _455 = fma(_421, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = -_447;
    float _463 = _461 + 1.0;
    float _465 = _447 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _407 * _465;
    float _477 = _455 * _465;
    float _479 = fma(_469, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_473, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _475);
    float _485 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _477);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_433, _449, _483);
    float _497 = fma(_435, _449, _485);
    float _499 = fma(_489, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_479, _431, _495);
    float _505 = fma(_481, _431, _497);
    float _507 = fma(_499, _375, _503);
    float _509 = fma(_501, _375, _505);
    float _511 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _507);
    float _513 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _509);
    float _515 = _511 * _457;
    float _517 = _513 * _459;
    bool _519 = !_345;
    float _537;
    if (!_519)
    {
        float _521 = in.m_44.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_77);
        float _543 = 1.0 / _541;
        float _545 = _111 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = in.m_44.x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = isnan(_547);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _575 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _577 = isnan(_547);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _557;
    float _595 = -_569;
    float _597 = _595 + 1.0;
    float _599 = 1.0 / _573;
    float _601 = _589 * _593;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _585 * _597;
    float _609 = -_585;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _615 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_547);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _629 = _605 * _599;
    float _631 = _613 * _607;
    float _633 = -_625;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _547 + _637;
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _643 = _569 * _635;
    float _645 = fma(_629, _639, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = _627 * _553;
    float _649 = fma(_645, _643, _641);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = trunc(_647);
    int _669 = int(_667);
    out.m_46.x = _663;
    out.m_46.y = _659;
    out.m_46.z = _665;
    out.m_46.w = _661;
    int _671 = _669 << 4;
    int _673 = _671 + 1968;
    bool _675 = !_591;
    float _691;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_77);
        float _697 = 1.0 / _695;
        float _699 = _111 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = in.m_44.z;
    float _705 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_48.x;
    float _711 = in.m_48.y;
    float _713 = in.m_48.z;
    float _715 = in.m_48.w;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = in.m_44.w;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = in.m_50.z;
    float _739 = in.m_50.w;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _743 = _741 != 0;
    bool _745 = _553 > 0.5;
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = in.m_52.z;
    float _753 = in.m_52.w;
    float _755 = in.m_44.y;
    bool _757 = _703 > 0.5;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _763 = _267 * _711;
    float _765 = -_179;
    int _767 = _757 ? as_type<int>(_765) : as_type<int>(_179);
    bool _769 = _723 > 0.5;
    float _771 = _267 * _735;
    float _773 = _705 * _759;
    float _775 = fma(_265, _709, _763);
    float _777 = _267 * _749;
    float _779 = fma(_265, _733, _771);
    float _781 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_265, _747, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _791 = _707 * _717;
    float _793 = -_785;
    float _795 = fma(_781, 2.0, _793);
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _799 = fma(_789, -2.0, _787);
    float _801 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _803 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _797);
    float _805 = fma(_269, _737, _779);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _801);
    float _809 = fma(_269, _751, _783);
    float _811 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _805 + _739;
    float _819 = _809 + _753;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _845 = _835 * _835;
    float _847 = _839 * _839;
    float _849 = 1.0 / _843;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _853;
    float _857 = -_179;
    int _859 = _745 ? as_type<int>(_857) : as_type<int>(_179);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _701 + _861;
    bool _865 = _755 > 0.5;
    float _867 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _851);
    float _869 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _831);
    float _871 = fma(_269, _713, _775);
    float _873 = _845 + _847;
    int _875 = _673 + 8;
    uint _878 = uint(int(uint(_875) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    float _886 = -_111;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    float _890 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _892 = sqrt(_873);
    float _894 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    float _896 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _867);
    float _898 = _855 * _849;
    bool _900 = !_721;
    float _902 = _900 ? _179 : as_type<float>(_859);
    uint _904 = uint(int(uint(_673) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    int _912 = int(_904) + 1;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    int _916 = _912 & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = _871 + _715;
    float _922 = fma(_898, _863, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _924 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_701);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _938 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _940 = isnan(_701);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_183;
    int _952 = _769 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].z, _869);
    float _956 = -_934;
    float _958 = _956 + 1.0;
    float _960 = -_183;
    int _962 = _865 ? as_type<int>(_960) : as_type<int>(_183);
    bool _964 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _970 = _948 * _958;
    bool _972 = !_727;
    float _974 = _972 ? _183 : as_type<float>(_962);
    float _976 = _920 + _968;
    float _978 = _922 * _970;
    bool _980 = !_731;
    float _982 = _980 ? _179 : as_type<float>(_767);
    bool _984 = !_743;
    float _986 = _984 ? _183 : as_type<float>(_952);
    float _988 = _922;
    float _990 = _845;
    float _992 = _847;
    float _994 = _829;
    float _996 = _827;
    if (!_964)
    {
        _988 = _976;
    }
    float _998 = _988;
    bool _1000 = !_964;
    float _1002 = _998;
    if (!_1000)
    {
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1008 = _892 + _1006;
        float _1010 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = rsqrt(_873);
        float _1014 = _1008 * _1004;
        float _1016 = _1014 * 0.15915493667125701904296875;
        float _1018 = _1016 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        float _1022 = _1016 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = fma(_1020, _1010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1012 * _1026;
        float _1030 = fma(_835, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1032 = _1024 + (-1.0);
        float _1034 = fma(_839, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1038 = _1030 + _1036;
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1044 = _1034 + _1042;
        float _1046 = _1038 * _1038;
        float _1048 = fma(_976, _1024, _1040);
        float _1050 = _1044 * _1044;
        _1002 = _1048;
        _990 = _1046;
        _992 = _1050;
        _994 = _1034;
        _996 = _1030;
    }
    float _1052 = _1002;
    float _1054 = _990;
    float _1056 = _992;
    float _1058 = _994;
    float _1060 = _996;
    float _1062 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1064 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _974 + (-0.5);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1070 = _1052 + _1068;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1074 = -_948;
    float _1076 = _1074 + 1.0;
    float _1078 = -_1064;
    float _1080 = -_894;
    float _1082 = fma(_1078, _1066, _1080);
    float _1084 = fma(_1070, _1070, _1054);
    float _1086 = _902 + 0.5;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1090 = -_890;
    float _1092 = _1090 + 1.0;
    float _1094 = _1084 + _1056;
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1098 = fma(_1062, _1086, _888);
    float _1100 = _982 + 0.5;
    float _1102 = -_986;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1088);
    float _1108 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = sqrt(_1094);
    float _1116 = -_896;
    float _1118 = _1116 + 1.0;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1122 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = -_1092;
    float _1126 = fma(_902, _1124, _1098);
    float _1128 = _1110 * _1072;
    float _1130 = fma(_974, _1118, _1082);
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1120 * _1096;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_54.x = _1126;
    out.m_54.y = _1130;
    out.m_54.z = _1128;
    out.m_54.w = _1134;
    bool _1142 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1114);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    out.m_56.x = _1132;
    out.m_56.y = _1136;
    out.m_56.z = _1138;
    out.m_56.w = _1140;
    float _1152 = _1108;
    float _1154 = _1092;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1114);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1114 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1114);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1114 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1052 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1058 + _1226;
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _1060 + _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1248 = fma(_1242, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = _1242;
    float _1252 = _1220;
    if (_1238)
    {
        _1154 = _1248;
    }
    float _1254 = _1154;
    float _1256 = _1254;
    if (_1238)
    {
        _1250 = _1244;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1238)
    {
        _1252 = _1246;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1238)
    {
        float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1268 = _920 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1272 = _817 + _1270;
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = _1268 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1280 = _819 + _1278;
        float _1282 = fma(_1272, _1272, _1276);
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1286 = fma(_1280, _1280, _1282);
        float _1288 = sqrt(_1286);
        float _1290 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1292 = precise::min(_1288, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1294 = _1292 * _1284;
        float _1296 = -_817;
        float _1298 = _1296 + _1248;
        float _1300 = -_819;
        float _1302 = _1300 + _1246;
        float _1304 = _1290 * _1294;
        float _1306 = -_920;
        float _1308 = _1306 + _1244;
        float _1310 = fma(_1298, _1304, _817);
        float _1312 = fma(_1308, _1304, _920);
        float _1314 = fma(_1302, _1304, _819);
        _1260 = _1312;
        _1256 = _1310;
        _1264 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1256;
    float _1320 = _1264;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_35.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_58.z = _1390;
    out.m_58.w = _1380;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _693 = false;
    bool _539 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1447 = as_type<float>(_93);
        out.gl_Position.z = _1447;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_129);
        out.gl_Position.z = _1515;
    }
    if (_123)
    {
        return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    int _157 = as_type<int>(_131) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_131) & 2;
    bool _163 = _161 != 0;
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = 0.0;
    float _169 = _165;
    if (!_143)
    {
        float _171 = _165 * _165;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    bool _177 = !_159;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _175;
    if (!_143)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _165 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _165);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _165 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _169 = _247;
    }
    float _249 = _169;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _145, _253);
    float _261 = fma(_249, _147, _255);
    float _263 = fma(_249, _149, _257);
    float _265 = fma(_259, _133, _151);
    float _267 = fma(_261, _133, _153);
    float _269 = fma(_263, _133, _155);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_44.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_77);
        float _295 = 1.0 / _293;
        float _297 = _111 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _299 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _299 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_299);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _311;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _315;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _319;
    float _349 = _303 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _299 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _357 = _299 + _355;
    float _359 = 1.0 / _323;
    float _361 = _307 * _343;
    bool _363 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_299);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _373 * _341;
    float _377 = _353 * _347;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_299);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    bool _395 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_299);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_381, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = _357 * _359;
    float _415 = -_373;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -_393;
    float _429 = _427 + 1.0;
    float _431 = _393 * _417;
    float _433 = fma(_411, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _437 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_299);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _405 * _429;
    float _451 = -_405;
    float _453 = _451 + 1.0;
    float _455 = fma(_421, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = -_447;
    float _463 = _461 + 1.0;
    float _465 = _447 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _407 * _465;
    float _477 = _455 * _465;
    float _479 = fma(_469, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_473, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _475);
    float _485 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _477);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_433, _449, _483);
    float _497 = fma(_435, _449, _485);
    float _499 = fma(_489, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_479, _431, _495);
    float _505 = fma(_481, _431, _497);
    float _507 = fma(_499, _375, _503);
    float _509 = fma(_501, _375, _505);
    float _511 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _507);
    float _513 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _509);
    float _515 = _511 * _457;
    float _517 = _513 * _459;
    bool _519 = !_345;
    float _537;
    if (!_519)
    {
        float _521 = in.m_44.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_77);
        float _543 = 1.0 / _541;
        float _545 = _111 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = in.m_44.x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = isnan(_547);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _575 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _577 = isnan(_547);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _557;
    float _595 = -_569;
    float _597 = _595 + 1.0;
    float _599 = 1.0 / _573;
    float _601 = _589 * _593;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _585 * _597;
    float _609 = -_585;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _615 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_547);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _629 = _605 * _599;
    float _631 = _613 * _607;
    float _633 = -_625;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _547 + _637;
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _643 = _569 * _635;
    float _645 = fma(_629, _639, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = _627 * _553;
    float _649 = fma(_645, _643, _641);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = trunc(_647);
    int _669 = int(_667);
    out.m_46.x = _663;
    out.m_46.y = _659;
    out.m_46.z = _665;
    out.m_46.w = _661;
    int _671 = _669 << 4;
    int _673 = _671 + 1968;
    bool _675 = !_591;
    float _691;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_77);
        float _697 = 1.0 / _695;
        float _699 = _111 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = in.m_44.z;
    float _705 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_48.x;
    float _711 = in.m_48.y;
    float _713 = in.m_48.z;
    float _715 = in.m_48.w;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = in.m_44.w;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = in.m_50.z;
    float _739 = in.m_50.w;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _743 = _741 != 0;
    bool _745 = _553 > 0.5;
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = in.m_52.z;
    float _753 = in.m_52.w;
    float _755 = in.m_44.y;
    bool _757 = _703 > 0.5;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _763 = _267 * _711;
    float _765 = -_179;
    int _767 = _757 ? as_type<int>(_765) : as_type<int>(_179);
    bool _769 = _723 > 0.5;
    float _771 = _267 * _735;
    float _773 = _705 * _759;
    float _775 = fma(_265, _709, _763);
    float _777 = _267 * _749;
    float _779 = fma(_265, _733, _771);
    float _781 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_265, _747, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _791 = _707 * _717;
    float _793 = -_785;
    float _795 = fma(_781, 2.0, _793);
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _799 = fma(_789, -2.0, _787);
    float _801 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _803 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _797);
    float _805 = fma(_269, _737, _779);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _801);
    float _809 = fma(_269, _751, _783);
    float _811 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _805 + _739;
    float _819 = _809 + _753;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _845 = _835 * _835;
    float _847 = _839 * _839;
    float _849 = 1.0 / _843;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _853;
    float _857 = -_179;
    int _859 = _745 ? as_type<int>(_857) : as_type<int>(_179);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _701 + _861;
    bool _865 = _755 > 0.5;
    float _867 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _851);
    float _869 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _831);
    float _871 = fma(_269, _713, _775);
    float _873 = _845 + _847;
    int _875 = _673 + 8;
    uint _878 = uint(int(uint(_875) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    float _886 = -_111;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    float _890 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _892 = sqrt(_873);
    float _894 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    float _896 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _867);
    float _898 = _855 * _849;
    bool _900 = !_721;
    float _902 = _900 ? _179 : as_type<float>(_859);
    uint _904 = uint(int(uint(_673) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    int _912 = int(_904) + 1;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    int _916 = _912 & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = _871 + _715;
    float _922 = fma(_898, _863, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _924 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_701);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _938 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _940 = isnan(_701);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_183;
    int _952 = _769 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].z, _869);
    float _956 = -_934;
    float _958 = _956 + 1.0;
    float _960 = -_183;
    int _962 = _865 ? as_type<int>(_960) : as_type<int>(_183);
    bool _964 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _970 = _948 * _958;
    bool _972 = !_727;
    float _974 = _972 ? _183 : as_type<float>(_962);
    float _976 = _920 + _968;
    float _978 = _922 * _970;
    bool _980 = !_731;
    float _982 = _980 ? _179 : as_type<float>(_767);
    bool _984 = !_743;
    float _986 = _984 ? _183 : as_type<float>(_952);
    float _988 = _922;
    float _990 = _845;
    float _992 = _847;
    float _994 = _829;
    float _996 = _827;
    if (!_964)
    {
        _988 = _976;
    }
    float _998 = _988;
    bool _1000 = !_964;
    float _1002 = _998;
    if (!_1000)
    {
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1008 = _892 + _1006;
        float _1010 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = rsqrt(_873);
        float _1014 = _1008 * _1004;
        float _1016 = _1014 * 0.15915493667125701904296875;
        float _1018 = _1016 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        float _1022 = _1016 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = fma(_1020, _1010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1012 * _1026;
        float _1030 = fma(_835, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1032 = _1024 + (-1.0);
        float _1034 = fma(_839, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1038 = _1030 + _1036;
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1044 = _1034 + _1042;
        float _1046 = _1038 * _1038;
        float _1048 = fma(_976, _1024, _1040);
        float _1050 = _1044 * _1044;
        _1002 = _1048;
        _990 = _1046;
        _992 = _1050;
        _994 = _1034;
        _996 = _1030;
    }
    float _1052 = _1002;
    float _1054 = _990;
    float _1056 = _992;
    float _1058 = _994;
    float _1060 = _996;
    float _1062 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1064 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _974 + (-0.5);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1070 = _1052 + _1068;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1074 = -_948;
    float _1076 = _1074 + 1.0;
    float _1078 = -_1064;
    float _1080 = -_894;
    float _1082 = fma(_1078, _1066, _1080);
    float _1084 = fma(_1070, _1070, _1054);
    float _1086 = _902 + 0.5;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1090 = -_890;
    float _1092 = _1090 + 1.0;
    float _1094 = _1084 + _1056;
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1098 = fma(_1062, _1086, _888);
    float _1100 = _982 + 0.5;
    float _1102 = -_986;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1088);
    float _1108 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = sqrt(_1094);
    float _1116 = -_896;
    float _1118 = _1116 + 1.0;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1122 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = -_1092;
    float _1126 = fma(_902, _1124, _1098);
    float _1128 = _1110 * _1072;
    float _1130 = fma(_974, _1118, _1082);
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1120 * _1096;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_54.x = _1126;
    out.m_54.y = _1130;
    out.m_54.z = _1128;
    out.m_54.w = _1134;
    bool _1142 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1114);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    out.m_56.x = _1132;
    out.m_56.y = _1136;
    out.m_56.z = _1138;
    out.m_56.w = _1140;
    float _1152 = _1108;
    float _1154 = _1092;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1114);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1114 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1114);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1114 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1052 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1058 + _1226;
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _1060 + _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1248 = fma(_1242, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = _1242;
    float _1252 = _1220;
    if (_1238)
    {
        _1154 = _1248;
    }
    float _1254 = _1154;
    float _1256 = _1254;
    if (_1238)
    {
        _1250 = _1244;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1238)
    {
        _1252 = _1246;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1238)
    {
        float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1268 = _920 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1272 = _817 + _1270;
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = _1268 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1280 = _819 + _1278;
        float _1282 = fma(_1272, _1272, _1276);
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1286 = fma(_1280, _1280, _1282);
        float _1288 = sqrt(_1286);
        float _1290 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1292 = precise::min(_1288, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1294 = _1292 * _1284;
        float _1296 = -_817;
        float _1298 = _1296 + _1248;
        float _1300 = -_819;
        float _1302 = _1300 + _1246;
        float _1304 = _1290 * _1294;
        float _1306 = -_920;
        float _1308 = _1306 + _1244;
        float _1310 = fma(_1298, _1304, _817);
        float _1312 = fma(_1308, _1304, _920);
        float _1314 = fma(_1302, _1304, _819);
        _1260 = _1312;
        _1256 = _1310;
        _1264 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1256;
    float _1320 = _1264;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_35.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_58.z = _1390;
    out.m_58.w = _1380;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1190 = false;
    bool _693 = false;
    bool _539 = false;
    bool _291 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
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
        out.m_35.x = 0.0;
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
        float _1447 = as_type<float>(_93);
        out.gl_Position.z = _1447;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _113 = 0.0;
    if (_107)
    {
        float _115 = float(_77);
        _113 = _115;
    }
    float _117 = _113;
    bool _119 = _111 >= _117;
    bool _121 = !_107;
    bool _123 = _119 || _121;
    if (_123)
    {
        _87 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _87;
    if (_123)
    {
        out.m_35.x = 0.0;
    }
    if (_123)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1515 = as_type<float>(_129);
        out.gl_Position.z = _1515;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = in.m_42.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_37.x;
    float _147 = in.m_37.y;
    float _149 = in.m_37.z;
    float _151 = in.m_32.x;
    float _153 = in.m_32.y;
    float _155 = in.m_32.z;
    int _157 = as_type<int>(_131) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_131) & 2;
    bool _163 = _161 != 0;
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = 0.0;
    float _169 = _165;
    if (!_143)
    {
        float _171 = _165 * _165;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    bool _177 = !_159;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _175;
    if (!_143)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_143;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _165 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _165);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_143;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _165 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _169 = _247;
    }
    float _249 = _169;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _145, _253);
    float _261 = fma(_249, _147, _255);
    float _263 = fma(_249, _149, _257);
    float _265 = fma(_259, _133, _151);
    float _267 = fma(_261, _133, _153);
    float _269 = fma(_263, _133, _155);
    bool _271 = !_251;
    float _289;
    if (!_271)
    {
        float _273 = in.m_44.x;
        float _275 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _277 = _273 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _281 = _279 * _275;
        float _283 = floor(_281);
        float _285 = -_283;
        float _287 = _281 + _285;
        _289 = _287;
        _291 = true;
    }
    else
    {
        float _293 = float(_77);
        float _295 = 1.0 / _293;
        float _297 = _111 * _295;
        _289 = _297;
    }
    _291 = false;
    float _299 = _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = _299 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _299 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_299);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _311;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    float _343 = 1.0 / _315;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _319;
    float _349 = _303 * _337;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _299 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _357 = _299 + _355;
    float _359 = 1.0 / _323;
    float _361 = _307 * _343;
    bool _363 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_299);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _373 * _341;
    float _377 = _353 * _347;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_299);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    bool _395 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _397 = isnan(_299);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = fma(_381, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = _357 * _359;
    float _415 = -_373;
    float _417 = _415 + 1.0;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = -_393;
    float _429 = _427 + 1.0;
    float _431 = _393 * _417;
    float _433 = fma(_411, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _435 = fma(_425, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _437 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _439 = isnan(_299);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = _405 * _429;
    float _451 = -_405;
    float _453 = _451 + 1.0;
    float _455 = fma(_421, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _457 = in.m_42.x;
    float _459 = in.m_42.y;
    float _461 = -_447;
    float _463 = _461 + 1.0;
    float _465 = _447 * _453;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _471;
    float _475 = _407 * _465;
    float _477 = _455 * _465;
    float _479 = fma(_469, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = fma(_473, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _483 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].x, _475);
    float _485 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[143].y, _477);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _495 = fma(_433, _449, _483);
    float _497 = fma(_435, _449, _485);
    float _499 = fma(_489, _413, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _501 = fma(_493, _413, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _503 = fma(_479, _431, _495);
    float _505 = fma(_481, _431, _497);
    float _507 = fma(_499, _375, _503);
    float _509 = fma(_501, _375, _505);
    float _511 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].x, _507);
    float _513 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[147].y, _509);
    float _515 = _511 * _457;
    float _517 = _513 * _459;
    bool _519 = !_345;
    float _537;
    if (!_519)
    {
        float _521 = in.m_44.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_77);
        float _543 = 1.0 / _541;
        float _545 = _111 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _551 = _547 + _549;
    float _553 = in.m_44.x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _559 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _561 = isnan(_547);
    bool _563 = _559 || _561;
    bool _565 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _567 = _563 || _565;
    float _569 = float(_567);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _575 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _577 = isnan(_547);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _593 = 1.0 / _557;
    float _595 = -_569;
    float _597 = _595 + 1.0;
    float _599 = 1.0 / _573;
    float _601 = _589 * _593;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _607 = _585 * _597;
    float _609 = -_585;
    float _611 = _609 + 1.0;
    float _613 = fma(_601, _551, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _615 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_547);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _629 = _605 * _599;
    float _631 = _613 * _607;
    float _633 = -_625;
    float _635 = _633 + 1.0;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _547 + _637;
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _643 = _569 * _635;
    float _645 = fma(_629, _639, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _647 = _627 * _553;
    float _649 = fma(_645, _643, _641);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = trunc(_647);
    int _669 = int(_667);
    out.m_46.x = _663;
    out.m_46.y = _659;
    out.m_46.z = _665;
    out.m_46.w = _661;
    int _671 = _669 << 4;
    int _673 = _671 + 1968;
    bool _675 = !_591;
    float _691;
    if (!_675)
    {
        float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _679 = _553 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _683 = _681 * _677;
        float _685 = floor(_683);
        float _687 = -_685;
        float _689 = _683 + _687;
        _691 = _689;
        _693 = true;
    }
    else
    {
        float _695 = float(_77);
        float _697 = 1.0 / _695;
        float _699 = _111 * _697;
        _691 = _699;
    }
    _693 = false;
    float _701 = _691;
    float _703 = in.m_44.z;
    float _705 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _707 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _709 = in.m_48.x;
    float _711 = in.m_48.y;
    float _713 = in.m_48.z;
    float _715 = in.m_48.w;
    float _717 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _721 = _719 != 0;
    float _723 = in.m_44.w;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = in.m_50.x;
    float _735 = in.m_50.y;
    float _737 = in.m_50.z;
    float _739 = in.m_50.w;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _743 = _741 != 0;
    bool _745 = _553 > 0.5;
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = in.m_52.z;
    float _753 = in.m_52.w;
    float _755 = in.m_44.y;
    bool _757 = _703 > 0.5;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _761 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _763 = _267 * _711;
    float _765 = -_179;
    int _767 = _757 ? as_type<int>(_765) : as_type<int>(_179);
    bool _769 = _723 > 0.5;
    float _771 = _267 * _735;
    float _773 = _705 * _759;
    float _775 = fma(_265, _709, _763);
    float _777 = _267 * _749;
    float _779 = fma(_265, _733, _771);
    float _781 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_265, _747, _777);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _789 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _791 = _707 * _717;
    float _793 = -_785;
    float _795 = fma(_781, 2.0, _793);
    float _797 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _799 = fma(_789, -2.0, _787);
    float _801 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _803 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].x, _797);
    float _805 = fma(_269, _737, _779);
    float _807 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].x, _801);
    float _809 = fma(_269, _751, _783);
    float _811 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _815 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].z, _807);
    float _817 = _805 + _739;
    float _819 = _809 + _753;
    float _821 = _811 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _823 = _815 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _813);
    float _827 = _817 + _821;
    float _829 = _819 + _823;
    float _831 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _833 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _835 = _827 + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _845 = _835 * _835;
    float _847 = _839 * _839;
    float _849 = 1.0 / _843;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _853;
    float _857 = -_179;
    int _859 = _745 ? as_type<int>(_857) : as_type<int>(_179);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _701 + _861;
    bool _865 = _755 > 0.5;
    float _867 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _851);
    float _869 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].x, _831);
    float _871 = fma(_269, _713, _775);
    float _873 = _845 + _847;
    int _875 = _673 + 8;
    uint _878 = uint(int(uint(_875) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[int(_880)][_882];
    float _886 = -_111;
    float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[76].x, _795);
    float _890 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _825);
    float _892 = sqrt(_873);
    float _894 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _799);
    float _896 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _867);
    float _898 = _855 * _849;
    bool _900 = !_721;
    float _902 = _900 ? _179 : as_type<float>(_859);
    uint _904 = uint(int(uint(_673) >> uint(2)));
    uint _906 = uint(int(uint(int(_904)) >> uint(2)));
    int _908 = int(_904) & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    int _912 = int(_904) + 1;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    int _916 = _912 & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = _871 + _715;
    float _922 = fma(_898, _863, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _924 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _926 = isnan(_701);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _938 = _701 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _940 = isnan(_701);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = -_183;
    int _952 = _769 ? as_type<int>(_950) : as_type<int>(_183);
    float _954 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].z, _869);
    float _956 = -_934;
    float _958 = _956 + 1.0;
    float _960 = -_183;
    int _962 = _865 ? as_type<int>(_960) : as_type<int>(_183);
    bool _964 = _892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _968 = _954 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _970 = _948 * _958;
    bool _972 = !_727;
    float _974 = _972 ? _183 : as_type<float>(_962);
    float _976 = _920 + _968;
    float _978 = _922 * _970;
    bool _980 = !_731;
    float _982 = _980 ? _179 : as_type<float>(_767);
    bool _984 = !_743;
    float _986 = _984 ? _183 : as_type<float>(_952);
    float _988 = _922;
    float _990 = _845;
    float _992 = _847;
    float _994 = _829;
    float _996 = _827;
    if (!_964)
    {
        _988 = _976;
    }
    float _998 = _988;
    bool _1000 = !_964;
    float _1002 = _998;
    if (!_1000)
    {
        float _1004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1008 = _892 + _1006;
        float _1010 = _976 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1012 = rsqrt(_873);
        float _1014 = _1008 * _1004;
        float _1016 = _1014 * 0.15915493667125701904296875;
        float _1018 = _1016 * 6.283185482025146484375;
        float _1020 = sin(_1018);
        float _1022 = _1016 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        float _1026 = fma(_1020, _1010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1028 = _1012 * _1026;
        float _1030 = fma(_835, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1032 = _1024 + (-1.0);
        float _1034 = fma(_839, _1028, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1038 = _1030 + _1036;
        float _1040 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1044 = _1034 + _1042;
        float _1046 = _1038 * _1038;
        float _1048 = fma(_976, _1024, _1040);
        float _1050 = _1044 * _1044;
        _1002 = _1048;
        _990 = _1046;
        _992 = _1050;
        _994 = _1034;
        _996 = _1030;
    }
    float _1052 = _1002;
    float _1054 = _990;
    float _1056 = _992;
    float _1058 = _994;
    float _1060 = _996;
    float _1062 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1064 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1066 = _974 + (-0.5);
    float _1068 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1070 = _1052 + _1068;
    float _1072 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1074 = -_948;
    float _1076 = _1074 + 1.0;
    float _1078 = -_1064;
    float _1080 = -_894;
    float _1082 = fma(_1078, _1066, _1080);
    float _1084 = fma(_1070, _1070, _1054);
    float _1086 = _902 + 0.5;
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1090 = -_890;
    float _1092 = _1090 + 1.0;
    float _1094 = _1084 + _1056;
    float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1098 = fma(_1062, _1086, _888);
    float _1100 = _982 + 0.5;
    float _1102 = -_986;
    float _1104 = _1102 + 0.5;
    float _1106 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1088);
    float _1108 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1110 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1112 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1114 = sqrt(_1094);
    float _1116 = -_896;
    float _1118 = _1116 + 1.0;
    float _1120 = _1104 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1122 = _884 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1124 = -_1092;
    float _1126 = fma(_902, _1124, _1098);
    float _1128 = _1110 * _1072;
    float _1130 = fma(_974, _1118, _1082);
    float _1132 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1120 * _1096;
    float _1136 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_54.x = _1126;
    out.m_54.y = _1130;
    out.m_54.z = _1128;
    out.m_54.w = _1134;
    bool _1142 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1144 = isnan(_1114);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1150 = _1146 || _1148;
    out.m_56.x = _1132;
    out.m_56.y = _1136;
    out.m_56.z = _1138;
    out.m_56.w = _1140;
    float _1152 = _1108;
    float _1154 = _1092;
    if (!_1150)
    {
        _1152 = 1.0;
    }
    float _1156 = _1152;
    bool _1158 = !_1150;
    float _1160 = _1156;
    if (!_1158)
    {
        bool _1162 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1164 = isnan(_1114);
        bool _1166 = _1162 || _1164;
        bool _1168 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1170 = _1166 || _1168;
        if (!_1170)
        {
            float _1172 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1174 = _1114 + _1172;
            float _1176 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1178 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1176;
            float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1182 = _1180 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1184 = 1.0 / _1178;
            float _1186 = _1174 * _1184;
            float _1188 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1160 = _1188;
            _1190 = true;
        }
        else
        {
            bool _1192 = _1114 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1194 = isnan(_1114);
            bool _1196 = _1192 || _1194;
            bool _1198 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1200 = _1196 || _1198;
            if (!_1200)
            {
                float _1202 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1204 = _1114 + _1202;
                float _1206 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1208 = _1206 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1210 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1212 = _1210 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1214 = 1.0 / _1208;
                float _1216 = _1204 * _1214;
                float _1218 = fma(_1216, _1212, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1160 = _1218;
                _1190 = true;
            }
            else
            {
                _1160 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1190 = false;
    float _1220 = _1160;
    float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1224 = _1052 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1228 = _1058 + _1226;
    bool _1230 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1234 = _1230 || _1232;
    bool _1236 = isnan(0.5);
    bool _1238 = _1234 || _1236;
    float _1240 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1242 = _1060 + _1240;
    float _1244 = fma(_1224, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1246 = fma(_1228, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1248 = fma(_1242, _1220, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1250 = _1242;
    float _1252 = _1220;
    if (_1238)
    {
        _1154 = _1248;
    }
    float _1254 = _1154;
    float _1256 = _1254;
    if (_1238)
    {
        _1250 = _1244;
    }
    float _1258 = _1250;
    float _1260 = _1258;
    if (_1238)
    {
        _1252 = _1246;
    }
    float _1262 = _1252;
    float _1264 = _1262;
    if (!_1238)
    {
        float _1266 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1268 = _920 + _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1272 = _817 + _1270;
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1276 = _1268 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1280 = _819 + _1278;
        float _1282 = fma(_1272, _1272, _1276);
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1286 = fma(_1280, _1280, _1282);
        float _1288 = sqrt(_1286);
        float _1290 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1292 = precise::min(_1288, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1294 = _1292 * _1284;
        float _1296 = -_817;
        float _1298 = _1296 + _1248;
        float _1300 = -_819;
        float _1302 = _1300 + _1246;
        float _1304 = _1290 * _1294;
        float _1306 = -_920;
        float _1308 = _1306 + _1244;
        float _1310 = fma(_1298, _1304, _817);
        float _1312 = fma(_1308, _1304, _920);
        float _1314 = fma(_1302, _1304, _819);
        _1260 = _1312;
        _1256 = _1310;
        _1264 = _1314;
    }
    float _1316 = _1260;
    float _1318 = _1256;
    float _1320 = _1264;
    float _1322 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1328 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1322);
    float _1332 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1324);
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1326);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1328);
    float _1338 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1330);
    float _1340 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1332);
    float _1342 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1334);
    float _1344 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1346 = _1338 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1348 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1350 = _1342 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1354 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1358 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1360 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1354);
    float _1364 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1356);
    float _1366 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1358);
    float _1368 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1360);
    float _1370 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1362);
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1364);
    float _1374 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1366);
    float _1376 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1378 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1370);
    float _1380 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1382 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1374);
    float _1384 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1376);
    float _1386 = _1378 + _1380;
    float _1388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1390 = _1386 * 0.5;
    out.m_35.x = _1388;
    out.gl_Position.x = _1382;
    out.gl_Position.y = _1384;
    out.gl_Position.z = _1378;
    out.gl_Position.w = _1380;
    out.m_58.z = _1390;
    out.m_58.w = _1380;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

