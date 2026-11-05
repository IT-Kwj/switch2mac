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
    float4 m_37 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(2)]];
    float4 m_31 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _575 = false;
    bool _369 = false;
    bool _259 = false;
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
        float _1072 = as_type<float>(_79);
        out.gl_Position.z = _1072;
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
        float _1141 = as_type<float>(_115);
        out.gl_Position.z = _1141;
    }
    if (_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_33.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = in.m_31.x;
    float _133 = in.m_31.y;
    float _135 = in.m_31.z;
    float _137 = in.m_26.x;
    float _139 = in.m_26.y;
    float _141 = in.m_26.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_129)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_129;
    float _161 = _157;
    if (!_159)
    {
        float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _165 = log2(_163);
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _169 = _167 + 1.0;
        float _171 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = _119 * _165;
        float _175 = 1.0 / _169;
        float _177 = _171 * 0.693147182464599609375;
        float _179 = exp2(_173);
        float _181 = 1.0 / _177;
        float _183 = _179 + (-1.0);
        float _185 = -_183;
        float _187 = fma(_185, _181, _119);
        float _189 = _187 * _175;
        float _191 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _191;
    }
    float _193 = _161;
    bool _195 = !_129;
    if (!_195)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = 1.0 / _203;
        float _207 = _119 * _199;
        float _209 = exp2(_207);
        float _211 = -_209;
        float _213 = _211 + 1.0;
        float _215 = _213 * _205;
        _145 = _215;
    }
    float _217 = _145;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _225 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _227 = fma(_217, _131, _221);
    float _229 = fma(_217, _133, _223);
    float _231 = fma(_217, _135, _225);
    float _233 = fma(_227, _117, _137);
    float _235 = fma(_229, _117, _139);
    float _237 = fma(_231, _117, _141);
    bool _239 = !_219;
    float _257;
    if (!_239)
    {
        float _241 = in.m_35.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_63);
        float _263 = 1.0 / _261;
        float _265 = _97 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = in.m_33.x;
    float _287 = in.m_33.y;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -_283;
    float _295 = _293 + 1.0;
    bool _297 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_267);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _291;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = _307 * _295;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = _271 * _311;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_315, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _331 * _317;
    float _335 = _329 * _317;
    float _337 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _339 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _341 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _337);
    float _343 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _339);
    float _345 = _341 * _287;
    float _347 = _343 * _285;
    bool _349 = !_309;
    float _367;
    if (!_349)
    {
        float _351 = in.m_35.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_63);
        float _373 = 1.0 / _371;
        float _375 = _97 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _381 = _377 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = isnan(_377);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _385;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_377);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _427 = 1.0 / _393;
    float _429 = _389 * _407;
    bool _431 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_377);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _411;
    float _445 = -_405;
    float _447 = _445 + 1.0;
    float _449 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _455 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _457 = isnan(_377);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _441 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _477 = 1.0 / _453;
    float _479 = -_465;
    float _481 = _479 + 1.0;
    float _483 = _423 * _469;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _485;
    float _489 = _475 * _427;
    float _491 = _405 * _481;
    float _493 = _449 * _483;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _377 + _495;
    float _499 = -_423;
    float _501 = _499 + 1.0;
    bool _503 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_377);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _443;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _377 + _521;
    float _525 = fma(_489, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _529 = -_513;
    float _531 = _529 + 1.0;
    float _533 = _519 * _477;
    float _535 = fma(_515, _523, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _539 = _377 + _537;
    float _541 = fma(_525, _471, _527);
    float _543 = _465 * _531;
    float _545 = fma(_533, _539, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _547 = fma(_535, _491, _541);
    float _549 = fma(_545, _543, _547);
    float _551 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _549);
    float _553 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _553;
    bool _555 = !_425;
    float _573;
    if (!_555)
    {
        float _557 = in.m_35.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_63);
        float _579 = 1.0 / _577;
        float _581 = _97 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = as_type<float>(int(gl_VertexIndex));
    float _587 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _589 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = in.m_35.w;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _595 = _593 != 0;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _587);
    float _599 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _601 = in.m_35.z;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = in.m_35.x;
    bool _607 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    int _619 = as_type<int>(_585) & 1;
    bool _621 = _619 != 0;
    int _623 = as_type<int>(_585) & 2;
    bool _625 = _623 != 0;
    bool _627 = _591 > 0.5;
    float _629 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _631 = !_621;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = _235;
    if (!_595)
    {
        float _637 = in.m_35.y;
        _635 = _637;
    }
    float _639 = _635;
    bool _641 = _601 > 0.5;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _645;
    bool _649 = !_625;
    float _651 = _649 ? (-0.5) : 0.5;
    float _653 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _657 = _655 != 0;
    float _659 = 1.0 / _647;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _669 = _667 != 0;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _679 = -_633;
    int _681 = _641 ? as_type<int>(_679) : as_type<int>(_633);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _583 + _683;
    bool _687 = _605 > 0.5;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _691 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _603 * _689;
    float _695 = _685 * _659;
    float _697 = _647;
    if (!_595)
    {
        _697 = _639;
    }
    float _699 = _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _709;
    bool _713 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _715 = isnan(_583);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _727 = _699;
    float _729 = _639;
    if (_595)
    {
        float _731 = in.m_35.x;
        float _733 = in.m_35.y;
        _727 = _731;
        _729 = _733;
    }
    float _735 = _727;
    float _737 = _729;
    float _739 = fma(_707, _695, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _741 = fma(_711, _695, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _743 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = -_633;
    int _747 = _687 ? as_type<int>(_745) : as_type<int>(_633);
    float _749 = -_723;
    float _751 = _749 + 1.0;
    bool _753 = !_663;
    float _755 = _753 ? _633 : as_type<float>(_681);
    float _757 = _743 * _671;
    bool _759 = !_669;
    float _761 = _759 ? _633 : as_type<float>(_747);
    float _763 = _617 * _751;
    float _765 = -_617;
    float _767 = _765 + 1.0;
    float _769 = _743;
    float _771 = _751;
    if (!_595)
    {
        _769 = _601;
    }
    float _773 = _769;
    float _775 = _741 * _763;
    float _777 = _773;
    if (!_595)
    {
        _771 = _601;
    }
    float _779 = _771;
    float _781 = _725 * _763;
    float _783 = _739 * _763;
    float _785 = _693 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _693 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _789 = _693 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _677 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _779;
    if (_595)
    {
        _777 = _737;
    }
    float _797 = _777;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_595)
    {
        _795 = _737;
    }
    float _801 = _795;
    float _803 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    bool _805 = _737 > 0.5;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _787);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _815 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _807);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _819 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].x, _781);
    float _821 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].y, _783);
    float _823 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].z, _775);
    float _825 = -_651;
    int _827 = _627 ? as_type<int>(_825) : as_type<int>(_651);
    float _829 = -_817;
    float _831 = fma(_799, 2.0, _829);
    float _833 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _837 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].x, _819);
    float _839 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].y, _821);
    float _841 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].z, _823);
    bool _843 = !_657;
    float _845 = _843 ? _651 : as_type<float>(_827);
    float _847 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _851 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _853 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].z, _809);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[81].x, _831);
    float _861 = fma(_851, -2.0, _849);
    float _863 = _755 + 0.5;
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _867 = _653 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _855 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _871 = -_651;
    int _873 = _805 ? as_type<int>(_871) : as_type<int>(_651);
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _877 = fma(_853, _863, _859);
    float _879 = _865 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _867 + _869;
    float _883 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _815);
    float _885 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _813);
    float _887 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _861);
    float _889 = _835 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _891 = _845 + (-0.5);
    bool _893 = !_675;
    float _895 = _893 ? _651 : as_type<float>(_873);
    float _897 = _875 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _691 + _879;
    float _901 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _903 = -_889;
    float _905 = -_887;
    float _907 = fma(_903, _891, _905);
    float _909 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _911 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _913 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _915 = _791 + _897;
    float _917 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _901);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _909);
    float _921 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _911);
    float _923 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _913);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _917);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _919);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _939 = _761 + 0.5;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _947 = _933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _949 = _933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _947);
    float _957 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _949);
    float _959 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = -_895;
    float _963 = _961 + 0.5;
    float _965 = -_883;
    float _967 = _965 + 1.0;
    float _969 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _971 = -_885;
    float _973 = _971 + 1.0;
    float _975 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _953);
    float _981 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    float _983 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _985 = _935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _957);
    float _989 = _837 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _991 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _993 = -_967;
    float _995 = fma(_755, _993, _877);
    float _997 = _969 * _927;
    float _999 = fma(_845, _973, _907);
    float _1001 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _983 * _943;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _977);
    float _1007 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _979);
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _987);
    out.m_42.x = _997;
    out.m_42.y = _1003;
    out.m_42.z = _995;
    out.m_42.w = _999;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1011;
    out.m_44.y = _1013;
    out.m_44.z = _1001;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1007;
    out.gl_Position.z = _1009;
    out.gl_Position.w = _1015;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _575 = false;
    bool _369 = false;
    bool _259 = false;
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
        float _1072 = as_type<float>(_79);
        out.gl_Position.z = _1072;
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
        float _1141 = as_type<float>(_115);
        out.gl_Position.z = _1141;
    }
    if (_107)
    {
        return out;
    }
    float _117 = in.m_33.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = in.m_31.x;
    float _133 = in.m_31.y;
    float _135 = in.m_31.z;
    float _137 = in.m_26.x;
    float _139 = in.m_26.y;
    float _141 = in.m_26.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_129)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_129;
    float _161 = _157;
    if (!_159)
    {
        float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _165 = log2(_163);
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _169 = _167 + 1.0;
        float _171 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = _119 * _165;
        float _175 = 1.0 / _169;
        float _177 = _171 * 0.693147182464599609375;
        float _179 = exp2(_173);
        float _181 = 1.0 / _177;
        float _183 = _179 + (-1.0);
        float _185 = -_183;
        float _187 = fma(_185, _181, _119);
        float _189 = _187 * _175;
        float _191 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _191;
    }
    float _193 = _161;
    bool _195 = !_129;
    if (!_195)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = 1.0 / _203;
        float _207 = _119 * _199;
        float _209 = exp2(_207);
        float _211 = -_209;
        float _213 = _211 + 1.0;
        float _215 = _213 * _205;
        _145 = _215;
    }
    float _217 = _145;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _225 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _227 = fma(_217, _131, _221);
    float _229 = fma(_217, _133, _223);
    float _231 = fma(_217, _135, _225);
    float _233 = fma(_227, _117, _137);
    float _235 = fma(_229, _117, _139);
    float _237 = fma(_231, _117, _141);
    bool _239 = !_219;
    float _257;
    if (!_239)
    {
        float _241 = in.m_35.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_63);
        float _263 = 1.0 / _261;
        float _265 = _97 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = in.m_33.x;
    float _287 = in.m_33.y;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -_283;
    float _295 = _293 + 1.0;
    bool _297 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_267);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _291;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = _307 * _295;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = _271 * _311;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_315, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _331 * _317;
    float _335 = _329 * _317;
    float _337 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _339 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _341 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _337);
    float _343 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _339);
    float _345 = _341 * _287;
    float _347 = _343 * _285;
    bool _349 = !_309;
    float _367;
    if (!_349)
    {
        float _351 = in.m_35.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_63);
        float _373 = 1.0 / _371;
        float _375 = _97 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _381 = _377 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = isnan(_377);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _385;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_377);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _427 = 1.0 / _393;
    float _429 = _389 * _407;
    bool _431 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_377);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _411;
    float _445 = -_405;
    float _447 = _445 + 1.0;
    float _449 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _455 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _457 = isnan(_377);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _441 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _477 = 1.0 / _453;
    float _479 = -_465;
    float _481 = _479 + 1.0;
    float _483 = _423 * _469;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _485;
    float _489 = _475 * _427;
    float _491 = _405 * _481;
    float _493 = _449 * _483;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _377 + _495;
    float _499 = -_423;
    float _501 = _499 + 1.0;
    bool _503 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_377);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _443;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _377 + _521;
    float _525 = fma(_489, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _529 = -_513;
    float _531 = _529 + 1.0;
    float _533 = _519 * _477;
    float _535 = fma(_515, _523, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _539 = _377 + _537;
    float _541 = fma(_525, _471, _527);
    float _543 = _465 * _531;
    float _545 = fma(_533, _539, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _547 = fma(_535, _491, _541);
    float _549 = fma(_545, _543, _547);
    float _551 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _549);
    float _553 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _553;
    bool _555 = !_425;
    float _573;
    if (!_555)
    {
        float _557 = in.m_35.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_63);
        float _579 = 1.0 / _577;
        float _581 = _97 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = as_type<float>(int(gl_VertexIndex));
    float _587 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _589 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = in.m_35.w;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _595 = _593 != 0;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _587);
    float _599 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _601 = in.m_35.z;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = in.m_35.x;
    bool _607 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    int _619 = as_type<int>(_585) & 1;
    bool _621 = _619 != 0;
    int _623 = as_type<int>(_585) & 2;
    bool _625 = _623 != 0;
    bool _627 = _591 > 0.5;
    float _629 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _631 = !_621;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = _235;
    if (!_595)
    {
        float _637 = in.m_35.y;
        _635 = _637;
    }
    float _639 = _635;
    bool _641 = _601 > 0.5;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _645;
    bool _649 = !_625;
    float _651 = _649 ? (-0.5) : 0.5;
    float _653 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _657 = _655 != 0;
    float _659 = 1.0 / _647;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _669 = _667 != 0;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _679 = -_633;
    int _681 = _641 ? as_type<int>(_679) : as_type<int>(_633);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _583 + _683;
    bool _687 = _605 > 0.5;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _691 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _603 * _689;
    float _695 = _685 * _659;
    float _697 = _647;
    if (!_595)
    {
        _697 = _639;
    }
    float _699 = _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _709;
    bool _713 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _715 = isnan(_583);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _727 = _699;
    float _729 = _639;
    if (_595)
    {
        float _731 = in.m_35.x;
        float _733 = in.m_35.y;
        _727 = _731;
        _729 = _733;
    }
    float _735 = _727;
    float _737 = _729;
    float _739 = fma(_707, _695, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _741 = fma(_711, _695, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _743 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = -_633;
    int _747 = _687 ? as_type<int>(_745) : as_type<int>(_633);
    float _749 = -_723;
    float _751 = _749 + 1.0;
    bool _753 = !_663;
    float _755 = _753 ? _633 : as_type<float>(_681);
    float _757 = _743 * _671;
    bool _759 = !_669;
    float _761 = _759 ? _633 : as_type<float>(_747);
    float _763 = _617 * _751;
    float _765 = -_617;
    float _767 = _765 + 1.0;
    float _769 = _743;
    float _771 = _751;
    if (!_595)
    {
        _769 = _601;
    }
    float _773 = _769;
    float _775 = _741 * _763;
    float _777 = _773;
    if (!_595)
    {
        _771 = _601;
    }
    float _779 = _771;
    float _781 = _725 * _763;
    float _783 = _739 * _763;
    float _785 = _693 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _693 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _789 = _693 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _677 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _779;
    if (_595)
    {
        _777 = _737;
    }
    float _797 = _777;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_595)
    {
        _795 = _737;
    }
    float _801 = _795;
    float _803 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    bool _805 = _737 > 0.5;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _787);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _815 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _807);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _819 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].x, _781);
    float _821 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].y, _783);
    float _823 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].z, _775);
    float _825 = -_651;
    int _827 = _627 ? as_type<int>(_825) : as_type<int>(_651);
    float _829 = -_817;
    float _831 = fma(_799, 2.0, _829);
    float _833 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _837 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].x, _819);
    float _839 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].y, _821);
    float _841 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].z, _823);
    bool _843 = !_657;
    float _845 = _843 ? _651 : as_type<float>(_827);
    float _847 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _851 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _853 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].z, _809);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[81].x, _831);
    float _861 = fma(_851, -2.0, _849);
    float _863 = _755 + 0.5;
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _867 = _653 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _855 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _871 = -_651;
    int _873 = _805 ? as_type<int>(_871) : as_type<int>(_651);
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _877 = fma(_853, _863, _859);
    float _879 = _865 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _867 + _869;
    float _883 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _815);
    float _885 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _813);
    float _887 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _861);
    float _889 = _835 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _891 = _845 + (-0.5);
    bool _893 = !_675;
    float _895 = _893 ? _651 : as_type<float>(_873);
    float _897 = _875 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _691 + _879;
    float _901 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _903 = -_889;
    float _905 = -_887;
    float _907 = fma(_903, _891, _905);
    float _909 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _911 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _913 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _915 = _791 + _897;
    float _917 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _901);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _909);
    float _921 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _911);
    float _923 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _913);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _917);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _919);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _939 = _761 + 0.5;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _947 = _933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _949 = _933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _947);
    float _957 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _949);
    float _959 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = -_895;
    float _963 = _961 + 0.5;
    float _965 = -_883;
    float _967 = _965 + 1.0;
    float _969 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _971 = -_885;
    float _973 = _971 + 1.0;
    float _975 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _953);
    float _981 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    float _983 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _985 = _935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _957);
    float _989 = _837 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _991 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _993 = -_967;
    float _995 = fma(_755, _993, _877);
    float _997 = _969 * _927;
    float _999 = fma(_845, _973, _907);
    float _1001 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _983 * _943;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _977);
    float _1007 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _979);
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _987);
    out.m_42.x = _997;
    out.m_42.y = _1003;
    out.m_42.z = _995;
    out.m_42.w = _999;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1011;
    out.m_44.y = _1013;
    out.m_44.z = _1001;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1007;
    out.gl_Position.z = _1009;
    out.gl_Position.w = _1015;
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
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    bool _575 = false;
    bool _369 = false;
    bool _259 = false;
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
        float _1072 = as_type<float>(_79);
        out.gl_Position.z = _1072;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1141 = as_type<float>(_115);
        out.gl_Position.z = _1141;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_33.w;
    float _119 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _121 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _123 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = in.m_31.x;
    float _133 = in.m_31.y;
    float _135 = in.m_31.z;
    float _137 = in.m_26.x;
    float _139 = in.m_26.y;
    float _141 = in.m_26.z;
    float _143 = 0.0;
    float _145 = _119;
    if (!_129)
    {
        float _147 = _119 * _119;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = _151;
    if (!_129)
    {
        float _155 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = !_129;
    float _161 = _157;
    if (!_159)
    {
        float _163 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _165 = log2(_163);
        float _167 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _169 = _167 + 1.0;
        float _171 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = _119 * _165;
        float _175 = 1.0 / _169;
        float _177 = _171 * 0.693147182464599609375;
        float _179 = exp2(_173);
        float _181 = 1.0 / _177;
        float _183 = _179 + (-1.0);
        float _185 = -_183;
        float _187 = fma(_185, _181, _119);
        float _189 = _187 * _175;
        float _191 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _191;
    }
    float _193 = _161;
    bool _195 = !_129;
    if (!_195)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = 1.0 / _203;
        float _207 = _119 * _199;
        float _209 = exp2(_207);
        float _211 = -_209;
        float _213 = _211 + 1.0;
        float _215 = _213 * _205;
        _145 = _215;
    }
    float _217 = _145;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _225 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _227 = fma(_217, _131, _221);
    float _229 = fma(_217, _133, _223);
    float _231 = fma(_217, _135, _225);
    float _233 = fma(_227, _117, _137);
    float _235 = fma(_229, _117, _139);
    float _237 = fma(_231, _117, _141);
    bool _239 = !_219;
    float _257;
    if (!_239)
    {
        float _241 = in.m_35.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _97);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_63);
        float _263 = 1.0 / _261;
        float _265 = _97 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = in.m_33.x;
    float _287 = in.m_33.y;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = -_283;
    float _295 = _293 + 1.0;
    bool _297 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _299 = isnan(_267);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _291;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    float _317 = _307 * _295;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = _271 * _311;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    float _329 = fma(_315, _323, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_327, _323, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = _331 * _317;
    float _335 = _329 * _317;
    float _337 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _339 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _341 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].y, _337);
    float _343 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[144].x, _339);
    float _345 = _341 * _287;
    float _347 = _343 * _285;
    bool _349 = !_309;
    float _367;
    if (!_349)
    {
        float _351 = in.m_35.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        float _371 = float(_63);
        float _373 = 1.0 / _371;
        float _375 = _97 * _373;
        _367 = _375;
    }
    _369 = false;
    float _377 = _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _381 = _377 + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _397 = isnan(_377);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _385;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _413 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _415 = isnan(_377);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    bool _425 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _427 = 1.0 / _393;
    float _429 = _389 * _407;
    bool _431 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_377);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _411;
    float _445 = -_405;
    float _447 = _445 + 1.0;
    float _449 = fma(_429, _381, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _455 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _457 = isnan(_377);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _441 * _447;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _477 = 1.0 / _453;
    float _479 = -_465;
    float _481 = _479 + 1.0;
    float _483 = _423 * _469;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _485;
    float _489 = _475 * _427;
    float _491 = _405 * _481;
    float _493 = _449 * _483;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _497 = _377 + _495;
    float _499 = -_423;
    float _501 = _499 + 1.0;
    bool _503 = _377 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _505 = isnan(_377);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = _487 * _443;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _523 = _377 + _521;
    float _525 = fma(_489, _497, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _527 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[115].x, _493);
    float _529 = -_513;
    float _531 = _529 + 1.0;
    float _533 = _519 * _477;
    float _535 = fma(_515, _523, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _539 = _377 + _537;
    float _541 = fma(_525, _471, _527);
    float _543 = _465 * _531;
    float _545 = fma(_533, _539, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _547 = fma(_535, _491, _541);
    float _549 = fma(_545, _543, _547);
    float _551 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[119].x, _549);
    float _553 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _553;
    bool _555 = !_425;
    float _573;
    if (!_555)
    {
        float _557 = in.m_35.x;
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _561 = _557 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_63);
        float _579 = 1.0 / _577;
        float _581 = _97 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = as_type<float>(int(gl_VertexIndex));
    float _587 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _589 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = in.m_35.w;
    int _593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _595 = _593 != 0;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _587);
    float _599 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _601 = in.m_35.z;
    float _603 = _345 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = in.m_35.x;
    bool _607 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _609 = isnan(_583);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    int _619 = as_type<int>(_585) & 1;
    bool _621 = _619 != 0;
    int _623 = as_type<int>(_585) & 2;
    bool _625 = _623 != 0;
    bool _627 = _591 > 0.5;
    float _629 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _631 = !_621;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = _235;
    if (!_595)
    {
        float _637 = in.m_35.y;
        _635 = _637;
    }
    float _639 = _635;
    bool _641 = _601 > 0.5;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _629);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _645;
    bool _649 = !_625;
    float _651 = _649 ? (-0.5) : 0.5;
    float _653 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _597);
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _657 = _655 != 0;
    float _659 = 1.0 / _647;
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _663 = _661 != 0;
    float _665 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _669 = _667 != 0;
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _599);
    float _679 = -_633;
    int _681 = _641 ? as_type<int>(_679) : as_type<int>(_633);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _583 + _683;
    bool _687 = _605 > 0.5;
    float _689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _691 = _665 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _693 = _603 * _689;
    float _695 = _685 * _659;
    float _697 = _647;
    if (!_595)
    {
        _697 = _639;
    }
    float _699 = _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _701;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _705;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _709;
    bool _713 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _715 = isnan(_583);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_703, _695, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _727 = _699;
    float _729 = _639;
    if (_595)
    {
        float _731 = in.m_35.x;
        float _733 = in.m_35.y;
        _727 = _731;
        _729 = _733;
    }
    float _735 = _727;
    float _737 = _729;
    float _739 = fma(_707, _695, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _741 = fma(_711, _695, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _743 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = -_633;
    int _747 = _687 ? as_type<int>(_745) : as_type<int>(_633);
    float _749 = -_723;
    float _751 = _749 + 1.0;
    bool _753 = !_663;
    float _755 = _753 ? _633 : as_type<float>(_681);
    float _757 = _743 * _671;
    bool _759 = !_669;
    float _761 = _759 ? _633 : as_type<float>(_747);
    float _763 = _617 * _751;
    float _765 = -_617;
    float _767 = _765 + 1.0;
    float _769 = _743;
    float _771 = _751;
    if (!_595)
    {
        _769 = _601;
    }
    float _773 = _769;
    float _775 = _741 * _763;
    float _777 = _773;
    if (!_595)
    {
        _771 = _601;
    }
    float _779 = _771;
    float _781 = _725 * _763;
    float _783 = _739 * _763;
    float _785 = _693 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _787 = _693 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _789 = _693 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _791 = _677 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _795 = _779;
    if (_595)
    {
        _777 = _737;
    }
    float _797 = _777;
    float _799 = _735 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_595)
    {
        _795 = _737;
    }
    float _801 = _795;
    float _803 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _785);
    bool _805 = _737 > 0.5;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _809 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _787);
    float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _813 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].w, _793);
    float _815 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[83].z, _807);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _819 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].x, _781);
    float _821 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].y, _783);
    float _823 = fma(_767, (*spvDescriptorSet0.vp_c9)._m0[123].z, _775);
    float _825 = -_651;
    int _827 = _627 ? as_type<int>(_825) : as_type<int>(_651);
    float _829 = -_817;
    float _831 = fma(_799, 2.0, _829);
    float _833 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _789);
    float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _837 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].x, _819);
    float _839 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].y, _821);
    float _841 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[124].z, _823);
    bool _843 = !_657;
    float _845 = _843 ? _651 : as_type<float>(_827);
    float _847 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _851 = _797 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _853 = _811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _855 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].z, _809);
    float _857 = -_97;
    float _859 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[81].x, _831);
    float _861 = fma(_851, -2.0, _849);
    float _863 = _755 + 0.5;
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _867 = _653 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _869 = _855 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _871 = -_651;
    int _873 = _805 ? as_type<int>(_871) : as_type<int>(_651);
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].z, _833);
    float _877 = fma(_853, _863, _859);
    float _879 = _865 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _867 + _869;
    float _883 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _815);
    float _885 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _813);
    float _887 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _861);
    float _889 = _835 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _891 = _845 + (-0.5);
    bool _893 = !_675;
    float _895 = _893 ? _651 : as_type<float>(_873);
    float _897 = _875 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _899 = _691 + _879;
    float _901 = _881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _903 = -_889;
    float _905 = -_887;
    float _907 = fma(_903, _891, _905);
    float _909 = _881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _911 = _881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _913 = _881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _915 = _791 + _897;
    float _917 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _901);
    float _919 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _909);
    float _921 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _911);
    float _923 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _913);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].z, _917);
    float _927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].z, _919);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].z, _921);
    float _933 = _925 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _935 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].z, _923);
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _939 = _761 + 0.5;
    float _941 = _933 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _945 = _933 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _947 = _933 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _949 = _933 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _951 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _945);
    float _955 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _947);
    float _957 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _949);
    float _959 = _931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _961 = -_895;
    float _963 = _961 + 0.5;
    float _965 = -_883;
    float _967 = _965 + 1.0;
    float _969 = _939 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _971 = -_885;
    float _973 = _971 + 1.0;
    float _975 = _841 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _977 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _979 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[5].z, _953);
    float _981 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[6].z, _955);
    float _983 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _985 = _935 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _987 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[7].z, _957);
    float _989 = _837 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _991 = _839 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _993 = -_967;
    float _995 = fma(_755, _993, _877);
    float _997 = _969 * _927;
    float _999 = fma(_845, _973, _907);
    float _1001 = _975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _983 * _943;
    float _1005 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[4].w, _977);
    float _1007 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[5].w, _979);
    float _1009 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[6].w, _981);
    float _1011 = _989 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = fma(_985, (*spvDescriptorSet0.vp_c8)._m0[7].w, _987);
    out.m_42.x = _997;
    out.m_42.y = _1003;
    out.m_42.z = _995;
    out.m_42.w = _999;
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_44.x = _1011;
    out.m_44.y = _1013;
    out.m_44.z = _1001;
    out.gl_Position.x = _1005;
    out.gl_Position.y = _1007;
    out.gl_Position.z = _1009;
    out.gl_Position.w = _1015;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

