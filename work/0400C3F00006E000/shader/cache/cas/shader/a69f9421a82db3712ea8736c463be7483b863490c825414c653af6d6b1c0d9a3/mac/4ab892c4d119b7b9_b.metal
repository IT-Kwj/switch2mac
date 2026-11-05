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
};

struct main0_out
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_33 [[attribute(4)]];
    float4 m_38 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _761 = false;
    bool _609 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_79);
        out.gl_Position.z = _1337;
    }
    if (!_67)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1406 = as_type<float>(_115);
        out.gl_Position.z = _1406;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = _121 * _119;
    float _139 = 0.0;
    float _141 = _125;
    if (!_135)
    {
        float _143 = _125 * _125;
        float _145 = _143 * 0.5;
        _139 = _145;
    }
    float _147 = _139;
    float _149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _151 = _147;
    if (!_135)
    {
        float _153 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _151 = _153;
    }
    float _155 = _151;
    float _157 = in.m_31.x;
    float _159 = in.m_31.y;
    float _161 = in.m_31.z;
    float _163 = _149 * 6.283185482025146484375;
    float _165 = floor(_149);
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    bool _185 = !_173;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = -_165;
    float _191 = _149 + _189;
    bool _193 = !_169;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_135;
    float _199 = _155;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _125 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _125);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_135;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _125 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _141 = _253;
    }
    float _255 = _141;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = fma(_183, 0.5, 0.5);
    float _267 = in.m_38.w;
    bool _269 = _191 < 0.5;
    float _271 = float(_269);
    bool _273 = !_259;
    int _275 = _273 ? 0 : 1;
    float _277 = in.m_26.x;
    float _279 = in.m_26.y;
    float _281 = in.m_26.z;
    float _283 = -_191;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _287 = !_179;
    int _289 = _287 ? 0 : 1;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _293 = abs(_275);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_265;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = fma(_255, _157, _291);
    int _305 = abs(_289);
    float _307 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _309 = !_263;
    int _311 = _309 ? 0 : 1;
    float _313 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _317 = abs(_311);
    float _319 = fma(_255, _159, _307);
    float _321 = float(_293);
    float _323 = fma(_255, _161, _313);
    float _325 = float(_305);
    float _327 = abs(_285);
    float _329 = _321 * _327;
    float _331 = fma(_319, _267, _279);
    float _333 = fma(_323, _267, _281);
    float _335 = float(_317);
    float _337 = fma(_325, _301, _329);
    float _339 = fma(_303, _267, _277);
    float _341 = abs(_297);
    float _343 = fma(_335, _341, _337);
    bool _345 = !_315;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_63);
        float _367 = 1.0 / _365;
        float _369 = _97 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _371 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _371 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = 1.0 / _383;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _391;
    float _403 = 1.0 / _395;
    float _405 = _375 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _371 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _371 + _411;
    float _415 = 1.0 / _387;
    float _417 = _409 * _401;
    bool _419 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _421 = isnan(_371);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _433 = isnan(_371);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -_429;
    float _445 = _443 + 1.0;
    float _447 = _413 * _403;
    bool _449 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _451 = isnan(_371);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = _459 * _445;
    float _467 = -_459;
    float _469 = _467 + 1.0;
    float _471 = _379 * _415;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_463, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _479 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_371);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_475, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _441 * _469;
    float _507 = fma(_493, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_499, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_371);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _489 * _503;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    float _529 = in.m_38.x;
    float _531 = in.m_38.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    float _537 = _521 * _527;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _543;
    float _547 = fma(_535, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = _477 * _537;
    float _551 = _495 * _537;
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_557, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_507, _523, _559);
    float _571 = fma(_509, _523, _561);
    float _573 = fma(_565, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_553, _505, _569);
    float _577 = fma(_547, _505, _571);
    float _579 = fma(_573, _465, _575);
    float _581 = fma(_567, _465, _577);
    float _583 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    float _587 = _583 * _529;
    float _589 = _585 * _531;
    bool _591 = !_399;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = isnan(_617);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_617);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = 1.0 / _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    float _657 = -_633;
    float _659 = _657 + 1.0;
    bool _661 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _663 = isnan(_617);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _675 = _649 * _659;
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _637;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = _655 * _651;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _617 + _693;
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_671;
    float _701 = _699 + 1.0;
    float _703 = _685 * _681;
    float _705 = _697 * _675;
    float _707 = _633 * _701;
    float _709 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _713 = fma(_709, _707, _711);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _733 = _723 * _117;
    out.m_40.x = _727;
    out.m_40.y = _729;
    out.m_40.z = _725;
    out.m_40.w = _731;
    float _735 = trunc(_733);
    int _737 = int(_735);
    int _739 = _737 << 4;
    int _741 = _739 + 1968;
    bool _743 = !_673;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _747 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_63);
        float _765 = 1.0 / _763;
        float _767 = _97 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = in.m_33.z;
    float _773 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _779 = in.m_33.w;
    float _781 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _783 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    float _785 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _777);
    float _787 = in.m_33.y;
    float _789 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _781);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _793 = _791 != 0;
    float _795 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _785);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _801);
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    bool _819 = _771 > 0.5;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _825 = _779 > 0.5;
    float _827 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _829 = _117 > 0.5;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _837 = -_821;
    float _839 = fma(_827, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _843 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _845 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _847 = isnan(_769);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _861;
    float _865 = 1.0 / _833;
    float _867 = fma(_843, -2.0, _841);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _769 + _869;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    bool _877 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _879 = isnan(_769);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _891 = -_817;
    float _893 = _891 + 1.0;
    int _895 = _741 + 8;
    uint _898 = uint(int(uint(_895) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _910 = _343 * _587;
    uint _912 = uint(int(uint(_741) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[int(_922)][_924];
    float _928 = _863 * _865;
    float _930 = -_195;
    int _932 = _829 ? as_type<int>(_930) : as_type<int>(_195);
    bool _934 = _787 > 0.5;
    float _936 = fma(_928, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _938 = _887 * _875;
    float _940 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _906);
    float _942 = -_187;
    int _944 = _934 ? as_type<int>(_942) : as_type<int>(_187);
    float _946 = _936 * _938;
    float _948 = -_887;
    float _950 = _948 + 1.0;
    float _952 = _795 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _940);
    bool _956 = !_793;
    float _958 = _956 ? _195 : as_type<float>(_932);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _946);
    float _962 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _952 + _964;
    bool _968 = !_799;
    float _970 = _968 ? _187 : as_type<float>(_944);
    float _972 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _962 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _980 = _958 + 0.5;
    float _982 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _823 + _984;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _990 = _970 + (-0.5);
    float _992 = fma(_972, _980, _859);
    float _994 = -_954;
    float _996 = _994 + 1.0;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _988);
    float _1000 = -_982;
    float _1002 = -_889;
    float _1004 = fma(_1000, _990, _1002);
    float _1006 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[132].x, _960);
    float _1008 = _966 * _966;
    float _1010 = -_187;
    int _1012 = _825 ? as_type<int>(_1010) : as_type<int>(_187);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1016 = _998 >= 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1020 = !_811;
    float _1022 = _1020 ? _187 : as_type<float>(_1012);
    float _1024 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1026 = -_1022;
    float _1028 = _1026 + 0.5;
    float _1030 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _819 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _926 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1038 = _1004;
    int _1040 = as_type<int>(_1024);
    if (_1016)
    {
        out.m_29.x = 0.0;
    }
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1044 = !_805;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_893;
    float _1050 = fma(_958, _1048, _992);
    float _1052 = fma(_976, _976, _1008);
    float _1054 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1046 + 0.5;
    float _1060 = fma(_970, _996, _1004);
    float _1062 = fma(_986, _986, _1052);
    if (_1016)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1064 = _1038;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1068 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = rsqrt(_1062);
    float _1072 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1066 * _908;
    float _1076 = _1068 * _1014;
    float _1078 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1016)
    {
        float _1080 = _1064 * 5.0;
        _1040 = as_type<int>(_1080);
    }
    int _1082 = _1040;
    out.m_42.x = _1042;
    out.m_42.y = _1056;
    out.m_42.z = _1072;
    out.m_42.w = _1018;
    out.m_44.x = _1050;
    out.m_44.y = _1060;
    out.m_44.z = _1074;
    out.m_44.w = _1076;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2983 = as_type<float>(_1082);
        out.gl_Position.z = _2983;
    }
    float _1084 = _1078 * _1070;
    float _1086 = _976 * _1084;
    float _1088 = _966 * _1084;
    if (_1016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1090 = -_1088;
    float _1092 = _952 + _1090;
    float _1094 = _986 * _1084;
    float _1096 = -_1086;
    float _1098 = _962 + _1096;
    float _1100 = -_1088;
    float _1102 = _966 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1092 + _1104;
    float _1108 = -_1094;
    float _1110 = _823 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1098 + _1112;
    float _1116 = -_1086;
    float _1118 = _976 + _1116;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1124 = _1110 + _1122;
    float _1126 = _1102 * _1102;
    float _1128 = -_1094;
    float _1130 = _986 + _1128;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1120);
    float _1134 = _343 * _589;
    float _1136 = fma(_1118, _1118, _1126);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1132);
    float _1140 = fma(_1130, _1130, _1136);
    bool _1142 = _1138 >= 0.0;
    float _1144 = sqrt(_1140);
    float _1146 = _1124;
    if (_1142)
    {
        _1146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1148 = _1146;
    int _1150 = as_type<int>(_1148);
    if (_1142)
    {
        out.m_29.x = 0.0;
    }
    if (_1142)
    {
        float _1152 = _1148 * 5.0;
        _1150 = as_type<int>(_1152);
    }
    int _1154 = _1150;
    float _1156 = _1070 * _1144;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_1154);
        out.gl_Position.z = _3110;
    }
    if (_1142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1158 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1164 = _1054 * _1156;
    float _1166 = _1156 * _1158;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1170 = _1168 * 0.5;
    float _1172 = _1162 * _1164;
    float _1174 = _1160 * _1166;
    float _1176 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1184);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1186);
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1200 = _952 + _1194;
    float _1202 = _962 + _1196;
    float _1204 = _823 + _1198;
    float _1206 = -_1088;
    float _1208 = _1206 + _1200;
    float _1210 = -_1086;
    float _1212 = _1210 + _1202;
    float _1214 = -_1094;
    float _1216 = _1214 + _1204;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1260);
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1270);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1272);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1274;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1280;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _761 = false;
    bool _609 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_79);
        out.gl_Position.z = _1337;
    }
    if (!_67)
    {
        return out;
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1406 = as_type<float>(_115);
        out.gl_Position.z = _1406;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = _121 * _119;
    float _139 = 0.0;
    float _141 = _125;
    if (!_135)
    {
        float _143 = _125 * _125;
        float _145 = _143 * 0.5;
        _139 = _145;
    }
    float _147 = _139;
    float _149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _151 = _147;
    if (!_135)
    {
        float _153 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _151 = _153;
    }
    float _155 = _151;
    float _157 = in.m_31.x;
    float _159 = in.m_31.y;
    float _161 = in.m_31.z;
    float _163 = _149 * 6.283185482025146484375;
    float _165 = floor(_149);
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    bool _185 = !_173;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = -_165;
    float _191 = _149 + _189;
    bool _193 = !_169;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_135;
    float _199 = _155;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _125 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _125);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_135;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _125 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _141 = _253;
    }
    float _255 = _141;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = fma(_183, 0.5, 0.5);
    float _267 = in.m_38.w;
    bool _269 = _191 < 0.5;
    float _271 = float(_269);
    bool _273 = !_259;
    int _275 = _273 ? 0 : 1;
    float _277 = in.m_26.x;
    float _279 = in.m_26.y;
    float _281 = in.m_26.z;
    float _283 = -_191;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _287 = !_179;
    int _289 = _287 ? 0 : 1;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _293 = abs(_275);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_265;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = fma(_255, _157, _291);
    int _305 = abs(_289);
    float _307 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _309 = !_263;
    int _311 = _309 ? 0 : 1;
    float _313 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _317 = abs(_311);
    float _319 = fma(_255, _159, _307);
    float _321 = float(_293);
    float _323 = fma(_255, _161, _313);
    float _325 = float(_305);
    float _327 = abs(_285);
    float _329 = _321 * _327;
    float _331 = fma(_319, _267, _279);
    float _333 = fma(_323, _267, _281);
    float _335 = float(_317);
    float _337 = fma(_325, _301, _329);
    float _339 = fma(_303, _267, _277);
    float _341 = abs(_297);
    float _343 = fma(_335, _341, _337);
    bool _345 = !_315;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_63);
        float _367 = 1.0 / _365;
        float _369 = _97 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _371 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _371 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = 1.0 / _383;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _391;
    float _403 = 1.0 / _395;
    float _405 = _375 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _371 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _371 + _411;
    float _415 = 1.0 / _387;
    float _417 = _409 * _401;
    bool _419 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _421 = isnan(_371);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _433 = isnan(_371);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -_429;
    float _445 = _443 + 1.0;
    float _447 = _413 * _403;
    bool _449 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _451 = isnan(_371);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = _459 * _445;
    float _467 = -_459;
    float _469 = _467 + 1.0;
    float _471 = _379 * _415;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_463, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _479 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_371);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_475, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _441 * _469;
    float _507 = fma(_493, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_499, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_371);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _489 * _503;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    float _529 = in.m_38.x;
    float _531 = in.m_38.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    float _537 = _521 * _527;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _543;
    float _547 = fma(_535, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = _477 * _537;
    float _551 = _495 * _537;
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_557, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_507, _523, _559);
    float _571 = fma(_509, _523, _561);
    float _573 = fma(_565, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_553, _505, _569);
    float _577 = fma(_547, _505, _571);
    float _579 = fma(_573, _465, _575);
    float _581 = fma(_567, _465, _577);
    float _583 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    float _587 = _583 * _529;
    float _589 = _585 * _531;
    bool _591 = !_399;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = isnan(_617);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_617);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = 1.0 / _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    float _657 = -_633;
    float _659 = _657 + 1.0;
    bool _661 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _663 = isnan(_617);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _675 = _649 * _659;
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _637;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = _655 * _651;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _617 + _693;
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_671;
    float _701 = _699 + 1.0;
    float _703 = _685 * _681;
    float _705 = _697 * _675;
    float _707 = _633 * _701;
    float _709 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _713 = fma(_709, _707, _711);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _733 = _723 * _117;
    out.m_40.x = _727;
    out.m_40.y = _729;
    out.m_40.z = _725;
    out.m_40.w = _731;
    float _735 = trunc(_733);
    int _737 = int(_735);
    int _739 = _737 << 4;
    int _741 = _739 + 1968;
    bool _743 = !_673;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _747 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_63);
        float _765 = 1.0 / _763;
        float _767 = _97 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = in.m_33.z;
    float _773 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _779 = in.m_33.w;
    float _781 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _783 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    float _785 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _777);
    float _787 = in.m_33.y;
    float _789 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _781);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _793 = _791 != 0;
    float _795 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _785);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _801);
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    bool _819 = _771 > 0.5;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _825 = _779 > 0.5;
    float _827 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _829 = _117 > 0.5;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _837 = -_821;
    float _839 = fma(_827, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _843 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _845 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _847 = isnan(_769);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _861;
    float _865 = 1.0 / _833;
    float _867 = fma(_843, -2.0, _841);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _769 + _869;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    bool _877 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _879 = isnan(_769);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _891 = -_817;
    float _893 = _891 + 1.0;
    int _895 = _741 + 8;
    uint _898 = uint(int(uint(_895) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _910 = _343 * _587;
    uint _912 = uint(int(uint(_741) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[int(_922)][_924];
    float _928 = _863 * _865;
    float _930 = -_195;
    int _932 = _829 ? as_type<int>(_930) : as_type<int>(_195);
    bool _934 = _787 > 0.5;
    float _936 = fma(_928, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _938 = _887 * _875;
    float _940 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _906);
    float _942 = -_187;
    int _944 = _934 ? as_type<int>(_942) : as_type<int>(_187);
    float _946 = _936 * _938;
    float _948 = -_887;
    float _950 = _948 + 1.0;
    float _952 = _795 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _940);
    bool _956 = !_793;
    float _958 = _956 ? _195 : as_type<float>(_932);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _946);
    float _962 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _952 + _964;
    bool _968 = !_799;
    float _970 = _968 ? _187 : as_type<float>(_944);
    float _972 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _962 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _980 = _958 + 0.5;
    float _982 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _823 + _984;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _990 = _970 + (-0.5);
    float _992 = fma(_972, _980, _859);
    float _994 = -_954;
    float _996 = _994 + 1.0;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _988);
    float _1000 = -_982;
    float _1002 = -_889;
    float _1004 = fma(_1000, _990, _1002);
    float _1006 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[132].x, _960);
    float _1008 = _966 * _966;
    float _1010 = -_187;
    int _1012 = _825 ? as_type<int>(_1010) : as_type<int>(_187);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1016 = _998 >= 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1020 = !_811;
    float _1022 = _1020 ? _187 : as_type<float>(_1012);
    float _1024 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1026 = -_1022;
    float _1028 = _1026 + 0.5;
    float _1030 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _819 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _926 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1038 = _1004;
    int _1040 = as_type<int>(_1024);
    if (_1016)
    {
        out.m_29.x = 0.0;
    }
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1044 = !_805;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_893;
    float _1050 = fma(_958, _1048, _992);
    float _1052 = fma(_976, _976, _1008);
    float _1054 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1046 + 0.5;
    float _1060 = fma(_970, _996, _1004);
    float _1062 = fma(_986, _986, _1052);
    if (_1016)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1064 = _1038;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1068 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = rsqrt(_1062);
    float _1072 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1066 * _908;
    float _1076 = _1068 * _1014;
    float _1078 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1016)
    {
        float _1080 = _1064 * 5.0;
        _1040 = as_type<int>(_1080);
    }
    int _1082 = _1040;
    out.m_42.x = _1042;
    out.m_42.y = _1056;
    out.m_42.z = _1072;
    out.m_42.w = _1018;
    out.m_44.x = _1050;
    out.m_44.y = _1060;
    out.m_44.z = _1074;
    out.m_44.w = _1076;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2983 = as_type<float>(_1082);
        out.gl_Position.z = _2983;
    }
    float _1084 = _1078 * _1070;
    float _1086 = _976 * _1084;
    float _1088 = _966 * _1084;
    if (_1016)
    {
        return out;
    }
    float _1090 = -_1088;
    float _1092 = _952 + _1090;
    float _1094 = _986 * _1084;
    float _1096 = -_1086;
    float _1098 = _962 + _1096;
    float _1100 = -_1088;
    float _1102 = _966 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1092 + _1104;
    float _1108 = -_1094;
    float _1110 = _823 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1098 + _1112;
    float _1116 = -_1086;
    float _1118 = _976 + _1116;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1124 = _1110 + _1122;
    float _1126 = _1102 * _1102;
    float _1128 = -_1094;
    float _1130 = _986 + _1128;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1120);
    float _1134 = _343 * _589;
    float _1136 = fma(_1118, _1118, _1126);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1132);
    float _1140 = fma(_1130, _1130, _1136);
    bool _1142 = _1138 >= 0.0;
    float _1144 = sqrt(_1140);
    float _1146 = _1124;
    if (_1142)
    {
        _1146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1148 = _1146;
    int _1150 = as_type<int>(_1148);
    if (_1142)
    {
        out.m_29.x = 0.0;
    }
    if (_1142)
    {
        float _1152 = _1148 * 5.0;
        _1150 = as_type<int>(_1152);
    }
    int _1154 = _1150;
    float _1156 = _1070 * _1144;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_1154);
        out.gl_Position.z = _3110;
    }
    if (_1142)
    {
        return out;
    }
    float _1158 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1164 = _1054 * _1156;
    float _1166 = _1156 * _1158;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1170 = _1168 * 0.5;
    float _1172 = _1162 * _1164;
    float _1174 = _1160 * _1166;
    float _1176 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1184);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1186);
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1200 = _952 + _1194;
    float _1202 = _962 + _1196;
    float _1204 = _823 + _1198;
    float _1206 = -_1088;
    float _1208 = _1206 + _1200;
    float _1210 = -_1086;
    float _1212 = _1210 + _1202;
    float _1214 = -_1094;
    float _1216 = _1214 + _1204;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1260);
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1270);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1272);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1274;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1280;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _761 = false;
    bool _609 = false;
    bool _363 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_26.w;
    float _60 = trunc(_58);
    int _63 = int(_60);
    bool _67 = _63 >= 1;
    float _69 = 0.0;
    if (!_67)
    {
        _69 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _71 = _69;
    float _73 = _71;
    if (!_67)
    {
        out.m_29.x = 0.0;
    }
    int _75 = 0;
    if (!_67)
    {
        float _77 = _71 * 5.0;
        _75 = as_type<int>(_77);
    }
    int _79 = _75;
    int _81 = _79;
    if (!_67)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1337 = as_type<float>(_79);
        out.gl_Position.z = _1337;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _83 = in.m_31.w;
    bool _85 = _83 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _87 = isnan(_83);
    bool _89 = _85 || _87;
    bool _91 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _93 = _89 || _91;
    float _95 = -_83;
    float _97 = _95 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_93)
    {
        float _99 = float(_63);
        _73 = _99;
    }
    float _101 = _73;
    bool _103 = _97 >= _101;
    bool _105 = !_93;
    bool _107 = _103 || _105;
    float _109 = _101;
    if (_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    if (_107)
    {
        out.m_29.x = 0.0;
    }
    if (_107)
    {
        float _113 = _111 * 5.0;
        _81 = as_type<int>(_113);
    }
    int _115 = _81;
    if (_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1406 = as_type<float>(_115);
        out.gl_Position.z = _1406;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_33.x;
    float _119 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _121 = _97 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _127 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _129 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _131 = _127 || _129;
    bool _133 = isnan(1.0);
    bool _135 = _131 || _133;
    float _137 = _121 * _119;
    float _139 = 0.0;
    float _141 = _125;
    if (!_135)
    {
        float _143 = _125 * _125;
        float _145 = _143 * 0.5;
        _139 = _145;
    }
    float _147 = _139;
    float _149 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[20].x, _137);
    float _151 = _147;
    if (!_135)
    {
        float _153 = _147 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _151 = _153;
    }
    float _155 = _151;
    float _157 = in.m_31.x;
    float _159 = in.m_31.y;
    float _161 = in.m_31.z;
    float _163 = _149 * 6.283185482025146484375;
    float _165 = floor(_149);
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    float _175 = _163 * 0.15915493667125701904296875;
    int _177 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _179 = _177 != 0;
    float _181 = _175 * 6.283185482025146484375;
    float _183 = cos(_181);
    bool _185 = !_173;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = -_165;
    float _191 = _149 + _189;
    bool _193 = !_169;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_135;
    float _199 = _155;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _125 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _125);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_135;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _125 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _141 = _253;
    }
    float _255 = _141;
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = fma(_183, 0.5, 0.5);
    float _267 = in.m_38.w;
    bool _269 = _191 < 0.5;
    float _271 = float(_269);
    bool _273 = !_259;
    int _275 = _273 ? 0 : 1;
    float _277 = in.m_26.x;
    float _279 = in.m_26.y;
    float _281 = in.m_26.z;
    float _283 = -_191;
    float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _287 = !_179;
    int _289 = _287 ? 0 : 1;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _293 = abs(_275);
    float _295 = -_271;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_265;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = fma(_255, _157, _291);
    int _305 = abs(_289);
    float _307 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _309 = !_263;
    int _311 = _309 ? 0 : 1;
    float _313 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _317 = abs(_311);
    float _319 = fma(_255, _159, _307);
    float _321 = float(_293);
    float _323 = fma(_255, _161, _313);
    float _325 = float(_305);
    float _327 = abs(_285);
    float _329 = _321 * _327;
    float _331 = fma(_319, _267, _279);
    float _333 = fma(_323, _267, _281);
    float _335 = float(_317);
    float _337 = fma(_325, _301, _329);
    float _339 = fma(_303, _267, _277);
    float _341 = abs(_297);
    float _343 = fma(_335, _341, _337);
    bool _345 = !_315;
    float _361;
    if (!_345)
    {
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _349 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_63);
        float _367 = 1.0 / _365;
        float _369 = _97 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _371 + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _371 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = 1.0 / _383;
    bool _399 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _401 = 1.0 / _391;
    float _403 = 1.0 / _395;
    float _405 = _375 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _371 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _371 + _411;
    float _415 = 1.0 / _387;
    float _417 = _409 * _401;
    bool _419 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _421 = isnan(_371);
    bool _423 = _419 || _421;
    bool _425 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _427 = _423 || _425;
    float _429 = float(_427);
    bool _431 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _433 = isnan(_371);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -_429;
    float _445 = _443 + 1.0;
    float _447 = _413 * _403;
    bool _449 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _451 = isnan(_371);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _461;
    float _465 = _459 * _445;
    float _467 = -_459;
    float _469 = _467 + 1.0;
    float _471 = _379 * _415;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_463, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _479 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _481 = isnan(_371);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _495 = fma(_475, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = -_441;
    float _503 = _501 + 1.0;
    float _505 = _441 * _469;
    float _507 = fma(_493, _471, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _509 = fma(_499, _471, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _511 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_371);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _489 * _503;
    float _525 = -_489;
    float _527 = _525 + 1.0;
    float _529 = in.m_38.x;
    float _531 = in.m_38.y;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _533;
    float _537 = _521 * _527;
    float _539 = -_521;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _543;
    float _547 = fma(_535, _417, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _549 = _477 * _537;
    float _551 = _495 * _537;
    float _553 = fma(_545, _417, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _559 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[143].y, _551);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _567 = fma(_557, _447, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _569 = fma(_507, _523, _559);
    float _571 = fma(_509, _523, _561);
    float _573 = fma(_565, _447, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _575 = fma(_553, _505, _569);
    float _577 = fma(_547, _505, _571);
    float _579 = fma(_573, _465, _575);
    float _581 = fma(_567, _465, _577);
    float _583 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].x, _579);
    float _585 = fma(_429, (*spvDescriptorSet0.vp_c9)._m0[147].y, _581);
    float _587 = _583 * _529;
    float _589 = _585 * _531;
    bool _591 = !_399;
    float _607;
    if (!_591)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _595 = _117 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _597 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _599 = _597 * _593;
        float _601 = floor(_599);
        float _603 = -_601;
        float _605 = _599 + _603;
        _607 = _605;
        _609 = true;
    }
    else
    {
        float _611 = float(_63);
        float _613 = 1.0 / _611;
        float _615 = _97 * _613;
        _607 = _615;
    }
    _609 = false;
    float _617 = _607;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _623 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = isnan(_617);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _639 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _641 = isnan(_617);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = 1.0 / _621;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    float _657 = -_633;
    float _659 = _657 + 1.0;
    bool _661 = _617 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _663 = isnan(_617);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _675 = _649 * _659;
    float _677 = -_649;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _637;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = _655 * _651;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _695 = _617 + _693;
    float _697 = fma(_687, _691, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = -_671;
    float _701 = _699 + 1.0;
    float _703 = _685 * _681;
    float _705 = _697 * _675;
    float _707 = _633 * _701;
    float _709 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _713 = fma(_709, _707, _711);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _717 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _723 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _731 = _717 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _733 = _723 * _117;
    out.m_40.x = _727;
    out.m_40.y = _729;
    out.m_40.z = _725;
    out.m_40.w = _731;
    float _735 = trunc(_733);
    int _737 = int(_735);
    int _739 = _737 << 4;
    int _741 = _739 + 1968;
    bool _743 = !_673;
    float _759;
    if (!_743)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _747 = _117 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _749 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[11].w, _97);
        float _751 = _749 * _745;
        float _753 = floor(_751);
        float _755 = -_753;
        float _757 = _751 + _755;
        _759 = _757;
        _761 = true;
    }
    else
    {
        float _763 = float(_63);
        float _765 = 1.0 / _763;
        float _767 = _97 * _765;
        _759 = _767;
    }
    _761 = false;
    float _769 = _759;
    float _771 = in.m_33.z;
    float _773 = _331 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _775 = _331 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _777 = _331 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _779 = in.m_33.w;
    float _781 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[4].x, _773);
    float _783 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[5].x, _775);
    float _785 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[6].x, _777);
    float _787 = in.m_33.y;
    float _789 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[4].z, _781);
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _793 = _791 != 0;
    float _795 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[5].z, _783);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _799 = _797 != 0;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _805 = _803 != 0;
    float _807 = fma(_333, (*spvDescriptorSet0.vp_c10)._m0[6].z, _785);
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _811 = _809 != 0;
    float _813 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[78].z, _801);
    float _815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _817 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].z, _813);
    bool _819 = _771 > 0.5;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _823 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _825 = _779 > 0.5;
    float _827 = _117 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _829 = _117 > 0.5;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _837 = -_821;
    float _839 = fma(_827, 2.0, _837);
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _843 = _787 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _845 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _847 = isnan(_769);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[76].x, _839);
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _861;
    float _865 = 1.0 / _833;
    float _867 = fma(_843, -2.0, _841);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _871 = _769 + _869;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    bool _877 = _769 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _879 = isnan(_769);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[76].y, _867);
    float _891 = -_817;
    float _893 = _891 + 1.0;
    int _895 = _741 + 8;
    uint _898 = uint(int(uint(_895) >> uint(2)));
    uint _900 = uint(int(uint(int(_898)) >> uint(2)));
    int _902 = int(_898) & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _910 = _343 * _587;
    uint _912 = uint(int(uint(_741) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    int _920 = int(_912) + 1;
    uint _922 = uint(int(uint(_920) >> uint(2)));
    int _924 = _920 & 3;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[int(_922)][_924];
    float _928 = _863 * _865;
    float _930 = -_195;
    int _932 = _829 ? as_type<int>(_930) : as_type<int>(_195);
    bool _934 = _787 > 0.5;
    float _936 = fma(_928, _871, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _938 = _887 * _875;
    float _940 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[78].w, _906);
    float _942 = -_187;
    int _944 = _934 ? as_type<int>(_942) : as_type<int>(_187);
    float _946 = _936 * _938;
    float _948 = -_887;
    float _950 = _948 + 1.0;
    float _952 = _795 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _954 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[77].w, _940);
    bool _956 = !_793;
    float _958 = _956 ? _195 : as_type<float>(_932);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _946);
    float _962 = _789 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _952 + _964;
    bool _968 = !_799;
    float _970 = _968 ? _187 : as_type<float>(_944);
    float _972 = _815 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _962 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _980 = _958 + 0.5;
    float _982 = _835 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _986 = _823 + _984;
    float _988 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _990 = _970 + (-0.5);
    float _992 = fma(_972, _980, _859);
    float _994 = -_954;
    float _996 = _994 + 1.0;
    float _998 = fma(_986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _988);
    float _1000 = -_982;
    float _1002 = -_889;
    float _1004 = fma(_1000, _990, _1002);
    float _1006 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[132].x, _960);
    float _1008 = _966 * _966;
    float _1010 = -_187;
    int _1012 = _825 ? as_type<int>(_1010) : as_type<int>(_187);
    float _1014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1016 = _998 >= 0.0;
    float _1018 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1020 = !_811;
    float _1022 = _1020 ? _187 : as_type<float>(_1012);
    float _1024 = _904 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1026 = -_1022;
    float _1028 = _1026 + 0.5;
    float _1030 = _918 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _819 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _926 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1038 = _1004;
    int _1040 = as_type<int>(_1024);
    if (_1016)
    {
        out.m_29.x = 0.0;
    }
    float _1042 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1044 = !_805;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_893;
    float _1050 = fma(_958, _1048, _992);
    float _1052 = fma(_976, _976, _1008);
    float _1054 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1056 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1058 = _1046 + 0.5;
    float _1060 = fma(_970, _996, _1004);
    float _1062 = fma(_986, _986, _1052);
    if (_1016)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1064 = _1038;
    float _1066 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1068 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = rsqrt(_1062);
    float _1072 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1066 * _908;
    float _1076 = _1068 * _1014;
    float _1078 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    if (_1016)
    {
        float _1080 = _1064 * 5.0;
        _1040 = as_type<int>(_1080);
    }
    int _1082 = _1040;
    out.m_42.x = _1042;
    out.m_42.y = _1056;
    out.m_42.z = _1072;
    out.m_42.w = _1018;
    out.m_44.x = _1050;
    out.m_44.y = _1060;
    out.m_44.z = _1074;
    out.m_44.w = _1076;
    if (_1016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2983 = as_type<float>(_1082);
        out.gl_Position.z = _2983;
    }
    float _1084 = _1078 * _1070;
    float _1086 = _976 * _1084;
    float _1088 = _966 * _1084;
    if (_1016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1090 = -_1088;
    float _1092 = _952 + _1090;
    float _1094 = _986 * _1084;
    float _1096 = -_1086;
    float _1098 = _962 + _1096;
    float _1100 = -_1088;
    float _1102 = _966 + _1100;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1092 + _1104;
    float _1108 = -_1094;
    float _1110 = _823 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1114 = _1098 + _1112;
    float _1116 = -_1086;
    float _1118 = _976 + _1116;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1124 = _1110 + _1122;
    float _1126 = _1102 * _1102;
    float _1128 = -_1094;
    float _1130 = _986 + _1128;
    float _1132 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1120);
    float _1134 = _343 * _589;
    float _1136 = fma(_1118, _1118, _1126);
    float _1138 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1132);
    float _1140 = fma(_1130, _1130, _1136);
    bool _1142 = _1138 >= 0.0;
    float _1144 = sqrt(_1140);
    float _1146 = _1124;
    if (_1142)
    {
        _1146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1148 = _1146;
    int _1150 = as_type<int>(_1148);
    if (_1142)
    {
        out.m_29.x = 0.0;
    }
    if (_1142)
    {
        float _1152 = _1148 * 5.0;
        _1150 = as_type<int>(_1152);
    }
    int _1154 = _1150;
    float _1156 = _1070 * _1144;
    if (_1142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3110 = as_type<float>(_1154);
        out.gl_Position.z = _3110;
    }
    if (_1142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1158 = _1134 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1162 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1164 = _1054 * _1156;
    float _1166 = _1156 * _1158;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1170 = _1168 * 0.5;
    float _1172 = _1162 * _1164;
    float _1174 = _1160 * _1166;
    float _1176 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1182 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1178);
    float _1186 = fma(_1172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1180);
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1184);
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1186);
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1200 = _952 + _1194;
    float _1202 = _962 + _1196;
    float _1204 = _823 + _1198;
    float _1206 = -_1088;
    float _1208 = _1206 + _1200;
    float _1210 = -_1086;
    float _1212 = _1210 + _1202;
    float _1214 = -_1094;
    float _1216 = _1214 + _1204;
    float _1218 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1220 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1222 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1224 = _1208 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1226 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1218);
    float _1228 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1220);
    float _1230 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1222);
    float _1232 = fma(_1212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1224);
    float _1234 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1226);
    float _1236 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1228);
    float _1238 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1230);
    float _1240 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1232);
    float _1242 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1244 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1246 = _1238 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1248 = _1240 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1252 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1254 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1256 = _1242 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1258 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1250);
    float _1260 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1252);
    float _1262 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1254);
    float _1264 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1256);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1258);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1260);
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1262);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1266);
    float _1276 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1268);
    float _1278 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1270);
    float _1280 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1272);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1276;
    out.gl_Position.y = _1274;
    out.gl_Position.z = _1278;
    out.gl_Position.w = _1280;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

