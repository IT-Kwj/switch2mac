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
    float4 m_48 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
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
    bool _1069 = false;
    bool _665 = false;
    bool _561 = false;
    bool _447 = false;
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
        float _1252 = as_type<float>(_93);
        out.gl_Position.z = _1252;
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
        float _1320 = as_type<float>(_129);
        out.gl_Position.z = _1320;
    }
    if (_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = 0.0;
    float _161 = _133;
    if (!_145)
    {
        float _163 = _133 * _133;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_145;
    float _193 = _173;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _133 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _133);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_145;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _133 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _161 = _247;
    }
    float _249 = _161;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _147, _253);
    float _261 = fma(_249, _149, _255);
    float _263 = fma(_249, _151, _257);
    float _265 = fma(_259, _135, _153);
    float _267 = fma(_261, _135, _155);
    float _269 = fma(_263, _135, _157);
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
    bool _305 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _299 + _317;
    bool _321 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_299);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -_315;
    float _343 = _341 + 1.0;
    float _345 = 1.0 / _339;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _331 * _343;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _367 = 1.0 / _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = _319 * _345;
    float _375 = _357 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = fma(_379, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = _303 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_387, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_371, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _405 * _375;
    float _409 = _403 * _375;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _415 = fma(_401, _359, _411);
    float _417 = fma(_389, _359, _413);
    float _419 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].x, _415);
    float _421 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].y, _417);
    float _423 = _419 * _397;
    float _425 = _421 * _399;
    bool _427 = !_365;
    float _445;
    if (!_427)
    {
        float _429 = in.m_44.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_77);
        float _451 = 1.0 / _449;
        float _453 = _111 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    float _489 = _459 * _479;
    bool _491 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_455);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = fma(_487, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = _501 * _483;
    float _515 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = fma(_511, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = _507 * _513;
    float _525 = _515 * _513;
    float _527 = _517 * _513;
    float _529 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _531 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _535 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].x, _529);
    float _537 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].y, _531);
    float _539 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].z, _533);
    bool _541 = !_477;
    float _559;
    if (!_541)
    {
        float _543 = in.m_44.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_77);
        float _565 = 1.0 / _563;
        float _567 = _111 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    bool _571 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _573 = isnan(_569);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _589 = isnan(_569);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = 1.0 / _585;
    float _607 = -_581;
    float _609 = _607 + 1.0;
    float _611 = _597 * _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = _601 * _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _569 + _621;
    float _625 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _627 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _627 * _611;
    float _633 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _635 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _639 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[116].x, _637);
    float _643 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _629;
    out.m_46.y = _639;
    out.m_46.z = _635;
    out.m_46.w = _643;
    bool _645 = !_603;
    float _663;
    if (!_645)
    {
        float _647 = in.m_44.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_77);
        float _669 = 1.0 / _667;
        float _671 = _111 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_48.x;
    float _677 = in.m_48.y;
    float _679 = in.m_48.z;
    float _681 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _685 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_50.x;
    float _689 = in.m_50.y;
    float _691 = in.m_50.z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = _685 * _693;
    float _701 = _267 * _677;
    float _703 = _681 * _683;
    float _705 = _267 * _689;
    float _707 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _711 = fma(_265, _675, _701);
    float _713 = fma(_265, _687, _705);
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _719 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _709);
    float _721 = fma(_269, _679, _711);
    float _723 = fma(_269, _691, _713);
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _717);
    float _727 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = in.m_52.x;
    float _731 = in.m_52.y;
    float _733 = in.m_52.z;
    float _735 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = _723 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _739 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _743 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _745 = _735 + _739;
    float _747 = _737 + _741;
    bool _749 = _695 > 0.5;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _745 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _747 + _759;
    bool _763 = _697 > 0.5;
    float _765 = _757 * _757;
    float _767 = _761 * _761;
    float _769 = 1.0 / _753;
    bool _771 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _773 = isnan(_673);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _765 + _767;
    float _785 = _267 * _731;
    float _787 = sqrt(_783);
    float _789 = fma(_265, _729, _785);
    float _791 = -_189;
    int _793 = _763 ? as_type<int>(_791) : as_type<int>(_189);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = fma(_269, _733, _789);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _743);
    float _807 = -_185;
    int _809 = _749 ? as_type<int>(_807) : as_type<int>(_185);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _673 + _811;
    bool _815 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _817 = isnan(_673);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    bool _829 = !_797;
    float _831 = _829 ? _185 : as_type<float>(_809);
    float _833 = _813 * _769;
    bool _835 = _787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _839 = _799 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _827 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _843;
    bool _847 = !_803;
    float _849 = _847 ? _189 : as_type<float>(_793);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _851;
    float _855 = -_825;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = _839 + _841;
    float _865 = fma(_845, _833, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_853, _833, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_861, _833, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _781 * _857;
    float _873 = _839;
    float _875 = _857;
    float _877 = _853;
    float _879 = _845;
    float _881 = _861;
    if (!_835)
    {
        _873 = _767;
    }
    float _883 = _873;
    float _885 = _883;
    if (!_835)
    {
        _875 = _765;
    }
    float _887 = _875;
    float _889 = _887;
    if (!_835)
    {
        _877 = _745;
    }
    float _891 = _877;
    float _893 = _891;
    if (!_835)
    {
        _879 = _747;
    }
    float _895 = _879;
    float _897 = _895;
    if (!_835)
    {
        _881 = _863;
    }
    float _899 = _881;
    bool _901 = !_835;
    float _903 = _899;
    float _905 = _837;
    if (!_901)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _787 + _909;
        float _913 = rsqrt(_783);
        float _915 = _911 * _907;
        float _917 = _863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = _915 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _913 * _929;
        float _933 = _927 + (-1.0);
        float _935 = fma(_757, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _937 = fma(_761, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _943 = _935 + _941;
        float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _947 = _937 + _945;
        float _949 = fma(_863, _927, _939);
        float _951 = _943 * _943;
        float _953 = _947 * _947;
        _903 = _949;
        _889 = _951;
        _885 = _953;
        _893 = _935;
        _897 = _937;
    }
    float _955 = _903;
    float _957 = _889;
    float _959 = _885;
    float _961 = _893;
    float _963 = _897;
    float _965 = _865 * _871;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _969 = _955 + _967;
    float _971 = _867 * _871;
    float _973 = -_781;
    float _975 = _973 + 1.0;
    float _977 = _869 * _871;
    float _979 = fma(_969, _969, _957);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _977);
    float _989 = _979 + _959;
    float _991 = _831 + 0.5;
    float _993 = -_849;
    float _995 = _993 + 0.5;
    float _997 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].x, _983);
    float _999 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].y, _985);
    float _1001 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].z, _987);
    float _1003 = sqrt(_989);
    float _1005 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1015 = _1005 * _837;
    float _1017 = _1007 * _981;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _1015;
    out.m_54.y = _1017;
    out.m_56.x = _1019;
    out.m_56.y = _1021;
    out.m_56.z = _1023;
    bool _1025 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1027 = isnan(_1003);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1033 = _1029 || _1031;
    if (!_1033)
    {
        _905 = 1.0;
    }
    float _1035 = _905;
    bool _1037 = !_1033;
    float _1039 = _1035;
    if (!_1037)
    {
        bool _1041 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1043 = isnan(_1003);
        bool _1045 = _1041 || _1043;
        bool _1047 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1049 = _1045 || _1047;
        if (!_1049)
        {
            float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1053 = _1003 + _1051;
            float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1057 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1055;
            float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1061 = _1059 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1063 = 1.0 / _1057;
            float _1065 = _1053 * _1063;
            float _1067 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1039 = _1067;
            _1069 = true;
        }
        else
        {
            bool _1071 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1073 = isnan(_1003);
            bool _1075 = _1071 || _1073;
            bool _1077 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1079 = _1075 || _1077;
            if (!_1079)
            {
                float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1083 = _1003 + _1081;
                float _1085 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1087 = _1085 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1089 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1091 = _1089 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1093 = 1.0 / _1087;
                float _1095 = _1083 * _1093;
                float _1097 = fma(_1095, _1091, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1039 = _1097;
                _1069 = true;
            }
            else
            {
                _1039 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1069 = false;
    float _1099 = _1039;
    float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1103 = _955 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1107 = _961 + _1105;
    float _1109 = fma(_1103, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1113 = _963 + _1111;
    float _1115 = fma(_1107, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1119 = fma(_1113, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1123);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1131);
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1153 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1149);
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1151);
    float _1161 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1165 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1173 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1163);
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1185 = _1175 + _1181;
    float _1187 = _1179 + _1181;
    float _1189 = _1181 * 0.5;
    float _1191 = _1185 * 0.5;
    float _1193 = _1187 * 0.5;
    float _1195 = fma(_1177, -0.5, _1189);
    out.m_35.x = _1183;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_58.x = _1191;
    out.m_58.y = _1195;
    out.m_58.z = _1193;
    out.m_58.w = _1181;
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
    bool _1069 = false;
    bool _665 = false;
    bool _561 = false;
    bool _447 = false;
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
        float _1252 = as_type<float>(_93);
        out.gl_Position.z = _1252;
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
        float _1320 = as_type<float>(_129);
        out.gl_Position.z = _1320;
    }
    if (_123)
    {
        return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = 0.0;
    float _161 = _133;
    if (!_145)
    {
        float _163 = _133 * _133;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_145;
    float _193 = _173;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _133 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _133);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_145;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _133 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _161 = _247;
    }
    float _249 = _161;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _147, _253);
    float _261 = fma(_249, _149, _255);
    float _263 = fma(_249, _151, _257);
    float _265 = fma(_259, _135, _153);
    float _267 = fma(_261, _135, _155);
    float _269 = fma(_263, _135, _157);
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
    bool _305 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _299 + _317;
    bool _321 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_299);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -_315;
    float _343 = _341 + 1.0;
    float _345 = 1.0 / _339;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _331 * _343;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _367 = 1.0 / _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = _319 * _345;
    float _375 = _357 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = fma(_379, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = _303 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_387, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_371, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _405 * _375;
    float _409 = _403 * _375;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _415 = fma(_401, _359, _411);
    float _417 = fma(_389, _359, _413);
    float _419 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].x, _415);
    float _421 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].y, _417);
    float _423 = _419 * _397;
    float _425 = _421 * _399;
    bool _427 = !_365;
    float _445;
    if (!_427)
    {
        float _429 = in.m_44.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_77);
        float _451 = 1.0 / _449;
        float _453 = _111 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    float _489 = _459 * _479;
    bool _491 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_455);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = fma(_487, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = _501 * _483;
    float _515 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = fma(_511, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = _507 * _513;
    float _525 = _515 * _513;
    float _527 = _517 * _513;
    float _529 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _531 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _535 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].x, _529);
    float _537 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].y, _531);
    float _539 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].z, _533);
    bool _541 = !_477;
    float _559;
    if (!_541)
    {
        float _543 = in.m_44.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_77);
        float _565 = 1.0 / _563;
        float _567 = _111 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    bool _571 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _573 = isnan(_569);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _589 = isnan(_569);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = 1.0 / _585;
    float _607 = -_581;
    float _609 = _607 + 1.0;
    float _611 = _597 * _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = _601 * _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _569 + _621;
    float _625 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _627 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _627 * _611;
    float _633 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _635 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _639 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[116].x, _637);
    float _643 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _629;
    out.m_46.y = _639;
    out.m_46.z = _635;
    out.m_46.w = _643;
    bool _645 = !_603;
    float _663;
    if (!_645)
    {
        float _647 = in.m_44.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_77);
        float _669 = 1.0 / _667;
        float _671 = _111 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_48.x;
    float _677 = in.m_48.y;
    float _679 = in.m_48.z;
    float _681 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _685 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_50.x;
    float _689 = in.m_50.y;
    float _691 = in.m_50.z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = _685 * _693;
    float _701 = _267 * _677;
    float _703 = _681 * _683;
    float _705 = _267 * _689;
    float _707 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _711 = fma(_265, _675, _701);
    float _713 = fma(_265, _687, _705);
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _719 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _709);
    float _721 = fma(_269, _679, _711);
    float _723 = fma(_269, _691, _713);
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _717);
    float _727 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = in.m_52.x;
    float _731 = in.m_52.y;
    float _733 = in.m_52.z;
    float _735 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = _723 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _739 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _743 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _745 = _735 + _739;
    float _747 = _737 + _741;
    bool _749 = _695 > 0.5;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _745 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _747 + _759;
    bool _763 = _697 > 0.5;
    float _765 = _757 * _757;
    float _767 = _761 * _761;
    float _769 = 1.0 / _753;
    bool _771 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _773 = isnan(_673);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _765 + _767;
    float _785 = _267 * _731;
    float _787 = sqrt(_783);
    float _789 = fma(_265, _729, _785);
    float _791 = -_189;
    int _793 = _763 ? as_type<int>(_791) : as_type<int>(_189);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = fma(_269, _733, _789);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _743);
    float _807 = -_185;
    int _809 = _749 ? as_type<int>(_807) : as_type<int>(_185);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _673 + _811;
    bool _815 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _817 = isnan(_673);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    bool _829 = !_797;
    float _831 = _829 ? _185 : as_type<float>(_809);
    float _833 = _813 * _769;
    bool _835 = _787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _839 = _799 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _827 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _843;
    bool _847 = !_803;
    float _849 = _847 ? _189 : as_type<float>(_793);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _851;
    float _855 = -_825;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = _839 + _841;
    float _865 = fma(_845, _833, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_853, _833, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_861, _833, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _781 * _857;
    float _873 = _839;
    float _875 = _857;
    float _877 = _853;
    float _879 = _845;
    float _881 = _861;
    if (!_835)
    {
        _873 = _767;
    }
    float _883 = _873;
    float _885 = _883;
    if (!_835)
    {
        _875 = _765;
    }
    float _887 = _875;
    float _889 = _887;
    if (!_835)
    {
        _877 = _745;
    }
    float _891 = _877;
    float _893 = _891;
    if (!_835)
    {
        _879 = _747;
    }
    float _895 = _879;
    float _897 = _895;
    if (!_835)
    {
        _881 = _863;
    }
    float _899 = _881;
    bool _901 = !_835;
    float _903 = _899;
    float _905 = _837;
    if (!_901)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _787 + _909;
        float _913 = rsqrt(_783);
        float _915 = _911 * _907;
        float _917 = _863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = _915 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _913 * _929;
        float _933 = _927 + (-1.0);
        float _935 = fma(_757, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _937 = fma(_761, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _943 = _935 + _941;
        float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _947 = _937 + _945;
        float _949 = fma(_863, _927, _939);
        float _951 = _943 * _943;
        float _953 = _947 * _947;
        _903 = _949;
        _889 = _951;
        _885 = _953;
        _893 = _935;
        _897 = _937;
    }
    float _955 = _903;
    float _957 = _889;
    float _959 = _885;
    float _961 = _893;
    float _963 = _897;
    float _965 = _865 * _871;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _969 = _955 + _967;
    float _971 = _867 * _871;
    float _973 = -_781;
    float _975 = _973 + 1.0;
    float _977 = _869 * _871;
    float _979 = fma(_969, _969, _957);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _977);
    float _989 = _979 + _959;
    float _991 = _831 + 0.5;
    float _993 = -_849;
    float _995 = _993 + 0.5;
    float _997 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].x, _983);
    float _999 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].y, _985);
    float _1001 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].z, _987);
    float _1003 = sqrt(_989);
    float _1005 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1015 = _1005 * _837;
    float _1017 = _1007 * _981;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _1015;
    out.m_54.y = _1017;
    out.m_56.x = _1019;
    out.m_56.y = _1021;
    out.m_56.z = _1023;
    bool _1025 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1027 = isnan(_1003);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1033 = _1029 || _1031;
    if (!_1033)
    {
        _905 = 1.0;
    }
    float _1035 = _905;
    bool _1037 = !_1033;
    float _1039 = _1035;
    if (!_1037)
    {
        bool _1041 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1043 = isnan(_1003);
        bool _1045 = _1041 || _1043;
        bool _1047 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1049 = _1045 || _1047;
        if (!_1049)
        {
            float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1053 = _1003 + _1051;
            float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1057 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1055;
            float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1061 = _1059 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1063 = 1.0 / _1057;
            float _1065 = _1053 * _1063;
            float _1067 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1039 = _1067;
            _1069 = true;
        }
        else
        {
            bool _1071 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1073 = isnan(_1003);
            bool _1075 = _1071 || _1073;
            bool _1077 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1079 = _1075 || _1077;
            if (!_1079)
            {
                float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1083 = _1003 + _1081;
                float _1085 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1087 = _1085 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1089 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1091 = _1089 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1093 = 1.0 / _1087;
                float _1095 = _1083 * _1093;
                float _1097 = fma(_1095, _1091, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1039 = _1097;
                _1069 = true;
            }
            else
            {
                _1039 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1069 = false;
    float _1099 = _1039;
    float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1103 = _955 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1107 = _961 + _1105;
    float _1109 = fma(_1103, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1113 = _963 + _1111;
    float _1115 = fma(_1107, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1119 = fma(_1113, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1123);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1131);
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1153 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1149);
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1151);
    float _1161 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1165 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1173 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1163);
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1185 = _1175 + _1181;
    float _1187 = _1179 + _1181;
    float _1189 = _1181 * 0.5;
    float _1191 = _1185 * 0.5;
    float _1193 = _1187 * 0.5;
    float _1195 = fma(_1177, -0.5, _1189);
    out.m_35.x = _1183;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_58.x = _1191;
    out.m_58.y = _1195;
    out.m_58.z = _1193;
    out.m_58.w = _1181;
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
    bool _1069 = false;
    bool _665 = false;
    bool _561 = false;
    bool _447 = false;
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
        float _1252 = as_type<float>(_93);
        out.gl_Position.z = _1252;
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
        float _1320 = as_type<float>(_129);
        out.gl_Position.z = _1320;
    }
    if (_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _135 = in.m_42.w;
    bool _137 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _139 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = in.m_37.x;
    float _149 = in.m_37.y;
    float _151 = in.m_37.z;
    float _153 = in.m_32.x;
    float _155 = in.m_32.y;
    float _157 = in.m_32.z;
    float _159 = 0.0;
    float _161 = _133;
    if (!_145)
    {
        float _163 = _133 * _133;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = _167;
    if (!_145)
    {
        float _171 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _171;
    }
    float _173 = _169;
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_145;
    float _193 = _173;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _133 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _133);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _193 = _223;
    }
    float _225 = _193;
    bool _227 = !_145;
    if (!_227)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _133 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _161 = _247;
    }
    float _249 = _161;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _253 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _255 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _257 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _259 = fma(_249, _147, _253);
    float _261 = fma(_249, _149, _255);
    float _263 = fma(_249, _151, _257);
    float _265 = fma(_259, _135, _153);
    float _267 = fma(_261, _135, _155);
    float _269 = fma(_263, _135, _157);
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
    bool _305 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _307 = isnan(_299);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _313 = _309 || _311;
    float _315 = float(_313);
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _299 + _317;
    bool _321 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _323 = isnan(_299);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -_315;
    float _343 = _341 + 1.0;
    float _345 = 1.0 / _339;
    bool _347 = _299 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_299);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = _331 * _343;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _367 = 1.0 / _335;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _369;
    float _373 = _319 * _345;
    float _375 = _357 * _363;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _381 = -_357;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _389 = fma(_379, _373, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _391 = _303 * _367;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = in.m_42.x;
    float _399 = in.m_42.y;
    float _401 = fma(_387, _373, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = fma(_371, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _405 = fma(_395, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = _405 * _375;
    float _409 = _403 * _375;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _415 = fma(_401, _359, _411);
    float _417 = fma(_389, _359, _413);
    float _419 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].x, _415);
    float _421 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[145].y, _417);
    float _423 = _419 * _397;
    float _425 = _421 * _399;
    bool _427 = !_365;
    float _445;
    if (!_427)
    {
        float _429 = in.m_44.x;
        float _431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _433 = _429 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _435 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[11].x, _111);
        float _437 = _435 * _431;
        float _439 = floor(_437);
        float _441 = -_439;
        float _443 = _437 + _441;
        _445 = _443;
        _447 = true;
    }
    else
    {
        float _449 = float(_77);
        float _451 = 1.0 / _449;
        float _453 = _111 * _451;
        _445 = _453;
    }
    _447 = false;
    float _455 = _445;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _459 = _455 + _457;
    bool _461 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _463 = isnan(_455);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    bool _477 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _479 = 1.0 / _475;
    float _481 = -_471;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _485;
    float _489 = _459 * _479;
    bool _491 = _455 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _493 = isnan(_455);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = fma(_487, _489, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _509;
    float _513 = _501 * _483;
    float _515 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _517 = fma(_511, _489, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = -_501;
    float _521 = _519 + 1.0;
    float _523 = _507 * _513;
    float _525 = _515 * _513;
    float _527 = _517 * _513;
    float _529 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].x, _525);
    float _531 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].y, _527);
    float _533 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[107].z, _523);
    float _535 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].x, _529);
    float _537 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].y, _531);
    float _539 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[108].z, _533);
    bool _541 = !_477;
    float _559;
    if (!_541)
    {
        float _543 = in.m_44.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        float _563 = float(_77);
        float _565 = 1.0 / _563;
        float _567 = _111 * _565;
        _559 = _567;
    }
    _561 = false;
    float _569 = _559;
    bool _571 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _573 = isnan(_569);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _589 = isnan(_569);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _605 = 1.0 / _585;
    float _607 = -_581;
    float _609 = _607 + 1.0;
    float _611 = _597 * _609;
    float _613 = -_597;
    float _615 = _613 + 1.0;
    float _617 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _619 = _601 * _605;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _569 + _621;
    float _625 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _627 = fma(_619, _623, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _629 = _625 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _627 * _611;
    float _633 = _537 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _635 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _631);
    float _639 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _641 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[116].x, _637);
    float _643 = _641 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _629;
    out.m_46.y = _639;
    out.m_46.z = _635;
    out.m_46.w = _643;
    bool _645 = !_603;
    float _663;
    if (!_645)
    {
        float _647 = in.m_44.x;
        float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _651 = _647 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[11].z, _111);
        float _655 = _653 * _649;
        float _657 = floor(_655);
        float _659 = -_657;
        float _661 = _655 + _659;
        _663 = _661;
        _665 = true;
    }
    else
    {
        float _667 = float(_77);
        float _669 = 1.0 / _667;
        float _671 = _111 * _669;
        _663 = _671;
    }
    _665 = false;
    float _673 = _663;
    float _675 = in.m_48.x;
    float _677 = in.m_48.y;
    float _679 = in.m_48.z;
    float _681 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _683 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    float _685 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_50.x;
    float _689 = in.m_50.y;
    float _691 = in.m_50.z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = _685 * _693;
    float _701 = _267 * _677;
    float _703 = _681 * _683;
    float _705 = _267 * _689;
    float _707 = _703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _709 = _703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _711 = fma(_265, _675, _701);
    float _713 = fma(_265, _687, _705);
    float _715 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _707);
    float _719 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _709);
    float _721 = fma(_269, _679, _711);
    float _723 = fma(_269, _691, _713);
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _717);
    float _727 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _729 = in.m_52.x;
    float _731 = in.m_52.y;
    float _733 = in.m_52.z;
    float _735 = _721 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _737 = _723 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _739 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _741 = _727 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _743 = _703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _745 = _735 + _739;
    float _747 = _737 + _741;
    bool _749 = _695 > 0.5;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _751;
    float _755 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _757 = _745 + _755;
    float _759 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _761 = _747 + _759;
    bool _763 = _697 > 0.5;
    float _765 = _757 * _757;
    float _767 = _761 * _761;
    float _769 = 1.0 / _753;
    bool _771 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _773 = isnan(_673);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = _765 + _767;
    float _785 = _267 * _731;
    float _787 = sqrt(_783);
    float _789 = fma(_265, _729, _785);
    float _791 = -_189;
    int _793 = _763 ? as_type<int>(_791) : as_type<int>(_189);
    int _795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _797 = _795 != 0;
    float _799 = fma(_269, _733, _789);
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _803 = _801 != 0;
    float _805 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _743);
    float _807 = -_185;
    int _809 = _749 ? as_type<int>(_807) : as_type<int>(_185);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _813 = _673 + _811;
    bool _815 = _673 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _817 = isnan(_673);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    bool _829 = !_797;
    float _831 = _829 ? _185 : as_type<float>(_809);
    float _833 = _813 * _769;
    bool _835 = _787 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _839 = _799 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _841 = _827 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _843;
    bool _847 = !_803;
    float _849 = _847 ? _189 : as_type<float>(_793);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _851;
    float _855 = -_825;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _859;
    float _863 = _839 + _841;
    float _865 = fma(_845, _833, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = fma(_853, _833, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _869 = fma(_861, _833, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _871 = _781 * _857;
    float _873 = _839;
    float _875 = _857;
    float _877 = _853;
    float _879 = _845;
    float _881 = _861;
    if (!_835)
    {
        _873 = _767;
    }
    float _883 = _873;
    float _885 = _883;
    if (!_835)
    {
        _875 = _765;
    }
    float _887 = _875;
    float _889 = _887;
    if (!_835)
    {
        _877 = _745;
    }
    float _891 = _877;
    float _893 = _891;
    if (!_835)
    {
        _879 = _747;
    }
    float _895 = _879;
    float _897 = _895;
    if (!_835)
    {
        _881 = _863;
    }
    float _899 = _881;
    bool _901 = !_835;
    float _903 = _899;
    float _905 = _837;
    if (!_901)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _787 + _909;
        float _913 = rsqrt(_783);
        float _915 = _911 * _907;
        float _917 = _863 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _919 = _915 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _917, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _913 * _929;
        float _933 = _927 + (-1.0);
        float _935 = fma(_757, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _937 = fma(_761, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _939 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _941 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _943 = _935 + _941;
        float _945 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _947 = _937 + _945;
        float _949 = fma(_863, _927, _939);
        float _951 = _943 * _943;
        float _953 = _947 * _947;
        _903 = _949;
        _889 = _951;
        _885 = _953;
        _893 = _935;
        _897 = _937;
    }
    float _955 = _903;
    float _957 = _889;
    float _959 = _885;
    float _961 = _893;
    float _963 = _897;
    float _965 = _865 * _871;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _969 = _955 + _967;
    float _971 = _867 * _871;
    float _973 = -_781;
    float _975 = _973 + 1.0;
    float _977 = _869 * _871;
    float _979 = fma(_969, _969, _957);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].x, _965);
    float _985 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].y, _971);
    float _987 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[123].z, _977);
    float _989 = _979 + _959;
    float _991 = _831 + 0.5;
    float _993 = -_849;
    float _995 = _993 + 0.5;
    float _997 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].x, _983);
    float _999 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].y, _985);
    float _1001 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[124].z, _987);
    float _1003 = sqrt(_989);
    float _1005 = _991 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1007 = _995 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1009 = _997 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1011 = _999 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1015 = _1005 * _837;
    float _1017 = _1007 * _981;
    float _1019 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1021 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_54.x = _1015;
    out.m_54.y = _1017;
    out.m_56.x = _1019;
    out.m_56.y = _1021;
    out.m_56.z = _1023;
    bool _1025 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1027 = isnan(_1003);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1033 = _1029 || _1031;
    if (!_1033)
    {
        _905 = 1.0;
    }
    float _1035 = _905;
    bool _1037 = !_1033;
    float _1039 = _1035;
    if (!_1037)
    {
        bool _1041 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1043 = isnan(_1003);
        bool _1045 = _1041 || _1043;
        bool _1047 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1049 = _1045 || _1047;
        if (!_1049)
        {
            float _1051 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1053 = _1003 + _1051;
            float _1055 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1057 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1055;
            float _1059 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1061 = _1059 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1063 = 1.0 / _1057;
            float _1065 = _1053 * _1063;
            float _1067 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1039 = _1067;
            _1069 = true;
        }
        else
        {
            bool _1071 = _1003 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1073 = isnan(_1003);
            bool _1075 = _1071 || _1073;
            bool _1077 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1079 = _1075 || _1077;
            if (!_1079)
            {
                float _1081 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1083 = _1003 + _1081;
                float _1085 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1087 = _1085 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1089 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1091 = _1089 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1093 = 1.0 / _1087;
                float _1095 = _1083 * _1093;
                float _1097 = fma(_1095, _1091, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1039 = _1097;
                _1069 = true;
            }
            else
            {
                _1039 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1069 = false;
    float _1099 = _1039;
    float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1103 = _955 + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1107 = _961 + _1105;
    float _1109 = fma(_1103, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1111 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1113 = _963 + _1111;
    float _1115 = fma(_1107, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1117 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1119 = fma(_1113, _1099, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1121 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1123 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1125 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1117);
    float _1127 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1129 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1121);
    float _1131 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1123);
    float _1133 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1125);
    float _1135 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1127);
    float _1137 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1129);
    float _1139 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1131);
    float _1141 = _1133 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1143 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1135);
    float _1145 = _1137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1147 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1151 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1153 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1155 = _1141 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1157 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1149);
    float _1159 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1151);
    float _1161 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1153);
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1155);
    float _1165 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1167 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1169 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1171 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1161);
    float _1173 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1163);
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1167);
    float _1177 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1169);
    float _1179 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1171);
    float _1181 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1173);
    float _1183 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1185 = _1175 + _1181;
    float _1187 = _1179 + _1181;
    float _1189 = _1181 * 0.5;
    float _1191 = _1185 * 0.5;
    float _1193 = _1187 * 0.5;
    float _1195 = fma(_1177, -0.5, _1189);
    out.m_35.x = _1183;
    out.gl_Position.x = _1175;
    out.gl_Position.y = _1177;
    out.gl_Position.z = _1179;
    out.gl_Position.w = _1181;
    out.m_58.x = _1191;
    out.m_58.y = _1195;
    out.m_58.z = _1193;
    out.m_58.w = _1181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

