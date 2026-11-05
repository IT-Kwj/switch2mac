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
    float4 m_35 [[attribute(4)]];
    float4 m_33 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _621 = false;
    bool _415 = false;
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
        float _1118 = as_type<float>(_79);
        out.gl_Position.z = _1118;
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
        float _1187 = as_type<float>(_115);
        out.gl_Position.z = _1187;
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
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = _325 * _331;
    float _337 = 1.0 / _303;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _287 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = fma(_345, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_355, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _271 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_33.x;
    float _369 = in.m_33.y;
    float _371 = fma(_341, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = _371 * _335;
    float _377 = _373 * _335;
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _383 = fma(_357, _327, _379);
    float _385 = fma(_359, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _385);
    float _391 = _387 * _369;
    float _393 = _389 * _367;
    bool _395 = !_333;
    float _413;
    if (!_395)
    {
        float _397 = in.m_35.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_63);
        float _419 = 1.0 / _417;
        float _421 = _97 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _423 + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _459 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_423);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _473 = 1.0 / _439;
    float _475 = _435 * _453;
    bool _477 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = isnan(_423);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _457;
    float _491 = -_451;
    float _493 = _491 + 1.0;
    float _495 = fma(_475, _427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_423);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_487;
    float _515 = _513 + 1.0;
    float _517 = _487 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = 1.0 / _499;
    float _525 = -_511;
    float _527 = _525 + 1.0;
    float _529 = _469 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _531;
    float _535 = _521 * _473;
    float _537 = _451 * _527;
    float _539 = _495 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _423 + _541;
    float _545 = -_469;
    float _547 = _545 + 1.0;
    bool _549 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _551 = isnan(_423);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _423 + _567;
    float _571 = fma(_535, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _575 = -_559;
    float _577 = _575 + 1.0;
    float _579 = _565 * _523;
    float _581 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _585 = _423 + _583;
    float _587 = fma(_571, _517, _573);
    float _589 = _511 * _577;
    float _591 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _593 = fma(_581, _537, _587);
    float _595 = fma(_591, _589, _593);
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[119].x, _595);
    float _599 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _599;
    bool _601 = !_471;
    float _619;
    if (!_601)
    {
        float _603 = in.m_35.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_63);
        float _625 = 1.0 / _623;
        float _627 = _97 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = in.m_35.w;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _645 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _647 = in.m_35.z;
    float _649 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _651 = in.m_35.x;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _667;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _673 = as_type<int>(_631) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_631) & 2;
    bool _679 = _677 != 0;
    bool _681 = _637 > 0.5;
    float _683 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _685 = !_675;
    float _687 = _685 ? (-0.5) : 0.5;
    float _689 = _235;
    if (!_641)
    {
        float _691 = in.m_35.y;
        _689 = _691;
    }
    float _693 = _689;
    bool _695 = _647 > 0.5;
    float _697 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _683);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 1.0 / _701;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    float _719 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _723 = _721 != 0;
    float _725 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _645);
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _629 + _731;
    float _735 = -_687;
    int _737 = _695 ? as_type<int>(_735) : as_type<int>(_687);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _687);
    bool _741 = _651 > 0.5;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _745 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _747 = _649 * _743;
    float _749 = _733 * _713;
    float _751 = _701;
    if (!_641)
    {
        _751 = _693;
    }
    float _753 = _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _755;
    bool _759 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _761 = isnan(_629);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _771;
    float _775 = fma(_669, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _777 = fma(_757, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _779 = _753;
    float _781 = _693;
    if (_641)
    {
        float _783 = in.m_35.x;
        float _785 = in.m_35.y;
        _779 = _783;
        _781 = _785;
    }
    float _787 = _779;
    float _789 = _781;
    float _791 = -_769;
    float _793 = _791 + 1.0;
    float _795 = fma(_773, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _797 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _799 = -_687;
    float _801 = _741 ? _799 : _687;
    float _803 = _719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _805 = !_717;
    float _807 = _805 ? _687 : as_type<float>(_737);
    float _809 = _665 * _793;
    float _811 = _797 * _739;
    bool _813 = !_723;
    float _815 = _813 ? _687 : _801;
    float _817 = -_665;
    float _819 = _817 + 1.0;
    float _821 = _775 * _809;
    float _823 = _795 * _809;
    float _825 = _801;
    float _827 = _793;
    if (!_641)
    {
        _825 = _647;
    }
    float _829 = _825;
    float _831 = _777 * _809;
    float _833 = _829;
    if (!_641)
    {
        _827 = _647;
    }
    float _835 = _827;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _821);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _831);
    float _843 = _815 + 0.5;
    float _845 = _835;
    if (_641)
    {
        _833 = _789;
    }
    float _847 = _833;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_641)
    {
        _845 = _789;
    }
    float _851 = _845;
    bool _853 = _789 > 0.5;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _857 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _861 = -_705;
    int _863 = _853 ? as_type<int>(_861) : as_type<int>(_705);
    float _865 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[83].z, _855);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _837);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _875 = -_867;
    float _877 = fma(_857, 2.0, _875);
    float _879 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _887 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _889 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _891 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _883);
    float _893 = fma(_859, -2.0, _885);
    float _895 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _897 = _807 + 0.5;
    float _899 = -_97;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[81].x, _877);
    float _903 = -_705;
    int _905 = _681 ? as_type<int>(_903) : as_type<int>(_705);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _889);
    float _909 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _887);
    bool _913 = !_711;
    float _915 = _913 ? _705 : as_type<float>(_905);
    float _917 = _907 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = fma(_909, _897, _901);
    float _921 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _865);
    float _923 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _925 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _927 = _745 + _917;
    float _929 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _871);
    float _931 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _893);
    float _933 = _725 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _915 + (-0.5);
    float _939 = _803 + _923;
    float _941 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _945 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _947 = -_935;
    float _949 = -_931;
    float _951 = fma(_947, _937, _949);
    float _953 = _933 + _941;
    float _955 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _943);
    float _959 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _961 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _963 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].y, _869);
    float _965 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[1].z, _957);
    float _969 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].z, _839);
    float _971 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _959);
    float _973 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    bool _975 = !_729;
    float _977 = _975 ? _705 : as_type<float>(_863);
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].z, _965);
    float _981 = _967 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _987 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _989 = _979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _991 = _981 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _995 = _981 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _997 = _981 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _999 = _985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _993);
    float _1005 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _995);
    float _1007 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _997);
    float _1009 = -_977;
    float _1011 = _1009 + 0.5;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1015 = -_921;
    float _1017 = _1015 + 1.0;
    float _1019 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1003);
    float _1023 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1005);
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1007);
    float _1027 = -_929;
    float _1029 = _1027 + 1.0;
    float _1031 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1033 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1035 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1037 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = -_1017;
    float _1041 = fma(_807, _1039, _919);
    float _1043 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1013);
    float _1045 = _849 * _983;
    float _1047 = fma(_915, _1029, _951);
    float _1049 = _1031 * _671;
    float _1051 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1021);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1023);
    float _1061 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1051;
    out.m_42.y = _1053;
    out.m_42.z = _1055;
    out.m_44.x = _1045;
    out.m_44.y = _1049;
    out.m_44.z = _1041;
    out.m_44.w = _1047;
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1061;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _621 = false;
    bool _415 = false;
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
        float _1118 = as_type<float>(_79);
        out.gl_Position.z = _1118;
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
        float _1187 = as_type<float>(_115);
        out.gl_Position.z = _1187;
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
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = _325 * _331;
    float _337 = 1.0 / _303;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _287 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = fma(_345, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_355, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _271 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_33.x;
    float _369 = in.m_33.y;
    float _371 = fma(_341, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = _371 * _335;
    float _377 = _373 * _335;
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _383 = fma(_357, _327, _379);
    float _385 = fma(_359, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _385);
    float _391 = _387 * _369;
    float _393 = _389 * _367;
    bool _395 = !_333;
    float _413;
    if (!_395)
    {
        float _397 = in.m_35.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_63);
        float _419 = 1.0 / _417;
        float _421 = _97 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _423 + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _459 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_423);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _473 = 1.0 / _439;
    float _475 = _435 * _453;
    bool _477 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = isnan(_423);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _457;
    float _491 = -_451;
    float _493 = _491 + 1.0;
    float _495 = fma(_475, _427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_423);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_487;
    float _515 = _513 + 1.0;
    float _517 = _487 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = 1.0 / _499;
    float _525 = -_511;
    float _527 = _525 + 1.0;
    float _529 = _469 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _531;
    float _535 = _521 * _473;
    float _537 = _451 * _527;
    float _539 = _495 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _423 + _541;
    float _545 = -_469;
    float _547 = _545 + 1.0;
    bool _549 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _551 = isnan(_423);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _423 + _567;
    float _571 = fma(_535, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _575 = -_559;
    float _577 = _575 + 1.0;
    float _579 = _565 * _523;
    float _581 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _585 = _423 + _583;
    float _587 = fma(_571, _517, _573);
    float _589 = _511 * _577;
    float _591 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _593 = fma(_581, _537, _587);
    float _595 = fma(_591, _589, _593);
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[119].x, _595);
    float _599 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _599;
    bool _601 = !_471;
    float _619;
    if (!_601)
    {
        float _603 = in.m_35.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_63);
        float _625 = 1.0 / _623;
        float _627 = _97 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = in.m_35.w;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _645 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _647 = in.m_35.z;
    float _649 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _651 = in.m_35.x;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _667;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _673 = as_type<int>(_631) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_631) & 2;
    bool _679 = _677 != 0;
    bool _681 = _637 > 0.5;
    float _683 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _685 = !_675;
    float _687 = _685 ? (-0.5) : 0.5;
    float _689 = _235;
    if (!_641)
    {
        float _691 = in.m_35.y;
        _689 = _691;
    }
    float _693 = _689;
    bool _695 = _647 > 0.5;
    float _697 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _683);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 1.0 / _701;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    float _719 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _723 = _721 != 0;
    float _725 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _645);
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _629 + _731;
    float _735 = -_687;
    int _737 = _695 ? as_type<int>(_735) : as_type<int>(_687);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _687);
    bool _741 = _651 > 0.5;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _745 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _747 = _649 * _743;
    float _749 = _733 * _713;
    float _751 = _701;
    if (!_641)
    {
        _751 = _693;
    }
    float _753 = _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _755;
    bool _759 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _761 = isnan(_629);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _771;
    float _775 = fma(_669, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _777 = fma(_757, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _779 = _753;
    float _781 = _693;
    if (_641)
    {
        float _783 = in.m_35.x;
        float _785 = in.m_35.y;
        _779 = _783;
        _781 = _785;
    }
    float _787 = _779;
    float _789 = _781;
    float _791 = -_769;
    float _793 = _791 + 1.0;
    float _795 = fma(_773, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _797 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _799 = -_687;
    float _801 = _741 ? _799 : _687;
    float _803 = _719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _805 = !_717;
    float _807 = _805 ? _687 : as_type<float>(_737);
    float _809 = _665 * _793;
    float _811 = _797 * _739;
    bool _813 = !_723;
    float _815 = _813 ? _687 : _801;
    float _817 = -_665;
    float _819 = _817 + 1.0;
    float _821 = _775 * _809;
    float _823 = _795 * _809;
    float _825 = _801;
    float _827 = _793;
    if (!_641)
    {
        _825 = _647;
    }
    float _829 = _825;
    float _831 = _777 * _809;
    float _833 = _829;
    if (!_641)
    {
        _827 = _647;
    }
    float _835 = _827;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _821);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _831);
    float _843 = _815 + 0.5;
    float _845 = _835;
    if (_641)
    {
        _833 = _789;
    }
    float _847 = _833;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_641)
    {
        _845 = _789;
    }
    float _851 = _845;
    bool _853 = _789 > 0.5;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _857 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _861 = -_705;
    int _863 = _853 ? as_type<int>(_861) : as_type<int>(_705);
    float _865 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[83].z, _855);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _837);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _875 = -_867;
    float _877 = fma(_857, 2.0, _875);
    float _879 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _887 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _889 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _891 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _883);
    float _893 = fma(_859, -2.0, _885);
    float _895 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _897 = _807 + 0.5;
    float _899 = -_97;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[81].x, _877);
    float _903 = -_705;
    int _905 = _681 ? as_type<int>(_903) : as_type<int>(_705);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _889);
    float _909 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _887);
    bool _913 = !_711;
    float _915 = _913 ? _705 : as_type<float>(_905);
    float _917 = _907 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = fma(_909, _897, _901);
    float _921 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _865);
    float _923 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _925 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _927 = _745 + _917;
    float _929 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _871);
    float _931 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _893);
    float _933 = _725 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _915 + (-0.5);
    float _939 = _803 + _923;
    float _941 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _945 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _947 = -_935;
    float _949 = -_931;
    float _951 = fma(_947, _937, _949);
    float _953 = _933 + _941;
    float _955 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _943);
    float _959 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _961 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _963 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].y, _869);
    float _965 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[1].z, _957);
    float _969 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].z, _839);
    float _971 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _959);
    float _973 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    bool _975 = !_729;
    float _977 = _975 ? _705 : as_type<float>(_863);
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].z, _965);
    float _981 = _967 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _987 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _989 = _979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _991 = _981 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _995 = _981 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _997 = _981 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _999 = _985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _993);
    float _1005 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _995);
    float _1007 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _997);
    float _1009 = -_977;
    float _1011 = _1009 + 0.5;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1015 = -_921;
    float _1017 = _1015 + 1.0;
    float _1019 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1003);
    float _1023 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1005);
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1007);
    float _1027 = -_929;
    float _1029 = _1027 + 1.0;
    float _1031 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1033 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1035 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1037 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = -_1017;
    float _1041 = fma(_807, _1039, _919);
    float _1043 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1013);
    float _1045 = _849 * _983;
    float _1047 = fma(_915, _1029, _951);
    float _1049 = _1031 * _671;
    float _1051 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1021);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1023);
    float _1061 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1051;
    out.m_42.y = _1053;
    out.m_42.z = _1055;
    out.m_44.x = _1045;
    out.m_44.y = _1049;
    out.m_44.z = _1041;
    out.m_44.w = _1047;
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1061;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_29 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _621 = false;
    bool _415 = false;
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
        float _1118 = as_type<float>(_79);
        out.gl_Position.z = _1118;
    }
    if (!_67)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1187 = as_type<float>(_115);
        out.gl_Position.z = _1187;
    }
    if (_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _273 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_267);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _267 + _285;
    bool _289 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_267);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _309 = -_283;
    float _311 = _309 + 1.0;
    float _313 = 1.0 / _307;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _299 * _311;
    float _329 = -_299;
    float _331 = _329 + 1.0;
    bool _333 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _335 = _325 * _331;
    float _337 = 1.0 / _303;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _287 * _313;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = fma(_345, _351, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_355, _351, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = _271 * _337;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _363;
    float _367 = in.m_33.x;
    float _369 = in.m_33.y;
    float _371 = fma(_341, _361, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _373 = fma(_365, _361, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _375 = _371 * _335;
    float _377 = _373 * _335;
    float _379 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _375);
    float _381 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _383 = fma(_357, _327, _379);
    float _385 = fma(_359, _327, _381);
    float _387 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].y, _383);
    float _389 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[145].x, _385);
    float _391 = _387 * _369;
    float _393 = _389 * _367;
    bool _395 = !_333;
    float _413;
    if (!_395)
    {
        float _397 = in.m_35.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _97);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_63);
        float _419 = 1.0 / _417;
        float _421 = _97 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _427 = _423 + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _459 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _461 = isnan(_423);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _473 = 1.0 / _439;
    float _475 = _435 * _453;
    bool _477 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _479 = isnan(_423);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = 1.0 / _457;
    float _491 = -_451;
    float _493 = _491 + 1.0;
    float _495 = fma(_475, _427, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _501 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _503 = isnan(_423);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_487;
    float _515 = _513 + 1.0;
    float _517 = _487 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = 1.0 / _499;
    float _525 = -_511;
    float _527 = _525 + 1.0;
    float _529 = _469 * _515;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _531;
    float _535 = _521 * _473;
    float _537 = _451 * _527;
    float _539 = _495 * _529;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _423 + _541;
    float _545 = -_469;
    float _547 = _545 + 1.0;
    bool _549 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _551 = isnan(_423);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _569 = _423 + _567;
    float _571 = fma(_535, _543, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _573 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[115].x, _539);
    float _575 = -_559;
    float _577 = _575 + 1.0;
    float _579 = _565 * _523;
    float _581 = fma(_561, _569, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _585 = _423 + _583;
    float _587 = fma(_571, _517, _573);
    float _589 = _511 * _577;
    float _591 = fma(_579, _585, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _593 = fma(_581, _537, _587);
    float _595 = fma(_591, _589, _593);
    float _597 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[119].x, _595);
    float _599 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_37.w = _599;
    bool _601 = !_471;
    float _619;
    if (!_601)
    {
        float _603 = in.m_35.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].z, _97);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_63);
        float _625 = 1.0 / _623;
        float _627 = _97 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = as_type<float>(int(gl_VertexIndex));
    float _633 = _235 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = _235 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _637 = in.m_35.w;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _641 = _639 != 0;
    float _643 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _645 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[6].x, _635);
    float _647 = in.m_35.z;
    float _649 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _651 = in.m_35.x;
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _667;
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _673 = as_type<int>(_631) & 1;
    bool _675 = _673 != 0;
    int _677 = as_type<int>(_631) & 2;
    bool _679 = _677 != 0;
    bool _681 = _637 > 0.5;
    float _683 = _235 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _685 = !_675;
    float _687 = _685 ? (-0.5) : 0.5;
    float _689 = _235;
    if (!_641)
    {
        float _691 = in.m_35.y;
        _689 = _691;
    }
    float _693 = _689;
    bool _695 = _647 > 0.5;
    float _697 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[4].x, _683);
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _699;
    bool _703 = !_679;
    float _705 = _703 ? (-0.5) : 0.5;
    float _707 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[5].z, _643);
    int _709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _711 = _709 != 0;
    float _713 = 1.0 / _701;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _717 = _715 != 0;
    float _719 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[4].z, _697);
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _723 = _721 != 0;
    float _725 = fma(_237, (*spvDescriptorSet0.vp_c10)._m0[6].z, _645);
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _629 + _731;
    float _735 = -_687;
    int _737 = _695 ? as_type<int>(_735) : as_type<int>(_687);
    float _739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _687);
    bool _741 = _651 > 0.5;
    float _743 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _705);
    float _745 = _707 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _747 = _649 * _743;
    float _749 = _733 * _713;
    float _751 = _701;
    if (!_641)
    {
        _751 = _693;
    }
    float _753 = _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _755;
    bool _759 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _761 = isnan(_629);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _771;
    float _775 = fma(_669, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _777 = fma(_757, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _779 = _753;
    float _781 = _693;
    if (_641)
    {
        float _783 = in.m_35.x;
        float _785 = in.m_35.y;
        _779 = _783;
        _781 = _785;
    }
    float _787 = _779;
    float _789 = _781;
    float _791 = -_769;
    float _793 = _791 + 1.0;
    float _795 = fma(_773, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _797 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _799 = -_687;
    float _801 = _741 ? _799 : _687;
    float _803 = _719 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _805 = !_717;
    float _807 = _805 ? _687 : as_type<float>(_737);
    float _809 = _665 * _793;
    float _811 = _797 * _739;
    bool _813 = !_723;
    float _815 = _813 ? _687 : _801;
    float _817 = -_665;
    float _819 = _817 + 1.0;
    float _821 = _775 * _809;
    float _823 = _795 * _809;
    float _825 = _801;
    float _827 = _793;
    if (!_641)
    {
        _825 = _647;
    }
    float _829 = _825;
    float _831 = _777 * _809;
    float _833 = _829;
    if (!_641)
    {
        _827 = _647;
    }
    float _835 = _827;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _839 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _821);
    float _841 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _831);
    float _843 = _815 + 0.5;
    float _845 = _835;
    if (_641)
    {
        _833 = _789;
    }
    float _847 = _833;
    float _849 = _843 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_641)
    {
        _845 = _789;
    }
    float _851 = _845;
    bool _853 = _789 > 0.5;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _857 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _859 = _847 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _861 = -_705;
    int _863 = _853 ? as_type<int>(_861) : as_type<int>(_705);
    float _865 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[83].z, _855);
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _869 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _823);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[83].w, _837);
    float _873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _875 = -_867;
    float _877 = fma(_857, 2.0, _875);
    float _879 = _747 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _747 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _883 = _747 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _887 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _889 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _881);
    float _891 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _883);
    float _893 = fma(_859, -2.0, _885);
    float _895 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _897 = _807 + 0.5;
    float _899 = -_97;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c9)._m0[81].x, _877);
    float _903 = -_705;
    int _905 = _681 ? as_type<int>(_903) : as_type<int>(_705);
    float _907 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[25].z, _889);
    float _909 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _911 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[24].z, _887);
    bool _913 = !_711;
    float _915 = _913 ? _705 : as_type<float>(_905);
    float _917 = _907 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _919 = fma(_909, _897, _901);
    float _921 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].z, _865);
    float _923 = _911 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _925 = fma(_895, (*spvDescriptorSet0.vp_c8)._m0[26].z, _891);
    float _927 = _745 + _917;
    float _929 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[82].w, _871);
    float _931 = fma(_97, (*spvDescriptorSet0.vp_c9)._m0[81].y, _893);
    float _933 = _725 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _935 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _937 = _915 + (-0.5);
    float _939 = _803 + _923;
    float _941 = _925 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _943 = _927 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _945 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _947 = -_935;
    float _949 = -_931;
    float _951 = fma(_947, _937, _949);
    float _953 = _933 + _941;
    float _955 = _927 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _957 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[1].x, _943);
    float _959 = _927 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _961 = _927 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _963 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].y, _869);
    float _965 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[0].x, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[1].z, _957);
    float _969 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[124].z, _839);
    float _971 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[2].x, _959);
    float _973 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    bool _975 = !_729;
    float _977 = _975 ? _705 : as_type<float>(_863);
    float _979 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[0].z, _965);
    float _981 = _967 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _985 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _987 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _989 = _979 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _991 = _981 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _993 = _981 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _995 = _981 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _997 = _981 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _999 = _985 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1001 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[5].x, _991);
    float _1003 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[4].x, _993);
    float _1005 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[6].x, _995);
    float _1007 = fma(_989, (*spvDescriptorSet0.vp_c8)._m0[7].x, _997);
    float _1009 = -_977;
    float _1011 = _1009 + 0.5;
    float _1013 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1001);
    float _1015 = -_921;
    float _1017 = _1015 + 1.0;
    float _1019 = _987 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1021 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1003);
    float _1023 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1005);
    float _1025 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1007);
    float _1027 = -_929;
    float _1029 = _1027 + 1.0;
    float _1031 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1033 = _945 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1035 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1037 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = -_1017;
    float _1041 = fma(_807, _1039, _919);
    float _1043 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1013);
    float _1045 = _849 * _983;
    float _1047 = fma(_915, _1029, _951);
    float _1049 = _1031 * _671;
    float _1051 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1055 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1057 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1021);
    float _1059 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1023);
    float _1061 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1025);
    out.m_29.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_42.x = _1051;
    out.m_42.y = _1053;
    out.m_42.z = _1055;
    out.m_44.x = _1045;
    out.m_44.y = _1049;
    out.m_44.z = _1041;
    out.m_44.w = _1047;
    out.gl_Position.x = _1057;
    out.gl_Position.y = _1043;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1061;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_29.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_29.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_29.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_29.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

